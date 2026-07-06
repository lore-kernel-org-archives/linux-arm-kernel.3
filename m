Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96345C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1E6upsvne5jwrnGnndBKXWLBOzbDPqaqq+E/51rCoP8=; b=RvzvszTy383wHi9qIY9er3DN/O
	IA/bxjZMSfaRO2VUx+4BDQY+0hr2LZQfBJ1HLBD7BiIN0AMyg9BYx7faEKwMDofUYOAtBIou6d81w
	Xo3ebOVBGDDSkxKbzeJZnrA3cNl24JWQkhEq651aSwCxoCIBc1hfYNzlu1naAdl2IZ5R+WLyndMgl
	gXkM/f9txPuzmSL4/k/Qphf9gCqPaq0dWi6ifNPdW98+ls6yr/IKHDCL8MHeCso5EdGtxsRPy6app
	aNupL6iYlc6Hrd/1iRZtbwUG1ggaBpRndf+DS5gRwo+AWY/C+7W1L4rpmsvc3LVDCNanvPh/sG/Hg
	6ClJGM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjD-0000000C3FQ-3GuS;
	Mon, 06 Jul 2026 09:35:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfj8-0000000C38Q-3XlF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493b27c7451so34207455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330497; x=1783935297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E6upsvne5jwrnGnndBKXWLBOzbDPqaqq+E/51rCoP8=;
        b=j/GvQyHbV5EO9pz0GFiP+IErs4o/VZ3m63+ZiNluaE3JbrsK7XlGs9JL+NLMCcAGmf
         alvIa9+u6+YDIVkP6Kn8ImAi6/0ymUiCNgR3I/96KIIK7vNBvaR4mxurOtZFy6+Y1LpR
         mlt4W9ITZpLGUH5DLWJi/IxJhXSXVD/MDayX3sbMPpEIt5pnj5PnqlGdLGNi8c2yGU8O
         7QNXP5yC1PL/OVbLbO7kHH0oAYQ/vVDBV/t+7mYmH6/CBoTGyK2yfA2X1epghx3f5o55
         PLnDWGVUv/8f3zHbmQRNJ7f5+mFdNkCAIGwZad3su6M2WkDgNE467g6I0uMHQNtdJdDO
         xjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330497; x=1783935297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1E6upsvne5jwrnGnndBKXWLBOzbDPqaqq+E/51rCoP8=;
        b=rr/RYBcToupaMqm0FDAbp/PY+M1VGxtbZhOuKrdDS8cpGxEgvEq6RxSnPkXfX1Qv0W
         /1Jsd1K5vopTGrnwlVOSuh6TGiegF+D3gUFyTAs05kLuRQJhjMoIj3ty+m1YEgzlK0e+
         SlgJ5MERaygRdCLmRQ4jphb74apxTV+/w7Jo5GfOs1as24acOhQEogM4is75aIg+XPwO
         mMbFPBwnshl0mxZhEknRF3gC7BqFdIRGzQnpYwE9rn6hJxD0IXL3CtpeXN55DysJuAF2
         MX8JmRFRWZql0k8kHemLIDIaMPfjheOfQkUwARaaCGYIMEgOhZXYs9v2i9f2Czrz803m
         cLSA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3+n7m5wU64cHgJemz7R1hcamyUSMsXJTtt0Q+Si2XYvArE7QHIP5yAGofLlsdDpzX119RrqPJ82dx2eqOUeoK@lists.infradead.org
X-Gm-Message-State: AOJu0YxUeMOO4aOLnHb3sLALFwWiguOItKjcjwq7JMd8+jCrW7ixY2c6
	nLaRS14cw+fF6nKk2qdyH3SvQEVyXL/WAYKqv6mAKAI8lKY7Q2yMyUNo
X-Gm-Gg: AfdE7ckqalsfwtukbFLMutkQ4i4+oURj1VuiRapuOm82P/nC/qsEdeNtpqm1yIh2htf
	S+yij2s1wOMABmeqO1Lqc4KoRrSBg7SvTiI83OMlGzd7ICRAtrrEc1xsT+dD6apT6pouqiK2ING
	TCIaTUeR5z5mDC8Ulmy623XGSPKE63DzWGfDMDlpuccuyiqnaF8LpN6M1EcDrP9wYNdLFiSRWo3
	vOE5pRS22H9kRjOQvxxBPTPH9E6Fxuio5aclewtV1NxsT7v40/k9wa2xvI3sft9uejW701KV+Yv
	7xDOnkheLE6y/XNGVYRCrp0Fpyo2HD4wYJ3FCwg0424hL18ZCGrGJSno9lD2NnhLvIa0NWpmPnI
	qtf05JLxU9tSKSz5jtq5mtRF97ljlnbjKGu6LHTttVZVKJKrgZ1CPN9tibaFcW1LcyAXHpZcBOZ
	5Y+lwHCqD+g5+Fc/OZvfDuLhW2RdEcQOakG2m5aZGnMoG2TCtraT0hLOjB+MROBOkxVTosjbRGp
	mL1o5yvzdg6vniJP+WddB7dYg==
X-Received: by 2002:a05:600c:8a1a:10b0:493:d117:18a8 with SMTP id 5b1f17b1804b1-493d149a38amr69499795e9.9.1783330496583;
        Mon, 06 Jul 2026 02:34:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:56 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 05/15] arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec
Date: Mon,  6 Jul 2026 11:34:35 +0200
Message-ID: <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023458_916250_22A5F035 
X-CRM114-Status: GOOD (  14.74  )
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

The VAR-SOM-MX8MN can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

Add the WM8904 device to the appropriate I2C bus, enable the SAI
peripheral, and introduce the sound node to expose the sound card to the
system.

Add I2C3 recovery gpio properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fixed I3C to I2C3 in commit message

 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 98 ++++++++++++++++++-
 1 file changed, 95 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 09146ab76385..e2e04ad2fbb6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -16,6 +16,14 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x40000000>;
 	};
 
+	reg_audio_supply: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_eth_phy: regulator-eth-phy {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -42,6 +50,34 @@ reg_phy_vddio: regulator-phy-vddio {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	sound {
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
+			sound-dai = <&sai5>;
+		};
+	};
 };
 
 &A53_0 {
@@ -246,18 +282,55 @@ eeprom_som: eeprom@52 {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
-	/* TODO: configure audio, as of now just put a placeholder */
 	wm8904: codec@1a {
 		compatible = "wlf,wm8904";
 		reg = <0x1a>;
-		status = "disabled";
+		#sound-dai-cells = <0>;
+		clocks = <&clk IMX8MN_CLK_SAI5_ROOT>;
+		clock-names = "mclk";
+		AVDD-supply = <&ldo5_reg>;
+		CPVDD-supply = <&ldo5_reg>;
+		DBVDD-supply = <&reg_audio_supply>;
+		DCVDD-supply = <&ldo5_reg>;
+		MICVDD-supply = <&ldo5_reg>;
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
 	};
 };
 
+&sai5 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai5>;
+	assigned-clocks = <&clk IMX8MN_CLK_SAI5>;
+	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <1536000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -375,6 +448,13 @@ MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C3_SCL_GPIO5_IO18		0x1c3
+			MX8MN_IOMUXC_I2C3_SDA_GPIO5_IO19		0x1c3
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
@@ -400,6 +480,18 @@ MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI5_RXD1_SAI5_TX_SYNC		0xd6
+			MX8MN_IOMUXC_SAI5_RXFS_SAI5_RX_SYNC		0xd6
+			MX8MN_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0		0xd6
+			MX8MN_IOMUXC_SAI5_RXD0_SAI5_RX_DATA0		0xd6
+			MX8MN_IOMUXC_SAI5_RXC_SAI5_RX_BCLK		0xd6
+			MX8MN_IOMUXC_SAI5_RXD2_SAI5_TX_BCLK		0xd6
+			MX8MN_IOMUXC_SAI5_MCLK_SAI5_MCLK		0xd6
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
-- 
2.47.3


