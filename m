Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20176CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yX8jqUNVoaT/pP/QBlusgZO8WrcJpEh11O3LQ2VZcys=; b=mYRr/6gGywuqUp7uzkXsJBM46W
	7GwKSLV6rFJPvkk8ll1ONA6ssNnkCdrsxAXtF3wUHZRPm/3YRTArIj1vgXCuq4uoXNR52O5+fpc3v
	7Ku1aa5w5hCOuxn2hhePE3rjjqWezqVj9mBV96NpXg6ezpXsO/mAhwn+prjvX/eTFCBNCY+RSf9Yu
	qNiVeAS8/Oc1PEOubJ3ySZCWSyR+hZoM6LNsUAUarghWKemzf7j0u5Kz//W2HCPJpwC+eKZa1wxpw
	lw69fz5trq4JX+B2GLteyaKhFaCRS2A53jgTwyPdxk1vfIvawnU/HG9bpsBi8WVkwNp1G5VmfaWQF
	wBI0MJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpx-0000000BCb7-3UQX;
	Tue, 19 Aug 2025 18:13:33 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMDn-0000000AZN3-1BTA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:17:52 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb78fd0c2so74174966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609470; x=1756214270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yX8jqUNVoaT/pP/QBlusgZO8WrcJpEh11O3LQ2VZcys=;
        b=edlhZPQxBcEVISzYcJDIWmmE+tedZc6s36ATUHHp6+k3t3VnssRE1swzkqi2wcpV8J
         cxOgRp0RIjhZHux4p0BDYJ2pe/XBAdLWdYeF7HE5xiL0BanNmYU/90UmDm6Nuz5e4RE+
         PwpGw73PKEuDOVANiOTM7TwjhG/1Os6XlnkQ/Ho8ac3BWE9AmbpzuXr9rH9Lhy0awFzy
         lXjGolg1jsBHTOuBd89d/dVVHALY5I2jB0bUOr5slsRJ0S9JUF0OfpE+1wF1LIO7k4HZ
         BMR6it9Mh4AKHyj5vc61QZh1uMj07TONCfnIPIUMfOh1skPvVcPo9jkItCi5D3diKVQF
         z7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609470; x=1756214270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yX8jqUNVoaT/pP/QBlusgZO8WrcJpEh11O3LQ2VZcys=;
        b=czWSaslJVVczw2QGIMkUqof6srGQkQkSXBlEN+XeOQYp52iKk1PdNAxpRnJYASRPQW
         MouAZIeVxMLMJPI/K2FzPLx9CBG4Wupc5HpufrWx2TRVsOlF5PAy48MUu4qOXqF5hCAS
         Eidmcb+VPfXDuf6lK0BO2pVuPwSo4N0NB39shrMg+NkL04JCLMg5597r0/hbboLHWot+
         AsrOy4457ba+rZvsO5w6CnEc2sfW8EHJOGHFMxUhayHQIaO2/hMSjs+yfF9cDeYn5dBI
         nbcEZMa52tUC8AA5XtNjSZtRXnKs9otwe08Z/AeE1RZLt8LvRIxB8Qt0qTSdae62mpJI
         0KDw==
X-Forwarded-Encrypted: i=1; AJvYcCUILTewvTlwjPXlPkOJfiTskfMX01r1BU6VcnMYt3DOl6hHMOCthGW7EJyXTnSNZbne+rcKu6iUX6L/JHb1YUA4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa8YK4DTzoCiz4d+LXHAqHVllrtcWl0jM5L4C18z+Rsy6Ne8IY
	yaWKPMT7fdF8BkBnFji+xzq9t/RjK3DrkhZrdVlyYBR2OVfQkKd8F0qsWxuU6wmNT50=
X-Gm-Gg: ASbGnct6/HZ/I5QCgnu5GXZTsMOR0gS1FZYHgRwLQDiDRpXH5Np5y/qbKEtY1tKMD6a
	pzY5LXMYzhq97sftYZQnMSoynyQulYUQ2P5mhDFBzIIXvRjyZYS4vSIEczvmuWthlvbdKlSTxEk
	nss+E9Cxhjf7Usayz668wgxsRzjASsIvRhIEatDl7J8A2O15glEnDdojZYIEP2ojdnYsaygdLSr
	lkfjO/IhrDP94fwBut53o7uCww6fprUkwVbrBcuwr7jxzUtHRqa0rWHjr9Op3j01LDTXANRGTiv
	dvvlbr4J8wTicHcFdAwdh6iNYciqDbWZOofOV9vVzdl753W7Yp+hq3g2uJHLUYZQg8z8sk67Pup
	nowPtP1anrHltuqs69sHdsLd8mEoxdlv7MaCwp+EymmTw
X-Google-Smtp-Source: AGHT+IHRYPCS3CIXpz9ep32Qtx6spFR8eE7gvHlEe/afYX4onbStKp+kGa6meEY3YtnW6Pv8oWVyMQ==
X-Received: by 2002:a17:907:968a:b0:ad8:a2b3:66fb with SMTP id a640c23a62f3a-afddcbadb07mr124772066b.3.1755609469701;
        Tue, 19 Aug 2025 06:17:49 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53f49sm1007251066b.7.2025.08.19.06.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: aspeed: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:17:44 +0200
Message-ID: <20250819131743.86905-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9010; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=J/hsPKtt4JbGzEI1pCl4hW7h1QPoxR3/5npoimUrZNQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHl3mN1BKV6PxXk7jlrwxP7edMkWFv03fc9Q3
 tA7yxN2kDqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5dwAKCRDBN2bmhouD
 12wrEACF0czF4yiRZj5xxAq/TmjYthxtMYW9SNh1wmjiPXvf5M2AiAzTIli8cRpczKhhvWN3qEJ
 qH3aARLi0lTJXzcnGDcI+CpxdRvuLpLG+UlM0C0TEMzIXZJLf1bKy+R8zpmdKCZI1cb1iOieubr
 65DQZUfVUCVwfIy36b/tG35fgcBgf59x5kisxw5jKNj98ZqTK95UrSGkmwMY8BztU8USV8TABG4
 WtZeGUwdrbgZjBfDv7OqrCaR04NUCHpZB51V6MtiRYTAecUGg40DtQSWwLIIN7oL4AcyEEwdlIX
 v/ZBmJ3OdXAfkVWlg5GVlQzHUEZeuFa4y+kIT//k/Vuna/VObLIs5tg60vINmhq14AE030krBKG
 hYZpeiA3Y3wRJYlmEdIY7/SUuhqQ6rGh4KRpjtQHufKF/NPJOlduxebYKS1ZtesZSs5Dj4EpApI
 RgnH47VCBru9xdUvn6CWk+ZpTbzz+Rub3K+7+8TdT8sK1ZVXKr+OZTwaf53JAsbWXN+xGLk3Cdu
 7Uhnu/dxC2YW4tu/urgD2b01L4SyvhXHHXBcTtsxWInt4Bs2Qe+YLx5FKy6kuBsBt9Erf5x/zBw
 6B3ujHdYTjMA1xcncq9EuwQQEv/UW2PyYxmswjbb6eO2VQjo6sBvr+1AbMYmCP56E+nYkmka0uy Bno9k6UHwpW/itg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061751_320726_CE5F332B 
X-CRM114-Status: GOOD (  13.12  )
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

The DTS code coding style expects exactly one space around '=' or '{'
characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts     |  2 +-
 .../boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts |  4 ++--
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts    |  4 ++--
 .../boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts  | 12 ++++++------
 .../dts/aspeed/aspeed-bmc-facebook-santabarbara.dts  |  2 +-
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts     | 12 ++++++------
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts  |  2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts     |  8 ++++----
 .../boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts   |  2 +-
 .../dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts    |  2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts    |  2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi      |  2 +-
 12 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
index c435359a4bd9..53b4372f1a08 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
@@ -243,7 +243,7 @@ temperature-sensor@49 {
 				compatible = "ti,tmp75";
 				reg = <0x49>;
 			};
-			temperature-sensor@4a{
+			temperature-sensor@4a {
 				compatible = "ti,tmp75";
 				reg = <0x4a>;
 			};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 8d786510167f..14dd0ab64130 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -526,11 +526,11 @@ fan-3 {
 					tach-ch = /bits/ 8 <0x03>;
 				};
 			};
-			fanctl0: fan-controller@21{
+			fanctl0: fan-controller@21 {
 				compatible = "maxim,max31790";
 				reg = <0x21>;
 			};
-			fanctl1: fan-controller@27{
+			fanctl1: fan-controller@27 {
 				compatible = "maxim,max31790";
 				reg = <0x27>;
 			};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index b9a93f23bd0a..59249e5f2fce 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -183,7 +183,7 @@ &kcs3 {
 &i2c0 {
 	status = "okay";
 
-	pwm@5e{
+	pwm@5e {
 		compatible = "max31790";
 		reg = <0x5e>;
 		#address-cells = <1>;
@@ -257,7 +257,7 @@ eeprom@50 {
 &i2c2 {
 	status = "okay";
 
-	pwm@5e{
+	pwm@5e {
 		compatible = "max31790";
 		reg = <0x5e>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index ef96b17becb2..399e244bcd79 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -312,7 +312,7 @@ eeprom@50 {
 				reg = <0x50>;
 			};
 
-			pwm@5e{
+			pwm@5e {
 				compatible = "max31790";
 				reg = <0x5e>;
 				#address-cells = <1>;
@@ -435,7 +435,7 @@ eeprom@50 {
 				reg = <0x50>;
 			};
 
-			pwm@5e{
+			pwm@5e {
 				compatible = "max31790";
 				reg = <0x5e>;
 				#address-cells = <1>;
@@ -558,7 +558,7 @@ eeprom@50 {
 				reg = <0x50>;
 			};
 
-			pwm@5e{
+			pwm@5e {
 				compatible = "max31790";
 				reg = <0x5e>;
 				#address-cells = <1>;
@@ -681,7 +681,7 @@ eeprom@50 {
 				reg = <0x50>;
 			};
 
-			pwm@5e{
+			pwm@5e {
 				compatible = "max31790";
 				reg = <0x5e>;
 				#address-cells = <1>;
@@ -804,7 +804,7 @@ eeprom@50 {
 				reg = <0x50>;
 			};
 
-			pwm@5e{
+			pwm@5e {
 				compatible = "max31790";
 				reg = <0x5e>;
 				#address-cells = <1>;
@@ -926,7 +926,7 @@ eeprom@50 {
 				reg = <0x50>;
 			};
 
-			pwm@5e{
+			pwm@5e {
 				compatible = "max31790";
 				reg = <0x5e>;
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index ee93a971c500..72c84f31bdf6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -233,7 +233,7 @@ gpio@20 {
 			"FM_NIC_PPS_IN_S0_R","FM_NIC_PPS_IN_S1_R";
 	};
 
-	fan-controller@21{
+	fan-controller@21 {
 		compatible = "maxim,max31790";
 		reg = <0x21>;
 	};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index aae789854c52..60b98d602e80 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1186,19 +1186,19 @@ adc@1f {
 				ti,mode = /bits/ 8 <1>;
 			};
 
-			pwm@20{
+			pwm@20 {
 				compatible = "maxim,max31790";
 				reg = <0x20>;
 			};
 
-			gpio@22{
+			gpio@22 {
 				compatible = "ti,tca6424";
 				reg = <0x22>;
 				gpio-controller;
 				#gpio-cells = <2>;
 			};
 
-			pwm@2f{
+			pwm@2f {
 				compatible = "maxim,max31790";
 				reg = <0x2f>;
 			};
@@ -1234,19 +1234,19 @@ adc@1f {
 				ti,mode = /bits/ 8 <1>;
 			};
 
-			pwm@20{
+			pwm@20 {
 				compatible = "maxim,max31790";
 				reg = <0x20>;
 			};
 
-			gpio@22{
+			gpio@22 {
 				compatible = "ti,tca6424";
 				reg = <0x22>;
 				gpio-controller;
 				#gpio-cells = <2>;
 			};
 
-			pwm@2f{
+			pwm@2f {
 				compatible = "maxim,max31790";
 				reg = <0x2f>;
 			};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
index 757421bc3605..c5fb5d410001 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
@@ -263,7 +263,7 @@ eeprom@51 {
 		reg = <0x51>;
 	};
 
-	tca_pres1: tca9554@20{
+	tca_pres1: tca9554@20 {
 		compatible = "ti,tca9554";
 		reg = <0x20>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
index 8d98be3d5f2e..dbadba8eb698 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
@@ -3778,10 +3778,10 @@ smb_svc_pex_rssd01_16: pinctrl@20 {
 			pinctrl-0 = <&U65200_pins>;
 			pinctrl-names = "default";
 			U65200_pins: cfg-pins {
-				pins =  "gp60", "gp61", "gp62",
-				"gp63", "gp64", "gp65", "gp66",
-				"gp67", "gp70", "gp71", "gp72",
-				"gp73", "gp74", "gp75", "gp76", "gp77";
+				pins = "gp60", "gp61", "gp62", "gp63", "gp64",
+				       "gp65", "gp66", "gp67", "gp70", "gp71",
+				       "gp72", "gp73", "gp74", "gp75", "gp76",
+				       "gp77";
 				function = "gpio";
 				input-enable;
 				bias-pull-up;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts
index de61eac54585..c63f0b43090e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts
@@ -151,7 +151,7 @@ &mac1 {
 	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
 };
 
-&adc{
+&adc {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_adc0_default
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
index 72dafebc080d..4de38613b0ea 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -282,7 +282,7 @@ &uhci {
 };
 
 &sgpiom0 {
-	status="okay";
+	status = "okay";
 	ngpios = <128>;
 	gpio-line-names =
 		"","",
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts
index 627c91f178e6..af3a9d39d277 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts
@@ -64,7 +64,7 @@ event-checkstop {
 			linux,code = <ASPEED_GPIO(F, 7)>;
 		};
 
-		event-pcie-e2b-present{
+		event-pcie-e2b-present {
 			label = "pcie-e2b-present";
 			gpios = <&gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(E, 7)>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi
index 16815eede710..8c953e3a1d41 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi
@@ -30,7 +30,7 @@ video_engine_memory: jpegbuffer {
 			reusable;
 		};
 
-		ramoops@9eff0000{
+		ramoops@9eff0000 {
 			compatible = "ramoops";
 			reg = <0x9eff0000 0x10000>;
 			record-size = <0x2000>;
-- 
2.48.1


