Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932F8C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZbWYCAiGLdzl+1azDhHiS3T7Iql29Bgd9JnV0VCloE=; b=VVloMF5kpTc+g1Qofg4YWKLPEu
	7D1xxjJy1KPFweJJkl+f0cTx7OUeal2pDcgdRhoVBPyx/g3seD+uNYMyliJ5LDFqFGisfe2+VP8En
	PjHcCmq6kQNkV8WK/7UbZbKMriSRIXDzUaUVZLGmDVdM/q6RI+wXEataPpKheAVFfJ8m2ELfw37Jw
	ajmF/H9BCDvdQZW5vsV4eRLPFSMnmW1a1iBxK6EP+7HVRdVFfFVeJECo6mvwnfjop4tq3WLQCrGhH
	VR0QyFomwwvdxKiYRv4zfZnA/Nfw2MXSaS8Ca4mGkce60r1NuHqS9JukJzhm/8GCXL3vTh48WU4yF
	UcRJVf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1DP-0000000HXEM-1pPe;
	Mon, 03 Mar 2025 08:31:55 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1AS-0000000HWjB-1dpf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:28:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e4f5cc3172so4220762a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740990530; x=1741595330; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZbWYCAiGLdzl+1azDhHiS3T7Iql29Bgd9JnV0VCloE=;
        b=OkqwHodGPRcATBjfo8ree/VXcHsxOs1TC4+mt2ca4JV52/Yh8NOgpBx2RgLAl1SLfA
         aCQ76Yzo6H2cX47N0jkOEXWZQ8CGLZ6m9uOxJ2ud1ORoDYOKExTypvIuXct0HC1sSBN5
         CWU5VHFkMlvuOrF+A2l/t3usYGLghxZiH2KWmBGpcNv7f/Agkmd9oyj9CNoDQjURaHRC
         Ao99+mxhTm63P15Qqq+r57/7wCDr8T/r/K90cVSM3KPYHoXORKVsrKoxK3fgwavb+a9I
         ieX1bsCqxQlBc7KEUSvtDtQ7jpbiTynvoZ6ZSxi1bH+7NfcRwBbY9/q3Nm0YYBufEX0w
         i4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990530; x=1741595330;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZbWYCAiGLdzl+1azDhHiS3T7Iql29Bgd9JnV0VCloE=;
        b=kupSNvxK2F9cOhgbqLm4ZHgfqUFxuWqeupv8XmafeBtT47qDchcvlhgIfR20PRlHAa
         +Uc0HzIM9Ke3a9E6gTg+qU2DF0PvpLlODly6Ywn/mifQhMjvMUCpnEQ7+z7VCEt4xJ6E
         jfN362JmGM4maJijGtR6S79EiPTkE4e93ksOwPBW81/HI+Mo8X5g3rOGYOQpHz12YSSd
         tXyUCQe8LTM5ZMiqaN5LUAoGEEh5QMSueHGkMoqrKYTEkcuQrTrszkgC8n8+tN7pWpYS
         cbk//H3nHw02WjtjM4HTYeILLFzlG5llV0+wBmysz31+FNXKZr4nT4Gq6AeGnmgC/+fp
         sSaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvqmTMhRUKVVzs835DXrzrYLuUlIQ8cerWCIZvmcL1Qm1vXASN8F5VPOBm063lm37frUKo5h/0kbkoXx5Jh7PI@lists.infradead.org
X-Gm-Message-State: AOJu0YwxHlqfnMY7giCZg+AJrXT2Xi6bPDy70hdIAiFFma7rVaty5ZmX
	WFOh4Pvslw99ekB5gokWXLGErWj1FUgGO2m+l232e1Ztcr125JMwAWTgJLm3SN0=
X-Gm-Gg: ASbGncvKAjr4YZvx7Y5b8gmmBhDGgEPCrrCizerzHb2CiiyOVY2B/z+PFpssj+r4Qza
	h8muEF+Y3lHTMEOqLfmtBasY/gcl1es3+BOiOCMHjicn1PMSZv3tIfIAgCjETpGFtOBu7W9RSMu
	vZXEGBu9x8h9Hs5P8zLKpHomCYkbB5COtMb2LmdZTv5F6lbW52eC1ZqFbEx20yxGGTPUGIMN6YQ
	KgDnYb8lrc1SEPbALPd16ef8HB983lK9vO+r04EgWAIo08sx44/6xJRvKEJT5fs6KLYtCn/VaKI
	Z85ynWUzzibBvrUqpB9pQGMYCJo1OqH7RIU7gng+ZRWAp6e3Xvouyg==
X-Google-Smtp-Source: AGHT+IFrYJnOfLSyyyjojYRmFnfLxPLsWEHLU4GBBp6Ea3g+RJ8CQj9vhxA16WLLX0u0LSDAoCw01Q==
X-Received: by 2002:a17:907:7ea5:b0:ab8:c215:fd27 with SMTP id a640c23a62f3a-abf25fa8e4fmr1364497766b.14.1740990529665;
        Mon, 03 Mar 2025 00:28:49 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf17fa4a4asm733337966b.92.2025.03.03.00.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:28:49 -0800 (PST)
Message-ID: <430f1dae-0123-4d4a-81c9-b3c1d9df285d@tuxon.dev>
Date: Mon, 3 Mar 2025 10:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/21] ARM: dts: microchip: sama7d65: Add RTT and GPBR
 Support for sama7d65 SoC
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <6a1c058edee3fe1459dcb3a93a0a789a9ffff5f3.1740671156.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <6a1c058edee3fe1459dcb3a93a0a789a9ffff5f3.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_002852_433324_6C9F0121 
X-CRM114-Status: GOOD (  15.35  )
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

On 27.02.2025 17:52, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add RTT support for SAMA7D65 SoC. The GPBR is added so the SoC is able
> to store the RTT time data.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index b0a676623100..aadeea132289 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -120,6 +120,13 @@ shdwc: poweroff@e001d200 {
>  			status = "disabled";
>  		};
>  
> +		rtt: rtc@e001d300 {
> +			compatible = "microchip,sama7d65-rtt", "atmel,at91sam9260-rtt";
> +			reg = <0xe001d300 0x30>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk32k 0>;
> +		};
> +
>  		clk32k: clock-controller@e001d500 {
>  			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
>  			reg = <0xe001d500 0x4>;
> @@ -132,6 +139,11 @@ chipid@e0020000 {
>  			reg = <0xe0020000 0x8>;
>  		};
>  
> +		gpbr: gpbr@e001d700 {
> +			compatible = "microchip,sama7d65-gpbr", "syscon";

This is not documented. I'll postpone this until a documentation patch will
be posted.

> +			reg = <0xe001d700 0x48>;
> +		};
> +
>  		dma2: dma-controller@e1200000 {
>  			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
>  			reg = <0xe1200000 0x1000>;


