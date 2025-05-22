Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0336C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYaZ4ifiuCk5/DWThGzMkIsPWpqlx/A/4VaIeK3abLc=; b=ryTLJHR9Ety6cN6EbQPyHwOOJA
	AVA8HPsQq08M88OUD1bBrc9czMMEA8cbJoi+w2SzIbXVWUbbQj+sAxocZeeQwqOuiIl6i4zZvXE1J
	4gixAfkboP3V85xXSL+pxlVPuNeidJ+ZHXI/LYf/lSgfc+DqDFFFvXSCPmGQQS48gXNTTd7ThVNyM
	4eIZ+faHCdA4muYyZveX0qypvKMhxSIQ3SEFZ+8Fv7lNjRY/yKEWxHDq90wnOcUo4mOGk0wKr/lch
	Rylo2dBv6YscW4nv69gNSw36vaVWkS9n+6CNHcs4nJppZ9XxZ/wq6Q1mOlEliM8vk3s7In0kUSoH/
	9I+4Nb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7zr-00000001SJg-3q3X;
	Thu, 22 May 2025 15:38:15 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7I7-00000001KdZ-3cEj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:53:05 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso81784745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925582; x=1748530382; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYaZ4ifiuCk5/DWThGzMkIsPWpqlx/A/4VaIeK3abLc=;
        b=CI2uBmlIQVaK0O3aSfl7+b9u1kr1TMwRlyWIAZeFydVezCAd8aIhNQLZab2tjTPGWh
         PGTO1RJurwFiA8H6T0JVcpT/BcOfWz02jDLtZ9r+DX54OrPPcm5KuxqYd7NGCPj3EA6p
         oAGf+ofrzVQbEpeo7bKzBb9OmiNktdrQhslgkiAZUspnRUnsvyBOxi0J+TlX3zg3xhbt
         RaE685URV/BErB+r7IvVxSfLJCPLA0GePUfw+oVnOwqrlcxe9bN5Pz9Fb89bgKxBFuuo
         h4bXHqa9O3K+KwnH1sZ63rYe3VJDXWeLfAPf7rr21EMEnZ/ObhNZ5pF7Eo2s3Z8+cU3H
         eotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925582; x=1748530382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYaZ4ifiuCk5/DWThGzMkIsPWpqlx/A/4VaIeK3abLc=;
        b=Lt9mBfRRPLXsrEymR4VASzXHcbEEb/5ucrka8KSI0OeGSWpiUo2V8XlwDxkiE4s0/R
         MQJsvy9q73icjyKwl6zc8Ewkog1kmN18cD3cNQRrUYjekBYexWN3WMG+wFewMIjFHyLw
         OOwAaHS+iFMqeH/wuPMYGAOeCaIHepBmfa6rvVx+UznLq7HzbT/Nio7YUUv4hLUuxrZI
         vP9gFwuAZXKfKjv2EuisJ8yPLlk1zh5p9AjO8Genvx0rG7YoKRL0n2N/bOB+13Ki4Epa
         sOQn5w/cuYU3tt47NCG6gTRVhHL5aHgvGP64xJ07KrwzyLo/dXS6r2mZi+akPRBGGvuM
         1Niw==
X-Forwarded-Encrypted: i=1; AJvYcCUcHWDfcgXavOptHyPRM9dn6TF1DD5CyueOKLcHlslECIRNtMrnlcYttJywFEsosasdJU0y+vWzF5LtyqQiNw1o@lists.infradead.org
X-Gm-Message-State: AOJu0YywQ2JvPZzhWxwWVZARAgODLSa9qhslmCvw2FRPUvOWH5h/B0y3
	8ipTpe3z6oxshlnp3Zkij6nlj8lU+EJRAJhjYRsAjRaksiQQtToRJgz0puPqCYWwhSY=
X-Gm-Gg: ASbGnctroZAiIDglKDogLFA31IaOQPrJXd+iwRAavAb2fr4bLRpBzZEbjeUzhLyln9Y
	Zvt3vCj8KIVfF4mN2B5nlbavQLc3hGVgcwMEUrIyXn8FidCjLcGv882bTaxhIYtHs7tNhIgUzWh
	RLDZy8slmIcn9/ePh6UM1V6EC4cA/RtzYYGAvBk4V+Ud6PcS3kr9zFQxIpyqZsKQdOX1oWDE9tm
	behGsGgmiqya9btU2yh3uGNE1BOBW2YsBO0IykFcuKVMsHXyBMpOdQTHaWpzKPNc4AWqFLSwst/
	GWfvRGeS9xGaOucKWnSAx4FEeKqzWYWrQmp7g7h2E+wls/mshB0stYtbk66/
X-Google-Smtp-Source: AGHT+IHCGO08iUjDoKaqKd1XsFoF23FK31du7ZihSX97aKyIlXUv+uhNYjl/lS+O32YNy8OUI/RSbg==
X-Received: by 2002:a05:600c:4f42:b0:442:f4d4:522 with SMTP id 5b1f17b1804b1-442fd60a5bemr233790665e9.5.1747925582001;
        Thu, 22 May 2025 07:53:02 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:53:01 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:43 +0100
Subject: [PATCH v2 14/14] arm64: dts: Add DSPI entries for S32G platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-14-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075303_908441_94C17FB4 
X-CRM114-Status: GOOD (  11.60  )
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
 arch/arm64/boot/dts/freescale/s32g2.dtsi        | 78 +++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi        | 78 +++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi | 83 +++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi | 83 +++++++++++++++++++++++++
 4 files changed, 322 insertions(+)

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
index d26af0fb8be7..d8bf734aa267 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -173,6 +173,77 @@ i2c4-gpio-grp1 {
 			pinmux = <0x2d40>, <0x2d30>;
 		};
 	};
+
+	dspi1_pins: dspi1-pins {
+		dspi1-grp0 {
+			pinmux = <0x72>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi1-grp1 {
+			pinmux = <0x62>;
+			output-enable;
+			slew-rate = <150>;
+		};
+
+		dspi1-grp2 {
+			pinmux = <0x83>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+		};
+
+		dspi1-grp3 {
+			pinmux = <0x5F0>;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi1-grp4 {
+			pinmux = <0x3D92>,
+				 <0x3DA2>,
+				 <0x3DB2>;
+		};
+	};
+
+	dspi5_pins: dspi5-pins {
+		dspi5-grp0 {
+			pinmux = <0x93>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+		};
+
+		dspi5-grp1 {
+			pinmux = <0xA0>;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi5-grp2 {
+			pinmux = <0x3ED2>,
+				 <0x3EE2>,
+				 <0x3EF2>;
+		};
+
+		dspi5-grp3 {
+			pinmux = <0xB3>;
+			output-enable;
+			slew-rate = <150>;
+		};
+		dspi5-grp4 {
+			pinmux = <0xC3>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+	};
 };
 
 &can0 {
@@ -220,3 +291,15 @@ &i2c4 {
 	pinctrl-1 = <&i2c4_gpio_pins>;
 	status = "okay";
 };
+
+&spi1 {
+	pinctrl-0 = <&dspi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&spi5 {
+	pinctrl-0 = <&dspi5_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
index ba53ec622f0b..b0a21e4468da 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -127,6 +127,77 @@ i2c4-gpio-grp1 {
 			pinmux = <0x2d40>, <0x2d30>;
 		};
 	};
+
+	dspi1_pins: dspi1-pins {
+		dspi1-grp0 {
+			pinmux = <0x72>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi1-grp1 {
+			pinmux = <0x62>;
+			output-enable;
+			slew-rate = <150>;
+		};
+
+		dspi1-grp2 {
+			pinmux = <0x83>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+		};
+
+		dspi1-grp3 {
+			pinmux = <0x5F0>;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi1-grp4 {
+			pinmux = <0x3D92>,
+				 <0x3DA2>,
+				 <0x3DB2>;
+		};
+	};
+
+	dspi5_pins: dspi5-pins {
+		dspi5-grp0 {
+			pinmux = <0x93>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+		};
+
+		dspi5-grp1 {
+			pinmux = <0xA0>;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+
+		dspi5-grp2 {
+			pinmux = <0x3ED2>,
+				 <0x3EE2>,
+				 <0x3EF2>;
+		};
+
+		dspi5-grp3 {
+			pinmux = <0xB3>;
+			output-enable;
+			slew-rate = <150>;
+		};
+		dspi5-grp4 {
+			pinmux = <0xC3>;
+			output-enable;
+			input-enable;
+			slew-rate = <150>;
+			bias-pull-up;
+		};
+	};
 };
 
 &can0 {
@@ -155,6 +226,18 @@ pcal6524: gpio-expander@22 {
 	};
 };
 
+&spi1 {
+	pinctrl-0 = <&dspi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&spi5 {
+	pinctrl-0 = <&dspi5_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&i2c2_pins>;

-- 
2.34.1


