Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3019C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULE6uDTLXdtM6z8B9L/Qb6Jzh4xJsdCzsVAxM/7Q73Y=; b=VkW15zCukiQG25IWatyZXaQ+/b
	GrwmgcqTCdYvoJb5yOPmZ80NK8ipeOYfPb/Mue42MUbxcWd40Tly6jS+lkiamxHAkvKrSOac5hNic
	sC771xocDGL+tPu+l5q7iF9O0RW88dB1negZOUx80/q9GT9egNs1t67ccHbY2c+5cJJHVxmhGumQi
	gCV5adxkmprwodwfExwVel6TbHlexw5HbsrQfVLasaWk9dRQy6RZBXHI0xCj/vgKj9ZQjhk/i07/M
	+uOB7xyDgLWfyNuhYzbQHCqru4Ufk118iPRnYW6FeD/PGH9/n420wJFO898z7kzmePQhJV70tNFXH
	Q2J4xH1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruW9-00000005PbP-20xQ;
	Thu, 06 Aug 2026 09:36:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruW7-00000005PZ6-345U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:36:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cab973140bso27406675ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008959; x=1786613759; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULE6uDTLXdtM6z8B9L/Qb6Jzh4xJsdCzsVAxM/7Q73Y=;
        b=Wztc7JKB02opvBHnBnUsxKZKvUSWSplgHUZ0/ebj4lbWZObDGpsw2TwoMGJRUeUG/5
         6Q2HUVEsJDOkJEeXR9/7ass4gTclbLgRmaH2VoEAzE/xBqk8zg/MRStIpiGUT3QBJfra
         J+8ToNOgotjLXVRdU3aNN5BNy4GR0YA27C8g1oWgXmRoLvbDS+RgZLjiEW8rGPMosAek
         5PIilEGyOep4g7NQSO6qOU3ax8ZkRs/Mwp0AjGJjgGbupMxs6j9TTJiHjTO7i/KofPPg
         o1hxPl5wI/rU4gBVlJSXIGtgESTg+C5kjIMnnn4TKb0EEbO1yrLWxiaKN08ZD1JerIy5
         JYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008959; x=1786613759;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ULE6uDTLXdtM6z8B9L/Qb6Jzh4xJsdCzsVAxM/7Q73Y=;
        b=Iv+UNHAc71PUEunM0qH3w61i6uECeOS1znhNe/wp56k99pEH+Im3I9gt9cffdaLPyF
         OZe+QJE4qqOHlYOR9Q4FPRDKXIVDW3qkw9p2Jupa2Trn44DvYt//CBg5Rn7U78kVPiuk
         wNlErEd2WDf1JwrovnAt5jnUdcX1edrOrKauC72yIEHrNm3nHtOZ45NlgYvNrmDMH3dM
         AVupcIP0M5YdzPcnEecl6k+42EuLHmXs7BRTJwe0hln6Hw9C0yFkFXY2el7ve7c3o5jv
         GBIbtzqsU6PAWRxcToBwffwcccHlSqvgWmA2diOl0JmpcV29osOqSCOEroG8Oxb6ur83
         mGHg==
X-Forwarded-Encrypted: i=1; AHgh+RqGWAGFbspIBlUV9sV8R+hAGx8gzRoRtasoYwR6fpL0F0+6lPXskORvncN84TRzyzneT6umBv36lXv0X/JcygbA@lists.infradead.org
X-Gm-Message-State: AOJu0YxNpwAo54N1WNEKdr32hoJmQeyCp96GeUGi8kqo/URGy7KgQ6AL
	AqhVPa9NBG3Lwgg7CXL9OyyztlQIU2QDHgjEcvPVN1PEXXXN2yOXyp7c
X-Gm-Gg: AR+sD13EQG45yqTQOI2TTWwVrVeHrIqI+XhQmMQ4gpBk/xDpGhZndcR+UCdQR+MXhdo
	vT0RVLOISPC9k5c7vg2rHMx8QC6rk73Pu8Oqi0CV0bbmbe9yhpuFM4+mMVcoOh8JFJRzzzybnvJ
	zx/KGba6ahI3vRwYotoJ942KmZQp543awJYt06G2av9UpmdSCJGtdxhLq8gFDK3eKYWm5YDwnrY
	jQjs+Kj8NuT01KAYWkt36ypFfetZbUqdsJELQwdThCNbTFaJZpo6XSzt6O9qw8c5O+t9sDb82Tj
	RT3BUMxJE0ix0E6tzWe4SS/uGZa6E6fqjZ0g1MPfCfs3+x7hNsoH/7/SYD+cTqV87dyaNYd0a5p
	OGhHsSmLrp8aeP6gKhsfF7l5U0K9IgemPj9Oq5BDbGFsdZBcegNupujGT5gqPZT5gnZZOxShPTn
	ghKYpJcCQ7GVog1Qz+pyTl+p0Zf+86Rlh4yMknjyQwvfbq4Lw1XfM9eo0TmoRK9xTqwcPUIbgln
	eH2QzcVmOItPuQt6QRHIgZXCil6R3oO3L/muQ==
X-Received: by 2002:a17:903:2301:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d0ca7afc9fmr135970995ad.6.1786008958858;
        Thu, 06 Aug 2026 02:35:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa013dafsm28332885ad.35.2026.08.06.02.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:35:58 -0700 (PDT)
Message-ID: <697f8c44-1eef-47c2-8e59-9daa65e6989e@roeck-us.net>
Date: Thu, 6 Aug 2026 02:35:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: stm32_iwdg: Propagate -EPROBE_DEFER from
 IRQ lookup
To: phucduc.bui@gmail.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260806062812.26523-1-phucduc.bui@gmail.com>
 <20260806062812.26523-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260806062812.26523-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023559_784167_B06B47FE 
X-CRM114-Status: GOOD (  19.44  )
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

On 8/5/26 23:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() does not returns 0. It returns a positive
> IRQ number on success or a negative error code on failure.
> 
> Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
> re-probed when the interrupt resource becomes available instead of
> continuing probe without an IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   drivers/watchdog/stm32_iwdg.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index b356a272ff9a..102f51084957 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -287,7 +287,9 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
>   		return 0;
>   
>   	irq = platform_get_irq_optional(pdev, 0);
> -	if (irq <= 0)
> +	if (irq == -EPROBE_DEFER)
> +		return irq;
> +	if (irq < 0)
>   		return 0;

	if (irq < 0) {
		if (irq != -ENXIO)
			return irq;
		return 0;
	}

platform_get_irq_optional() does not return 0. and -ENXIO is returned
if there is no interrupt.

Guenter


