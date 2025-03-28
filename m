Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25449C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+/3tbeqcbFmamPw/dqh2HIcfIwHxXrx1N8SMpql6C8=; b=3G5jA8SfzQLCtzqU1XVkZd2Em+
	Errx51QdfHUDtbW4aBOVDV+RJ8X1LxQ6Yy5jcLqowdSFu+CyvYNYuLJwfatLJOCwi9EamaoXaNQBO
	QZ2fHl0Pn6KEu4xNOVtMxj9FSC20lJHPdr+3Mz4k/fpm0/RFOmdoaV6MItVcUMPgtWVEdIHUMC0M7
	XHRnJqqJ81V5itYuUAlkf485NCt6bGZg0iwxEbipvo5wxX07qB+kqyrd35E/4ydTfbFWQIsZf9Rhw
	FZ5brybTSDvme9K+M375ohzS0eeiZl393ZgMNgJ9aJM0CatGRknIbOdE45SCZlgQju/Ei+sEiiDL5
	MDE8WCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Y4-0000000Cqed-2iDB;
	Fri, 28 Mar 2025 07:54:40 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Nx-0000000ComJ-19V8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:14 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-548409cd2a8so2128925e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147851; x=1743752651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+/3tbeqcbFmamPw/dqh2HIcfIwHxXrx1N8SMpql6C8=;
        b=T+e0Gz/GIdTgeZmVhUJt/vbVL5VZQH4Bt1FoEM+DdysZihT8ZQu0uXBN9UK6XgUu/k
         mCEMpTm9T+bkBB2cWZSElvSPD5W0FG6gfTODTdnAcfhptQy2QT4Nn7P4+6YRF+6QIUR/
         Wt6HB0NryMyxol/Z3QsF5DpikrKOOhqtthByFm5jtI7PvTzNEHwjnGPyYPMft9z2CdMs
         hJG4gtztMLpKXldssssC7QzMPbZUSs85N+WGJggwQUycZRWnm9oofqjidrjqZcC9Ne2B
         Ne5jq3BlEJ+rh7xtKEHudaQrJuXE5+7agtwKJWFNM2/ybCsIOlmVRn1GgKNRlK0Y2y/3
         5ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147851; x=1743752651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+/3tbeqcbFmamPw/dqh2HIcfIwHxXrx1N8SMpql6C8=;
        b=DB6hYlggL1QNLRGJaQ/r+2nSG9DJM+l9IFWjDjhlZOotQMTw6/GykBIpYLonP38221
         x1h+xJT4CabJl0jsJNOK7DW45p0mGAb/h8OUaSgYZCx61L81uH75R6KrMvFuCT6xEv++
         XlM79DvqVoiWDa6fNHmYyHXvac/4Gwf1eoEOhnBTptpIMC6qQWxuHI+4b2SgWBbYa1nF
         GWRO8qcQEJZyqpmrFPE9YMg6M1FskHRqB+5u0j9TsmU+emnsi8TNrqy+xZCS3by7z2uQ
         LCVsIZ6JV8pPrT5dQKSJmgiyEQXfFLHN/T4fjS26pKnXu4IYU4cj2QCx70KjZRN4QsLC
         spuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVagjJ5dJr9D0sSnwN9bojx4KES3N4NzzYF0kRwMCVhgHdkdaL7JPFdtmmV+RWU/9s6ML1MJjGQZ2+H4ylU6/Rf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1Dg9P0E0ShNXrDCHOMesIsIyQ+BwfzSD0LGjL/OZ4oXRgEEnK
	sGQBOzf07dftQSVSrxHkXE3EuEXPve0TtlYkTjZAb7XlIMDKqm6rZOY9MOrZIBw=
X-Gm-Gg: ASbGncvGlisswifVJ7A9lGUUhrl+yNfkYph9nfFA6k2WIEe2WhT9Y/GkRJ62CxAb+rh
	6a1tItTsCzoMZYLnFWPTMlS3A7HT6PTLL7sCgqbsD3r4bmBhg7BBfk6GapHxrqj2X/CYN7eAX6p
	cLH2jWUU5Pb/tT9mZjIzbYDRP/cRt1Swbyct8WrRPLYReIlkqoSeO8g/5KLDfCW7pEQyFiyAnnY
	FbSNKZc0Fn8RIHRnEIpSn7+cs1xqxywatYK4bm0WrMZO2OVbQI6AUPU9kJbGB67Pd6zCXFzo+8h
	WtQam6gIr+lnlyEYM8x2FuAxTKvZYniVrgO9A39CFaD4hxekypnjqbI=
X-Google-Smtp-Source: AGHT+IHeRT5PX7p82HtHwGrF6oShAjlRHSmV+Ax3yGf3Yi7h0e++JC8XWjlv/I2B1dbasVvvi7Z+DQ==
X-Received: by 2002:a05:6512:4010:b0:549:4df0:76 with SMTP id 2adb3069b0e04-54b011ce4f0mr2397769e87.4.1743147851345;
        Fri, 28 Mar 2025 00:44:11 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:10 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:43:55 +0100
Subject: [PATCH 05/12] ARM: dts: bcm6878: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-5-e4e515dc9b8c@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_004413_319869_60DE0513 
X-CRM114-Status: GOOD (  13.66  )
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

Add the first and second watchdog, GPIO, RNG, LED and
DMA blocks for the BCM6878 based on the vendor files
6878_map_part.h and 6878_intr.h from the "bcmopen-consumer"
code drop.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6878.dtsi | 118 ++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
index cf378970db08c05c40564a38931417a7be759532..f317fc888da0ef449d9b5153677e6dadd869a7db 100644
--- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
@@ -108,6 +108,111 @@ bus@ff800000 {
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
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		leds: led-controller@700 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm63138-leds";
+			reg = <0x700 0xdc>;
+			status = "disabled";
+		};
+
 		hsspi: spi@1000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -134,6 +239,19 @@ nandcs: nand@0 {
 			};
 		};
 
+		pl081_dma: dma-controller@11000 {
+			compatible = "arm,pl081", "arm,primecell";
+			// The magic B105F00D info is missing
+			arm,primecell-periphid = <0x00041081>;
+			reg = <0x11000 0x1000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
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

-- 
2.48.1


