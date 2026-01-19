Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0A3D29C5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 18:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCGG38wXimoqcJqw4uGBpvIPxBpbZ4VH6uQEUzGkvoY=; b=q5+MmPuPFvx5FxS8iqQwae8n+F
	kTE/kkAX06Ujfn4AweWDz5zR16lp9AatN35E0DoViXCh2bTYARTagp2DbHGJafzxBiOLVSRC8dLHS
	APhN77W5pH+i8AC7TdcElaxM8UXgv1l+vcrv6iGuyI15wQXawlOfctkQyHu8GaiPil745O/ru6fiJ
	nOuLUJ1V5cG+dptUag3WiMRlLyTlOrf6SbujaBUspLiyDf5CePQjazqVnZcyPJBX1TRqOUsIiaLPO
	5Cgf/FT8ihbRY+yXwMBSuA4qw7piHsO6NELC0ZPAohn94WTArsUmSOWTt7hFb+yneXgNWT1JgPccA
	oBUIFg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhu71-00000002iZr-0FYn;
	Mon, 19 Jan 2026 18:36:27 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhu6v-00000002iXq-36Ny
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 18:36:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so25389545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768847780; x=1769452580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCGG38wXimoqcJqw4uGBpvIPxBpbZ4VH6uQEUzGkvoY=;
        b=Jln4g165NJK6y2+J89bp4hqgwO6VpZFqJ9BUrOCwFxrdjT+fbOUQkBjZC8QFmtIMkP
         /dpv8LeQePoPX4ZdVOgEp2hJPliXHojC6a5Z1PwEbDnO2d0nwxo2iVHRoG8Mygw4Q8az
         FHTJrM9Zut/WTjr4PxE2flmuM+e4zAiqOKaBEYqd/4GtQiqWi74U9qJnHIIY8dyJKAFo
         1ywFSOoZ2ny3JKIMpIkGPJcyYPwvdauZXUjc5T83lJrYvdGblLkzTjidSAsPZpiccRCT
         TZk+kss+GQX1R8xMXccDNIRpl7vgebL6FlnGalzteEQKAZ4iv3RyjgvpWDKL4E1FEjrs
         sAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768847780; x=1769452580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VCGG38wXimoqcJqw4uGBpvIPxBpbZ4VH6uQEUzGkvoY=;
        b=JmipahgRNswg5I+pJCQVc34yICy/AjDOno1l9wJB3JtWo4+ZT93L7ZvcoPzqN26NEz
         Knno6T9gHSKBHXPDcPwcb6d4FiKYODwGcS3vjZY4/iIELLTYZ/IWLPlRnqf1O+dZ0XLS
         yFyLGj041Wkw0/+etKPpq+5W31S9cgwtrqo1cccuvu+fFo74B2OTt5ipTsa1YJswbHZX
         cx1AIdNdLIF7MSRZwPb/qPd/qkTjr8uiHlKdibFZ7htfLmu5j7RoxG2s8xkAwXCj4Kxe
         ysIlT+yy5AzbBDqJBGtECE/z6REMoehoPjEA3BlGnFrEgJo/aKWRE9QnDsqWld+PxqKE
         dhzg==
X-Forwarded-Encrypted: i=1; AJvYcCVzlZtnDyWJq/wzqh4357h8V6vuNNvp2BESgQGNPe4xkFFlTtBVMv7MyFzNMaon4/eblPGJY/8GGI4WwgtUKP9v@lists.infradead.org
X-Gm-Message-State: AOJu0YzhuOLt7IdrgMwHYB3bTEJRc3sExoObx76g6eZyY29hks1fKj48
	/OXkt10rdxsWcr2QD1AAlgZx3tVVqt2LBDUmTbFTysYEWKOvcdC3lM3C
X-Gm-Gg: AY/fxX7KqFH28OH0AzAsaNCtXDiovDFCbExXDAk7y2e9HFdP//bt5KHGJOTZtxg3b+z
	sXi0+ZjYvvq7hYVQ2f2lEK2yfs6UUVe83SXyigSXK6Bbq75KfccfisoIQyFiFCFyHruCqKKrcIp
	7t+tFzNpnxDjh9C7LNf9LX5RYuviM+qcpniIgwgYTIQQrCRjiksfsO2XcDwXZ+6zx3sdlJUT8tm
	yeUK+MAcN/sPDLqGIMOUFfJsQyjNNK0HSYdqZMkNBH4y92HOxdWCObBwne7NX1gyxaj9j6Q6qhh
	v7sfSkYP0kFYY8mmcn8ij63+boPxM9vXFZDZJm43yuquQBjd8NMNhBiji5m2uu6le33keuZtVTw
	uOu9vvHdmByJ4cJu5PF3VCjPgyTh06/MkT1ZbjB6/RqSRardSEa4sG82TjTH5/VVaAuTdCn6ivL
	QoUyKNLEYU4pV3WZVlZmjQeYVPN7sqcbGtZyYFlWrkRzKbww1J+PJxE3kIJCSjTaXZMNwsO4NfW
	5J5uncjRiG6X4rWCASb20rxflLzRHdvdKLL
X-Received: by 2002:a05:600c:45d5:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-4801e33c197mr156513735e9.19.1768847779538;
        Mon, 19 Jan 2026 10:36:19 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm203965015e9.12.2026.01.19.10.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:36:19 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/3] arm64: dts: freescale: Add support for Variscite DART-MX95
Date: Mon, 19 Jan 2026 19:35:54 +0100
Message-ID: <20260119183604.88192-3-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119183604.88192-1-stefano.r@variscite.com>
References: <20260119183604.88192-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_103621_922855_60B4F320 
X-CRM114-Status: GOOD (  18.54  )
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

Add device tree support for the Variscite DART-MX95 system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX95 MPU processor
- Up to 16GB of LPDDR5 memory
- Up to 128GB of eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver
- Codec audio WM8904
- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-95/dart-mx95/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4:
- Fix typo in spacing
- Remove vpu and cm7 reserved memory
- Add GPIO_OPEN_DRAIN to i2c gpios
- Move pinmux to eof
v3:
- Fix specific node name with generic one
- Audio regulator cleanup

 .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 ++++++++++++++++++
 1 file changed, 425 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
new file mode 100644
index 000000000000..923c4e6b848d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-MX95
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-95/dart-mx95/
+ *
+ * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx95.dtsi"
+
+/ {
+	model = "Variscite DART-MX95 Module";
+	compatible = "variscite,var-dart-mx95", "fsl,imx95";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0 0x80000000>;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "+V1.8_SW";
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_SW";
+	};
+
+	reg_audio: regulator-audio-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux_cma: linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7F000000>;
+			reusable;
+			size = <0 0x3c000000>;
+			linux,cma-default;
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
+			sound-dai = <&sai3>;
+		};
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 27 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&enetc_port0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	phy-handle = <&ethphy0>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	status = "okay";
+};
+
+&lpi2c8 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default","gpio","sleep";
+	pinctrl-0 = <&pinctrl_lpi2c8>;
+	pinctrl-1 = <&pinctrl_lpi2c8_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c8_gpio>;
+	scl-gpios = <&gpio2 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 11 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&scmi_clk IMX95_CLK_SAI3>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_audio>;
+		CPVDD-supply = <&reg_audio>;
+		DBVDD-supply = <&reg_audio>;
+		DCVDD-supply = <&reg_audio>;
+		MICVDD-supply = <&reg_audio>;
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
+/* BT */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>, <&pinctrl_bt>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&mu7 {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_emdio>, <&pinctrl_phy0res>;
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		reg = <0>;
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reset-gpios = <&gpio5 16 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <100000>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_YELLOW>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+		};
+	};
+};
+
+&netc_timer {
+	status = "okay";
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc1 {
+	pinctrl-names = "default","state_100mhz","state_200mhz","sleep";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+/* WiFi */
+&usdhc3 {
+	pinctrl-names = "default","state_100mhz","state_200mhz","sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_gpio>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	wakeup-source;
+	keep-power-in-suspend;
+	status = "okay";
+};
+
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_bt: btgrp {
+		fsl,pins = <
+			IMX95_PAD_CCM_CLKO3__GPIO4_IO_BIT28				0x31e
+		>;
+	};
+
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC			0x57e
+			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO			0x97e
+		>;
+	};
+
+	pinctrl_phy0res: phy0resgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO36__GPIO5_IO_BIT16				0x31e
+		>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3			0x57e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2			0x57e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1			0x57e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0			0x57e
+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL		0x57e
+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK		0x58e
+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL		0x57e
+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK		0x58e
+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0			0x57e
+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1			0x57e
+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2			0x57e
+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3			0x57e
+		>;
+	};
+
+	pinctrl_lpi2c8: lpi2c8grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO10__LPI2C8_SDA					0x40000b9e
+			IMX95_PAD_GPIO_IO11__LPI2C8_SCL					0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c8_gpio: lpi2c8gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO10__GPIO2_IO_BIT10				0x31e
+			IMX95_PAD_GPIO_IO11__GPIO2_IO_BIT11				0x31e
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO17__SAI3_MCLK					0x31e
+			IMX95_PAD_GPIO_IO16__SAI3_TX_BCLK				0x31e
+			IMX95_PAD_GPIO_IO26__SAI3_TX_SYNC				0x31e
+			IMX95_PAD_GPIO_IO20__SAI3_RX_DATA_BIT0				0x31e
+			IMX95_PAD_GPIO_IO21__SAI3_TX_DATA_BIT0				0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO00__LPUART5_TX					0x31e
+			IMX95_PAD_GPIO_IO01__LPUART5_RX					0x31e
+			IMX95_PAD_GPIO_IO02__LPUART5_CTS_B				0x31e
+			IMX95_PAD_GPIO_IO03__LPUART5_RTS_B				0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x15fe
+			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x13fe
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x13fe
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x13fe
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x13fe
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x13fe
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x13fe
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x13fe
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x13fe
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x13fe
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x15fe
+		>;
+	};
+
+	pinctrl_usdhc3_gpio: usdhc3gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO27__GPIO2_IO_BIT27				0x31e
+			IMX95_PAD_CCM_CLKO4__GPIO4_IO_BIT29				0x31e
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x158e
+			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x138e
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x138e
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x138e
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x138e
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x138e
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x158e
+			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x138e
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x138e
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x138e
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x138e
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x138e
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x15fe
+			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x13fe
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x13fe
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x13fe
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x13fe
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x13fe
+		>;
+	};
+};
-- 
2.47.3


