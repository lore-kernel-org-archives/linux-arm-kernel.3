Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FBAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AjVJclaJ0GJ4iLGz88uBV5CsMMvomxW4ot054TBZvw=; b=v31ZlW5cm747Yk7kb2ybRATuVY
	Z48abJn4G9913+rN379LZPSldkwJT1S24WPXQifkwm0+aqtCMUhciBhr1Upve3Z1jGUlRxw1+6ZoR
	WFj99KAr4z5qoKFkM0NqaD9g/6rpxGCRxs3yGDCwJgH3cH1H9UI+Y2lBNULlnu1Icw0hqYw9KDrnx
	FbvATT5hxIT6Fhy/4awHP27wzHalR9G2X0p47gmE4ySABcAqji4iJHUpfbZ0qWgfqCvw0WbLggvte
	hUvP0JV7IELntGn8B/OEoU6+blN3PrBNtt/+b9GFToKJJLAKavNIvcNv45RwnvBLD6f1wFjsn93TX
	ZTsWWJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXQ-00000006ODz-1P6H;
	Fri, 03 Jul 2026 08:46:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXL-00000006O6T-0MEJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493be1b9564so1983745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068373; x=1783673173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AjVJclaJ0GJ4iLGz88uBV5CsMMvomxW4ot054TBZvw=;
        b=aFJKxFqDbZASmUDtIho6egXegdL4Rwe3Bd8kS9DgZ1GQgdie/wPicPnTwF5uamY18x
         oL55r/cVw6fSGlkCoi6myCpr5Z8EeFM+KVjYgjm/e/2SRcxwaJvn0SDEuuEuvI3aWgp7
         aO4jNU/7jKTZOJgMt9+z7ibHS3fgYS0j2OUe0CFJnfBT2BGhKMcHVpqa+MhiV1lf0fde
         NWBb8bTBlJOl5N+zkSyrwnrn1z7CMV0q9DfAt2Td8wUzPo0iyHkTtFgm+18GJBdM1B1f
         frSHasHA5xredA5tzu7EcCRwhqx2AGris4NX5JFGSDNHrzC+JIs+zTL1n44wY0JNgXr0
         2vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068373; x=1783673173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/AjVJclaJ0GJ4iLGz88uBV5CsMMvomxW4ot054TBZvw=;
        b=NwMn5gBxGIa6fxfOs0ssitL1UBgSo8ANDkse2VdsJ/VMbJ1VXNI/mYCHQuLYaphiLH
         a/vCLzOTCwe+c398/5qFpvPnB5yTXSYeyetx9Gg88640lPO0vbT//FwwhZvmrdTglpln
         fIcmhD8jgsqfro9HBhrxcg3fkS3xY3ealoFleGJ3l5dEhdGbs+i3fPiW4bvRYJGJD/Xo
         bqYfFYEWiz7fr+cvv00IJP91xP7xshtyJr+mIyYTOR9Cfwh5n2SboEaEXzfFLoOM3ug0
         fszK4Q7jHPu69tKx+VKZeYgFFCRGpsx8HwSUsK4lwW+BdW6JZ9VsOPMYNfY7PtzK7PTZ
         yc3A==
X-Forwarded-Encrypted: i=1; AFNElJ/UB/ttK2x39+Thja4nWNnM2VPO5tBzR0iAqTEIr+ZH2l9I8qZDAx8gV7V3jaYvRa1nDfwF12gnEvgncMatdS4y@lists.infradead.org
X-Gm-Message-State: AOJu0YxxAnVfvynuS/wnrfXULhTxLr3oNoblogymB/WZWpeKVKZAb24E
	/ynkFzkkdQUE9VDnQMfWlyeUVZY1KDrZ3rqU/3EL8UyWoGiz/jpSiZTv
X-Gm-Gg: AfdE7clxCfNh+0dhMIk9r8oaGwdG/2XDKQbX6PduxhdTMo/6+AkwSK6YGz/l7Rm5QHC
	tpECgpTn69yfv0ZajvpOakssKfD3Zz2lU61xnr0yLboIvIEkFfnqWnj0Fb7UBq5N5AbtHnZj07T
	J6LiP9b18uzkUfBUDuv0PgEOa5Hb8ERcS/kW8zuXnhD3pQZywDmUGZSud+kImWDMhak9lV7Rq1R
	pPRRyvt3RcH2xZIIAhwVujwPaTsJnwORvQ4T5Qfe2g8qAcInfRjv8RMsyJx46TCd+mElgns9Hwp
	+ZU5XZ1aTubF1frFeKycQNtTDMWQauslxgAoVrkCkESJUzJ3f18totYgAPf0UXkcCiVJ8yQTDss
	I8VeCTRZH0hjBTyXGczmPWm551YW9k9UDKCtPCO8Eram54ntMEPImUJ4CVMiFbC3zFobiA5v+Bz
	fhS6OSKLJO1xZxWMhWbElDEldO6kQ1+Ndhdc+6eW4PGt8RlQAlGN3BOc2JaWkrrgY5xeqFSBUfI
	q5c6eRcYM/YW60C1GTaAldraA==
X-Received: by 2002:a05:600c:828d:b0:493:bf86:85c5 with SMTP id 5b1f17b1804b1-493c3df3495mr124709255e9.36.1783068373027;
        Fri, 03 Jul 2026 01:46:13 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:12 -0700 (PDT)
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
Subject: [PATCH v1 05/15] arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec
Date: Fri,  3 Jul 2026 10:45:52 +0200
Message-ID: <126ae03f37ba587560ab8c94b7833236d97990de.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014615_156347_EA3860CA 
X-CRM114-Status: GOOD (  14.03  )
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

Add I3C recovery gpio properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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


