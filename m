Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B1CF8A14D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iCyszGnOgLovfFmk29ajceFYb/ZXq9+n4I2vTeO5bXo=; b=oVbPf6jMwgm/yC5iPLQdpPQMF+
	bC79QB7KvoTYS2Dk4RdlVpXkY9SU/eol/7DJDDm5aHjgSyZ6oUqpBtbJLay4MLuJ/nFIydYwx47Sp
	/Z0SECfRzaIPLciJMpX3F8OXxCxtMeCsVxUYlZJWNPUm4zK/So8z3Jq3lg4pZ2SqSdyXJM7m1WGmu
	Cwyvwz4540RknIpIGnYau+MbMSWztDDaeEL947Nb0HMAXMHeCAzNKAf0Hg27+myEwUMnOcAHo2+M5
	nKFCt226mZHqqMQQrBs/wz7Jt3xK9wVSDnOiJaPGKvdrOeWkD3aKBPjQCiVWNRIa+JvgA1kPBxM29
	rGrXjS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKUT-00000002LBg-3jnt;
	Thu, 16 Apr 2026 11:02:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKUQ-00000002LBG-1d4Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 11:02:32 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d75312379so356994f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776337348; x=1776942148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCyszGnOgLovfFmk29ajceFYb/ZXq9+n4I2vTeO5bXo=;
        b=nRhiNVC0MtVxtF+txCK4Uzn7tAjh4O/mYBrWZsoVhZxBhF/geh7QA+dhAv5HKqLzaW
         HpLyjn+Pcz5ugXgwa+3S4LJLdprTHFCQPPDIVGiYi+0V3Sgay2Jt21bYZkaNRtsp8bH1
         IlMLCQZfDK70F17BvOLebL+WTsUmrIspgu54HrhsHhbMtk1xiuMMyRLabG5VHMxnZDM/
         1O50A6Uaz34F0v5jJaWKvJiXogw0xjLH+zddzk9lRpDexwkkg5KeQJzn3tkidS/i1GHV
         3qLyhGpX+HeGZpX0ft4HV3AHV3zYbDZvzLDfFLyuFCxQI+WsFvZ1iMe+M311VmVyKw5U
         b94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776337348; x=1776942148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCyszGnOgLovfFmk29ajceFYb/ZXq9+n4I2vTeO5bXo=;
        b=TlPVY7SgURz1DQmI+HmXVPwB3vrGe9NfEdlmWtt9MwOW5Vy5s1g5z/trRsZ51kC2hH
         pF7dEBooUh9nKvaM/Oh2SYvvovEySp7pqWpVSsEESr5v2WzUtAu2CWVhV8d8m35+h7T3
         tkIfhye8JT9xqdUcPA2a9th9k0yZKUjP6w5vNu6aOHB5v2FGfbbxFJffQRxHKoluoNzH
         6OmveZumdBzShv7ybjWQ7UkP1qfUf60/CX71gSyi5ylnc/kaTuuqk4RDehIb93WPDbWh
         Ar04Crt//BHyiqinW+kSbyWf8WcC++c4ZV5hXC0DdHIKQhRfLblCiZg2ToR51sHyr+3Q
         cjoA==
X-Forwarded-Encrypted: i=1; AFNElJ/dynys6OziytdoVKbuYlXzi65mCMBhCwXlDPoa3p9/FY6IGb0Xf4yzxt+ey7VDh0p0ArMJTzUZFWS917t0U37Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxuKhUdVgXlEir1TwYxYBKqxK8RRfDjgOSMouThsaeOQv+9m/G7
	Q/7Tuvf3n1WDEQ9On5Ut2KyCp/nJ5pHpTBkna8xGOQx9jAaxKIlgpdZygxL16aaTXAedE2Omx7w
	VL6Pf
X-Gm-Gg: AeBDieuDWTiCuVuFBDd8NHU0JFZvRVApBL6gYpiArfTcF2yZkJ/wJOB/twGzomM6dOh
	jwmo7Q62SobcMqePKDanWbyEwQq9Ne7PP1mVYHt0eh6ksATUC0GhvTla+ZJNNdTJOuxau1+EIp+
	+5VwPGd6PV9WqIfNyka5eoeS03IDzBI+LWcq2n3DPrOu5ro6MSgRiuuLmmhQNTR3v9Ay9m0flo+
	M17LBlbDEBFueAFl2z6sxV0igzo8xlKbhmRKXPLcxhDJ3/g5Hh+cp/+Jpm/s4Mry5Bvh+1RH3LK
	fZoY5rfBrWlQ4cxGiPV4SAvv9HiL7bR3LOmWep9hxDXN2218qNbub1hq9Uz9EEH107tmBk/BYK/
	f9ZFkNBb6v/SvEo72Jmnv/SuX255bs+nGpK+u7IvDDTOhaeuxLYz9exsRvWggx2I3UES21co+KU
	O/2O1GlV3Zgoun439J00VJxIYfkY5nRzAAdzW4fJ/Afvh//plzkTPd7VSVijNnPPqBVWMb7bgBE
	PXIkDZqQJXpqQk=
X-Received: by 2002:a05:6000:2387:b0:43d:6df0:c7f6 with SMTP id ffacd0b85a97d-43fdbb4d72dmr2310498f8f.18.1776337347513;
        Thu, 16 Apr 2026 04:02:27 -0700 (PDT)
Received: from localhost (p200300f65f20eb0885e9dbcbb434af4b.dip0.t-ipconnect.de. [2003:f6:5f20:eb08:85e9:dbcb:b434:af4b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43ead3d5fe1sm12701781f8f.22.2026.04.16.04.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 04:02:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: stm32: add board pin documentation stm32mp135f-dk
Date: Thu, 16 Apr 2026 13:02:15 +0200
Message-ID: <20260416110218.594911-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4511; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Y1BgV1iQXev91LhXSBciaXbwGuzgkgY/QMn9ijj0Aq8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp4MG6v7vW37qghx48W4XPKNcHFnYxqN8elzAvb 59/0A4715uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaeDBugAKCRCPgPtYfRL+ TmbQB/0b+geuL4tVRtm0P2sBmAHLvSobdJiJ/zcfY95vTRSq7mFMT+ow9wVyPKiSB9k2DLfBuQD CM48sJA8fpvo0CDHmE4x6G/1Ytg83R6T0RKiizrBu5RQML6cQudTKeZKGx9zATrIz94FQfGnq1f 6OWkPNvOH9p46weHYip5yEkYOanUeIXJz5NEoNNRfb0E34XgBUXDgzu+jEVgdx2YmJ5Clu2BO5V Nj1T7TadK7DO8YNtX79Nv5f1QH1C7+ru7Tre4ffrdcbcudcKxo7hnIc1/6uNqMwkDCvIHC/olR+ M4HcsSVeHueFVR9Yv47hsvK1Vsd/nO3uBheifWPgVEJTo6wF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_040230_708579_6E9EF2F6 
X-CRM114-Status: GOOD (  14.73  )
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

Relate the devices defined in the device tree to the SoC ports and pins
and labels available on the board.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

it's always the same things I look up in the various documentations. Put
this information in the dts to simplify this in the future.

Best regards
Uwe

 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 28 +++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 4d4cec8b86ac..d70fc0b5362d 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -64,6 +64,7 @@ gpio-keys {
 		compatible = "gpio-keys";
 
 		button-user {
+			/* GPIO on PA13 "User button 2 (B2)" */
 			label = "User-PA13";
 			linux,code = <BTN_1>;
 			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
@@ -74,6 +75,7 @@ leds {
 		compatible = "gpio-leds";
 
 		led_blue: led-blue {
+			/* GPIO on PA14 "User LED (LD3)" */
 			function = LED_FUNCTION_HEARTBEAT;
 			color = <LED_COLOR_ID_BLUE>;
 			gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
@@ -82,6 +84,7 @@ led_blue: led-blue {
 		};
 
 		led-red {
+			/* GPIO on PA13 "User LED (LD4)" */
 			function = LED_FUNCTION_STATUS;
 			color = <LED_COLOR_ID_RED>;
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
@@ -252,6 +255,7 @@ phy0_eth1: ethernet-phy@0 {
 
 &i2c1 {
 	pinctrl-names = "default", "sleep";
+	/* SDA on PE8 = CN8.27, SCL on PD12 = CN8.28 */
 	pinctrl-0 = <&i2c1_pins_a>;
 	pinctrl-1 = <&i2c1_sleep_pins_a>;
 	i2c-scl-rising-time-ns = <96>;
@@ -486,7 +490,10 @@ counter {
 		status = "okay";
 	};
 	pwm {
-		/* PWM output on pin 7 of the expansion connector (CN8.7) using TIM3_CH4 func */
+		/*
+		 * CH4 on PB1 = CN8.7;
+		 * conflicting with &usart1 CH3 on PB0 = CN8.10 is possible
+		 */
 		pinctrl-0 = <&pwm3_pins_a>;
 		pinctrl-1 = <&pwm3_sleep_pins_a>;
 		pinctrl-names = "default", "sleep";
@@ -505,7 +512,10 @@ counter {
 		status = "okay";
 	};
 	pwm {
-		/* PWM output on pin 31 of the expansion connector (CN8.31) using TIM4_CH2 func */
+		/*
+		 * CH2 on PD13 = CN8.31;
+		 * conflicting with &i2c1 CH1 on PD12 = CN8.28 is possible
+		 */
 		pinctrl-0 = <&pwm4_pins_a>;
 		pinctrl-1 = <&pwm4_sleep_pins_a>;
 		pinctrl-names = "default", "sleep";
@@ -524,7 +534,12 @@ counter {
 		status = "okay";
 	};
 	pwm {
-		/* PWM output on pin 32 of the expansion connector (CN8.32) using TIM8_CH3 func */
+		/*
+		 * CH3 on PE5 = CN8.32
+		 * conflicting with &usart1 CH1N on PA7 = C8.36 is possible
+		 * conflicting with &usart1 CH2N on PB0 = C8.10 is possible
+		 * conflicting with &usart1 CH3N on PB1 = C8.7 is possible
+		 */
 		pinctrl-0 = <&pwm8_pins_a>;
 		pinctrl-1 = <&pwm8_sleep_pins_a>;
 		pinctrl-names = "default", "sleep";
@@ -541,7 +556,7 @@ counter {
 		status = "okay";
 	};
 	pwm {
-		/* PWM output on pin 33 of the expansion connector (CN8.33) using TIM14_CH1 func */
+		/* CH1 on PF9 = CH8.33 (alternatively on PA7 = CN8.36 conflicting with &usart1 */
 		pinctrl-0 = <&pwm14_pins_a>;
 		pinctrl-1 = <&pwm14_sleep_pins_a>;
 		pinctrl-names = "default", "sleep";
@@ -553,6 +568,7 @@ timer@13 {
 };
 
 &uart4 {
+	/* Accessible via micro USB ST-LINK USB (CN10) */
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
@@ -564,6 +580,7 @@ &uart4 {
 
 &uart8 {
 	pinctrl-names = "default", "sleep", "idle";
+	/* TX on PE1 = CN8.37, RX on PF9 = CN8.33 */
 	pinctrl-0 = <&uart8_pins_a>;
 	pinctrl-1 = <&uart8_sleep_pins_a>;
 	pinctrl-2 = <&uart8_idle_pins_a>;
@@ -574,6 +591,7 @@ &uart8 {
 
 &usart1 {
 	pinctrl-names = "default", "sleep", "idle";
+	/* TX on PC0 = CN8.8, RX on PB0 = CN8.10, RTS on PC2 = CN8.11, CTS on PA7 = CN8.36 */
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-1 = <&usart1_sleep_pins_a>;
 	pinctrl-2 = <&usart1_idle_pins_a>;
@@ -584,6 +602,7 @@ &usart1 {
 /* Bluetooth */
 &usart2 {
 	pinctrl-names = "default", "sleep", "idle";
+	/* TX on PH12, RX on PD15, RTS on PD4, CTS on PE11 */
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_sleep_pins_a>;
 	pinctrl-2 = <&usart2_idle_pins_a>;
@@ -613,6 +632,7 @@ hub@1 {
 };
 
 &usbotg_hs {
+	/* USB Type-C DRP (CN7) */
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
 	usb-role-switch;

base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
-- 
2.47.3


