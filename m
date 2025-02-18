Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0FC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 05:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIXUg8SbRufb036zZV3HGnjlaTM/TH+KOn8o/6auPy0=; b=OadrXiJ8ai+sylJPXK2rf68j6T
	/xycTO4obW+XCkFQsubnUIng2Bv2hS/Ca3OohmRc5rBDlGc4EhCgQKaTm6fcLRMD4Xbf+5NFcPAt7
	1OBrmqSly1jdfLbNQO5W17trixf+CN4w2TCfle5D7GtccjbHJ2iDpOhxHvwuNMW1OO0iWo5uhTPNp
	pkAvM02lOjv5leUIWbJaeoePlqM3oy7NPITU/CSsC9KYo031mx8J2oItSt5D5/E44PmWX/x3T3rcy
	bWrsl5P6xs3lpDqaDAlyI9Zo/38xjXLfTpX0Z9VcKkD4Y0TGlSpEILtpHMr+kQWi5lYM4rJl2bbxS
	KTcWOPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGHO-00000006sI8-2IjG;
	Tue, 18 Feb 2025 05:36:22 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGEe-00000006rrD-2oFB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 05:33:33 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2fbf77b2b64so9418886a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 21:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739856811; x=1740461611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIXUg8SbRufb036zZV3HGnjlaTM/TH+KOn8o/6auPy0=;
        b=fPMV3fjiCt3mink4OxsfLOfHT76+1M8dBw+y8lV077c3WRgWRw43aagd/G7YyTQ+jI
         /pZqtZ8q9uMDtEGK+swPKgCEal/HJhgKT7bg8hbxEB2GxjoSkLUcEhiuIy7/homR1/+s
         sNqHwlTkcr420/9eOnzVVHqkz5ga2j0gibAZRGSjWVr+fSA14fLsdFD6VO5foG+zMnI6
         /9O5JsGH6VYoSFId1bMt0nIROH28nY0xj8KxPkI03vduLLKJKVrcagITfPcYExKSirtK
         oYFEEpJX0B9hnPcItOyoxDN2a5vzN0AvRHkrOgoLEipqswsPhYSiyy6SXARHtOmafi6U
         d1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739856811; x=1740461611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIXUg8SbRufb036zZV3HGnjlaTM/TH+KOn8o/6auPy0=;
        b=ad1f4jpRu0m0kf/fiEpSgVKPVut4N/jImOeihvRsJKvxMcst/k1WVNckHBE+8JnBoC
         XgfpW91Kggl/vdVmgus07az7nGtxHsdJgfat68zTFPzEi/OVuMCfYioAsd39daArsp8H
         SeEbqo97+Fxo+cbNpQlY1iwsbr7ujJTtmFROHmYkTm1cS09UnYaUwYapY3rl9A8EW6Dx
         47X0UzCXJZF3+I42KyE/sNWOmML8sqzpBQbY/lUdPVjBVUvzAaU32TTaDUTYBjxOGOry
         wjv1imqi2eygjFRz8lkgZenUfpMdthKJFbLJG4Q4eeRcmmNEuEqHWaZdap4EU57ctiFF
         rtuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU83qBmOb3GIMjC6TSzOGo9J2UaSgoLSBkU55HQeoseez6sCvwf+DXF+ueQ91KRzx9C/SfkZGheC/UNaQma1TTD@lists.infradead.org
X-Gm-Message-State: AOJu0YzJAZ2Aaxt6KOMy9AhxIMUr9EQiOzLEnmeT1A/hCcVcagV5VWTk
	vRwP5ZKlCy3LrmC97dAyt2fDQV/15KGM+ILPaApfDrG1NasbPXGp
X-Gm-Gg: ASbGncusgffSJ1Q5u6TaneFRkmjZTm8KCkKwdXwfC9p6QOt9QvS5doMDSGsHJCvYmma
	8bP6A9rzyZw+lXxIsfHGHYrHdc/qGsvwW68cqK/FA9hgmfVbfXD1kWzw8bM3zGx+G6CU+YiKvVU
	eec1L756xOzjHHl3H4dJGPaIe0/0eYOeaprMeAC7tkeQZsbMjgaD/CDxwMckhCxaO6P16F+ESSM
	IRJolJZKi45lZ78qpEeROEj2WaJ3IK626IrKbRFhfHpSEfUUD0g7zuSYmoyzMmClkGlcV+OiuN8
	xyQlJcRnabzJ2cj1S2VyDXxQ9tT9c1uFQ9P6oQHCId7ReRyVr3AmpRpVyhyswPcn
X-Google-Smtp-Source: AGHT+IE3yaFBuZ3jvd/c/xksrjQzXgC2Ka5HLYonZdx0VSjT+fo54DpWdxFWB6u9LmDK+vl70/Lj3Q==
X-Received: by 2002:a05:6a00:2e08:b0:730:74f8:25c1 with SMTP id d2e1a72fcca58-732618c0351mr16588841b3a.15.1739856811308;
        Mon, 17 Feb 2025 21:33:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73270de9b7asm4451004b3a.90.2025.02.17.21.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 21:33:29 -0800 (PST)
Message-ID: <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
Date: Mon, 17 Feb 2025 21:33:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
To: Heyi Guo <guoheyi@linux.alibaba.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eddie James <eajames@linux.ibm.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_213332_714179_0F98054A 
X-CRM114-Status: GOOD (  18.09  )
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

On 2/17/25 19:16, Heyi Guo wrote:
> Aspeed watchdog uses counting down logic, so the value set to register
> should be the value of subtracting pretimeout from total timeout.
> 
> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
> 
> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Cc: Eddie James <eajames@linux.ibm.com>
> ---
>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b4773a6aaf8c..520d8aba12a5 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
>   	u32 actual = pretimeout * WDT_RATE_1MHZ;
>   	u32 s = wdt->cfg->irq_shift;
>   	u32 m = wdt->cfg->irq_mask;
> +	u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
> +

It is unusual to use a register value here and not the configured timeout
value. I would have assumed that pretimeout is compared against wdt->timout,
not against the register value, and that the multiplication with WDT_RATE_1MHZ
is done after validation. This needs an explanation.

> +	if (actual >= reload)
> +		return -EINVAL;
> +

On top of that, you'll also need to explain why watchdog_pretimeout_invalid()
and with it the validation in watchdog_set_pretimeout() does not work for this
watchdog and why this extra validation is necessary.

Guenter

> +	/* watchdog timer is counting down */
> +	actual = reload - actual;
>   
>   	wdd->pretimeout = pretimeout;
>   	wdt->ctrl &= ~m;


