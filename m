Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B41C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5GGyL7EzSr6uUL04LjmQHJjuAFms5UHsKE4WRS6HTc=; b=yYHOAOPdFnu0+EI8c6raMecnJR
	It7ejIncrYLPQsA4DKGesxzHLXw5djefr00W4/Y3q/WGVxg+8KlyU/jg1EWx1MJn4V2ODHkrNDqhl
	AVGcjq1fIVxm/7bDcIr7pz5yGyoD0+or21fvUgNQxz9MMZdusBmsb5Py3QSd/NyKPlQ1ogyOvjdMe
	Ym5r8K4oqk95JQBLBgXeW6AOtEurUmI/y+zsZeyZdvghIJ3CmlyOERx/VWINqL6w/DIstULOHPHlz
	ARpZN6vyPso76tBae+khfGwR5ks5XWR3qPxwlbooMqPiJeBDnAZgJsP/xdIaptfy6D8KmfpBjPOBn
	8FEjb/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNs5r-00000001dQD-1wJv;
	Sat, 07 Jun 2025 11:52:11 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrxl-00000001cNe-0rqn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:43:50 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso5661777a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749296628; x=1749901428; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5GGyL7EzSr6uUL04LjmQHJjuAFms5UHsKE4WRS6HTc=;
        b=QKKXHETpeaRUOVg9mggIPDd6eAIMSvX2uvEKYGv9TLKe/avop2c4cZhNHciXFtwrfF
         g78tvZy0NH3w4SBI2pRGCSzH4RHYzb4PPkhuWrlDkhWhFOuwppD9G5fjH8XBGgTvrAAI
         uGWyyYt/NHaBGkTO+zEmK4eToCkqfvybDwLQlkEhKlwlH12RBMoPq2xw9PC2zBNPdP/9
         mGZjZOSAMKiAeUfpol0rHIjhKYgDS6bV34bX2UUKTKK3apGGCo7uDksnwxiDSm8HT2Je
         oag657eatC25q0C4MmQaIotnoBiij6fziagSB6LJL/eUa66zise09RscsvBMzLG3Ip1H
         mtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296628; x=1749901428;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5GGyL7EzSr6uUL04LjmQHJjuAFms5UHsKE4WRS6HTc=;
        b=OJnM0kUdqkno1REIU2lcFxLTe5XFkLiLUFR/H/+Rlt6+4yQSXRYSpxIVCgBFH7xd4n
         QAnmQigPX9cTg+4m5+FXQPCFMs+qLFQQ2Kujfg8A2X1bMaHyUDqzi9Ta71IeVG54xW3u
         Fnz//kVKL1MquBG2s/Nq2Xc89DJ/tCHUTcQSVe0ezWsq6uVo/32O24Ar5xLSk9zlIonu
         6M8LS85sfqsbHhajCUNRT/1KTGY8+mHWVgh6rWwXJqBO+0fX7//pra2BqhNwaEr2Mi5h
         CFq56BXI7DxAt0jAZbIXlGFqbdxCFCGOW1HjE6cLNCukjY0nAMUL8uFZ1rMSVxHtQHnI
         Cjjg==
X-Forwarded-Encrypted: i=1; AJvYcCVwtFBXMzrSthEX12uf0znNh3Q83cBn5gDCp4jmtm1ufAAXBU7Dw1pz4oVYsntgmbuIJzIAtvQsCUlGE2024wHQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy7rGIFRjXrupt356aJGPxvF2mhtUXzTytZhXr5+ugxh0IapTB
	tuks3ba//df8t9uQaR8IGr3HWDqAx6DtRU9IrXOGCZcnKjmymY5SsQpT45ERaxeTsYE=
X-Gm-Gg: ASbGnctmuEhTSMUT59rI1K2zO8LBSHtHIBIK0ZCF6QjVgxABavUQntbDjZN4NLCiTkA
	/bFzd2AoTxXPJZFpcYxDtuTtmnd4znFFxaH3aOqa4qF9xlt7ph1+lrN91TgrLqBtuGGyDmggxiY
	BexZr/FAq29M4muvrEP2DwPH9S8Uk4eo/hjOY0xBTV+kbG7Q12yu/nba56ebHO6VR3qi3BRXgdy
	uj37MM6JqD3w9kpBnIpipJtH0L/98QuHSDAwQjKU3xMpF09dGXz3HXSqIm3nyhb7Ks3lwYIhr+Q
	T5zAmfJ7xIwZAIV3/5dytBSXYOLKavVWrKhYwD7gP30diMfW26PbKCWLbPWRwl9w5+uswKU=
X-Google-Smtp-Source: AGHT+IG0eKeJpSoGWhm3EaDe2FVgK1ogPyIyd2nQfnfeftyiPLFYH1i76vcoPxnUODVZD6ioAN5T5w==
X-Received: by 2002:a17:906:7953:b0:ade:8df:5b4e with SMTP id a640c23a62f3a-ade1ab32de0mr529784366b.60.1749296627695;
        Sat, 07 Jun 2025 04:43:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade44af8215sm68237266b.15.2025.06.07.04.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:43:47 -0700 (PDT)
Message-ID: <201c7188-eaf7-4492-84a6-66d839062d8d@tuxon.dev>
Date: Sat, 7 Jun 2025 14:43:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] ARM: dts: microchip: sama7d65: Add CAN bus support
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <445c4c72243f1ba85e3681ba026cfefaf6036890.1747077616.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <445c4c72243f1ba85e3681ba026cfefaf6036890.1747077616.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_044349_251672_51D204F1 
X-CRM114-Status: GOOD (  12.89  )
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



On 12.05.2025 22:27, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add support for CAN bus to the SAMA7D65 SoC.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 80 +++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 796909fa2368..a62d2ef9fcab 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -163,6 +163,86 @@ chipid@e0020000 {
>  			reg = <0xe0020000 0x8>;
>  		};
>  
> +		can0: can@e0828000 {
> +			compatible = "bosch,m_can";
> +			reg = <0xe0828000 0x200>, <0x100000 0x7800>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 58>, <&pmc PMC_TYPE_GCK 58>;
> +			clock-names = "hclk", "cclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 58>;
> +			assigned-clock-rates = <40000000>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			bosch,mram-cfg = <0x3400 0 0 64 0 0 32 32>;
> +			status = "disabled";
> +		};
> +
> +		can1: can@e082c000 {
> +			compatible = "bosch,m_can";
> +			reg = <0xe082c000 0x200>, <0x100000 0xbc00>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 59>, <&pmc PMC_TYPE_GCK 59>;
> +			clock-names = "hclk", "cclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 59>;
> +			assigned-clock-rates = <40000000>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			bosch,mram-cfg = <0x7800 0 0 64 0 0 32 32>;
> +			status = "disabled";
> +		};
> +
> +		can2: can@e0830000 {
> +			compatible = "bosch,m_can";
> +			reg = <0xe0830000 0x200>, <0x100000 0x10000>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 60>, <&pmc PMC_TYPE_GCK 60>;
> +			clock-names = "hclk", "cclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 60>;
> +			assigned-clock-rates = <40000000>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			bosch,mram-cfg = <0xbc00 0 0 64 0 0 32 32>;
> +			status = "disabled";
> +		};
> +
> +		can3: can@e0834000 {
> +			compatible = "bosch,m_can";
> +			reg = <0xe0834000 0x200>, <0x110000 0x4400>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 61>, <&pmc PMC_TYPE_GCK 61>;
> +			clock-names = "hclk", "cclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 61>;
> +			assigned-clock-rates = <40000000>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			bosch,mram-cfg = <0x0 0 0 64 0 0 32 32>;
> +			status = "disabled";
> +		};
> +
> +		can4: can@e0838000 {
> +			compatible = "bosch,m_can";
> +			reg = <0xe0838000 0x200>, <0x110000 0x8800>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 62>, <&pmc PMC_TYPE_GCK 62>;
> +			clock-names = "hclk", "cclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 62>;
> +			assigned-clock-rates = <40000000>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			bosch,mram-cfg = <0x4400 0 0 64 0 0 32 32>;
> +			status = "disabled";
> +		};
> +
>  		dma2: dma-controller@e1200000 {
>  			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
>  			reg = <0xe1200000 0x1000>;


