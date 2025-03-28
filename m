Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124F8C36013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jj2jQLKKNMRGoDJk1I4iWsw2NxXlVz80Tt33k/kg9c=; b=MO7yxLtyEBz9YJ3D8lyOhjkYFi
	RZemgiZFWdvTVn/bcIWPk8ds+4uehUGBFTQRJKIV1JkKmP03kIzgxLHnbQGHLEI8xxwiVlQ3N9RiA
	YH+GDHtr8fAs7smb/nZV1m+6xJplkr+jARkoPqG/xRRZuEBvgElCb5M3iXz/xdAN2+RwnYdQcZwMT
	nU/J+BNd+cM9PG71pt4+LAlYUb4P0WWe2kRcj6PFOA/K0mfnfGwsEq7V69M6ix1lFVxfYxg79M95T
	vvhSfxnHyDQ01jP90/O/hUpFwagTO3oXU6alSUMDzEuSG3ukBvwhBzROHEit90e3vZGA7mxYr421t
	yyfLyIwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4gZ-0000000CrdE-0rSt;
	Fri, 28 Mar 2025 08:03:27 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4O4-0000000Cop6-3OCv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:21 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5499659e669so1860777e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147859; x=1743752659; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jj2jQLKKNMRGoDJk1I4iWsw2NxXlVz80Tt33k/kg9c=;
        b=XXLMboQxYygTxlRXSBzwfSBrVkWw15aTXJIcSThyVFC5sgdskI9wn0Wgp18oMIBhhS
         VJs4xeNMdbcwtZ8A+DSHrkaKCjOnSnqSiMOeSHA2WVt1QY/CHDYsCU+7TjMlr98Kn+nB
         YQtyHUoikIXuh8VUvlRRHRTht9lxD2NdSUXa92KXSXJqQ9jm0kwtoqekXJa1iM/2ByQo
         ET1jcfkAI6TZR04AtuOmnSgrFl03skkHieFq9DXwsqCc6WJHKaols/DQAlskdKp21F0W
         KlGXbzl3VUmcXkFnRxu1dv1od/t5FUM1rt0tP0uD/hcRH/Y1bu7gcgI006E9jg6la+5h
         /Daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147859; x=1743752659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jj2jQLKKNMRGoDJk1I4iWsw2NxXlVz80Tt33k/kg9c=;
        b=S66+k1qHifhAbrtaMFWXnV2i5kpmE50s9U/zt0Q2o6R1JTa9WGwtpFrFkiVg28NqhD
         cK3mmRAMJaIFIYa9MoQSzgrIZfQU9GEzZSU+rG1i4V3GwKfBnaZ99mmUzzkayx+tDkBN
         PeDmdsfOKQiPu/gFfYAzQJ/L6g33yIDVbImFNbhWAElRn6OlMnpBr/27Tvwue5YiPcBy
         K/nEJojOAGZOsRkhOw73HgWXuYQCJWlDJ1yEmzApVbrwWLICwho+6nDFzmT9mQ5lOOWh
         82qmnzEuaqdLTgr2WEhtXiHo+R0mTFOVoBEaVcSgW/LotDdZb1c3Wv7+axn+bMipDf/i
         lngA==
X-Forwarded-Encrypted: i=1; AJvYcCXBRtsKlw/lFzSnZxJCI5j7JSri8l+4O7oWt6LW6JlCsg+7vYm2Pw6yWE9sq7d6dMwJQaNUW1E5Bth3QPEXDc5I@lists.infradead.org
X-Gm-Message-State: AOJu0YwLOAVre3A54Y89JptCKNvWsmeIOnZMxyQo4Wt7EVN3Y+Qu3Y43
	vmAaautH3e6o/weU4x5mDcfEf4FdwOXmwovHmgbEevy7Ampa2ITS0+GildF2o1M=
X-Gm-Gg: ASbGncsH+TfxfSCvmk02gCHS6jQW67SVMn/mN9F5m8aCL3S0eIZlYj9An4YZ7B9B+9v
	L1GTKI90cOb44DA+D7Ve0SapZwBWgAuX74q8xlLLKak42zfoEkIJfIkVtOrSDiY+I1ieJWfo8aF
	Gsqgh5wf7lYsiFgt8vOMCWpT5f7CNCISYoZfoOIcOsfQve+pFy4hY9NSjZvqmKN6JrsqVrYMlW6
	S4GOVxdd4csnjJD6g47Edg3gwwXCi8DbfRpoUspKe518/Vv357Fmoz0NGT+mXb6Eu5ZdgdsEAok
	trZgGnt1Ko9v6gMJkY1dAwWyep9doFPy3jQM2Ddjp/wM7rlp7nQ7Sxw=
X-Google-Smtp-Source: AGHT+IEhjnETIkoSdipUb4jt9SrhDKL7ky47sTQx7mnWbPsv0F5+Wr/UgwEAs1mGGfzuq6GFwk0EgA==
X-Received: by 2002:a05:6512:118f:b0:545:62c:4b13 with SMTP id 2adb3069b0e04-54b01264c81mr1971096e87.40.1743147858828;
        Fri, 28 Mar 2025 00:44:18 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:44:00 +0100
Subject: [PATCH 10/12] ARM64: dts: bcm6856: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-10-e4e515dc9b8c@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_004420_852101_0BD45F77 
X-CRM114-Status: GOOD (  14.63  )
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
2.48.1


