Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4236E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BNq9HukNRZr8ujW8Nrg9M6GQfhB02SRFVzv7C/bZVs=; b=Hig8uAW5s53BT5owQBDZHS/b3Y
	dORvI/6xlT2OZxyeIsbvZe1LVCQ1te3b3v0oHBJZMMKbi0XP2AlAeOqgvgmHhx7tBxFPmDwtKUcrR
	NCESgEvnepUb+msGzWRyt/ArpNhlBTxiruZbcgCYXe/y1Xwa5mqe6lL0yTA5c9LRfKoZLIhSwTpNp
	mqgG+joBtAyLQHQVsPOZiYIkChnP4KicU3VLyh5yHJ3164116LJlJuhcWh8mKV/2yasEwErhk6maT
	tgl++Zn/BPOt9g1HbHxqFU5nUCuhmnyq7lhk6vtTkVcNCKwozBkJv98Drw4glmSZACph6J0tlmN6A
	GC7vMELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKBZ-00000005YaV-1zAK;
	Sun, 08 Dec 2024 16:31:09 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKAS-00000005YOc-0DrL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:30:01 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa543c4db92so730439366b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675398; x=1734280198; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0BNq9HukNRZr8ujW8Nrg9M6GQfhB02SRFVzv7C/bZVs=;
        b=BCHf2jq4GNiCCHPrRMvmVZEXJzVhMk/QdWTlGtYcecEmmH1AzlyJ7fGWhvMJcjpj3F
         Qt2mm/M17uVwlVCKNVxwEMEYDEEkbn/6NN8cYeB+t4eLQYkK5EgEgGMr/MZ2F50+eh5k
         gVmTZCrJB+in4/sRgfiPeWbsjaleQy3ONg/cMofdozdQq9Ese6TExdv+du7+S+riMqiX
         GoN0IFwz9FRF2vyl2jlsaC14zo0R7o+DvqG8Y6n1a9ujpeQCllPLJsKRzmRAnfWfJd0m
         P2xjfo/dGqXSeQ1skG1teiE/iyz/t+CSDDCseZHVBGaRxuKo/UG0Ikks0kijp1x252Xa
         lRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675398; x=1734280198;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0BNq9HukNRZr8ujW8Nrg9M6GQfhB02SRFVzv7C/bZVs=;
        b=bkLrxljES4WsR7jg47BxKyUliVBl9ImD3i/4PPdi8doHL7HKwyvhg6qOJQuHkhCevU
         ZfJeH4l9Kvbz1Efachs53jAyCNfudSGrh63ssl8RS6UY/LCT9cPCkBO0NAjrB1dbQZLq
         bbkTQeNm1p+HSz/UZ4cUMNP/2yST9SSTV3MGApB1247r7i1EQV2UJenHkOpyi6nJ8pCg
         3uNPp+lzL8uR4/+ReHes7p9nnRlqecbNfK8NSo0d3VXPusqrKOEZLhWvmdtNVO+1+qd8
         5fh9Pu0VNysQ3gGUGsCAn3wo/XpFRiz8sB2+0WJUYgZpzO13QBlU47H7tODtUS9YhgHU
         3L+g==
X-Forwarded-Encrypted: i=1; AJvYcCVKmO3u8X2wVF9xQ/2sIKmKU5Om0gDwiQ9SM9N9B8fpAdycJBtL+J5rD4yrFWIpq7sQcxtUPtwIzkQIVffCV9Xy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+YmQLkLMZERRGCjr+mqGdIBOVDmpSwOfogotXme3hIacy/Nq1
	r4Knabs3ZSoZ9orH5KKSIvTb6hAZwtO3ye8Plhii2wsSziGHL7YpivCcNNHKeWk=
X-Gm-Gg: ASbGncsVRDwe9o25yOXXwvucXkqNWu0jETN0fQz2TcwFLXvL2ugngh6+fMnkMpaDQIn
	l4ddzg7dEV/IHUck0Pb76PY4akgCUM2U5qKf8Xm2lGBmargMgAAaKV4j0gumSSUyp5oWsiiKGSS
	78PqM6VMAn366ZOz+Iz/2wb9jxZ+eOM6PnhS1RsVU2KW/2Zo4H9rxyIph+E/U6D1ZZ2iNqtE6FG
	pkn7iJUPIAIcg8bFu/e/hGd00MiIcTvL11sRKPyViXJEN/vbKOjCYuYDfg=
X-Google-Smtp-Source: AGHT+IGgMEMrSAPr02MLIHAcIHPoTg9MNMPJ2rKs998sfhdc8FiMJuyQZbDGm5o1c5USrCVKcB7FqQ==
X-Received: by 2002:a17:906:2189:b0:aa6:74a9:ce6e with SMTP id a640c23a62f3a-aa674a9d065mr269789166b.16.1733675398372;
        Sun, 08 Dec 2024 08:29:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68a97498dsm5949966b.99.2024.12.08.08.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:29:57 -0800 (PST)
Message-ID: <9fbbf3d1-9543-42f8-a80c-1527811109ef@tuxon.dev>
Date: Sun, 8 Dec 2024 18:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] ARM: dts: microchip: add sama7d65 SoC DT
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <f62e2600a8e88e4be9d87b346c41bb4781f8f667.1733505542.git.Ryan.Wanner@microchip.com>
 <9a6c1dfe-cf4d-41fc-a0f4-b6a111a40c94@tuxon.dev>
In-Reply-To: <9a6c1dfe-cf4d-41fc-a0f4-b6a111a40c94@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_083000_100325_012F2B74 
X-CRM114-Status: GOOD (  13.10  )
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



On 08.12.2024 18:28, Claudiu Beznea wrote:
> 
> 
> On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>
>> Add Device Tree for sama7d65 SoC.
>>
>> Co-developed-by: Dharma Balasubiramani <dharma.b@microchip.com>
>> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
>> Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
>> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
>> Co-developed-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 145 ++++++++++++++++++++++
>>  1 file changed, 145 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/microchip/sama7d65.dtsi
>>
>> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>> new file mode 100644
>> index 000000000000..0dcd80690210
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>> @@ -0,0 +1,145 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + *  sama7d65.dtsi - Device Tree Include file for SAMA7D65 SoC
>> + *
>> + *  Copyright (C) 2024 Microchip Technology, Inc. and its subsidiaries
>> + *
>> + *  Author: Ryan Wanner <Ryan.Wanner@microchip.com>
>> + *
>> + */
>> +
>> +#include <dt-bindings/clock/at91.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/mfd/at91-usart.h>
>> +
>> +/ {
>> +	model = "Microchip SAMA7D65 family SoC";
>> +	compatible = "microchip,sama7d65";
>> +	#address-cells = <1>;
>> +	#size-cells = <1>;
>> +	interrupt-parent = <&gic>;
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			compatible = "arm,cortex-a7";
>> +			reg = <0x0>;
>> +			device_type = "cpu";
>> +			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
>> +			clock-names = "cpu";
>> +		};
>> +	};
>> +
>> +	clocks {
>> +		main_xtal: clock-mainxtal {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		 slow_xtal: clock-slowxtal {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +	};
>> +
>> +	soc {
>> +		compatible = "simple-bus";
>> +		ranges;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +
>> +		pioa: pinctrl@e0014000 {
>> +			compatible = "microchip,sama7d65-pinctrl";
>> +			reg = <0xe0014000 0x800>;
>> +			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +		};
>> +
>> +		pmc: clock-controller@e0018000 {
>> +			compatible = "microchip,sama7d65-pmc", "syscon";
>> +			reg = <0xe0018000 0x200>;
>> +			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +			#clock-cells = <2>;
>> +			clocks = <&clk32k 1>, <&clk32k 0>, <&main_xtal>;
>> +			clock-names = "td_slck", "md_slck", "main_xtal";
>> +		};
>> +
>> +		clk32k: clock-controller@e001d500 {
>> +			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
>> +			reg = <0xe001d500 0x4>;
>> +			clocks = <&slow_xtal>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		sdmmc1: mmc@e1208000 {
>> +			compatible = "microchip,sama7d65-sdhci", "microchip,sam9x60-sdhci";
>> +			reg = <0xe1208000 0x400>;
>> +			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 76>, <&pmc PMC_TYPE_GCK 76>;
>> +			clock-names = "hclock", "multclk";
>> +			assigned-clocks = <&pmc PMC_TYPE_GCK 76>;
>> +			assigned-clock-rates = <200000000>;
>> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_MCK1>;
>> +			status = "disabled";
>> +		};
>> +
>> +		pit64b0: timer@e1800000 {
>> +			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
>> +			reg = <0xe1800000 0x100>;
>> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 66>, <&pmc PMC_TYPE_GCK 66>;
>> +			clock-names = "pclk", "gclk";
>> +		};
>> +
>> +		pit64b1: timer@e1804000 {
>> +			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
>> +			reg = <0xe1804000 0x100>;
>> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 67>, <&pmc PMC_TYPE_GCK 67>;
>> +			clock-names = "pclk", "gclk";
>> +		};
>> +
>> +		flx6: flexcom@e2020000 {
>> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
>> +			reg = <0xe2020000 0x200>;
>> +			ranges = <0x0 0xe2020000 0x800>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 40>;
>> +			status = "disabled";
>> +
>> +			uart6: serial@200 {
>> +				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
>> +				reg = <0x200 0x200>;
>> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
> 
> Vendor specific props would be at the end, before states, according to [1].
> I'll adjust it while applying.
> 
> [1]

This is the link, sorry:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/dts-coding-style.rst#n122

Other than that:
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

