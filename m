Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6690BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aSfIFzwdZwRCYajc/07D+HcMX4CUsoB7oVw0dcWS5c=; b=dQSAk05CxeDhvoH38IoI//ZdIg
	qQeI7DMet3JpcR4X+YPAWSgaQ8PmBTr0J2cIO8Jzi7dPxy1NJOvs4NIx8UyD2e34jDqqYqhBkmAlF
	3bKRZgdn1S2/vG55DyBqH6kSMLYfKqwELy9CiM8/AlBBWyp0+znCs+nEuibHrfBuYWd1ltdzC9+t1
	aFJ7/QUhU4y+qzFkRcSGGx3qM6TNiq3MW9Z7VpHMhAEcO+vnz9tMww0SyehJ6dkRQRoje0K5yMBEZ
	owAGw4eJ3nN1i4Z/aicYDyvBw/8Yg5igwgiE+ohPeHIAGXurgbjMMgh/YogSuNQ92tKQq7WMh5itP
	du9iWABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7Jr-0000000FIad-46RQ;
	Sat, 04 Jan 2025 16:48:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7FL-0000000FHvH-1uHB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:43:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so6489617f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 08:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736009010; x=1736613810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aSfIFzwdZwRCYajc/07D+HcMX4CUsoB7oVw0dcWS5c=;
        b=VelWsuzkj0fjVEK1Ia/m4Gucmjqrd94HalNyJwGZHo9xhB3OxcnM2ui8QBvYAod5Q0
         fouP7Zj+foGwPyu82BYX+eVC7xyKZgwrqiwHixMIZFqMuqRB2lX2w3GYyYOEjzkbqWAW
         201QxHBoRbkdCXbn5+9JleEKVUYFKKUTNJuq5PywbUBTVdWbiWjg32ryNUwuxZLyP/gc
         vtlCJMmEVPCUSl6c9EGwtCaXaE+keTK4Kp2c0zdp4GltGQWuGvFupO218/5Ttiyw5BmB
         sqiYHKE7qK50B5gsmVk7vOOHhvgnWnIZrV+9CsSRDG5EpqiCAYEswbgFzboT2eORSZTG
         2V8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736009010; x=1736613810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aSfIFzwdZwRCYajc/07D+HcMX4CUsoB7oVw0dcWS5c=;
        b=lBUU7H3gFmHKUT0/uHVJ5TJZFP9KEUltuubSF+QY6X7VaAHq1TQa1aGECQbSUyH0sm
         CI6Q1O/UnE/7LHw94qkiqMQZtPPZyhoytGvHwxcXQpTkHKqSYqwzX6ZO+9ikuUy0NHnF
         kSbedX71H3K086+Fn5MUCl30e78E8ap+7aRy0fFGDLbH6Quq6CytUpAttemMVVvFCF1a
         pd6Mpko14RobLOuVOd4Bd4/03Q0CRTgB7MY3NDiNiHKEjz/nDX0B99D59YOjBcHaBABK
         g/xj7GzXl0NzFs9oU0BijlmX++0COc2bcRs4tRWT64DL6Zkl3LhtVyseAsbS5563uciI
         Ijng==
X-Forwarded-Encrypted: i=1; AJvYcCX0pbsSa+cjPr83Tl94CAGWRAV4KZjR0ed9hJ+lKDNaF3Jb6+2OgJRaDNrbrbMot/T1ZdFfspw5uS8oR8TMwya7@lists.infradead.org
X-Gm-Message-State: AOJu0Yydw3D166D89reSJZy7fFvi07MSxCasB2G+oq+/OuBoSW1Keh21
	nSZHjmnnFYTr8yduoIxmkBhX5eCW9gd+T/4ym5m954tMR0RzBkpL
X-Gm-Gg: ASbGncsCZ4ZEgBmj183C383PdMlWVF3gK+7LTjp86pvSKRZN4HbjJDmFOzbTxnJ9jwv
	3S+igThDxppajbdkXyJBLwth8L8DCBcmtO6lc2ssD9byYKlf7a6J6hyW//IEYJKg5z5rvVmlFXp
	hYtXEydjoGR3UBmAArzmuXQ3LbS1/fSxLQ15tX8RzjPUQcMlZcHLDXrZt0r/1TmcVKt7gTWmFfJ
	D3UtkJ0EVBdT3ABSt71cpe5CjI+RMRyT/35rQm8MErnzOQfF4qPfolFvafaRYjCuzac564=
X-Google-Smtp-Source: AGHT+IGOjXldB97Kk59ZJu4Xu80VTqwMrTVFEvRQDdUho3sAqD3ti1l30eww3h15SuArqO9932ZZyQ==
X-Received: by 2002:a05:6000:1f8d:b0:38a:5a37:4a46 with SMTP id ffacd0b85a97d-38a5a374a51mr15730970f8f.17.1736009009595;
        Sat, 04 Jan 2025 08:43:29 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm513321455e9.24.2025.01.04.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:43:28 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] arm64: dts: exynos8895: define all usi nodes
Date: Sat,  4 Jan 2025 18:43:18 +0200
Message-ID: <20250104164321.333669-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_084331_497387_FC726143 
X-CRM114-Status: GOOD (  11.00  )
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

Universal Serial Interface (USI) supports three types of serial
interface such as UART, SPI and I2C. USIv1 can be configured to enable
either one or two of these protocols simultaneously in select combinations.
Define all the USI nodes from the PERIC blocks (USI0-13), in all their
possible configurations.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 868 +++++++++++++++++++++
 1 file changed, 868 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 5302a8c1b..eedbd1728 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -247,6 +247,254 @@ serial_0: serial@10430000 {
 			status = "disabled";
 		};
 
+		usi0: usi@10440000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x10440000 0x11000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI00_I_PCLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_USI00_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric0 0x1000>;
+			status = "disabled";
+
+			hsi2c_5: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI00_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c5_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_2: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI00_I_PCLK>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_USI00_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart2_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_2: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI00_I_PCLK>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_USI00_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi2_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_6: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI00_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c6_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi1: usi@10460000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x10460000 0x11000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI01_I_PCLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_USI01_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric0 0x1004>;
+			status = "disabled";
+
+			hsi2c_7: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI01_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c5_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_3: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI01_I_PCLK>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_USI01_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart3_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_3: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI01_I_PCLK>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_USI01_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi3_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_8: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI01_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c8_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi2: usi@10480000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x10480000 0x11000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI02_I_PCLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_USI02_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric0 0x1008>;
+			status = "disabled";
+
+			hsi2c_9: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI02_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c9_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_4: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI02_I_PCLK>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_USI02_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart4_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_4: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI02_I_PCLK>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_USI02_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi4_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_10: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI02_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c10_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi3: usi@104a0000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x104a0000 0x11000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI03_I_PCLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_USI03_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric0 0x100c>;
+			status = "disabled";
+
+			hsi2c_11: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI03_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c11_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_5: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI03_I_PCLK>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_USI03_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart5_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_5: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI03_I_PCLK>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_USI03_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi5_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_12: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_USI03_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c12_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		pinctrl_peric0: pinctrl@104d0000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x104d0000 0x1000>;
@@ -298,6 +546,626 @@ serial_1: serial@10830000 {
 			status = "disabled";
 		};
 
+		usi4: usi@10840000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x10840000 0x11000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI04_I_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_USI04_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric1 0x1008>;
+			status = "disabled";
+
+			hsi2c_13: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI04_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c13_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_6: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI04_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI04_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart6_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_6: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI04_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI04_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi6_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_14: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI04_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c14_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi5: usi@10860000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x10860000 0x11000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI05_I_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_USI05_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric1 0x100c>;
+			status = "disabled";
+
+			hsi2c_15: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI05_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c15_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_7: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI05_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI05_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart7_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_7: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI05_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI05_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi7_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_16: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI05_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c16_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi6: usi@10880000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x10880000 0x11000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI06_I_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_USI06_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric1 0x1010>;
+			status = "disabled";
+
+			hsi2c_17: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI06_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c17_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_8: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI06_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI06_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart8_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_8: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI06_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI06_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi8_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_18: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI06_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c18_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi7: usi@108a0000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x108a0000 0x11000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI07_I_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_USI07_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric1 0x1014>;
+			status = "disabled";
+
+			hsi2c_19: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI07_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c19_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_9: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI07_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI07_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart9_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_9: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI07_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI07_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi9_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_20: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI07_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c20_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi8: usi@108c0000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x108c0000 0x11000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI08_I_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_USI08_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric1 0x1018>;
+			status = "disabled";
+
+			hsi2c_21: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI08_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c21_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_10: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI08_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI08_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart10_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_10: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI08_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI08_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi10_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_22: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI08_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c22_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi9: usi@108e0000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x108e0000 0x11000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI09_I_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_USI09_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric1 0x101c>;
+			status = "disabled";
+
+			hsi2c_23: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI09_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c23_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_11: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI09_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI09_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart11_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_11: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI09_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI09_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi11_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_24: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI09_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c24_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi10: usi@10900000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x10900000 0x11000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI10_I_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_USI10_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric1 0x1020>;
+			status = "disabled";
+
+			hsi2c_25: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI10_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c25_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_12: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI10_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI10_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart12_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_12: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI10_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI10_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi12_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_26: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI10_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c26_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi11: usi@10920000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x10920000 0x11000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI11_I_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_USI11_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric1 0x1024>;
+			status = "disabled";
+
+			hsi2c_27: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI11_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c27_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_13: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI11_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI11_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart13_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_13: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI11_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI11_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi13_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_28: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI11_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c28_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi12: usi@10940000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x10940000 0x11000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI12_I_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_USI12_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric1 0x1028>;
+			status = "disabled";
+
+			hsi2c_29: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI12_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c29_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_14: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI12_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI12_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart14_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_14: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI12_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI12_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi14_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_30: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI12_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c30_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
+		usi13: usi@10960000 {
+			compatible = "samsung,exynos8895-usi";
+			ranges = <0x0 0x10960000 0x11000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI13_I_PCLK>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_USI13_I_SCLK_USI>;
+			clock-names = "pclk", "ipclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			samsung,sysreg = <&syscon_peric1 0x102c>;
+			status = "disabled";
+
+			hsi2c_31: i2c@0 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x0 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI13_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c31_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			serial_15: serial@0 {
+				compatible = "samsung,exynos8895-uart";
+				reg = <0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI13_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI13_I_SCLK_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart15_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_15: spi@0 {
+				compatible = "samsung,exynos8895-spi",
+					     "samsung,exynos850-spi";
+				reg = <0 0x100>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI13_I_PCLK>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_USI13_I_SCLK_USI>;
+				clock-names = "spi", "spi_busclk0";
+				interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi15_bus>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_32: i2c@10000 {
+				compatible = "samsung,exynos8895-hsi2c";
+				reg = <0x10000 0x1000>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_USI13_I_PCLK>;
+				clock-names = "hsi2c";
+				interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c32_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		pinctrl_peric1: pinctrl@10980000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x10980000 0x1000>;
-- 
2.43.0


