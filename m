Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869CBC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uqw+GjF+9qEiY0+j7o2mMDzIbpEBexjSYyH79EkvzYA=; b=zb5BazckY1KjeBJVjUrjaTgTC/
	eLMGb4DU6P5v6ON6iP++SNplsPC8bbmbJbjxP0w/um6F8OYUCSrndjAWVqXLMPX7z0A+1Iy3a6ErA
	ltv8rXNdwuHwvUIAjv66r30geA21FukeqiUIUvalQaBGBhMflQTYIdFoJw6tOt0praPrEmymRkN4o
	eNZGSwEvMCHB9e+F+scHaimznNkHQyIa7TdLfa9jqU3yAif3fN14aa6ouw/2nS98fqd75eHR7UVKz
	TFCO/9kESNWYIM0C/KPbmPwabMiry20niGfKoJNwlu3/m+tSWmkaujQ0RyZj12CuwT4ab+aeDTwTF
	KadUcrMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESCt-00000009NCf-0lHF;
	Mon, 12 May 2025 12:24:31 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERuy-00000009Kuz-16DH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:06:01 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so5254774e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051558; x=1747656358; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uqw+GjF+9qEiY0+j7o2mMDzIbpEBexjSYyH79EkvzYA=;
        b=AKZzdU2Ek2jP1FDkA5rsEoiksYK7OYc1+JzWd7Jwkxne8ICCIGXyAColURzoxyHWsU
         evRZdeLdHsh2fYsEDxtiil7CccxZgdh+9SV5u3FWo5VXLydYfHlc+lKT2FdgBZbnyeSr
         lO+eFCHyAZWeqfLifo/6maLNwQANVZwog7Mev4yZNudA1pyAk6+lefPQt+Lj8ucglfrk
         QVpBKZJEftZ+nnX3talQ89aaa+st9HTvlj4PgHxH9wa5qURdXSBXvShsNusq11RfmU+V
         GidD2+uWVwAvGdkfSQevU0SR3u60GtBznA+iJYO3mvB4YmsVgjoQ1qOSw2FjfzvZ6c6D
         Jf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051558; x=1747656358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uqw+GjF+9qEiY0+j7o2mMDzIbpEBexjSYyH79EkvzYA=;
        b=ECzuHJAZvcHoQeUPPHehELEwfK1Zb8EV8eAMu+9wVNmvufCY5L4YUCK49ohnz3neWA
         2aGSWX3Qo/Ex/ls3tdlrk3Gy7b4lfQNUGCDw0swEomJpjWn3Om1YcJT6GX7V57pzxvhQ
         xADUv2hQxKvVl9JpToiQ5KQaG20e5OP8az0J2GQPGRaDYrBh3pELI/wg2PILJ4tZmTjj
         m0WH2nb5AFHeresec/R4zgNAEGYqrpJjd46VjzsaGlwVhLkyCY2SMvcPa9TPQ0o1hqmp
         FU1J544kTqUpyKvMu24WjcsIs6CFPKDAonWxyE3T97L9ixRJoAgaaP7ZWm/3K7ksk6O4
         PyiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP75q26NC06c6U3IYMR7ym98kXymAzuqnFrYAhJLWtDjOrTiJyhMuLfih+pfWoa33Kp2aYvdZhbFVtbMzvPKq8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvh/7f0LZm1N78ztNGJzNYeZjevAvDfdFkQnqY4voNvfrmbqZK
	yvL34mslYtfHUzUjVr3AGxp6qDuzXpPwAePQZcxMEU3CswCCEtrIBN9CHf8TPJ0=
X-Gm-Gg: ASbGncsnGcETdrb/igAuD6iSYFtsq1u1oSpRcn1SOZpKSCqz2qfWExjf1n9ioDpApPd
	PZK7lEzgb3fhPDvtxc0E0bQ7gVaMPfvn5/6ZBQYpvq3QOUUSjrf7ZB9vYMJsSJx7hkHO8McJ8Ue
	p00aeUqOfNvu97acovqZaX1d74CBhzydti3IqiAdIF1QP2SI0LRxAWFGjBNTdzIDQm4Yv3RdIGT
	7sQULsvnYrrx1OR2rYILuvnBKygolXYQK0qpO2zwiIWsWMudydzgFJEDppPv6H9r7w95Sy0BsYf
	hx5Jrx0N+JsovTORDVJQSmIL1hyd5JydP0jjhmxtAbU4N0k6PjPAx1OjyD9APkyvyDOwdiWv
X-Google-Smtp-Source: AGHT+IHfwoROTwu8y7TH1PMx5xgHrbT3nnfG+S98Biusb0bw61ipKrcXYXN7U64BqA6qV90JyJTVEQ==
X-Received: by 2002:a05:6512:3ca9:b0:545:225d:6463 with SMTP id 2adb3069b0e04-54fc67d631cmr3718127e87.42.1747051558400;
        Mon, 12 May 2025 05:05:58 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:05:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:52 +0200
Subject: [PATCH v3 06/12] ARM: dts: bcm63138: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-6-86f97ab4326f@linaro.org>
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
X-CRM114-CacheID: sfid-20250512_050600_307995_9D82877A 
X-CRM114-Status: GOOD (  14.72  )
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
index e74ba6bf370da63d3c115e38b4f20c71baff2116..4ec568586b14c89daceddea8f17381f72f512a93 100644
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
+			reg = <0x100 0x04>, <0x114 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 32 .. 63 */
+		gpio1: gpio@104 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x104 0x04>, <0x118 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 64 .. 95 */
+		gpio2: gpio@108 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x108 0x04>, <0x11c 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 96 .. 127 */
+		gpio3: gpio@10c {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x10c 0x04>, <0x120 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 128 .. 159 */
+		gpio4: gpio@110 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x110 0x04>, <0x124 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		rng@300 {
+			compatible = "brcm,iproc-rng200";
+			reg = <0x300 0x28>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
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
2.49.0


