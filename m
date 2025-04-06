Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625B9C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEf4cNwCAvTux6g5ErQoMK0ZXsg4RGhL1cTSbSRkU48=; b=IFd/v4UqSEhQk+tzQ598T6AAkg
	19HYFPVIVODvP416tCEyvjAlRX7omVzdDnCvCVR/P3g45jPiKrUKmzZKa41hD+dpokv/JqanxpSvs
	33fosqSO92nnrvysr8pRU6am+nEokC+jdufEpSve0uccLH/Qy5MsLYVSBZPmw5B8iCtQUsL2UlKBh
	IT4T59P4vZdmWhTIRYJLXQtPoOKV7JLmE3W587YCOmWQVxIRp3Mhhd1H0P2UhttlEvo1NWFmWwRbA
	O/OjJGH30NJXH2OTFwLlx+2aBIJ/DxKZkZWif2uPtePpeGFs7DDsfBXD8FrGj8hhGEgI+8GwLr2zw
	hnPTaoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1S7v-0000000FV5a-2JeZ;
	Sun, 06 Apr 2025 15:41:39 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzO-0000000FUAz-40fi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:32:52 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so4088580e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953569; x=1744558369; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEf4cNwCAvTux6g5ErQoMK0ZXsg4RGhL1cTSbSRkU48=;
        b=FEyr8EESjI1iEK2SzDN35+E1eMEQI/clBCVQ6jHpMGr4r7OTRVTrKqSBu/J1W3IK/z
         YgrRuEtJHK9znHZ36Cluyb7u/bJZ92hgxXKzTcw7T7J5/bANkVxE1DO/5zIYNErQ+sPr
         q95DNevrUaPAtSBCAG3fc9ORRpfPmaiOX6gP8KTg//kTQOJ+htaAwwGIDOzDR/JoV8MB
         J8qDdPawKQUyLYA5f8vmhaN1uUGHOz/SRFg00CqfJEcQrbLcjQKJj9ACbg39J3GWpgbY
         w/L9TJlnTCeaCiMYOIH86eOhI1KIzbHlfZw7Y7ZLKOjjxLGd5ke1oZRr9nHPBp78Yu/j
         F8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953569; x=1744558369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEf4cNwCAvTux6g5ErQoMK0ZXsg4RGhL1cTSbSRkU48=;
        b=RLyXkwIL0LVUxIzouuW+NToa1YFG1P1YmWiu03vc9Z1HMdOJmkMF5oY6BL7LCYawwi
         j47Yf9wG56FXP41tAwC2trXjsRjiVBQfrG/ViAvt/9Ac8tmSkHKkPFAo8PJKtRVYNmYq
         eHqgz/VLNB9Qd+2+pPNQJuWd8wDpk33PFzd9ySKytYhrGbokK9YCK7c+pCCFqPT0Wmyl
         K6i3bxl+KuWDPmM2uAV+dEqZjx6sk8/oDAifjxXpM1ik+ekmp8RaWF7YPM42PKGfdkpI
         cF2FFhoTvK+YEsDr4jrXVoN7QWnXFeZMys73EkZHm+uIN0CSOc5MPlqUKKCl9O1cK7cy
         0CFA==
X-Forwarded-Encrypted: i=1; AJvYcCUKwa+GCyHb1ehnbuAnSs6r16D0VXihkzHhl7m3LtWEtvUSfFGfByX9NouDTocOV2G4bz2zfV0u+wkD6qtusdga@lists.infradead.org
X-Gm-Message-State: AOJu0YyKW07uKaiTJx05q29XR11VkdTzPOmkD8awWllUWiDfTySaGzMG
	SzTLyY+j6BokluZik8Yr7+ZEkaS3b/tOBCe0Pr/YTMC3Idf18xOyOzSeCiwpYAg=
X-Gm-Gg: ASbGncs/RrwuYHEDZZqAJu4kApWCLqGe/kLP6QhcmWjO+itMLv8DOyAaOkK0ksQAzXv
	HMchCnABdSX9STqc4/hBbzn6jgZ3fBSOOOtls0Co9Y+07UTOD615kOpisgpFtFtkXlzbOYh2kud
	Ed4vQKuHbCk1PuVaXppouDN4t2UbZ/delR4Yd4pfcKNijBsfA+pDMsOtLpY7nsqzoFapIDUGMar
	C9Snx9iVbZ+uw0QoTnVyV6TiAMtesbpfPPE2Wo8IZZyBiaDRKpbJr5e09prKR815J+3/dDVagTT
	xphoVzrJ0Hru2mBULRWuEnVogHGGgO1nXxlj/9PfgJwuuao0H+BTCUI=
X-Google-Smtp-Source: AGHT+IHX6ymB+h9Lowm2Yf7MRd1SjNLaX90zJo45WhqpbwKnM4ta7ShvImIRlKAv4ludhs63y9R8sQ==
X-Received: by 2002:a05:6512:3b08:b0:549:69da:cb96 with SMTP id 2adb3069b0e04-54c227ff9d7mr2905626e87.52.1743953569117;
        Sun, 06 Apr 2025 08:32:49 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:44 +0200
Subject: [PATCH v2 04/12] ARM: dts: bcm6855: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-4-22130836c2ed@linaro.org>
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
X-CRM114-CacheID: sfid-20250406_083250_997394_BD1C8D16 
X-CRM114-Status: GOOD (  12.95  )
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

Add the first and second watchdog, GPIO, RNG, LED, DMA and
second PL011 UART blocks for the BCM6855 based on the vendor
files 6855_map_part.h and 6855_intr.h from the
"bcmopen-consumer" code drop.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6855.dtsi | 127 ++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6855.dtsi b/arch/arm/boot/dts/broadcom/bcm6855.dtsi
index 52915ec6f339335d87b4e50e1c03625fffb9a45d..a88c3f0fbcb037ee5c6b31933415f90cb51ded2a 100644
--- a/arch/arm/boot/dts/broadcom/bcm6855.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6855.dtsi
@@ -116,6 +116,103 @@ bus@ff800000 {
 		#size-cells = <1>;
 		ranges = <0 0xff800000 0x800000>;
 
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
+
+		rng@b80 {
+			compatible = "brcm,iproc-rng200";
+			reg = <0xb80 0x28>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		hsspi: spi@1000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -143,6 +240,27 @@ nandcs: nand@0 {
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
@@ -151,5 +269,14 @@ uart0: serial@12000 {
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
+
+		uart1: serial@13000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x13000 0x1000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_clk>, <&uart_clk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
 	};
 };

-- 
2.49.0


