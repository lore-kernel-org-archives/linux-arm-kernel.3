Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78EAC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAqlz/H1WtWods9o2Ni6pCtC3hYNHkIu6IGeMm5XJSg=; b=A+dz2pYruU8uUt1I93xK0ouV2d
	3AaZKjCw0OZ7ncOCu7Qi16tum0q9Ruqa07k/DHglOWahVAfuc1aXVEWNQ+SfNzy2I5NQYbyEISt+4
	FVdUpeauAHdfBkzS5jfrFocg4pXYTQT2KbijH7ZZoBK7E4VauE3z+kxQBV/BgJvHRFaurYj1cUIU2
	zraUvIPDAGmA9GZCp9ezBWePtwuCaZb50NjHxsNpK6Fr30OKO0SFa4zUjaFuPDyxJ49LW4I93vTnN
	ievtUSswNUwkPTiU3XMDHsYghShSuuBaNPxjv2PMstMPhpqgZfKq5eQqVC4buB/WQe5W13XvDEw2c
	A6FyPUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESPF-00000009P6M-2W4c;
	Mon, 12 May 2025 12:37:17 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERv5-00000009KzQ-3YEt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:06:09 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54ea69e9352so5795270e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051566; x=1747656366; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAqlz/H1WtWods9o2Ni6pCtC3hYNHkIu6IGeMm5XJSg=;
        b=U/pJQsxAt4itbEk25cYkqcENQPKmAmOGIDw535w2ksXCuzbOIZQbBT0Nm+PoUn2QQn
         KmTOAy0rYNZcNlUTz+IXNJYxQZNNvp9Dnu+bsgn0vMq3Wj/jC9sQ1w24h5Ix1SafP+SM
         EUY5ZfzH7lRcdzmGD5bJQU5Yqy1mLCt7GP7htXLvU0gnMdO9QejdPKO28VHdGSrlyvhQ
         FM+Ylbg+F3hhojnzhS5HjzMXNsYWodWDjZFHQw9kOx9Mc4GLoCNCFzSmiAYndC9L2qca
         GvOFzxBLCNVYpsQK9cy1MB5OE0yoPEF3+06WFLXFDb0JqRT2YtLbOkK1/CSe/rQ9Jhaf
         uxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051566; x=1747656366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAqlz/H1WtWods9o2Ni6pCtC3hYNHkIu6IGeMm5XJSg=;
        b=ns72L1bNDqoodYrJHbbtjJjn/sh9/YXDpy5QlXqqVjWcYIOwBP9wva8KfQ1kSteHM9
         WyEn5YkctB6td96VDcLWrE8aqPdggZCweSc7OUw+Plhfk2Yc91U/tHGPgrPBgVBycWWR
         H3sLWS6C3D/LXOAODuCv7bU089cU1K/z8Nep7byiEoTsu5LAus1h567gwUG62eaRtCGR
         MANFERnsK1AatxIQ2MHflErZ+5C7CfiXWXXgYvgj/jx2pggNFBlAYTTkYjWo7HAlngrG
         G6F8odg9Nk63LcbDuE5TBXaBE5yzZ36OEFba5E3TIG4XdpfslfJ4/A6tmh+0ehhByPPH
         ehdw==
X-Forwarded-Encrypted: i=1; AJvYcCXao787sD28gerXPlu4U7+EWrTHOWk4z69UNSMlVLmeOWaVPB5RWs6LoL/POat+E7oIdgkCV3N/CGLmwGqQSlAf@lists.infradead.org
X-Gm-Message-State: AOJu0YwT+98f8dKtpXeQZszvH0enL7+eeGtpFouevNpBs7ke/ivoOa27
	q0runGuE8MzwW3D2JGk6dv7rDL75MPQoA1DNbIV1ICG0Fn7h9CnFiFND1djlHtI=
X-Gm-Gg: ASbGnctNSn4oNIeaftjKQJiNPzDjFiR9RcT99OgQp+KCz1jLzTwWy2wQ4m1Bxsb/mqk
	Xt/qRwjw3vhC+auACC6s0NyhfsMwcYYo1uNlxINcy6HNuGdr6grf9sfCgL99yqzuxBLAXAD6zPm
	ugnIxEAds7wjWIIHFFhBMxuBtxuqSCoM9g00pbsFCnR4vidtggZax4ptJWV6KDBS+Ne7QXMyQid
	L8kqudACs8aB/olL8eUe3YHYgTAIhCWJLbxGJK0wq5ZnB0qXpO2j4Pu6HzEx6quT8rYnNz9NePc
	4NJ7mxWRAfPTEKcVp5ug5lNUdJIGsKauUhN25cpKg3+fJYfSd9dcc+a5a5srsA==
X-Google-Smtp-Source: AGHT+IEQ8d0RPcbivpJy7xsvoNNoWD7jWtxDLkfql2z9LQbZv6z2/xgjHKVHKznqeLoUoImWcuDORQ==
X-Received: by 2002:a05:6512:660d:b0:545:62c:4b29 with SMTP id 2adb3069b0e04-54fc67c5b72mr3878290e87.22.1747051566192;
        Mon, 12 May 2025 05:06:06 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:06:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:58 +0200
Subject: [PATCH v3 12/12] ARM64: dts: bcm63158: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-12-86f97ab4326f@linaro.org>
References: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org>
In-Reply-To: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org>
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
X-CRM114-CacheID: sfid-20250512_050607_905575_C3481911 
X-CRM114-Status: GOOD (  16.52  )
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
with varying IRQ assignments.

Add the watchdog, GPIO blocks, RNG, LED, second UART and DMA
blocks for the BCM63158 based on the vendor files 63158_map_part.h
and 63158_intr.h from the "bcmopen-consumer" code drop.

The DTSI file has clearly been authored for the B0 revision of
the SoC: there is an earlier A0 version, but this has
the UARTs in the legacy PERF memory space, while the B0
has opened a new peripheral window at 0xff812000 for the
three UARTs. It also has a designated AHB peripheral area
at 0xff810000 where the DMA resides, the peripheral range
window fits these two peripheral groups.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi | 129 ++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi
index 48d618e75866452a64adfdc781ac0ea3c2eff3e8..a441388c0cd251d7dd5381f7b559633a89693232 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Copyright 2022 Broadcom Ltd.
+ * This DTSI is for the B0 and later revision of the SoC
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -125,6 +126,101 @@ bus@ff800000 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0xff800000 0x800000>;
 
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
+
 		hsspi: spi@1000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -151,6 +247,21 @@ nandcs: nand@0 {
 			};
 		};
 
+		/* B0 AHB Peripherals */
+		pl081_dma: dma-controller@11000 {
+			compatible = "arm,pl081", "arm,primecell";
+			// The magic B105F00D info is missing
+			arm,primecell-periphid = <0x00041081>;
+			reg = <0x11000 0x1000>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
+			clocks = <&periph_clk>;
+			clock-names = "apb_pclk";
+			#dma-cells = <2>;
+		};
+
+		/* B0 ARM UART Peripheral block */
 		uart0: serial@12000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x12000 0x1000>;
@@ -159,5 +270,23 @@ uart0: serial@12000 {
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
+
+		uart1: serial@13000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x13000 0x1000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_clk>, <&uart_clk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@14000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x14000 0x1000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_clk>, <&uart_clk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
 	};
 };

-- 
2.49.0


