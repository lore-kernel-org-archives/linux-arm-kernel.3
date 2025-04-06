Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83890C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rfw29M1YC9XFEM8I1QgE6Co5IiNp1ynpZsURBnbzUc8=; b=1zXG5x2/SW5xWqb79J0r54vOFc
	VuK6Vby1AeL4g274+6Es5gHF/m2FIAWfntGq4q1GzrMKbz7zvdqoYgIVIYNg5/onCigV/4ZU5i8sx
	Bb+q7Cyxf8HHvdt/kID+3eSRmKXyS36H7BqgTsk9ZSG1ycof0zQmJJ2dgrMvu+LzhASgIShNK9/kr
	jAqIqMza/ckvyQLGymMxqoYprwvNo0p8RObw9aWC7Ywn5/w/9fsdXw/ab1bvTUTSVKED6nXpQ/7Hh
	NhGLoXbsyQjNU8udjhGLIfl6vHyIesnSoybI9unOuu4ys4nRDbDCNf/2EljtS73XTPbbRpR4qVWXS
	6DjQV07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1SJt-0000000FVwg-1ZiZ;
	Sun, 06 Apr 2025 15:54:01 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzX-0000000FUEF-2Wwv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:33:00 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5499614d3d2so4079653e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953578; x=1744558378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rfw29M1YC9XFEM8I1QgE6Co5IiNp1ynpZsURBnbzUc8=;
        b=DLuqhKXxaCgZv+JZygwKuYlieEwmUmwqz3geLDt0MTuXi6Yb7kIYpPx+fhfPGny4wY
         LrTqfM9t5x6Gs2tTfcnUyS5M0oROM54Y3PxXHm7orAwRaqYaBsms3Otchxt3dQZ4vV+7
         Zgev8q1OtMxe/zvWJ88MOdwZXJXe+ZtsDnCG6qeM43v4OViGg5Vh62cd8dzn12odvnbQ
         ZttAuBZTHazV8JpDebvIm5Tk6njvcGI5BzAE15PQFaHHI8Y65b+LEgLLIBJOtS3RZa3a
         KQIL2Bv4GDvwWGr54GlA08NxsDqiT2Urhtq8XJfTgkFIXjOmCTVkNIz5FQ7Kj6I+jz4E
         bxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953578; x=1744558378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rfw29M1YC9XFEM8I1QgE6Co5IiNp1ynpZsURBnbzUc8=;
        b=JsHoBakeH74q44Ql3fSfwIUYnvgZBSxQAbCxmM53+D78W2Op/8XfLKZewuwrGwIC9O
         FZGiDtkrwc626DjwYnygNCZLQ0Xjq/TZoGmvTPuzZx2cY6gEwrHvE6pBU5o5vlI3a7Sv
         FIIP+LQ7Vi7PvQxV8J/6pDj/4GxnbJwxBi0YUenvFQOTnK2Ia50Sq9phhgQVUVljkndq
         hG5v80bOEBbhbD6lSfAheEEPCWOmg7DWtnRhlVqRxuWtp9H8LZlvVJlrlYrfozTWkkHI
         H5gANNNLg77MciatdMcXSpk3VwO0uJdojZw7vxTVbBi+BwxvNl7cJTkiP0gsA9MCnRHA
         WUuA==
X-Forwarded-Encrypted: i=1; AJvYcCVWQFkLaWSyEDNzBkXQyjfzmMdZFBpY8qYo+kw5nt8tEE/ihOMPBS+6Aio49oT+Dhz5Ms8wEM932pactkuinHVv@lists.infradead.org
X-Gm-Message-State: AOJu0YzoEZiWoWy1g3S52rsZlX+lxe/h3LKQ6MfKdvvWaN9MzyH7ZZI8
	/vyRIM3t3Xqmp8jEjFGlMh6i4XFnMILFHBRdVVqafeXjVioyMejNL+ugzwmLF1o=
X-Gm-Gg: ASbGnctaWYwzNIOlqEvtFG8H6EA3m0jv1YBmZvPg+/vWNHJxudCv7CJQr1BD2PkSifo
	qTpezTZTepWzbzbG52RPP0Cw4qZVidLQU2SnueG0qg8qBs25qVeqkJGLWE+QhhOYOFDAMCxc3XF
	oBEe0USWdEHniujRNFp0ysBNWxXwLaEAKytwiyT2uIYkfO+L9j3mt+Sf7PJPo2OvOoOhr8TpV+3
	jTWgdEYh5JtoKlutHxXT5JmT3gcTYuyX6jKf4LnBMqSPl1hDOzQKGESKeU5ym2/RfBM/Rf5VIjl
	J5D6cpyt6M17KMiJbIN/oechHLmpM/FajCKRuDclm7v+ZCvA+/ZW+ap5TgdGKCWbrA==
X-Google-Smtp-Source: AGHT+IEUkyzkL0J7M5KnLMNvYFvrvh0lK6hSoUd1fasgJ+0yTB0AYLW6EM3ZZUL9Y1uNKBF2MJkRiA==
X-Received: by 2002:a05:6512:3b93:b0:549:b28b:17ca with SMTP id 2adb3069b0e04-54c23346dbemr2379200e87.37.1743953578087;
        Sun, 06 Apr 2025 08:32:58 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:51 +0200
Subject: [PATCH v2 11/12] ARM64: dts: bcm6858: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-11-22130836c2ed@linaro.org>
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
X-CRM114-CacheID: sfid-20250406_083259_648528_CA464D90 
X-CRM114-Status: GOOD (  16.49  )
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
peripherals at 0xff858000. On BCM6858 the PERF window was
too big so adjust it down to its real size (0x3000).

Add the watchdog, GPIO blocks, RNG, LED, second UART and DMA
blocks for the BCM6858 based on the vendor files 6858_map_part.h
and 6858_intr.h from the "bcmopen-consumer" code drop.

Curiously, on the BCM6858, the PL081 DMA block is separate
from the two peripheral groups PERF and PERF1, so we put it
in its own bus in the device tree to translate the fourcell
addresses.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi | 127 ++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
index caeaf428dc15db3089bf4dc62c4a272782c22c3f..38331305e6da8eec39d02aeb0e02f3b45e2f5c4d 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
@@ -111,11 +111,12 @@ gic: interrupt-controller@1000 {
 		};
 	};
 
+	/* PERF Peripherals */
 	bus@ff800000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x0 0x0 0xff800000 0x62000>;
+		ranges = <0x0 0x0 0xff800000 0x3000>;
 
 		twd: timer-mfd@400 {
 			compatible = "brcm,bcm4908-twd", "simple-mfd", "syscon";
@@ -136,6 +137,86 @@ watchdog@28 {
 			};
 		};
 
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
 		uart0: serial@640 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x640 0x18>;
@@ -145,6 +226,29 @@ uart0: serial@640 {
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
@@ -171,4 +275,25 @@ nandcs: nand@0 {
 			};
 		};
 	};
+
+	/* This is NOT in the PERF1 Peripheral group on this SoC! */
+	bus@ff859000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0xff859000 0x1000>;
+
+		pl081_dma: dma-controller@0 {
+			compatible = "arm,pl081", "arm,primecell";
+			// The magic B105F00D info is missing
+			arm,primecell-periphid = <0x00041081>;
+			reg = <0x0 0x1000>;
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


