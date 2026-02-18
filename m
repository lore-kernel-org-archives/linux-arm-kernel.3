Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7A5E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 01:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzRez6id0tGCW3l1fRGMuvRJWCHYhvgSDSCiIHHHPic=; b=pGpSkDPNGsqAEeIsOtLSCc0kNl
	0jk722z5J6oIPbwFCxbW2RvOmMbYs+fNUMkV3EumZh5oVTxuXMKRG0gAf5EeSCEOKrx+ilxMAyUGC
	gljUG7f2vfZIDXkJmg7XWcBw9InwXsgCXhy1C5l4cONGBqB1c082DdBocEIZdMJueSa3A3ItF5CuW
	eF65qVmRZpoHKAajp19HvX5jrQmEE+gYLIJM8QdBRdgtfvHW/GffiT5lzG2iYjnQqOuvjtUCab/W4
	FQKeauJhZA/7aCaTEYQd/qX85cjo2R+9ZmDJdbKot1UA9FDqPaIMFr9yVaatCdRhAE5cCq9uj9k9r
	an3oDWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsWdQ-000000099Kd-3bLG;
	Wed, 18 Feb 2026 01:45:48 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsWdN-000000099Jl-3EtE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 01:45:47 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso4831605eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 17:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771379144; x=1771983944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzRez6id0tGCW3l1fRGMuvRJWCHYhvgSDSCiIHHHPic=;
        b=ThZXauhYuu6rkl5yb9dL95T/LZGUTjWADmh9z2qdN7wfuGxdSbQn/8n6sMVhJkX1rM
         uJnxzmXPGk9sUMALFnp+F5wlrzasZtcMiKhaf4KpNZhvczDzIg5wT7V/KARcXqJ3GKaQ
         Oz9IDWBM7ewNE3bDSkRkyFoCOjjwEI+ujK4OWZAEbocM9/ZSHpL651z6IrHCBPgAPcHm
         b/dLPJhPTcl1IG2lfppwwRQzdiTx6rCbjn9HsWiYpggqmOr05+9iEDROL7GDq5EmJOC3
         jxC+eQQm9gfFjWG3pDKWcgNcgJAPMhzgCgBPxksz77RPONuYesKek5EHxOFsEggFiKzy
         J4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771379144; x=1771983944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzRez6id0tGCW3l1fRGMuvRJWCHYhvgSDSCiIHHHPic=;
        b=t/xgCUeq4m4iBcv9eocnhZTrwQy1x8ZP/R8M9KDKF9ofvX4LX5+rnN8kI0THFZSTbS
         P9d++bYkX7WlrArim+9Qoh2iCLreiLJXaG2UDmLJ8Cf90hBe47Y0z2FqflenBk17yyju
         47dz67pSGOnq+Z5G4edp7J3EBj972cYAxiRpl3S/VEPid/H+XfVX91ZDFwpKm9pNai8p
         OChcpFEN2ZPjutQQhXfIia1i50s3/Wst7iGHqTmzTjfU81yLMEAxlZAuRNZonGMLDecy
         NhMo/NKBzk1GWu4gCsZ78aL34mwWmYni7v3r8Qq0Oa+7gkAR4ZkUdp1XiQGClyn0GKlu
         QNHw==
X-Forwarded-Encrypted: i=1; AJvYcCVEHsU5Mim5IIyySCAs8HfSOSZhzBPmTG94Yn9aW9jrlz++yOLks6zWL6sYZ1yvuhW5ARk+s7B9ZAbkS7hzKED9@lists.infradead.org
X-Gm-Message-State: AOJu0YxJaklY+xM5ja8bYmiAclYzPOgfEoyO7FUFQVjBfFI/Lo4p+0Xq
	gYg3EWoV1/6LnmOCpwQ6zw397nW7uCayJd8zDepgsoU7plWOkK1iGug+Pk4d5pPajQ==
X-Gm-Gg: AZuq6aIbCNYmeW6THwb0X8i4kSdNY4YP2FEAoxDxplr8nqhYpPbWQE55nB2AftsnGiY
	5Ja0I3ru2ItTw5HxtD6NiLykL3UUrEmzkkNsnBjADTX3ri6dASLGgHx4muUyh7z73tIvfX1zMMP
	wTFMKdbZz+GpUzVelm3zdwXX90UhWFEamoRqd+c8rTweZvY7B33ao5T63FiEIcyJ12z15TOWV36
	PnT0Kap9yf8y+TgSvkY8ODP0Zf93HfhUQOezufx0ffBUcuLbsjC4q2M6oCWqieqapCdSp8yOOmm
	UfoD3dk6dk5XkAZ/FmFPAP3sde48lj45fAgICJv/NShapAFY5NKDDGDzYQaGRu2/NoZLSE8UCmC
	GEuTwkVt9ZLvP7rXSZjw8gANQsTlT+eUgN7dfydYd6qMddZQnwEbmiXFccgLnCTp6jin75xGnIf
	CtVIdGWcw8uHp1dICLznIPOj+Lu5kDztUd1QlTF1nLT3WmWhcy6sheH36e0ll2NKDxttzRL+ruk
	cQXP4fsu4u06JNQ3KQDI83p8Q==
X-Received: by 2002:a05:7301:2b06:b0:2ba:964f:fa67 with SMTP id 5a478bee46e88-2bac97ad329mr5688952eec.24.1771379143326;
        Tue, 17 Feb 2026 17:45:43 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c8f1:53bf:725c:563b? ([2a00:79e0:2e7c:8:c8f1:53bf:725c:563b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cba192sm15951817c88.13.2026.02.17.17.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 17:45:42 -0800 (PST)
Message-ID: <b1df24fd-bbb6-4991-be52-dc1ef694db25@google.com>
Date: Tue, 17 Feb 2026 17:45:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20260214-max77759-charger-v6-0-28c09bda74b4@google.com>
 <20260214-max77759-charger-v6-4-28c09bda74b4@google.com>
 <5d889f66-7697-4a39-beed-33ace693a1ef@gmail.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <5d889f66-7697-4a39-beed-33ace693a1ef@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_174545_819913_AB0C269F 
X-CRM114-Status: GOOD (  31.20  )
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


On 2/16/26 5:58 AM, Matti Vaittinen wrote:
> On 14/02/2026 05:12, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add a helper function to find the selector for a given value in a linear
>> range array. The selector should be such that the value it represents
>> should be higher or equal to the given value.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   include/linux/linear_range.h |  3 +++
>>   lib/linear_ranges.c          | 36 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 39 insertions(+)
>>
>> diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
>> index 2e4f4c3539c0..0f3037f1a94f 100644
>> --- a/include/linux/linear_range.h
>> +++ b/include/linux/linear_range.h
>> @@ -57,5 +57,8 @@ void linear_range_get_selector_within(const struct 
>> linear_range *r,
>>   int linear_range_get_selector_low_array(const struct linear_range *r,
>>                       int ranges, unsigned int val,
>>                       unsigned int *selector, bool *found);
>> +int linear_range_get_selector_high_array(const struct linear_range *r,
>> +                     int ranges, unsigned int val,
>> +                     unsigned int *selector, bool *found);
>>     #endif
>> diff --git a/lib/linear_ranges.c b/lib/linear_ranges.c
>> index a1a7dfa881de..c85583678f6b 100644
>> --- a/lib/linear_ranges.c
>> +++ b/lib/linear_ranges.c
>> @@ -241,6 +241,42 @@ int linear_range_get_selector_high(const struct 
>> linear_range *r,
>>   }
>>   EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
>>   +/**
>> + * linear_range_get_selector_high_array - return linear range 
>> selector for value
>> + * @r:        pointer to array of linear ranges where selector is 
>> looked from
>> + * @ranges:    amount of ranges to scan from array
>> + * @val:    value for which the selector is searched
>> + * @selector:    address where found selector value is updated
>> + * @found:    flag to indicate that given value was in the range
>> + *
>> + * Scan array of ranges for selector for which range value matches 
>> given
>> + * input value. Value is matching if it is equal or higher than 
>> given value
>> + * If given value is found to be in a range scanning is stopped and 
>> @found is
>> + * set true. If a range with values greater than given value is found
>> + * but the range min is being greater than given value, then the 
>> range's
>> + * lowest selector is updated to @selector and scanning is stopped.
>
> Is there a reason why the scanning is stopped here? What ensures that 
> the rest of the ranges wouldn't contain a better match?
>
> The logic is now different from the 
> linear_range_get_selector_low_array(), and I would like to understand 
> why? It'd be nice if these APIs were 'symmetric' to avoid confusion. 
> Hence, I would like to know rationale behind making them different.


The rationale for this being asymmetric is to find the tightest upper 
bound for `value` < minimum value across the linear range array.

To better illustrate this with an example. I have 2 entries in the 
linear range array [ [4, 8], [11, 15] ]. Let's assume I pass a value of "2".

Based on my current approach, the call to get_selector_high() would 
successfully return with `found`=false and a selector value 
corresponding to "4".

However, if I continued to search, I would end up the selector 
corresponding to "11". A selector corresponding to "4" is much 
closer/tighter than "2".

For values higher than the highest value in any range, this would keep 
iterating and end up returning an -EINVAL.

For in range values this would work as expected.

This implementation assumes that the linear ranges are provided in 
sorted order, an assumption that I believe already underlies the 
existing *_low_array() logic.


Regards,

Amit

>
>> + *
>> + * Return: 0 on success, -EINVAL if range array is invalid or does 
>> not contain
>> + * range with a value greater or equal to given value
>> + */
>> +int linear_range_get_selector_high_array(const struct linear_range *r,
>> +                     int ranges, unsigned int val,
>> +                     unsigned int *selector, bool *found)
>> +{
>> +    int i;
>> +    int ret;
>> +
>> +    for (i = 0; i < ranges; i++) {
>> +        ret = linear_range_get_selector_high(&r[i], val, selector,
>> +                             found);
>> +        if (!ret)
>> +            return 0;
>> +    }
>> +
>> +    return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(linear_range_get_selector_high_array);
>> +
>>   /**
>>    * linear_range_get_selector_within - return linear range selector 
>> for value
>>    * @r:        pointer to linear range where selector is looked from
>>
>
>

