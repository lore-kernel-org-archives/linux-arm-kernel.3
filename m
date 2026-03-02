Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AC7EB362F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1VF0DyJM4S3khhBiKZ2azH4+q+TwqF38A3z4Da2QfU=; b=D2BrK9bjIFPItRboNYAEgmyceR
	9VtwgsHTz/bjMAuWh49GuNM5YevrsaHdSmgWkdXGUy9inTr+IC/+ufW1/cmiuG7tg5SGR8PnmUcba
	0h+Xo5/ElDYDdsa6evKmtaKOlNLnb1QcJaN6KnchDKUswBoy/9Dm2Y5rjTTkChQVYR13tnNXYgAtU
	mgXNH0Ik2MruoDBE9ORgnh42BHg0QO28YGOIIjQy+E3F9glkiflO+QXkCOlSI/PuKn7s39IAMu2c3
	oTxYJYf1eew8bAe70brRV1ZG3kh9JBYZUfUw1Gtc5aQP6VD+RrVrAdUSsIVx7LFyNDKh9/rZy2rdS
	27pJXkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8fh-0000000DiE7-1ylo;
	Mon, 02 Mar 2026 19:11:13 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8fc-0000000DiBS-31kd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 19:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=h1VF0DyJM4S3khhBiKZ2azH4+q+TwqF38A3z4Da2QfU=; b=aPp+X/NYXUa8OpoMHOESMRmH00
	DsBNEm8htHaWoOEBWIJ6mAKCKc3NWtHUS6rh2ikLFAfu858mMzhbrCLENhFxpZy5otaN/L9FvljLg
	EZ7/yUX7hbGuTYh8by3+Yw07IPfcU1/Igoc1MsK+jKvH9yMeyEXRiSah9UKtaNxU0E7c=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:59962 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vx8fN-0007Wl-TA; Mon, 02 Mar 2026 14:10:55 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Mon,  2 Mar 2026 14:03:45 -0500
Message-ID: <20260302190953.669325-10-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302190953.669325-1-hugo@hugovil.com>
References: <20260302190953.669325-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH 09/14] ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_111108_855893_0491AE0A 
X-CRM114-Status: GOOD (  22.83  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

The existing configuration of the optional Wifi/Bluetooth module was
copied from the original Variscite kernel tree, and requires custom
scripts to properly configure the Wifi/Bluetooth module.

Add proper support for the optional Wifi and Bluetooth configuration on
VAR-SOM-6UL so that it works out of the box, without any custom scripts.

The SD card interface cannot be used if the Wifi/BT module is in use.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  2 +
 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 18 ++---
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  | 18 +++++
 .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi | 75 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 15 ++++
 .../nxp/imx/imx6ull-var-som-concerto-full.dts | 18 +++++
 .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi | 15 ++++
 7 files changed, 151 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index bc534d0fb1412..c7f24ee63071f 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -339,6 +339,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-tx6ul-0011.dtb \
 	imx6ul-tx6ul-mainboard.dtb \
 	imx6ul-var-som-concerto.dtb \
+	imx6ul-var-som-concerto-full.dtb \
 	imx6ull-14x14-evk.dtb \
 	imx6ull-colibri-aster.dtb \
 	imx6ull-colibri-emmc-aster.dtb \
@@ -377,6 +378,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-tqma6ull2-mba6ulx.dtb \
 	imx6ull-tqma6ull2l-mba6ulx.dtb \
 	imx6ull-var-som-concerto.dtb \
+	imx6ull-var-som-concerto-full.dtb \
 	imx6ull-uti260b.dtb \
 	imx6ulz-14x14-evk.dtb \
 	imx6ulz-bsh-smm-m2.dtb
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
index dd4ecff1eb786..af8c5d2db53d4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
@@ -19,6 +19,14 @@ memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
 
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_gpio_dvfs: reg-gpio-dvfs {
 		compatible = "regulator-gpio";
 		regulator-min-microvolt = <1300000>;
@@ -68,9 +76,6 @@ ethphy0: ethernet-phy@1 {
 };
 
 &iomuxc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_hog>;
-
 	pinctrl_enet1: enet1grp {
 		fsl,pins = <
 			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
@@ -97,13 +102,6 @@ MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
 		>;
 	};
 
-	pinctrl_hog: hoggrp {
-		fsl,pins = <
-			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT Enable */
-			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
-		>;
-	};
-
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
new file mode 100644
index 0000000000000..519250b31db24
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
+ * Variscite SoM mounted on it (6UL CPU variant).
+ *
+ * Copyright 2026 Dimonoff
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-var-som-concerto-common.dtsi"
+#include "imx6ul-var-som-wifi.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
+	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
new file mode 100644
index 0000000000000..6d16ff7909dab
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Support optional Wifi/Bluetooth on Variscite VAR-SOM-6UL module.
+ *
+ * Copyright 2019-2024 Variscite Ltd.
+ * Copyright 2026 Dimonoff
+ */
+
+/ {
+	reg_sd1_vmmc: regulator_sd1_vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VMMC1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <10000>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_brcm_wifi>;
+		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&iomuxc {
+	pinctrl_32k_clk: 32kclkgrp {
+		/*
+		 * For TP option, an additional oscillator is assembled on the
+		 * SOM to provide 32 kHz to the WiFi module. Without TP option,
+		 * this pin is configured to provide the 32 KHz clock to the
+		 * WiFi module.
+		 */
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT	0x03029
+		>;
+	};
+};
+
+&tsc {
+	status = "disabled";
+};
+
+/* Bluetooth UART */
+&uart2 {
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_brcm_bt>;
+		shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&reg_3p3v>;
+		vddio-supply = <&reg_3p3v>;
+	};
+};
+
+&usdhc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_32k_clk>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>;
+	no-1-8-v;
+	non-removable;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	vmmc-supply = <&reg_sd1_vmmc>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac"; /* LWB option: Sterling LWB5 */
+		reg = <1>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
index 35a0c0b3603fd..b4e6a9316dd81 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
@@ -15,3 +15,18 @@ / {
 	model = "Variscite VAR-SOM-6UL module";
 	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
 };
+
+&iomuxc {
+	pinctrl_brcm_bt: brcm-bt-grp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
+		>;
+	};
+
+	pinctrl_brcm_wifi: brcm-wifi-grp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
+			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
new file mode 100644
index 0000000000000..7c0e313603630
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
+ * Variscite SoM mounted on it (6ULL CPU variant).
+ *
+ * Copyright 2026 Dimonoff
+ */
+
+/dts-v1/;
+
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-var-som-concerto-common.dtsi"
+#include "imx6ul-var-som-wifi.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
+	compatible = "variscite,mx6ullconcerto", "variscite,var-som-imx6ull", "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
index ba482a97623b2..3067ff6a1bc74 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
@@ -13,3 +13,18 @@ / {
 	model = "Variscite VAR-SOM-6UL module";
 	compatible = "variscite,var-som-imx6ull", "fsl,imx6ull";
 };
+
+&iomuxc {
+	pinctrl_brcm_bt: brcm-bt-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
+		>;
+	};
+
+	pinctrl_brcm_wifi: brcm-wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
+		>;
+	};
+};
-- 
2.47.3


