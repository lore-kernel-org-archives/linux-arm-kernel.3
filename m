Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B5BC36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlcZn0CPj7R0ttEruwhiQMdrF075DvIb6xYHf7nikhA=; b=AzSIctRnBY5ZeBKdmCqs7EuVCi
	NGloVSdKH7LoEE49+95AlgDmKDNAqPy4JUd6tHo6EWPJ6UPx3QJ1c+YblQoEsX/EZoZrO7dfr/pHv
	eCpp3rtnb+S9VfZ1y2BI1lu6iFnMHVtEPCArIRtR3DvCXu1nUDppnO9Y5PMEEyuSb9WF0/fAkCMUa
	BQQCX8Zgtj5gF/JgwD+sRhxXEhoUNslVjfi5l/l1djOdC2h2wTaOBwZeArDEwJedaW+o1Cd0wABoy
	u3YRi156Conoy9KKInX59y29ypRqmxVT9WqU3Jvb8BDtujucCHKb3Sd42tJZ0upEFDISO9QvpYWQR
	8hKRb9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Kem-00000005ZlT-25vM;
	Mon, 28 Apr 2025 09:20:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KIA-00000005WuM-2p8t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:56:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso30360975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 01:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745830604; x=1746435404; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlcZn0CPj7R0ttEruwhiQMdrF075DvIb6xYHf7nikhA=;
        b=e571KDmwP7P7At/LYqay9IxSRSo6/dF+xv19hk39rCgGwBGlVj9hZJM4A4WGJvN4JD
         XWigTiFTDx6TRwq7A3PFgU7ESKK7nOHiNAfOPup2QCM+QXdxUSGUyZ5ew1Kp8jRX3a7s
         5It5ZYwWpxsG4/qeG+AMHwDxoFCyXeswbHBosTRp2A6NqvCSmgVZg+/9l+V0dgr4sOMC
         Twd28BCC8RbKSJKFPeL/gfm6H1Tmqh0u/wFoV9ceO2MEiKUxOqOB+3AEmAry0yPoK+ND
         6EhKAr+7w3tpZrp6W2WfnjEvKx/SOEoqDRh4JcgUFfMbd1+f6IL+3oi777muVE9O3ZZy
         ITXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745830604; x=1746435404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlcZn0CPj7R0ttEruwhiQMdrF075DvIb6xYHf7nikhA=;
        b=WaNDnLWEltbZX073bYdlg8FFuol/3K8TIh2LMOgXSrk/wpGMsP8mcL7mpei1rGTcii
         YxOLzJm9khVCuEFP9asbpa3yqk79sxX1I+eTODw6+g/R4tHchA4gx4sKgXPB9/DGOgQl
         9/2pyoDdZJW8VtCES6khdTArYmaoxawBQK0aVYafXZsPTaN241U/ngsxg3+bhGZzM5kw
         K6JOZuAAxBYKd4fgilIGZ91b6XZHB/OJAJ9dlPovqs0fli+h75jR6A66ftdSb45owGno
         lj1S5ejfwsMnoCgGGAsXigaSBPS3IpPDM2/F80mKT/CRb0qVt+4WPNjOtfN7ruMI2NWt
         BGTg==
X-Forwarded-Encrypted: i=1; AJvYcCVwkgUwdkb8BVqaJX+R6GmoiMQa9hAJDqB1QJL3UY2QcoFy83zmiG25q5KHhQNCS92XMStVfMJjkWnXcEX4C4tb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx34CJHvBIEu+4ZZnPhoz7xO69J/N83ZhmjXq4mL1yC91hH1IIs
	FyivuvVOjseOtoFgoF6erQs5Vroc9Y36t4AWFYL7pjXT8vUWQDuQpwrHywYqsi0=
X-Gm-Gg: ASbGncsn223CSM8bWIStKdjLKooRv4YqjTN3lUgEdJAOiIkvyYvlcqF+eWZWHexi7Ft
	BB0L/5TkPqwTwoBLjFdKNa917g/p2S9JmKHU0X+5HkzbaTHV4z+6Ak/+6Zr5Wa55awpCmM6PFr4
	JlOLdOjZW57Ll5W9vUWb6ZmeX9jVJ9ESLYHEtGgswYt72Lnp7/ZnJlbK1BZkOqOP+bw3n5fElc4
	4OBU4FM7WNQkSZFL/gnzvDR036gPyBC6ZW42lADsCdXctSiz/Gw4cg0StelOsEuGdUkdSe8mJ8X
	DBWl2pDwKVzUY4yqNt1jlARzB/3jC0Rk3D6gkCL5lLs=
X-Google-Smtp-Source: AGHT+IGu1qPPHs8pclY4hh3uvAZNqEG6T4suIydOxG89FHHVlJPyRkl6PrbVo2UzUBPlfWOSb+09bQ==
X-Received: by 2002:a05:600c:1e04:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-440ab848c1amr63152085e9.22.1745830604497;
        Mon, 28 Apr 2025 01:56:44 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a538f4e3sm116621855e9.36.2025.04.28.01.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 01:56:44 -0700 (PDT)
Message-ID: <f03715ac-a4ac-415d-8daa-1914384319fb@linaro.org>
Date: Mon, 28 Apr 2025 09:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf: Allow non-contiguous AUX buffer pages via PMU
 capability
To: Yabin Cui <yabinc@google.com>, Leo Yan <leo.yan@arm.com>,
 Ingo Molnar <mingo@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Liang Kan <kan.liang@linux.intel.com>
References: <20250421215818.3800081-1-yabinc@google.com>
 <20250421215818.3800081-2-yabinc@google.com>
 <48640298-effa-42d4-9137-a18a51637f03@linaro.org>
 <aAeQcgmL-iqGbG_g@gmail.com> <20250422141026.GH28953@e132581.arm.com>
 <CALJ9ZPNLgEBxOmDim-vztUknEETwdL-Z2gJ8K9s44TiPgKZgHg@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CALJ9ZPNLgEBxOmDim-vztUknEETwdL-Z2gJ8K9s44TiPgKZgHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_015646_726168_5159E61D 
X-CRM114-Status: GOOD (  28.62  )
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



On 23/04/2025 8:52 pm, Yabin Cui wrote:
> On Tue, Apr 22, 2025 at 7:10 AM Leo Yan <leo.yan@arm.com> wrote:
>>
>> On Tue, Apr 22, 2025 at 02:49:54PM +0200, Ingo Molnar wrote:
>>
>> [...]
>>
>>>> Hi Yabin,
>>>>
>>>> I was wondering if this is just the opposite of
>>>> PERF_PMU_CAP_AUX_NO_SG, and that order 0 should be used by default
>>>> for all devices to solve the issue you describe. Because we already
>>>> have PERF_PMU_CAP_AUX_NO_SG for devices that need contiguous pages.
>>>> Then I found commit 5768402fd9c6 ("perf/ring_buffer: Use high order
>>>> allocations for AUX buffers optimistically") that explains that the
>>>> current allocation strategy is an optimization.
>>>>
>>>> Your change seems to decide that for certain devices we want to
>>>> optimize for fragmentation rather than performance. If these are
>>>> rarely used features specifically when looking at performance should
>>>> we not continue to optimize for performance? Or at least make it user
>>>> configurable?
>>>
>>> So there seems to be 3 categories:
>>>
>>>   - 1) Must have physically contiguous AUX buffers, it's a hardware ABI.
>>>        (PERF_PMU_CAP_AUX_NO_SG for Intel BTS and PT.)
>>>
>>>   - 2) Would be nice to have continguous AUX buffers, for a bit more
>>>        performance.
>>>
>>>   - 3) Doesn't really care.
>>>
>>> So we do have #1, and it appears Yabin's usecase is #3?
> 
> Yes, in my usecase, I care much more about MM-friendly than a little potential
> performance when using PMU. It's not a rarely used feature. On Android, we
> collect ETM data periodically on internal user devices for AutoFDO optimization
> (for both userspace libraries and the kernel). Allocating a large
> chunk of contiguous
> AUX pages (4M for each CPU) periodically is almost unbearable. The kernel may
> need to kill many processes to fulfill the request. It affects user
> experience even
> after using PMU.
> 
> I am totally fine to reuse PERF_PMU_CAP_AUX_NO_SG. If PMUs don't want to
> sacrifice performance for MM-friendly, why support scatter gather mode? If there
> are strong performance reasons to allocate contiguous AUX pages in
> scatter gather
> mode, I hope max_order is configurable in userspace.
> 
> Currently, max_order is affected by aux_watermark. But aux_watermark
> also affects
> how frequently the PMU overflows AUX buffer and notifies userspace.
> It's not ideal
> to set aux_watermark to 1 page size. So if we want to make max_order user
> configurable, maybe we can add a one bit field in perf_event_attr?
> 
>>
>> In Yabin's case, the AUX buffer work as a bounce buffer.  The hardware
>> trace data is copied by a driver from low level's contiguous buffer to
>> the AUX buffer.
>>
>> In this case we cannot benefit much from continguous AUX buffers.
>>
>> Thanks,
>> Leo

Hi Yabin,

So after doing some testing it looks like there is 0 difference in 
overhead for max_order=0 vs ensuring the buffer is one contiguous 
allocation for Arm SPE, and TRBE would be exactly the same. This makes 
sense because we're vmapping pages individually anyway regardless of the 
base allocation.

Seems like the performance optimization of the optimistically large 
mappings is only for devices that require extra buffer management stuff 
other than normal virtual memory. Can we add a new capability 
PERF_PMU_CAP_AUX_PREFER_LARGE and apply it to Intel PT and BTS? Then the 
old (before the optimistic large allocs change) max_order=0 behavior 
becomes the default again, and PREFER_LARGE is just for those two 
devices. Other and new devices would get the more memory friendly 
allocations by default, as it's unlikely they'll benefit from anything 
different.


Thanks
James


