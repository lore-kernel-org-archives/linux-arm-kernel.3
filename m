Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A74BCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4K/mII+Iva6huIidVn3Xdjuo+WpE2kC/uVpvS1ParDs=; b=GMD2EeMXYyKpBmA82VspV8yL4n
	uXsCXL1BKTsb1aWP3k57FXI1Le/zd30sf9uFzIN5eJK8PC5Vp9xuTBDKn7bGSPU4VAFVl2IPse9Nz
	nSGxJ8V5CEUTtx+UxbIIC2ssTVLkCzzZlP4gf2BUCIqLLDs2uXMDyou8QkZRFKUzOb6jmOfLhGeh4
	dShmj8iKeUp2cjONel0OWHVI9ND7dFC8Y/UN0v1TeQjH0cbfZVT4WjPdwtB9s4DfERR4clCQy6FIP
	GNPPTIi0lC4mkj+Tv8+ifWgd0wiAx37fBjeuPtOG0Y8uB9BKz1Hqs5kwAoNVGZQHRGKf6gBWWF3kB
	DI5AmyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCu1-0000000E5Yz-3hAY;
	Wed, 13 Aug 2025 14:56:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCpa-0000000E0Bf-2oNN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:52:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-459d62184c9so40489115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755096716; x=1755701516; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4K/mII+Iva6huIidVn3Xdjuo+WpE2kC/uVpvS1ParDs=;
        b=Dq8/2L5OI1SmNLYk1HX25brEEXIOmBL/qvKxnbc0Y0VlsQv4gB4BdzCNeXIHyogIAV
         74qpnummfoLjtri/CXLPeg11UCS6R4b6GT/JyUs+sOsSftqUQXkL2/xYwmDUw1h5sbLT
         uiTr1u+GaZgFPyUg+tIcWUL+3/8MD1E0kK1NzkfZilQ24h8mW3+XDoLWOB2qip2txk90
         kOUw2zYpXMNmsllyc3ePyFgG3PFkxar7vTAz1OE4FPqRpLbQFQnd4ggnGhHcDpTqDH5m
         lp25z/onEL7U5f75Rs0AJKAu+jYE9wAyKzwEpNTmKJDZ6Nhs3muckhU0vOD0YJqaY1O9
         4dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755096716; x=1755701516;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4K/mII+Iva6huIidVn3Xdjuo+WpE2kC/uVpvS1ParDs=;
        b=hMLE9VPJgGzO0AA5zdBy7HyuhhxVtnw/kMKlmNR2AKf94If5QG/B0t5MuB3OcKbAW9
         P8/Pp6OsSmmIjgY5dOt9e5R6tX8L7pjrv+Z4z5GO0r4CRZjk0uMypXTYCBEdKr7fSLdS
         teC5eJzswCgdqW3IunaOfvGaEZx2ni8f3TNJ+ZX7OwAtmV0MsqvUfY6DNqfu9tA0i6XX
         TurqoyIWudCS+pmYez+bN4UWMfLVxOosi0QxSy4p3KKShxG2jnpOcvjCOPtgq+oIe7f9
         4dhphZQLGUV0r1j22EBLb/8f0sY7gqmT4XzFqcv0vXs91qJCEJsDeKAN5Y5uzJ7jnExe
         cW7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUv/zCfT4zADUxfncj0HZTqS9Su1MWBXNArR/6RslEgpi4aEzPgMT5xlkqwTOpdfKOlz6IGWipH/mXReSg14sVu@lists.infradead.org
X-Gm-Message-State: AOJu0Yze9pnHoNAlcFmWspA4qoeVJ6Rbl4nqn7Pt8SrxCGuf/yy5n+vE
	A89ILb/5rEc80IDAsFwSlVWVXxO0e36T19VtCw3lyd0Xxh6cLJXlDLeu
X-Gm-Gg: ASbGncsXT6tnT3jdWz03auifQVvU3uCGmSTOMakDhe3Ao+kn3ecn8YQjzGfjCdNS3h8
	eEShDpsbhfT9fswvmtxATh4cYkbcm67HgsxcnvWFtNfBKa/Pegp/ZpajPOFMKL/Y4yKuSxHzodw
	Xgmooz1GOoN5cg4zI1R5qde1rX0CLhtISMLHJh2e9d8lPpqQ3XzR9GQUlPigsDl7rUgke5zQ60l
	wxoQCkogna11BCCASJSsSHMrhjbsqyVK0jVJst65eSJ2peos7cUGvfLxvTJzq4jq0pEXMHJQ+tv
	zjp2bK1nm7sB1fWSzCa5kNPsYOWSZ68g64o6Icreg/pzTZnsUUO1Y3/pxzHTsuwASUpgYItrJ9/
	FYQZjQ+cwm2LaN9F766L64hGkbxByW+L173oEi8NNP6p+FcMJ9XSIKpHlMk8V1Uc=
X-Google-Smtp-Source: AGHT+IEjoDtnyyh4fH5hQpdDtWpzMPxBhJMdaagZ9/x77ISBqY672v9W0Vb05nUX9QTJej9R8M3lzg==
X-Received: by 2002:a05:600c:3b23:b0:456:eab:6344 with SMTP id 5b1f17b1804b1-45a165c4f74mr32756735e9.15.1755096716213;
        Wed, 13 Aug 2025 07:51:56 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a58f543sm5250965e9.20.2025.08.13.07.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 07:51:55 -0700 (PDT)
Message-ID: <cae39491-fac1-4725-923a-904534326d20@gmail.com>
Date: Wed, 13 Aug 2025 16:51:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 1/3] i2c: add init_recovery() callback
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
 <27cc9ae5-1c13-4ec9-ab10-ae95d6339116@gmail.com>
 <aJyN1uX60BJQYDHj@smile.fi.intel.com>
Content-Language: hu
In-Reply-To: <aJyN1uX60BJQYDHj@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_075158_826107_D8583F12 
X-CRM114-Status: GOOD (  19.59  )
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

2025. 08. 13. 15:06 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 13, 2025 at 12:24:22PM +0200, Gabor Juhos wrote:
>> 2025. 08. 11. 22:17 keltezéssel, Andy Shevchenko írta:
>>> On Mon, Aug 11, 2025 at 09:49:55PM +0200, Gabor Juhos wrote:
> 
> ...
> 
>>>> This is needed for the 'i2c-pxa' driver in order to be able to fix
>>>> a long standing bug for which the fix will be implemented in a
> 
> The above left for some context for the below discussion.
> 
> ...
> 
>>> The first traditional question is why the generic recovery is not working.
>>
>> The details are in the driver specific patches. Should I write it all down here too?
> 
> Instead of the above paragraph, give a summary of your use case to answer 'why'
> it can not be done differently.

Ok.

> 
> ...
> 

...

>>
>> Originally, I have used the following solution:
>>
>>     if (bri->init_recovery)
>>         ret = bri->init_recovery(adap);
>>     else
>>         ret = i2c_gpio_init_recovery(adap);
> 
>>
> 
> Without this blank line...
> 
>>     if (ret)
>>         return ret;
> 
> ...this looks like the best compromise among proposed implementations.

Ok, I will use this in the next version.

Regards,
Gabor

