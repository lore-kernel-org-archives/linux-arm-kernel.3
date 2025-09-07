Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D56ECA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 22:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhgIl8y7LPPrxNtRavFHPIcGuSz1smCAqvTK75m8ECc=; b=AwHhYs3q90UGoHjMf4ZB19VJhD
	ZKyeqkkop6VkfrqID4rQTqWjnugyI9B3/OA++kRGWyDGSRtHDyUi1WsvyvlcHODgV5BIjovVNW8J3
	0+dRFVgA70Tj9Qz2HZsjBxkcW0X16zc1waDhI1YnVzNqhl5zxK04C0aMLx0gnU19NoIHgZXJWzNLC
	2BBx3AboBNALx/2ceSRC9FTT2jYoV4OgIvOLBT4KIF21kOTisPqP6U7UdDIWlLc0gYJFiUpzBstxt
	ea1mml7/Dxw0ZL6oQTfBzON5wkgtB/uFs3SwzMcMFfrWfM59hX75LzXALdUd4fb77KwjL6za3uo+S
	1yf3Lu5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvO2h-0000000DBWi-0mvn;
	Sun, 07 Sep 2025 22:39:27 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNdl-0000000D5hV-0QwZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 22:13:42 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8117aef2476so221929985a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 15:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283220; x=1757888020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhgIl8y7LPPrxNtRavFHPIcGuSz1smCAqvTK75m8ECc=;
        b=KPo6E2E9oZT1bLO2QTGzOpbqzleaeEM0fOIghHuZvI2PH6KwxfHrzGOUECPxMs4Q/s
         lj+/7QO2lWFV7Veuy2JhR69nLXBiUO46Hu+Xjl04Riw0IhleC7t/0E8R0UrUoBEue0Qn
         oXdryzp4gRE2/2DeUuBRmoKtrXgNoACOXQ53zCTHw7olI+b6eLYdFQjBBCYT9ncA7jCZ
         NRLJGehHX7BfC/sALvwFOnQU+7VrqQ30jTYKl4D7VnGAE3m790/WaE+rGFpyYVM24YFN
         /bp0zHDpsj0oG0iiy1oaqAkIuYI5Oom1183NsCrqGFIM3iMpsxjSXW3+iHXIb9Cmc7KL
         Helw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283220; x=1757888020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhgIl8y7LPPrxNtRavFHPIcGuSz1smCAqvTK75m8ECc=;
        b=dnSZ/Nf1e1AQJ/bZIr/1eCrsWKlPgm+RO2cjRZXPWkAfE71KLDds5zPsepNFN/cmG+
         wKyUpbVG74snD+4xIWKNDXLbYRNMtCGcnORKsP4g7eMcm/Nrn1mT8bTL8NDQFjnICwPX
         sHHnIUKbyWNc25tyug5wvReNLH0u9b9z5d62cjlKvDuqUhu+M+dGbwuG6IXmM44h9e38
         qSQCc0GIOAcHVFV7OxKaJEJULqYFWxV99Dhv8O7WwYwLrFlDyErT84eiIwaeUrfO+duk
         v8lqDkC/47d7lNCfcETeWdlwQ+YQDewRMS732KpFuEEzzYc/WZeFafBFPR9Mj+rWeGZf
         amhA==
X-Forwarded-Encrypted: i=1; AJvYcCUmUc5lxvSAb4hTisYRXS+tce4ZtlqGMw0V0JmLJ6LofVX3AvWiruln3wy9FynPGjwrAaiTvUrJX9Dwl/vNL+Yz@lists.infradead.org
X-Gm-Message-State: AOJu0Yza082LZAdH9+IHGaMN5ZsIP7MVezc00feW1YXI2zLW4cx7HDtp
	/JAVdA0q4cFqMBA0/Q+u5zFfYz4s83wX6b75mEO4uBGx1io6fQsMNEIo
X-Gm-Gg: ASbGncvi276PeE6jYpeDqDxKogzR7AoGM2cYpX8mEKrFS6/F03WFNC8lFg9lSEGF8Us
	myCD/w+IeO8+A1iH7sOmXfSeSX1hP+LoTEBS1UIJpuYp4M1UvCf/S2qynrW3fOTi+fryC6fmUro
	27rnaJ0H7X2M1vHVTE6DU8+JYbAvTDEQWY0Vw4XI8CaNAx3L9mSrBKhGkddkf4Pq33A9JHjYMQ8
	XThxPZvCTymzR2YQMAs+LYlevjXKXKI5KMxIOoIGXtccXHO19rYabZbzVTQ/aUyp3WxJ4UjsxSB
	OhdFobXmu9QMyf9CsKc9Dfn6w1lzM6F0cOo7U+dpoAsx5Y8njuy1RS2FvRcyNhKQqgKNp2Bypeu
	2PbLXiKyc9VwKER5T6DtvdBnEo2n1rgcbeMo4dejLkw==
X-Google-Smtp-Source: AGHT+IGDELiK3sqViQH5APIoKNacbHHhOHSvaoXH3XYldizvXXi3Pj0kJ26P3AoMo0Os4bPwDdkoCA==
X-Received: by 2002:a05:620a:290a:b0:80e:1081:90e3 with SMTP id af79cd13be357-813bdf67d02mr490457485a.11.1757283220107;
        Sun, 07 Sep 2025 15:13:40 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:39 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:39 +0000
Subject: [PATCH v2 8/8] arm64: dts: exynos990: Add HSI2C nodes for PERIC0/1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-8-58f41796d2d3@gmail.com>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=36974;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=3PbGN6JiI73hyiJfyoH0znLCZiXCAF01Aiwbda3dcy4=;
 b=3VFZREAIq8KLcP2JRz3UVaEiEuGMkY1+UnXRMioX4c+i551skwaAiU/qe3exAORZqqcmkUdUL
 sGin4mUTDTWBfiRY1cwSGKeYgovXVazxQqZdDdH5fQAp1kd6EoDOmAI
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_151341_276796_19E57C81 
X-CRM114-Status: GOOD (  10.76  )
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

Add HSI2C controller nodes to the existing USI nodes for PERIC0 and
PERIC1 blocks.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 837 ++++++++++++++++++++++++++++++
 1 file changed, 837 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index de9cf9b2d1b28a62519d95549d04458c6e4fe16d..8270ddba915bda5b3c841f1536c97f095f8042f6 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -313,6 +313,21 @@ usi0: usi@105500c0 {
 			samsung,sysreg = <&sysreg_peric0 0x1004>;
 			status = "disabled";
 
+			hsi2c_0: i2c@10550000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10550000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c0_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_2: serial@10550000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -328,6 +343,35 @@ serial_2: serial@10550000 {
 			};
 		};
 
+		usi_i2c_0: usi@105600c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105600c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1008>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_1: i2c@10560000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10560000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c1_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi1: usi@105700c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105700c0 0x20>;
@@ -340,6 +384,22 @@ usi1: usi@105700c0 {
 			samsung,sysreg = <&sysreg_peric0 0x100c>;
 			status = "disabled";
 
+
+			hsi2c_2: i2c@10570000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10570000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_7>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c2_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_3: serial@10570000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -355,6 +415,35 @@ serial_3: serial@10570000 {
 			};
 		};
 
+		usi_i2c_1: usi@105800c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105800c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_8>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_8>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1010>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_3: i2c@10580000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10580000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_8>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_8>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c3_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi2: usi@105900c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105900c0 0x20>;
@@ -367,6 +456,21 @@ usi2: usi@105900c0 {
 			samsung,sysreg = <&sysreg_peric0 0x1014>;
 			status = "disabled";
 
+			hsi2c_4: i2c@10590000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10590000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_9>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_9>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c4_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_4: serial@10590000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -382,6 +486,35 @@ serial_4: serial@10590000 {
 			};
 		};
 
+		usi_i2c_2: usi@105a00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105a00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_10>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_10>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1018>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_5: i2c@105a0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105a0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_10>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_10>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c5_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi3: usi@105b00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105b00c0 0x20>;
@@ -394,6 +527,21 @@ usi3: usi@105b00c0 {
 			samsung,sysreg = <&sysreg_peric0 0x101c>;
 			status = "disabled";
 
+			hsi2c_6: i2c@105b0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105b0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_11>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_11>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c6_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_5: serial@105b0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -409,6 +557,35 @@ serial_5: serial@105b0000 {
 			};
 		};
 
+		usi_i2c_3: usi@105c00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105c00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_12>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_12>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1020>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_7: i2c@105c0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105c0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_12>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_12>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c7_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi4: usi@105d00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105d00c0 0x20>;
@@ -421,6 +598,21 @@ usi4: usi@105d00c0 {
 			samsung,sysreg = <&sysreg_peric0 0x1024>;
 			status = "disabled";
 
+			hsi2c_8: i2c@105d0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105d0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_13>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_13>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c8_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_6: serial@105d0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -436,6 +628,35 @@ serial_6: serial@105d0000 {
 			};
 		};
 
+		usi_i2c_4: usi@105e00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105e00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_14>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_14>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1028>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_9: i2c@105e0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105e0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_14>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_14>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c9_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi5: usi@105f00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105f00c0 0x20>;
@@ -448,6 +669,21 @@ usi5: usi@105f00c0 {
 			samsung,sysreg = <&sysreg_peric0 0x102c>;
 			status = "disabled";
 
+			hsi2c_10: i2c@105f0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105f0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_15>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_15>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c10_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_7: serial@105f0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -463,6 +699,35 @@ serial_7: serial@105f0000 {
 			};
 		};
 
+		usi_i2c_5: usi@106000c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106000c0 0x20>;
+			rsnges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_0>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1030>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_11: i2c@10600000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10600000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_0>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_0>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				pinctrl-0 = <&hsi2c11_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi13: usi@106300c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x106300c0 0x20>;
@@ -475,6 +740,21 @@ usi13: usi@106300c0 {
 			samsung,sysreg = <&sysreg_peric0 0x103c>;
 			status = "disabled";
 
+			hsi2c_26: i2c@10630000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10630000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_3>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_3>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c26_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_15: serial@10630000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -490,6 +770,35 @@ serial_15: serial@10630000 {
 			};
 		};
 
+		usi_i2c_13: usi@106400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106400c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_4>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1040>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_27: i2c@10640000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10640000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_4>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_4>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c27_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi14: usi@106500c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x106500c0 0x20>;
@@ -502,6 +811,21 @@ usi14: usi@106500c0 {
 			samsung,sysreg = <&sysreg_peric0 0x1044>;
 			status = "disabled";
 
+			hsi2c_28: i2c@10650000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10650000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c28_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_16: serial@10650000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -517,6 +841,35 @@ serial_16: serial@10650000 {
 			};
 		};
 
+		usi_i2c_14: usi@106600c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106600c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_0>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1048>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_29: i2c@10660000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10660000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_6>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c29_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi15: usi@106700c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x106700c0 0x20>;
@@ -529,6 +882,21 @@ usi15: usi@106700c0 {
 			samsung,sysreg = <&sysreg_peric0 0x104c>;
 			status = "disabled";
 
+			hsi2c_30: i2c@10670000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10670000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_7>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c30_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_17: serial@10670000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -544,6 +912,35 @@ serial_17: serial@10670000 {
 			};
 		};
 
+		usi_i2c_15: usi@106800c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106800c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_8>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_8>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1050>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_31: i2c@10680000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10680000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_8>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_8>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c31_bus>;
+				inctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		cmu_peric1: clock-controller@10700000 {
 			compatible = "samsung,exynos990-cmu-peric1";
 			reg = <0x10700000 0x8000>;
@@ -607,6 +1004,21 @@ usi6: usi@108a00c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1018>;
 			status = "disabled";
 
+			hsi2c_12: i2c@108a0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108a0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_10>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c12_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_8: serial@108a0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -622,6 +1034,35 @@ serial_8: serial@108a0000 {
 			};
 		};
 
+		usi_i2c_6: usi@108b00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108b00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_11>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_11>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x101c>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_13: i2c@108b0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108b0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_11>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_11>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c13_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi7: usi@108c00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x108c00c0 0x20>;
@@ -634,6 +1075,21 @@ usi7: usi@108c00c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1020>;
 			status = "disabled";
 
+			hsi2c_14: i2c@108c0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108c0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_12>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c14_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_9: serial@108c0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -649,6 +1105,35 @@ serial_9: serial@108c0000 {
 			};
 		};
 
+		usi_i2c_7: usi@108d00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108d00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_13>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_13>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1024>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_15: i2c@108d0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108d0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_13>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_13>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c15_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi8: usi@108e00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x108e00c0 0x20>;
@@ -661,6 +1146,21 @@ usi8: usi@108e00c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1028>;
 			status = "disabled";
 
+			hsi2c_16: i2c@108e0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108e0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c16_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_10: serial@108e0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -676,6 +1176,35 @@ serial_10: serial@108e0000 {
 			};
 		};
 
+		usi_i2c_8: usi@108f00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108f00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_15>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_15>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x102c>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_17: i2c@108f0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108f0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_15>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_15>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c17_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi9: usi@109000c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109000c0 0x20>;
@@ -688,6 +1217,21 @@ usi9: usi@109000c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1030>;
 			status = "disabled";
 
+			hsi2c_18: i2c@10900000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10900000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_0>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_0>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c18_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_11: serial@10900000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -703,6 +1247,35 @@ serial_11: serial@10900000 {
 			};
 		};
 
+		usi_i2c_9: usi@109100c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109100c0 0x20>;
+			rsnges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_1>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_1>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1034>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_19: i2c@10910000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10910000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_1>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_1>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c19_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi10: usi@109200c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109200c0 0x20>;
@@ -715,6 +1288,21 @@ usi10: usi@109200c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1038>;
 			status = "disabled";
 
+			hsi2c_20: i2c@10920000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10920000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_2>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c20_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_12: serial@10920000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -730,6 +1318,35 @@ serial_12: serial@10920000 {
 			};
 		};
 
+		usi_i2c_10: usi@109300c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109300c0 0x20>;
+			rsnges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_3>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_3>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x103c>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_21: i2c@10930000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10930000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_3>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_3>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c21_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi11: usi@109400c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109400c0 0x20>;
@@ -742,6 +1359,21 @@ usi11: usi@109400c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1040>;
 			status = "disabled";
 
+			hsi2c_22: i2c@10940000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10940000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_4>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c22_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_13: serial@10940000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -757,6 +1389,35 @@ serial_13: serial@10940000 {
 			};
 		};
 
+		usi_i2c_11: usi@109500c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109500c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_5>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1044>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_23: i2c@10950000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10950000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_5>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c23_bus>;
+				status = "disabled";
+			};
+		};
+
 		usi12: usi@109c00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109c00c0 0x20>;
@@ -769,6 +1430,21 @@ usi12: usi@109c00c0 {
 			samsung,sysreg = <&sysreg_peric1 0x2000>;
 			status = "disabled";
 
+			hsi2c_24: i2c@109c0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109c0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_12>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c24_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_14: serial@109c0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -784,6 +1460,35 @@ serial_14: serial@109c0000 {
 			};
 		};
 
+		usi_i2c_12: usi@109d00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109d00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_13>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_13>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x2004>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_25: i2c@109d0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109d0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_13>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_13>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c25_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi16: usi@109600c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109600c0 0x20>;
@@ -796,6 +1501,21 @@ usi16: usi@109600c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1048>;
 			status = "disabled";
 
+			hsi2c_32: i2c@10960000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10960000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c32_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_18: serial@10960000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -811,6 +1531,35 @@ serial_18: serial@10960000 {
 			};
 		};
 
+		usi_i2c_16: usi@109700c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109700c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x104c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_7>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_33: i2c@10970000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10970000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_7>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_7>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c33_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi17: usi@109900c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109900c0 0x20>;
@@ -823,6 +1572,21 @@ usi17: usi@109900c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1050>;
 			status = "disabled";
 
+			hsi2c_34: i2c@10990000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10990000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_9>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_9>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c34_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_19: serial@10990000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -838,6 +1602,35 @@ serial_19: serial@10990000 {
 			};
 		};
 
+		usi_i2c_17: usi@109a00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109a00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_10>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_10>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1054>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_35: i2c@10990000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10990000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_10>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c35_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi18: usi@109e00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109e00c0 0x20>;
@@ -850,6 +1643,21 @@ usi18: usi@109e00c0 {
 			samsung,sysreg = <&sysreg_peric1 0x2008>;
 			status = "disabled";
 
+			hsi2c_36: i2c@109e0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109e0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_14>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c36_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_20: serial@109e0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -865,6 +1673,35 @@ serial_20: serial@109e0000 {
 			};
 		};
 
+		usi_i2c_18: usi@109f00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109f00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_15>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_15>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x200c>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_37: i2c@109f0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109f0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_15>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_15>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c37_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos990-cmu-hsi0";
 			reg = <0x10a00000 0x8000>;

-- 
2.50.1


