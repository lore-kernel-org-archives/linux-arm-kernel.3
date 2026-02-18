Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AB1E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 20:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruwMDgtbpwkbLzJMSDs2l3vNnZLc2ZiEeFBqv+MGVhg=; b=oMZtJlSbpHcWNBz5y8KdZC3T5T
	0im4NPRInQl+Qovd8fBRycFeLUp4Guk9YxnabLWeM3FncINMQpqcJiQTZv2VVtcjlyVthASyOGi4j
	MUjPkEh+lxiS251jSPGl8UuLS7kQFlXi304tYbOSDZ6yW4Fb1L4dv1HA46z2GDXk9N0rcDIM8wxPE
	8fEFqv44gPWczapC4mePwWipTCzDgtqI7ehwvOGAzhabZ8yTOwOOvyrV3O9a9VTqC0P+b5vq6dnBf
	6A3RMjzL/qBo2GfCnpGXrRh8aiv7ZG8RNKLUy5pWUP2rrq8TcItN3+rbDaBDvMneqstlssd/hEy1A
	G+J4moIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnnn-0000000AM0L-2Azt;
	Wed, 18 Feb 2026 20:05:39 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnnk-0000000ALzz-2fo0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 20:05:37 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2b86671f87eso356361eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 12:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771445136; x=1772049936; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruwMDgtbpwkbLzJMSDs2l3vNnZLc2ZiEeFBqv+MGVhg=;
        b=AL9kUfdTCAsTD3BesTZjG1zNXdI0rIsk6TqBEFvs9T6J4o0vsrA2hrAXrQSsaTpel9
         W93cD7Sbf+epUe/BclFm5ya7COShhaB5firzaL9cmwq5do5YfYByacz+JXahyk9IgN+f
         qQmxL2xpm1y8M7hyB0Ct2jnkp50UnQuI/UziqZxiD3fcMpsTU3+kxRN7LRiYtf42/PYq
         6sRkzM3yHd4jsVxgk5bQZjxOMdvqMk1tzfnRBtLSMlry5u3iuevcm96OlcIdW0xPkIAI
         w+oTqhOGp3iFbMfP+pZum5Tg6fj4/drWBEEVsVMNafw+lEye970iwTlNJOf0fwfFfhSJ
         hF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771445136; x=1772049936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruwMDgtbpwkbLzJMSDs2l3vNnZLc2ZiEeFBqv+MGVhg=;
        b=EIM8deBJnoKDmk68qCBCv8hnMq1Xu7+8PPsnHnuyjlrrRWVwDcB1+HOvAG7D81dAWD
         aDsxcvXQ5sonoVGZr7R/ams1+69W+Hse2RdQX+5EIrCtxLEtICGyYeMvO1Jj17qQkAYK
         G9lQ2ipSRGh+ADNYFdLaWgNBvcB6rwQT2OTGiajgS/8CsPAFPmgpl7SHkJA33pLA8AC+
         UeEmX+64qXg+F15E6TKfyiDUGzrcIu9PU4zgBXtYgcEZiM4ajxMpUz2e81WeNLVEA9Zw
         S4Zmis1nzo0wlTTgwSIIF+RlWRv1F4st0nzw5AqQ0mzak5AwY/s+zbyxleFHP42efCII
         awWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQQTkYBVA6ef3nuMdg5w3bqLVeTORzWdgAsVa+GN+0ixJXhy0r9MTMe1dMcG72gsSjW3+vk3qyPhHsWEsiw2t5@lists.infradead.org
X-Gm-Message-State: AOJu0YwDcXa00q9pQUdD4kL98kbs1x4q3TvuKhKVMD9DJdCV0QjETM15
	TIXXseJnHMiDF5tNPLaRHcF/j65xtMWo49owWIra/XTufe3Y8d3dLiDaoy5CbsRwFQ==
X-Gm-Gg: AZuq6aJq5zX9PNHPE0wcbkuPSsq/CT9tZafgTH+8OEAxAy3MzB5YpR7OPfl8cMje3Vj
	66hW0hrS0oPNAXCEmF0vTIAOcZUB3hcQCt8XqRqiXnU75yLwi9TQwed+MMQ2ojT/Kla7suMd07Q
	oafH6WzpmLG+YMRoEWq0ikmYux2s6xCe2AnMmIjY/9QTZEyH/FCkC6TZVKqIxMJeXuGGincuMNc
	CGCr2iRIgtkx0goiCHV4l9NPGrfMt4wD2RkdyADPWrA2M5EWWq7Ok/vuiEE0IfheZxlTxRHQmmv
	5wM0zw1bgAYHuCSh2rHgmQ6tIDLycUrZ8oj42rPfxHY1wRY8Br89rfQPAJq/PICJ9EigwAXzL/X
	5q8L7yXq1E39imua6D2b3TZITvc5ItfyoaIrJiKsfVVrXKzC2RZW8W4gLAat7ukrm2LsMTRC4Mm
	sqnvUWEyl1bxubcYgxHbKUm6ODfvlrfMG4jwiEMeNtvObtPwOVOjWQUcpMVez9myTN7cDlLAxb0
	PEgOYolajy7h1SY87Gsdw5NmA==
X-Received: by 2002:a05:7301:100e:b0:2ba:a04a:8353 with SMTP id 5a478bee46e88-2babc44eb66mr9413193eec.27.1771445135121;
        Wed, 18 Feb 2026 12:05:35 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c8f1:53bf:725c:563b? ([2a00:79e0:2e7c:8:c8f1:53bf:725c:563b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543e8dsm19410069eec.5.2026.02.18.12.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 12:05:34 -0800 (PST)
Message-ID: <e9a353aa-1194-4c87-b902-c533e52c264e@google.com>
Date: Wed, 18 Feb 2026 12:05:32 -0800
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
 <b1df24fd-bbb6-4991-be52-dc1ef694db25@google.com>
 <66dab64b-ca3e-4ae0-81d6-0500899757e5@gmail.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <66dab64b-ca3e-4ae0-81d6-0500899757e5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_120536_686778_C9BF06A6 
X-CRM114-Status: GOOD (  25.38  )
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


On 2/18/26 12:17 AM, Matti Vaittinen wrote:
> On 18/02/2026 03:45, Amit Sunil Dhamne wrote:
>>
>> On 2/16/26 5:58 AM, Matti Vaittinen wrote:
>>> On 14/02/2026 05:12, Amit Sunil Dhamne via B4 Relay wrote:
>>>> From: Amit Sunil Dhamne <amitsd@google.com>
>
> // snip
>
>>>> --- a/lib/linear_ranges.c
>>>> +++ b/lib/linear_ranges.c
>>>> @@ -241,6 +241,42 @@ int linear_range_get_selector_high(const 
>>>> struct linear_range *r,
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
>>>>   +/**
>>>> + * linear_range_get_selector_high_array - return linear range 
>>>> selector for value
>>>> + * @r:        pointer to array of linear ranges where selector is 
>>>> looked from
>>>> + * @ranges:    amount of ranges to scan from array
>>>> + * @val:    value for which the selector is searched
>>>> + * @selector:    address where found selector value is updated
>>>> + * @found:    flag to indicate that given value was in the range
>>>> + *
>>>> + * Scan array of ranges for selector for which range value matches 
>>>> given
>>>> + * input value. Value is matching if it is equal or higher than 
>>>> given value
>>>> + * If given value is found to be in a range scanning is stopped 
>>>> and @found is
>>>> + * set true. If a range with values greater than given value is found
>>>> + * but the range min is being greater than given value, then the 
>>>> range's
>>>> + * lowest selector is updated to @selector and scanning is stopped.
>>>
>>> Is there a reason why the scanning is stopped here? What ensures 
>>> that the rest of the ranges wouldn't contain a better match?
>>>
>>> The logic is now different from the 
>>> linear_range_get_selector_low_array(), and I would like to 
>>> understand why? It'd be nice if these APIs were 'symmetric' to avoid 
>>> confusion. Hence, I would like to know rationale behind making them 
>>> different.
>>
>>
>> The rationale for this being asymmetric is to find the tightest upper 
>> bound for `value` < minimum value across the linear range array.
>>
>> To better illustrate this with an example. I have 2 entries in the 
>> linear range array [ [4, 8], [11, 15] ]. Let's assume I pass a value 
>> of "2".
>>
>> Based on my current approach, the call to get_selector_high() would 
>> successfully return with `found`=false and a selector value 
>> corresponding to "4".
>>
>> However, if I continued to search, I would end up the selector 
>> corresponding to "11". A selector corresponding to "4" is much 
>> closer/ tighter than "2".
>>
>> For values higher than the highest value in any range, this would 
>> keep iterating and end up returning an -EINVAL.
>>
>> For in range values this would work as expected.
>>
>> This implementation assumes that the linear ranges are provided in 
>> sorted order, an assumption that I believe already underlies the 
>> existing *_low_array() logic.
>
> Ah. I think ... I didn't think. :)
>
> It definitely makes sense to stop scanning if the range_min already 
> was greater than the given target value. Thanks for the patience and 
> for adding this missing piece :)
>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


Thanks for the review! :)


Regards,

Amit

>
>
> ---
> Matti Vaittinen
> Linux kernel developer at ROHM Semiconductors
> Oulu Finland
>
> ~~ When things go utterly wrong vim users can always type :help! ~~

