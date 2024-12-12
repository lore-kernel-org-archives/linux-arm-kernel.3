Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC2FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4O93T3nWN1CvVNDoucw7J8PWjYgMeFXCoydStFkkYU=; b=NMiBbaNkXqebu7tDkUzfMdqEKL
	iMacbYyb2tacNXS7uQ2mMVcy4ZadLHoa+ibev5Mij9lHyYYYNvRfqWguBJiFbZmQd8QzNt6ewifas
	KUtY57LiOrmeMIAQV+t98r4ACq3n+TDhTLU8065yIzoPvG7WM70/r7Iv5EjL8I/V5OqLViHo5ZJcz
	4MATjoebVYKupoulymNDBzQIQatMRRGdh5d/SiUKr9I5tKO8JfQOK4bCBMm5XBLv5XyQxyPwvfOtd
	zsvdk5G7PmGAqk1LMySKMyvF8c2keA8wKEdPrLabiiJktYZKzc6wYJ7KdwPA3a133OMb+Pvlu5L6q
	TU6m9U2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjgz-00000000XzF-05iW;
	Thu, 12 Dec 2024 13:57:25 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjfu-00000000Xq2-0W5p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 13:56:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-216281bc30fso7165715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 05:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734011777; x=1734616577; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=e4O93T3nWN1CvVNDoucw7J8PWjYgMeFXCoydStFkkYU=;
        b=RPFy64weNXBTui6kMLMXKNsTHc2bTeef2P0vJmbbObxodXZhRZuwgMJBN5oqfAAc9B
         nX47dy4SvdSV1+krS9lf6o1PwrdyFs0TzMf4tWxn9oNf1GdhUAE8KMCFuK+dmBnvYWJX
         BsLZW9oPoxF5RNzGu7CLkvNP+H52dnTusTEBGoVqjQft5PY5TB/a1jHEXzRUMEI5GByz
         kgmIEeWmnzFRfY+zTt7FkIKaNGjR/2D6wWlCoH2TqbLbe5n7Xn0bbtQKpn8XqKRjPCYM
         2PVtSfy7RawciGBZ7jeU3ijvSCpzui6yig0ZHiBWA1cbMdLXky4kMsJmtQV6FKoQykKJ
         FEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734011777; x=1734616577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4O93T3nWN1CvVNDoucw7J8PWjYgMeFXCoydStFkkYU=;
        b=AzXtI5gesYWc98WdSuih8RxLr22nE1xrhTrIrxrJ3GoV71shXKZZBQ614waOyAuu+0
         OQib0R4oJpXSXtlZ61xC5QHsvt3zcBusBPFqaDZvp4AZwx/oZ1Bebulu8q0KvtE8RCxH
         f+NV07b4pmcZPOdV045S/dbjtWFdYH95JVyPZIjj9geujvm1QANW9iavojigNha5PSze
         NRavl6XbITAdelWFebjy63hHeS1FPz/7fGGsrvVbMQ8suP8bN6pY3DbV1lFHquRGkzhM
         I7dyZvt8S99OP9OruKOzPbu5p69FGFxLes9gpoa4FCEGwmFdDerFGWbYb/NJCMdfEAWA
         1hog==
X-Forwarded-Encrypted: i=1; AJvYcCV2HpzDWmKL2Ype/lN9MH5JZMiLvMGtJTavPP6xb8x6AVAaZSQLPScRMR2CsYJMP1dG+ZFpcE4iN2PXwg6uKZ1d@lists.infradead.org
X-Gm-Message-State: AOJu0YxDt6eKgbao1Gn9b+hrKeX2qiHmCbihcRc2Tb3ELzr4Gk7UxKeU
	2VVqmffJJMGB+MRS35fv1R8rCFcwy7pF7pwWQHd+G+rJVQYOAo2y
X-Gm-Gg: ASbGncufF+NC7vhAJwCT4SYKiSw5pXsGla8BpoPubkWuHGJzMpcFLVMYRmIlwy10+dW
	Mw8TObhWDRmG84REb8Q+UFVkvSj+Z3nr98aOTkPan6tcxLCJK69fWJhnt0AXgB67tJtH/zqz8ph
	PRdNQLn+cwpWBmeikmwwUaCwNkqqnqJb8A0T/OlrkPC/PnbEF64OQB9gh0MiWyzUV30oh+5EDMp
	JNb13zatAk2PWxID7uVcDklLSIsv1q2FbUBoqp0HwLEncB9LPGh645HvF/usSMudRYSm8sEiSk0
	sA5tyh7YL4mHNWQiCA7nVT0CWDbtZA==
X-Google-Smtp-Source: AGHT+IG9t76dpjEFCQdDLx6ycmXDuEQ02DE+EnhOu+AEhkJ/qd7d7+aSme/4j39HQkmI44uCAwy+5w==
X-Received: by 2002:a17:902:db10:b0:216:7ee9:21ff with SMTP id d9443c01a7336-2177899ae0fmr107634975ad.49.1734011777022;
        Thu, 12 Dec 2024 05:56:17 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21669ca7be3sm53985785ad.234.2024.12.12.05.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 05:56:16 -0800 (PST)
Message-ID: <3fe75eab-e700-4ae2-984b-42342ec7d784@roeck-us.net>
Date: Thu, 12 Dec 2024 05:56:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: aspeed: replace mdelay with msleep
To: Phil Eichinger <phil@zankapfel.net>, wim@linux-watchdog.org,
 joel@jms.id.au, andrew@codeconstruct.com.au, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20241212113014.1075414-1-phil@zankapfel.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241212113014.1075414-1-phil@zankapfel.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_055618_166277_8AAC1048 
X-CRM114-Status: GOOD (  15.78  )
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

On 12/12/24 03:30, Phil Eichinger wrote:
> Since it is not called in an atomic context the mdelay function
> can be replaced with msleep to avoid busy wait.
> 
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>   drivers/watchdog/aspeed_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b4773a6aaf8c..98ef341408f7 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -208,7 +208,7 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>   	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
>   	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
>   
> -	mdelay(1000);
> +	msleep(1000);
>   
>   	return 0;
>   }
This is a _restart_ handler. The only purpose of the delay is to wait
for the reset to trigger. It is not supposed to sleep.

NACK.

Guenter




