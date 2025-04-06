Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D878EC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZGQkYCeBjNtSxE5BP+8exx6EGO2URqW/JNqR3gaiK0=; b=bMeeCIQlwlba5d4ALoQeB4jWNm
	Nr0Qrw7Bas2lKO0iHw2Ekxs0cdvpNrO8X2NYYFEeLOuNPcUp+YOkfVEh3K2POJI6Ea2mUudz7Oy0v
	JrQQsEx4667Pfct81v+SNI0waUNTjMn894NnKdcShmCu/W99tzuxGdEga7USjVjef8BFO263Q0YO5
	YyZFwAthdI+JXb/HCpVDYaeAs1QmmPZqgv5ppaj0Pod1n2qeaoAIm51myVf81tc6KKqvCQM6Oakry
	eIx2+zXM9WopiNtCkSHTZHvnE9ooZQyxAxi+C6aPVxOdCErBELXm3VCNLfk751fl6e1vouAEahMoD
	9OB9WtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1SD3-0000000FVSE-2d9t;
	Sun, 06 Apr 2025 15:46:57 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzR-0000000FUCJ-49D4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:32:55 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54963160818so4419105e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953572; x=1744558372; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZGQkYCeBjNtSxE5BP+8exx6EGO2URqW/JNqR3gaiK0=;
        b=q40eUPOq+6b10P9vBJk+2XfmF9IIFNLoIBGnl/vIALgEJfvaDFZsurVfNjCLlCDvga
         qzwsZ6ItlDYUuyBGOUXK+QMwbugBi2FWGLMWpPtwVrX/LZtwjxp3WcbhjCQF8HFqOtZt
         eCAqnX8k4oILULgi80c55kAVOj1LjDcU3q+eBmvFAXyVijU852CaDrC4xY8t0NZxEEpn
         arElwNSOg2rhMP5M5fjAXtN2r5hJdN/MbhTgAi++L6/ykL3JRJJOpzFKA3PX2NBz3tdD
         TSYMcuFsPsnrT/meePLxQRDL38s8R4QUgHNcrQm5ujmADX96QznMEl34859NeTHtmRY2
         +h1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953572; x=1744558372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZGQkYCeBjNtSxE5BP+8exx6EGO2URqW/JNqR3gaiK0=;
        b=t7fFc/jySondI6Jj8B537GUadgfyO2fibxPxsf0pzw+6l4zwVAFsmtAvcmqX11SJFb
         Lg2y2JPFTNdhl8k05+GGTTOA7S7Cv3HhMO6N4M/qupOBiy1Xnoy3FxRlOOHFbLW581WZ
         MZ1U7vAB/r5ZN9HVLp0keZy0FexjEDkkmqIfSsbyhF9Lmgv9NsPMeNU+zf32khs6HSuX
         6Miq/chDJ+IoNSl7zsFjgCQg7nDdyitECqBPrZQzh4wCMvK2Gtuh6GTprbyn4cwnTXHK
         wlDfzw1B2Opr1+fIEE0O/jCh9OJZ1pQBnryBbyVXmwhS9A6wa/cClzSfnC+OCyMeu90x
         hNrA==
X-Forwarded-Encrypted: i=1; AJvYcCXGnJy5O8JesQ6oZGNA+z7SJNMejYSUd0Ov6gGl4gENCatIkEDA/OXNJupQpICz5vcBoxep0Ynzhj7crqAInvgC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy6LLI629gSx0GTU6fDK329pIBFjX8M0WxhwUBoQ8ZPSLadloR
	JVxKAJpa0/war6EGxESEIrheykRnYkHAIk/uPqxvCmX/rp+C0vX8Iltofwr5zTY=
X-Gm-Gg: ASbGncsuRF4TDVkoWD7qYoILbvL8IOnmDwizsAibgDMxSg3caX/TZRGw7lEXhCBSteW
	OJhbAxYleGfjTAQoERpr4beRotLORQt3RDRpIRFMRdWmqWd/9wE+3MrBoQTRThB42Uoo3KAzFKZ
	jg38cphAVoj94KZioS1qb+Uu8OGV2VmDD5qPjTjE1BZmySjGhsgyH5Mwdt7L9HHhcrtfc3/W1TJ
	7tum0kpL+yFhQzHsiJpsRGNAWsCq0bze70jkVO7dqqXeXTLxLqkuLazVe3G3OSLFC+hlJQexsfK
	1wgC/9/zfaX/vRursfyGYT4zPubCAhMwk1vVUhFvdxbCzYCS2NjIA2o=
X-Google-Smtp-Source: AGHT+IFF2qw9sVVkrJ895fapzsRBMMOIm7saMh0Q78SxDsVhkJbrQe8Oftk4XE1w/i7jQmK4ffEtEw==
X-Received: by 2002:a05:6512:e9c:b0:549:7590:ff24 with SMTP id 2adb3069b0e04-54c232de16cmr2371768e87.22.1743953572521;
        Sun, 06 Apr 2025 08:32:52 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:51 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:47 +0200
Subject: [PATCH v2 07/12] ARM: dts: bcm63148: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-7-22130836c2ed@linaro.org>
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
X-CRM114-CacheID: sfid-20250406_083254_034591_091D0876 
X-CRM114-Status: GOOD (  12.63  )
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

Add the GPIO, RNG and LED and DMA blocks for the
BCM63148 based on the vendor files 63148_map_part.h and
63148_intr.h from the "bcmopen-consumer" code drop.

This SoC has up to 160 possible GPIOs due to having 5
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm63148.dtsi | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm63148.dtsi b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
index 53703827ee3fe58ead1dbe70536d7293ad842d0c..899b2c572c601272a3525ad6f5676209aaac0149 100644
--- a/arch/arm/boot/dts/broadcom/bcm63148.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
@@ -99,6 +99,62 @@ bus@ff800000 {
 		#size-cells = <1>;
 		ranges = <0 0xfffe8000 0x8000>;
 
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
 		uart0: serial@600 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x600 0x20>;
@@ -108,6 +164,14 @@ uart0: serial@600 {
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

-- 
2.49.0


