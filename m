Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C1FD4414B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuumiphBgYBOrLZgQuT6uPQn7HVAyln1yN7ZHsl2d6Q=; b=PmObn+AXTXXoQGHmUEdz67IGGN
	0YPXVh4Lxtsg5ej7cW/DAX2nyYcum79hn7iy3QwX+rHbqxSsPYnMG/5ZqbLmg2EPVopNWTzHhgWWe
	xCUr6+vK+2Wnyz0d3sFVBB7/o3BjywTc2Dk9eSTNl7G7eatPsGsQ2gscJ7g7z3Hhiub/jSxut2hWx
	cToroK3M5fh06GFaVsaYTCqkCu60xday0A4eUlbOR09NequWNERrFj4ky8EOm8J5soSfkM/SiNs4s
	LeQuAW7xlJRF1di9D7wmcSECEJBaukmo55yU2uU9AJu7lL3h9vzn3HpXEHjgB4Ny0Fhgft3BQbVMh
	xafVfpMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMcA-0000000CFh6-2Dcq;
	Tue, 19 Nov 2024 11:41:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMVo-0000000CEIK-2O1W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 11:35:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVn-0004kz-BB
	for linux-arm-kernel@lists.infradead.org; Tue, 19 Nov 2024 12:35:15 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVm-001Ygm-1r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 12:35:14 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 455CC37707F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 11:35:14 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 35FA537703A;
	Tue, 19 Nov 2024 11:35:10 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 7f537fa4;
	Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 19 Nov 2024 12:35:02 +0100
Subject: [PATCH 5/6] ARM: dts: stm32: lxa-tac: move adc and gpio{e,g} to
 gen{1,2} boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241119-lxa-tac-gen3-v1-5-e0ab0a369372@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8181; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=ig6BCsBKQFpCyEcF4tbkV8vNcd8eG21E4UWiPLejmAI=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnPHfqgq8h/6hnxm9tk1vEodwEkJjOstnJNXwln
 mnmbmG0VOOJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZzx36gAKCRAoOKI+ei28
 b5txCACBj29Dl2shsj6ZcG8uimwUYO5yzkpXuMyA7dBVaefsl1aj9EgkgmY61p7Bn55HM/4A3qJ
 a+2mCcOVgH7djUaaPqp8O4GSeMwdrajCGRyo9jb8EChsACL8apQn3X3oPizrqOGQK6eO1pGQE4b
 YfyUS19YqvWsQzlLTW+GqX3m0Rs8Dvg6clKCLErr4n169PzwcgMTyWaAAmj/VE4EmcpCisuDs5c
 eB7S/8tsd5rlSIQSFLgnHh5Qdzr+/tAHDMy9lMdJF6Zig358xL6ZXHp7+VCoeUsGb6o5dtcSADa
 wMY4WQrQrmHzyXcgn76S1/ggInOFB2+l4q9GMO1qZkuHrMjk
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_033516_760400_19408E60 
X-CRM114-Status: GOOD (  14.91  )
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

From: Leonard Göhrs <l.goehrs@pengutronix.de>

This is a preparation patch in order to add lxa-tac generation 3
board.

As the gen3 board has a different adc and gpio{e,g} setups, move these
from the stm32mp15xc-lxa-tac.dtsi to the gen{1,2}.dts files.

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts | 84 +++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts | 84 +++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi     | 84 -----------------------
 3 files changed, 168 insertions(+), 84 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts b/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts
index 81f254fb88b0aba915696d5b14e9a001baa66e67..e72e42eb0eb40efe480ae2c660bc6d13e49b091e 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts
@@ -35,6 +35,76 @@ reg_iobus_12v: regulator-iobus-12v {
 	};
 };
 
+&adc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&adc1_ain_pins_a>;
+	vdd-supply = <&vdd>;
+	vdda-supply = <&vdda>;
+	vref-supply = <&vrefbuf>;
+	status = "okay";
+
+	adc1: adc@0 {
+		st,adc-channels = <0 1 2 5 9 10 13 15>;
+		st,min-sample-time-nsecs = <5000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		channel@0 {
+			reg = <0>;
+			label = "HOST_2_CURR_FB";
+		};
+
+		channel@1 {
+			reg = <1>;
+			label = "HOST_3_CURR_FB";
+		};
+
+		channel@2 {
+			reg = <2>;
+			label = "OUT_0_FB";
+		};
+
+		channel@5 {
+			reg = <5>;
+			label = "IOBUS_CURR_FB";
+		};
+
+		channel@9 {
+			reg = <9>;
+			label = "IOBUS_VOLT_FB";
+		};
+
+		channel@10 {
+			reg = <10>;
+			label = "OUT_1_FB";
+		};
+
+		channel@13 {
+			reg = <13>;
+			label = "HOST_CURR_FB";
+		};
+
+		channel@15 {
+			reg = <15>;
+			label = "HOST_1_CURR_FB";
+		};
+	};
+
+	adc2: adc@100 {
+		st,adc-channels = <12>;
+		st,min-sample-time-nsecs = <500000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		channel@12 {
+			reg = <12>;
+			label = "TEMP_INTERNAL";
+		};
+	};
+};
+
 &gpioa {
 	gpio-line-names = "", "", "STACK_CS2", "", "STACK_CS3", /*  0 */
 	"ETH_GPIO1", "ETH_INT", "", "", "",                     /*  5 */
@@ -48,6 +118,20 @@ &gpioc {
 	"", "";                                        /* 10 */
 };
 
+&gpioe {
+	gpio-line-names = "TP35", "", "", "", "CAN_1_120R", /*  0 */
+	"", "", "USER_BTN2", "TP48", "UART_TX_EN",          /*  5 */
+	"UART_RX_EN", "TP24", "", "TP25", "TP26",           /* 10 */
+	"TP27";                                             /* 15 */
+};
+
+&gpiog {
+	gpio-line-names = "ETH_RESET", "", "", "", "",               /*  0 */
+	"IOBUS_FLT_FB", "", "USER_LED2", "ETH1_PPS_A", "CAN_0_120R", /*  5 */
+	"TP49", "", "", "", "",                                      /* 10 */
+	"";                                                          /* 15 */
+};
+
 &gpu {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts b/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts
index 4cc1770316619deb619326ffe3448502e2e4d7be..2ae281725a486a9ef0fd9e52dfdb6a92e319c508 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts
@@ -121,6 +121,76 @@ led-15 {
 	};
 };
 
+&adc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&adc1_ain_pins_a>;
+	vdd-supply = <&vdd>;
+	vdda-supply = <&vdda>;
+	vref-supply = <&vrefbuf>;
+	status = "okay";
+
+	adc1: adc@0 {
+		st,adc-channels = <0 1 2 5 9 10 13 15>;
+		st,min-sample-time-nsecs = <5000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		channel@0 {
+			reg = <0>;
+			label = "HOST_2_CURR_FB";
+		};
+
+		channel@1 {
+			reg = <1>;
+			label = "HOST_3_CURR_FB";
+		};
+
+		channel@2 {
+			reg = <2>;
+			label = "OUT_0_FB";
+		};
+
+		channel@5 {
+			reg = <5>;
+			label = "IOBUS_CURR_FB";
+		};
+
+		channel@9 {
+			reg = <9>;
+			label = "IOBUS_VOLT_FB";
+		};
+
+		channel@10 {
+			reg = <10>;
+			label = "OUT_1_FB";
+		};
+
+		channel@13 {
+			reg = <13>;
+			label = "HOST_CURR_FB";
+		};
+
+		channel@15 {
+			reg = <15>;
+			label = "HOST_1_CURR_FB";
+		};
+	};
+
+	adc2: adc@100 {
+		st,adc-channels = <12>;
+		st,min-sample-time-nsecs = <500000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		channel@12 {
+			reg = <12>;
+			label = "TEMP_INTERNAL";
+		};
+	};
+};
+
 &gpioa {
 	gpio-line-names = "", "", "DUT_PWR_EN", "", "STACK_CS3", /*  0 */
 	"ETH_GPIO1", "ETH_INT", "", "", "",                      /*  5 */
@@ -134,6 +204,20 @@ &gpioc {
 	"", "";                                            /* 10 */
 };
 
+&gpioe {
+	gpio-line-names = "TP35", "", "", "", "CAN_1_120R", /*  0 */
+	"", "", "USER_BTN2", "TP48", "UART_TX_EN",          /*  5 */
+	"UART_RX_EN", "TP24", "", "TP25", "TP26",           /* 10 */
+	"TP27";                                             /* 15 */
+};
+
+&gpiog {
+	gpio-line-names = "ETH_RESET", "", "", "", "",               /*  0 */
+	"IOBUS_FLT_FB", "", "USER_LED2", "ETH1_PPS_A", "CAN_0_120R", /*  5 */
+	"TP49", "", "", "", "",                                      /* 10 */
+	"";                                                          /* 15 */
+};
+
 &gpu {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
index d9b9d611a41e8b4ca35ab771d26fdf9067d73814..be0c355d3105b89d4374d4f6972c7927970f06b1 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
@@ -150,76 +150,6 @@ output-vuart {
 baseboard_eeprom: &sip_eeprom {
 };
 
-&adc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&adc1_ain_pins_a>;
-	vdd-supply = <&vdd>;
-	vdda-supply = <&vdda>;
-	vref-supply = <&vrefbuf>;
-	status = "okay";
-
-	adc1: adc@0 {
-		st,adc-channels = <0 1 2 5 9 10 13 15>;
-		st,min-sample-time-nsecs = <5000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "okay";
-
-		channel@0 {
-			reg = <0>;
-			label = "HOST_2_CURR_FB";
-		};
-
-		channel@1 {
-			reg = <1>;
-			label = "HOST_3_CURR_FB";
-		};
-
-		channel@2 {
-			reg = <2>;
-			label = "OUT_0_FB";
-		};
-
-		channel@5 {
-			reg = <5>;
-			label = "IOBUS_CURR_FB";
-		};
-
-		channel@9 {
-			reg = <9>;
-			label = "IOBUS_VOLT_FB";
-		};
-
-		channel@10 {
-			reg = <10>;
-			label = "OUT_1_FB";
-		};
-
-		channel@13 {
-			reg = <13>;
-			label = "HOST_CURR_FB";
-		};
-
-		channel@15 {
-			reg = <15>;
-			label = "HOST_1_CURR_FB";
-		};
-	};
-
-	adc2: adc@100 {
-		st,adc-channels = <12>;
-		st,min-sample-time-nsecs = <500000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "okay";
-
-		channel@12 {
-			reg = <12>;
-			label = "TEMP_INTERNAL";
-		};
-	};
-};
-
 &crc1 {
 	status = "okay";
 };
@@ -273,13 +203,6 @@ &gpiod {
 	"ETH_LAB_LEDRN";                          /* 15 */
 };
 
-&gpioe {
-	gpio-line-names = "TP35", "", "", "", "CAN_1_120R", /*  0 */
-	"", "", "USER_BTN2", "TP48", "UART_TX_EN",          /*  5 */
-	"UART_RX_EN", "TP24", "", "TP25", "TP26",           /* 10 */
-	"TP27";                                             /* 15 */
-};
-
 &gpiof {
 	gpio-line-names = "TP36", "TP37", "", "", "OLED_CS", /*  0 */
 	"", "", "", "", "",                                  /*  5 */
@@ -287,13 +210,6 @@ &gpiof {
 	"";                                                  /* 15 */
 };
 
-&gpiog {
-	gpio-line-names = "ETH_RESET", "", "", "", "",               /*  0 */
-	"IOBUS_FLT_FB", "", "USER_LED2", "ETH1_PPS_A", "CAN_0_120R", /*  5 */
-	"TP49", "", "", "", "",                                      /* 10 */
-	"";                                                          /* 15 */
-};
-
 &gpioh {
 	gpio-line-names = "", "", "OUT_1", "OUT_0", "OLED_RESET", /*  0 */
 	"", "", "", "", "",                                       /*  5 */

-- 
2.45.2



