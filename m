Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7755C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XM7VZdytvS/9hUgz3c6+oanhzNKcJjPBC3I1WtjPp7I=; b=GpE9WWfQDKleshJD2cgQpliibN
	2B1l4jDwTX96uV62W9OvwurnkbHGIyygsM0Vghu6nL/unrTKRbEvaektxVGJ2odxP8eQ7zDcvpGA6
	UXk6EatpYAg8yID1t2PPsVqrYsUzP7tXjMLmEHCuRE/n+LVyjVCTZ8k+EGmKyDCX7KfNB9uSSYqWN
	CLBLkwJSXL4w50MVagg7whItyKWxjMptRZ0FV+O8MIp1NwFxsrLs/JsGbh2GdNi8b+48Yfj3kg8Ji
	wr9VZHrUI4rLoTMR0Mgds4XM5EVkANMZOfmWUbT3ku49Qy7TdZXTyulyR2gvBRhP5YITTRloP1aYA
	4//JV09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1SGT-0000000FVh8-07Jk;
	Sun, 06 Apr 2025 15:50:29 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzV-0000000FUD7-0CLT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:32:58 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so4501883e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953575; x=1744558375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XM7VZdytvS/9hUgz3c6+oanhzNKcJjPBC3I1WtjPp7I=;
        b=U7J6CyX7YFWEH7F/bR72UnElxRrOJliZ+GoLCg2vyWJhfs+7v6nI5KQ5PKtZpQ3RJs
         JhVXDhN+8P+I1c2yACUAsCJKV2EkiiQ6Jawy46D2LgrEzrSARcbsaPpSM9Hcw8kABsq7
         oHuNJ625Ll7YeYYmqbaHsee5AtB1fJVQ+mvxB+GD1KvAvg+Ihlfbvq3RKsy6S4aB37KA
         KncxsmO9CcMqsB9RLCMAVxpJ3MmQn6sqjRCU6ZK4++/soSg1Km8FC1mFDtrWF9lLTp5X
         Ont6ALc0C4HXy4I41ZCKn1BpIq4pOqxv16vPtAP/vxuU6t8GpWvcQoP2uhIXEOAJNDpy
         vlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953575; x=1744558375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XM7VZdytvS/9hUgz3c6+oanhzNKcJjPBC3I1WtjPp7I=;
        b=dp8b7WmdOLQZXUkBKpKCRMrKZfRrwobXWTLwOCE1jNcVI0ZUV8vgCG88BnmhjIrwXA
         AKwmz2Q/pVKR9X6h/WjR4qicZ5NAD5RZ6eKUwug+WOyu8A6TgGLDfN+7XfzqkgBDLocm
         uWTSUI26hSJaCp9Ku4G2C6mRDhF9SJDHtbhusKFOsHsX5P/r1WJ/6Pd7M2Hg+eSoqw1I
         6ZZjK/ozgn4Gllz/yBaiYvcMjSQd+0QV7RpaxIsF5ZuTV0lH4dGqTkKWR5tXOSvRYf0v
         yaM94mbxxybdyyrgHxEzPqmPfDGEGAvB2eWPOjapo8rpbQCtil9DUz7cFBKORVQPAK9o
         OGTg==
X-Forwarded-Encrypted: i=1; AJvYcCW0CQTyNNabM+m1VkMdlgAPpNwOyQbKKrAnZwob+Rtjup2xt1FHhdKmExvaAASf1kYZ0k56NWTpAHpChGIi9rT2@lists.infradead.org
X-Gm-Message-State: AOJu0YynWdRVYyDwL7ghVsx2/F13UlUn9sOylEdBknWNnxPhH3e9dbzV
	ZpUm8jkgot2iOBPOZoCDIoVZnPHJG9GyLjTiQXkc4PHb5qk9AgS5Foyqzxebcz8=
X-Gm-Gg: ASbGncvt12aakD6xtzkNsSeNwH3V/V1zWWEandn6jIqD/ZaZLgfJp4e4/5XbfIdhiTz
	qjHOGZ0eBlGnAo4mxVJ9nKIzOqUdTwAQwJJHguVG1Uu/2RMmsDN2J7GtGIAVXo3q3nShF4P/RE9
	flY0BsU2ZFB2a3OPlzRNPvyo/FLX9fjyKyDg9R0nPRHF8VAs2KzVfp9ohrVDSGWUIzip9CtQihx
	aTQnGLbAqOYgohTtWQvGWIVVC1MhY3fXJnzl5mGw0YuiATSbT3cVCL1q6H+I2VayohDjONfNNyM
	o2G6QmY7DBHsOTOOAavPlAiF/mxBLLQR+51eelUfDsKYGvH2w4CPQJc=
X-Google-Smtp-Source: AGHT+IGatGeNIuxIlqc+4azXsluaw7cwdCRqrVj9KzzeSUMPgq7VF7F0zj8KyrBeuAJmbGbwaI4bsg==
X-Received: by 2002:a05:6512:e9c:b0:549:7394:2cd0 with SMTP id 2adb3069b0e04-54c232dfabbmr2490447e87.19.1743953575548;
        Sun, 06 Apr 2025 08:32:55 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:54 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:49 +0200
Subject: [PATCH v2 09/12] ARM64: dts: bcm4908: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-9-22130836c2ed@linaro.org>
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
X-CRM114-CacheID: sfid-20250406_083257_105599_9FDF9515 
X-CRM114-Status: GOOD (  14.08  )
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
peripherals at 0xff858000.

Add the watchdog, remaining GPIO blocks, RNG, and DMA blocks
for the BCM4908 based on the vendor files 4908_map_part.h
and 4908_intr.h from the "bcmopen-consumer" code drop.

This SoC has up to 320 possible GPIOs due to having 10
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi | 122 ++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
index 613ba7ee43d6489ea0f1490d2fccaf90961b2694..a2e5277a2e77c0bdec5d933d3121b4ebf2d2d07b 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
@@ -323,6 +323,7 @@ pmb: power-controller@2800c0 {
 		};
 	};
 
+	/* PERF Peripherals */
 	bus@ff800000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -348,13 +349,103 @@ watchdog@28 {
 			};
 		};
 
-		gpio0: gpio-controller@500 {
+		/* GPIOs 0 .. 31 */
+		gpio0: gpio@500 {
 			compatible = "brcm,bcm6345-gpio";
+			reg = <0x500 0x04>, <0x528 0x04>;
 			reg-names = "dirout", "dat";
-			reg = <0x500 0x28>, <0x528 0x28>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		/* GPIOs 32 .. 63 */
+		gpio1: gpio@504 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x504 0x04>, <0x52c 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 64 .. 95 */
+		gpio2: gpio@508 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x508 0x04>, <0x530 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 96 .. 127 */
+		gpio3: gpio@50c {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x50c 0x04>, <0x534 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
 
+		/* GPIOs 128 .. 159 */
+		gpio4: gpio@510 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x510 0x04>, <0x538 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
 			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 160 .. 191 */
+		gpio5: gpio@514 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x514 0x04>, <0x53c 0x04>;
+			reg-names = "dirout", "dat";
 			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 192 .. 223 */
+		gpio6: gpio@518 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x518 0x04>, <0x540 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 224 .. 255 */
+		gpio7: gpio@51c {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x51c 0x04>, <0x544 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 256 .. 287 */
+		gpio8: gpio@520 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x520 0x04>, <0x548 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 288 .. 319 */
+		gpio9: gpio@524 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x524 0x04>, <0x54c 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
 		};
 
 		pinctrl@560 {
@@ -584,6 +675,12 @@ leds: leds@800 {
 			#size-cells = <0>;
 		};
 
+		rng@b80 {
+			compatible = "brcm,iproc-rng200";
+			reg = <0xb80 0x28>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		hsspi: spi@1000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -638,6 +735,27 @@ reset-controller@2644 {
 		};
 	};
 
+	/* PERF1 Peripherals */
+	bus@ff858000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x00 0x00 0xff858000 0x3000>;
+
+		pl081_dma: dma-controller@1000 {
+			compatible = "arm,pl081", "arm,primecell";
+			// The magic B105F00D info is missing
+			arm,primecell-periphid = <0x00041081>;
+			reg = <0x1000 0x1000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
+			clocks = <&periph_clk>;
+			clock-names = "apb_pclk";
+			#dma-cells = <2>;
+		};
+	};
+
 	reboot {
 		compatible = "syscon-reboot";
 		regmap = <&twd>;

-- 
2.49.0


