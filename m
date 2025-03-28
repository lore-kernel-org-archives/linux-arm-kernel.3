Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D89C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZSlECD6SBspac59uu6fnjnF7/8QrKxNI5JVoJabeDs=; b=3tQ4sZdxVW+vsWihAc9az4HOHy
	L7p0fu5Yn/wIqlV46xIRDYTl2ksuo85L3hm8ciP3QRVJ3Y12TMVEkAhZ3q1vgV3MXsK8IYySUe4c/
	scBKgbJufnLn1g/lQ0RrY0C829uzTTuckOXUyRrUapuPl4dHYWndA5kaF2eEKZ1QpHu/laKc9MyIA
	Q0MzHn+IzocbCIgK6f38QLBBFtLBYDKxx9WNxPQiaKi+PJs3rtyo6I6jMZhH6/BpRABKmZYcP4TtG
	DsyMBHQoaQNbt8g9Pz7v2G+j7MUwcJiN8M91bznNTXq9g54Za6I5vPAhZZr98IPf1XOFb4lAi8hXj
	teYK+UPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4d9-0000000CrAM-3DdR;
	Fri, 28 Mar 2025 07:59:55 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4O1-0000000CooO-183V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:18 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54998f865b8so1744929e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147856; x=1743752656; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZSlECD6SBspac59uu6fnjnF7/8QrKxNI5JVoJabeDs=;
        b=ydM2bb+jQe/ahCkb+MySOBm0/X3Chdfib4kn0rdHwDYaKEGK8lkFeC6Rt2GsRNiQLK
         wO42KA2pjbaH9bxk34fwfhLuX+zJWFq9tUG+XAddUuxdUga9UvNPnQp/TfQTSEj5CP+U
         Rs/K/n3Fx28HwgsfJy6aV89xKDgRC5ShZowWft5t7bnp+6O9EFplLrCPK86h0721L7Ix
         5kvdRTW0PF8HPpV2dNkp7tHc5yh8u68grtmJd6fO1The2cilhixeqgSqICwKeuCGyfiO
         YmzbL9xwooPBvFVoXTmIr6vMUy0WYMMZ7Wr/xMQuMAnrTxKH2urJE5euO1ZjTliRXFwo
         jxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147856; x=1743752656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZSlECD6SBspac59uu6fnjnF7/8QrKxNI5JVoJabeDs=;
        b=BEZ/wk6TaA+uzYWM6x7sZlodDxG6drAB9DrirlnW8c/22HzobSWvFVah3/symoC4Ax
         hfRVWfZVqUAYAgbAV8+ghSDCSr+2XSmKtOwaUdEzI1KCCI1LvrsJa/3G1VNAcYEG1MJ8
         yg2EyjLnB6usFU7v+LgPBt0IwjVSKMosUuxh9dxAnh+Xs1UYlDrnaZgU9Z12uCZJ+ovk
         mpt6Brh89bC1eM0FdG7OBA3ly06dYTtj8pwFt9iBd5KU1mcriq2x/h306eXXgnzQ6p7T
         Cvl1O6H4EKXqRfh/mlpBXCzDx80cFqbEiBttaLaknDCOoCvPlHnAFr9C0ZvFExTDHK5j
         +J1w==
X-Forwarded-Encrypted: i=1; AJvYcCX2VfO24JPan6Snd8PEgWVPtgpYt6b+9xWGP3WXVBVZ3IS2RkCdCw4h2xZHE+BeCqB2pAmbPKG8sntjYxQRZBmV@lists.infradead.org
X-Gm-Message-State: AOJu0YzoU3A+93aZVDyt5sJPGW/0S2m0vDRtkG/NR8Em8RJYznNgfoRA
	1M0/EgZY2gNGyftguKRjfYnbhGN2voM15ZaNzH3Hyj6Kgl1OCRxqlJ+B0QFZmcg=
X-Gm-Gg: ASbGncsSzHKEZ8Hxi5gLdqfbDgcKJdt95iBolvOad+n9XqNKAsWx1Ak0OefOZ//UkRu
	Wl6O2FzBkpnoiALXYaHnpbjbCCj2WbSnpp6ZaVd/uqPxCUzkESvjN8iFiKoKOUf4VTUnfXxSu+F
	iVjeco2widdvB9LecWaNNR2fxWk4CqtGHslqbgxjgtSq7OIo1u5jtL6cepCHiT4ubOSlUlDRorp
	RbIf0NAd0hdthQ4U2LLuWnK8RX9CtiXtZL/N1odUku4MGZVj2i9gyfknzIexxKmEy/AgLiPu7aH
	TOXsamjx+2/iI8O4ee/IXOv6IF14CAhLLx87lca4MRqbWCJ2pF/TaeA=
X-Google-Smtp-Source: AGHT+IHjbKza4NKoVqrqsdsaSrsbdmLF7PTox5Fsl49ZNysAElgqqGTpkMJZHnpD31kwmiwZ7EbP7Q==
X-Received: by 2002:ac2:4e0f:0:b0:549:86c8:1133 with SMTP id 2adb3069b0e04-54b011d784fmr2523640e87.12.1743147855630;
        Fri, 28 Mar 2025 00:44:15 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:43:58 +0100
Subject: [PATCH 08/12] ARM: dts: bcm63178: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-8-e4e515dc9b8c@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_004417_312115_0BD47911 
X-CRM114-Status: GOOD (  13.05  )
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

Add the watchdog, GPIO, RNG, LED and DMA blocks for the
BCM63178 based on the vendor files 63178_map_part.h and
63178_intr.h from the "bcmopen-consumer" code drop.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm63178.dtsi | 112 +++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm63178.dtsi b/arch/arm/boot/dts/broadcom/bcm63178.dtsi
index 6d8d33498983acfc0c65ee155f64ddedc4a6b376..430750b3030f2534d6bf0468d895ca565007a53f 100644
--- a/arch/arm/boot/dts/broadcom/bcm63178.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63178.dtsi
@@ -117,6 +117,97 @@ bus@ff800000 {
 		#size-cells = <1>;
 		ranges = <0 0xff800000 0x800000>;
 
+		watchdog@480 {
+			compatible = "brcm,bcm6345-wdt";
+			reg = <0x480 0x10>;
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
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		hsspi: spi@1000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -143,6 +234,27 @@ nandcs: nand@0 {
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

-- 
2.48.1


