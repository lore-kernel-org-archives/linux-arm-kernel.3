Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4131CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lq7phhx4bczB494Lg9PjjonRoJZ1VHLmVWkPOEK+QsQ=; b=yWMM8lUoIFG3KF0bxSRLXArBOP
	A+eMCyhHTq2Ro2Hiq1bknpCvd3heDo3lpNlxjX2RpFqSZF/aztpw4LSlJYbHkZdozdcAv91l8CA9B
	WiFcgvcpJp5+0siuJqCPKyOM4l32BjMdumL06nXqCIbPLhDKrGFMWW5TiuoCzX4ZZibjjZ8YCrS/l
	3nhWBUYcMzjURqf3L2jkU/Vb+xLuue+8NFWjCL7+cVrIGy51znQgOGkGKTC0PHQtgq+mWjQey/fyM
	Zj2GQTuqA3tqTrg0fWalD3/bsXVINGink+cMq7jAEjBMHBxpHJjsEKjRqkvngPIjaPuyCZqkyog4I
	tP0m9tFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjO4-0000000DBZD-1m2s;
	Tue, 14 Jul 2026 20:05:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjNz-0000000DBXE-1lP8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:05:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso2304025f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784059545; x=1784664345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq7phhx4bczB494Lg9PjjonRoJZ1VHLmVWkPOEK+QsQ=;
        b=Aya5HszMOHmQSCWvy39l3RESvScrjRXVard3C2vR6CifBxlrYTedvQZUc/o6UDL9Hy
         UCTiwqQN+eHWpyvlIkCZBAozZTJnIewk7ZAVHVuzXmfwQD/Tf8+kBxIp+MvdxikULiW4
         ufNh0OZdPiPjLYkQkD/aCkEUg88k+ct0PjJKyUFbJwhJ7PS29nYur+wuQEjmOJ4Fsdeg
         Lq4mCWNd8oKsVIpj67KXbalI0WlcakanpbqA9sXQ59WC7Hpb7S3vMvox+KwF532jJ8uD
         7+Sh+J4bmiAj8goBp2WDrVtZHXcqqkMpY3lFjb43ELAKIb9jL4WMhnbxCLHrcPlBcChX
         oYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784059545; x=1784664345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq7phhx4bczB494Lg9PjjonRoJZ1VHLmVWkPOEK+QsQ=;
        b=ju/O8V/OYbwRlPcU8EF4QqYoiDCOXBCO5Et7ANzpFIGaZl9E6XyWXRILK1j4bPnPg7
         Rcd8ZOvHC3xkroSB63ZoKF2KYPBlJPOjFBios2McDCvQ3Jfo42L6V71cstmG9oOsMSVa
         PfhGYDyFLh1lfiEJy8ndP5UAoX1VnrzKl/xm502esfR6ooqvEQnrkzDPpx2woirS0KtB
         lRnq32F8PkS+A94jjez+JE9U1M6Ym7SkHu86/RyRO0xvbn+HEpcLrw5B3KEt79KLJUdz
         mTDnKpu36K1CorXk6s/huv+dURcGQ5brLnLIbPLTJiarfilGYQBHxlYQlqRB7pTRoSlJ
         WpxQ==
X-Forwarded-Encrypted: i=1; AHgh+RotdZYVhMAJOqZI5s1zMTmi49vApFM8+jCRJrtRc/gGpXgbDOk6kPd788lH1HwjHKlBKJYJ7vgVL1Vn/F4QYZUH@lists.infradead.org
X-Gm-Message-State: AOJu0YyPRc2RRuI4lkzisbJvE5OI1KMoNfc+eU9ggZ+8mPgA2MrHCVgL
	xOSPNvGkJfxZ+P93T5fz2lfpPnjX9eWDeOIi7LDSIU8usS+lD16pz5cC
X-Gm-Gg: AfdE7cl86e8t7EWAyjiUaYlpJqAMlviRX42KZ2sbHt0W0GUd7/NyjvAvvKhZOcKRAyn
	0RA+XhBpK5v64I0q9hy3UEwI9bk+a1RV3oozeCZgHzLvcLOZZmj8fla7XXeoHks+CqUowz32GPM
	yfwiKYH8l4RNjEFAQjSmUiZer/WbQucbDrF6X55kYMBIegcBFI1Yp8sV9ix4m6mCghuqhL9A+YQ
	mVTnxaC8zO4kJtHJZwo+YiGb5e5FOyEqcDjRa826NOAYYT4041P5cjhrJDIEQkGUZDfu8JQvqPE
	4a7O4AntBx0wNhoe/+W9jOBJbbcER6B0kDVyfci/sAIpaCUeVB1BM6tbsDdO6KQx4ZbYqZrfYzD
	ileCOHPJHq5jFM7o1pFGVHhOkEAybduK3toM6xTjVElxTUMO5h0L34wEYOo6LZ/GDQ3qVTJjboH
	gXtA6HwRHLIT3ElciWxbn/j4ggKasK1of2Vj5FR/0GCw2CWw==
X-Received: by 2002:a05:600c:1d16:b0:495:3b2f:df04 with SMTP id 5b1f17b1804b1-4953b2fe00emr11940425e9.34.1784059545236;
        Tue, 14 Jul 2026 13:05:45 -0700 (PDT)
Received: from GLaDOS.station ([93.66.5.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm11669797f8f.22.2026.07.14.13.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:05:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
Date: Tue, 14 Jul 2026 22:05:20 +0200
Message-ID: <f373059af209ed7ce8e63988066e730736e06e6e.1784059139.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784059139.git.stefano.r@variscite.com>
References: <cover.1784059139.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_130547_626492_CCE16D38 
X-CRM114-Status: GOOD (  17.76  )
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

Add device tree support for the Variscite VAR-SOM-MX8 QuadMax
system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX8 QuadMax MPU processor
- Up to 8GB of LPDDR4 memory
- Up to 128GB of eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver
- Codec audio WM8904
- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quadplus/var-som-mx8/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Added non-removable property to usdhc3
 - Removed unused fec gpio pinctrl

 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 529 ++++++++++++++++++
 1 file changed, 529 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
new file mode 100644
index 000000000000..e805c51eb27d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
@@ -0,0 +1,529 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite VAR-SOM-MX8
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quadplus/var-som-mx8/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx8qm.dtsi"
+
+/ {
+	model = "Variscite i.MX8QM VAR-SOM-MX8 Module";
+	compatible = "variscite,var-som-imx8qm", "fsl,imx8qm";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0 0x40000000>;
+	};
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
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vdev0vring0: memory@90000000 {
+			reg = <0 0x90000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@90008000 {
+			reg = <0 0x90008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@90010000 {
+			reg = <0 0x90010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@90018000 {
+			reg = <0 0x90018000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table0: memory@900ff000 {
+			reg = <0 0x900ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev2vring0: memory@90100000 {
+			reg = <0 0x90100000 0 0x8000>;
+			no-map;
+		};
+
+		vdev2vring1: memory@90108000 {
+			reg = <0 0x90108000 0 0x8000>;
+			no-map;
+		};
+
+		vdev3vring0: memory@90110000 {
+			reg = <0 0x90110000 0 0x8000>;
+			no-map;
+		};
+
+		vdev3vring1: memory@90118000 {
+			reg = <0 0x90118000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table1: memory@901ff000 {
+			reg = <0 0x901ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: memory@90400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90400000 0 0x100000>;
+			no-map;
+		};
+
+		dsp_reserved: memory@92400000 {
+			reg = <0 0x92400000 0 0x1000000>;
+			no-map;
+		};
+
+		dsp_vdev0vring0: memory@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: memory@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: memory@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+		};
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+			reusable;
+		};
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
+			sound-dai = <&esai0>;
+		};
+	};
+};
+
+&acm {
+	status = "okay";
+};
+
+&asrc0 {
+	fsl,asrc-rate  = <48000>;
+	status = "okay";
+};
+
+&asrc1 {
+	fsl,asrc-rate = <48000>;
+	status = "okay";
+};
+
+&cm41_intmux {
+	status = "okay";
+};
+
+&esai0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_esai0>;
+	#sound-dai-cells = <0>;
+	assigned-clocks = <&acm IMX_ADMA_ACM_ESAI0_MCLK_SEL>,
+			<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+			<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+			<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+			<&esai0_lpcg 0>;
+	assigned-clock-parents = <&aud_pll_div0_lpcg 0>;
+	assigned-clock-rates = <0>, <786432000>, <49152000>, <24576000>, <49152000>;
+	status = "okay";
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
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
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <4>;
+			reset-gpios = <&lsio_gpio2 28 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <20000>;
+			vddio-supply = <&reg_phy_vddio>;
+		};
+	};
+};
+
+&gpio0_mipi_csi0 {
+	status = "disabled";
+};
+
+&gpio0_mipi_csi1 {
+	status = "disabled";
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c0>;
+	status = "okay";
+
+	wm8904: codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&mclkout0_lpcg 0>;
+		clock-names = "mclk";
+		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+				<&mclkout0_lpcg 0>;
+		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
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
+};
+
+/* Bluetooth */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart1>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&mu_m0{
+	status = "okay";
+};
+
+&mu1_m0{
+	status = "okay";
+};
+
+&mu2_m0{
+	status = "okay";
+};
+
+&rtc {
+	status = "disabled";
+};
+
+&sai6 {
+	assigned-clocks = <&acm IMX_ADMA_ACM_SAI6_MCLK_SEL>,
+			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
+			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
+			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
+			<&sai6_lpcg 0>;
+	assigned-clock-parents = <&aud_pll_div1_lpcg 0>;
+	assigned-clock-rates = <0>, <786432000>, <98304000>, <24576000>, <98304000>;
+	fsl,sai-asynchronous;
+	status = "okay";
+};
+
+&sai7 {
+	assigned-clocks = <&acm IMX_ADMA_ACM_SAI7_MCLK_SEL>,
+			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
+			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
+			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
+			<&sai7_lpcg 0>;
+	assigned-clock-parents = <&aud_pll_div1_lpcg 0>;
+	assigned-clock-rates = <0>, <786432000>, <98304000>, <24576000>, <98304000>;
+	fsl,sai-asynchronous;
+	status = "okay";
+};
+
+&thermal_zones {
+	pmic-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;
+		trips {
+			pmic_alert0: trip0 {
+				temperature = <110000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+			pmic_crit0: trip1 {
+				temperature = <125000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+		cooling-maps {
+			map0 {
+				trip = <&pmic_alert0>;
+				cooling-device = <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
+/* eMMC */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+/* WIFI */
+&usdhc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_wifi>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_esai0: esai0grp {
+		fsl,pins = <
+			IMX8QM_ESAI0_FSR_AUD_ESAI0_FSR				0xc6000040
+			IMX8QM_ESAI0_FST_AUD_ESAI0_FST				0xc6000040
+			IMX8QM_ESAI0_SCKR_AUD_ESAI0_SCKR			0xc6000040
+			IMX8QM_ESAI0_SCKT_AUD_ESAI0_SCKT			0xc6000040
+			IMX8QM_ESAI0_TX0_AUD_ESAI0_TX0				0xc6000040
+			IMX8QM_ESAI0_TX5_RX0_AUD_ESAI0_TX5_RX0			0xc6000040
+			IMX8QM_MCLK_OUT0_AUD_ESAI0_TX_HF_CLK			0xc600004c
+		>;
+	};
+
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			IMX8QM_ENET0_MDC_CONN_ENET0_MDC				0x06000048
+			IMX8QM_ENET0_MDIO_CONN_ENET0_MDIO			0x06000048
+			IMX8QM_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL	0x06000048
+			IMX8QM_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC		0x06000048
+			IMX8QM_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0		0x06000048
+			IMX8QM_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1		0x06000048
+			IMX8QM_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2		0x06000048
+			IMX8QM_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3		0x06000048
+			IMX8QM_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC		0x06000048
+			IMX8QM_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CTL	0x06000048
+			IMX8QM_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0		0x06000048
+			IMX8QM_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1		0x06000048
+			IMX8QM_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2		0x06000048
+			IMX8QM_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3		0x06000048
+			IMX8QM_ESAI0_TX2_RX3_LSIO_GPIO2_IO28			0x06000028
+		>;
+	};
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			IMX8QM_ESAI1_FSR_LSIO_GPIO2_IO04			0x00000041
+			IMX8QM_ESAI1_FST_LSIO_GPIO2_IO05			0x00000041
+			IMX8QM_ESAI1_SCKR_LSIO_GPIO2_IO06			0x00000041
+			IMX8QM_ESAI1_SCKT_LSIO_GPIO2_IO07			0x00000041
+			IMX8QM_SPDIF0_EXT_CLK_LSIO_GPIO2_IO16			0x00000041
+		>;
+	};
+
+	pinctrl_i2c0: i2c0grp {
+		fsl,pins = <
+			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0xc6000020
+			IMX8QM_HDMI_TX0_TS_SDA_DMA_I2C0_SDA			0xc6000020
+		>;
+	};
+
+	pinctrl_lpuart1: lpuart1grp {
+		fsl,pins = <
+			IMX8QM_UART1_RX_DMA_UART1_RX				0x06000020
+			IMX8QM_UART1_TX_DMA_UART1_TX				0x06000020
+			IMX8QM_UART1_CTS_B_DMA_UART1_RTS_B			0x06000020
+			IMX8QM_UART1_RTS_B_DMA_UART1_CTS_B			0x06000020
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK				0x06000041
+			IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD				0x00000021
+			IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0			0x00000021
+			IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1			0x00000021
+			IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2			0x00000021
+			IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3			0x00000021
+			IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4			0x00000021
+			IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5			0x00000021
+			IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6			0x00000021
+			IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7			0x00000021
+			IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE			0x06000041
+			IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B			0x00000021
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK				0x06000040
+			IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD				0x00000020
+			IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0			0x00000020
+			IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1			0x00000020
+			IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2			0x00000020
+			IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3			0x00000020
+			IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4			0x00000020
+			IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5			0x00000020
+			IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6			0x00000020
+			IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7			0x00000020
+			IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE			0x06000040
+			IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B			0x00000020
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK				0x06000040
+			IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD				0x00000020
+			IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0			0x00000020
+			IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1			0x00000020
+			IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2			0x00000020
+			IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3			0x00000020
+			IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4			0x00000020
+			IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5			0x00000020
+			IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6			0x00000020
+			IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7			0x00000020
+			IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE			0x06000040
+			IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B			0x00000020
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			IMX8QM_USDHC2_CLK_CONN_USDHC2_CLK			0x06000041
+			IMX8QM_USDHC2_CMD_CONN_USDHC2_CMD			0x00000021
+			IMX8QM_USDHC2_DATA0_CONN_USDHC2_DATA0			0x00000021
+			IMX8QM_USDHC2_DATA1_CONN_USDHC2_DATA1			0x00000021
+			IMX8QM_USDHC2_DATA2_CONN_USDHC2_DATA2			0x00000021
+			IMX8QM_USDHC2_DATA3_CONN_USDHC2_DATA3			0x00000021
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3100mhzgrp {
+		fsl,pins = <
+			IMX8QM_USDHC2_CLK_CONN_USDHC2_CLK			0x06000040
+			IMX8QM_USDHC2_CMD_CONN_USDHC2_CMD			0x00000020
+			IMX8QM_USDHC2_DATA0_CONN_USDHC2_DATA0			0x00000020
+			IMX8QM_USDHC2_DATA1_CONN_USDHC2_DATA1			0x00000020
+			IMX8QM_USDHC2_DATA2_CONN_USDHC2_DATA2			0x00000020
+			IMX8QM_USDHC2_DATA3_CONN_USDHC2_DATA3			0x00000020
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			IMX8QM_USDHC2_CLK_CONN_USDHC2_CLK			0x06000040
+			IMX8QM_USDHC2_CMD_CONN_USDHC2_CMD			0x00000020
+			IMX8QM_USDHC2_DATA0_CONN_USDHC2_DATA0			0x00000020
+			IMX8QM_USDHC2_DATA1_CONN_USDHC2_DATA1			0x00000020
+			IMX8QM_USDHC2_DATA2_CONN_USDHC2_DATA2			0x00000020
+			IMX8QM_USDHC2_DATA3_CONN_USDHC2_DATA3			0x00000020
+		>;
+	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			IMX8QM_SCU_GPIO0_07_SCU_DSC_RTC_CLOCK_OUTPUT_32K	0xc600004c
+			IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x06000021
+			IMX8QM_SCU_GPIO0_02_LSIO_GPIO0_IO30			0x00000021
+			IMX8QM_QSPI1A_DATA0_LSIO_GPIO4_IO26			0x00000021
+		>;
+	};
+};
-- 
2.47.3


