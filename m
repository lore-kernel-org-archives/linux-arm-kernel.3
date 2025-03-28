Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35458C36013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 07:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YR4tw573chI/SmSNQiSCUnriSXeZaFDLdhuvK4Xv12c=; b=WvJIsYbC/1m62Lvast85lHuFBV
	QxkwmJiQPAwMPnDqY7uToV09dZLM6kNsg1NojbWXtPbs9sBZuwdd13JXTIrzVa/RzPu+qjqeRTLHB
	xCTyUdtvjBBs1JJdQLxCNZdCU64yJTBrphxfXq5YwjAhLE2ek5zAB6otROzVybJ1aCCX1ukUWHR48
	dSPbSnA+EypymD7x2TIf9ExtRNJTz3UIJ8/oqiOz7Sv+LiONbjdEf9b8AsBPBtDkJp7vJIRDHuiEE
	QxYV7Ie5LsmpnlyJmReQ2+0Gevmvoi2g4fCezDPCmP2uWEEN54SyaOdDF1LdjqIkbxGnUEZ673ffl
	iEMfVkFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4WN-0000000CqW3-32CP;
	Fri, 28 Mar 2025 07:52:55 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Nw-0000000Com3-0pfX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:13 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso2189540e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147850; x=1743752650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YR4tw573chI/SmSNQiSCUnriSXeZaFDLdhuvK4Xv12c=;
        b=s0pwXQuDh5j1eIGUjK2efCFBWzrSSw2CBjhzZmSDL7PeJGBwgoYdA7hIGzCCiXbEAk
         MRv8AWSySS8giF35QEIrayWALrm/PZ2xEI2bD9nVgc35RJcQq4oA9hwR+jkoE5aTaDx1
         SZ52Ho1rMxxpaMB8mySow1N++KU/cf9Z0tHqKs+UHBVSjQsC3i20uMsZ5qse8EOZ5a/C
         gMbxDXNWYOSu9/10sCiNJ6hMh1K6x6rdedbhl82+48KCSLHjYi9J1ZyonoEaufO99Aqd
         Ea3npLSyjn7rWIaQ/BGv3UJYL1IuInLs3FdKTySxnvTWWx8FmYFU2vc/ub6/sqrQWWk/
         BeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147850; x=1743752650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YR4tw573chI/SmSNQiSCUnriSXeZaFDLdhuvK4Xv12c=;
        b=dRSNqSpq2zsDuwlL11peV+Gj1dqdq4ds8CfX7zdbMtFHRxX2r1Ho9PK6Ofp9iQ3Fm+
         6HL84yXD0JTvrfj1bmpysgWu9GFhBc622I7Y4RNkilQ5tpXAkGitJ/AJCaKt1BNTRlWB
         QpNKiokvW7SITcWr94oHiLC+1X1rjjxPArjQtwkKLH52HGJJAFiNqd2jdIPvskhxuGiB
         YJddStPuXQgqsQWTmea99uRJhbHZs4XRbQ/Uk/EUOv2bveuTQ48UnwjYkqsYbWmhUrSd
         D2uInfmS8ZwzjeovVKA3LOtsjr2m+ATBxS697v2b8Rw7WITTLWn8pfS18hoqiRnVy6WQ
         7OJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY6alyiKPGc1p2MBEz/tkpwOoygn3NmuNrRhP5ruAsruP6l4I8kNpJePyFhoxg3yln9Q2kcvZNPVhKqrVg4wSC@lists.infradead.org
X-Gm-Message-State: AOJu0YyaFqm5oCgEPhU8qOyFI2c0ZSbMr8XouZdR8rbEGFmHHzU9sHJh
	igPBs9YeK26/ntyptZPIO1LNWB/rhX4Gzs5uDl+QYXmLAozDdxx0PSOe6SsM2kHFJH8DU7+2JkN
	imrQ=
X-Gm-Gg: ASbGncvOrOSGEjo48/B90E1Sp/XSeIQyYsREsqRTISJQ/a6e8nILpnxklSpVVHkZpOy
	gG6qdIHHdyXM5ZcJ7fTjCbf+3zLSqGEFpYCR/bOXobcAptvUUmxiU2SGtbBfOYIwzB6F4epu/JQ
	Kk1mihVqdz/u82X5n8ysKnZdtOg4ZvBTT0Le6IcUMTyKVKr/Fv9HAFaDI80m8bpGkD69PEVJHT3
	X/4JkRW+H9s+Gj5v2OYKpsvvvKHGehYhO6MEulI4vZ4ocN+b1LpeOto/kccrjV1QR4zosoCSBXe
	oS6Eedz3DK+AKn8YEzzTPcXIw79rE5unzS0dfsPlcmG52E0UlMGwjz8=
X-Google-Smtp-Source: AGHT+IF/ArmOEOXgXQfLBNjjj8sVYQ+qLLQU2T2u/X0I6BLM6MCN9j17POGFH6OdY6C2kgn4C8GWFQ==
X-Received: by 2002:a05:6512:3b9d:b0:54a:fa5a:e9b1 with SMTP id 2adb3069b0e04-54b011cd656mr2461814e87.10.1743147850260;
        Fri, 28 Mar 2025 00:44:10 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:43:54 +0100
Subject: [PATCH 04/12] ARM: dts: bcm6855: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-4-e4e515dc9b8c@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_004412_246838_5DA3963C 
X-CRM114-Status: GOOD (  13.25  )
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

Add the first and second watchdog, GPIO, RNG, LED, DMA and
second PL011 UART blocks for the BCM6855 based on the vendor
files 6855_map_part.h and 6855_intr.h from the
"bcmopen-consumer" code drop.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6855.dtsi | 127 ++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6855.dtsi b/arch/arm/boot/dts/broadcom/bcm6855.dtsi
index 52915ec6f339335d87b4e50e1c03625fffb9a45d..a88c3f0fbcb037ee5c6b31933415f90cb51ded2a 100644
--- a/arch/arm/boot/dts/broadcom/bcm6855.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6855.dtsi
@@ -116,6 +116,103 @@ bus@ff800000 {
 		#size-cells = <1>;
 		ranges = <0 0xff800000 0x800000>;
 
+		watchdog@480 {
+			compatible = "brcm,bcm6345-wdt";
+			reg = <0x480 0x10>;
+		};
+
+		watchdog@4c0 {
+			compatible = "brcm,bcm6345-wdt";
+			reg = <0x4c0 0x10>;
+			status = "disabled";
+		};
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
+		rng@b80 {
+			compatible = "brcm,iproc-rng200";
+			reg = <0xb80 0x28>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		hsspi: spi@1000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -143,6 +240,27 @@ nandcs: nand@0 {
 			};
 		};
 
+		leds: led-controller@3000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm63138-leds";
+			reg = <0x3000 0xdc>;
+			status = "disabled";
+		};
+
+		pl081_dma: dma-controller@11000 {
+			compatible = "arm,pl081", "arm,primecell";
+			// The magic B105F00D info is missing
+			arm,primecell-periphid = <0x00041081>;
+			reg = <0x11000 0x1000>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
+			clocks = <&periph_clk>;
+			clock-names = "apb_pclk";
+			#dma-cells = <2>;
+		};
+
 		uart0: serial@12000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x12000 0x1000>;
@@ -151,5 +269,14 @@ uart0: serial@12000 {
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
 	};
 };

-- 
2.48.1


