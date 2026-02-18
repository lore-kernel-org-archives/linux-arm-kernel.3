Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E2CE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r0xdr1WGpCeGTUqLANRfTri1dCqx5zok5lpbzySRko=; b=OwLfEhAWACW7gzXzgtT7imCxda
	1X381prmMx1Rm5UESQYlZhQQxnNQukS2/LQpr0I5bzRQcwAs9I7ojtOBxPnb1rY33ftEWijrv99pW
	C5JCttwE3WT6s1iV3a7xVLq7nQNwIvXWLwW+pG/eXa/mc2FRryQeJqAFthmhk1SZWe1HhGm9PIOmm
	Y5mJsiK4kxZnkPsW/8pU5OUW/ex77jY7LWuMK4BAnXibaIuKJzSLdrwTIpj33iBoDafDFs/0WyyVO
	AkrjdS8vNKDStWX6ZlYHim2n8F+3GclutX8jfDtOdnaj1cDdvd8QAbwGP0Tcmke/aDjfi8A0m4kNm
	OuZis47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsckC-00000009Rrq-3N9O;
	Wed, 18 Feb 2026 08:17:12 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsckB-00000009RrE-0hX7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 08:17:12 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59e4993e00aso4624250e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 00:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771402629; x=1772007429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5r0xdr1WGpCeGTUqLANRfTri1dCqx5zok5lpbzySRko=;
        b=UnODEF6GzwTw9oViUozsd3g6lBjW9V1ovp7CKU/3pJjStWbjcpRx8uOnvIRjEVildU
         s25BuxLZb2QkUGsRvYEyR88OBkEgsulz2GHAuD3xUc/EHZsoSv4g3P6oQxJatVM35YP/
         DzBxZBU/Me5txldBjvJVCuJO13hqxeKru6W9PWUgokyYUZGYyKgDKxHMGWrpSXiSVuZT
         y1DYjqBQrMu8bY0vL8a13eSfnmMF3vWSBfHngzkUoVHNUb4RO7mUeOrUicjPnN7V5DwA
         LbYjUH7Q+PSbScs5mYJVTPQnmuK1EVP6BvpSYqO2fp2W/YzBjgkIRwwPuWwCTdVhNj1J
         8Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771402629; x=1772007429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5r0xdr1WGpCeGTUqLANRfTri1dCqx5zok5lpbzySRko=;
        b=l3R/UMuPkuiziRX8imOBYxSE9PUo0jSaKEGK1wyV7o4f9BTIfDuPus1Lk4kDnC5Rkz
         SabMyj2bdLB+0+5L37yAeV5qyTS/sU8owk/lEVLq5wVtaKIFBJfJgGNFsM7sVXQ5R7Pm
         YdVtHVJcrhQLaNplmVJoXjxzcr6ga9RkPFdPOdFUDfi1w2J+xXbFg4ykV2TehVmV8L6a
         q+vGzCZ+Iql1WjxDhHNVXY3slM7UPk7qbi/eFqW1s8aUdwpcc+xunrUgBmxpa0AStZc/
         0szo+DNu4Vbb1vkZNQA0eKMEdTI+TcPp+kZ0QelFP9brc8XxXYLRmTiHqGWIKfL4SriD
         87jg==
X-Forwarded-Encrypted: i=1; AJvYcCUkoRkPNh/PaGxYXoktuLnWX7XQK9EtcVIE4B2YaxcME+OIo+wMypqsO9mdSGF/GuRHDll9nmW1iDD8m+cYAV2n@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz7PG9GhYnU18LD/5O7XTHuwG6qI5q8n0oRUCQdJABeBZz0go8
	sKh5GL9qYpv9V1KoCTnRw7/uje2LWyI7GMAuXSUevJqfzia9c+k9oUp0
X-Gm-Gg: AZuq6aK253SQo83s6qGPMLcIAHLaENRyEIah5MIWCCnfW4yaSsyyHDwWGObf6K+Qdv2
	w9/CdMaWJjCs6b80poJjejcoMZcxg8eKKGeZEhVu4EkQeYnYRjf/JrsLJC6jUO4Do4lRvv+7pe3
	YKTqJ3AzaePqL2b6QGZgj+x4kIvq7ImosiWTr4J2TBtYsSTtIYGjCiL6GswGd899ovWUlzSExbW
	KocYum0KgEjyJ756MxhPl43FDBmgDBZIi3/TV/2miuROxefclj0Su8oNvO/jwnlfW0Hx+xkVTYA
	4BrlOmhhmuL12aSFzfsqYFJirQqmVy/6FOmhcWaxaHfpTqvL+yhFuxab6EequbHkc/u3LJlQ1yz
	wsUpax1T5LmVyFpszgJLSVsgPNwB9b2UZt56rr+CuBN5B5fnr6I94oHgToXMrreV8/fBuoJtMAE
	E3I5lPJEe9LXHcUf8XZRy2aJhp0Evup+rHa53lf4abqk1w2NBr07ssp2v5ZqSU7RkwL09YfnF+e
	FJzUEtifzQi+rALWYQ=
X-Received: by 2002:a05:6512:1150:b0:59e:6c24:3f91 with SMTP id 2adb3069b0e04-59f83bbcd19mr369556e87.34.1771402628519;
        Wed, 18 Feb 2026 00:17:08 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56867fsm4391846e87.24.2026.02.18.00.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 00:17:07 -0800 (PST)
Message-ID: <66dab64b-ca3e-4ae0-81d6-0500899757e5@gmail.com>
Date: Wed, 18 Feb 2026 10:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
To: Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
 <b1df24fd-bbb6-4991-be52-dc1ef694db25@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <b1df24fd-bbb6-4991-be52-dc1ef694db25@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_001711_234528_31663E49 
X-CRM114-Status: GOOD (  27.18  )
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

On 18/02/2026 03:45, Amit Sunil Dhamne wrote:
> 
> On 2/16/26 5:58 AM, Matti Vaittinen wrote:
>> On 14/02/2026 05:12, Amit Sunil Dhamne via B4 Relay wrote:
>>> From: Amit Sunil Dhamne <amitsd@google.com>

// snip

>>> --- a/lib/linear_ranges.c
>>> +++ b/lib/linear_ranges.c
>>> @@ -241,6 +241,42 @@ int linear_range_get_selector_high(const struct 
>>> linear_range *r,
>>>   }
>>>   EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
>>>   +/**
>>> + * linear_range_get_selector_high_array - return linear range 
>>> selector for value
>>> + * @r:        pointer to array of linear ranges where selector is 
>>> looked from
>>> + * @ranges:    amount of ranges to scan from array
>>> + * @val:    value for which the selector is searched
>>> + * @selector:    address where found selector value is updated
>>> + * @found:    flag to indicate that given value was in the range
>>> + *
>>> + * Scan array of ranges for selector for which range value matches 
>>> given
>>> + * input value. Value is matching if it is equal or higher than 
>>> given value
>>> + * If given value is found to be in a range scanning is stopped and 
>>> @found is
>>> + * set true. If a range with values greater than given value is found
>>> + * but the range min is being greater than given value, then the 
>>> range's
>>> + * lowest selector is updated to @selector and scanning is stopped.
>>
>> Is there a reason why the scanning is stopped here? What ensures that 
>> the rest of the ranges wouldn't contain a better match?
>>
>> The logic is now different from the 
>> linear_range_get_selector_low_array(), and I would like to understand 
>> why? It'd be nice if these APIs were 'symmetric' to avoid confusion. 
>> Hence, I would like to know rationale behind making them different.
> 
> 
> The rationale for this being asymmetric is to find the tightest upper 
> bound for `value` < minimum value across the linear range array.
> 
> To better illustrate this with an example. I have 2 entries in the 
> linear range array [ [4, 8], [11, 15] ]. Let's assume I pass a value of 
> "2".
> 
> Based on my current approach, the call to get_selector_high() would 
> successfully return with `found`=false and a selector value 
> corresponding to "4".
> 
> However, if I continued to search, I would end up the selector 
> corresponding to "11". A selector corresponding to "4" is much closer/ 
> tighter than "2".
> 
> For values higher than the highest value in any range, this would keep 
> iterating and end up returning an -EINVAL.
> 
> For in range values this would work as expected.
> 
> This implementation assumes that the linear ranges are provided in 
> sorted order, an assumption that I believe already underlies the 
> existing *_low_array() logic.

Ah. I think ... I didn't think. :)

It definitely makes sense to stop scanning if the range_min already was 
greater than the given target value. Thanks for the patience and for 
adding this missing piece :)

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

