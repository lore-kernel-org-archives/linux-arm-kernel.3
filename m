Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6BFCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBvMcb9A/AFLPKQ8t4bKDq8tGZPD9sVSSm5Hx/aM1sg=; b=QgdJ0AhqW8TNxZGosSI99dvqEr
	cxKRKn6R9xDlZEOtDgDfpqePy4qB+6W2EZHb+NpNZtjZASu59SsclT5RUWrg9zkdZyRHL+hSGo7xk
	8vRcLauJ1Ijco/F7ku4TjQ/CI+7rx6v9UTl7fFNRWW+pHsQp6ZmFNSuUBBOf6/VrMoS4BGfsPhAqg
	idevyLSynGm4f3GhfaMhMNHMeA63cZUeSK3xFS6nnJMQIPK4PA2EdDVbG77pMjktvMoSTI27w998/
	DP4HdHfjDqFI366TNl7S2NohcEatQPBJe5QpyCfB7nvQeMf3NV5ojZR18zyGxSjqEnpIO+Hrdgjbm
	wWCTOvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9Pu-0000000DUUJ-0Po9;
	Wed, 13 Aug 2025 11:13:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8ef-0000000DN5q-1Nsw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:24:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b783d851e6so5462369f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755080664; x=1755685464; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hBvMcb9A/AFLPKQ8t4bKDq8tGZPD9sVSSm5Hx/aM1sg=;
        b=G1g62r70H2PkksChhT7SrvMIQrSWKHXYu2AZGYytlcibwV9gdy/lj1eEv1qPaT3HFY
         34J1eNOnFAK+dY5gutG346NZVC6oVjvVNnkhYnRI1DEkFzUeEarNwIOIO58Cka6sMFoz
         zzk2sIPJbohN8ArEVbYnmW2IS9SGBz9hsPEatdgPIFEY1KDmZuod5nj/XtS9ORXqvP5b
         tJAao4Rr41IBLLavsma4FeiIqOYgM2Ma1ZhDZiXaf9jhFs8OsKIFiPQKDHLA7GCngtg2
         mlVyJ6OeahsfxkdFI+L32tmtAhHDm1LLzYIB4N/klrOH7HtlBMKA05kmFHmMT3+VGxFi
         U2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755080664; x=1755685464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBvMcb9A/AFLPKQ8t4bKDq8tGZPD9sVSSm5Hx/aM1sg=;
        b=cuu1MTKzM5nZ+cXHXbRY+mF7yTY+yTgN8GEOcjcsLMGt0J4wr0ew9LuUq8X2wyp7XG
         dhBDQ8W1E6Y0Q1v6ns2Gs+nuvk2UvAg2mGZqB5zGZagRyI/fweZY14LcC5vXV/yjZo+Z
         nyN1/U/vL9TVFGuH2EAW1VFtRUHScCer2Mh6k4hhqXIqdGVb5LIWsk9+d8yJXTooASGb
         mGz6Ej/FrOZjWNMGpGsl1AeAoKsp2rIGHKNbt4tOg4ujXhyB5cLTL9uqLYcZTShZ0419
         jMo2qdYg8uBUwl79Sniu9Lgm2+to9iqBf2o948ZtOhz6BrTDfilsjQxdol1yAFuu52m3
         cFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNkBtFf+USkUK5NnxnhQSlQnCwMzbxCyEQ2I5thyQy/oMDDI9zqsc7ytzEyrJG1IpJwAoo2m0i1M+OJTcmlt3B@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw2sb6C3xL2bjWD5uYWOOQjrrrxX+zSrQQtMdqaH6jm4MpP++G
	T9g6js3rwtZKNJpvH2exAGZbX6InBGR9KFDDgDoSFjadRTw0AzPd2AqF
X-Gm-Gg: ASbGncvclLVKvC7atPhTkyxHGB3nHe8UBLDP+VSpmHxMk/33esUJtuh2gMvi40/uhNz
	1bRsG52X10aqLtnNqy7J3NlOyVoAc1ubyhC1kEX/Z4Pv8e5kEyWPhjyMlF5aUqb5AeB7CbwKENC
	zKx1bCNaLAdpTnuqnqcaniV6zcZUHjzaEKug8Iz+qMozXCXGx50GqdDnq1oD3wuBsVJf7LdPsbq
	W1xy42kRImiLhLQdqwTbWWGw/fgECOANqXhL2dopntaUnAWUx5EKPdU8NDOSret1UzT5a7qgssd
	9XSPkmlBoonbG/EYU++sBPXMIQEPRrOR9eKkEnQNWpkGnI+Ksm/jo6qg+eok3mel1pVh/CAx94e
	7EtCbHgpLmsqpoQ5mnhlN98ybWSsH9HmsoTwFl+StcPsRQWJI7ahFFQdoTEJlyKw=
X-Google-Smtp-Source: AGHT+IEJHjTQQo8npkV7yU/QWSo8+r2RnFWIg51TLG4KaWGQtT16a4oEJjJRn79a5sY1UbdD0pjCsw==
X-Received: by 2002:a05:6000:2006:b0:3b7:8880:184a with SMTP id ffacd0b85a97d-3b917f42040mr1913827f8f.54.1755080663628;
        Wed, 13 Aug 2025 03:24:23 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf93dsm47351880f8f.27.2025.08.13.03.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:24:23 -0700 (PDT)
Message-ID: <27cc9ae5-1c13-4ec9-ab10-ae95d6339116@gmail.com>
Date: Wed, 13 Aug 2025 12:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] i2c: add init_recovery() callback
Content-Language: hu
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
 <aJpP5eABTYnQRV82@smile.fi.intel.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <aJpP5eABTYnQRV82@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_032425_376031_871DD064 
X-CRM114-Status: GOOD (  25.15  )
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

2025. 08. 11. 22:17 keltezéssel, Andy Shevchenko írta:
> On Mon, Aug 11, 2025 at 09:49:55PM +0200, Gabor Juhos wrote:
>> Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
>> and modify the i2c_init_recovery() function to call that if specified
>> instead of the generic i2c_gpio_init_recovery() function.
>>
>> This allows controller drivers to skip calling the generic code by
>> implementing a dummy callback function, or alternatively to run a
>> fine tuned custom implementation.
>>
>> This is needed for the 'i2c-pxa' driver in order to be able to fix
>> a long standing bug for which the fix will be implemented in a
> 
>> followup patch.
> 
> "...next change."

Ok.

> 
> ...
> 
> The first traditional question is why the generic recovery is not working.


The details are in the driver specific patches. Should I write it all down here too?

> 
> ...
> 
>> -	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
>> +	if (bri->init_recovery) {
>> +		ret = bri->init_recovery(adap);
>> +		if (ret)
>> +			return ret;
> 
>> +	} else if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER) {
>>  		return -EPROBE_DEFER;
>> +	}
> 
> If the above stays, I think we would drop the last and always have
> init_recovery to be assigned.
> 

In that case we would have something like this:

    if (!bri->init_recovery)
        bri->init_recovery = i2c_gpio_init_recovery;

    ret = bri->init_recovery(adap);
    if (ret)
        return ret;

Since the callback is used only once, and within the same fuction where it is
assigned, I don't really see the advantage of the assignment. Although it
definitely looks cleaner as far as error handling is concerned.

Originally, I have used the following solution:

    if (bri->init_recovery)
        ret = bri->init_recovery(adap);
    else
        ret = i2c_gpio_init_recovery(adap);

    if (ret)
        return ret;

However the existing code ignores errors from i2c_gpio_init_recovery() except
EPROBE_DEFER, so I changed this to the code proposed in the patch in order to
keep the existing behaviour.

Regards,
Gabor


