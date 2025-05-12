Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F0BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEf4cNwCAvTux6g5ErQoMK0ZXsg4RGhL1cTSbSRkU48=; b=453HUi02k0EU9suDba7outsmYj
	AHTekpuWvSuqUSNjBZKX3SdQSYW7qYxy1D+zZ/KdjvmeX4wbMsMcaEaGAUFdPMFPEijYmb2loennX
	OQG3TFz53CIxn+CgTBFbaWAT+1cVfOZOA33RI1ea4mYS3GE39HzkuJJ+I6+G65gN8EHmFllAcy8Uq
	kTd7i0sGo3etX0CNaf5PUn3KjBUh+3Q/iZ0RCS/pkAv4KaqaY7gPpek6+x9HDc79BLm6te6F2a3lu
	o/gla+PD85OOELV/y13948slqNg/+Od39XNsCQYJYWDgsfDVkzCRnWmoKgwoEA/HHijyzBA3gK4aC
	oORSdRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uES8t-00000009MkP-37T6;
	Mon, 12 May 2025 12:20:23 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERuv-00000009KtT-3nOi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:06:00 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54fd1650b83so1667324e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051556; x=1747656356; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEf4cNwCAvTux6g5ErQoMK0ZXsg4RGhL1cTSbSRkU48=;
        b=gpAyxd9m+kibddIZZogXy53ACXMFAvE93Y71/qkjmn24iN3mR0VyBTlMQ5mNkauc2T
         MDZbyGogBNQqa4esSSNaGvp4uhi9eNx+RFazbKshXF1NkV46/CXtYySZ/Z6YOkBM+9r3
         scCpMi4qeDYOHQObJRONoBv13FopaUXoFF7dI0xt6ByUnk2dSuS2z7UmBcKgn8ISy9el
         aIcPTfxKmg9O0nowNWVeXp67UCqHyZKWgnA/h7BIURmw9bi7fndDxPTB+jNAfBhHmS2D
         mixaDZk1/Y7gM+ZJPbpV9Fr6TCryaIO0TU7e0ZpKEQyzhvW0TkorfLdZIjXZ6UmrbGF1
         jmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051556; x=1747656356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEf4cNwCAvTux6g5ErQoMK0ZXsg4RGhL1cTSbSRkU48=;
        b=Jum9vZnwgDjs9xTcCGShBbx6RMKrrxRZeTiTd/5bCTE0jncxkIOcK3TVd1v3xQLDuS
         ArP30s6b+OhPqqlx+CR0O06v81cnOBsyKeHUAk37Tg3ed1O+DTiswThmnYu/AHoDaA6l
         3Ho5eKVdnODwG9x35ccBbBefWK+xgjsqCU0dyTNIomSS1/OIRSlTHpCN+/Z7hqCZXGM/
         ZtbJQLa0zLUX1NYVKSvxbjiU6UIVOthQGvvzPy0uLKrcUvlQgbeDE27L9G0srBYbW3q0
         gnCpgLNu5BsJJrlt9XzkbykmiHASTZDd2n1YO1BoS/P+A9hTUqyBYv2KMeXVLLg5x57f
         RFAg==
X-Forwarded-Encrypted: i=1; AJvYcCUNwLEcmlp5hIeOoDjZv7AXgquXCzPqDFvAfFqLQRybpLNtILSKLT+YbUSiF4zuGmB9NAzUoEntP6aBvrUU+zBS@lists.infradead.org
X-Gm-Message-State: AOJu0YwplZYpg+3zIpOSQ7PsZncn4/OLM+fmmixF20ks+FsVwQBS8Xbi
	coaa1/EhX6q+inMkr+M8yOdN71qjR2DVl7eCvqWgafylKgKNH0gqeazV3M6W86o=
X-Gm-Gg: ASbGncvMExxJAxhQyG/V2AzouC83qQsDj8dNfrGXbpLqG3koKZcxqxVG05UTABd7L45
	BEdw51KPHsZkRHhUQIbQupJIKXzu1b9JSnSbvYg9dxakohi7sNmPQnk71/KrBAikwRNRqZofe0s
	UWuMf7rkWZFJoyDUUi0NbCGnMyf9fM1xoAY2xEqyUvEt0K8kIXo3+a5AD5l2ZTqJG8W17jfx63t
	7SmZYI3EHlTHt02Va5nDo/CZKyGdERyOcx1TMMAlQPUpCQmtlY7+nI9nAveO77ZLfZ6SPqzZ86p
	YdnsUHrmVY10Bk6LPdIdZBX2hYY7dnt5FOxZkVbYc0dPv//sNdcMIQHYWRsahA==
X-Google-Smtp-Source: AGHT+IGF/tN/73qnDBRQZZwG62q6XEIuTj2FHvkPQA7oYljHSPxp6v+OZz7XCPfOwL4Qtn3HFaA1zQ==
X-Received: by 2002:a05:6512:1406:b0:54f:cdb9:598a with SMTP id 2adb3069b0e04-54fcdb95a59mr1867410e87.39.1747051555930;
        Mon, 12 May 2025 05:05:55 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:05:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:50 +0200
Subject: [PATCH v3 04/12] ARM: dts: bcm6855: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-4-86f97ab4326f@linaro.org>
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
X-CRM114-CacheID: sfid-20250512_050557_969090_A91AC9A9 
X-CRM114-Status: GOOD (  13.41  )
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
2.49.0


