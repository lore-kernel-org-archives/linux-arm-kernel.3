Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44F2CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 02:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDqYEEUd2xJtmq5d3RcJIE6f0InLIvSKDj5hsY/X7po=; b=SQAahfX1pPdbJLkKPcb75fXloT
	JGsAQwG0I6OkJkPYxy6zVvqizczdTIF/bbUqjgSXVIsFx4C/ehJbnxxsvUCgTqfw0fsUjMvqpwQDd
	lHnCjamq/4eODn4k0Nb5ge2bfJqqZTyc9RKOoJ3TMXJXLoUPM7SanOAscjBOSMyRYQFqJ5aAfMrMo
	A4ds/VGdF+i1PIyQn79k5Six2hCa9vQTXD2jZhJbpyzmDwmpavtaSWCrcNsVKC7rnjKc2+rUsfdtZ
	WKo7ra0Ba4SiUMDgIOpLWyApWsF9bZIhP8q+HftRd9G4P/siC+QcPgWAcPVbdZ1mN4bRZ1W35GaXS
	w/FzNumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWSO-00000003HtH-0uh9;
	Wed, 20 May 2026 02:14:48 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWSL-00000003Hsq-3I2C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 02:14:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-36900945df5so2115712a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 19:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779243284; x=1779848084; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDqYEEUd2xJtmq5d3RcJIE6f0InLIvSKDj5hsY/X7po=;
        b=BfZr4TK358IRz6iXBj0isUSAZmxtAwIGHWDwlIOjPP90mkZvk23DsOf7ay+haCfCEe
         kdSQJvLSpGquDz/q5bY7vvBEyLUKd7oCcrOYNrY8fgueZLatjnrkIRFWIJOom9DzJN1b
         z9xr98PBKHhi0iqKqAHBP5wBZdLUzIJeQknVMpJdpqkuk3O/8zVMZYAewtbUN5ITVpmW
         Z2aXscuGI2TeaA3B9v/99j/wc1viIdTo+qQ1R6etU6vXZB7vPZ6pND2rpLC4KM1z0Z8Y
         N6OxOH3X+KJBKVMrIxkZVILVcxfOFImTUiyEdzc8Mgfdn6k0dXeBnC/T/FXe7SJrqloL
         7Vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779243284; x=1779848084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDqYEEUd2xJtmq5d3RcJIE6f0InLIvSKDj5hsY/X7po=;
        b=fWbz/QEU2N3QbdChnnO5xInpleH0dTHevVkTJ4CDDvwWMe89m5aeeer2waf2azcWcl
         sxSiGN4LCv2hMCllVVD17dmq37Rfv4BuMoYgRbJbQATe3gy9DHnQTss74s+M+AwWovJX
         qGMd8Q21etAcgx4dmYVTmPPzuglI89p+Ht8L5X8+KOpUsk1FfWJAj/fg0hlMRYqR4Gfd
         1PLvHJVBV/TKsepYqT9EyN2wiBg4pGGr97dT4UDicJWvJfcBCoKIPG3c87Xq13RDIB+H
         YJ646ZJKQ34iikNdbRKR259RaFpVK8LwCXIy/vYed5bXJqXKxM+RESzHb2jVyDu4Uv+Z
         RCKA==
X-Forwarded-Encrypted: i=1; AFNElJ8s0PX2M6FDdwc4Ulr269XRIiTVv6i4K5G3WHPh8ygz3Vo9E3W0b4/gv4FQod0MnnOv+GhGDEHBG8IspO2BEJYN@lists.infradead.org
X-Gm-Message-State: AOJu0YzNZXAi3cnsTCEauNdyXKYoFBAtJGwjnnTo/oxQ5cpwNMXh67Rp
	7wilagovobfpFOQAb4Kvyf4XW2ThRdD2fTcyocmxj6LeqmLC3ZoykpfFNy9OiQ==
X-Gm-Gg: Acq92OEUxOhbQTiF0zDmiDLHDuCl5waLeiIswUlegzl39qjPIO557B4A+RT/pprbh7J
	qc6RE2+z/A5zqQ6l/pboQDMN0oDkw2BDsloJRDDbdvfFfe+Mgn9mUt98cuzmeWZlVZ4K3RSa1Dm
	fTFxfpbD6qTmm3gDUXRJg+1bt6nWYYDvuxuKzB+DO7K5yVe99ccIJpb1fqAbczx6vPuXoBn3GWF
	SG4OjpGFsum3QUc7R+ufM+XWDrlTpSo7kgcytgYz6gC7waldGPb9JiUlaJOlHwE4FbkmP7Wr8mQ
	wpfyzHKYjwQRfY+z7V/UzH9Ypd3he253Uc5xlz5YwlAp+qXj4nWZKY6p9kLBkgfY6YPuyXo0P35
	7ki9ShkJlb44sU1+EH7YC9Nx180foCL0TFCaN5G7XB85vrE3rni0r3JgZ9IgTKEKSPVBUtmhBsG
	9yS2ARcaze5goGoD8hx1XN87p2gmUG7RfRxZou5RhetiPvRa/SaJMsJYhkgjJ2PGfUlVYhdbnzi
	dO6
X-Received: by 2002:a17:90b:4a03:b0:369:7003:4e30 with SMTP id 98e67ed59e1d1-36970035860mr16664323a91.15.1779243284521;
        Tue, 19 May 2026 19:14:44 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369c4bb4d4dsm4170018a91.1.2026.05.19.19.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 19:14:44 -0700 (PDT)
Message-ID: <2a49734a-c4e7-4818-a024-6c944af93020@gmail.com>
Date: Wed, 20 May 2026 10:14:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field
 width and fractional calc
To: Brian Masney <bmasney@redhat.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513055626.1070533-1-a0987203069@gmail.com>
 <20260513055626.1070533-3-a0987203069@gmail.com>
 <agx5gTfaByMNjkX4@redhat.com>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <agx5gTfaByMNjkX4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_191445_834019_17479D15 
X-CRM114-Status: GOOD (  18.88  )
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


On 5/19/2026 10:53 PM, Brian Masney wrote:
> Hi Joey,
>
> On Wed, May 13, 2026 at 01:56:25PM +0800, Joey Lu wrote:
>> PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
>> The hardware fractional field occupies bits [31:8] (24 bits), so the
>> mask must be GENMASK(31, 8).
>>
>> The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
>> as the denominator to obtain 2 decimal places.  With the corrected 24-bit
>> mask the old divisor is wrong; replace the arithmetic with a proper
>> 24-bit fixed-point rounding to 3 decimal places:
>>
>>    n_frac = n * 1000 + (x * 1000 + 500) >> 24
>>
>> The +500 term provides round-to-nearest before the right shift.
>>
>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/clk/nuvoton/clk-ma35d1-pll.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> index bfedd45bd04b..7e6b30d20c01 100644
>> --- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> @@ -48,7 +48,7 @@
>>   #define PLL_CTL1_PD		BIT(0)
>>   #define PLL_CTL1_BP		BIT(1)
>>   #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
>> -#define PLL_CTL1_FRAC		GENMASK(31, 24)
>> +#define PLL_CTL1_FRAC		GENMASK(31, 8)
>>   #define PLL_CTL2_SLOPE		GENMASK(23, 0)
>>   
>>   #define INDIV_MIN		1
>> @@ -113,9 +113,9 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
>>   		pll_freq = div_u64(pll_freq, m * p);
>>   	} else {
>>   		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
>> -		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
>> -		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
>> -		pll_freq = div_u64(parent_rate * n, 100 * m * p);
>> +		/* x is 24-bit fractional part, convert to 3 decimal digits */
>> +		n = n * 1000 + (u32)(((u64)x * 1000 + 500) >> 24);
>                                             ^^^^^^^^^^^^^^^^^^^^^
> You should be able to use DIV_ROUND_CLOSEST_ULL() here.
>
> Brian

Thanks for the suggestion! I'll update this to use DIV_ROUND_CLOSEST_ULL 
in the next version.

BR, Joey

>
>> +		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
>>   	}
>>   	return pll_freq;
>>   }
>> -- 
>> 2.43.0
>>

