Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED2FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmTLqzScZk4mohfJDKEOFiS/c5yRNNGYoc5k/qifRE8=; b=VXq1p5c/fnO9lheHNbOffR4czH
	9Dzc0ZEj9paUPtiwr5ziZYS+6b5YkbdaUxgkedldtPjZtEUTEHVfRxtGH1jnAFv/wD7dMUoxUW1xf
	MmemSDJBX2ARbFkMJKeXdzufGC68koY0ahqo2S3skGlNTHUhOED14YJP/lyVkG30W0lS+2J7JC8JV
	x0f3bI3F9CPV9RXhQWfXy/Etjk7QDTQMK/8HExzoGEKEqMMncGFyPojgZNxPz6g8oDdVueBb+67YK
	Xext/mSRv3RbM1031MXTAS9SKyxP9vfkCBf5tng1AufDJwLsuwQ70vqenC/giVao5/GNHtwGR4YdK
	9/WgRkcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLji1-00000000Y6w-2wiD;
	Thu, 12 Dec 2024 13:58:29 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjgm-00000000XwD-1QWh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 13:57:13 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2166360285dso5926675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 05:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734011831; x=1734616631; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NmTLqzScZk4mohfJDKEOFiS/c5yRNNGYoc5k/qifRE8=;
        b=ksYPoGoWjyQNsBD63aRntAjWDLyFXQKo+mYHZBrrBTl2zfrMY9e/OsPV0scP6xp4XP
         /kwaeXOGAiklNfn29ZMJtprgEzEqVEhqUJcXwMGjlJCiGOJqJyictr9Xv3HdlLmC6VVt
         o9utz0m3DvPNG4Se0ZCPR0vDqWj+ba5wxH51C1ERsObkXB6N80edQLp7NOOoQG/PK9nO
         fV8s2v/4hofrq3QX0tHAnQRkeVW7fV3YC5Y7xPm14ILA4p0C0BWshf0Mjf/fytDmWvyN
         G9eU7ht/hhBgJfPP13CFv0fjHmdTMVM7THRXmARmD9UXs4/W1WkhMPHHXSRsAaitKgqx
         /Cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734011831; x=1734616631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmTLqzScZk4mohfJDKEOFiS/c5yRNNGYoc5k/qifRE8=;
        b=kvyWcjQKnHiyUqmS1u25+GzAWoR/TBNKRkzEdqFH/9Uy+bkWmCEDv/LyTELaUXJ1ma
         y7LcfcOjm+mUeM4Wl63pZdFPQ8EkrCA7onOrFMAKXR3eI85LZn3YRkPplOwIN8n6tDOd
         7nSSWgqUC7nGS11A3q7FxsM9VOZwj/yVJMILxwtNFEUDH7KglAJjg5TkO0WrtdVhIrX2
         H2pPyPjHFUdCOc135YOP6HM7pUFuSmiSlgGX53eLguJlxLscgck0QHM0UrhLAFfhWfXP
         vv7XneAvKg7l/IOjxRGtgC6LVqM1m5DWD4zDDqU+pkncYM6SRzJD/5iY6JFPzDVWXm+r
         F4TA==
X-Forwarded-Encrypted: i=1; AJvYcCVzbsuVuR60mIOA6jUvET/CoAZrbrBJwNPusXPXNHL+m6zMrie3YdjDlvKfiFBvrY7e1Gz+tcmhlb+03XW0qV4F@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Nm8QZuGM9ShKmljMMFAwN6It0qzWJ7J51WxLWB1wqIhL9BFT
	unvYTBOG34K7ip9IY+ztkE5sR7jLg9k2p3TvKz9KA+9lahFVrQSL
X-Gm-Gg: ASbGncsCwGMltYlmpmp4LEKdTyQG71nCTsvJ61FGVnsP0VRPJXUg4uFbzJlGfSjYwVc
	gG1eM/RIguJUoZb5nPGaNwN2bocSAkUFRkfGr/SyMg4X+lI8u9v0r+w0I/IhJSuKQoDiMmj0aDz
	hpmH30jBXAhWY+b+3Px/PFvQT40dn6Ykdp+nLmFv3himA/C9YNHchcM5wv08ttq17pOSotEmu7z
	l93wotPkdQ5iKjF9rj1AT8nllvoikHHHA3PQetb/fyzd72GZfYSw0VLVQNIuqT0avjq2X76TcW1
	tAaD5a5tx8EOKeGZcNqlafWyAcqFHQ==
X-Google-Smtp-Source: AGHT+IEo4mBbMhtkdB3hzbmQugEtnQdEpzVLfEDXMQUSzX33prBh8SEVLIh/6dA+93tI1uPs3+SUpA==
X-Received: by 2002:a17:90b:3b49:b0:2ee:5bc9:75b5 with SMTP id 98e67ed59e1d1-2f13925b22dmr5825418a91.4.1734011831408;
        Thu, 12 Dec 2024 05:57:11 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142de33basm1274609a91.23.2024.12.12.05.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 05:57:10 -0800 (PST)
Message-ID: <194f1c3a-2333-4a33-b459-d50f02e1b98c@roeck-us.net>
Date: Thu, 12 Dec 2024 05:57:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: stm32_iwdg: fix error message during driver
 probe
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, linux-watchdog@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
 <20241212102050.374501-1-clement.legoffic@foss.st.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241212102050.374501-1-clement.legoffic@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_055712_379074_AFBE06D1 
X-CRM114-Status: GOOD (  20.37  )
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

On 12/12/24 02:20, Clément Le Goffic wrote:
> The commit 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> introduces the support for the pre-timeout interrupt.
> 
> The support for this interrupt is optional but the driver uses the
> platform_get_irq() wich produces an error message during the driver
> probe if we don't have any `interrupts` property in the DT.
> 
> Use the platform_get_irq_optional() API to get rid of the error message
> as this property is optional.
> 
> Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1 -> v2: Change the commit message because it only prints an error
> message and dont break the DT backward compatibility.
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
> 


