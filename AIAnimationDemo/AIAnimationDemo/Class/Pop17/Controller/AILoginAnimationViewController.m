//
//  AILoginAnimationViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/22.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AILoginAnimationViewController.h"
#import "UIView+SetRect.h"

@interface AILoginAnimationViewController ()

/**
 背景图片
 */
@property(nonatomic,weak)UIImageView *bgImageView;
/** 头label*/
@property(nonatomic,weak)UILabel     *headingLabel;
/** 用户名*/
@property(nonatomic,weak)UITextField *userNameTextField;
/** 密码*/
@property(nonatomic,weak)UITextField *passWordTextField;
/** 登录按钮*/
@property(nonatomic,weak)UIButton    *loginBtn;

/** 云1*/
@property(nonatomic,weak)UIImageView *cloud1ImageV;
/** 云2*/
@property(nonatomic,weak)UIImageView *cloud2ImageV;
/** 云3*/
@property(nonatomic,weak)UIImageView *cloud3ImageV;
/** 云4*/
@property(nonatomic,weak)UIImageView *cloud4ImageV;

/** 菊花*/
@property(nonatomic,weak)UIActivityIndicatorView *spinner;
@end

@implementation AILoginAnimationViewController


#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
    self.headingLabel.centerX       -= MainSize.width;
    self.userNameTextField.centerX  -= MainSize.width;
    self.passWordTextField.centerX  -= MainSize.width;
    //cloud
    self.cloud1ImageV.alpha          = 0.;
    self.cloud2ImageV.alpha          = 0.;
    self.cloud3ImageV.alpha          = 0.;
    self.cloud4ImageV.alpha          = 0.;
    //loginBtn
    self.loginBtn.centerY           += 30;
    self.loginBtn.alpha              = 0;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:.5 animations:^{
        self.headingLabel.centerX   += MainSize.width;
    }];
    [UIView animateWithDuration:.5 delay:.3 options:(UIViewAnimationOptionCurveLinear) animations:^{
        self.userNameTextField.centerX   += MainSize.width;
    } completion:nil];
    [UIView animateWithDuration:.5 delay:.4 options:(UIViewAnimationOptionCurveLinear) animations:^{
        self.passWordTextField.centerX   += MainSize.width;
    } completion:nil];
    //cloud
    [UIView animateWithDuration:.5 delay:.5 options:(UIViewAnimationOptionCurveLinear) animations:^{
        self.cloud1ImageV.alpha = 1.;
    } completion:nil];
    [UIView animateWithDuration:.5 delay:.7 options:(UIViewAnimationOptionCurveLinear) animations:^{
        self.cloud2ImageV.alpha = 1.;
    } completion:nil];
    [UIView animateWithDuration:.5 delay:.9 options:(UIViewAnimationOptionCurveLinear) animations:^{
        self.cloud3ImageV.alpha = 1.;
    } completion:nil];
    [UIView animateWithDuration:.5 delay:1.1 options:(UIViewAnimationOptionCurveLinear) animations:^{
        self.cloud4ImageV.alpha = 1.;
    } completion:nil];
    //loginBtn
    [UIView animateWithDuration:.5 delay:.5 usingSpringWithDamping:.5 initialSpringVelocity:0 options:(UIViewAnimationOptionCurveLinear) animations:^{
        self.loginBtn.centerY  -= 30;
        self.loginBtn.alpha     = 1.;
    } completion:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark --UI
- (void)setUpUI{
    UIImageView *bgImageView       = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-sunny"]];
    self.bgImageView               = bgImageView;
    self.bgImageView.frame         = self.view.bounds;
    [self.view addSubview:bgImageView];
    
    UIImageView *cloud1ImageV      = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-sunny-cloud-1"]];
    self.cloud1ImageV              = cloud1ImageV;
    self.cloud1ImageV.frame        = CGRectMake(-120, 131, 159, 50);
    [self.view addSubview:cloud1ImageV];
    
    UIImageView *cloud2ImageV      = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-sunny-cloud-2"]];
    self.cloud2ImageV              = cloud2ImageV;
    self.cloud2ImageV.frame        = CGRectMake(217, 155, 158, 49);
    [self.view addSubview:cloud2ImageV];
    
    UIImageView *cloud3ImageV      = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-sunny-cloud-3"]];
    self.cloud3ImageV              = cloud3ImageV;
    self.cloud3ImageV.frame        = CGRectMake(252, 369, 74, 35);
    [self.view addSubview:cloud3ImageV];
    
    UIImageView *cloud4ImageV      = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-sunny-cloud-4"]];
    self.cloud4ImageV              = cloud4ImageV;
    self.cloud4ImageV.frame        = CGRectMake(20, 397.5, 115, 50);
    [self.view addSubview:cloud4ImageV];
    
    //前景
    UILabel *headingLabel          = [[UILabel alloc]init];
    headingLabel.text              = @"Bahama Login";
    headingLabel.textColor         = [UIColor whiteColor];
    headingLabel.font              = [UIFont fontWithName:@"Helvetica Neue" size:30.0];
    headingLabel.textAlignment     = NSTextAlignmentCenter;
    headingLabel.frame             = CGRectMake(80.5, 87.5, 214.5, 34);
    headingLabel.centerX           = self.view.centerX;
    [self.view addSubview:headingLabel];
    self.headingLabel              = headingLabel;
    
    UITextField *userNameTextField = [[UITextField alloc]init];
    userNameTextField.layer.cornerRadius = 8;
    userNameTextField.backgroundColor    = [UIColor whiteColor];
    userNameTextField.frame        = CGRectMake(0, 149, 280, 30);
    userNameTextField.centerX      = self.view.centerX;
    userNameTextField.placeholder  = @"Username";
    [self.view addSubview:userNameTextField];
    self.userNameTextField         = userNameTextField;
    
    UITextField *passWordTextField = [[UITextField alloc]init];
    passWordTextField.layer.cornerRadius = 8;
    passWordTextField.backgroundColor    = [UIColor whiteColor];
    passWordTextField.frame        = CGRectMake(0, 194, 280, 30);
    passWordTextField.centerX      = self.view.centerX;
    passWordTextField.placeholder  = @"passWord";
    [self.view addSubview:passWordTextField];
    self.passWordTextField         = passWordTextField;
    
    UIButton *loginBtn             = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.loginBtn                  = loginBtn;
    loginBtn.layer.cornerRadius    = 8;
    loginBtn.backgroundColor       = [UIColor colorWithRed:161/255. green:212/255. blue:98/255. alpha:1.];
    [loginBtn setTitle:@"Log In" forState:(UIControlStateNormal)];
    loginBtn.frame                 = CGRectMake(0, 250, 234, 52);
    loginBtn.centerX               = self.view.centerX;
    [loginBtn addTarget:self action:@selector(onClickLogin:)forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:loginBtn];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhiteLarge)];
    self.spinner                     = spinner;
    spinner.alpha                    = 0.;
    [spinner startAnimating];
    spinner.frame                    = CGRectMake(-20, 6, 20, 20);
    [self.loginBtn addSubview:spinner];

}

#pragma mark --Action
- (void)onClickLogin:(UIButton*)loginBtn {
    [UIView animateWithDuration:1.5 delay:0. usingSpringWithDamping:.2 initialSpringVelocity:0. options:(UIViewAnimationOptionCurveLinear) animations:^{
        CGRect loginBounds                = self.loginBtn.bounds;
        loginBounds.size.width           += 80;
        self.loginBtn.bounds              = loginBounds;
    } completion:nil];
    
    [UIView animateWithDuration:.33 delay:0 usingSpringWithDamping:.7 initialSpringVelocity:0 options:(UIViewAnimationOptionCurveLinear) animations:^{
        self.loginBtn.centerY         += 60;
        self.loginBtn.backgroundColor  = [UIColor colorWithRed:0.85 green:0.83 blue:0.45 alpha:1];
        self.spinner.x                 = 40;
        self.spinner.alpha             = 1;
        self.spinner.centerY           = self.loginBtn.middleY;
    } completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
