Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D638C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 15:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDVClodjbP7WgqfOUXGhJYRlrZjTGCEuJa62uKxhb0I=; b=Gp2OkZadvIk9ePWJPI89pgdVBD
	/w4tTQxCULEdEzDnSSe8JfL5vVWCFku1xXstk1Ah9Zq2XrfWvVNg+WzUYPtjwL+heQlBqY4mQ0qT+
	j2cyRxlyIUYgylsSxcpE6r7d1QflUFmDZLnjwzWKFMJlwdTzgS2CBr+/ABsCTyw+BjsV8puQGuyDJ
	aTqoozEEth/d5eT469nzPraMO2UhUdmFZE6t/n9x6UDUFieaPqxe9fFH0/5ys1JcBQQyeRl3Qcil+
	EAUpDz3KRpsO/4EcQIFGL3hipfN6QrT0fzYBTWREe9uPkO/fO4Kv+cRPdlSs8DMt/JTBUWPQi/ZNw
	bq2n5/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GXD-0000000EH77-1fhY;
	Fri, 11 Apr 2025 15:43:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FNT-0000000E5j3-1BH5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:29:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso21813815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744381745; x=1744986545; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDVClodjbP7WgqfOUXGhJYRlrZjTGCEuJa62uKxhb0I=;
        b=pdiiq+Xh6jBoJ9CVlxHx5Sus4J4GuATT33sV5IC97W5SlB4wbf8n1oWycbqxjBxQR1
         qnliUfq5lIH9zIGpghhtqCJ1QpbmbzKv6bfmHB5Efz/yzjl4cuPK33K4WaGxzegmdAzw
         /yklm8Tlw4q+XMlsaiFuaCMJU/roi8a8/nYjoKY2X+uyDcn/iDngQ6FWHbNiXRmDDgW9
         3qvhs5VdAl3ZqCC63J52Qyv7kMB9agKKtQdGsn7h3uknQAEsY8O9Hnr3K7+hxzn5tT0V
         R0z/Srd59VwERW7AlkkbLNHCC2tB8VYhwjyra94cYhEKTazlNV/gzexkeqmAnwRYCi3Z
         ajZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381745; x=1744986545;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDVClodjbP7WgqfOUXGhJYRlrZjTGCEuJa62uKxhb0I=;
        b=nHMjAh+NZbwKZXsCJRzV1MjX+C0z3nR/q+OdHS+lET8kkBC4vTziV0RAwfWsMc7rnP
         y4MHSkDpZ89sB0ep+Hh/cMrYZ5NTXK4YUI3+jqrBG6jKnkzjX9VkRXBcS1uWgxoceol5
         g4nSPnd9SfglZmM8rPib3RV9tgHf8g96fHHsekNJedMPOYgwi5KDD6Ojo9GEzN5EIcbj
         WycSMgSPA4iwu8atldvjiTXIvKahylww70KETT6vXrNIo8iJXYNJf050vhzLfgviC/c/
         BdszMmYa3vrSQ+X137uYKuCdzkIzzRNtz4ErIXWoceIRWX85aVCGzfjGtBz1cAxXeybh
         TNKg==
X-Forwarded-Encrypted: i=1; AJvYcCXhfa7z/uitIsCQWVjPu50bidywT9e5HQbodiU6PajbKmJ0S/v0/2djz4gM5xaxbPjqw0N+1eJnUhDHiM5I2nsN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0L3FzeSQxRrKEKIW08u0mb2WYTIDna/UOLnViYPGzFXzi+A4/
	sAtLLkdVplFb32WyhGzMOZ55kqiD2pVuS6QpWnJb8Mc+KRg6paB9+GnDLd5sPbQ=
X-Gm-Gg: ASbGncvLIb+m7nqF6bp2rui/1pQNKpaFMhHgMnoFKYhza33luutiqkxRlEeZndFzU8+
	wmbsIXkgv3TkifEVchplFFRl+JWeBZyo8GgAvJUkugn2epSiQekwUQCfkrj5vfR61CDwewnmNQv
	Tz9op+GeSfIXXfaMiSkTQ5NS8oJNmX3ZkiDsQFkJZZL8vRUV7UCgqeuTal7LT3dMGOljCyDF3Fj
	eQ8pvfPi6aaActPqVCPfW/5FchVOoYq4xqpYgz9HzxwEUZiheS4X2TtJJq2z7IiCMO7M/STG0I7
	iaLnlt+W+ic44G0E+Z9LEEFdq3sT9sCHB8Ok02fV7vOm+tLT
X-Google-Smtp-Source: AGHT+IEMd+8lqysG6izH7R/apKkjPjImt5zgqWC5HaUT+WT21VIlA4YDnTZixy/Lp0r7GGgQ19nKwg==
X-Received: by 2002:a05:600c:4f45:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43f3a959a54mr30766125e9.15.1744381744274;
        Fri, 11 Apr 2025 07:29:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d757sm85173315e9.5.2025.04.11.07.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:29:03 -0700 (PDT)
Message-ID: <e59df78d-6dcb-430a-bec5-c1e47f3b3b55@tuxon.dev>
Date: Fri, 11 Apr 2025 17:29:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ARM: dts: microchip: sama7d65: Add FLEXCOMs to
 sama7d65 SoC
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, onor+dt@kernel.org, alexandre.belloni@bootlin.com
Cc: nicolas.ferre@microchip.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
 <d474fcd850978261ac889950ac1c3a36bc6d3926.1743523114.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <d474fcd850978261ac889950ac1c3a36bc6d3926.1743523114.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_072907_477695_F3DED03C 
X-CRM114-Status: GOOD (  14.84  )
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

Hi, Ryan,

On 01.04.2025 19:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add FLEXCOMs to the SAMA7D65 SoC device tree.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 267 ++++++++++++++++++++++
>  1 file changed, 267 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index cd17b838e179..9f453c686dc6 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -217,6 +217,199 @@ pit64b1: timer@e1804000 {
>  			clock-names = "pclk", "gclk";
>  		};
>  
> +		flx0: flexcom@e1820000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe1820000 0x200>;
> +			ranges = <0x0 0xe1820000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 34>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			uart0: serial@200 {
> +				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 34>;
> +				clock-names = "usart";
> +				dmas = <&dma1 AT91_XDMAC_DT_PERID(6)>,
> +					<&dma1 AT91_XDMAC_DT_PERID(5)>;

This here                               ^ should be aligned with the "<" on
the previous line.

Same for the rest of dmas on this file.

> +				dma-names = "tx", "rx";
> +				atmel,use-dma-rx;
> +				atmel,use-dma-tx;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
> +				status = "disabled";
> +			};
> +
> +			i2c0: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 34>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(6)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(5)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx1: flexcom@e1824000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe1824000 0x200>;
> +			ranges = <0x0 0xe1824000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 35>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			spi1: spi@400 {
> +				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
> +				reg = <0x400 0x200>;
> +				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 35>;
> +				clock-names = "spi_clk";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;

Vendor specific properties should be placed at the end of the node.

> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(8)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(7)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			i2c1: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 35>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(8)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(7)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx2: flexcom@e1828000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe1828000 0x200>;
> +			ranges = <0x0 0xe1828000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			uart2: serial@200 {
> +				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
> +				clock-names = "usart";
> +				dmas = <&dma1 AT91_XDMAC_DT_PERID(10)>,
> +					<&dma1 AT91_XDMAC_DT_PERID(9)>;
> +				dma-names = "tx", "rx";
> +				atmel,use-dma-rx;
> +				atmel,use-dma-tx;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx3: flexcom@e182c000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe182c000 0x200>;
> +			ranges = <0x0 0xe182c000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 37>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			i2c3: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 37>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(12)>,
> +						<&dma0 AT91_XDMAC_DT_PERID(11)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +		};
> +
> +		flx4: flexcom@e2018000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe2018000 0x200>;
> +			ranges = <0x0 0xe2018000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 38>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			uart4: serial@200 {
> +				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 38>;
> +				clock-names = "usart";
> +				dmas = <&dma1 AT91_XDMAC_DT_PERID(14)>,
> +					<&dma1 AT91_XDMAC_DT_PERID(13)>;
> +				dma-names = "tx", "rx";
> +				atmel,use-dma-rx;
> +				atmel,use-dma-tx;
> +				atmel,fifo-size = <16>;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
> +				status = "disabled";
> +			};
> +
> +			spi4: spi@400 {
> +				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
> +				reg = <0x400 0x200>;
> +				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 38>;
> +				clock-names = "spi_clk";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(14)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(13)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx5: flexcom@e201c000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe201c000 0x200>;
> +			ranges = <0x0 0xe201c000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 39>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			i2c5: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 39>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(16)>,
> +						<&dma0 AT91_XDMAC_DT_PERID(15)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
>  		flx6: flexcom@e2020000 {
>  			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
>  			reg = <0xe2020000 0x200>;
> @@ -238,6 +431,80 @@ uart6: serial@200 {
>  			};
>  		};
>  
> +		flx7: flexcom@e2024000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe2024000 0x200>;
> +			ranges = <0x0 0xe2024000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 41>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			uart7: serial@200 {
> +				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 41>;
> +				clock-names = "usart";
> +				dmas = <&dma1 AT91_XDMAC_DT_PERID(20)>,
> +					<&dma1 AT91_XDMAC_DT_PERID(19)>;
> +				dma-names = "tx", "rx";
> +				atmel,use-dma-rx;
> +				atmel,use-dma-tx;
> +				atmel,fifo-size = <16>;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx8: flexcom@e281c000{

Missing space here -------------------^


As these are mainly cosmetics I will adjust while applying.

Thank you,
Claudiu

> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe281c000 0x200>;
> +			ranges = <0x0 0xe281c000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 42>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			i2c8: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 42>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(22)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(21)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx9: flexcom@e2820000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe2820000 0x200>;
> +			ranges = <0x0 0xe281c000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 43>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			i2c9: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 43>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(24)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(23)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
>  		flx10: flexcom@e2824000 {
>  			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
>  			reg = <0xe2824000 0x200>;


