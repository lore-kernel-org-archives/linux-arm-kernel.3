Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638F7C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zArY1PRZ2YS97S9H1azNoi4GZH8ue6vwYjHQDksS40s=; b=AbpECHRr9Or2EL7d2ZOGqAJ7ni
	BJ0PHfFORYCAfux2syWkruaM/4kNMumWbNKpxjlCjnUCf40/u/7GQ32eO8teSPtr7K+QmM50epc6O
	xwte0+pwf9DOtLDVCnGBKZedXCWH8E7jnLIg0OMAoOe1RjZiy5pIPdMXxnL0Owa9r5dcJjZtIReh0
	+2Avn/RUu2AipPWMDpw8GVWwm5C0tQbG+5fndsybsTgKjblLvA1rOgKeaH0nsdr75oA3hsjMPr9io
	tTIr3m0kn+KdbPGbOhX2MwPk/4JiHZhLjwr0b7He3a7d9ZD0wZZ2xKAry9KRKn2qllkifDt8pX94P
	6bzMeCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4jy-0000000Cs9H-2mu0;
	Fri, 28 Mar 2025 08:06:58 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4O7-0000000Copo-2q5f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:24 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54954fa61c9so2039316e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147862; x=1743752662; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zArY1PRZ2YS97S9H1azNoi4GZH8ue6vwYjHQDksS40s=;
        b=Lw7iqrgjKt1Tun3B9W/arIfwX6PZjqsA0LeBb9YbhqxqJmm1E0grtD73o2d0vlBPNm
         IK49J37eEYZr0bceh8vnXb6zccGcyNopsAg0gXnK8pvLx4s4262OvLJT15+Dka6tua7A
         0aMJtQlWbj3KI2Zfu77yNZ304wt8N3HINzH2yvnE5dapNaaW4TaOwEljTyx2ybrFb4uk
         tUCwFZE2amFzOKPN02ZWx4ItUo7swP+Cqy5I3pZTt+juU/zjo9kztsdhqTce4yfAWJiK
         djj0sg/PdAb+dPWpgLF+soAYg5D+pT9vAKBNVnMnRr/JCNGb64wPmxdiOwfDKwAC/oZz
         LVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147862; x=1743752662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zArY1PRZ2YS97S9H1azNoi4GZH8ue6vwYjHQDksS40s=;
        b=P3cgY5YDml27FElW7gM60MKK/jmCX8qy4GxpqetForMHzsV6rqFDuLZ96nJrdUbpWl
         yHNBUWPX3mQaBAJREVhH/6/Zgp4w7PY7vgBjI7THo1rIUPEwOE4TMv8f6YkALs/se5hn
         LlUfK4ipAUEtcq95dptYtdGTJFRe9usRtT9bcVF/6sx6dwYpE2HFNPoU5RjufaReYZGL
         qIhNvdxsbvinzvQmUSwT/3ATE4rTGnV62L13UDBb6gGohqIKtsIjWZiqBwNFQu2hkHFU
         yXsHjM7gOsDIalUAMYhXVQ8X3RVU2qQp/sBiw9fj0bVXMWX9u/nky5lOqDlFICZUR/Yn
         T0uw==
X-Forwarded-Encrypted: i=1; AJvYcCWCplPEDAKzMpcfpStS04bTqouMUYhave8z4gOYzyQPSYyIYyHkq0/K2C+eGhRcPITs60JjzzJ1Z/c3Klm003UN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywus4WsmM7L2XgRVxZNNYar3mZ8aDUW0Tc3r/bLmLF1zu4Y4Qve
	v3LS6CO7a5DeE2Jo5A3V9ysk0D3JbB3Uch8Ubz62XKASSWfUlg6TTFaMzS1949w=
X-Gm-Gg: ASbGncsTbZfQFCwqbUVwL2cdm6S6rVOPRSmMMsgX1Ghkv5YG1Gra02mHzL0tNzRoTlV
	ufNcZISaLR79uXLX8qBampyIATzL98jZ+/Tz7izwbln7BDCORtT+/RcKYTAA2f+aQ24B8nyuaD1
	RNWRHxRWIO91jJuQpWWMwTW5uvyFiiznc8ejNdIeHCAd36LDkGKnZ+0+31rXmrbNZE/viqcHZRG
	nQCOcWfBVidOMfhwxn230eINTSGAk6bjb2Ih2Q3Wsjq/q2dzkFiKOfFg9yVNQ5Glhv20UK7xrCO
	M8X+hbUvZU41HjxwvkH3k08N7i9mAFCMycndV+jH/Wa6C52RWfJ4KwJL+UyakseqDA==
X-Google-Smtp-Source: AGHT+IGmha8Fr2gz/FUW8U8A5VVRA9bYdMwRke2TGOO5wTQdAYbyURhNf7j91OLXxy4jdG7Mg7idRQ==
X-Received: by 2002:a05:6512:159f:b0:545:54b:6a05 with SMTP id 2adb3069b0e04-54b012668cemr2795574e87.45.1743147862054;
        Fri, 28 Mar 2025 00:44:22 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:44:02 +0100
Subject: [PATCH 12/12] ARM64: dts: bcm63158: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-12-e4e515dc9b8c@linaro.org>
References: <20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org>
In-Reply-To: <20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_004423_722342_823D5666 
X-CRM114-Status: GOOD (  17.32  )
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
2.48.1


