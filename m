Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971D2C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxbJCPygNmGFFkjmqhp+ED4ZC28M+PGEOpe3YaoTOvE=; b=azdvGYOONz5ABpa56+s720xk2z
	EfCpYNqkGEbY8fScgvJ4xr4R0DhK8TO5zWHzGFQeocvmdla3ZP3ahw5k7fNl0PI38H/85xBTyP7XH
	+3wEJDs6+L4W2nK98FhoM41RUjFHUgNxQ1k+lyTYC3aL4j/4rxdYsMVWu7HTulSi4ceMdw0LugJ6S
	jVOZxiRLt2wFl3zdyV1NQihIEBjQS4BIRfRKEcQhxlTPdnn8THM1Mx9FSGHBcW8r3GJO17rDULVtV
	mhD4liII+aFczqJqVPXQlQCXmv3KVQ1UXncYpGDXlzcM3WcLE5UCULYdSS8JG1SZ2Cym+6dgjf9T/
	6Xaa5utQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1SBL-0000000FVKr-47N8;
	Sun, 06 Apr 2025 15:45:11 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzQ-0000000FUBi-3sjA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:32:54 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-549963b5551so4345701e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953571; x=1744558371; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxbJCPygNmGFFkjmqhp+ED4ZC28M+PGEOpe3YaoTOvE=;
        b=ZCvrC2M+TuIYYzg6MemJkPWPfsJYibpCGcb0KRhMZusxMTbSbjz4Qbp63q44qAS+LC
         iHjAU03CjYwigMqnK51nTfBHdWizj8KxzLVKsMfwxfidA4h8iJ2u0xSEJl+Zdz5ArJ28
         YXLYYOwM6IXrJOLEciAdy+0BP4hSwNnZfeLu6vPhaN71neIIbNn/Kn+O79FJklh1YYiy
         UGPOEBdQ7klPQGVdDf8sCSDYHG2UHInYw51HZcMoqb3sRUd5Qy56AnRvB28Uxa9HcjfW
         wKS05V5HPCLbNMf8daISuz3U2fHaiKw8Ckf5rv52AAnm84vwB6NrxzqJayC/7c2cjvRZ
         LOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953571; x=1744558371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxbJCPygNmGFFkjmqhp+ED4ZC28M+PGEOpe3YaoTOvE=;
        b=QuZQn2uqpSsHiwinbQXo8xgtj/S87+s62zvgbfsMCHFBF5qZyZl/CFQVVeVuSxu/V2
         CDGukJq+3STLV/P6U5HVYkwDFz2z+HeWpCDSNBAd4ipUZQMf4oIi+AN3Qsclmi4ui4ar
         NUplOt5eWtZ7M1UWZ/04hHk7JLKkM1UKSRDdon999Ei9aBA/0XTvLCD68SItqm9fh4iW
         l9R4O5h7uWm7f6DgRwhEbF6DUG4yfy3ClIVT2ttNv6QEGsPPHSazQStMRij44fJrCXeR
         Uy+ruVW+PB5qMv/z3Y6r23ZigyB8rgjYM8PYqKvIMpIC95PptaX9vbeSS7o2L4T+I5hU
         YsYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXliw3UUlvxA/hYpTbFXN3udFH/48wLhOFOMZT6oLhpRN9PfEm+IKPHoROdncdECXGf9SFe+MitmuuMtmgjQpVM@lists.infradead.org
X-Gm-Message-State: AOJu0YzWKrb4R3QFLSpUyqc0LeAzwj1Ol+Awl07E69jtZF76NTvBsiKH
	iF3qVQtdK9cNrdo5/Vb8mfnUrAWTUEtSW4GQcFU8Vz/ZVImHRvgQZy6sJ6AdoAs=
X-Gm-Gg: ASbGncsET5+HPhHC9bZkRJ2o45ThLOeggvZvc136Ey5BRSW8P4OH3kbO2Tt7Cb5Rrm/
	rSi6Vc7NYvbC/+xHVvjJ+qq9Alef7ngI7kKjgs7BvwaYV5THwwGVD++Tk+W6UJgG9Rg7jdZa2BS
	Kq60ErFKJGqo5SYSiiHSdJ+0xcl38D94o2QpedXn0wQNYPa0UW5MsPG5ggyJ8NEpugIdYtzFWIb
	AGXSYJ4/O88d/UvQRdfqQgivsh9kHlf/BiHBAYV+GSkvorMXZ5BnhCCIn9C8jCmwR8HBxITMXL6
	WFIXnAcFDKSbnCsLUoZZTqMz9ivX96DGlM5u/RRfiyTAZbMO/ra4bJg=
X-Google-Smtp-Source: AGHT+IEfCCQeHtRVjiJNIOivtCk3Y3QjbXzuwpQereunWv8BhDimdvHma0Q0YTkRhqnfOtWAW6FKMw==
X-Received: by 2002:a05:6512:33d0:b0:545:60b:f382 with SMTP id 2adb3069b0e04-54c297d0977mr1426329e87.17.1743953571059;
        Sun, 06 Apr 2025 08:32:51 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:46 +0200
Subject: [PATCH v2 06/12] ARM: dts: bcm63138: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-6-22130836c2ed@linaro.org>
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
X-CRM114-CacheID: sfid-20250406_083252_967955_BD307713 
X-CRM114-Status: GOOD (  14.26  )
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
index e74ba6bf370da63d3c115e38b4f20c71baff2116..a3bce85e5f99f9791eaeb366f37afe30add573c0 100644
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
2.49.0


