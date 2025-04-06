Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9E9C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMV0L0+THdEhKdsNmNESmpAlHXgmh851fInPOyFXPJY=; b=oGn2Wl+ou5139W/FRzsSNz+i5z
	gdpYxe/7E8FUTI0PSd4H9hIPZ7FRKavDZbh47Yx8KZXFcOjeV+ZRekDbwsOaBwcHOdCVN6y0jSAJ0
	R2iXTWDeXYuKyLsKQ/Axd/yvJmDQdk7gNoFE1Sh2GlmIK4uVHm7pZS0TvGPtZDQBLQNSrmU1XHVd3
	r1xw/ew/UrsHtgFNLowPlKWpYeetw7jfV/80tosVBLJuuQYZgnjMiypA67fmal3fZN+yUbZ4KUt4c
	EzgbQZlGzXhf4R3BiyKzaW2u2AN99EPr+/jKlDZKIGPH5V+/pYQocimIyarKxlk6iLFFkH1MF5K2u
	eFMLTA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1SIA-0000000FVpO-2xHQ;
	Sun, 06 Apr 2025 15:52:14 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzW-0000000FUDR-1jfy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:33:00 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54addb5a139so3988444e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953576; x=1744558376; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMV0L0+THdEhKdsNmNESmpAlHXgmh851fInPOyFXPJY=;
        b=Z015F47fmqqpiEVNJRsGNJJRKOIEnIINGaBK1Yr3NRSqrvXoCacjkoxcndH51jKT1K
         6X0P4FiCtDKWrnSPi6TSvvdiTLZ2B7TjpV6hh4XWuVOc2DaE+RdFuImCRWoHkfPaBTs4
         7peQ9yzGRhZqefa1XXyDJx3KeunNJucUuyN9S+KIxAXqpZSKtoZsaWUPZPFD8fulFoRx
         vMWjP65Kf/MnbIKbsJvlmfLoeJ5hbJNjQxNbvPr7nXJu7R+J+HDPsTTTYUrR1DGiYc+E
         dpx00ipcyaaUYSsYATbi+e+DacMOrSc0YyNxhKp5YXx8+0+5+65AmugFyzjPEDYRXEQ+
         kwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953576; x=1744558376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMV0L0+THdEhKdsNmNESmpAlHXgmh851fInPOyFXPJY=;
        b=fBi522ZowflClq3uhfyQYGJG5LpmF1tojgAP+EfUinz0i1oKcSGPkM/Xg7BKv7iWY0
         095iGWf7J9k5HGRSjxqdjM9soCEA6un1ptFcoAmO6s5fALcryuHbVGpGmiTvTxWWB3EG
         0/vg3aPUJ2vHwOHouvqGcKgBuLMtUrkIbXIvxAzyzj/hRdEzzPbyhRRo6+ii+y7C+7SG
         7hkem6N8fS7AuDGj4hEIG/adyAt+MMhmV8LlTZg46P6AyBR5763G8TndkN/khN15X0E4
         YOQjQFZ7kE+PITrA7LeNsCrR0GD+SDnZJaIs281B1mLLJXPI1DrMZGBUkdTrmzB+DHsI
         x7eA==
X-Forwarded-Encrypted: i=1; AJvYcCXZNwB6tRSoFi7JsmXORT7jV9pfshbgT+KsjnxJcep7Y7iutJ19R8jBlrwJlMMHl0EcRzU7IlhAV6KLKZjSIXi/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp5IBqAMtL6C5wRbrlcMouKVypVJ8rD5gIx+WWyn5eCclWL7ow
	52jCsZ7qFrGNoUvHTXM20AvkZiNyNxeTULVEKePjIe26aerrVP9ZZpXQPa+GYR8=
X-Gm-Gg: ASbGncvfqwNu0zqOaA4VZNi1ycGIiEG7vH9cmdff2kKwXzRlClpUN5trKQP2Vn7IUVR
	Z3vf26EWU+fzxkyHx1ernpfHtiVQTxjolCEVEfvhqov8ugkm4Fib9JOTpKqsPNiDZOgIarztkjY
	egIrspe541sYGqXeGqjBNuOD7sTL+vphBEABPSAyF7AG305Nvn6shU/JYcRJSzG0glv1tkso8Jl
	owreDf0utA2I8pCGG4K/DLmKi495cx0Zf07a/WUOCpJHPkT6SPAlCEPxH30KyZoO3ckVKwoEDDG
	o5crxjK75Z6njAKgAItxMW1i+YdbfV8n3Kb7KO4p9Q0bgENjmbcMzDk=
X-Google-Smtp-Source: AGHT+IGmejp9qDxskZuF/W/MttOETDK6SM29Z8uze5MFHErOJIJUow3naYSenZ2O5S1vADK8+zXGAA==
X-Received: by 2002:a05:6512:3e1f:b0:549:39b1:65d6 with SMTP id 2adb3069b0e04-54c227fef71mr2527448e87.47.1743953576525;
        Sun, 06 Apr 2025 08:32:56 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:50 +0200
Subject: [PATCH v2 10/12] ARM64: dts: bcm6856: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-10-22130836c2ed@linaro.org>
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
X-CRM114-CacheID: sfid-20250406_083258_470425_DFB61B94 
X-CRM114-Status: GOOD (  14.35  )
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
with varying IRQ assignments. ARM64 SoCs have additional
peripherals at 0xff858000. On BCM6856 the PERF window was
too big so adjust it down to its real size (0x3000) and add
another window for PERF1 at 0xff858000.

Add the watchdog, GPIO blocks, RNG, LED, second UART and DMA
blocks for the BCM6856 based on the vendor files 6856_map_part.h
and 6856_intr.h from the "bcmopen-consumer" code drop.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi | 138 ++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi
index 00c62c1e5df00c722884a7adfcb7be08a43c0dc3..d6d0b8e1a65b494be414dd5841b65f8ff489d684 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi
@@ -93,11 +93,103 @@ gic: interrupt-controller@1000 {
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
 
 		uart0: serial@640 {
 			compatible = "brcm,bcm6345-uart";
@@ -108,6 +200,29 @@ uart0: serial@640 {
 			status = "disabled";
 		};
 
+		uart1: serial@660 {
+			compatible = "brcm,bcm6345-uart";
+			reg = <0x660 0x18>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&periph_clk>;
+			clock-names = "refclk";
+			status = "disabled";
+		};
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
@@ -134,4 +249,25 @@ nandcs: nand@0 {
 			};
 		};
 	};
+
+	/* PERF1 Peripherals */
+	bus@ff858000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0xff858000 0x4000>;
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
 };

-- 
2.49.0


