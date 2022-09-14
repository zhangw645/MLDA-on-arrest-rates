use "NHIS Data.dta", clear
gen age = 21 + days_21/365

gen age_40day = 21 + 40*floor(days_21/40)/365 + 20/365

gen agec=age-21
gen agec_sq=agec^2
gen agec_cu = agec^3
gen agec_fr = agec^4
gen post1 = 1 if agec >=0
replace post1 = 0 if agec<0
gen agec_post = agec*post1
gen agec_sq_post = agec_sq*post1 
gen agec_cu_post = agec_cu*post1

reg hs_diploma post1 agec agec_post if age >= 18 & age <=24
outreg2 using "regressionquestion1.doc", replace label bdec(3)
reg hispanic post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion1.doc", append label bdec(3)
reg white post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion1.doc", append label bdec(3)
reg black post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion1.doc", append label bdec(3)
reg uninsured post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion1.doc", append label bdec(3)
reg working_lw post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion1.doc", append label bdec(3)
reg going_school post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion1.doc", append label bdec(3)
reg male post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion1.doc", append label bdec(3)


use "Arrest.dta", clear
gen age = 21 + days_to_21/365

gen age_40day = 21 + 40*floor(days_to_21/40)/365 + 20/365

gen agec=age-21
gen agec_sq=agec^2
gen agec_cu = agec^3
gen agec_fr = agec^4
gen post1 = 1 if agec >=0
replace post1 = 0 if agec<0
gen agec_post = agec*post1
gen agec_sq_post = agec_sq*post1 
gen agec_cu_post = agec_cu*post1


preserve 
collapse (mean) age agec agec_sq agec_sq_post all, by (age_40day)
reg all age_40day agec_sq if age >= 18 & age < 21
predict fitted_left_sq if age >=18 & age < 21
reg all age_40day agec_sq if age >= 21 & age < 24
predict fitted_right_sq if age >= 21 & age < 24
#delimit ;
graph twoway (scatter all age_40day)
    (line fitted_left_sq age_40day, lcolor(red))
    (line fitted_right_sq age_40day, lcolor(red))

    if age >=18 & age <=24,
    title(all causes of arrests by age profile)
    xtitle(Age)
    ytitle(all causes of arrests)
    legend(off)
    scheme(s1mono)
    ;
#delimit cr
graph export "allarrests_scatterplot.pdf", replace
restore

 
preserve 
collapse (mean) age agec agec_sq agec_sq_post dui, by (age_40day)
reg dui age_40day agec_sq if age >= 18 & age < 21
predict fitted_left_sq if age >=18 & age < 21
reg dui age_40day agec_sq if age >= 21 & age < 24
predict fitted_right_sq if age >= 21 & age < 24
#delimit ;
graph twoway (scatter dui age_40day)
    (line fitted_left_sq age_40day, lcolor(red))
    (line fitted_right_sq age_40day, lcolor(red))

    if age >=18 & age <=24,
    title(dui by age profile)
    xtitle(Age)
    ytitle(dui)
    legend(off)
    scheme(s1mono)
    ;
#delimit cr
graph export "dui_scatterplot.pdf", replace
restore

preserve 
collapse (mean) age agec agec_sq agec_sq_post liquor_laws, by (age_40day)
reg liquor_laws age_40day agec_sq if age >= 18 & age < 21
predict fitted_left_sq if age >=18 & age < 21
reg liquor_laws age_40day agec_sq if age >= 21 & age < 24
predict fitted_right_sq if age >= 21 & age < 24
#delimit ;
graph twoway (scatter liquor_laws age_40day)
    (line fitted_left_sq age_40day, lcolor(red))
    (line fitted_right_sq age_40day, lcolor(red))

    if age >=18 & age <=24,
    title(liquor_laws by age profile)
    xtitle(Age)
    ytitle(liquor_laws)
    legend(off)
    scheme(s1mono)
    ;
#delimit cr
graph export "liquor_laws_scatterplot.pdf", replace
restore

preserve 
collapse (mean) age agec agec_sq agec_sq_post robbery, by (age_40day)
reg robbery age_40day agec_sq if age >= 18 & age < 21
predict fitted_left_sq if age >=18 & age < 21
reg robbery age_40day agec_sq if age >= 21 & age < 24
predict fitted_right_sq if age >= 21 & age < 24
#delimit ;
graph twoway (scatter robbery age_40day)
    (line fitted_left_sq age_40day, lcolor(red))
    (line fitted_right_sq age_40day, lcolor(red))

    if age >=18 & age <=24,
    title(robbery by age profile)
    xtitle(Age)
    ytitle(robbery)
    legend(off)
    scheme(s1mono)
    ;
#delimit cr
graph export "robbery_scatterplot.pdf", replace
restore

preserve 
collapse (mean) age agec agec_sq agec_sq_post aggravated_assault, by (age_40day)
reg aggravated_assault age_40day agec_sq if age >= 18 & age < 21
predict fitted_left_sq if age >=18 & age < 21
reg aggravated_assault age_40day agec_sq if age >= 21 & age < 24
predict fitted_right_sq if age >= 21 & age < 24
#delimit ;
graph twoway (scatter aggravated_assault age_40day)
    (line fitted_left_sq age_40day, lcolor(red))
    (line fitted_right_sq age_40day, lcolor(red))

    if age >=18 & age <=24,
    title(aggravated_assault by age profile)
    xtitle(Age)
    ytitle(aggravated_assault)
    legend(off)
    scheme(s1mono)
    ;
#delimit cr
graph export "aggravated_assault_scatterplot.pdf", replace
restore

preserve 
collapse (mean) age agec agec_sq agec_sq_post ot_assault, by (age_40day)
reg ot_assault age_40day agec_sq if age >= 18 & age < 21
predict fitted_left_sq if age >=18 & age < 21
reg ot_assault age_40day agec_sq if age >= 21 & age < 24
predict fitted_right_sq if age >= 21 & age < 24
#delimit ;
graph twoway (scatter ot_assault age_40day)
    (line fitted_left_sq age_40day, lcolor(red))
    (line fitted_right_sq age_40day, lcolor(red))

    if age >=18 & age <=24,
    title(ot_assault by age profile)
    xtitle(Age)
    ytitle(ot_assault)
    legend(off)
    scheme(s1mono)
    ;
#delimit cr
graph export "ot_assault_scatterplot.pdf", replace
restore


preserve 
collapse (mean) age agec agec_sq agec_sq_post drunk_risk, by (age_40day)
reg drunk_risk age_40day agec_sq if age >= 18 & age < 21
predict fitted_left_sq if age >=18 & age < 21
reg drunk_risk age_40day agec_sq if age >= 21 & age < 24
predict fitted_right_sq if age >= 21 & age < 24
#delimit ;
graph twoway (scatter drunk_risk age_40day)
    (line fitted_left_sq age_40day, lcolor(red))
    (line fitted_right_sq age_40day, lcolor(red))

    if age >=18 & age <=24,
    title(drunk_risk by age profile)
    xtitle(Age)
    ytitle(drunk_risk)
    legend(off)
    scheme(s1mono)
    ;
#delimit cr
graph export "drunk_risk_scatterplot.pdf", replace
restore

preserve 
collapse (mean) age agec agec_sq agec_sq_post combined_oth, by (age_40day)
reg combined_oth age_40day agec_sq if age >= 18 & age < 21
predict fitted_left_sq if age >=18 & age < 21
reg combined_oth age_40day agec_sq if age >= 21 & age < 24
predict fitted_right_sq if age >= 21 & age < 24
#delimit ;
graph twoway (scatter combined_oth age_40day)
    (line fitted_left_sq age_40day, lcolor(red))
    (line fitted_right_sq age_40day, lcolor(red))

    if age >=18 & age <=24,
    title(combined_oth by age profile)
    xtitle(Age)
    ytitle(combined_oth)
    legend(off)
    scheme(s1mono)
    ;
#delimit cr
graph export "combined_oth_scatterplot.pdf", replace
restore

reg all post1 agec agec_post if age >= 18 & age <=24
outreg2 using "regressionquestion4.doc", replace label bdec(3)
reg dui post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion4.doc", append label bdec(3)
reg liquor_laws post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion4.doc", append label bdec(3)
reg robbery post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion4.doc", append label bdec(3)
reg aggravated_assault post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion4.doc", append label bdec(3)
reg ot_assault post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion4.doc", append label bdec(3)
reg drunk_risk post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion4.doc", append label bdec(3)
reg combined_oth post1 agec agec_post if age >= 18 & age <= 24
outreg2 using "regressionquestion4.doc", append label bdec(3)

use "NHIS Data.dta", clear

gen age = 21 + days_21/365

gen age_40day = 21 + 40*floor(days_21/40)/365 + 20/365

gen agec=age-21
gen agec_sq=agec^2
gen agec_cu = agec^3
gen agec_fr = agec^4
gen post1 = 1 if agec >=0
replace post1 = 0 if agec<0
gen agec_post = agec*post1
gen agec_sq_post = agec_sq*post1 
gen agec_cu_post = agec_cu*post1
reg drinks_alcohol post1 agec agec_post if age >= 19 & age <= 23

local phi = _b[post1]
local se_phi = _se[post1]

use "Arrest.dta", clear
gen age = 21 + days_to_21/365

gen age_40day = 21 + 40*floor(days_to_21/40)/365 + 20/365

gen agec=age-21
gen agec_sq=agec^2
gen agec_cu = agec^3
gen agec_fr = agec^4
gen post1 = 1 if agec >=0
replace post1 = 0 if agec<0
gen agec_post = agec*post1
gen agec_sq_post = agec_sq*post1 
gen agec_cu_post = agec_cu*post1

reg all agec post1 agec_post if age >= 19 & age <= 23

local rho = _b[post1]
local se_rho = _se[post1]


local rho_sq = (`rho')^2
local phi_4 = (`phi')^4
local var_phi = (`se_phi')^2
local var_rho = (`se_rho')^2
local phi_sq = (`phi')^2

local iv_var = ((`rho_sq'/`phi_4')*`var_phi')+((1/`phi_sq')*`var_rho')
local iv_se = sqrt(`iv_var')
local iv_coef = `rho'/`phi'
disp `iv_coef'
disp `iv_se'


reg dui agec post1 agec_post if age >= 19 & age <= 23

local rho = _b[post1]
local se_rho = _se[post1]


local rho_sq = (`rho')^2
local phi_4 = (`phi')^4
local var_phi = (`se_phi')^2
local var_rho = (`se_rho')^2
local phi_sq = (`phi')^2

local iv_var = ((`rho_sq'/`phi_4')*`var_phi')+((1/`phi_sq')*`var_rho')
local iv_se = sqrt(`iv_var')
local iv_coef = `rho'/`phi'
disp `iv_coef'
disp `iv_se'

reg liquor_laws agec post1 agec_post if age >= 19 & age <= 23

local rho = _b[post1]
local se_rho = _se[post1]


local rho_sq = (`rho')^2
local phi_4 = (`phi')^4
local var_phi = (`se_phi')^2
local var_rho = (`se_rho')^2
local phi_sq = (`phi')^2

local iv_var = ((`rho_sq'/`phi_4')*`var_phi')+((1/`phi_sq')*`var_rho')
local iv_se = sqrt(`iv_var')
local iv_coef = `rho'/`phi'
disp `iv_coef'
disp `iv_se'

reg robbery agec post1 agec_post if age >= 19 & age <= 23

local rho = _b[post1]
local se_rho = _se[post1]


local rho_sq = (`rho')^2
local phi_4 = (`phi')^4
local var_phi = (`se_phi')^2
local var_rho = (`se_rho')^2
local phi_sq = (`phi')^2

local iv_var = ((`rho_sq'/`phi_4')*`var_phi')+((1/`phi_sq')*`var_rho')
local iv_se = sqrt(`iv_var')
local iv_coef = `rho'/`phi'
disp `iv_coef'
disp `iv_se'

reg aggravated_assault agec post1 agec_post if age >= 19 & age <= 23

local rho = _b[post1]
local se_rho = _se[post1]


local rho_sq = (`rho')^2
local phi_4 = (`phi')^4
local var_phi = (`se_phi')^2
local var_rho = (`se_rho')^2
local phi_sq = (`phi')^2

local iv_var = ((`rho_sq'/`phi_4')*`var_phi')+((1/`phi_sq')*`var_rho')
local iv_se = sqrt(`iv_var')
local iv_coef = `rho'/`phi'
disp `iv_coef'
disp `iv_se'


reg ot_assault agec post1 agec_post if age >= 19 & age <= 23

local rho = _b[post1]
local se_rho = _se[post1]


local rho_sq = (`rho')^2
local phi_4 = (`phi')^4
local var_phi = (`se_phi')^2
local var_rho = (`se_rho')^2
local phi_sq = (`phi')^2

local iv_var = ((`rho_sq'/`phi_4')*`var_phi')+((1/`phi_sq')*`var_rho')
local iv_se = sqrt(`iv_var')
local iv_coef = `rho'/`phi'
disp `iv_coef'
disp `iv_se'

reg drunk_risk agec post1 agec_post if age >= 19 & age <= 23

local rho = _b[post1]
local se_rho = _se[post1]


local rho_sq = (`rho')^2
local phi_4 = (`phi')^4
local var_phi = (`se_phi')^2
local var_rho = (`se_rho')^2
local phi_sq = (`phi')^2

local iv_var = ((`rho_sq'/`phi_4')*`var_phi')+((1/`phi_sq')*`var_rho')
local iv_se = sqrt(`iv_var')
local iv_coef = `rho'/`phi'
disp `iv_coef'
disp `iv_se'

reg combined_oth agec post1 agec_post if age >= 19 & age <= 23

local rho = _b[post1]
local se_rho = _se[post1]


local rho_sq = (`rho')^2
local phi_4 = (`phi')^4
local var_phi = (`se_phi')^2
local var_rho = (`se_rho')^2
local phi_sq = (`phi')^2

local iv_var = ((`rho_sq'/`phi_4')*`var_phi')+((1/`phi_sq')*`var_rho')
local iv_se = sqrt(`iv_var')
local iv_coef = `rho'/`phi'
disp `iv_coef'
disp `iv_se'
