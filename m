Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91424C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 07:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUAEmJN1kVT6sqNjgFjTIi54896X7oEqtHP0xbwjDaA=; b=m+SNHKVtL9UdGQn84vh4PX+2uE
	XiwAwaUhs4lxuRCbLxjao6lse8s5PJ8hruZ8x5/zMEOQNyBXkgC+xrwcqgAjCxWx6Cp7mmtjeLKE2
	Rl6Z2sHNmz1a7Bl3KkN+H2iv2lAbGvlWPBa1L0dx5DjaU7qU+u8wTXihwvide6Th62tL7fi1UOEAe
	CG4xkmwSYeW1gfD69AvIiXBntZbnu5NlMCpWjf4WqSRmWCJajhjwDnOlPcftOLlk5gR7cDXquJwaY
	tshEufAqVXNxAxp2JqXnE9wJwLq5Vd/BrUAsuC8E5JSS2WWN6zbOmZi8FJAas0hz/obUqPocCdFAQ
	5C8+W+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Zl-0000000Cqt4-1fev;
	Fri, 28 Mar 2025 07:56:25 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Ny-0000000Con7-1xXe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:15 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54addb5a139so2098110e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147853; x=1743752653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUAEmJN1kVT6sqNjgFjTIi54896X7oEqtHP0xbwjDaA=;
        b=J3JjKFAvmDitOCPBbo8zbunC5oGQ7UZLAR2AgTsTlGTrHEdB6uiGOh8yXt3RW0LF8A
         /pYdBpMbynFkukHMu5jQKVL6qN1aMLbon9TJQj65DcQmf7qx9Rp4GWUWyxGG6CIBanjm
         aR5P1J1ED8nqhv6nd2haQtch/OACHCa/4a80EbsOHbve6WpAp3IPNk4OWLRoKefsAP4m
         BlaqsXNVAB7M8IfcazOpCZlHzQpnoV8pYGg2AwFuDU/K7o7Qyi47j3y5Z9lkAbJDn49T
         CG6MQSC5O4Z6zhhqIgnXdKsltGDPbfetIOcTgraUUZrPHwpVWBESJ1ED3J6cp4IEUUqg
         PvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147853; x=1743752653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUAEmJN1kVT6sqNjgFjTIi54896X7oEqtHP0xbwjDaA=;
        b=M+9sXgWtIdtzflbCzGGxjdvBQPqR6kcTcOVcAosdi9/EWnpqD6AbrYfxQQv60RJkvz
         RGgblWn2F9PH/ScBxUVcbSq+OCZnq+gMvl6zxXFrHtZui9gM8Zf6dvmSQdG7Vz683H5b
         HMy6ZE6YyPvmfTdCzAiMRoAcqOCBSCN4LIjJCC2bKQJMM1bf4fzSWyFJEGWrcFn3BtoA
         6GnH4aqZ1CdlanpI0meXD8INfwv+/9NvGkiRRM7aL82eLWQbdJ39Y6BLyCZ+DvuutEMI
         N/IkRHfQFoiIDCPWdHnjCr5sHfX+OD4KhORsAkM22Rk2tVB/WJOdkoqanVcBykZ3rB4K
         9I6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoNSZKE9eu78ALP74cY7mCK3py+ZtziIqXD1AULIwoH+M1BPgpVmDgCvhM3bFnhh5Va0d4qm2gmUzS9bxfh4IS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5kU4LgnJcWSji+McK4nnDN2M+RQlBW19BhDYmXsAWWphFx4FL
	oXatMNiNbiEjOl5ZFWgD+beQs4sxVdyREcC+k/r9Y3cE16VQg1dNLwz48l4inI8=
X-Gm-Gg: ASbGncufdsTSc+aaggL0e2WysANjck29ScKo8WlWouLsFviH0XJMtZKBfdyLjZPQtT6
	o3rDvlUWUB46m87oF0t7iiZZA9PS2cwtrngiSObu3Ok+nzU8lmYskv39ywvTrdZJcwCbX+agB4T
	yxvUT7ZpbSMRr/ar5XyQalzVykW2pL2t8YOHVRztEb2hnJmMX/yeT5fHpgpoUQPj4mfSJttiVwz
	6Z96K6bKAQklwOdPea4wYn4ilM6p0lsYY9Bm0wtAgC09taty7Oza90bx4tPleKpq4autZHwlnoQ
	xgUsBCxkyWEl/uekXyZRSgXzpN1aNbD4s9hnej75vDx7xDbpzQgn+00=
X-Google-Smtp-Source: AGHT+IFL1i4v/eWOzjyE6pr2XfQNO7EGVzKr09ZBgd139s8iEDfYFiur9MgF1dlZFkJRtcV0d94NRw==
X-Received: by 2002:ac2:4e16:0:b0:549:5b54:2c5b with SMTP id 2adb3069b0e04-54b011dd0a0mr2804182e87.24.1743147852919;
        Fri, 28 Mar 2025 00:44:12 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:43:56 +0100
Subject: [PATCH 06/12] ARM: dts: bcm63138: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-6-e4e515dc9b8c@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_004414_528826_68FAA76E 
X-CRM114-Status: GOOD (  14.56  )
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

Extend the peripheral interrupt window to 0x10000 as it need
to fit the DMA block.

Add the GPIO, RNG and LED and DMA blocks for the
BCM63138 based on the vendor files 63138_map_part.h and
63138_intr.h from the "bcmopen-consumer" code drop.

This SoC has up to 160 possible GPIOs due to having 5
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm63138.dtsi | 79 +++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
index e74ba6bf370da63d3c115e38b4f20c71baff2116..182394a96bd46eb0258ebfa6d5f00ea008aa671c 100644
--- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
@@ -184,13 +184,69 @@ ubus@fffe8000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0 0xfffe8000 0x8100>;
+		ranges = <0 0xfffe8000 0x10000>;
 
 		timer: timer@80 {
 			compatible = "brcm,bcm6328-timer", "syscon";
 			reg = <0x80 0x3c>;
 		};
 
+		/* GPIOs 0 .. 31 */
+		gpio0: gpio@100 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x500 0x04>, <0x514 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 32 .. 63 */
+		gpio1: gpio@504 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x504 0x04>, <0x518 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 64 .. 95 */
+		gpio2: gpio@508 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x508 0x04>, <0x51c 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 96 .. 127 */
+		gpio3: gpio@50c {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x50c 0x04>, <0x520 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 128 .. 159 */
+		gpio4: gpio@510 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x510 0x04>, <0x524 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		rng@300 {
+			compatible = "brcm,iproc-rng200";
+			reg = <0x300 0x28>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		serial0: serial@600 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x600 0x1b>;
@@ -209,6 +265,14 @@ serial1: serial@620 {
 			status = "disabled";
 		};
 
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
@@ -248,6 +312,19 @@ bootlut: bootlut@8000 {
 			reg = <0x8000 0x50>;
 		};
 
+		pl081_dma: dma-controller@d000 {
+			compatible = "arm,pl081", "arm,primecell";
+			// The magic B105F00D info is missing
+			arm,primecell-periphid = <0x00041081>;
+			reg = <0xd000 0x1000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
+			clocks = <&periph_clk>;
+			clock-names = "apb_pclk";
+			#dma-cells = <2>;
+		};
+
 		reboot {
 			compatible = "syscon-reboot";
 			regmap = <&timer>;

-- 
2.48.1


