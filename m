Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D63C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMHCBS0if0cnlwKmMIsceybB2DKlEexq99G6FWGTcxI=; b=YOTNY7hySy5fuDNd+aglbI8r+I
	s9uxE7MFC1tOQVBHmubHSRBgYsOUUPnLTWSnpV7D+8NcSo9HzFBil564ujqsKnPRjvBK+D7Xs1zvi
	hXmRPwnbVqoP69UgqbKoj1pC6j2h+cCqYWrlNPbuo9CaIKk+0wIFElnoFXwzQUpcagwAVRUNxGbDw
	oU0yCWFFflM+mv0vSTRwvG9pLNpZs9F32P2NAH4e8fyOITNiOpCJouQOB6w5R7/vH8vIt7XgJ4wuq
	gjc7k1k3Z0VTWXm5SkwzZirBT5lgUJL4imoc1FJ7scFSVnuQoU/59jraz6VoNVbeqqL4KB/xubMKD
	RCIROMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESL5-00000009O6l-0V84;
	Mon, 12 May 2025 12:32:59 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERv3-00000009Kxb-1tdc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:06:06 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54e98f73850so4964883e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051564; x=1747656364; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMHCBS0if0cnlwKmMIsceybB2DKlEexq99G6FWGTcxI=;
        b=a99Q/tlGfY+HyT0a5C7h1zz9HJhlerJMCHPMLisfsgQnVqvV4M9kNAtly83oRAN+45
         UnrrJ0tYS+LkGfbWZQep84vzXEs9yBqCDQ4J9nj973/6qXh0RxSExzfOfoPUMt+BCobD
         hspla2RUX+BjLXryU1y5c10UmgM8mIYny3+I11M83wvJKWdao1OiaiMwJVoVkQP39HH7
         i4dB1WXpZZqC1jWNX1N3xPVvEaB2H7uyUiwnTazd9mZINDDvG5R1mpF33V36thbVythB
         lfShoIDOWEUmjJHPrTV9yBMGjZTCEH+sTa+n6qm5jQrGK4H3NsqccBoP6qcQxWDwxCtK
         VZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051564; x=1747656364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMHCBS0if0cnlwKmMIsceybB2DKlEexq99G6FWGTcxI=;
        b=N32hEHbkKpSZ0dq0LDqs7FY+aRRWHi3ABye3FOEW7qwlT1xP3e5/7a89Pm0otC1KHz
         NQl8bvTUqJ7USnvrRWrCKBmIYs/PccDaZT7vR6DZE/KdSilj1Wyd1QKnAzazKbyQo8LV
         PGgwj+CY0EnKQ5mdvMmCh2Wo/MxYAwjkJHYLbakMh2F2W5hR2YaOoliPtedYQaT8rJui
         E4V32hyaYSKRkEqMTEhS84NcighNA2iA50k/Hv3+798fGvgJwRh3Nfkc/NEmjQCrOEiE
         SfWmydJuG5+XlalPKMeDgLBYNLDPaGe5N6Rx57+jFrc0fc/1kWKv8O6oo6Sria/q7tG/
         S3GQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3DUo7/h31vxn2AoxMvan/5GZ3tKjCXE/lqaOEO+B9uc8ZTU62vM/u/I7QUnk7vr3ddSym2FNtFXN5jGdFNUHH@lists.infradead.org
X-Gm-Message-State: AOJu0YzXOVMKtwpk1ls0mN7158HnKSHRLRlNsl+ijRsIl3VAa0i5b/lY
	5u7LRqWcdKh4ecb1wFrBhGVILxombznuUP/pGsnw8SNVFsYaJK7uURt5Jz0/F+I=
X-Gm-Gg: ASbGncsPeW2aacS02vM8G3KyA7T8+O5W2jLoYUa0zngdqFtCFuC+8Wg0yBY1mEa3VtX
	rrYz8bm81Jq5ksxliEzpIp1OAxyZHFmy+mFafTCl6VKcN7AbKM85+xRcHEyMyWGU5mw6mKYBiIV
	bOIwNpeEf+CqjEjBwNf2TEuESn+SoPWbcblhGonyCFk2gaBW7186nzixz0ZI2RsGz6R46L9W1bh
	AQNwyCxX5tAg+EkCdyEIxgbg9skRY2dGi62FQIATp3E6X6Flwyfiuo7Tpv+xSDot49xDU7xRGHG
	SLikfBnRr6/BGlEHvd17IIvqh2EXIS4m55g0w5E0LdSOTQWdA67scjAAWGKt2Bz4fr55TYLE
X-Google-Smtp-Source: AGHT+IFKLyv7PHn6Lok1bEUkjovUWReFWptxKqF+Zjq8PYbN39Dl2AbUjj1cgZazNFL5Lv8ZsKYfRA==
X-Received: by 2002:a05:6512:3b86:b0:54f:c5bc:3cfd with SMTP id 2adb3069b0e04-54fc67e4cfdmr3762780e87.39.1747051563829;
        Mon, 12 May 2025 05:06:03 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:06:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:56 +0200
Subject: [PATCH v3 10/12] ARM64: dts: bcm6856: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-10-86f97ab4326f@linaro.org>
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
X-CRM114-CacheID: sfid-20250512_050605_514365_465D4395 
X-CRM114-Status: GOOD (  14.82  )
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
peripherals at 0xff858000. Extend the BCM6856 the PERF window
to 0x400000 and add the DMA block at offset 0x59000.

Add the watchdog, GPIO blocks, RNG, LED, second UART and DMA
blocks for the BCM6856 based on the vendor files 6856_map_part.h
and 6856_intr.h from the "bcmopen-consumer" code drop.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi | 130 ++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi
index 00c62c1e5df00c722884a7adfcb7be08a43c0dc3..dcbd0fdd33d25fa340c417e8284826801ebc00bb 100644
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
+		ranges = <0x0 0x0 0xff800000 0x400000>;
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
@@ -133,5 +248,18 @@ nandcs: nand@0 {
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


