Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5CCC3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ajeMdU2bzp3CfLA2J3Ap/K02MBno4FVMRdHz6CQ8IU=; b=nPjLs2C6nLDlBUGC/GpXGP3/Bf
	JmKfuEhx0GEvYZhN3RvkoPPdJ9ffKfLSrv07SYAvAuCLP3vW4tgjBkpOzA6AO9BfuT4TAkhTyU8V5
	2qIhAJ3SChkI15QJxcLP3p4qkxHxd4k06wyBVDzRca1o2yy8dHIZc/ukEvjhYcnWHfA2lCTLBN+Ok
	LfniwemINtH47Zmv0AkftGtwcJFjMzw/lOaKf6ZLOk9yPJI/IlTNF3ZTJ7Y3HIXCS6OGVIU0KZW8s
	uG9dyhUZ4SletC3XJ28TdrJA/Ae3M77mlEweJ2Fsfw8YGRm3bpeixUfVrR2a8MT4m/OIl6U8Uwtjk
	uYvOzrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESGt-00000009Ndb-2gqA;
	Mon, 12 May 2025 12:28:39 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERv0-00000009KwA-2Txy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:06:03 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso5671416e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051561; x=1747656361; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ajeMdU2bzp3CfLA2J3Ap/K02MBno4FVMRdHz6CQ8IU=;
        b=oZS9YbYGlz3U2+KBbf++blOWL9diJPN7NRowMo+1yL/wY/uVjYn6Soe0CNFIhGRhL3
         I6KCRlm7GzrLaCHc9VSUTKldeYVRxhQF41C+AKiv4t/QfeC5Bl7IjBidWPk0RpYEsa2P
         ipqQaXMsWj11TdqjCBt1glSesyzpPi6VfNu5lMD1W1TFNtbyEs4kibpiDpOc66zF/wRf
         pmRJJAowxMRmICRL3VU7HDuIafL9JZpgcI8RejLKMnU/S6/0y3YShZtX4Qn7mPXrepgL
         S169oZt9DrWHwtsUUXAVHzMb7e12qcjTMnfHuWQ9PM9QIxFqnqyTsg2c725Z6uEBHA0K
         IAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051561; x=1747656361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ajeMdU2bzp3CfLA2J3Ap/K02MBno4FVMRdHz6CQ8IU=;
        b=BCze8Ao7RrrD6R25dPnFWb7HHt8+akI2EQxwyQqhKo3+lL4kIOX0PosBPct/b3jwx4
         orFD/xG201WPjhJrrzwpbRHK4jQRATbN4OBCVOUgcgfBqlkNZBOzyljAGyL7S4rzoaNS
         eJyQigxjvImx5PmT8Wwv3x8jhuo3iutkzjlfYP5pxkFqfpHebiA1g/a7NBvAsjxHqLw8
         d4L++dmw+jsdNTPoWli6XyoE/M/BHdPzmwIpdxOc+XeHAmdU1ae4GGRC3ZBt7tb4g+FO
         q57PfatTqRXuJdkxjk0COaiIFeHccT3IBocKUJ5GfGDbuIqX6Ij3Wja2ptECgKlFcigw
         N1MA==
X-Forwarded-Encrypted: i=1; AJvYcCXf56VoBw3GhUL0LlfiMoFXAHCSICYwN+XJMNEfwr6rw3pinXKn5iHlBXvgh3KVyPlPEw8FJOMtdnJBfUanI5Xw@lists.infradead.org
X-Gm-Message-State: AOJu0YzSPhpY7qemhkNMeS9cLD//3vBjpkNEp6N3gC5PwHEDgNYV+6JH
	rj7GzfVwzVghdtHbxcmvN0i+bZ4FDtIhjyr9ZOOPU/G7VMoOivhhNEdiVC/pn2k=
X-Gm-Gg: ASbGncv1hZ/cE52bnNtutj8jjxU40Yppx/ZedCpOoAGYqaVz9uQbCTYpQjK3g16phBJ
	NwpFXKTSZ92gbgno3F6Nmz5raWXrD5LcU+sWT5y8BYqFg1nO+82FPAPOUsMFdK9N5UKJNFn+yTu
	6X5iqqVZS3rDGYHTyN6iD6ValYQAJVTVBF/qHjPEkexdnlM0LhnBrGqYQd8PxrDKOijr+ib4iNn
	2wXDj4OvZlqa/7HafJPUDF0ZhO0JcMH6tVTi/7/Hb8niECVhoRAQ/qIaR23B7e/l+QjNOncHPMm
	DAQMyoXrCdjx+iXC+3zpoplzUk+zYGTXOdflcpWYbtVar7QoVqoqSsZlBLjiFw==
X-Google-Smtp-Source: AGHT+IGSmwcgd/v/2nB6DnUNhnkM2SXlf2xtwMRKJKghp8E3JFM5XZm6ROlGaVa5BJ8wKDCpqrrdig==
X-Received: by 2002:a05:6512:4408:b0:549:5769:6ae3 with SMTP id 2adb3069b0e04-54fc67acffdmr3842426e87.6.1747051561017;
        Mon, 12 May 2025 05:06:01 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:06:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:54 +0200
Subject: [PATCH v3 08/12] ARM: dts: bcm63178: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-8-86f97ab4326f@linaro.org>
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
X-CRM114-CacheID: sfid-20250512_050602_660732_5DCDC9AC 
X-CRM114-Status: GOOD (  13.22  )
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


