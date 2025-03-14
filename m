Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E758BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 17:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlPNsSQRPTHB22Ndp+VzvIgQN0PVNLvyrZ2jAW0mJYE=; b=V1uqqUNcq/eUShYmHc6CQcSwaj
	vs6rDTeEt+3qduezBrBaVEOH4vZC2adSuLGySp0Uq3UDTOUY8+eI136rUMyw1pZrEqodW+Zo0dzJn
	kHuicVZ1AZFsvy2yzBGsNrTz/uk+GaYYEDXQ6/K5MJB33WNKAbiCr0BDixrsP6y6IqZHfsMG9rtsQ
	pfwAdzrwIRloIkFhHL6WhJKmbL9+96EQBicK3Gpdt0+DuqpQYZmhVPKSx010r2xAafD+gY4JXkJ1i
	wAbcYrC3T6S8Wap6es9Vr72afagbpZ9Ce7bnNB9goYaMbN2oU1eOcKtBzJqzVgHstefrRjjcbFDnf
	bkr/7ecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9CN-0000000EwJu-2lYP;
	Fri, 14 Mar 2025 17:51:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8yH-0000000EtsI-0hAF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:37:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2240b4de12bso64743065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 10:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741973840; x=1742578640; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dlPNsSQRPTHB22Ndp+VzvIgQN0PVNLvyrZ2jAW0mJYE=;
        b=PTUwQbPSlGAM7CgjQd6pfqg181cdsIKfqBmu8+oHBsgKx890+sf1bd69kmTzkD6gQz
         n6Z+KL6+yCtDzwuNtW2o3mKN0pmMOgkpBQ8NJ4dRFJE9FHv0R6JvE5ozmD+7Mmn6pUrq
         aDMkX7jtbCjvyOQklRfOw8MWAs2DfeQpKKf5la3/ehTkX9DVZzK3ukVF+IXlRBYPKHTz
         IDmsdcAQUTrwYDcFJZdQtZULsYNrGcxmcBvjPEcxPSgoTnER9mnB4lilmmW5VkP0CGWq
         iDBpD8hCWggjw+dQGrFdbvjswiYvKyUQLqtPvwkHWInFyo1qejf2iHZ2PzJi5OqA8h2l
         ZrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973840; x=1742578640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlPNsSQRPTHB22Ndp+VzvIgQN0PVNLvyrZ2jAW0mJYE=;
        b=RNo1r/MKBSFiOzCTyUuJGWguG2UxfGH3SlgJ9WC2leEQdqTSpCXGbXUJaqljgxqgT1
         DiaJ2IIugzHiT/xESQVvq2ZwdLOuQCpQ7jFxKQ+r08+nLll7EcWm8PVb/7GQGdoGb+uh
         0nG5zE9xiZGnXSXWKfMtzJkyf0+fd9khIoVR+b1SLGrMN4Vb+HjdnThZ8/j1xtuAgyJM
         XfUA22/UgnDxDz9f+oXLQeRy1aUfvTybwCkZPKSChQA0DUo9BaVGGoHA+oUqrSL3uHBY
         lOy4Z0BAASfKXE/hPoDH98IEXWAIhQtW7v3liEVdcizZnpPNDQS8gH9SXL5uM5esS7Q7
         3Ajw==
X-Forwarded-Encrypted: i=1; AJvYcCViEjaC6uR+B5ctROoa3iKTYswa36OTBKhhfo3robDA4VzZk9Z4DOlknGaLQJSh+OZMOoME7ed0BQIb1Jpl2Y5h@lists.infradead.org
X-Gm-Message-State: AOJu0YzaopIJ5cnK5W9tFzWvBjUXRH+E+iusau4HArw4wzuAa7zOElj9
	gsJSVZ4X+7EvT2vrjMMT1NVOJwLBGd9C0UlTVLzmUwXT2AW1aj6UNmxzQQ==
X-Gm-Gg: ASbGncsX/4VGJUCv3vAlob6bxdmffpYF1xb8d8kVcJRjuFsjJGcPiMXNBcsFqJFuAMm
	RCu36np0DHWqs95eI+dW75wPEJ8EaiLFSZSonWW3cc8Z/oSuQwB09uLRVQCLS0Rg0l0J4EvRSC7
	eNj3m92jbNhyTcMMgpdj3+2VgaTlphVtL3ALhygVg7cgg1W6j8dUR+y9TuW8xuAKIcZPGzXKF6+
	crcHaE8G+pYAmpEy92GiU5kyoSdB40uBJIWwNPZwatcYPjB+EBRZ1zDPzQBC+YJxbOFutjqGksy
	JfcSVOUigCdFn7k7n2U0JK1VARtff+feO7bo8PzaA2eqYw3MvpRfOzAz2WIG355WVejZiRH3VQj
	0HKyoe44AAo6Vw/GhsA==
X-Google-Smtp-Source: AGHT+IFizML3rPWYBYQ1V1FDTrUWu2FNB4+D28MCfjpVbIvX13A36EX+sYbjaqnDQpl7bfbEsig6wQ==
X-Received: by 2002:a17:903:4284:b0:224:1781:a947 with SMTP id d9443c01a7336-225e0aa0986mr38262895ad.21.1741973840125;
        Fri, 14 Mar 2025 10:37:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68aa5ffsm31198125ad.82.2025.03.14.10.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 10:37:19 -0700 (PDT)
Message-ID: <9ff3ba59-be59-4a2e-ac1a-5ce23b1b3fba@roeck-us.net>
Date: Fri, 14 Mar 2025 10:37:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: aspeed: fix 64-bit division
To: Arnd Bergmann <arnd@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250314160248.502324-1-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250314160248.502324-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_103721_207574_2641C3E1 
X-CRM114-Status: GOOD (  15.79  )
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

On 3/14/25 09:02, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On 32-bit architectures, the new calculation causes a build failure:
> 
> ld.lld-21: error: undefined symbol: __aeabi_uldivmod
> 
> Since neither value is ever larger than a register, cast both
> sides into a uintptr_t.
> 
> Fixes: 5c03f9f4d362 ("watchdog: aspeed: Update bootstatus handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/watchdog/aspeed_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 369635b38ca0..837e15701c0e 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -254,7 +254,7 @@ static void aspeed_wdt_update_bootstatus(struct platform_device *pdev,
>   
>   	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
>   		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
> +		idx = ((intptr_t)wdt->base & 0x00000fff) / (uintptr_t)resource_size(res);
>   	}
>   
>   	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
Does that help if the pointers are 64-bit on a 32-bit platform (multi_v7_lpae_defconfig) ?

Guenter


