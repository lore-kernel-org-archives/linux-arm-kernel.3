Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951B610F9961
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFEjmWmnECTHcKaVgpVEZDcYNXvt5wvLopnxcjkKsmI=; b=eBQHzYzdcXr7JepSftSLOV6znt
	vIi1Z0iKevp5vf36j9oWqGqgLmy3kFtOk664iGTeiOSOOp3VpKqFt95UX0FPXL/9eV79Yw0Th2QAF
	hr5M+k4S0FZ2vE6QQfipE1iHyld0Ks731coub9ie8bfCXrRykvo68JL7U36K2wklqNXXq/i0dSWHM
	ritdTFqyy21q4ZeUcCXD2ptJY8Z3xcFKKkDvlvP8wpMKFA0dc7VUQriXv3AfL25J+WamezUu6hD8U
	zylEkx+MvqOO1CChKaZ0RFW3Fuh7AGzD+9oJAHtdSeN0XYHQV7xo1wD+cIeFNi11S0trAAq//59wI
	T/crZatQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtU-00000009Cfk-1HtP;
	Wed, 08 Apr 2026 17:40:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtQ-00000009Cav-0tBI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 17:40:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so579495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 10:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775670042; x=1776274842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFEjmWmnECTHcKaVgpVEZDcYNXvt5wvLopnxcjkKsmI=;
        b=aDpdPKOGbVltxPCWuOd2zccHJgTYlgytFJmlQYeBzZSuaEA4IsjCXWZOtLDYKJb94X
         BUpzzGEr6kyHulCgfPR5ha8ct5squhoeMpw6Uqz1W13tCJC6nCrN7gEA8WaxTgz5baJN
         5GY+mOgELaBd1YOvqZGNuOkTk99uSznK2s0dN+JOXPWzIkScnsrozL/gRJ4k3bO2Sln9
         m43clLfOicsb/zGMFDywG+5YpfAxsq1UHB/ka+3CmU3iQnILZCa7lrlFFq64m8SQGNXx
         UMGlJA8zkXH2SZBvaJBdd2gszKWGrFUi/oSWOJWgJIDKzG8APL8CtltGgYDQf0WAC35C
         VNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670042; x=1776274842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sFEjmWmnECTHcKaVgpVEZDcYNXvt5wvLopnxcjkKsmI=;
        b=ayXTdSJSOa0L1gub005sPSSaXajfWTMvSVgVr9oUn4ITWvwRdnBxxmAVYhBMl2UeR2
         LpFZAnWaTK05hYf5NzSsKmkKT4G8V6T3vhud31kFx7/mV0pc06CnNojdXriV9ew+LiWe
         wWthqj2qJn9hsOc425XLVekBtsEVcy5HhCThALqtaxPNwk5UJBaihLf9hm///X2v2bXe
         tszQWuX8Qv2ygXCZIdx+p2gWolXesVEgF3fzwtp73gQhGzs7pirj++jRcP01hiXeFvuM
         ILheg4mrQ1r0aIFNPWzjkgOkeSpGQZucxDNVZlu6ZQIeyEaJApjw68GgMJJo0DBRFxHw
         WhDg==
X-Forwarded-Encrypted: i=1; AJvYcCV9S04vCoKv7J6vtgWUVi2tGw4y7olEClHSGsxRiQXTy89BHos9jS9IwzW0taVifol/eevgUj9n6qWQIz8zZNo8@lists.infradead.org
X-Gm-Message-State: AOJu0YxOL1A4ukR/3wceBY4QPJSVMOiZisBHZveXxzBitTWq6At5Bvy8
	OMuaO4kDlZ7LR9GdbStuEFvFdsdRivFy+i7bcHqTL4Dud6Ccl9u97le6
X-Gm-Gg: AeBDievLNhAGSmTqym81ortgf7eXQLMAQ0+q3CVKiZZzea+pIlvMDzJWUhUjNFXIVvE
	vTHIpxGu3OeYeO5oWO1yLN7ed/TnZX1eF5aohXWujWowbHRlW79J3SkudrRRCweV2XoDO3VLIu6
	3u/Ug59/GZAXReYVxGFWwyOI/DdCRSk964BzEoS5Ya52qEC/QqljB+IpJoZTQeihMH9JKGTcqfl
	8oGFszOKddo3+OSadf78WXg1+uEcdIaB6gPkyUjf4wf1j4Kqayhy1GXisX0VG+9Bd3/hhP7+X5i
	V0R7fODnP5Qx1dP8Fo0pvYv6ItvlhtGS0KyHkgeN00MtnmccTGuy2shWYzUPqb4tqJJounn9Cv3
	4Njj4ip/TooomNk+N3UUEtR/mnK1qUe2r8vpQKnpO9grZL6bW9briy6/flX+eloGg3pDWeBQ9lQ
	zc4qZ7k79nUxjLWJBjICjs1nzjHihSmtVJ2jkntHbD1Skgux61H+wqn1sAoOpcBGKtAX5zaedBV
	v+fAK0KepHI5Tpk8psYbzm8U3gR32AHli3LXw==
X-Received: by 2002:a05:600c:c0dc:b0:485:3193:6ddb with SMTP id 5b1f17b1804b1-488ccf3a0fcmr7996195e9.3.1775670042064;
        Wed, 08 Apr 2026 10:40:42 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm61774659f8f.0.2026.04.08.10.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:40:41 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite VAR-SOM-MX91
Date: Wed,  8 Apr 2026 19:39:45 +0200
Message-ID: <1ed7e2100e3feb74c9f0006d5b88e1bba1ad4339.1775669847.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775669847.git.stefano.r@variscite.com>
References: <cover.1775669847.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_104044_398174_040CE18C 
X-CRM114-Status: GOOD (  17.49  )
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

Add device tree support for the Variscite VAR-SOM-MX91 system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX91 MPU processor
- Up to 2GB of LPDDR4 memory
- Up to 128GB of eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver
- Codec audio WM8904
- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-91/var-som-mx91/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx91-var-som.dtsi     | 456 ++++++++++++++++++
 1 file changed, 456 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
new file mode 100644
index 000000000000..b30a0d8a81ba
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
@@ -0,0 +1,456 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite VAR-SOM-MX91
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-91/var-som-mx91/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx91.dtsi"
+
+/{
+	model = "Variscite VAR-SOM-MX91 module";
+	compatible = "variscite,var-som-mx91", "fsl,imx91";
+
+	usdhc3_pwrseq: mmc-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio4 14 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio3 7 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
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
+		simple-audio-card,mclk-fs = <256>;
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+	};
+};
+
+&eqos {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	snps,clk-csr = <5>;
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
+			eee-broken-1000t;
+			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <15000>;
+			reset-deassert-us = <100000>;
+		};
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
+	scl-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+	sda-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <650000>;
+				regulator-max-microvolt = <2237500>;
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
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clk IMX93_CLK_SAI1_GATE>;
+		clock-names = "mclk";
+		AVDD-supply = <&buck5>;
+		CPVDD-supply = <&buck5>;
+		DBVDD-supply = <&buck4>;
+		DCVDD-supply = <&buck5>;
+		MICVDD-supply = <&buck5>;
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
+&lpspi8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi8>;
+	cs-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* BT module */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart5>, <&pinctrl_bluetooth>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
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
+/* WiFi */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			MX91_PAD_ENET2_MDIO__GPIO4_IO15				0x51e
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__ENET1_MDC				0x57e
+			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
+			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
+			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
+			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
+			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
+			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC			0x5fe
+			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
+			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
+			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1			0x57e
+			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
+			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
+			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
+			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
+			MX91_PAD_UART2_TXD__GPIO1_IO7				0x51e
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqos-sleepgrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__GPIO4_IO0				0x31e
+			MX91_PAD_ENET1_MDIO__GPIO4_IO1				0x31e
+			MX91_PAD_ENET1_RD0__GPIO4_IO10				0x31e
+			MX91_PAD_ENET1_RD1__GPIO4_IO11				0x31e
+			MX91_PAD_ENET1_RD2__GPIO4_IO12				0x31e
+			MX91_PAD_ENET1_RD3__GPIO4_IO13				0x31e
+			MX91_PAD_ENET1_RXC__GPIO4_IO9				0x31e
+			MX91_PAD_ENET1_RX_CTL__GPIO4_IO8			0x31e
+			MX91_PAD_ENET1_TD0__GPIO4_IO5				0x31e
+			MX91_PAD_ENET1_TD1__GPIO4_IO4				0x31e
+			MX91_PAD_ENET1_TD2__GPIO4_IO3				0x31e
+			MX91_PAD_ENET1_TD3__GPIO4_IO2				0x31e
+			MX91_PAD_ENET1_TXC__GPIO4_IO7				0x31e
+			MX91_PAD_ENET1_TX_CTL__GPIO4_IO6			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e
+			MX91_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3_gpio: lpi2c3-gpiogrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO28__GPIO2_IO28				0x40000b9e
+			MX91_PAD_GPIO_IO29__GPIO2_IO29				0x40000b9e
+		>;
+	};
+
+	pinctrl_lpspi8: lpspi8grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO12__GPIO2_IO12				0x31e
+			MX91_PAD_GPIO_IO13__LPSPI8_SIN				0x31e
+			MX91_PAD_GPIO_IO14__LPSPI8_SOUT				0x31e
+			MX91_PAD_GPIO_IO15__LPSPI8_SCK				0x31e
+		>;
+	};
+
+	pinctrl_lpuart5: lpuart5grp {
+		fsl,pins = <
+			MX91_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
+			MX91_PAD_DAP_TDI__LPUART5_RX				0x31e
+			MX91_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
+			MX91_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX91_PAD_SAI1_TXC__SAI1_TX_BCLK				0x31e
+			MX91_PAD_SAI1_TXFS__SAI1_TX_SYNC			0x31e
+			MX91_PAD_SAI1_TXD0__SAI1_TX_DATA0			0x31e
+			MX91_PAD_SAI1_RXD0__SAI1_RX_DATA0			0x31e
+			MX91_PAD_I2C2_SDA__SAI1_RX_BCLK				0x31e
+			MX91_PAD_I2C2_SCL__SAI1_RX_SYNC				0x31e
+			MX91_PAD_UART2_RXD__SAI1_MCLK				0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1-sleepgrp {
+		fsl,pins = <
+			MX91_PAD_SAI1_TXC__GPIO1_IO12				0x31e
+			MX91_PAD_SAI1_TXFS__GPIO1_IO11				0x31e
+			MX91_PAD_SAI1_TXD0__GPIO1_IO13				0x31e
+			MX91_PAD_SAI1_RXD0__GPIO1_IO14				0x31e
+			MX91_PAD_UART2_RXD__GPIO1_IO6				0x31e
+			MX91_PAD_I2C2_SDA__GPIO1_IO3				0x31e
+			MX91_PAD_I2C2_SCL__GPIO1_IO2				0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK				0x1582
+			MX91_PAD_SD1_CMD__USDHC1_CMD				0x1382
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x1382
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x1382
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x1382
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x1382
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x1382
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x1382
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x1382
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x1382
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x1582
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			MX91_PAD_SD1_CMD__USDHC1_CMD				0x138e
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK				0x15fe
+			MX91_PAD_SD1_CMD__USDHC1_CMD				0x13fe
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK				0x1582
+			MX91_PAD_SD3_CMD__USDHC3_CMD				0x1382
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x1382
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x1382
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x1382
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x1382
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK				0x158e
+			MX91_PAD_SD3_CMD__USDHC3_CMD				0x138e
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x138e
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x138e
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x138e
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x138e
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK				0x15fe
+			MX91_PAD_SD3_CMD__USDHC3_CMD				0x13fe
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x13fe
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x13fe
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x13fe
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x13fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3-sleepgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__GPIO3_IO20				0x31e
+			MX91_PAD_SD3_CMD__GPIO3_IO21				0x31e
+			MX91_PAD_SD3_DATA0__GPIO3_IO22				0x31e
+			MX91_PAD_SD3_DATA1__GPIO3_IO23				0x31e
+			MX91_PAD_SD3_DATA2__GPIO3_IO24				0x31e
+			MX91_PAD_SD3_DATA3__GPIO3_IO25				0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3-wlangrp {
+		fsl,pins = <
+			MX91_PAD_ENET2_MDC__GPIO4_IO14				0x51e
+			MX91_PAD_SD2_RESET_B__GPIO3_IO7				0x51e
+		>;
+	};
+};
-- 
2.47.3


