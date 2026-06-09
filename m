Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B67CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f81Q9VttIv3Y7P46FVHwR5ozfyxMAvh7J1yN10j5Yvg=; b=rTEH7Ag4qLCdme52bepvnyMS5k
	wr5FkC3Zyrw2zEyWDhFoaADWkjjz3VL/c6GxyONIG8zZyH2gLHssbMl43xgmOwRPz0onh6GK+/YlT
	a83iSjfDOY67zk3nbEjAVI/Gv7f8wqS4fqI6HITukcVA9V+DTL+XhZMfVE/ukoeurWhC6DUZO+JiR
	EYJJGgcHu+QoUwJKI5uwcWOck9PnatYiDZcdup3n8LLCJ++MZt2ma3EDX/OTFpCHpE/jA4vxBj8Al
	JswCj8LOJtLvq31ovNM+fCYAbPKKpXBv5OIJ3Hfnw2G5p4WY539/bNsDoz/9UGhTeI2wmoc2giXIY
	hhVKbnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsOA-000000058qW-30ep;
	Tue, 09 Jun 2026 09:04:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsO6-000000058nL-25D1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:04:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490ac357c55so57835215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995885; x=1781600685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f81Q9VttIv3Y7P46FVHwR5ozfyxMAvh7J1yN10j5Yvg=;
        b=KBwfv0TkhBWcIZCipkUdWqQEMRzSAvU/6DhVWYsmiRnRXQ7REvaY2rQb2HSOwGRtUi
         NRG1LL4Bak5w5CvLRA80Lb+j6kiMv1zMZ43deirX97js5QZe2tefGLBl3VGAPhuNdIoR
         2spHtHVS+RSGb7nK9FwBncV7ixlajJFyjubAgdwrB3c2w7tdeyDkJ3PJlYGWTEbMj1Jy
         bxa3rnxIXJbbwCSUfHNMNgwv6wdghdW/mKlPaSkP//MmaoSDK98xFi9DwVGtaZQdqljs
         A+XsScnWa6U/5THOH4c/ZcQxo+u7/TNidNgRtTUiO65ynljJFz1aiHAghknN5NXviIri
         WnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995885; x=1781600685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f81Q9VttIv3Y7P46FVHwR5ozfyxMAvh7J1yN10j5Yvg=;
        b=JjJq05CCPvh0rHteZn74a4WAdk9aqJo+spT7vXYJsHlkvu+Prz3IM3Y7teLanQL/EC
         4O9h1QcWC5KUZCP5Tl3vULElBUemNaNeL3tBbI1lTcuuO6uxiwLirrAc0DKoeUCjtS+V
         emUWUFXHbXml8AK8lBs2uUZ4Yseer9XPqzVpxgys5BftCVG/+pNyirM48yr6lWKc09Fh
         VPk4pHVFIKLcVlouHiGdahvTvAV3zWHgLl0OKSE6eGIJu7njzMfbyuB6+ZsHtdFRVm7E
         OEpS+/QFqP+ICuDgYdCGtHR27OhykG6g1nP4+sbQnRzE7I43ODw4oQ7eE8EwYYsK+9qK
         +dVw==
X-Forwarded-Encrypted: i=1; AFNElJ/0Se5Dtldlh6HzZ87u3XMBboC3G7zxHeXczXcw/T2Po2xTM8DL9F57/ZzHzCP+W/KPOVh6vW6Vmy3dJveW9a2v@lists.infradead.org
X-Gm-Message-State: AOJu0Ywej63IiOKdGqGYBhUnr/nHNDcscKeoiDUKBLaXk+scW7x5QxVV
	KopB4QPdO8hC42UFcr5x6GlbeXjJXYinwLJBy1g+Krg5UWAMsTJcvW+c
X-Gm-Gg: Acq92OFca5LY8duRnUWtaFEZRnSe/feqb3kBuLtJHu/TdusIVjyKqTy0NnjPTHwgW+U
	ql5sXnmGeR4I/ul6R94odxBNLCuuBOAscvhf5g7oAVIj7i262CJz5NehDbT0kRTFYF0qjpdDePG
	oKL1wEq5JNLsVlEefFiAJhWd/4HkdU3HD5cx0mVRQREd6bRAfVTYl99Dc1yX0zcO02P8NQVYfnc
	VL6BHhvYTPyrW/Cshh2kRmtrRP1+vy6O8xW7cz5+hDl74vmK7uzzwX5wJlJJRx1ttqPC7JHAqcI
	vdW3SIPJ23P4DmYx5gcTMzyHrVB9DVLtm6nzzSjoAqgXFaO0H1fDH+J/4ntL1U5ftI+5OkzNHYJ
	tNlp5p00yeSHxHhxAGLcl0H1BRzar0qgu0DVMIvyfCeZraJdrAIw8CTLBsv345u97cT3y+CLNug
	iBmOR9xoIzfc0SF4rw5c0aTu8qSYhU4mLVmMYEYTwxnJkafK6/7zBayx+2peBKg3SbWYkeGY1Lc
	FgnziZPLc8UeqjNwUQqXRniyqbOHdY4sBBdgVmXbzenwkJ1
X-Received: by 2002:a05:600c:3e0a:b0:490:b724:dbe3 with SMTP id 5b1f17b1804b1-490c25a07c4mr299394235e9.8.1780995884614;
        Tue, 09 Jun 2026 02:04:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm64910543f8f.23.2026.06.09.02.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:04:44 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v4 2/3] arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
Date: Tue,  9 Jun 2026 11:04:37 +0200
Message-ID: <85af11e85dbb7cf5097d7c0ee567272ff6e87ec5.1780995737.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780995737.git.stefano.r@variscite.com>
References: <cover.1780995737.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_020446_686932_26E65043 
X-CRM114-Status: GOOD (  17.47  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite DART-MX8MP system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX8M Plus MPU processor
- Up to 8GB of LPDDR4 memory
- Up to 128GB of eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver
- Codec audio WM8904
- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/dart-mx8m-plus/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - Fixed wrong som eth phy address

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio

 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++++++++
 1 file changed, 476 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi
new file mode 100644
index 000000000000..a647a2e0ab94
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi
@@ -0,0 +1,476 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-MX8M-PLUS
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/dart-mx8m-plus/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx8mp.dtsi"
+
+/ {
+	model = "Variscite DART-MX8M-PLUS Module";
+	compatible = "variscite,var-dart-mx8mp", "fsl,imx8mp";
+
+	reg_audio_supply: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	sound-wm8904 {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 8 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2>;
+};
+
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_audio_supply>;
+		CPVDD-supply = <&reg_audio_supply>;
+		DBVDD-supply = <&reg_audio_supply>;
+		DCVDD-supply = <&reg_audio_supply>;
+		MICVDD-supply = <&reg_audio_supply>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+	};
+
+	pca9450: pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2: LDO2 {
+				regulator-name = "LDO2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3: LDO3 {
+				regulator-name = "LDO3";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
+	};
+};
+
+&mu2 {
+	status = "okay";
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <11536000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
+		<&clk IMX8MP_CLK_DUMMY>,
+		<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
+		<&clk IMX8MP_CLK_DUMMY>,
+		<&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* BT module */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>, <&pinctrl_bt>;
+	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+/* WIFI */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	keep-power-in-suspend;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_bt: btgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0xc0
+			MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09				0xc0
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x16
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x16
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x16
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x16
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
+			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20					0x10
+			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11				0x150
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14				0x1c2
+			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15				0x1c2
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x1c0
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC			0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK			0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00			0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00			0xd6
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK			0xd6
+			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI3_RX_SYNC			0xd6
+			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI3_RX_BCLK			0xd6
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__UART4_DCE_RX				0x140
+			MX8MP_IOMUXC_ECSPI2_MOSI__UART4_DCE_TX				0x140
+			MX8MP_IOMUXC_ECSPI2_MISO__UART4_DCE_CTS				0x140
+			MX8MP_IOMUXC_ECSPI2_SS0__UART4_DCE_RTS				0x140
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK				0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD				0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0				0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1				0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2				0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3				0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK				0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD				0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0				0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1				0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2				0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3				0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK				0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD				0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0				0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1				0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2				0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3				0x1d6
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD				0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0				0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1				0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2				0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3				0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4				0x1d0
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5				0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6				0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7				0x1d0
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE				0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD				0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0				0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1				0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2				0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3				0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4				0x1d4
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5				0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6				0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7				0x1d4
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE				0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD				0x1d6
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0				0x1d6
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1				0x1d6
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2				0x1d6
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3				0x1d6
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4				0x1d6
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5				0x1d6
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6				0x1d6
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7				0x1d6
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE				0x196
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B				0xc6
+		>;
+	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07				0xc0
+			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08				0xc0
+		>;
+	};
+};
-- 
2.47.3


