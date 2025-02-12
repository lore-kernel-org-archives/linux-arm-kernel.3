Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4FEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 08:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ca3jOifU6KLMuLCZFV+VlIgaFdG1oVjtxMx89qkKmE=; b=YRTPPb6t+Kg2rLilOS7PuL0Smy
	aF8rhJm2aCtPiqOE+2MbYokpFX8jlxqG9FAz6D3G2KDTuJ2i3rZuvF+4NIjNd6PUpQXgdQ0GkTVvr
	CcjfUChqpvSuHoUZHk6WKhmly19yNy00sps/1/6PXKp1f0RvC93aYrFk7btp0+F3nL0HpACteQwBI
	Crs7yfallC4S+JraC0NR3OJ0/MvKLL3WhgUkdUam/UASPcUpFDdxWPFnUTsriVCPhoHq4J9rTiWZ6
	DtrPgMi3Nzqqi8waocXRzeM3Wm196bxvzzapyTKUAhtHoNuPbxDGPeahZ7vq7aSXNF7gtJURQl/Q9
	t2pHQYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti80K-00000006bOi-0JAn;
	Wed, 12 Feb 2025 08:21:56 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7xS-00000006apF-3itW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:18:59 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab7f860a9c6so43058566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 00:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739348337; x=1739953137; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ca3jOifU6KLMuLCZFV+VlIgaFdG1oVjtxMx89qkKmE=;
        b=S0Gu3V98Q9reP2XvQFd3lMdiuSIQ+WqKEEft5GL5hAXXD3u80TxMmdY/Bppwoq9nwB
         xDvonE9SSSweLE43S7au5qNvK1oTFhmtaVaZXbFrRmJp6wXm+pdGxSu5eZbzOM8rHDPC
         huDFNRc4D1UqGdHaER3y0t12aED55DBTCSNs4dnbI2gYq/pbvnn0Z8MEpRtBRuQBKgFd
         uvahfqYWQPSSEYUTpgqahAEEIucrVxRHDpA3/hzUp8RoTSGagVEjx2NkGDhL66O3UjWx
         x8R4cHJWtvNuRvSe+ry5ox0nBqVqSjXE8zTahTzsNOr0o8k2qIf5CmFRwxJvAFpn2EnP
         Xlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739348337; x=1739953137;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ca3jOifU6KLMuLCZFV+VlIgaFdG1oVjtxMx89qkKmE=;
        b=SNYQEcyjfAcD0usprlY6u4CPpieMrdTgP0TvV+CgFftB8bEYdZzLNZPaGQbs/2UXGc
         OUNh76wwO3xu0BVyzlWglr7NOBfVghYcMRk9x1SzlQJO7Bcsu7zGK2ul1Hf6dUDbKegu
         07NV2iiPey02U9/71kj6GyZePRFJ3GIrqW5skc7hfE9UkKVeG5kllpjKrrXwoIXbamCX
         B9fjWEx7ktQAAFJtdJ1X4ZbbRv8bb1dVlWmc0g2zIMuG8JPN6OAvHzBx7zzlZu7/SrUF
         wbHauUI0gIHhvdzDBp+3OgssXh6tU4PDsOfVcDWz1ZROPy0LxU/cVl0Uk6NeS/HqTVPe
         +C/A==
X-Forwarded-Encrypted: i=1; AJvYcCUnBcrJl1KYe0UI/xsRIc6TDaXt+EpA5mWtofPPaNUSw8kwdS4+aN+L1YOm3l8YqdnAqaT6Voy+K9KBIl3mIZhQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzrecImQAaCe5I2cqqPlvU1iA1kw7WpS9Pk9wZQSEKtA7Q2ZmX3
	DGiirD72YeRdeN1G+1XJjLyUmN94rW9rThgMBLb/zmIXSTb3f6qfyfxFDFRzS5k=
X-Gm-Gg: ASbGncs7jitKUE9SUqCR87Kf0fgsnGlTgunhThhgpXzXHOvbG7n4UzqCBnLxA61F2Tc
	cZDoH4QrF2TCqMI5TG8yn8BVW3a2uzGQAqesgIK23jLNeXzGjmHGwdKO+UsKn0rYp4S7P5m23hV
	k6BnsBmM5BIkVUWzKrOe6MrO2/10g2S+Prcw+EGsAvPh0gOhpWcHOwGlRo1YA6yhDs2Va0Rd4SI
	VrJUhHFRwQwG6OE+nixnrDXO7GEBbMxtmWfForhS7a75OfvC5dLyXBIzrtceytd5IG4wwLLbAjB
	DbgxCheeDNNC6apOu8k8WkkC
X-Google-Smtp-Source: AGHT+IHBLSlZ+tK9sv24mLWsqTARUiAJ4W3lRBwdQFx31Cj8hrychh4XqU6wPO/Gzkojw3c5V7eTFA==
X-Received: by 2002:a17:906:6a0b:b0:ab6:b9a6:a9e6 with SMTP id a640c23a62f3a-ab7f34a11a2mr161055766b.46.1739348337071;
        Wed, 12 Feb 2025 00:18:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de5e15c76bsm8231120a12.42.2025.02.12.00.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:18:56 -0800 (PST)
Message-ID: <b697f8d5-79ca-4d51-b5ac-9dd51713c0ea@tuxon.dev>
Date: Wed, 12 Feb 2025 10:18:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] dt-bindings: rtc: at91rm9200: add
 microchip,sama7d65-rtc
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <a0338f3d05ed43eeaf2121dd22a9f0dbf25f2fc0.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a0338f3d05ed43eeaf2121dd22a9f0dbf25f2fc0.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_001858_931666_0DE38202 
X-CRM114-Status: GOOD (  11.38  )
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



On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 RTC compatible to DT bindings documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> index c8bb2eef442dd..0c878331170b4 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> @@ -25,6 +25,9 @@ properties:
>        - items:
>            - const: microchip,sam9x7-rtc
>            - const: microchip,sam9x60-rtc
> +      - items:
> +          - const: microchip,sama7d65-rtc
> +          - const: microchip,sam9x60-rtc

Can't these be merged like below?

- items:
    - enum:
        - microchip,sam9x7-rtc
        - microchip,sama7d65-rtc
    - const: microchip,sam9x60-rtc


>  
>    reg:
>      maxItems: 1


