Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691EDC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7XavjMgpd4cbNnTMQ71GP+z5iUkDeJXy8uih3FGSIE=; b=BnCqCnWTcw9Ln5SKRUGWd9fk0e
	PIue3CZC1NxLZ0DP/rfJTvZJCROw/Y7o0XuhGXDA356joyZbM0Q5f8/EeAfBUDe/bUFNJ6cMTCiPu
	OT2722Mr8tVpMcspYi2tlIKhPIfKC5toVVkevj54YrK0P142Yv24zo8BX/aB/IYk5+kcA34ULMTyd
	AO9AbBLOxN519fvWQW2hUw1cEZO9ckKsbvbZw8XElDpAJEJwC9yTt2PhvRUXrTk6JB7G4qDREISS9
	E4+BpqooLQkplRfhl1zkbwvtmugD6oqZ53Vji7YBech2BmpTxkAY+x8ZY2/T/wvqSqFI7gzPeByoC
	u2I9J64w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSaS-00000009Pas-0E2n;
	Tue, 18 Feb 2025 18:44:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSU4-00000009Nvy-1DZr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:38:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-0000Gx-Ox; Tue, 18 Feb 2025 19:38:14 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-001dam-1L;
	Tue, 18 Feb 2025 19:38:14 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-00AL9G-14;
	Tue, 18 Feb 2025 19:38:14 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 18 Feb 2025 19:38:16 +0100
Subject: [PATCH v2 4/6] arm64: dts: imx8mp-skov: describe I2C bus recovery
 for all controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-skov-imx8mp-new-boards-v2-4-4040379742ea@pengutronix.de>
References: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
In-Reply-To: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_103816_345035_C322DAAD 
X-CRM114-Status: GOOD (  12.20  )
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

I2C bus recovery can be used to recover when SCL/SDA are stuck low.
To be able to use it, add the necessary GPIO and pinctrl entries.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 48 ++++++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index b1dfd8eb7062ae5e736146458833a11c4d37eb7b..63742d88c3c69276f19c508779a3dbd572ed2c42 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -240,8 +240,11 @@ &flexcan2 {
 
 &i2c1 {
 	clock-frequency = <100000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
@@ -332,14 +335,20 @@ reg_nvcc_sd2: LDO5 {
 };
 
 &i2c2 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 };
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	i2c_rtc: rtc@51 {
@@ -354,8 +363,11 @@ i2c_rtc: rtc@51 {
 
 &i2c4 {
 	clock-frequency = <380000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	switch: switch@5f {
@@ -567,6 +579,13 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14			0x400001c2
+			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15			0x400001c2
+		>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL				0x400001c2
@@ -574,6 +593,13 @@ MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16			0x400001c2
+			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17			0x400001c2
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL				0x400001c2
@@ -581,6 +607,13 @@ MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18			0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19			0x400001c2
+		>;
+	};
+
 	pinctrl_i2c4: i2c4grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL				0x400001c3
@@ -588,6 +621,13 @@ MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA				0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20			0x400001c3
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21			0x400001c3
+		>;
+	};
+
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03			0x41

-- 
2.39.5


