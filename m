Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1A9C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqJlxfb5aBB2ZfepHoR0jO5tKOR577Vi8xz08RMS2n0=; b=S/y6t1M2XsA5nECoCavwM4SXqe
	elFv6HyWsTvLAyzeE5DWa5jkHNzCCD3zm2rif0pN1N20fcOyZsNv0Xxxc3ZFQaEMUQ55/7EkZ42BT
	etAaETjIssBSN2R+h956E2YCqHgXs8sxK24KXgMfpDStvUWFHt7hNN7sSPhoKKrHOkdLj+Tf6gaQP
	k7r3F7CqbNVckxFkE+D6UcCzCS/S7ybspzooGXeJVKEJvU2bLVK3eDcI4sC9azjSiblzb2gsOx5/h
	yofXNCY//0vj1V1b9meJV+g87Fxq2hAKpDP+5ZdQ56FZZIp+npE1fLgaUmQgbtIZre8XwTZLlrHSr
	6xueD9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4iG-0000000Crqm-3j3H;
	Fri, 28 Mar 2025 08:05:12 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4O6-0000000CopU-1pvL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:23 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54963160818so2094065e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147860; x=1743752660; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqJlxfb5aBB2ZfepHoR0jO5tKOR577Vi8xz08RMS2n0=;
        b=Kx3mKLjRvIi4BXM8HSh5ukrTjsUvhe7NVLOfbRiGjmsU8H32VsVPi3LSIPSKcHsX6F
         FIFUK+qyo8uDzy3HattHtC+esanI0cu6FMHl5cFYF08eLHNfi2zzwCUJVglJKp6+2Kgm
         tMmgvisl9IN7dDnf+uEvE5wE10tZyUb4QetK23L87LK3hEoGZ0479GL9XfNqLV2PmMdq
         GYJZRJo0qY5LI9tPwOtBFx9gu653OmEtZ4LffeRe+GxvgDUWjWDIJrxwUsjXFmieiKMs
         1/2TECYfHTQcJTk4cgzBa9dRvv2r2HJzcO3meG2/pfD+LmQ1yuQt7WgGDG3QJExyx+CV
         ssIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147860; x=1743752660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqJlxfb5aBB2ZfepHoR0jO5tKOR577Vi8xz08RMS2n0=;
        b=UfdgHRzQjJs/FXLV0SycbDj1gQl8CCcQWqSzsFM+u3U+8P3UiB6sKBkoL2b07eKD92
         BbmdAJmv3bw3j5NE3j+gRBfmhu3emErtP7y2HRW5yVDet8mbsNfyFJ7ax3KA/cBfTzNz
         QDhcAAr0DSwjEEhRdK9lLaIQ2FKpnmFoZMfeRU7hM6DddfmWmhYxy4DEmgqnBZZZ72O6
         kLKTVlyB9kaoS4+CKcX441pOkHx6Zc9y0X9oQfBOCme5CWquBGl7B1CYtwOfPo/0nQLj
         4OvLOUqwrUAT7py4aMv4H7ELfBhY1nRO0W+G1m6InU5pT7Rqxmqr45i5PLkxcJAQDdj3
         R7kw==
X-Forwarded-Encrypted: i=1; AJvYcCWNFIYuJhmSDuqwuuaOZndQt6QZQKCMQL58ooiB9gWV+a3lFTh6FYqMYDCBuEZMvn2vD0ylN3j+SuY7yMrZKhVi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+Sy7fwLDhTJ3MCT9RgGMxRE5s878vOe/mFOwy+ejF5MQ5geqk
	7IT23UsB8aKBDU9fgc0o3JxYHdZp+u7CCwD3YN3zUsHOAm0D9qEplzGRYcu7Xmg=
X-Gm-Gg: ASbGnctqlJRpVHHb1trr4V9dU4RHQDy+Tlnrg1V9zq56EfM7AjnGwgk4N4qQyKybyfH
	XEZcXUtNXNERERvz/CN1AsUdNA/MV0JmOIYtmqY+Bu9kCzBcjewXYwFHElUR5Dz9+1Xy62pK2BX
	Vxd/ktLbgSKH8al/XoBi1EatjM9lrz+42pRYZp+0siHHxpCjdgRuazOnvJW1nmoDauSjp8PugLb
	e3t4Vj1KsjNR6m7pZ9vsDvt1eAxrWCgz0rNNBZp2mCeC+MPehtzEC+uB0BNHaBBUe6BKwcSQ7I0
	8LbPNKvMHfBgG/QpHeF8F13R/hNAKz8lKaAmkyr62jDhQMx1CvoyW2Y=
X-Google-Smtp-Source: AGHT+IGLSPJ1RA3Mlh8r4xvIZWPkrQmL4yqPDHVMGHuMR92ZlKGsQvblUQYEwuvD9wlp1zLdTfeK0A==
X-Received: by 2002:a05:6512:b84:b0:549:8fb5:f0ca with SMTP id 2adb3069b0e04-54b011cd7cbmr2156083e87.2.1743147860431;
        Fri, 28 Mar 2025 00:44:20 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:19 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:44:01 +0100
Subject: [PATCH 11/12] ARM64: dts: bcm6858: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-11-e4e515dc9b8c@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_004422_482498_3FD11A81 
X-CRM114-Status: GOOD (  16.86  )
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
in a separate node in the device tree since this is what the
documentation says.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi | 120 ++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
index caeaf428dc15db3089bf4dc62c4a272782c22c3f..a53520ce693c7360c603e8f46cefe134a509d051 100644
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
@@ -171,4 +275,18 @@ nandcs: nand@0 {
 			};
 		};
 	};
+
+	/* This is NOT in the PERF1 Peripheral group on this SoC! */
+	pl081_dma: dma-controller@ff859000 {
+		compatible = "arm,pl081", "arm,primecell";
+		// The magic B105F00D info is missing
+		arm,primecell-periphid = <0x00041081>;
+		reg = <0xff859000 0x1000>;
+		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		memcpy-burst-size = <256>;
+		memcpy-bus-width = <32>;
+		clocks = <&periph_clk>;
+		clock-names = "apb_pclk";
+		#dma-cells = <2>;
+	};
 };

-- 
2.48.1


