Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16902D2A00B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMsLC4oXhwGy0P6KOpq9XSVOc6j5iFEz/aKGZr4fbqw=; b=k4Q4KHBvwnWwR5JmhMi+ozJAIr
	xRW/G9BVfY82b3u130koyE1XRPNzu9vkoKKFePamqD2/FCfVg4v1Ze4g1Rt3OaFKqZrMyL+Oawhbm
	3gIL1D4A3Riy5Ef7IZVJ+bJjhKaE+iCdgjVGvFibwK8OwrEJYN14L4615BIDFedCXgpgdpNFnTmhj
	HYulZ1LC0wkBE+TZam3VovmLsDjG98iFkgZ34b0N1+2L8wgQZO6FZf+/I7CpBFvFkLG3lSU59Q4dZ
	ZJOU80BUMV+D7PBYRzTA9gGENjEfnMbUh+MB1eJtSMf5gH87IYO52XD/2A7bSUmRMWhnQnS0O3Grq
	U+2PjsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3HG-00000009pLR-06vW;
	Wed, 14 Jan 2026 15:59:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3H1-00000009pAF-1jb5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Jan 2026 15:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yMsLC4oXhwGy0P6KOpq9XSVOc6j5iFEz/aKGZr4fbqw=; b=fX6vyvDgZQZZQ0RngcYqhboHKv
	DZyXhShJA4S2Pm8NoufaBQz0qG63D2HqVZ7SQiKu0NFoY10vy9Brh0E5BeL/7EUqwg6jGr3QuxC+L
	NJnmhTVf3W3vt7Y18vwXRQ50ozP1gE4LZDR8ZbvaO6zdgyap/T7dABf014/Wn6+TG3R5ehcdgMlAQ
	SFWxfjnOjbPKx3rd+si/Q1aqWFBPnkRspwxaeNOaSobnNLdQNrv5z3WVGpIDTqqE/etw4mXU13iJ4
	dGEiXGxR2YDdTZeNnlNosYbeV74IcPhB2Q/QlusinDmB6QWRHlqsLYKzcAZr4dlxlYKWQd6rqLpdD
	XUd9sQ0w==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Gw-00000005BbP-2GY3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:59:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42fbc305882so6236f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406341; x=1769011141; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMsLC4oXhwGy0P6KOpq9XSVOc6j5iFEz/aKGZr4fbqw=;
        b=FHtrxFTAsvIVcc2jpuFGJ2qJ8TVyKOO0miHVO39iAQdfza/3QW2lbZCSLOv9ICMG+N
         QALZ1Je9ct3uxfd+ihYKgbjRZz2lSGQWgvtDyuRQzFAv+xOO5j+OZQqFDikhY3dqXPe+
         a6WgOkoCg7wNorisFqW3MBLbiQz6cDas13TWR1kF3WDQm6//Lcm0Og/+qnxiTG63rbHS
         9LDdj8N1R7FdIoxvjATgkiE8ntF36plEHKrSBlq67t/dxp+iEAUQBbMyRybjf62AU8qL
         KxnG50Qsz2XvSZLPXEulHbQEj5/2YYqt7E+Vsq/SixCKhrl7sN9dBP0NUcLAVfI5BVWN
         zJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406341; x=1769011141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMsLC4oXhwGy0P6KOpq9XSVOc6j5iFEz/aKGZr4fbqw=;
        b=MuBmMidXCjPQ61jEHw0F8PdrKVoSN7n60hlFWNKqA7+kRNsgjPwcE4ZgcaI9m+oVO0
         x9a1zP9SRw0GoSfSPApEwGO08/x38czHvZZky+WPiMwxQBhWI5hw5TvYPQh8g2VVkfe+
         8RDKOwDiUwMadn580LTHOORGB8Mj8U7oIHRa6ma/bnqj8j9dbnB8dNexvcyl9ufRvhlB
         iupvgj+u6zUYk4moCX6CQo/3QkRlv0dF/PVEPRMS5z10ruFuiyOuaapephhLGRbD5I0W
         bzUUEl9of9uA7XYI0zLhOwl1vEzT9qikP5FKad4SraxqNjwmU1Ecgq+To8O+RH0GmDt4
         IcMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2rp0Tx8tjo7lAGNGTQobSTv+IynGNW6XHd8tLyhjl9ugytueYYKzKkqkBRmxwMVIFn7Oi1pAm+/IF1KJid40g@lists.infradead.org
X-Gm-Message-State: AOJu0YzJQ2ORmj7twdbfzSkOcLIshG+bRVexH53YaTAhdArwLeQBgunL
	bsJ7yY5IsFmqtU3Q4A3Oy0k2URBWU4cAUrUafCmMu8Q7Bmn4MmvfPI+bheIx/lCvOZg=
X-Gm-Gg: AY/fxX7CIgc1RHiQzMVZ4AvkE7u8axWLoe1C6MIV8BPOBYwLhY5lVVLqU6B8IU377Xq
	7nAj5JkWxv/tYNcbrpK8rB3bupgAn3CpQIGLvHKaMZr+uqvwaBWREeCiEK/rGhyg3vBGjl+5Cui
	lrwHcQkALMuO+FrTGE62TSocWGwBcoK3ekuleWqg0XxTCdxqVNi98MWGXZbwwLHlBQUlLdhzhM8
	SfIslQa2UcfumWHk3N4WFaW57onUEo2EUHcoi5KeAUgl3E6UpVJRXm6ADN7IjyESTixeyfMsO5N
	CJpcszwT0MttpWv9Cknd5x8/w+ZknZKAEwraVZhZSrPXlhJNNZqzKa+HChOiYpV0ykWirhc+F80
	7FZi4K4KzwSlC6+rjC+zqNhpo1eKE+Z004PSq4YcjoBLpBLbHDzlEHHS+jeeWzvKukKpXw7oLYi
	SYltxMseJSAGX577hi
X-Received: by 2002:a5d:650f:0:b0:431:864:d48d with SMTP id ffacd0b85a97d-4342d59bf42mr2978448f8f.5.1768406341148;
        Wed, 14 Jan 2026 07:59:01 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a65bsm66061f8f.7.2026.01.14.07.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:59:00 -0800 (PST)
Message-ID: <6a31e9e4-653a-4a8d-af91-4325b37535c7@linaro.org>
Date: Wed, 14 Jan 2026 15:58:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] perf evsel: Refactor
 evsel__set_config_if_unset() arguments
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
 <20251222-james-perf-config-bits-v4-2-0608438186fc@linaro.org>
 <aWbDg0kmo-isxkz2@x1> <4eda1bd6-ec36-4d0b-85de-ef0bd190e5e7@linaro.org>
 <aWe6igmKMq25GJP9@x1>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aWe6igmKMq25GJP9@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_155902_634296_26CD3496 
X-CRM114-Status: GOOD (  26.49  )
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



On 14/01/2026 3:47 pm, Arnaldo Carvalho de Melo wrote:
> On Wed, Jan 14, 2026 at 12:14:43PM +0000, James Clark wrote:
>> On 13/01/2026 10:13 pm, Arnaldo Carvalho de Melo wrote:
>>> On Mon, Dec 22, 2025 at 03:14:27PM +0000, James Clark wrote:
>>>> Make the evsel argument first to match the other evsel__* functions
>>>> and remove the redundant pmu argument, which can be accessed via evsel.
> 
>>> I haven't checked if this is the exactly where this takes place but
>>> should be in this series, 32-bit build is broken:
> 
>>>      3: almalinux:9-i386WARNING: image platform (linux/386) does not match the expected platform (linux/amd64)
>>> WARNING: image platform (linux/386) does not match the expected platform (linux/amd64)
>>>       21.72 almalinux:9-i386              : FAIL gcc version 11.4.1 20231218 (Red Hat 11.4.1-3) (GCC)
>>>        1378 |         perf_pmu__format_pack(&bits, val, vp, /*zero=*/true);
>>>             |                               ^~~~~
>>>             |                               |
>>>             |                               u64 * {aka long long unsigned int *}
>>>       In file included from util/evsel.h:14,
>>>                        from util/evsel.c:38:
>>>       util/pmu.h:282:43: note: expected ‘long unsigned int *’ but argument is of type ‘u64 *’ {aka ‘long long unsigned int *’}
>>>         282 | void perf_pmu__format_pack(unsigned long *format, __u64 value, __u64 *v,
>>>             |                            ~~~~~~~~~~~~~~~^~~~~~
>   
>>> What I have is in perf-tools-next/tmp.perf-tools-next BTW, I'll try and
>>> fix this tomorrow if you don't do it first. :-)
>   
>> Taking a look, but I'm wondering if this is already not working properly.
>> There are existing "unsigned long"s in pmu.c that operate on the config bits
>> which is what I copied.
>   
>> On this target an unsigned long is 32bits but struct
>> perf_event_attr->configs are __u64. So it looks like it might leave the top
>> bits unset sometimes.
>   
>> I'll look at a fix for that which should fix the compilation error at the
>> same time.
>   
>> Another question is, do we actually care about this platform?
> 
> It failed for other 32-bit platforms too, so the question is if we care
> about 32-bit at all.
> 
> - Arnaldo

I suppose the answer is we still do then.

I sent another version. A couple of patches were changed a bit where I 
used more bitfields instead of converting to u64s which was probably the 
right thing to do regardless of the build issue.


