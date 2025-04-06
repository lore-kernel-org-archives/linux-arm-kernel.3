Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8E2C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ajeMdU2bzp3CfLA2J3Ap/K02MBno4FVMRdHz6CQ8IU=; b=1kFoYwWEFMHfkWOYSzvM5XGZhJ
	+WJFegt4+5YCA85D8xl+FD8tGe8OgBBJ6mjUeUIWY9s3K6R1rTKXdj1Quj++OCMNOhh3tEueS5O4I
	CijlQh92dHiGGItrZZF+UUJb4nwBM2MT6RlER4SXgOFDkI9sQaVCIvc57Gt8vDSFIpACYTLsOm+n3
	jMq6AXbYFqbwqJy7ESqKGPt3thR+bxFLDa4eFdwtfBbYg+PBD9dqBqP7nIyXlv6Eq46S26Ae4zLL1
	j0e2vgGVTPYzUZJ8bIHUVUzWV4EBuAUl9rx1OkZtzEupSR+owsMph7V+unjvK5pcxS9toJztD4h4D
	jnbWFxuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1SEl-0000000FVZq-1Emq;
	Sun, 06 Apr 2025 15:48:43 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzT-0000000FUCg-3gAx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:32:56 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso3989733e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953574; x=1744558374; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ajeMdU2bzp3CfLA2J3Ap/K02MBno4FVMRdHz6CQ8IU=;
        b=qT3OY40GoCw5O9gjwuc4DD7nqX0IGUvj1JebtavOIIzqR/RdLRMp7qg1cH6YCvie7n
         ii9YuXkXclEMIbzou6FOWefWwykBsXGb9RgiqpJGkxvYtupV47xhII5dMBeoz8A8k9hi
         fPC3wnywc5/qHjatoTVY1oVQWKnKhgHkkXC2mjg5ay60Eofe9aOqYY1Im6g5V5R5izbL
         zLyWCCgQo6AYEt8vDb68MJbvwu3iy+Na/R4hlyuGTlPxtdovfJAPmoFDH4IpXXCq2mNT
         gb/6ljs2y2oRPscgTpd2khhJUGho685LInDEz+pImkeoREcsFfptFLlfckzH53kY/kJB
         EjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953574; x=1744558374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ajeMdU2bzp3CfLA2J3Ap/K02MBno4FVMRdHz6CQ8IU=;
        b=gCszo9d1fv13z+mvIBnbG1kaKzeQ7pwmP0+acc325c9GWQj6dbdOcm1kz1Bhv7nkuv
         XJuwDJWGYKPq5uilRdmEJinUW83m4e4sE6CUyFZ/7s+P16Wb7Jz/uL/BcOzs/5JTnc20
         a+fgNy+WToF7+pwimvptbxydiV5oEMKjTTR0nkKWNW+Z/ScpIVhnBehP0c/lbCbFA90i
         l4VN3PLNOcBmACpw36VtCnlL9B+wpwzeAmTwXsq2OufQGusBcrFhzS+2m3NELA3LEn3m
         jXBA29jZ8rE33dAAPbt3KHJbmhR7ulLCtxOlPT9XN1diueIeUMjqKmzV8r3LEhz5ELTz
         3jDg==
X-Forwarded-Encrypted: i=1; AJvYcCXvvoED5XP16eeMwTFpQI1Fkn7syjLCbauWyTFWg4YB3KlBMolQbRFDLxtgZweCimCy465cbtx/yfW29gsYl5Bh@lists.infradead.org
X-Gm-Message-State: AOJu0YyWgBgz0FE55YMv8XnrhXzcm7KVzp+h6G2dkexZMYGtqn40YkIM
	puwHitWjhE0DRcYT54mG1LnSr/mqLk6AI9eT7//7Xsgdvrb/fxp4fNb71ohCWmY=
X-Gm-Gg: ASbGnctksImb7qT29mu7hux1O/1rVjXa00zWIOymWVTaN4ZIEeskGLQ45FKdp9O99Tz
	uEz94sOwBmD3SZFyVAzOljrfNJMkL2QVn8SiB8MVrsN+UxGhglCSt6rHIeVXiYfdmmlunq2iAyz
	0oN/vo2Yi/8R8nXf5Mb1Go4rC2O+J6mKj1e+AR73haCOCrEuMjI4OqxC7rnDSbjTMTHoTZAJ1vG
	UVeGGhQMRu6x8c/Hw5zA9mW9o+K8MDgMPYpRTsOGSi+SfGo1aOq34N9pAmjX1hK4Aafb/2GQE8q
	WyJNaLND7zOzcZO0P5ukHSaDl/IMN/y9sdmyWBvFjDFqbiOjnKUi3Wc=
X-Google-Smtp-Source: AGHT+IFj9LWnQwqEwwAM4v/TD9+jrEVV6TFXglDNz6bQzR+BzsB+tyvLPIttTR1FGzpY9DtHm6lc6g==
X-Received: by 2002:a05:6512:3da4:b0:549:9163:9f5c with SMTP id 2adb3069b0e04-54c297b7208mr1252974e87.1.1743953573998;
        Sun, 06 Apr 2025 08:32:53 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:53 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:48 +0200
Subject: [PATCH v2 08/12] ARM: dts: bcm63178: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-8-22130836c2ed@linaro.org>
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
X-CRM114-CacheID: sfid-20250406_083255_920658_BB5A78B0 
X-CRM114-Status: GOOD (  12.75  )
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
2.49.0


