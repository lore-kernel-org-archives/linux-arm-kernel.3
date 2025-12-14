Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58755CFD314
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 11:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Tdn9gV/6JqfNO9pbAvhWxvcOUTKXJcAnzs6w4PTTfM=; b=qbSYF9P541wrKCYedrqwQuhGlq
	r8q8LaZh5lTGua/IE1MhWl5j4sQCHB+50hceuB6Jg/p4ng1q0iFYAVkk+5f8vSEnZRezRre1EEiGr
	hJEiOhxThH6AK3muWkyRzAbKQAJpQjjTO04PmfviOgjlpptkTudfxZDR1YzrQ6fY0iP/a0u7WAe8H
	jo3Lr6+soDi02VMg/NBzMC0PQbVWynN88qD6RYZfdL8mZ4ge71fVcGcZwd/ms7jqBFXGn3qYPUd+n
	Eb3QEgf/RnxUd4MsstF4ZSC4NWl7Esj+gg+v7OygwLRhcIRG5Kv6gD0/1fqaqx3P95cEwLVlOSGid
	cdfl6IPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvM-00000002NcO-3Klv;
	Sun, 14 Dec 2025 11:06:00 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvI-00000002NYB-26Rq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 11:05:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42fb2314f52so1087398f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 03:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710354; x=1766315154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Tdn9gV/6JqfNO9pbAvhWxvcOUTKXJcAnzs6w4PTTfM=;
        b=WdrtWfbzX9r9xJrv1cg7a+QzLB0rsN8QjeKRMucj84cMR2GI22pt0NMeO1fb8vxm6g
         6YKE7c5jj0j9+9seWs7TbgmslVXQdvc5tt8CJh7rjiTu8OuRhk6LY/bXHvmvQ2sZGMgy
         yDIsviDNlDP4wY8+n1Ji+sXPoeu6dNicMwxTRlMDfRkAVQqsvQAsdWHmrijDL6LoN8kd
         QH3WjATaoT4EQAe0cinKA7+8oU909cLOzIazuXsyKbVgHIaWJ2VZc5WmtA3SfXD7cBCt
         C3OJM1bexEeRmUV1NFizO7wTzN46pHng2Lox7gDBhTTDOTxRJn05tlQyIVJZ+o19h42k
         9qTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710354; x=1766315154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Tdn9gV/6JqfNO9pbAvhWxvcOUTKXJcAnzs6w4PTTfM=;
        b=ZPgpZq8U8EmYtp4/10XZWiZWgLMW0PPyoshF9+okbaIZLioLbrurrBoLJQLke3Mxdd
         DhYb463gzcAp4OOg+RvcWW1wVB/p5KiriFkxdULUIyORI0OvlwX8v5WXo4AW00ZPQUrL
         klze4cElvb/C/4xIgmxoiDeqLFxDU54uIbDiT8hpS9Iqi6bDbBzHzEnAWbBp8mOmXFrw
         mbfKLuWXD6qtRntLV3uGVp08mbfJwGq/1NUta29/wDBqi5RVl/NdLONSZ0hk2wOqk7HM
         WGTVfeKjd/Fp/i6U7zcd3n0YdPLkGCvJWMxtjgimu+Rj1lS4j6thB1E4sTd6K1eoFaPk
         FfQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjsZX91E5WMc/n9N6Z12EIkwLPJfZ5t2+v4nkt34/paEuOfacq8qLVldQKw0vrGegJi3LFq6NXP6VWSKHa1lxA@lists.infradead.org
X-Gm-Message-State: AOJu0Yws3fvgw/CJcR1H0s64UCPmuHmyaIDv6PrOTKrfaI29KkZEycCM
	IyaeoV6+QdyTXdoFouGi45xQWFajR0ZJJxMy4hmJtAD44DgJaGMgX1kE
X-Gm-Gg: AY/fxX5rwTQfPGZwKiwrnX5+yyIvzFeI2ngwqkRiZDFAVStWk1g3x/kiJU+yifpgDAx
	v2E+YQl1hmJKuA6VzXBdIq/vDj28TScu3yQdNULG6xju7v4tuavCe+saWJOx7G2jeI4hgpMhq9T
	jxBJR/VjiTQq4nvBPGs4S1N0OBdNLmLHNeLpnFHkwdxK55Ce+h+9Z2OZ5iBRUG+mrEkTclT/BZX
	zv7aRNbjx4J79AumUmxH/0Xqk1R5vTzAR2XgrDCC3GGRQ2MMNXGJW5sq7I2+agliaqvVclWZQe6
	xwqYAiJilxElZ7qmTMZnulyspnYhQoVIpnyBcuFGUMPi/dzcAmiopB7lHA78jwayMnKaPCBU/pY
	2IiRdxA/yzCJ03HcGS+EDTtMwKwyf5qQG1Th7doi8NsQ6KWZ8SYLV5wzAZr8HkFpkN490h3SbPI
	ZE/XjZwb7/0Xkz1PUWUoqvKvlIDN9n85b2qRrtykZinYx7meBTBA+j+N/h4SMnscFV+6aVE9ZSC
	C9sEbdJanrofHE=
X-Google-Smtp-Source: AGHT+IGeqYYayrctUVALbM1jIq5AYJF2P1OR7ZsvHOKipQ+Hka2ZZeQLSrX95lMDzzqOQr0xV+TXpQ==
X-Received: by 2002:a05:6000:178d:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-42fb44a242dmr7690371f8f.10.1765710354204;
        Sun, 14 Dec 2025 03:05:54 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:53 -0800 (PST)
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
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/6] arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
Date: Sun, 14 Dec 2025 12:05:28 +0100
Message-ID: <20251214110531.9475-6-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214110531.9475-1-stefano.r@variscite.com>
References: <20251214110531.9475-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_030556_643994_C8C1E558 
X-CRM114-Status: GOOD (  12.93  )
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

The VAR-SOM-MX8MP can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 2c49d53e30c3..6da5df11c44a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -29,6 +29,14 @@ iw61x_pwrseq: wifi-pwrseq {
 			      <&gpio2 19 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
 	};
 
+	reg_audio_supply: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -46,6 +54,34 @@ reg_phy_vddio: regulator-phy-vddio {
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
+			sound-dai = <&sai3>;
+		};
+	};
 };
 
 &A53_0 {
@@ -208,6 +244,52 @@ ldo5: LDO5 {
 			};
 		};
 	};
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
+	fsl,sai-mclk-direction-output;
+	status = "okay";
 };
 
 /* BT */
@@ -299,6 +381,18 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC                   0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK                    0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00                  0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00                  0xd6
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK                      0xd6
+			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI3_RX_SYNC                   0xd6
+			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI3_RX_BCLK                    0xd6
+		>;
+	};
+
 	pinctrl_uart3: uart3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX                          0x140
-- 
2.47.3


