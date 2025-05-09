Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18942C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfDBCe28zl/SAg4VVune9XblDhv/fAFglHkb6WzJx6s=; b=qfVaxRnhdDqjJqzfkrSozIpB6e
	6AAczSbhsegJI67wdSlHnnYsVOlsmSVj9ejkaQxVSPZiMpDvzjl4KqUHBDUA78ydaLZnyJgncc1bY
	YmAwEq9MakEN5m3BlRWVmt8eZiSPREjO7Jv+IPiq7226P/S+rzWpe9pJrmua2Kp9DpfoBmDUUHCjt
	HO4QHuCDHYw+XECE4PTwwsedAlGEOd4P2HDqo+K/2R0x+uC1/ymd75pRtnIn3SjxRLrEnrIhNZCBh
	lbiwotbClkCfi7G68Yt0ZfqrCVJnL7MC5YJAsCygV1Ega0JsaK61XwML2n6VaMnYr43IJC+kdnMfo
	sLeNKnjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMhS-00000003Yko-3fmv;
	Fri, 09 May 2025 12:19:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZT-00000003NhK-3a4T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so1154971f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788834; x=1747393634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfDBCe28zl/SAg4VVune9XblDhv/fAFglHkb6WzJx6s=;
        b=K6jKl3E6++ufnc4Ni0OZJc/1v2y5SwK76a10BlI93kLfvvvvRBTvoAO6c9r5MaREzp
         TcA6te0qxCNTzlkPWqn8dtrOzjLFVgFj5929ovQJg515jndIbXHOHuLMVM378mgwUyHe
         u7RBlmaux2+ccg0cgd8xqeoftd6sXZsmxoniI+15nf/hWUXMK3iZcLUzw7z/cHkcILHO
         v18RxtbwL7z2RwhHxvc0E02q7mVmvC/ueey7gWpnON/bhfGZu+RcDUTUbxGisLSiOwdi
         Wx3fBrXbSx0J2tZ4U4cygrJinbyk3gXmZmXqRdddIuqufBXr0pJtTLwfpUwhn5FYOBX4
         b+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788834; x=1747393634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfDBCe28zl/SAg4VVune9XblDhv/fAFglHkb6WzJx6s=;
        b=YD3IiL9+YcXg2iS16DJYwLt9ROX9Kw1ScU0KwXwSoRp/GeiSSWAU5neah/q1dXIx3v
         KCdDgwtjCWYeF1uSrV0qzfd3wdaIocmtFBr3EHKB3w35AXKBfrnsYmC7wBvV4U7Ro10U
         E4Q/LH4ip5M7pD7kG7NHhat7iuGyxY9a0Rhmd3qCLMpjYlTHu3M2zv8HmowOSC8GBpdw
         w60UTOOvqzOaGnCbkAWrUysfBMWs9w11cF2S15CpMS7avCd+ZL0u7KdqJMV8XJaX1aXX
         LnZ2MtRX/XvbcjPo7Dmnc7et9Q5KDYz4vdy03TddhXBYcjdFR/wNDJ4FFybpKedLOXuZ
         F7yg==
X-Forwarded-Encrypted: i=1; AJvYcCUeKnB7ypjB+C9g+zs9mR/7T9ihfX8djWaIE+IwkkSSo5e5H8eZ2jznJ/SQCjSXQBU3L2uJaU+lb/vZXdA8ifHm@lists.infradead.org
X-Gm-Message-State: AOJu0YxIvR3lch8/ymNPmmv2HkX/t0UdyICTKEy1gecP0Qu8qKW/0bfW
	9oFaEnDEEjjo+8BJ+QtYfLGvy92g5Jnx4O9ckj8PoE2nysftwh5qWjmGn1SJ8y0=
X-Gm-Gg: ASbGncte62z3SO4NcA4p9GP5g3ElYd5Oksjv2c7wMuR4N+SyVcA92sJs3kUgYCcWWbR
	9+6EvCtGTYZUeUf7Rkvd+kesCuo8jud4oP27FpNuM3zVtD54T72gUDVcaba3VrZcPSBNZlSZLgE
	JLs+VmxXEeQde26AdjUunoE/58SxKr6zajk0UsgGwXOsEZ4VZHkywJFJW3c0wOZOicwq6+6FauY
	r/7FbgoRwpAT4N1E+9tsaeFcy1q9HJbJ3mgoanT9Pp0e0apydcTA75pckH2eYdM5qxERSOnkGOm
	WET3APY0nC/mKXJlkqHtnSMil2R2egTAo4i3IP/3QBfpUcc=
X-Google-Smtp-Source: AGHT+IEp3NLHKI4dsaZ2CvQTR4HmXAVodEDvfdIyQ8so2a8K6UPoMQBnrE+k8vgABY+2kwMQFLPTVA==
X-Received: by 2002:a05:6000:4304:b0:3a0:b294:ccf2 with SMTP id ffacd0b85a97d-3a1f649cc02mr2743451f8f.52.1746788834336;
        Fri, 09 May 2025 04:07:14 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:06:01 +0100
Subject: [PATCH 14/14] arm64: dts: Add DSPI entries for S32G platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-14-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040715_996351_A5813870 
X-CRM114-Status: GOOD (  12.36  )
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

From: Larisa Grigore <larisa.grigore@nxp.com>

S32G3 and S32G2 have the same 6 SPI devices, add the DT entries. Devices
are all the same except spi0 has 8 chip selects instead of 5. Clock
settings for the chip rely on ATF Firmware [1].

[1]: https://github.com/nxp-auto-linux/arm-trusted-firmware
Co-developed-by: Radu Pirea (NXP OSS) <radu-nicolae.pirea@oss.nxp.com>
Signed-off-by: Radu Pirea (NXP OSS) <radu-nicolae.pirea@oss.nxp.com>
Signed-off-by: Larisa Grigore <Larisa.Grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi        | 78 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi        | 78 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi | 87 +++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi | 77 ++++++++++++++++++++++
 4 files changed, 320 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index ea1456d361a3..68848575bf81 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -376,6 +376,45 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		spi0: spi@401d4000 {
+			compatible = "nxp,s32g2-dspi";
+			reg = <0x401d4000 0x1000>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <8>;
+			bus-num = <0>;
+			dmas = <&edma0 0 7>, <&edma0 0 8>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		spi1: spi@401d8000 {
+			compatible = "nxp,s32g2-dspi";
+			reg = <0x401d8000 0x1000>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <5>;
+			bus-num = <1>;
+			dmas = <&edma0 0 10>, <&edma0 0 11>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		spi2: spi@401dc000 {
+			compatible = "nxp,s32g2-dspi";
+			reg = <0x401dc000 0x1000>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <5>;
+			bus-num = <2>;
+			dmas = <&edma0 0 13>, <&edma0 0 14>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
 		i2c0: i2c@401e4000 {
 			compatible = "nxp,s32g2-i2c";
 			reg = <0x401e4000 0x1000>;
@@ -460,6 +499,45 @@ uart2: serial@402bc000 {
 			status = "disabled";
 		};
 
+		spi3: spi@402c8000 {
+			compatible = "nxp,s32g2-dspi";
+			reg = <0x402c8000 0x1000>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <5>;
+			bus-num = <3>;
+			dmas = <&edma0 1 7>, <&edma0 1 8>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		spi4: spi@402cc000 {
+			compatible = "nxp,s32g2-dspi";
+			reg = <0x402cc000 0x1000>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <5>;
+			bus-num = <4>;
+			dmas = <&edma0 1 10>, <&edma0 1 11>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		spi5: spi@402d0000 {
+			compatible = "nxp,s32g2-dspi";
+			reg = <0x402d0000 0x1000>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <5>;
+			bus-num = <5>;
+			dmas = <&edma0 1 13>, <&edma0 1 14>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
 		i2c3: i2c@402d8000 {
 			compatible = "nxp,s32g2-i2c";
 			reg = <0x402d8000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 991dbfbfa203..4f883b1a50ad 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -435,6 +435,45 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		spi0: spi@401d4000 {
+			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
+			reg = <0x401d4000 0x1000>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <8>;
+			bus-num = <0>;
+			dmas = <&edma0 0 7>, <&edma0 0 8>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		spi1: spi@401d8000 {
+			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
+			reg = <0x401d8000 0x1000>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <5>;
+			bus-num = <1>;
+			dmas = <&edma0 0 10>, <&edma0 0 11>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		spi2: spi@401dc000 {
+			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
+			reg = <0x401dc000 0x1000>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <5>;
+			bus-num = <2>;
+			dmas = <&edma0 0 13>, <&edma0 0 14>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
 		i2c0: i2c@401e4000 {
 			compatible = "nxp,s32g3-i2c",
 				     "nxp,s32g2-i2c";
@@ -524,6 +563,45 @@ uart2: serial@402bc000 {
 			status = "disabled";
 		};
 
+		spi3: spi@402c8000 {
+			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
+			reg = <0x402c8000 0x1000>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <5>;
+			bus-num = <3>;
+			dmas = <&edma0 1 7>, <&edma0 1 8>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		spi4: spi@402cc000 {
+			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
+			reg = <0x402cc000 0x1000>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <5>;
+			bus-num = <4>;
+			dmas = <&edma0 1 10>, <&edma0 1 11>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		spi5: spi@402d0000 {
+			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
+			reg = <0x402d0000 0x1000>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 26>;
+			clock-names = "dspi";
+			spi-num-chipselects = <5>;
+			bus-num = <5>;
+			dmas = <&edma0 1 13>, <&edma0 1 14>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
 		i2c3: i2c@402d8000 {
 			compatible = "nxp,s32g3-i2c",
 				     "nxp,s32g2-i2c";
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
index d26af0fb8be7..812b37b0098b 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -173,6 +173,77 @@ i2c4-gpio-grp1 {
 			pinmux = <0x2d40>, <0x2d30>;
 		};
 	};
+
+	dspi1_pins: dspi1_pins {
+		dspi1_grp0 {
+			pinmux = <0x72>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi1_grp1 {
+			pinmux = <0x62>;
+			output-enable;
+			slew-rate = <150>;
+		};
+
+		dspi1_grp2 {
+			pinmux = <0x83>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+		};
+
+		dspi1_grp3 {
+			pinmux = <0x5F0>;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi1_grp4 {
+			pinmux = <0x3D92>,
+				 <0x3DA2>,
+				 <0x3DB2>;
+		};
+	};
+
+	dspi5_pins: dspi5_pins {
+		dspi5_grp0 {
+			pinmux = <0x93>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+		};
+
+		dspi5_grp1 {
+			pinmux = <0xA0>;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi5_grp2 {
+			pinmux = <0x3ED2>,
+				 <0x3EE2>,
+				 <0x3EF2>;
+		};
+
+		dspi5_grp3 {
+			pinmux = <0xB3>;
+			output-enable;
+			slew-rate = <150>;
+		};
+		dspi5_grp4 {
+			pinmux = <0xC3>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+	};
 };
 
 &can0 {
@@ -220,3 +291,19 @@ &i2c4 {
 	pinctrl-1 = <&i2c4_gpio_pins>;
 	status = "okay";
 };
+
+&spi1 {
+	pinctrl-0 = <&dspi1_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	spidev0: spidev@0 {
+		compatible = "rohm,dh2228fv";
+		spi-max-frequency = <4000000>;
+		reg = <0>;
+		fsl,spi-cs-sck-delay = <100>;
+		fsl,spi-sck-cs-delay = <100>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
index ba53ec622f0b..798b58fa9536 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -127,6 +127,77 @@ i2c4-gpio-grp1 {
 			pinmux = <0x2d40>, <0x2d30>;
 		};
 	};
+
+	dspi1_pins: dspi1_pins {
+		dspi1_grp0 {
+			pinmux = <0x62>;
+			output-enable;
+			slew-rate = <150>;
+		};
+
+		dspi1_grp1 {
+			pinmux = <0x72>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi1_grp2 {
+			pinmux = <0x83>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+		};
+
+		dspi1_grp3 {
+			pinmux = <0x5F0>;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi1_grp4 {
+			pinmux = <0x3D92>,
+				 <0x3DA2>,
+				 <0x3DB2>;
+		};
+	};
+
+	dspi5_pins: dspi5_pins {
+		dspi5_grp0 {
+			pinmux = <0x93>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+		};
+
+		dspi5_grp1 {
+			pinmux = <0xA0>;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi5_grp2 {
+			pinmux = <0x3ED2>,
+				 <0x3EE2>,
+				 <0x3EF2>;
+		};
+
+		dspi5_grp3 {
+			pinmux = <0xB3>;
+			output-enable;
+			slew-rate = <150>;
+		};
+		dspi5_grp4 {
+			pinmux = <0xC3>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+	};
 };
 
 &can0 {
@@ -155,6 +226,12 @@ pcal6524: gpio-expander@22 {
 	};
 };
 
+&spi1 {
+	pinctrl-0 = <&dspi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&i2c2_pins>;

-- 
2.34.1


