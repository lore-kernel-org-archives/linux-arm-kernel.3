Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A2DC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 14:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/cw6oMGvUHB+hNpkuOSeNVySjC3l8LxiE9FdEJYQLw=; b=3wg0d5RnL2mC6dGwv0LFnr4SWs
	HFO7dK2F6qqJVoXkUdDhgnAEOygODu0UszFMOyfNdD5xMSihcPXojCg++H0VqMVJC2LAYGlkRIiR9
	zzTfEQsTGXQEwd2KJjpfnW5SU3RdeSjCLNoy0iIJgIIxLkWpTSzbGF0A5oUGNyZFW+WuLNEClRlO+
	eZuuQAwW8HxLbZdNOIZQHRIYoTGxikKJjO29LosVSgEpHtuBmGyEs1L72okHsDU6q5pe+Li8XDn83
	dGCUlmgb7kYVC6+h+KhLl5FrXrC6WY5GiRJ1y75TROrVsLdseosO7veEan/kXKiS7L5x7c+XR1R0G
	KfmkXstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt4ud-0000000APPw-3jwR;
	Sun, 09 Aug 2026 14:54:07 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt4ub-0000000APP9-2kFQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 14:54:06 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso522692a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 07:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287244; x=1786892044; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/cw6oMGvUHB+hNpkuOSeNVySjC3l8LxiE9FdEJYQLw=;
        b=OX5Ho/BzWooi5IdpLgLEmb/awHdyIPK9dMG9D044vRltTEgn3c+i2jbroTkLRbx6js
         aniqcdnex+8Ysc+5Q4FsTyz/8uW1sFy2m8ds8oWh8pMX4EoLPdCpB0Auh7fGvulvgjKc
         V7nHSSQo1xCHzb0YVj+QdgyIruB+XeKvPUkjmAeQej/LtL9Ez+kUYmFBbIdts/nLhl0c
         5U+PEu0dft9cQKGxdhh372+aIdMpfJ6AoITsTueh1/XAe5buMlOei2PnuTObC0IQlzqC
         qjmTeb5qauep8eGnJlGM9SUG9Aa4QD4zQi55su7xH2if8GP6S6rLemsykox5J3NuQ851
         ZvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287244; x=1786892044;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H/cw6oMGvUHB+hNpkuOSeNVySjC3l8LxiE9FdEJYQLw=;
        b=ZrQRca0W6RU+PvY9RaxfiZqIu4d0inYeZgyhVOMjz4IunGkJZeOzNQbboePQcXE7rn
         Ff/jB+strH++ZmAPLKRQqEO1udX7ZzHI/+C5YajJGwtmUtlMxnOf8XVa4zI/mCdzHRvE
         PSzLyfT+D88uYh+BanDayWkR61ktMgpFTxL2+6Cm04cnzfhfBN13QQQddBrz7LwclbaI
         bOEN+C9T/WndwsujLzN70Hi7bbkga+UH0/qqMylhx7fLW8DNIiGhrKsEDC5J7UDB/RsC
         dlLTxAF1dQwkCOvtMsK3X+KSNWzpbFBc+nxnTJxsQJvtZpjmDqYdYK2O4tx0x3fHQ/i2
         7B+g==
X-Forwarded-Encrypted: i=1; AHgh+Rpxe2FxcDKlPXkTM9LG7n12KqC/gx8pUephpNzdClGdKFTPQ6mSP4tDPC4tcIirdbANrxI1OQSqRPHYkabX0dna@lists.infradead.org
X-Gm-Message-State: AOJu0YzM5FvIastPmBmMIM4QPJkMfzZykgBqrWZnUTdEYSPyHlb1E6IS
	mw4DROdIVzXzMsDzAHPolGwsaYifmTSTY24Agd35dzJG9dX6G9YikEEv
X-Gm-Gg: AR+sD135zMyBJoW+Uc3i8zalz0rdawNhz7d7JVwPFtmkdl/PHFtKW7sI8hUBMcO5akd
	phUMEShTO2w06uoG5T2Qj5LMq36SRvsam9d1VpBu3iAm7AJKVHCjPUPLCluGJxD2XzoiZ4PIesE
	ls7dvC1gGN+owoUuDQI7PkYbnRNrrWhpy9EI2xQLMJ+p767SzJDzwNUjPnZrLEGa18v78F4iC2V
	yckfvJ1wh5oEeHIyXv/OpXMnlA6lhH7Cp+zvz3PEFR3RLoIFFGixcZXlo8c3JKeRLzaAdVhL6cy
	Vm1MPNkZnceWc8z3NtAtz0w6J7mrbTdZg0yqS8N1QAOfJ7yq3z4v+Jk+ZelgHlvAyTqebbKWWiw
	A7IYVICWo5MtR+1eo89+FFFdN0exkFo4su31VD8IPUFWooqnntN87wR0OGUAeZ+1ukwqjG4337S
	b488lckhu7ydev7UzT3Y/582SeWlUlDRmewynsUjk3Vh9XAnPckqn9GPECKfhVGictFKwpds96O
	TsrAGvDHu4jtqFL+wetyvLzPtvPRO29hAV/eA==
X-Received: by 2002:a05:6a20:e593:b0:3c3:fb32:a004 with SMTP id adf61e73a8af0-3cbcea16454mr15497371637.34.1786287244292;
        Sun, 09 Aug 2026 07:54:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e90asm31456515eec.3.2026.08.09.07.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 07:54:03 -0700 (PDT)
Message-ID: <ccd8fd7d-4555-4ac5-ae73-c16e98b8edc8@roeck-us.net>
Date: Sun, 9 Aug 2026 07:54:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ
 lookup
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
 <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com>
 <9971b3aa-cb1f-44a9-9d58-4f75f0c6ccea@roeck-us.net>
 <CAABR9nHu4pt-Rg8Aq0B6KfKFHX+C1xQmMk6=j8jq1Zn-MQ0p6Q@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAABR9nHu4pt-Rg8Aq0B6KfKFHX+C1xQmMk6=j8jq1Zn-MQ0p6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_075405_708410_8EBB2117 
X-CRM114-Status: GOOD (  18.39  )
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

On 8/9/26 03:01, Bui Duc Phuc wrote:
> Hi Guenter
> 
> Thank you for your review .
> 
>>>    irq = platform_get_irq_optional(pdev, 0);
>>> +if (irq < 0 && irq != -ENXIO)
>>> +        return irq;
>>
>> This is still wrong. If there is no pretimeout, it does not matter if there is an error.
>>
> 
> If checking data->pretimeout is required here, I'd propose one of the
> following approaches
> let me know which one you'd prefer:
> 
> Option A (minimal diff, keep existing structure):
> ---------------
> irq = platform_get_irq_optional(pdev, 0);
> if (data->pretimeout && irq > 0) {
>          ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>                                                 "wdt_bark", &wdt->wdd);
>          if (ret)
>                  return ret;
> 
>          wdt->wdd.info = &qcom_wdt_pt_info;
>          wdt->wdd.pretimeout = 1;
> } else {
>          if (data->pretimeout && irq < 0 && irq != -ENXIO)
>                  return irq;
> 
>          wdt->wdd.info = &qcom_wdt_info;
> }
> ------------------
> 
> Option B (check moved out, before the if/else):
> 
> ------------------
> irq = platform_get_irq_optional(pdev, 0);
> if (data->pretimeout && irq < 0 && irq != -ENXIO)
>          return irq;
> 
> if (data->pretimeout && irq > 0) {
>          ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>                                                 "wdt_bark", &wdt->wdd);
>          if (ret)
>                  return ret;
> 
>          wdt->wdd.info = &qcom_wdt_pt_info;
>          wdt->wdd.pretimeout = 1;
> } else {
>          wdt->wdd.info = &qcom_wdt_info;
> }
> ----------------------
> 
> Option C (default-then-override, only look up the IRQ when pretimeout
> is supported):
> 
> ----------------------
> wdt->wdd.info = &qcom_wdt_info;
> 
> if (data->pretimeout) {
>          irq = platform_get_irq_optional(pdev, 0);
>          if(irq < 0 && irq != -ENXIO)
>                  return irq;
> 
>          if (irq > 0){
>                  ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>                                                         "wdt_bark", &wdt->wdd);
>                  if(ret)
>                          return ret;
> 
>                  wdt->wdd.info= &qcom_wdt_pt_info;
>                  wdt->wdd.pretimeout = 1;
>          }
> }
> -----------------------
> 
> Let me know which one you think fits best, or if you'd prefer something else.
> 

I wpuld probably implement something like

	if (data->pretimeout) {
		irq = platform_get_irq_optional(pdev, 0);
		if (irq < 0 && irq != -ENXIO)
			return irq;
	        ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
				       "wdt_bark", &wdt->wdd);
	        if (ret)
         	        return ret;

	        wdt->wdd.info = &qcom_wdt_pt_info;
         	wdt->wdd.pretimeout = 1;
	} else {
         	wdt->wdd.info = &qcom_wdt_info;
	}

(which I think would be a combination of B and C) but ultimately it is
POV and doesn't really matter.

Thanks,
Guenter


