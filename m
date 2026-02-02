Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792FAE73151
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3+G72CDBB1fZxT87aoM4udjUxdGJbmDHiZtO7gTgFU=; b=EekuwD2xK+jGw1gLxoQIdy7oXz
	TJDRZRsZlESHrBJEilUFvf3VZTHRQSVasiWywr3h1ys8hdbnID92k0Ef8kuE0QafjbSImOHwBqpkx
	ZGgCvMGG1geBEXnpex9A+ICPvEUcvOcoR5BFRl++QStsYCsZn+s2AVHUq5UJIengIuPxrCuF95liG
	RrYeRBk6nBiSnZn3l/nLhPnVjs/Xvvn/fBSX4cIFr6FWxT02RMMFEn90x4JXKPD6TMB2CNFnebm3b
	mJUpboL9d3NNmc/PWDgl0vCdXyGp74f0UNCLWutrnLVtY9lmXpglUmdVgiKD5NKQeItdZXVdnGhnf
	npPpu2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqhx-00000004kvI-3UxC;
	Mon, 02 Feb 2026 09:59:01 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqhu-00000004kuZ-1Elp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:58:59 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so4486260f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 01:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770026336; x=1770631136; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3+G72CDBB1fZxT87aoM4udjUxdGJbmDHiZtO7gTgFU=;
        b=RvOQ88MrXyqmas3D6KS4EJ7wzSIOFWd6GvPYqbu5zriav6vzMGZBgBUzAKG/mH4jUw
         9lBQ8ZW6Ch+A7q3g1gOKDOA4rGbbGxBbrYD40BytjJZ7IoTpxkxRIPvPC6N7xhS4abBf
         iADM/vA6vtt/9oHrziqj7CtxGR7UcsbkuNGeOIrcQFT/E2jZ5tXP/xKM40j/CMVjG+4d
         YIwwDq7bQ8lq1pdgmQCFCv4jHWmrVVXOqxsvjg/cUTyXGm8ttm83wUAfRe5R/QelJpVK
         mXsmxuh+nXXq1bjhdm0JvGQC/GEWx5BIZAQqSc2kw1PXPxPBX1KVOjcbEkHOJT+qjm7r
         WDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026336; x=1770631136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3+G72CDBB1fZxT87aoM4udjUxdGJbmDHiZtO7gTgFU=;
        b=YD0EgC0xTi+4Kc/gYBXnqCajHsgKYyA2HvXnGyJdSOlugPY+Rb0dj8p/kYvndG6him
         k/OXL8/Z4uaCcry1HJVzuGmJyb1CiCtpEk0ICHpNl6pn8kSm8XBR16sX0T9rqsTku3hk
         Y+K/Hoh5bJdiHmVYFl2E2/Cno1RUwvXmhK06+FE4kgRdPJsqCxbQ64g9j3sgcz2PC8CJ
         PuK8UwLBtkAauZiZTtuMYr8vmnGnUxArd7oa1Ez6e/1gCCMdQ0o/NYeDLR2shDW8T7/V
         F9LKVkOvhj55j0DfwWT3dpQv6D43g6rFKfM+6F1Cysm64MiF6Kh7xKn0s6RkGmLknZf+
         xGvA==
X-Forwarded-Encrypted: i=1; AJvYcCWLZsd24jtykQbptEducUtKG/uMl28dkZWQ/YJZFh+AmXSYQ6ZEsu3L/XbaV/w4U4q9R6HrEw60m+Sr6j/DCKNU@lists.infradead.org
X-Gm-Message-State: AOJu0YxMaBl4cgK36U4Ryf/uaNMjCFhXpCrFPxD9xET7DxDCEkf8aloQ
	NSSl/cPm0I8rAuqrJwURpQNKiYLaF91CY62zbsC0UvwfZOGAp2v0JdogC+H9bGwg7QE=
X-Gm-Gg: AZuq6aItC+x+Dv1Xym1esjCdf0h8mMs5DDvl/V1zdBEZ5QP0vdyv36Xxyc8jfAzHzUg
	ukAW7AKODR7wqOZTK0CwtYKuIuZQ9Pe6QE/p/g2YiG/IsarYfF2JxobsI3SUPGkPZ0ZaM/iYIEP
	qwn8OrOmPHgyoJ16ObdD2DzDI8EMN3dGidj8GI6IzFHRfyF10IP0BwXDpXeRd/v0cxVU6WbrOx6
	1/UVFiaoyau/S/jTQXj0ptCE87RBWYkFbz1EmnBehHcZs21pbcCLMYIqsfghj6WuG3MBDLVkScm
	zenjeEkH6ywDB64ASxUV7/q9MpwVZMZy07R9/u1JIl+fHh18UpQ0e3uzULoC1tjKQ955dZtdtgb
	l6oqPEDlOf2/lb1h9DAWomIlIS9hFMSEj7LBla67xAGaYGvj31OBZjPHgZT0KLVNte4Tg8ganGm
	ax6hlTc+6Vyt/FGnMXGoexmukPL3s=
X-Received: by 2002:a05:6000:1acb:b0:435:9bf5:b336 with SMTP id ffacd0b85a97d-435f3a91ee5mr16585849f8f.19.1770026335909;
        Mon, 02 Feb 2026 01:58:55 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee040sm42490396f8f.11.2026.02.02.01.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 01:58:55 -0800 (PST)
Message-ID: <45c02424-f090-42bc-8165-03b4ef2c0a6c@linaro.org>
Date: Mon, 2 Feb 2026 09:58:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU events
To: Besar Wicaksono <bwicaksono@nvidia.com>, Ian Rogers <irogers@google.com>
Cc: "john.g.garry@oracle.com" <john.g.garry@oracle.com>,
 "will@kernel.org" <will@kernel.org>,
 "mike.leach@linaro.org" <mike.leach@linaro.org>,
 "leo.yan@linux.dev" <leo.yan@linux.dev>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 "jolsa@kernel.org" <jolsa@kernel.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "acme@kernel.org" <acme@kernel.org>,
 "namhyung@kernel.org" <namhyung@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Makin <tmakin@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
 Rich Wiley <rwiley@nvidia.com>, Sean Kelley <skelley@nvidia.com>,
 Yifei Wan <YWan@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Jon Hunter <jonathanh@nvidia.com>, Matt Ochs <mochs@nvidia.com>
References: <20260127225909.3296202-1-bwicaksono@nvidia.com>
 <CAP-5=fUxhbR1xs1f9mrkcUXZZNLrVqDG0ebhwW--WtgVRnNxNw@mail.gmail.com>
 <40988c57-ee6f-4693-afe4-2615dc43f395@linaro.org>
 <MW5PR12MB5681E958BDDCEB137E65CE54A09FA@MW5PR12MB5681.namprd12.prod.outlook.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <MW5PR12MB5681E958BDDCEB137E65CE54A09FA@MW5PR12MB5681.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_015858_412107_01390B99 
X-CRM114-Status: GOOD (  34.27  )
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



On 30/01/2026 6:08 pm, Besar Wicaksono wrote:
> Thank you James and Ian for the comments.
> I will try to address the spelling mistakes on v2.
> 
> Please see my other comments inline.
> 
>> -----Original Message-----
>> From: James Clark <james.clark@linaro.org>
>> Sent: Wednesday, January 28, 2026 3:37 AM
>> To: Ian Rogers <irogers@google.com>; Besar Wicaksono
>> <bwicaksono@nvidia.com>
>> Cc: john.g.garry@oracle.com; will@kernel.org; mike.leach@linaro.org;
>> leo.yan@linux.dev; mark.rutland@arm.com;
>> alexander.shishkin@linux.intel.com; jolsa@kernel.org;
>> adrian.hunter@intel.com; peterz@infradead.org; mingo@redhat.com;
>> acme@kernel.org; namhyung@kernel.org; linux-tegra@vger.kernel.org; linux-
>> arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org; linux-
>> kernel@vger.kernel.org; Thomas Makin <tmakin@nvidia.com>; Vikram Sethi
>> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Sean Kelley
>> <skelley@nvidia.com>; Yifei Wan <ywan@nvidia.com>; Thierry Reding
>> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Matt Ochs
>> <mochs@nvidia.com>
>> Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU
>> events
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 28/01/2026 8:03 am, Ian Rogers wrote:
>>> On Tue, Jan 27, 2026 at 3:00 PM Besar Wicaksono
>> <bwicaksono@nvidia.com> wrote:
>>>>
>>>> Add JSON files for NVIDIA Tegra410 Olympus core PMU events.
>>>> Also updated the common-and-microarch.json.
>>>>
>>>> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
>>>> ---
>>>>    .../arch/arm64/common-and-microarch.json      |  90 +++
>>>>    tools/perf/pmu-events/arch/arm64/mapfile.csv  |   1 +
>>>>    .../arch/arm64/nvidia/t410/branch.json        |  45 ++
>>>>    .../arch/arm64/nvidia/t410/brbe.json          |   6 +
>>>>    .../arch/arm64/nvidia/t410/bus.json           |  48 ++
>>>>    .../arch/arm64/nvidia/t410/exception.json     |  62 ++
>>>>    .../arch/arm64/nvidia/t410/fp_operation.json  |  78 ++
>>>>    .../arch/arm64/nvidia/t410/general.json       |  15 +
>>>>    .../arch/arm64/nvidia/t410/l1d_cache.json     | 122 +++
>>>>    .../arch/arm64/nvidia/t410/l1i_cache.json     | 114 +++
>>>>    .../arch/arm64/nvidia/t410/l2d_cache.json     | 134 ++++
>>>>    .../arch/arm64/nvidia/t410/ll_cache.json      | 107 +++
>>>>    .../arch/arm64/nvidia/t410/memory.json        |  46 ++
>>>>    .../arch/arm64/nvidia/t410/metrics.json       | 722
>> ++++++++++++++++++
>>>>    .../arch/arm64/nvidia/t410/misc.json          | 646 ++++++++++++++++
>>>>    .../arch/arm64/nvidia/t410/retired.json       |  94 +++
>>>>    .../arch/arm64/nvidia/t410/spe.json           |  42 +
>>>>    .../arm64/nvidia/t410/spec_operation.json     | 230 ++++++
>>>>    .../arch/arm64/nvidia/t410/stall.json         | 145 ++++
>>>>    .../arch/arm64/nvidia/t410/tlb.json           | 158 ++++
>>>>    20 files changed, 2905 insertions(+)
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/branch.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/brbe.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/bus.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/exception.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/fp_operation.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/general.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/l1d_cache.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/l1i_cache.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/l2d_cache.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/ll_cache.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/memory.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/metrics.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/misc.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/retired.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/spe.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/spec_operation.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/stall.json
>>>>    create mode 100644 tools/perf/pmu-
>> events/arch/arm64/nvidia/t410/tlb.json
>>>>
>>>> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-
>> microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-
>> microarch.json
>>>> index 468cb085d879..6af15776ff17 100644
>>>> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>>>> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>>>> @@ -179,6 +179,11 @@
>>>>            "EventName": "BUS_CYCLES",
>>>>            "BriefDescription": "Bus cycle"
>>>>        },
>>>> +    {
>>>> +        "EventCode": "0x001E",
>>>> +        "EventName": "CHAIN",
>>>> +        "BriefDescription": "Chain a pair of event counters."
>>>> +    },
>>>
>>> Cool stuff :-)
>>>
>>> For wider counters AMD does something similar, but should this be an
>>> implementation detail rather than an exposed event? How does it
>>> operate as an event?
>>>
>>
>> CHAIN should be excluded from the json, it's used internally by the
>> driver when you want 64 bit counters. Userspace can't use it because it
>> can't control where counters are placed to make sure they're adjacent.
>>
> 
> Sure, will address this in V2.
> 
>>> [snip]
>>>> diff --git a/tools/perf/pmu-events/arch/arm64/mapfile.csv
>> b/tools/perf/pmu-events/arch/arm64/mapfile.csv
>>>> index bb3fa8a33496..7f0eaa702048 100644
>>>> --- a/tools/perf/pmu-events/arch/arm64/mapfile.csv
>>>> +++ b/tools/perf/pmu-events/arch/arm64/mapfile.csv
>>>> @@ -46,3 +46,4 @@
>>>>    0x00000000500f0000,v1,ampere/emag,core
>>>>    0x00000000c00fac30,v1,ampere/ampereone,core
>>>>    0x00000000c00fac40,v1,ampere/ampereonex,core
>>>> +0x000000004e0f0100,v1,nvidia/t410,core
>>>> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>> b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>>>> new file mode 100644
>>>> index 000000000000..532bc59dc573
>>>> --- /dev/null
>>>> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>>>> @@ -0,0 +1,45 @@
>>>> +[
>>>> +    {
>>>> +        "ArchStdEvent": "BR_MIS_PRED",
>>>> +        "PublicDescription": "The Event counts Branches which are
>> speculatively executed and mis-predicted."
>>>
>>> nit: The capitalization on Event and Branches, as well as other words,
>>> is a little unusual.
>>>
>>
>> If there's nothing specific to this CPU then the public description
>> could be left out entierly. The common strings already say the same
>> thing as this:
>>
>>       {
>>           "PublicDescription": "Mispredicted or not predicted branch
>>                                 speculatively executed",
>>           "EventCode": "0x10",
>>           "EventName": "BR_MIS_PRED",
>>           "BriefDescription": "Mispredicted or not predicted branch
>>                                speculatively executed"
>>       },
>>
>>
> 
> I will check on this and other events.
> 
>>> [snip]
>>>> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
>> b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
>>>> new file mode 100644
>>>> index 000000000000..18c2fd58ee9e
>>>> --- /dev/null
>>>> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
>>>> @@ -0,0 +1,722 @@
>>>> +[
>>>> +    {
>>>> +        "MetricName": "backend_bound",
>>>> +        "MetricExpr": "100 * (STALL_SLOT_BACKEND / CPU_SLOT)",
>>>> +        "BriefDescription": "This metric is the percentage of total slots that
>> were stalled due to resource constraints in the backend of the processor.",
>>>> +        "ScaleUnit": "1percent of slots",
>>>> +        "MetricGroup": "TopdownL1"
>>>
>>> Note, on x86 we place TopdownL1 in the Default metric group so it is
>>> shown by `perf stat` when it isn't given events or metrics to compute.
>>> Perhaps you want to do something similar?
>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-
>> next.git/tree/tools/perf/pmu-events/arch/x86/icelake/icl-
>> metrics.json?h=tmp.perf-tools-next#n116
>>>
>>> Thanks,
>>> Ian
>>
>> That's currently true for the Arm topdown metrics in sbsa.json, but we
>> probably don't actually want this because there aren't enough counters
>> for the perf stat defaults plus topdown and it results in multiplexing
>> and bad results.
>>
>> I was planning to change it but we also don't currently expose the
>> number of counters available either...
>>
> 
> Agree with James, we may not be able to cover all the events in
> Default + TopdownL1 group.
> 
> Ian, James, in general, is it fine to put some metrics in a same group because
> they are actually correlating even though it may cause multiplexing?
> For example, "Miss_Ratio" group in this patch provides miss ratio from L1, L2, TLB, etc.
> It's convenient to have this and get the miss ratio from all cache levels.
> There are many events needed for this group and it might not be accurate due to
> multiplexing, but user can get a (rough) broad view in the beginning.
> 
> Thanks,
> Besar

Yes I think it makes sense to put them all in the same group if they are 
the same feature. I suppose my point about possibly not wanting to open 
TopdownL1 by default is a separate issue to whether they should be in 
the group or not. I just thought it was a good time to mention it.



