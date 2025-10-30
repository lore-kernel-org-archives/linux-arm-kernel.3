Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CB6CCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0Gg9WxbBnDApYx2wA2XYYZNGGyZ5yPAvBIm0lYjykc=; b=LVT6pRXwc8uipPShyKcihCG7WQ
	Y3G+V0AU/3bJzLI291nz6C9f+LXfousgmnyqE/5LHJKYwlnJGMreLQFuEjRix7APmz5cagVRinmZo
	iDHekWBS5OExcVEM3H7bVdPr5/V2AHPQqQUChbdb7W2zE9rnxXbuQdwEdIV90PQcuHg/FRmO903fR
	e4A8eQ7RE3WLvE/vH53zo9fPiJozWMam6p4sLDSs1NNCAyRbFfJ/vYv7/e37v08K9ZJ0mJGM4+sFm
	R9DhnQvZR4e4dm036WSAtVjRnnLSvE0RZzwvZX2snOmpTRcOOI4Mg05zISHy4L63uf291rC6ym+hV
	MDPS6iBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERMk-000000045Dj-3bHa;
	Thu, 30 Oct 2025 12:02:54 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERMg-000000045Ac-2FtU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:02:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso894439f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 05:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761825768; x=1762430568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0Gg9WxbBnDApYx2wA2XYYZNGGyZ5yPAvBIm0lYjykc=;
        b=m8KKnX/XnqM2IshqM/k6ctVUSsOSy+vj9ZLDES9AzAeEbqO60amvfUw6eetayWTA2E
         5Uic2GtVC46aeFQbHnEtXX98PI3t1E/wK47qf8RJsiGNK7WjmqHalyaaVV6YD0M+hnSn
         DXtyDjsLuVXMGb7bLSkPnWnzb+K5w3O7gvM0U/QFYmut3602qaZsWv3y/wY40B96sI9a
         etSyrl+FVc8XRYIwN4MCZE5Oi7sW44MHt8awxBnA9p55W77LCmqeyNOj4Kw1wSddc2Kf
         WyOkc21VM5PhRDw2N7xpWVpWY4fPOcw3kQMgzXDwr1dz0ukwdi2zou1llDQ+UGHJVVRH
         w4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825768; x=1762430568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0Gg9WxbBnDApYx2wA2XYYZNGGyZ5yPAvBIm0lYjykc=;
        b=SjPGcYLPWgnUd3kNaWY+R6IBcA682nG6M4Vk46sLVyzFjLMyD7dVXTAL70CKwYhHmn
         83cfVHLAukD46FmpyNC1tE5Jr9+jKJj52Jd314tLjfIidmowxu1ZIOQu0r6F03xCPB45
         fTEFqrHKL/UNSQjgDG7wVaWQSKSeZFJRNpXH21rY4ylQVmHDWjjD7cwil2R1E08y+7nC
         lnNwebH9QALuiacOfv3DWvhqs5O3nI9sKWmunO7hoKM2JCFZz9Ta9A42n06OvavZ7MDH
         pnNy7ojMkpHOgVY1iqdW0jyvVZYIoElxdb1V59HaL4i9CvThJ+3T+Z4Dw0mpa0WPBOCz
         X+1g==
X-Forwarded-Encrypted: i=1; AJvYcCUYeW2nh0X7+MKIIlLcbS7IjNY0W70To6LHuM+JXom6QVAtU8jFTbnXrXpCxkBqMv69eDxjSwdGmpCYjRfrB2YY@lists.infradead.org
X-Gm-Message-State: AOJu0YzcShI3EASnIwmdLzroayVMyQ4zZf7YRqSDJDZhQ6wEPUsorcUa
	SzmYvqWoUY+33AgKKagJO2asAbrBTRwovEcCX3XnbneShV9gk5Ykko6w
X-Gm-Gg: ASbGnctNMl9lQGzZO3krJ/0iPj2cqCAUfvVRsrmaWyxMTrCxVBM9CAidKD6h7ToA2B4
	DN2YzGXpotuFVtnnzTephNQ0aR7RckV/HEqZiFUc9/mXEIzWb1OPcftsgn92lK+43+tH2szOR6a
	KnOf2GJ93tk3bxv/hWypwBoz6kaf2KZvI1o+7WCeNwtKoxvKGDwFWSuToS8QDl4JwOqZYVDPxWJ
	/mI4QX6TfaOhVjNRaucQ2Vif4ISb+H4dNgHNlyvWuM0B3lP+s9xma31tQn0hHoLVw4/5InSp0+m
	wQ1uZuitq3G+oBDm42xB5RK8RJueTyo7QWqOBh7FsQMZ4l9/Y6oiRoUAkDV8wnZ4K6E1vSlFqE5
	W6dca1gtCohWQp8g8yE5F3juft/91Dy6AtO5J/m2vhX0YsPl5TBs7G8suEg8Q/c970ZSg8phzN8
	685HyE8lLBrSz3hmupd0VdHi6dfUelDfAuw9T1JFrLaFFjyQpbLY3rGW6b5B1TcUuWkeScFLMI
X-Google-Smtp-Source: AGHT+IFNDmrRczFVqxNz09m/FdcF3/tfoq2Go7JkbHb4AzzakE1Qcbn3maTYKR1GTJB3egHOnF+nBA==
X-Received: by 2002:a05:6000:1887:b0:3fb:9950:b9eb with SMTP id ffacd0b85a97d-429aef9515fmr5266977f8f.28.1761825768348;
        Thu, 30 Oct 2025 05:02:48 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429b9b436efsm2399848f8f.23.2025.10.30.05.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:02:48 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] arm64: dts: freescale: imx93-var-som: Add support for WM8904 audio codec
Date: Thu, 30 Oct 2025 13:01:23 +0100
Message-ID: <20251030120127.509933-4-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
References: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_050250_621716_A10697A1 
X-CRM114-Status: GOOD (  13.72  )
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

The VAR-SOM-MX93 can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v2:
 - Fix pinctrl alignment

 .../boot/dts/freescale/imx93-var-som.dtsi     | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 85fd9c9c9372..0b7f6740e5ad 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -12,6 +12,34 @@ /{
 	model = "Variscite VAR-SOM-MX93 module";
 	compatible = "variscite,var-som-mx93", "fsl,imx93";
 
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
+
 	usdhc3_pwrseq: mmc-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		post-power-on-delay-ms = <100>;
@@ -152,6 +180,36 @@ ldo5: LDO5 {
 			};
 		};
 	};
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
 };
 
 /* BT module */
@@ -166,6 +224,17 @@ bluetooth {
 	};
 };
 
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
 /* eMMC */
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -247,6 +316,30 @@ MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B  0x31e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK		0x31e
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x31e
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00	0x31e
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x31e
+			MX93_PAD_I2C2_SDA__SAI1_RX_BCLK		0x31e
+			MX93_PAD_I2C2_SCL__SAI1_RX_SYNC		0x31e
+			MX93_PAD_UART2_RXD__SAI1_MCLK		0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__GPIO1_IO12		0x31e
+			MX93_PAD_SAI1_TXFS__GPIO1_IO11		0x31e
+			MX93_PAD_SAI1_TXD0__GPIO1_IO13		0x31e
+			MX93_PAD_SAI1_RXD0__GPIO1_IO14		0x31e
+			MX93_PAD_UART2_RXD__GPIO1_IO06		0x31e
+			MX93_PAD_I2C2_SDA__GPIO1_IO03		0x31e
+			MX93_PAD_I2C2_SCL__GPIO1_IO02		0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
-- 
2.43.0


