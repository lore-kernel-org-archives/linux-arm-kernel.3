Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AEBE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 21:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UvuuTwlUaB3Br+i87vUX933lDcfu6mE+mstWL6yF9U=; b=VxHUzuJgtp3JM8Jn3Z266R9Twn
	6whNJOLli+G7PkjClXusuJriEqKQqtZbQMZG4JV+pJ/taXtBj4ApTgar4Q5dBUS7KNRo/bgILgaqR
	ZlcegEdalbEjwTf7CY6GvSkFTukH7sPStM+iU60iDKf0KcOZU79dbbQwc3wA/9vF5ssD0PUbnLp/S
	ddg8JFllc3wf0EgoO04EhlUfNjTsQFxH1/hw3C0/SgQ2gTUpIEWzWE/2OOxoqjz5tlq9mfN5eVb+X
	AdSLpse52wIIocqLbkGnCbPHLo5u1Pre8DDho3ibzw4L9DM+R3rUIUyXFhzyXj8xOx3Z4yH/N6OtJ
	pugqLrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMZzG-0000000708Y-3E9O;
	Sat, 14 Dec 2024 21:47:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMZyB-00000007027-3au3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 21:46:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21670dce0a7so32226895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 13:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734212798; x=1734817598; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6UvuuTwlUaB3Br+i87vUX933lDcfu6mE+mstWL6yF9U=;
        b=SdJemAId2a9J8PH+Zdi+n2J0ILA3W2AdEjUI1JeF6/DUsWQv5mTwqOUF7dX5lMnJpn
         i5yUDaw70fIliR6MnA/G3TjWXm24sh5JN4PmdUnWmZP0NyvzfmDKTLAcby8zWyrHZUHt
         LQdt5QxoSqCdxyFk+NodVc3WI4X3jSOzO8DAeHmJmWR4xyyUnGvlUffebiggL1/qdg31
         M7AxhWy0SuomA+hzwPNdwX5pn9bivkOqbeG24dH3tIK27TU07D4J05lPhGcS64XYTpVu
         ntn5S5Jn49FolrsEMbj9L38IviqiJ+snsK78xmu48v0P85S/tHhV5ErVnaIaF7JdKcSa
         sHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734212798; x=1734817598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UvuuTwlUaB3Br+i87vUX933lDcfu6mE+mstWL6yF9U=;
        b=pHCK7w1SyK1iKwBOYrQnDUcthN86GgcVk/WB/wcRaJ3CIxXhRYuu0EK0gB8OdTHFc4
         4ytWQ1xxaEqVRNT7pgYNGpmUvTtsGJcKT1vS58WmMJm02nD/UPDaESzU3RaElPDeUBXX
         JO66aFVTAx9ny6PICIMLfz9WfwFyLyxNUvC2dowfNZ39WOClee8ZRn6VzRUx/P84iY3I
         cpTtZz1JpxENeyVTmqhxk3YliZExaMl+qHV3ao65Mp2U47Er3XSQvtor8/B4lDE4DAXU
         UybHeuQQTvfQlp15cE2wGoxZfAAad/LLSb3hI7RwEaWcDlyRWUBxfUbjT030YYXMfnLX
         yk1g==
X-Forwarded-Encrypted: i=1; AJvYcCXEA0yXWAapJidU1GP/P4/nmiBuvHRdjNnp4hpgrVVsJ3zbCJ7lnMa9D4ubPBNNhe1U8ZOiJQugmE8CxUldVSlo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm0dhm9hFPLEYg/75HwPXeayieVEF8v7qxHbB3ucn2j6gQV3sm
	H3EoKUf2s6SQY63FpW3rp5WtKoSlk4pgOkRr1QckU91N27BncoYZ
X-Gm-Gg: ASbGncs+lfPwhCOl+aTR5b2UMmaRIQWtoqi66/U7+rd9hwrk2VH7AYO19zp7cw0ZokK
	pba1Q1H8EVIK4CfMxe9t+2GOhqGj7eO24G+jUR4UIHZmIsgSaYRGWJhraJfdgKwIVEFfASICGmQ
	lLstxi/RyTr2ziRJG8AMBu0kRL9QrJuypsI5gmGqU1jaZ1JFfx0C1r0Zg9DEE8lPe3Y0FDhHyHt
	epE0T03HREtNmQXrgPrJYFXdq1dGsVzgykCLyI8xndiSRG/iaS4r/l/GgPDP+LkyAK0XugKFDB0
	bG0mtZrLaAMmX3fb51WsY7jmdrjTmA==
X-Google-Smtp-Source: AGHT+IEZPwXuT+jhvGafA+HbJxXjg528LE13RpAPOnkGSYOwMGLuNDL4Y/sz5BWORDDjKyhDUEn2SQ==
X-Received: by 2002:a17:903:234d:b0:216:42fd:79d2 with SMTP id d9443c01a7336-21892a52c51mr91855615ad.49.1734212798464;
        Sat, 14 Dec 2024 13:46:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e4ff7asm16770315ad.134.2024.12.14.13.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 13:46:37 -0800 (PST)
Message-ID: <927f2063-4587-423f-8c75-441f55e17671@roeck-us.net>
Date: Sat, 14 Dec 2024 13:46:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: aspeed: replace mdelay with msleep
To: David Laight <David.Laight@ACULAB.COM>,
 Phil Eichinger <phil@zankapfel.net>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241212113014.1075414-1-phil@zankapfel.net>
 <3fe75eab-e700-4ae2-984b-42342ec7d784@roeck-us.net>
 <d7ab80332def4a328cb9492fddcb8bef@AcuMS.aculab.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <d7ab80332def4a328cb9492fddcb8bef@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_134639_901578_35826739 
X-CRM114-Status: GOOD (  17.79  )
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

On 12/14/24 13:21, David Laight wrote:
> From: Guenter Roeck
>> Sent: 12 December 2024 13:56
>> To: Phil Eichinger <phil@zankapfel.net>; wim@linux-watchdog.org; joel@jms.id.au;
>> andrew@codeconstruct.com.au; linux-watchdog@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH] watchdog: aspeed: replace mdelay with msleep
>>
>> On 12/12/24 03:30, Phil Eichinger wrote:
>>> Since it is not called in an atomic context the mdelay function
>>> can be replaced with msleep to avoid busy wait.
>>>
>>> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
>>> ---
>>>    drivers/watchdog/aspeed_wdt.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
>>> index b4773a6aaf8c..98ef341408f7 100644
>>> --- a/drivers/watchdog/aspeed_wdt.c
>>> +++ b/drivers/watchdog/aspeed_wdt.c
>>> @@ -208,7 +208,7 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>>>    	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
>>>    	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
>>>
>>> -	mdelay(1000);
>>> +	msleep(1000);
>>>
>>>    	return 0;
>>>    }
>> This is a _restart_ handler. The only purpose of the delay is to wait
>> for the reset to trigger. It is not supposed to sleep.
> 
> With the recent scheduler changes isn't the code likely to get
> pre-empted?
> Which (effectively) converts is to a sleep?
> 

This code is called from do_kernel_restart(), which in turn is called from
machine_restart(). I'd think that the kernel has a severe problem if it
decides to preempt that function.

Guenter


