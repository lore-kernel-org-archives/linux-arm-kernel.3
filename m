Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D60EC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqWHGfBlgpXur5ymKn164EkhRYyd9ouy+P4Dy70Bi6o=; b=UTnpdDFVWrdVei27tpI3ggG28i
	k+08+tEBLEnKU80fu1ohjecAgaYgIpu6Q9Zi8zgWpe/t1KPo065XbYiOpzsHLHftYMYA6ymhwzk+1
	Yx5uO0yIcT23DLNiH2d9cQusDFGRMj4nNbCGGamfPYdOxzW6LLmgbllSYsfHe0gkQ6/S8mUMZzM8I
	G2NXUzOlIHbSruxipcaiUwZWthxvhKp30eAiGb6iAWirt8MmYmwkMGPjR3WCBq+oOGn1qR2eL+2e6
	bSNA7QPybaIXooI4IftXyw4rolmKcLagy4v2wnukxq6DNGB62QbRzJjeTzB0jnTq9c62Be5JrRGqX
	Q+aR+5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1SLc-0000000FW55-0yTY;
	Sun, 06 Apr 2025 15:55:48 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzY-0000000FUEz-2cUk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:33:01 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-549b159c84cso969942e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953579; x=1744558379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqWHGfBlgpXur5ymKn164EkhRYyd9ouy+P4Dy70Bi6o=;
        b=hk1Aq7gxb/dllvyqsZG1Ul+7VnZ3hEiSYgsgOJSKcw6jM3I9Z+SoDM3G0qDEBI5Tpf
         bXls7OwYDPf35R+U5Bgs7WfSIXeG3kx9XykY6Vkt8xUjGdBfnR6bOHFCjJMJJ5XUN8Hj
         +OB1khHgPMDZaHCw1Gz9CfkEJeyW+Xa+QQG1xwMTBcOZsb8jTcvqMR0q5EW7oEyigN4v
         wHk3/RAnkGpPrzhyUs4uqyMbN7y4OY8mWDUExFJwmhNjU0xIWrsRILiwlqVs4zCVYycU
         x+q2q0O4JwxPYY7lnesmXkkFQU9pk2BvX6QVnYHAWRf+t8Y7FKHZjYIQkjuBl2HdKRGu
         ZTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953579; x=1744558379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqWHGfBlgpXur5ymKn164EkhRYyd9ouy+P4Dy70Bi6o=;
        b=lCpV2vYR/SGcSmwU6nXC+SGVVMEDuLkFGCBZp1oNPA0y9DNNqinGpCx8Tbxm3rXYwD
         XmlbUXBKp9eLxhuiEiGTerxPdHLoIYnwTMudEMWbzd1f14DOo9s+VUf9hZM65iZnX+fS
         KUd6h4JLpI3upcCUfWC3BS8qTrhxvV2F6mEVT8T5lUz3kgRuTXBkpPPcAFjVa2ou+j32
         p0ZZXDajHYKavw7VO344vqOWRx5udWhlC/6cFJAJtzkfHHA/sFNzortQZciBihlyi/zd
         0wHVRFmjsAPInkig+73g8UD3OmXPJ3uFEtM3NjYZZMuO0VR70Yrh9A0wXdehHbflTmNY
         Sz1g==
X-Forwarded-Encrypted: i=1; AJvYcCU7KnP+f41AolOCWvv8wNNYrDd3j794gsfz5xxjwvRloxkRUHdcVBweb6dPabvrKvCqsOtFEbIuDQqL+pqaN2au@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+KZZvn/DcL1EKY7tIL33e+t/9cniKabVsklR5fDMKWSJPdeke
	L2vnUygiglmE1Xktq9RJwJiU4O6KDaTXE8Hkw2MgMERf5y1cRCmkXkM4mFRkUTXH3z6IZD4Uu0e
	1GAw=
X-Gm-Gg: ASbGnctqub1WPGugdg0WCHUB8w8X4LUJyt/XotIpd0u5+EnV6dR/KB2m4SGKNh9DG2w
	0EFpv4j2q0cFFFaZB4y4eZkSgCoA4gn2cfCLDTdt8oJi7XR12FC1IW9/eqOhPOOg4Z5ix9/uP0D
	LDlZ153YF/Wv7h2n/jfNOSbXOX8JWxZe4eWpPbaunsMUaQMkpSebYXytGiAbKeZpjlolFvZiMH8
	r2X8xS8UFnXhLp/LpzB2c/AYJd2uZoJIONRIiCQmPfNtg+Q+W6B6Hopa6KZ66EO2NZYnNa4Ac+8
	7oQZY/0aM6h2gylSyOaOYDIBuomIWsrx20uq1/8w63YgzzOeH5d7sHM=
X-Google-Smtp-Source: AGHT+IFo5lWlWrnONMPOJWYo5IqaTUomJD3tTkColMtGFQSw4EBGsjCL9oTTcbzR1eqoW0CXn95OVg==
X-Received: by 2002:a05:6512:2387:b0:54b:1055:f4b1 with SMTP id 2adb3069b0e04-54c22692d91mr2732914e87.0.1743953579057;
        Sun, 06 Apr 2025 08:32:59 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:52 +0200
Subject: [PATCH v2 12/12] ARM64: dts: bcm63158: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-12-22130836c2ed@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Olivia Mackall <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_083300_674927_C7216ECA 
X-CRM114-Status: GOOD (  16.93  )
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

All the BCMBCA SoCs share a set of peripherals at 0xff800000,
albeit at slightly varying memory locations on the bus and
with varying IRQ assignments. On BCM63158 the PERF window was
too big so adjust it down to its real size (0x3000).

Add the watchdog, GPIO blocks, RNG, LED, second UART and DMA
blocks for the BCM63158 based on the vendor files 63158_map_part.h
and 63158_intr.h from the "bcmopen-consumer" code drop.

The DTSI file has clearly been authored for the B0 revision of
the SoC: there is an earlier A0 version, but this has
the UARTs in the legacy PERF memory space, while the B0
has opened a new peripheral window at 0xff812000 for the
three UARTs. It also has a designated AHB peripheral area
at 0xff810000 where the DMA resides, so we create new windows
for these two peripheral group reflecting the internal
structure of the B0 SoC.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi | 150 +++++++++++++++++++++-
 1 file changed, 147 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi
index 48d618e75866452a64adfdc781ac0ea3c2eff3e8..a47c5d6d034a7ae56803a651636148383acb8cc9 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Copyright 2022 Broadcom Ltd.
+ * This DTSI is for the B0 and later revision of the SoC
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -119,11 +120,107 @@ gic: interrupt-controller@1000 {
 		};
 	};
 
+	/* PERF Peripherals */
 	bus@ff800000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x0 0x0 0xff800000 0x800000>;
+		ranges = <0x0 0x0 0xff800000 0x3000>;
+
+		/* GPIOs 0 .. 31 */
+		gpio0: gpio@500 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x500 0x04>, <0x520 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 32 .. 63 */
+		gpio1: gpio@504 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x504 0x04>, <0x524 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 64 .. 95 */
+		gpio2: gpio@508 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x508 0x04>, <0x528 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 96 .. 127 */
+		gpio3: gpio@50c {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x50c 0x04>, <0x52c 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 128 .. 159 */
+		gpio4: gpio@510 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x510 0x04>, <0x530 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 160 .. 191 */
+		gpio5: gpio@514 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x514 0x04>, <0x534 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 192 .. 223 */
+		gpio6: gpio@518 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x518 0x04>, <0x538 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 224 .. 255 */
+		gpio7: gpio@51c {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x51c 0x04>, <0x53c 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+
+		leds: led-controller@800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm63138-leds";
+			reg = <0x800 0xdc>;
+			status = "disabled";
+		};
+
+		rng@b80 {
+			compatible = "brcm,iproc-rng200";
+			reg = <0xb80 0x28>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		};
 
 		hsspi: spi@1000 {
 			#address-cells = <1>;
@@ -150,14 +247,61 @@ nandcs: nand@0 {
 				reg = <0>;
 			};
 		};
+	};
+
+	/* B0 AHB Peripherals */
+	bus@ff810000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0xff810000 0x2000>;
+
+		pl081_dma: dma-controller@1000 {
+			compatible = "arm,pl081", "arm,primecell";
+			// The magic B105F00D info is missing
+			arm,primecell-periphid = <0x00041081>;
+			reg = <0x1000 0x1000>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
+			clocks = <&periph_clk>;
+			clock-names = "apb_pclk";
+			#dma-cells = <2>;
+		};
+	};
+
+	/* B0 ARM UART Peripheral block */
+	bus@ff812000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0xff812000 0x3000>;
 
-		uart0: serial@12000 {
+		uart0: serial@0 {
 			compatible = "arm,pl011", "arm,primecell";
-			reg = <0x12000 0x1000>;
+			reg = <0x0 0x1000>;
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&uart_clk>, <&uart_clk>;
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
+
+		uart1: serial@1000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x1000 0x1000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_clk>, <&uart_clk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@2000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x2000 0x1000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_clk>, <&uart_clk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
 	};
 };

-- 
2.49.0


