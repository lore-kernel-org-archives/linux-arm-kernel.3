Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAEFCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6oO7UcbifjANg6+xucVaaqaXrh56H+LhtGLaKseBvw=; b=exyFBI9apCiUDdGtZIpuY9g5Z/
	pvE8c1ReQwWnb1ojgfCD58qDvmR3kySaY0Y3B/plOXK2PcUlA48zfIAeeBvcMs+ABHutq+8nlnbtV
	o3yDHqN6oIO1Uwr7YEXSerjdkXGSGEqfpvMj36HvlfqwykYkdpwXf9Q+wNTGZ6mmf2xr7JjK/v0Su
	yDi0iHDb/N5bMQbQWLeaV8C+pF/J/BSFek0OAtwodfF0aFV46ZNZ/cBGrxMHZIAs8lhvKOjC2pYi1
	aBLYkUAzXQ5tkhNPkTEn7dNuL3hRWBlM1EYyiWcKioQfKsPcfed+5j8lm1ygB/HSifKDkpXGNXSGL
	58eCTj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpm-0000000BCJ1-1MRV;
	Tue, 19 Aug 2025 18:13:22 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMD2-0000000AZFJ-0tyT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:17:05 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-afcb74bef86so95619966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609422; x=1756214222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6oO7UcbifjANg6+xucVaaqaXrh56H+LhtGLaKseBvw=;
        b=vWkdd0CmTa8yjdPNJaI7ZTD+6x4/DBVmm5/Dj0hPYdh4iZp1bpacZxv4ZHKAmzKi98
         vK1r/ZXUnBk7oKlHrlqeUEM0rJBjyE1KLLTRN/7RyDEMtd7HIBW0AqHvyvLK9zHhDTwf
         TbCTGeb4kTCl6RCZOhBtiD1BlGI0FjGCKP5RZhu9O9Imq2pL0oh4cCWAAVB+Sh3RTIOL
         FiJjsD1HBD4MNXgCuSQ88x9sDoHt8ZV6TNzHraiw+4U43APuRRzudOb9BRQTvw/DGxBU
         VGDI469rBSLmNbSaHPIHDyPW6hMkjnGHqiSPppA4l8Sqbaa9qsaYAu1GO9bkIiL1zmQI
         82fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609422; x=1756214222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6oO7UcbifjANg6+xucVaaqaXrh56H+LhtGLaKseBvw=;
        b=mrxqLAN5CKdYboDyZvpm6Nwv9nVSdapPIwnZYvuFjfsbMvWb+iaKZ1xjozVqiMntrP
         MO8ZDRynla6x8O0cIaZw9lfiVtM1jWVsf+CBO/SOzYhBBXOrln6YFlD7KGKERIxICmUr
         4Td3Bw3o3J7gS5JFgepudpxqC07qmuFdbkNk1R1paX5TpWw3YZs6pEc/G+fePCY+230w
         vezg0oAtzr1gqzLk7GiSGc5ZVpKeo/wCxtosQwJ7r9hyL4pKLhTnPFKp2twc5ZmYVP6R
         b/kjWSqnLzXe6j5oQIMxiO04KUaTE6wpn+iYDl2z6zPwijFbVeYjyc+bQFV6gHocouSv
         LBRA==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZHiohTMTVciqVVyXOV9mFQubh0XQy9jF1jd3dcRtnhFgixxD5eQBrfhc0ye0+tK70gUnnuF6u7emE/WRkh5u@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ0TVZ9tQ16O/XUbauWAZyx00Y/HHnYUNvjKkAZ7mV40jDbJ8d
	/4N831XCslJdwAoXRyxj7BFgAzeSfIQ3ShjB0cXuVKnxL34+NdKwVN3A2TMdv8udNTo=
X-Gm-Gg: ASbGncsNVsTfbCiaf3oQKbiMsy296lfkJpJGtwELGf88JDjWEkAYINn8stsPGY9jXwm
	NJ7aObo3D3OY7vI1koaFJoNsBTzKP7Ry2fZjPkN5KO1/U+5azld9s6KZyomUGmKnajrRmOHIIxa
	hePru9jQkAlJDKoEmorrAS+UDHoxmsmRv4lfXmWmdVJV2W22ldvMLeew+A/lXv3/8ph5BNgbw8a
	imtV16n+QeZJc4xmrYC+KzYPa9l9oVsW5Qa1GKAr4NDRdP0KVVryye1V6XxSrTNwqWcK8TdqBLp
	0UiJhsFn18JhjpoTOxsuVvjDOWJDeLUFZyAQ4jmiolURGzZwCMkYT2yHinM4eE2tR8bP9gxCgf6
	1o4ZZJrTLug79mru877MplcxyuyXr4PzDmw==
X-Google-Smtp-Source: AGHT+IGaketc/mPE71H8qiCvBINl3fociuyFe3ipXPvm1yAjoe0EVAgQ2XFvCAAR1jGETap8sm+eBw==
X-Received: by 2002:a17:906:7950:b0:ae6:c555:8dbb with SMTP id a640c23a62f3a-afddd27def9mr115923766b.11.1755609422428;
        Tue, 19 Aug 2025 06:17:02 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccea7sm1005948066b.67.2025.08.19.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] ARM: dts: omap: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:16:54 +0200
Message-ID: <20250819131651.86569-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
References: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7662; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Bv5YvXCKD3sEHEy0whZr2Io0hZSRL3WFhERlKx2wLwU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlF76yqVlEVRvjTp0YREvGTF65iZZhqrfmTG
 /V2v+Osfu+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5RQAKCRDBN2bmhouD
 18zkD/0b7To2OAux7kXNWZ0VpydPAqbeALF9fgzHu5S3KK3o/ZQaQHxG3PmYzpjFL6qQ307zjwm
 R8f7LLrAqmAooYWAwoYgINpYiTUYYMh54xnEX/CT2Wc2nOnL/aSXTbxEyYjTwEN2Yl/VES+eWrw
 T3Sd503fc+5F4R0VKeiaB/Uu07yRmzfq2w6FjUQyRTqZNMEsPYMGKFZXx2x08e+7ZM66iduIveP
 8GbePPzAhbvGY49Z0wKwk/TRlxHD2gKJ5Qpa9KrQuk2eed/ngZyNVnihl87Z69TJM/zrUmToFsb
 4ydwV95vDLSiWZkOfqQgLhZp2Dti9+NX6WmEKW9DPnzzGSGd2e7zqJSskf19W/zrmvEMVir6DmC
 dn2i3I5jVQ83I2G5ZhGNw02fqE0t5RXlzN9I0VgW7ek1pESp4TwgnXKYU+BBxl5rtHZgW0MzjFG
 XGlnUy6H02swqSkpxUHJE0dKMOTZMVzfXFcQFPWyvHa8dbWPMxKwnvYcYMV+4ZS5xh9g0mB4h95
 pWpo7nqCAgauIXxzxoc10WMrsAsPv6mQAehS2KOD4j9O4DwOt/Wdp44Ht8fJjnv801xQ5bzraQB
 4u7oieQ7VL4S8XCVjsRzusJCbvOe0WISbUDG0U9p7CN30wRAS2wxxOu8sGSstUFHeRBAtwI+Pbs 9TkZ8loMeH+tnqg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061704_256203_BC1DFE58 
X-CRM114-Status: GOOD (  16.06  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../arm/boot/dts/ti/omap/am335x-myirtech-myd.dts |  4 ++--
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts        |  2 +-
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi         |  8 ++++----
 arch/arm/boot/dts/ti/omap/am33xx.dtsi            |  8 ++++----
 .../dts/ti/omap/am57xx-beagle-x15-common.dtsi    |  2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi           | 14 +++++++-------
 arch/arm/boot/dts/ti/omap/dra71-evm.dts          | 16 ++++++++--------
 .../dts/ti/omap/omap3-devkit8000-common.dtsi     |  4 ++--
 arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts    |  4 ++--
 9 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
index fd91a3c01a63..06a352f98b22 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
@@ -143,7 +143,7 @@ &i2c1 {
 
 	sgtl5000: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
-		reg =<0xa>;
+		reg = <0xa>;
 		clocks = <&clk12m>;
 		micbias-resistor-k-ohms = <4>;
 		micbias-voltage-m-volts = <2250>;
@@ -155,7 +155,7 @@ sgtl5000: sgtl5000@a {
 
 	tda9988: tda9988@70 {
 		compatible = "nxp,tda998x";
-		reg =<0x70>;
+		reg = <0x70>;
 		audio-ports = <TDA998x_I2S 1>;
 
 		#sound-dai-cells = <0>;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
index 757ebd96b3f0..f3524e5ee43e 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
@@ -109,7 +109,7 @@ clocks {
 		audio_mclk_fixed: oscillator@0 {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency  = <24576000>;	/* 24.576MHz */
+			clock-frequency = <24576000>;	/* 24.576MHz */
 		};
 
 		audio_mclk: audio_mclk_gate@0 {
diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index d6a143abae5f..f502216ecf38 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -1457,10 +1457,10 @@ SYSC_OMAP2_SOFTRESET |
 
 			gpio1: gpio@0 {
 				compatible = "ti,omap4-gpio";
-				gpio-ranges =   <&am33xx_pinmux  0  0  8>,
-						<&am33xx_pinmux  8 90  4>,
-						<&am33xx_pinmux 12 12 16>,
-						<&am33xx_pinmux 28 30  4>;
+				gpio-ranges = <&am33xx_pinmux  0  0  8>,
+					      <&am33xx_pinmux  8 90  4>,
+					      <&am33xx_pinmux 12 12 16>,
+					      <&am33xx_pinmux 28 30  4>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
diff --git a/arch/arm/boot/dts/ti/omap/am33xx.dtsi b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
index 0614ffdc1578..43ec2a95f4bb 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
@@ -461,10 +461,10 @@ &cppi41dma 26 1 &cppi41dma 27 1
 
 			cppi41dma: dma-controller@2000 {
 				compatible = "ti,am3359-cppi41";
-				reg =  <0x0000 0x1000>,
-				       <0x2000 0x1000>,
-				       <0x3000 0x1000>,
-				       <0x4000 0x4000>;
+				reg = <0x0000 0x1000>,
+				      <0x2000 0x1000>,
+				      <0x3000 0x1000>,
+				      <0x4000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";
diff --git a/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi
index 994e69ab38d7..87b61a98d5e9 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi
@@ -149,7 +149,7 @@ led3 {
 	gpio_fan: gpio_fan {
 		/* Based on 5v 500mA AFB02505HHB */
 		compatible = "gpio-fan";
-		gpios =  <&tps659038_gpio 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&tps659038_gpio 2 GPIO_ACTIVE_HIGH>;
 		gpio-fan,speed-map = <0     0>,
 				     <13000 1>;
 		#cooling-cells = <2>;
diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
index ba7fdaae9c6e..c9282f57ffa5 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -267,8 +267,8 @@ usb2_phy1: phy@4000 {
 					syscon-phy-power = <&scm_conf 0x300>;
 					clocks = <&usb_phy1_always_on_clk32k>,
 						 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS1_CLKCTRL 8>;
-					clock-names =	"wkupclk",
-							"refclk";
+					clock-names = "wkupclk",
+						      "refclk";
 					#phy-cells = <0>;
 				};
 
@@ -279,8 +279,8 @@ usb2_phy2: phy@5000 {
 					syscon-phy-power = <&scm_conf 0xe74>;
 					clocks = <&usb_phy2_always_on_clk32k>,
 						 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS2_CLKCTRL 8>;
-					clock-names =	"wkupclk",
-							"refclk";
+					clock-names = "wkupclk",
+						      "refclk";
 					#phy-cells = <0>;
 				};
 
@@ -294,9 +294,9 @@ usb3_phy1: phy@4400 {
 					clocks = <&usb_phy3_always_on_clk32k>,
 						 <&sys_clkin1>,
 						 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS1_CLKCTRL 8>;
-					clock-names =	"wkupclk",
-							"sysclk",
-							"refclk";
+					clock-names = "wkupclk",
+						      "sysclk",
+						      "refclk";
 					#phy-cells = <0>;
 				};
 			};
diff --git a/arch/arm/boot/dts/ti/omap/dra71-evm.dts b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
index f747ac56eb92..1d2df8128cfe 100644
--- a/arch/arm/boot/dts/ti/omap/dra71-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
@@ -83,10 +83,10 @@ lp8733: lp8733@60 {
 		compatible = "ti,lp8733";
 		reg = <0x60>;
 
-		buck0-in-supply =<&vsys_3v3>;
-		buck1-in-supply =<&vsys_3v3>;
-		ldo0-in-supply =<&evm_5v0>;
-		ldo1-in-supply =<&evm_5v0>;
+		buck0-in-supply = <&vsys_3v3>;
+		buck1-in-supply = <&vsys_3v3>;
+		ldo0-in-supply = <&evm_5v0>;
+		ldo1-in-supply = <&evm_5v0>;
 
 		lp8733_regulators: regulators {
 			lp8733_buck0_reg: buck0 {
@@ -131,10 +131,10 @@ lp8732: lp8732@61 {
 		compatible = "ti,lp8732";
 		reg = <0x61>;
 
-		buck0-in-supply =<&vsys_3v3>;
-		buck1-in-supply =<&vsys_3v3>;
-		ldo0-in-supply =<&vsys_3v3>;
-		ldo1-in-supply =<&vsys_3v3>;
+		buck0-in-supply = <&vsys_3v3>;
+		buck1-in-supply = <&vsys_3v3>;
+		ldo0-in-supply = <&vsys_3v3>;
+		ldo1-in-supply = <&vsys_3v3>;
 
 		lp8732_regulators: regulators {
 			lp8732_buck0_reg: buck0 {
diff --git a/arch/arm/boot/dts/ti/omap/omap3-devkit8000-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-devkit8000-common.dtsi
index 07d5894ebb74..910e3b54f530 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-devkit8000-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-devkit8000-common.dtsi
@@ -275,8 +275,8 @@ filesystem@680000 {
 
 	ethernet@6,0 {
 		compatible = "davicom,dm9000";
-		reg =  <6 0x000 2>,
-		       <6 0x400 2>; /* CS6, offset 0 and 0x400, IO size 2 */
+		reg = <6 0x000 2>,
+		      <6 0x400 2>; /* CS6, offset 0 and 0x400, IO size 2 */
 		bank-width = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts b/arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts
index 07bec48dc441..959fdeeb769e 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts
@@ -57,8 +57,8 @@ &mmc1_pins
 		&mmc1_aux_pins
 	>;
 
-	wp-gpios =  <&gpio2 27 GPIO_ACTIVE_HIGH>; /* gpio_59  */
-	cd-gpios =  <&gpio5 16 GPIO_ACTIVE_HIGH>; /* gpio_144 */
+	wp-gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>; /* gpio_59  */
+	cd-gpios = <&gpio5 16 GPIO_ACTIVE_HIGH>; /* gpio_144 */
 };
 
 &dss {
-- 
2.48.1


