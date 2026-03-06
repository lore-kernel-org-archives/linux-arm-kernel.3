Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6413AFCC062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PabYKucFhlAPL24rWY9exRhx841+oNvFcXCQw1AMR9c=; b=lip1o4r3ghWCVuvy8x/l5O5VIZ
	PMU3wrCwQ+B583a0pXabz+wJposXhiRWaLL/bq8Pw2GwLrXCjSoavOiaXsmOXDFNpd1V+ibWsCsDS
	KMfO8r7oDu3xqutJ04welfZ+EmHU4yMRi3D7UMJTSCfI0lF6jPX6RqSoxxdUw3Xouqm3dDunS3Fc/
	aZiwCD2MgGeUrUD29bAZR0HUFOI+BzPWddJvwtpI4yAVeSvn2AjaBRtxXRyLorFGVGKoH/9iC80ts
	0AsIAX3I7M88E5ZN219bTvLutkoHY6+0rW7qNWk4NHMfLnX1EJSK6wGRZTo2wTt44vbnjfiH7y1rl
	gfJnTBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJx-00000004Qdx-0Kvy;
	Fri, 06 Mar 2026 19:58:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJt-00000004QaP-1Fij
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:58:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48374014a77so115713215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827123; x=1773431923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PabYKucFhlAPL24rWY9exRhx841+oNvFcXCQw1AMR9c=;
        b=QzrGQwOTTysPUyJECn4D+3hMk1pttujCKBCXlHd665aJeql2Br2JdHtAn2DWIhFWnB
         1pPRNgLC3+M/fWHL9+MwVOd56ryuM05zS/DiFcyNNmD0yotdCs1Jmxk4mT0iJO/sXSIe
         RmLKbmXCH5OGXdrIeXOLkQ8IrQxtZW4jZc4O+6kd4Q0Cj8BjC1stVA8PyPR2w99tFoPS
         0hOY1IY5+bFOm3B8sTUhjV2Z4ofgeYHP9sHbJMDC28fsCNqx9urdTWw1Tk2hEXmyOtt4
         LVzhATCQxhRz85BKvgrPT75jz5nrKGkaX7IZIWBn1wgoRIyommaxxbojWvPmOh8KCOlC
         x2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827123; x=1773431923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PabYKucFhlAPL24rWY9exRhx841+oNvFcXCQw1AMR9c=;
        b=gAOo9a0rn/+hJfvG0vlxvD/kBjcBBwxzZWKvAWZyp2AMhIQLIM1uaOOaMA3yE6GqQt
         GGMT16zfBWQJXPRknQmg61D2Bx0ZXJI8XYWnY7ibeYLHBvCMrpY48wp7dJIR2LQeVYxg
         FDHyc+DmX8+ZKcuR5zDnY3e3NSRIAsbMBctymthWFKBYPa0X3DEiD1DZGHxofpNtcoKD
         z95K1uPX1KebuNwWKh53uBXhyO1JUWiYgdoHMkBBI2AjxesatBq6GgrFnbHLlpkFzkJ0
         gtRRZN7ve486F6u5x2Qi0/CbMovCiLEu0uFVBX81Py6JDIw1R+jyBpz2jUDT5ejTPien
         W1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKNbceuKViGzdERP0g0AQZRgCN3DbSXq/uscPNB4sdZXPn868p+zVdFQbgdEHAEyMpw8Iu7Xf4iMWtk/QG0EPc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5nN6sCG1aXSCXJt4XOoZGeoRieB2ZPoM5gonLOk+VWd10ho4h
	JbQwIAkHTJqWFQALC1k8G9+NW1mcL+f+f9aczsAzdZ/xzQVLJNY3/SZ2
X-Gm-Gg: ATEYQzzRmYZAWxt4l7zNu3FIVAV+CL3nBduxhCRFP0OxFhZM+fkN2o+Gb3mX13Ira4h
	yHV2xA7XXLCBWCD7O0bEoSHv8vyNvCZxJ0MQNzWWFAzLCd7HTeh65skLSvdiUw+qxFIhRtCKa1Q
	2HFN279N+P6WH1QnNDDMSiOdVCfdhOZDTDiQYLa7x6H+39Tlmbn6ztK+wOh9J9Ug/HZ4YW+jsSN
	R9Q7p9L0gC2void+OBnVObjlpvpYT+yyjdgeCNakK3NSf8nVr/y/ujkuJoceNQMxNok9TyClRZl
	IJ9f+eQw0czt9yZs18IA8oa3YVkJ1qPEoDYRR5aeYUtJtBBDxUVPYhTDNljFTpzOELTkkS8wQdx
	BoiAfM+O98wNuNMzYdNC4pC18KxWZRqhjK1rLw1us9JLYll4mpJ+oE7aEwBTeB4EjGtKEmvHnkv
	cNd5a1dEClTXVlHsCP0O0vqvYkXdX0HMjXZselbTFiGff3+zep7YI7aPa6w0+mha2Hg5S/Auxa3
	fTpy2Z59KGTLLhpwJLb20TYqDZfbqf9MNBS2tg=
X-Received: by 2002:a05:600c:8a1b:10b0:485:2af3:3f91 with SMTP id 5b1f17b1804b1-4852af3406emr19423515e9.14.1772827123274;
        Fri, 06 Mar 2026 11:58:43 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:42 -0800 (PST)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 04/11] arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio codec
Date: Fri,  6 Mar 2026 20:58:23 +0100
Message-ID: <bb76d92b9bfb164827f53eafceada37fb3312145.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115845_366939_12ACA9DD 
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

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MM can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 100 +++++++++++++++++-
 1 file changed, 97 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 24924ee1e8c7..7cedef8add32 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -14,6 +14,14 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x80000000>;
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
@@ -31,6 +39,34 @@ reg_phy_vddio: regulator-phy-vddio {
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
@@ -257,18 +293,57 @@ ldo6_reg: LDO6 {
 
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
+		clocks = <&clk IMX8MM_CLK_SAI5_ROOT>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai5>;
+	assigned-clocks = <&clk IMX8MM_CLK_SAI5>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <1536000>;
+	#sound-dai-cells = <0>;
+	dmas = <&sdma2 8 25 0>, <&sdma2 9 25 0>;
+	dma-names = "rx", "tx";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -413,6 +488,13 @@ MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18		0x1c3
+			MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19		0x1c3
+		>;
+	};
+
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8		0x141
@@ -431,6 +513,18 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI5_RXD1_SAI5_TX_SYNC		0xd6
+			MX8MM_IOMUXC_SAI5_RXFS_SAI5_RX_SYNC		0xd6
+			MX8MM_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0		0xd6
+			MX8MM_IOMUXC_SAI5_RXD0_SAI5_RX_DATA0		0xd6
+			MX8MM_IOMUXC_SAI5_RXC_SAI5_RX_BCLK		0xd6
+			MX8MM_IOMUXC_SAI5_RXD2_SAI5_TX_BCLK		0xd6
+			MX8MM_IOMUXC_SAI5_MCLK_SAI5_MCLK		0xd6
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
-- 
2.47.3


