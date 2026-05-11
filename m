Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3BBCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aO7P1AELULNXLt9xs0Z+M6/B6olysO/VTpw1VPmDiTA=; b=Z8mN3j3gzids/5vZ6rTbyAljFx
	RQC28WEfPuF6mmTGfF5ZrHaXt9tyjiGOotNIj3jMmJe2EiOB9gMDtEitE6nrxtoLD39fhnZPhGkWy
	IXbtJc2JkHK7v23Jrx0xzj2s961PnY1eMPUlSPo6tKElmXMXSC8zxk/R4Q2Ng99BxC9ANYZZpRq0r
	osD48wNZQ/eQoMXmUCWFfS/EmS38xKErK4k3csDMXGjBEXenDjeDTWAP10/qG3xsZI1asjM1h9tCp
	cBeqEoKjbPZ7V6My2qvk4gisBUofvOUr8OM5A0cOxe81voiWs/arTiNlr+td4blgmEc9jMCh4wlkY
	I6FOTWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRWx-0000000Dtmp-0zER;
	Mon, 11 May 2026 14:22:47 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRWv-0000000Dtls-1slf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:22:46 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-12ddbe104ccso3867415c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778509364; x=1779114164; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aO7P1AELULNXLt9xs0Z+M6/B6olysO/VTpw1VPmDiTA=;
        b=ZdZGkeIDRbecCXuQJ8Yx7Yl9a2a6bCWI9Mhq0UAlm88w313Z51RsLtptVi4uIZLBoa
         FqAkrUrjl4GdfjgfcvGy8jLn0RxqvGzWkove3x1I1R+Ux/QY79elsaIR55D+BHPVhi7D
         2RRMyvVK+oHXO1pK+woadMK7EkHB3hzfwvdw4y+vF2O5pgJ6N4C0HqyPZKfAtT0q62aS
         JNxAfmLraIMOadlEEAtwTYzRyDR6kWEofjIyt7w4Xy7D5pp4EI/vRWnW3qX9AnrdA3tk
         JpV1CLZ2a/h8oxiRxFaMS1CqunoxBx701iv4AezCd2SXhxwmo5zTQlZ47hi2mhbPEabi
         QaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778509364; x=1779114164;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aO7P1AELULNXLt9xs0Z+M6/B6olysO/VTpw1VPmDiTA=;
        b=EIfYV/q+OkooPAFqBJwgIdt/r3Q7ToUaoGZlGOl9gPQ6jJfoDk10nuJa/rQ7ekwr8w
         8J0hsA1Uzx1r3ydkq522BXoAUHFmnXVT4mvkT83uOplizKb/SFg2L9kwgsPNKnKuis/B
         a7XrU2YRye+3D4mCKzdvQ40skF7U7N7rGePD6cMN/E3uMwnpXOvj/fhZ3An0Cg/I49xH
         +YM0LzSq/AbBPu97n0YNJ/nHTwQBZ0XDQzyGwKZdxj0LVIU/ddDYuOr3timXqAYo0yCN
         acPNWFb94nzO8fju8zYQMH3C9E0h8rdCmC1IiEAP9r2sHsoLuYaasn58Je7fs6pr7bRS
         BQ8w==
X-Forwarded-Encrypted: i=1; AFNElJ+BYjahoDtlOHRThNePMo3LjPeTBqO/kUfUoW2dnJWkE1IfYvkepXP8y3e1OqfpwLd4lhX+xua3J6+0MBLsPJsj@lists.infradead.org
X-Gm-Message-State: AOJu0YzAKXbJmv0Poi7FqrGwOc+U0SRmIw6+icOm4HPlI06Z/xfzz+3U
	Cxa50lyaLv1EDtrVaK9pYZVvogekEJvhY9eUNtmImeVfjQ3gci7y17gm
X-Gm-Gg: Acq92OEYF0cH4UXT0RHfHW5rjdsWUhosqx7h8WrI4crv4o2gxRHLiwC9d1xC4BOxAs0
	9MNu81aOZqrEYhro+pZjUzNwXAaviPDWrCHjiZOedchKRN2TBRdkAy7PGEdjwIQyY5MgnESSYBD
	lctSPGwuzABHE/Uj7a1fE3kMR0L39hbdsWb13Ud7DFhmpjpFMkN0G5na8U6OoDDleYwZEkxhEfo
	aB4icZ2jc6FTskYQtcgDnv92tXPAKyvBwxRQlQzWMpO1UaL1KZuEZs06P0fx3Nbe2xUvg4XbNc/
	+Q6og6rFQWzW+7NqypHlEZYBc7gYeqoTUbvbaLUGQRm6gPLzw6sJl9eKc1v+3VpnhBmCCCt7xLD
	Ix8tmjoOrxFRmJJuPjAohhQIjocbgIwZ6fPBKqSnmOt829rzgDsPUnjBAUlc/kr7rHQ4buLD2hC
	BNFgRWdE8R4T4nZk3LSbp7YwTTy4++m1m+ldYU1SgWNuB16pw9nddYgzjS2vdcNj4lPm7ZTgTN
X-Received: by 2002:a05:7022:6184:b0:130:ac5d:8f69 with SMTP id a92af1059eb24-1318ea1fdd6mr9903404c88.30.1778509362916;
        Mon, 11 May 2026 07:22:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327821fd00sm17932591c88.8.2026.05.11.07.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 07:22:42 -0700 (PDT)
Message-ID: <50b904dd-3c36-4f1c-b2e7-8727e7923475@roeck-us.net>
Date: Mon, 11 May 2026 07:22:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: apple: Add "apple,t8103-wdt" compatible
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>
 <87766879-ca5e-44cc-a341-87b2afa70910@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <87766879-ca5e-44cc-a341-87b2afa70910@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_072245_497465_9E18A0A4 
X-CRM114-Status: GOOD (  15.71  )
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

On 5/11/26 07:04, Guenter Roeck wrote:
> On Wed, Dec 31, 2025 at 01:07:21PM +0100, Janne Grunau wrote:
>> After discussion with the devicetree maintainers we agreed to not extend
>> lists with the generic compatible "apple,wdt" anymore [1]. Use
>> "apple,t8103-wdt" as base compatible as it is the SoC the driver and
>> bindings were written for.
>>
>> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
>>
>> Fixes: 4ed224aeaf66 ("watchdog: Add Apple SoC watchdog driver")
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>> Signed-off-by: Janne Grunau <j@jannau.net>
> 
> Applied to my hwmon-next branch.
> 

watchdog-next. Sorry for the confusion.

Guenter

> Thanks,
> Guenter
> 
>> ---
>> This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
>> device trees in [2].
>>
>> 2: https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net
>> ---
>>   drivers/watchdog/apple_wdt.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>>
>> ---
>> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
>> change-id: 20251231-watchdog-apple-t8103-base-compat-8a623e9831b6
>>
>> Best regards,
>>
>> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
>> index 66a158f67a712bbed394d660071e02140e66c2e5..6b9b0f9b05cedfd7fc5d0d79ba19ab356dc2a080 100644
>> --- a/drivers/watchdog/apple_wdt.c
>> +++ b/drivers/watchdog/apple_wdt.c
>> @@ -218,6 +218,7 @@ static int apple_wdt_suspend(struct device *dev)
>>   static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
>>   
>>   static const struct of_device_id apple_wdt_of_match[] = {
>> +	{ .compatible = "apple,t8103-wdt" },
>>   	{ .compatible = "apple,wdt" },
>>   	{},
>>   };
> 


