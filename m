Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A80C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGnDRXAGG98eVElkSPXbq2Nc5ZK4mxpr5pnNPqwv2lI=; b=XPVcdfX5U0sBAlLiYEXCBiCfxH
	pvcb7ZyxGjTKH9ORbveUfzxbKOkuSKt19GpHhy3GGp4x0AWpyVfgnQRUVRtD5y8H8odGpfgS8RRcn
	pO4z0ZUsEU4Oihls0Lk45hwLY9iYgoSq1CiEktu2NSZFHy4P092LFM9J9y2jntzelDHpn3Hd5sodE
	CGToAvhgGPrJBTm/oJSXVq5lYIsyzfCuxJ05MxJaCRb+AfALejI/HjoITijuip+CB5IZEloms7Gs3
	CFSrXfIdaHZk2Dg4kCpUUup+K5OuyCwz2Gg5XH4wLdjkAJw3OLu1dEw4mHZ/7lvSzgsdYA15cKUgj
	TB/Mueeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4er-0000000CrOM-2HGg;
	Fri, 28 Mar 2025 08:01:41 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4O3-0000000Cook-12Jw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:20 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54acc0cd458so2010238e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147857; x=1743752657; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGnDRXAGG98eVElkSPXbq2Nc5ZK4mxpr5pnNPqwv2lI=;
        b=gSzvgjyBM1Yp99K7EMu8JthUrCbEwu1oWVR1Zui2alXFv/QmzRL4Rl+/rxHVw3GlAu
         I71FIfNFa8f8gvOThmLffMGOILatd50HatG3873IxV5LNWXZIMO4nHnIYKh162511VTP
         jf+t752G8d1s7Q7CbvUNmUIg5jwaxc5Ta1tzLWU/4tJA5IQeJuuQg+IsKzFGHvrXDjMA
         n3q/p39VMZg3wHtA5lZXwWUY4lKny0htA1VW+etq2zGYeNRUg4gx7S5dWlXL5XSWLjDq
         bt0i0xlhkUEDFRK/SjP0dQOeorfz2HEX2NSx9m6z8Bcwcb1Vrr8VR3ZaVFIS7ltkWccW
         VdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147857; x=1743752657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGnDRXAGG98eVElkSPXbq2Nc5ZK4mxpr5pnNPqwv2lI=;
        b=hl7/5MfYtuj+Wz0IZJFlJY3cUNvxX5eM0My5KJILqYbCPd7aOLpivdw18uMg2BPhTu
         WBi8RmN/VgCBlIzT7proavCSJ0s1y/eCsOVrmXnx+3u8cdD7kXD8zq5vrFgDMKB0R6F5
         3n/UG9r8XdZcWA7O4IAzsIWWPsMBJAevLDBbSR7/rFTrK9KAmXGz7GcweveJTe2TnPFx
         9kmg/0PPD2bWOFKQGC+ARdjE3jp3Fb07KIJ/gfqM0NBlnywpVpgC/VohevqkCgT6p0Vs
         aAY8JFOYF6xDzW4N28MoACPdtJ32vQfb2LuJOqyMsxmXLankXdoIUOxdJjbF6EioOip2
         UV/g==
X-Forwarded-Encrypted: i=1; AJvYcCVfDiZ0unBlhYDTjo1RnTkS1/3LF5yU3KUXPTnYoIKQ3BK2fwCUYmCNJF7rCKWoA3I1vJv9Hj3ZCBHQCQrICLl8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+/BrBDhqINpyJCPcLlXfAfdOr4CcJzBJMrSP0lOQlET++HoRU
	cwEyFP8N1lhLhoBS8M4kM2AhoP//HcqE/MKxb/GApFPHefSrq8i0Jy7HWg+S7vM=
X-Gm-Gg: ASbGnctFEPFQhC045y1hIfdZritgM4ogkeztjpVP/UFYNIO0/Lxop2R8z1glbY4Im3C
	bpHEs2oyFR2loFTaP5kOOob4I06i/9zo52ITjYf3cdQASUf303rWfxve1rKfPuNQ6GM4mr8Fnh5
	pk1Od4T64BrfFMJvlgeV8J3caZcFKrHkjAH6t+pn2455tEYahQXgou47zngZxsWe3odPhIxZPjt
	PipzcXVys3Gy6X9avoe3/HCHWmWBrrepaKu59lTo7r0eJy9JyFi5LEO5tXkphjkUL8VCs1pAlIv
	qNCV/VDD9+zflur4TSHFW7ykMlhOaLSQ7MGwiz18n55cLmE82d0Tr7I=
X-Google-Smtp-Source: AGHT+IGIG3vCUNQ5N3JhklA22up77ViQKE2bk7SUD1+1D+haElLf4Xv+3Q6z3mgezL384pMZBiBsfg==
X-Received: by 2002:a05:6512:104f:b0:545:2c2c:5802 with SMTP id 2adb3069b0e04-54b0126a6demr2911529e87.48.1743147857220;
        Fri, 28 Mar 2025 00:44:17 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:16 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:43:59 +0100
Subject: [PATCH 09/12] ARM64: dts: bcm4908: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-9-e4e515dc9b8c@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_004419_291345_E7FD9BF1 
X-CRM114-Status: GOOD (  14.66  )
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
2.48.1


