Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7499C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 01:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UveaDOK1GELu+JWXk2Wn8uWWsbK7toAJuHOoB5mqWeM=; b=fI+MP16R+L6SN3CV+cDEBeaZ6m
	KUmoH2908Y4Y41L2tcnpiNOD9myjXgVhNo4DdZ8bYVhKgTfnzQDD/3zaSRxTQl7MQsEXcpOeGKcFQ
	Vh14Z7NvpBVVhdxx5GPBw5rmxetbtmBbMTMg74SsP0Y+YgJOpiANcOOcAE2lW7BgXqAzX64jNtChY
	XCAVue3Jp6JXRUdIS/O/OFkzG/yTB0mGUU0GU7omck/tsV0BITDAYYQUtXOg6qCny4YmbHgtOqmRn
	+J797+vs2nH7a5M+kDsx9aFX0T2AC/KSZ2zaYGVU2BZn7BempOETa+VrEwCscFTETkeubbUFALrS9
	vEGnU40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZ6A-0000000AYsK-0mAz;
	Wed, 19 Feb 2025 01:42:02 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZ4g-0000000AYiG-0SOw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 01:40:31 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2f441791e40so9041856a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 17:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739929229; x=1740534029; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UveaDOK1GELu+JWXk2Wn8uWWsbK7toAJuHOoB5mqWeM=;
        b=MxTiwIzXstZy7FmOqURaDcdT+L4rPjEJMslmCHaHh+nclDJuydXPV40nVjqzl13QvF
         iKBpoCVZSilcVopN+kKWkFRXk5IVF2D3Mhpbf1p1LRsPmNZZyEk1oe2S4oT71jti7TaI
         F+p5U/ruNSc31mRYp4JO5U+IPd/KJbpIFvzQQ6Wl9hvvGdcdx9vf8NT0NRCmN5oEzgNf
         YXQcHw5PCrmp+LJpMqmLHIalr9+0xHfM5sA1nKa6sm5ssBTq6YSe/KTrQSaOFYolWhT+
         TUinGepC2IuUTZCoCkpooSChgC/vcdT9tqzq4tNRrW0WbnSldXw6Y7gAmErw4B0xMGF5
         /7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739929229; x=1740534029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UveaDOK1GELu+JWXk2Wn8uWWsbK7toAJuHOoB5mqWeM=;
        b=HpNaE8cAY38KJ1bBEnNLdn6AbxmWWg7RmhH3imJcY1gIXpzosXrFW58W9I3XAXS19s
         NayrwimO9crKzOERH2lXaT3xDRZy2iiN6iS/s/Zc1ldeELU2o4yhmtG4qCGQcXMLg7aY
         MNA8/TOROMqq6hvvIHWfvDYEKnytCTKESLsLQE9oxsfs8EZAOIt8hf0tcJKH4UrTaNm+
         IgNTSPSRedNk1uBquQSfOnzCEIOOjW4UNHghqTQUY23ehDJ/mk/VaVQTVtrOfeZ53/Gx
         GEbvrcpPWpuZWMAkXWDw5QndDQst52j5HlvDYr4Nxenm/kqFIPXZtHYx23p1Rh4eqNNp
         YTyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT6n1kaqQiBuLmFrLXfsZ7oXiIhFCEQ7C6u/WVmiA/ExxTV3oQ6dpXzOS5sWq6uVn67Ffihi0xSWv8Z7iM3CSJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1QXdm6oFMFsHv0wjUAqQVRB6Q3wAGwEqE/67Z97pHu/nxgQUx
	q2PwvinRePgI3LPuFrxW+bt5TIuTobodr09CnNF97wd3O7po6rGQ
X-Gm-Gg: ASbGncuNXmRQDmEOQJJYnzxSQVUnzWpZC1K4keVaI0nRd3XTiR1a6BSHw/6pI9WtYWz
	ZpWijpoQ6M6zVxP03loW27DbizXhct7KFTUXwDONqaKr/hn15DidYyzyzfz3ckr4AwqB/4Metew
	p1TbHz8TLc8UDnIXDGppJWnMsiWIaGoh/pDEv25gQupH5bFUpa+OyqHrQiUTb32dvaRZvMo8nKQ
	A9AFZ4fSKXjVIs/MzMzezOdMdAUIuVcHs4o6W+BNhCPaqmXj45izC16WX/KnDSl+bZmKs5x51wb
	BSnyG5liuLxhO+kGbI0U3X2Hoy16RftOL7gD4U1agI2P6pGQUUU/vE205fJHnrAW
X-Google-Smtp-Source: AGHT+IE9UaJ2QOQPOJ5Simaetziy6vDR63wBY+ghsuug1DdKfXWz5pR7HZxMGQ22Oo1JEfoCMZTqug==
X-Received: by 2002:a17:90b:3b92:b0:2ee:d024:e4e2 with SMTP id 98e67ed59e1d1-2fc40d14ddfmr26976340a91.7.1739929229359;
        Tue, 18 Feb 2025 17:40:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm13031848a91.1.2025.02.18.17.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 17:40:28 -0800 (PST)
Message-ID: <4602bffc-55b0-4a0a-9c36-ac391904d974@roeck-us.net>
Date: Tue, 18 Feb 2025 17:40:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Heyi Guo <guoheyi@linux.alibaba.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Eddie James <eajames@linux.ibm.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
 <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
 <201b57c00043e2c3590c77a4d1aba413aa576b01.camel@codeconstruct.com.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <201b57c00043e2c3590c77a4d1aba413aa576b01.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_174030_149277_8F096754 
X-CRM114-Status: GOOD (  19.89  )
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

On 2/18/25 17:25, Andrew Jeffery wrote:
> On Mon, 2025-02-17 at 21:33 -0800, Guenter Roeck wrote:
>> On 2/17/25 19:16, Heyi Guo wrote:
>>> Aspeed watchdog uses counting down logic, so the value set to register
>>> should be the value of subtracting pretimeout from total timeout.
>>>
>>> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
>>>
>>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>>>
>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: Joel Stanley <joel@jms.id.au>
>>> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
>>> Cc: Eddie James <eajames@linux.ibm.com>
>>> ---
>>>    drivers/watchdog/aspeed_wdt.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
>>> index b4773a6aaf8c..520d8aba12a5 100644
>>> --- a/drivers/watchdog/aspeed_wdt.c
>>> +++ b/drivers/watchdog/aspeed_wdt.c
>>> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
>>>          u32 actual = pretimeout * WDT_RATE_1MHZ;
>>>          u32 s = wdt->cfg->irq_shift;
>>>          u32 m = wdt->cfg->irq_mask;
>>> +       u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
>>> +
>>
>> It is unusual to use a register value here and not the configured timeout
>> value. I would have assumed that pretimeout is compared against wdt->timout,
>> not against the register value, and that the multiplication with WDT_RATE_1MHZ
>> is done after validation. This needs an explanation.
> 
> +1
> 
>>
>>> +       if (actual >= reload)
>>> +               return -EINVAL;
>>> +
>>
>> On top of that, you'll also need to explain why watchdog_pretimeout_invalid()
>> and with it the validation in watchdog_set_pretimeout() does not work for this
>> watchdog and why this extra validation is necessary.
> 
> +1 as well.
> 
> Further, the logic looks broken regardless for the AST2400 where
> there's no pretimeout support. aspeed_wdt_set_pretimeout() should error
> out if wdt->cfg->irq_mask is 0.
> 

It should not register as supporting pretimeout in the first place.

Guenter



