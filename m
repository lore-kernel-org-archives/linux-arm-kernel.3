Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C255FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 17:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIXMJ1ZYrC0ZfzeXus7WJ4iSXyvaP59GTvAsdbdQD+Y=; b=XPH0raIRGyRPt6zzLfklaFtFyZ
	RiuN7+TvTgRy+RrLogKeaelwXbVzhcpB7laPG3w3MDO6SLcUTNsvY3cb13X1SPImsFmDlYTlraaJb
	dgTOQVrdR6cYT9fLcb82eNPxtRJ6YoDe/Aw+FFyY6a8uIzNtE3IqDKBnTFcxYliDd65pJROQR/IWw
	PKi70dHMk/px4zElOYnJh+lMbGTAQ9z/+eDo5nDCFyYBY+ionQEHHfczB+Ft7S5lSr1SdssYkF3uJ
	30ZeDXreGAGG88yXx6/ve+WBskNhLi+fN5TDRqPjJ+f3eH1dBAMaeRA1VkAWOxO7ln001Qw2klpl6
	8F5UUM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQGy-0000000FZCA-1ZYf;
	Wed, 11 Dec 2024 17:13:16 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQFu-0000000FZ2q-2XE5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 17:12:11 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2156e078563so52742225ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 09:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733937129; x=1734541929; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sIXMJ1ZYrC0ZfzeXus7WJ4iSXyvaP59GTvAsdbdQD+Y=;
        b=FIMlh+Lgz69IUXQhD6j7drA0FzH3KnSxQJrNIbRmzRy3avb60fqLWkcoxwAKuuSN1q
         qp+uqkPc9zRJZv5oL5cxPKvNl0kkujhUG/kn1ztmFRBQPcvAfi9EDE1fbe1YAEbaatYz
         jSjWegMT1jLG00MgQH8eDEij9KGZzuRpDGGHopNmbIWqWLjg/3GX7gysXrJu+FSy5/mE
         dW58G9hw33D1Hn0oU/onStA7gAFeWSWYLNP5JABOAGrc8eAYYXiYPiOYYrUL2IUFsA77
         Sv1P9c9XqvKWTeGO6y/sdBiYOBzgQYZpUrtYz9XfCfq4dbzVs3wj8O6KDvftU5OyOlA7
         6NSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733937129; x=1734541929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIXMJ1ZYrC0ZfzeXus7WJ4iSXyvaP59GTvAsdbdQD+Y=;
        b=pVVIVs7c6ECBBqL2K9Z0TqGTbOozaf9UAVJiUFBxkQ4JSRFlIJHI1P7MaB9+5wNeWX
         X0v9KvaD9fU1dxhTZyZP++kRCDizTrezpeFt3hse1Hbt20Rk8R/X2cUM8t0uxXkIvj7f
         FU/Lo+ISL0DFytivqGwQ7JJ7bK86045y8aXZDDjG+yOnoki0JQiYtZO167JrINWZ6pzo
         wnKXaX2bnxo8U4eZykwc44SA04ibnra82lc3dVhvAoOBtWu7Y8Dw/Eizb5YnyC2EnQs6
         DNRLHvtAY3lGYOoV6cF3sxGKPTI3Db08kgydTaSLCJfJ50VYf3PPBq/vlSYXXU7oGVy4
         gh1g==
X-Forwarded-Encrypted: i=1; AJvYcCVcW6VXj1XW9bcApe2PwgayU1/JFaQ5RKudFy8Om73Hp7ba+SycIYHvX+rqkWAsVqY9t5e8aCctavLNl2fZLQHc@lists.infradead.org
X-Gm-Message-State: AOJu0YxDiHll0BfLR0+LdysbGzpQ20fQRxmCViG4Jl6rD7l/DCwJcadQ
	Z2pOBU23PnCrROD5XkSSyvcSHqoyhZ6MTJf3VAK3A8+NVS2R9xvY
X-Gm-Gg: ASbGnctzHyomsIysw+ZWbqDw0kZAEw+93te0sdJLPH6yz51GDb1+k5RPlwcan9+vU2P
	Zdl2JfASSgcfta2+8cBooLgJQhnZ2r42zCzbHcL2YxgvbiOWTSsuxEJNA1Mo9EH9wP8Q/ylf141
	j9/slC+OpD4LPSl/ht+OgyOBT4NdUgFMPvM42JMU5DqD7ZoRtsbPIxqz2LCbdOuDH8nYI5hM/a6
	pmXciQZKUc3taxSy24SzK4QSmUIUozXSgskPQ4T04wgqTJmP2f15s02CpklNlKlMK8WSkjmcqeG
	a0GcvLyXl9QGhTfa2T/5Sjm+z/Q=
X-Google-Smtp-Source: AGHT+IHYT7AOgxnWx/J7njq421pvdT5RVtm7+2GQ8l+rCNO36MOZPhHyAqro6NWj/eR2bXFBKcZViQ==
X-Received: by 2002:a17:902:f78b:b0:216:7cef:99b3 with SMTP id d9443c01a7336-2178af03c54mr7681475ad.52.1733937128927;
        Wed, 11 Dec 2024 09:12:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21779e0f7besm15574125ad.115.2024.12.11.09.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 09:12:08 -0800 (PST)
Message-ID: <213073e5-c929-4207-a9a5-13194012cf70@roeck-us.net>
Date: Wed, 11 Dec 2024 09:12:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: stm32_iwdg: fix DT backward compatibility
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, linux-watchdog@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241211163457.301140-1-clement.legoffic@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_091210_643146_889624CD 
X-CRM114-Status: GOOD (  18.36  )
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

On 12/11/24 08:34, Clément Le Goffic wrote:
> The commit 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> introduces the support for the pre-timeout interrupt.
> 
> The support for this interrupt is optional but the driver mandates the
> interrupts property in the device-tree, breaking the compatibility with
> existing device-trees.
> 
> Use the platform_get_irq_optional() API to comply with existing
> device-trees.
> 
> Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Please consider merging this patch in the v6.13 cycle to avoid breaking
> the compatibility of the existing device-tree.
> 
> drivers/watchdog/stm32_iwdg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index d700e0d49bb95..8ad06b54c5adc 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -286,7 +286,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
>   	if (!wdt->data->has_early_wakeup)
>   		return 0;
> 
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>   	if (irq <= 0)
>   		return 0;
> 
> 
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> --
> 2.34.1
> 


