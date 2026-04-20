Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0B5F5A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 20:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VMggFWx7dYASz3kXTlVBRyuVlZg3W3BNVcMSDh8xWWQ=; b=M72rD3LxnrF9EHXUwlVJ2pXImT
	8Ci/cSXfCyB2ggemMFh7tkG9lpeYmcYUhg4l4tRORA76g20HCWoOh7jnf336Av1phdJAHIyu5jxIM
	8tsZEN0SY0zMnlOzxZaWIVQ3U1RJZSTOUp4m/YmFjOX5F0UsUkzm23b1e4Na889J7By0woNCwc98t
	AG3ZTflspV/D5KfnegRJ5cHEJK5PEjyiiLuAuKPyh7lodrOIVaRUHSkzh9ZlCkUFdKYVb4nmYlOSS
	WJI1lyw/+WbTPeuB3TpX5FFnrO0/fPs0NJ/uLDPkfECyOMRiTGAGV0xK3Fre9cUNiengnvEy24ppT
	pbf+Yv6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvWH-00000007e3S-0LWy;
	Mon, 20 Apr 2026 20:47:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvWE-00000007e2y-1kjT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 20:47:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso34900615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 13:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776718017; x=1777322817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMggFWx7dYASz3kXTlVBRyuVlZg3W3BNVcMSDh8xWWQ=;
        b=q8umcQSothgpH8fTLr895FZHZPwE/kwROog9NyIbEMvf+DiANhvw4FIM5N4h7CfI4V
         xlgMt7lWqW/ugYIf+5q+j/GYANAFFtMfaHu8yMBZpntXgyaelPEBoqGtnstGPUz5MZ1j
         Sj4cwRVg94Ug5fag/F0xyS97SCa6vgCPMsOgxKvwi1tBYBMjKSnj8n8g6mJy1jsFq8Bd
         QbR8MouFuL7Hyg1TGGnGDB1BWgnbjD47RPSlkpwChkOjS86mrYlgmgQT9WWlnt44ot8E
         5ZuG8BnIoVxeE78kVJCP3GyAgjJG+4RQ1dNfVyaIwH7DKNYe2wSxiirfJ1oKLLco5gVC
         1GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776718017; x=1777322817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMggFWx7dYASz3kXTlVBRyuVlZg3W3BNVcMSDh8xWWQ=;
        b=nFx/A5gVm4DIZtPkaxmLr/Eds1HzenpucBrw4aiMJf//s2PpOtAJ7tLqYQXqYHm222
         jblSb29BCMWGIWf0wT02nwGMbe6JvnMOwqV4OSUQiO8vdpb26bnEoQ4VaKIGAqvSMueQ
         N45mU3P0wCjBuj6/4MlKnaVhZ1k8Vc/kwagOeeXx5rdlTEXJ+PoCoOkVnKY5uE8Go0AB
         YbbUHsuL34rajtPKYsGtgtkGiur0Uxx/tbr6adTfZmhN8XHt183qYqMXpl//HZx2/ly8
         rnGQwgFjSQ9mFgeqR98CUyWJthZwKX1NMjHPwg64q6UlYoSAESWD7YCedrT0mjqhzfwK
         aQQA==
X-Forwarded-Encrypted: i=1; AFNElJ81L3FtxPAab6rHtBS/+Cfb0y1wVjz65SkU8bSiJWIbi73kU0LcSkH5tr7ihNXVftIG11hlLBuf3ISLBiKTjJnB@lists.infradead.org
X-Gm-Message-State: AOJu0Yywy+noSqKqGAD687XmMHMjIBwJI/YkcUom5hJSbve3Nwdbugly
	Cibxx1iktVB1Zm2UoQyVMapYdz4r358/K7WSvtv4rFAiDfaXEAFLW3r5vlm4VUsF+N4=
X-Gm-Gg: AeBDiesG02hKoRBlz0WxsbIRvdqCQND7lOoDZsRZzmoxdXyNKOUUmz9IB08ciVXnAi7
	JgI1junmYf2ZhnGVV7OU2Fjp8uEKTgxX3VqVnIIgtFMUSjgeuT4tR+uQ5526uLekb06Q17muRes
	5tcsJchz4pTIKbFTeo6Zqrm/67qFfmkWL+DlE+ZLCMmmSSu4bLweP8M+v2bM0BvQkYVMumK4UqZ
	g73nzD2NVK0Xvps3ZIRe7psuoppRP3GHUknev2WyAviqjj8nG4zGIz7GviMTovLYcjiKSVyrJxs
	VFab0W/Hxhu45MwV9dAjyTW2hvhWuPaqBfYkOYgqwdJ9uJzR8O5itgOUmnxjNF2ZnGeUnEWWGKE
	fPuXIsqYO9cPorQAnWKxKVvPfD29Rb386LLaULAQ1jjZ9Vn5Uye9TYXb1EHrnjkcLm2Vb34TOHb
	arV2/+px1mH8MF3b+XR/NzXNBnDUWwF0J2YfoPltE=
X-Received: by 2002:a05:600c:41d6:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-488fb745294mr139309655e9.1.1776718016447;
        Mon, 20 Apr 2026 13:46:56 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48a525a0b1asm26426845e9.2.2026.04.20.13.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 13:46:55 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] ARM: dts: stm32: add board pin documentation stm32mp135f-dk
Date: Mon, 20 Apr 2026 22:46:48 +0200
Message-ID: <20260420204647.1713944-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4578; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=RuUj00JzNu8fU+LKSjapTZ5tePNXtbbVLDbLqJadgE0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhsxnE7afuh0buGxPjI7/qzX+rqKPpj79HJb5uuiWmMZdX 7P1lmvmdTIaszAwcjHIiimy2DeuybSqkovsXPvvMswgViaQKQxcnAIwkTx99n+6i9ZIv9BUz/aI WMaosdxeYc2bGcskUhr3fBdjMW4O0orRejynQN+oQXx+m/3SD5q6bJdZZd3EhIOb3+z4tX2lDe+ fu5FdkVxF9hwXtxc7Jc3W9TqtettxUtNNy3s7uZmW1LZk75oSf/b/75XVtvVV3ZcO//RukY1s9p o5+V7jI0GeTZdZl3q1msd+f/IiunXms+aF4Q5v3WaFZFbyxLZ4uz6uLmT2WhjuXDP53IKd09q5Z 88Kaw97dynWnaNEqcZfot5548OJqiv/bhJdE1/TbiS3/dOF+d/5Ip+cni6SemDqKtFte5sbWFKb lsQ0dmm0a9ooF1TItVo4JwfMW6a6IH7zzfjsow6Zuat7AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_134658_483710_3093E626 
X-CRM114-Status: GOOD (  14.62  )
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

my (implicit) v1 was reviewed by sashiko, see
https://sashiko.dev/#/patchset/20260416110218.594911-2-u.kleine-koenig%40baylibre.com

The findings were good, this v2 addresses these.

Best regards
Uwe

 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 28 +++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 8dcf68b212b4..ffac3c4fd608 100644
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
@@ -228,6 +231,7 @@ phy0_eth1: ethernet-phy@0 {
 
 &i2c1 {
 	pinctrl-names = "default", "sleep";
+	/* SDA on PE8 = CN8.27, SCL on PD12 = CN8.28 */
 	pinctrl-0 = <&i2c1_pins_a>;
 	pinctrl-1 = <&i2c1_sleep_pins_a>;
 	i2c-scl-rising-time-ns = <96>;
@@ -462,7 +466,10 @@ counter {
 		status = "okay";
 	};
 	pwm {
-		/* PWM output on pin 7 of the expansion connector (CN8.7) using TIM3_CH4 func */
+		/*
+		 * CH4 on PB1 = CN8.7;
+		 * CH3 on PB0 = CN8.10 is possible (conflicting with usart1)
+		 */
 		pinctrl-0 = <&pwm3_pins_a>;
 		pinctrl-1 = <&pwm3_sleep_pins_a>;
 		pinctrl-names = "default", "sleep";
@@ -481,7 +488,10 @@ counter {
 		status = "okay";
 	};
 	pwm {
-		/* PWM output on pin 31 of the expansion connector (CN8.31) using TIM4_CH2 func */
+		/*
+		 * CH2 on PD13 = CN8.31;
+		 * CH1 on PD12 = CN8.28 is possible (conflicting with &i2c1)
+		 */
 		pinctrl-0 = <&pwm4_pins_a>;
 		pinctrl-1 = <&pwm4_sleep_pins_a>;
 		pinctrl-names = "default", "sleep";
@@ -500,7 +510,12 @@ counter {
 		status = "okay";
 	};
 	pwm {
-		/* PWM output on pin 32 of the expansion connector (CN8.32) using TIM8_CH3 func */
+		/*
+		 * CH3 on PE5 = CN8.32
+		 * CH1N on PA7 = CN8.36 is possible (conflicting with &usart1)
+		 * CH2N on PB0 = CN8.10 is possible (conflicting with &usart1)
+		 * CH3N on PB1 = CN8.7 is possible (conflicting with &timers3)
+		 */
 		pinctrl-0 = <&pwm8_pins_a>;
 		pinctrl-1 = <&pwm8_sleep_pins_a>;
 		pinctrl-names = "default", "sleep";
@@ -517,7 +532,7 @@ counter {
 		status = "okay";
 	};
 	pwm {
-		/* PWM output on pin 33 of the expansion connector (CN8.33) using TIM14_CH1 func */
+		/* CH1 on PF9 = CN8.33 (alternatively on PA7 = CN8.36 (conflicting with &usart1)) */
 		pinctrl-0 = <&pwm14_pins_a>;
 		pinctrl-1 = <&pwm14_sleep_pins_a>;
 		pinctrl-names = "default", "sleep";
@@ -529,6 +544,7 @@ timer@13 {
 };
 
 &uart4 {
+	/* Accessible via micro USB ST-LINK USB (CN10) */
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
@@ -540,6 +556,7 @@ &uart4 {
 
 &uart8 {
 	pinctrl-names = "default", "sleep", "idle";
+	/* TX on PE1 = CN8.37, RX on PF9 = CN8.33 */
 	pinctrl-0 = <&uart8_pins_a>;
 	pinctrl-1 = <&uart8_sleep_pins_a>;
 	pinctrl-2 = <&uart8_idle_pins_a>;
@@ -550,6 +567,7 @@ &uart8 {
 
 &usart1 {
 	pinctrl-names = "default", "sleep", "idle";
+	/* TX on PC0 = CN8.8, RX on PB0 = CN8.10, RTS on PC2 = CN8.11, CTS on PA7 = CN8.36 */
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-1 = <&usart1_sleep_pins_a>;
 	pinctrl-2 = <&usart1_idle_pins_a>;
@@ -560,6 +578,7 @@ &usart1 {
 /* Bluetooth */
 &usart2 {
 	pinctrl-names = "default", "sleep", "idle";
+	/* TX on PH12, RX on PD15, RTS on PD4, CTS on PE11 */
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_sleep_pins_a>;
 	pinctrl-2 = <&usart2_idle_pins_a>;
@@ -589,6 +608,7 @@ hub@1 {
 };
 
 &usbotg_hs {
+	/* USB Type-C DRP (CN7) */
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
 	usb-role-switch;

base-commit: 365af1b5923351c59517a79d14d0b4543b79ce3b
-- 
2.47.3


