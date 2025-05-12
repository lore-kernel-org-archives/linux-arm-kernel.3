Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26933C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MYiew/7MjE/NSPkg8zeewtIqLpitjfhqjwjRNOSYf0=; b=UDAlYVWTaZXr48rq/fs3ILTmtK
	y6rEEp4z5mE0R3slScQCmeL3HMvI9Lrm8J3a343gswH9D9s7khvLeltDgWHDbiWK62+j2P7++0slq
	nfWoGWyPYfaD1yfFocUDkIw7vmbJqZUVOtTk5iqDyIF2yfIpaTGOv+0wcvezbq8RL8y2nEi5ZozWV
	+EBbkGbYy3L5/99wN0ghnpODAeytCdaxthMwN59m+uYZO2txYhK3svoHLFp3hOhtoca+JfrZxwREU
	1cGTgYCySKfJ7jshjIxw20ijVND8Bl/+At4OuNwf0j1n+K88091R+BcU72f6160Nj5Id+SEaGhKU/
	A9VB23PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESN9-00000009Oh7-3dwv;
	Mon, 12 May 2025 12:35:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERv4-00000009KyV-2CWV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:06:07 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54fd1650b83so1667561e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051565; x=1747656365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MYiew/7MjE/NSPkg8zeewtIqLpitjfhqjwjRNOSYf0=;
        b=e0kcIwFYD7C0j+eOEorGAuQVHrydW9BZ2kZh//HOq+64IyimXvvHSD+rZf9NpQjFWQ
         Om4RR61h2Mc39rllW69EuOhLzlk1C4aHprtfF8GIIxyJIlussD8YLu8/T+JZs/5atV3o
         wO7DpXUqBh5fn+rxm2OZ/xZKMhxFx5CqZ7dKXACy5YTe2mNaxk5S9TB1ZY3tunrCYFFr
         sRLa0uq52GXdJ93Z8DDx4RjpcGdBcpIT4zlqOR8FgTo74LDe5986nLbrrr3fPNoM/xij
         GbWpmeJLCA9PzuSca+tchGd5dG0BaBDjVMcL4LlkG1RjO0ZJ5oV1LcJ0tn8PR6WRVK0s
         +GxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051565; x=1747656365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MYiew/7MjE/NSPkg8zeewtIqLpitjfhqjwjRNOSYf0=;
        b=Ao8htsZwjgWVZHZH/noDp7uzfLY/nAdT4iskYFVUBv3J1V3NCLQ9o6gKsWwzJjm7Z+
         Bwen8KUc0jAnr8/qWL0IuXxcsifwMP9c7Jhxq6pFHLLRW16FfLei7jYdVNas1MigoYfC
         7K0Lt9xgv3SrjeW0s95f/afV0M5/q9XcDjepysDU/hSFHyDarVUY56jz6yPHhq2V7Ytn
         cM4Dsssbk/MoeyCtoqpTo73UEi/Co2tj5ObNn2kP+K3v6mcUKNEqXdJ8wAnj6aADdSOF
         IdxC+5c/ScfAsKYZIsssOYGmze6JZkbInrLoQcyL0KVn6VKey+6Ht5NMfe8HoNZ2mlmk
         9L9g==
X-Forwarded-Encrypted: i=1; AJvYcCU5nhVIV0OeYWVW6szIHqbEH5pFxOHjPnrfdihTzWgYLMRGwVk9j3/EuLJBnZDOvbLKODx9gYOcWU58F5p697p9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3vzQICFmOiBeKIkli33LQuYKdIZLec2w78jKot2q0XPyBhnhG
	fwhElopgpqy30d41PHVgBj68OqGgPa8E8bbqYFBFk+NLo+Xy6T16sxHjSa7FigY=
X-Gm-Gg: ASbGnctNTa7TA6ACoFlA0xWaYjrfTyBwjOc8K+ZIjmw8GCdFylr6W3rP3g4+6cbmXBd
	fP+uyPvI5a2EMEeClnZk6eKRrOOfXfSTpvdTmTXFFioARqF4mfIGmxIqiAGRo+/Za0wsDMmYIIV
	Mdd3mtQyvg7BCITa9YTe22pnEmUsBqKOvsKIWYgaURC8MHNB87SLX7i9OeAVawRhGLUh6sffR5j
	5B7F25GxYdYsbZPAimnmhX+SE7fiEuZgVAgmTpkXyY48ZJh/7JuZGDc81kF4ImWDx+rCQkc6SNs
	Ki9zo/lR+C5DhFJM2uDIu32EJarJoo5IOe0b6i0OxqzftLAaTShWohL1ppZ7VQ==
X-Google-Smtp-Source: AGHT+IEEk2VZG3z9Te9sVeOPNqXXigxd1r+ev72HZog3PhTFGJpu9Bl5l1Tn1D8zxgukbGbiw9kC3g==
X-Received: by 2002:a05:6512:4381:b0:54d:6981:4b83 with SMTP id 2adb3069b0e04-54fc67cb105mr4892037e87.24.1747051564927;
        Mon, 12 May 2025 05:06:04 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:06:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:57 +0200
Subject: [PATCH v3 11/12] ARM64: dts: bcm6858: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-11-86f97ab4326f@linaro.org>
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
X-CRM114-CacheID: sfid-20250512_050606_573422_4F8E3F61 
X-CRM114-Status: GOOD (  14.70  )
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
peripherals at 0xff858000. Extend the peripheral window range
to 0x400000 and add the DMA controller at offset 0x59000.

Add the watchdog, GPIO blocks, RNG, LED, second UART and DMA
blocks for the BCM6858 based on the vendor files 6858_map_part.h
and 6858_intr.h from the "bcmopen-consumer" code drop.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi | 119 ++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
index caeaf428dc15db3089bf4dc62c4a272782c22c3f..c105a734a64897e714ed107e0ddccc5eebd415da 100644
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
+		ranges = <0x0 0x0 0xff800000 0x400000>;
 
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
@@ -170,5 +274,18 @@ nandcs: nand@0 {
 				reg = <0>;
 			};
 		};
+
+		pl081_dma: dma-controller@59000 {
+			compatible = "arm,pl081", "arm,primecell";
+			// The magic B105F00D info is missing
+			arm,primecell-periphid = <0x00041081>;
+			reg = <0x59000 0x1000>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
+			clocks = <&periph_clk>;
+			clock-names = "apb_pclk";
+			#dma-cells = <2>;
+		};
 	};
 };

-- 
2.49.0


