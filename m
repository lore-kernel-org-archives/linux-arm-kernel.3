Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765BFC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3p7DB+5t+yrFgplraEPjC26Y+l8QS9JPSIhGfbkZRY=; b=UP7KauRsNh6jDipsmte68qcooz
	36DRsj7Jxsc6CaXUosiy7CEd2rMf1XB5g1w72PKgCYL/8C2av2SQpxt+4aK4rUPO7p9g/rntcuX3a
	Ey+DEwKWJk8+1X0rSFy+rRIlx9IGrA1FBAEqmzGrhZgXLastfj523rHaYxJXdCNrDRW7/Dp72gmeb
	yJwK0iUP6FcV7UgU3vnAlXe6l91F4BaJfgmSzmiNH5KT2HMhBSEVUV7hrQrKIRuMTpKqs9t07vsqp
	72nxOVWEuU3csazcCc7tpfwbF8rmN2z3gbxLKqwv5KNpMvXblmJ4az2WyBV6uOstydZ0R7W/zKSmW
	jFXWEjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESAt-00000009MyD-1syV;
	Mon, 12 May 2025 12:22:27 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERux-00000009KuC-0mk9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:06:00 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54fbd1ba65dso4936793e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051557; x=1747656357; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3p7DB+5t+yrFgplraEPjC26Y+l8QS9JPSIhGfbkZRY=;
        b=vQFVA9OEP7ZeNotCG/m100ZgIGSLLJpphWCpo/lJ1RKiJTG6tetVloCqw7lVLrV8jF
         +hwwhyVhgywRHZ8nzNeOIRWgMukOtMxTL85KMd6poOjoNrIRrPgaJpLyueWNYTjGUioM
         vHp6XD4DWqxjX6EYfWij2o8b/ZzNmimSn9UBhkKy8Qg3gRLptcKmriUph1GF81ZP6Vi8
         k/79AN91Bc4fhswzwvIcAz7iA+VrRUlfJpwUnYnT0R8YB4mp+X+vvjCSG6BVn4K54yet
         Vp0IwtzNKy+MLPPhZLX1Ocsxyv/jZFb15HSvu0IkfOWluCVWUzA4RzwPCIi/f00x1YX6
         6GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051557; x=1747656357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3p7DB+5t+yrFgplraEPjC26Y+l8QS9JPSIhGfbkZRY=;
        b=DUL7Qa6d3SfXllMTxVyiDHsZq5AZp372r+6esx6XZsb7detIn64xh9mc1j+16MF1id
         Ra8TgDjycCPHLkot8c5Rhd21+a5xBjc9Ebkld+KHV2AXQM3YM9YeQv/2x+hu1TTYoyn0
         SdDyKfrN71RH/Nl/0qYxcVD+Zu9gMhbFX7vkw5ns8CY9jlQ91m/GcFPCNSaCWilg2jeD
         zTz3A3fyP7dQL/QfX7HXy0ondFWn2NVE8M4QYD4bYuwIooOKVSMugkXDHKAXkvjhWCh0
         vif4p+g09VwhjCYgjYuaqWWYmSd28SfaGx+WkZW4BX41Buru2/X0lVz/XwlnqYYlxiel
         j9vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj+FyfPwtjVsmx64LBZWqlSg0t/xAbDMfRKNtYuRW4qwJsV9tXSrz86QwLK3G9QVOlZ9Pmkk6ilDJ8tPIB1C3B@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1kb14CV8KlaILDpvAoxkb/VSuYwLE7Kyu6jhDgm6UFCvVoufV
	C11/Wjb8mvD2e0mu1SEQ6L980nEEyTatNqsif/EUT3/E52Wg6ILQdUeJYKkQDRQ=
X-Gm-Gg: ASbGncuw4+t/Ccye4BjpO7L4wNBr2peXKhqyqa17VQ8LtrcJypP+xCInvGxToXY56i1
	xs5Uz/0y3Hr884s+PStOK0+H+c2PWVdsrYV9HR0oDPKbuySd43Tmw25V8UETLJMLescmAFNGkgD
	X1a3D4hzI59J3D4oxw/DmqYUTp6iiy4J9MaFr6iHNM/cBoAKRB6dVJ9ge6oEAceqz9TZCwtMOUu
	QQ0eH7nkts5ru5TfElvnmTStV9SuL2kqctKyW0DEUQVBr1AfyBIgn/DcBYRVmi8J83yj2mJQo9u
	sh626DpO60nN+4Ve8BN84lCSPect7btIb8SuElusYSsuPvor1h9JpvvJffSGmQ==
X-Google-Smtp-Source: AGHT+IFyxT+e/TpUjh6gEnf6+3FsAXhoKrFqOea2BadRcCNRn1SUi4Rzh5CZkkdbeVFmcxxdJdmnEw==
X-Received: by 2002:a05:6512:660d:b0:545:62c:4b29 with SMTP id 2adb3069b0e04-54fc67c5b72mr3878104e87.22.1747051557169;
        Mon, 12 May 2025 05:05:57 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:05:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:51 +0200
Subject: [PATCH v3 05/12] ARM: dts: bcm6878: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-5-86f97ab4326f@linaro.org>
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
X-CRM114-CacheID: sfid-20250512_050559_232716_5B18355F 
X-CRM114-Status: GOOD (  13.82  )
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

Add the first and second watchdog, GPIO, RNG, LED and
DMA blocks for the BCM6878 based on the vendor files
6878_map_part.h and 6878_intr.h from the "bcmopen-consumer"
code drop.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6878.dtsi | 118 ++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
index 43eb678e14d04be487af39c9365186b6fb919cf3..dd837bf693905736a7b8ef9cfefea8368e6df6ed 100644
--- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
@@ -108,6 +108,111 @@ bus@ff800000 {
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
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
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
@@ -134,6 +239,19 @@ nandcs: nand@0 {
 			};
 		};
 
+		pl081_dma: dma-controller@11000 {
+			compatible = "arm,pl081", "arm,primecell";
+			// The magic B105F00D info is missing
+			arm,primecell-periphid = <0x00041081>;
+			reg = <0x11000 0x1000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
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


