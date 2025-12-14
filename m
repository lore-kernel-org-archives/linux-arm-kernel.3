Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F5ED5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Tdn9gV/6JqfNO9pbAvhWxvcOUTKXJcAnzs6w4PTTfM=; b=YrCRK64yVTAcbUoR7IQnbILBnY
	NKZKrba07xrtqINGRNCeqprz1gR7LZXVoaMmfhisZhosA2qxlcUqf+MDXXDecbhBY8shzsYNw7gkN
	74vqSBNPhXHC94F3OfT3nphWyKj/E/McNZKbtLzfBsX4r92IRLYsUMY21jzNY3mZJlcvTKHfmPdvE
	FW7V9QjwRZNjyeIh3iI1Q81ZSxzlbvWB9qWY/ixX3uwfQv7N+uAQ8Fq7I1LsJYXdEGJD8IO9KXqlq
	S1L3j5y5jy8S1ZPVtPao7EOAGQo9USSNCIscvTh+zVGWa3avBgcIlnZd1wH/yW4p7d6gcQbE/ofex
	m6JzAAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1n-00000002l7l-0FHv;
	Sun, 14 Dec 2025 21:53:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1e-00000002l2f-3Gpl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 21:53:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42fbab737f5so1123366f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 13:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749189; x=1766353989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Tdn9gV/6JqfNO9pbAvhWxvcOUTKXJcAnzs6w4PTTfM=;
        b=GtfLwfJetwkzI6Jv0RMdwWtByLd4rw3B2E+cIDC3skvu/+cJelK4kqJSopX7/oWi1U
         SQ0f/4RQjMjXxHcWrlu5HCfbMoe52m2NhhdMWDk3KvSIXuzBJc+dpLDkR3uQGbYzixdo
         pN9qeWlLSAXDHf1BsRG7EduaOn6nsWV0LNFZgJcACdBPtEoR/khvYZj+EBUlRseQ1+I8
         78SAk+kOAf5IlZFfwu7084BiMURYogfQRKyC8Yhfeac8Xwp+Qrv/NnwSZ3ymtOYwuQ6s
         bPNA65qLgCmtqcG1sK0m0v+9eCSf/crPfwvuNYK4zcXt74hbUp1wpD8al88hDPGYBQEx
         JQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749189; x=1766353989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Tdn9gV/6JqfNO9pbAvhWxvcOUTKXJcAnzs6w4PTTfM=;
        b=M5QRgB2OjdqNDxLVKrhSxfX30ojSraj3EEK08qyRLIJ4xbprg3NWtavR088P28L5On
         26muWZO9oMyAKABb2ETOay1MJV6BUMmTxPIl/UgFRVERhfk4fawdAEl15wiCwk/JduiY
         v3DABPp4ZxHNd8sE0VrMXxPQP5X06RJv/nQ8oxSd5Pfy7H7CB3dE5BpKpNlb/q9oFgVp
         IccLHlDxRf2IrtLEcLbqojRTRDeOwVIocxuJUSGt3ke3xyc7ReZCE3b5cHhyh0trITER
         eo+gvMbtzElebulIis1Sxd41icNLgxjFVnYGEfa8r6pDeLIJKiwekGTN57aPbqR35IDI
         /DUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3r8UV52JVSwgj0cXeZDUDMjSfjkR6Mx2neVMbdx1E4JnORg6h4ePH3hSdO8/9xqWPpXwU4zx1mKKEosPNuAA@lists.infradead.org
X-Gm-Message-State: AOJu0YxEnBxuK1+9DJa/qduYmOBMKKXQX1Nwx74c1uyTa+LCavAtiEGG
	qxKSVbMh9rYPRh44kRoGoufla0xigmLimnuC+F01SyQbvi2jxDSbD5WY
X-Gm-Gg: AY/fxX4tuWe+rrgQHqRSe0QUN0dteQVm5Pt/4LyVWzSPVeXH9gZqurdJ8EB1Rp9SYV9
	Xg3p6/soUyGOY5RzfOMiZSxR6VdbK+PKS22IxbDOAei3lfjYwJkeoY8hoH1g5zexraqgPtz688A
	bImlxmd0L1bfVFSQyke1pY4fm8++QTtOqyQ0/XNwwVjBopmrA5N/ZHaAbd//V2MOHH80chdtaQ8
	THOTtCfqsHWaDhaBiwF3Jt9nm8uEaIH0XAEedbZYSogjoktjP2YK8sbxPYirtPZkGLE/mzHeE4U
	6p+BuYGYBT0tK7cKUXwBWOT45QfM6hJEryxzz2THnHwraducZMx9w9TBnc7uzSLeDhQe7YM1GQi
	VhGLPGNLGhLsBud3gUJg1PTg2zaxCd7gCqoK5ng1J1SWDwUrAVUPjo2tHXZErkNmLV0MH3ObxBF
	TAesW+H1T/nY63LgcE3/OlJ7UYJnJSvmrDMOinNuc+8/NtjJq/mDwG0GCWkbkUMsjWzPzsLiVd5
	GCyj5seqA/UnAk=
X-Google-Smtp-Source: AGHT+IG+rgfgN+Ap9RYxSwhweoK+D05CCHg0wt/q7sG4diqCgX52kzMUBhkWGakUvtMafmHzyyuIVA==
X-Received: by 2002:a05:6000:24c4:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-42fb3ecd768mr9691867f8f.21.1765749188732;
        Sun, 14 Dec 2025 13:53:08 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:53:07 -0800 (PST)
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
Subject: [PATCH v4 5/6] arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
Date: Sun, 14 Dec 2025 22:52:52 +0100
Message-ID: <20251214215256.5812-6-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214215256.5812-1-stefano.r@variscite.com>
References: <20251214215256.5812-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_135315_105104_495FBA6B 
X-CRM114-Status: GOOD (  12.82  )
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


