Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62F3C3ABD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CygA5PwSQSuLEhfxNCuFBow2mvN3/z0TWoGRkpMN9Zs=; b=s6SCUf5qdy6uyhF/Ytvm4y1sFv
	1IlP3pmOdca9CNdded+acKNlF1yMHZdLWzu5gNTWzrwJ32qFZ2FI+79dOZLIfRNjyRisffXzKGzTy
	y+1M2fGUQdzHp9Fr6ltkVS00VfiBmgtvM4NjZs40U15x/8J7/DTuS1ZR02Yht5/ZDfHG+Vx/U1CVR
	dTrzPXKTTUfyB2RnepLbtniEEZCr/fDxUEhh7EhInPPgvJLUN3mIPzCKcHMIDL15ePqYmqKbBZHLv
	Lrmq/iqaHF/ZUPSPgAOBlq3EkiNZiYrywl6iam5rTfnBYx4gCO5Rqy5cGxuwdWw2Zid6OqFXVOGJW
	Se+68tbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESIz-00000009NsF-1Qkw;
	Mon, 12 May 2025 12:30:49 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERv2-00000009Kwl-2n9V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:06:06 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54fc61b3ccaso4254037e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051563; x=1747656363; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CygA5PwSQSuLEhfxNCuFBow2mvN3/z0TWoGRkpMN9Zs=;
        b=fwBgA+HQSJkMdazkj/wphTyRHOPy/P0qjM2ilZEEpbgInwE8awhdTgl3OmXjNY4FpA
         fDQU4PqELvEWlUVsnn61ma12qnVUlaOBGPhb/cH7sPGIX3uYeyIxNbklraZh37zQScaI
         zSEEqqGNIw/PEEdRfIBYJOvPPByrUmat5SWH51AKfvAYFU+Fh/T6PIuK3NvoPv+lK3ek
         p7zk+mxn0KGRCwo1ItNSliu7ZQgrLTy5EaRqAEH3Vnxqp9spCXHcP048IIlKveRAE/5u
         DsfIJrJKQB9nMqQifZ/dVqh5eIL5NcvMubx0Lru7azrebJodUtDBzLIrG3no9O20J1DX
         q1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051563; x=1747656363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CygA5PwSQSuLEhfxNCuFBow2mvN3/z0TWoGRkpMN9Zs=;
        b=nMB5nIHjCpphYwFI879PMopXnHxCsnGPuMi4BWwt6nj6kmC8vAJjtzoW5U+F191CR7
         OFTLASk6QN4GA2fbSM7CFbyteUsStmwYePCDV+Oq6ezvcUpw7sS+YkqRf0IViSkSCz0P
         kqunsC8yt6JrMIWjGwRKCuLLdbXmFzjZGD+3ez8yrA8yxoOz9lD1ajn9myIXp1Jue1ua
         U8cOMZcNcZ2rxN2sjlR3yGH8iVb/CkaDGSRuJj6GHzGAfTIdOTgOfeyaOLX29qkqyHTi
         z/gy6jnjW8pTP85n01qRqEMDlpI3fsQXLvCT50ef4LJEsdYMOZFmfqR2gkSFjg8bSTvh
         Bqkg==
X-Forwarded-Encrypted: i=1; AJvYcCXDyqwr32+3dektQl4mtTn4CcIgNdf1k3P1SFWBbJ92A2W3Ay1/8jjwEVJMkpaddZ+oMyfwN55zloFa+Ns5/gMP@lists.infradead.org
X-Gm-Message-State: AOJu0YxuTRtyWYug1VVbgEyxZQ5JuGjeoO92Bl67IF9H81O7perHgoqj
	1YYsqmoQMegOqYNe5Xycl3znzcUj2lwT4rS73hWoRTc+w+9G22K4Q7t3yoUv7NQ=
X-Gm-Gg: ASbGncuxcxhi+j89UCvVdNF15Yoj+7ChoiGFwX4iQ1HunFBayRHFwsDf3CdMQm7LhWs
	mRv5YRi3IPgbs6MDdBAmvb48e31QN2/PVHRvEnwM0iijWJA+6jrDzAI1ch+4bvDruk+EmGjDtar
	9oTOZJX7ZdOSdKZKYnVHlvoqS4vC3rpw5F9dNCFetvvs7VMTQj2z9UBJn/mUiyVxBRY8q53CBZt
	dfmrDMQMQmUaLHlCha5jSSwDNPq+F/UpZhdFQFBtfBprNaHIJCfUZGVzE5Z0ZNL2Zm80gb0H0+y
	dlNx2VyJB2CMqBlqeIYdBi0qsjSdZ1DhjhLeuByItuO8w9EklE3L+fUEgsMyvg==
X-Google-Smtp-Source: AGHT+IFcI+pN5fHTlaJgs5MuA1jITEkyc7+sdiIsopk+fXZHz2qp+3djh3tYGB+lSDbAHOi7Q/GgmA==
X-Received: by 2002:a05:6512:6816:b0:545:fc8:e155 with SMTP id 2adb3069b0e04-54fc67c71c3mr3505581e87.20.1747051562726;
        Mon, 12 May 2025 05:06:02 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:06:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:55 +0200
Subject: [PATCH v3 09/12] ARM64: dts: bcm4908: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-9-86f97ab4326f@linaro.org>
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
X-CRM114-CacheID: sfid-20250512_050604_716512_EE842826 
X-CRM114-Status: GOOD (  14.40  )
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
peripherals at 0xff858000, we extend the peripheral bus
range to 0x400000 to cover this area.

Add the watchdog, remaining GPIO blocks, RNG, and DMA blocks
for the BCM4908 based on the vendor files 4908_map_part.h
and 4908_intr.h from the "bcmopen-consumer" code drop.

This SoC has up to 320 possible GPIOs due to having 10
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi | 116 ++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
index 613ba7ee43d6489ea0f1490d2fccaf90961b2694..3b7595fd4e81d150278816bbe27e08286cde2ff8 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
@@ -323,11 +323,12 @@ pmb: power-controller@2800c0 {
 		};
 	};
 
+	/* PERF Peripherals */
 	bus@ff800000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x00 0x00 0xff800000 0x3000>;
+		ranges = <0x00 0x00 0xff800000 0x400000>;
 
 		twd: timer-mfd@400 {
 			compatible = "brcm,bcm4908-twd", "simple-mfd", "syscon";
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
 
+		/* GPIOs 96 .. 127 */
+		gpio3: gpio@50c {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x50c 0x04>, <0x534 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
 			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 128 .. 159 */
+		gpio4: gpio@510 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x510 0x04>, <0x538 0x04>;
+			reg-names = "dirout", "dat";
 			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 160 .. 191 */
+		gpio5: gpio@514 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x514 0x04>, <0x53c 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
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
@@ -636,6 +733,19 @@ reset-controller@2644 {
 				#reset-cells = <1>;
 			};
 		};
+
+		pl081_dma: dma-controller@59000 {
+			compatible = "arm,pl081", "arm,primecell";
+			// The magic B105F00D info is missing
+			arm,primecell-periphid = <0x00041081>;
+			reg = <0x59000 0x1000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
+			clocks = <&periph_clk>;
+			clock-names = "apb_pclk";
+			#dma-cells = <2>;
+		};
 	};
 
 	reboot {

-- 
2.49.0


