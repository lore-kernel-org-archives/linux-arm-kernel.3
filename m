Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92971C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 04:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXPfazU7cIbMUIyerGOFfz8XN/djYB2vzUoaHbctEVo=; b=1zvqg91AE92sEdOW1zFHJKUr7Q
	wkjT3th+xS5TdfzVzsVb77H31TAKpGp8flexFhOEqttA20SImmVvsrV80wC2M6pCkuMCaBK/ha03l
	mGWEfYO8lPCHBvx5W9V1/TOFAQUvMliZIVmGTzUyhTbeclTBoUqI9W4IYjJDskEyy0cRzu841sJpC
	j/MBVVCYcUPiqKSz0PZZjckYKbB7DdpzUoiYKD8DXhZQ/9090WfNYwWvfRL6MQ21VyionHGLdDgXD
	KOESduCLsZ2fW3wr0rLibW1LIJSE6HkjaXaxXcvm5geybarohygODnMpHmR/6ob6tzVPohKZjVBL0
	KLNwg/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9cV-0000000Blfc-3e9x;
	Tue, 05 Aug 2025 04:49:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9a0-0000000BlVz-09mI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 04:47:17 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2401b855980so38392285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 21:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754369235; x=1754974035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iXPfazU7cIbMUIyerGOFfz8XN/djYB2vzUoaHbctEVo=;
        b=Qz2Nc8kGRSpKOOLTPofZp70E7zzrDttKluznolEn495Mnjx4YurCPsoXYSpSG4R+IH
         VLHfjoemKz7KZNuO56x5rtTUyouoa5l7fVOPCFYkaWN9g2VxpHrv9cZGIx7uAvfqb3tS
         RMqNTHoYxg8+raq9Z5n5j9hNXviPmqT3bqHg51wtqfCVG38v9dRsiW6fDWuuaH4fOKIc
         8fmQdRcqibc8OROm/xb5SP3+LiSekhsuC2YXm8i8K24+Inr+eTf5wbMKpzjBy+envw0C
         bpnNTzI3Ue8BUN8giJQLxBy+BHD0AagFDAPuF3wzXAue1lIxu2YccNlT79L1sk7nxu1d
         4HpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754369235; x=1754974035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXPfazU7cIbMUIyerGOFfz8XN/djYB2vzUoaHbctEVo=;
        b=tvPhtYrvPmO13bhHGZ0zhyE5bAa34+JPA8gvWvDG3es3fBQc9ZF5MXpCtxrJTuV7L/
         fp3lQE6MNHUjx8U+xIAqwNzdCsg+udeAHV3H39jEU56LLTk0wa/1yOCtaJ4kOC37+Xxt
         KSUeRO6mkTBFGfFXcFeJmePvzLDUuBd4NM3wriGcDuDJ6rKL0ggCSTMXqJPpbJNeeRzO
         uT8zq6Me0qpJVs8Va3UjMQxHFzNUkhgC8V4oqmtoUV1LjLtfLxmxK1PZzv2cFf320y2R
         uP2Nb5hswRn0wGoXZsiNGVEMpXVveG0JVXR/bFtK/TqJTJmofxe4QCfskrSGpceKrBbs
         iyQA==
X-Forwarded-Encrypted: i=1; AJvYcCUWLXqtu0ZXhS8bGqOEYg/oYRitCpYH29ngo8+A02thH6PcasUFWiclVfBHTIWS4OiBGQnPsTi/gYHc62+SAZp9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh7BNZ2zUz82iW3bmZWEpJODja8L/X4zG461tNBZcTtUOjq91p
	nI+qLsa49ZQJb+lYMrhx7Kc9d7/CC7Nyi0OqYz+B32ThfO3Cghm5mbEZ
X-Gm-Gg: ASbGncvIn3itogYe0ZVlMGl31ZdGeML0j3rFE9RGkbeNdQCsNkzayLV1xbovEwaQEE5
	mUB2aKSTcd1riGaERY11Y+MSvqkcWVhQ14kI3MfTIyg8r27Zle5u2DK3j5f7Xp4TLlih8GDd/v6
	ayMBc+AqWhFpKUB/KfaaDGN3j78hkKlyvh3NRLvMplVigl4RjCos3xokyVSlnwaOKvs+ziTTtaQ
	a+qtfNU5gzAiE6BP4shtP86vsyEceNJjLianATNaQXEyf6G01ZdmqlGty5pWaYxTEuKAdcQxs4l
	yVD3UIWSRg87O74nZNouwF2ynEA3U4+cjk534cRMGAXuaNZRtQDInfl0UwedpeZ0CjqpYGLjQba
	ZWoRxglGPhczFNap8cG1M1zbLKbAzrIdMO0awsXbeLUB3IwBJ6RWsm440YrtFyGYb5qNNh+IzgD
	85R1OIQQ==
X-Google-Smtp-Source: AGHT+IFRmiQ7ZlIJtTOEEwOYYDOIvHRJnWLaM4H23tvUN6aEoH8QKnC0VXtgR0x8R9QnCygL2zeloQ==
X-Received: by 2002:a17:903:187:b0:236:9726:7264 with SMTP id d9443c01a7336-24246f3ecf0mr201885345ad.5.1754369234567;
        Mon, 04 Aug 2025 21:47:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aaadadsm123348155ad.156.2025.08.04.21.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 21:47:13 -0700 (PDT)
Message-ID: <18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
Date: Mon, 4 Aug 2025 21:47:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: sw617.shin@samsung.com, 'Sam Protsenko' <semen.protsenko@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
 khwan.seo@samsung.com, dongil01.park@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com>
 <20250724080854.3866566-3-sw617.shin@samsung.com>
 <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
 <000a01dc05c0$9f0ab110$dd201330$@samsung.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <000a01dc05c0$9f0ab110$dd201330$@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_214716_210179_07D1BA0E 
X-CRM114-Status: GOOD (  18.44  )
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

On 8/4/25 21:22, sw617.shin@samsung.com wrote:
> On Saturday, August 2, 2025 at 1:12 PM Sam Protsenko <semen.protsenko@linaro.org> wrote:
> 
>> How about something like this instead?
>>
>> 8<--------------------------------------------------------------------->8
>> static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq) {
>>      const u64 div_max = (S3C2410_WTCON_PRESCALE_MAX + 1) *
>>                  S3C2410_WTCON_MAXDIV; /* 32768 */
>>      const u64 n_max = S3C2410_WTCNT_MAXCNT * div_max;
>>      u64 t_max = n_max / freq;
>>
>>      if (t_max > UINT_MAX)
>>          t_max = UINT_MAX;
>>
>>      return (unsigned int)t_max;
>> }
>> 8<--------------------------------------------------------------------->8
>>
>> This implementation's result:
>>    - is never greater than real timeout, as it loses the decimal part after
>> integer division in t_max
>>    - much closer to the real timeout value, as it benefits from very big
>> n_max in the numerator (this is the main trick here)
>>    - prepared for using 32-bit max counter value in your next patch, as it
>> uses u64 type for calculations
>>
>> For example, at the clock frequency of 33 kHz:
>>    - real timeout is: 65074.269 sec
>>    - old function returns: 65535 sec
>>    - your function returns: 32767 sec
>>    - the suggested function returns: 65074 sec
> 
> Thank you for your feedback.
> I'll make the code changes as follows in the next patch set:
> 
> static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
>   {
>          const unsigned long freq = s3c2410wdt_get_freq(wdt);
> +       const u64 div_max = (S3C2410_WTCON_PRESCALE_MAX + 1) *
> +                       S3C2410_WTCON_MAXDIV;
> +       const u64 n_max = S3C2410_WTCNT_MAXCNT * div_max;

Not sure if splitting this expression adds any value. Why not just the following ?

const u64 n_max = (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
                    S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;

Or just use a define ?

> +       u64 t_max = n_max / freq;
> 

Make sure this compiles on 32-bit builds.

> -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
> -                                      / S3C2410_WTCON_MAXDIV);
> +       if (t_max > UINT_MAX)
> +               t_max = UINT_MAX;
> +
> +       return (unsigned int)t_max;

I am quite sure that this typecast is unnecessary.

Guenter


