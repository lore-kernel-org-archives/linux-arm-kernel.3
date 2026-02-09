Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D8AE7E0B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgB5oGGHd4upF7pskvXaLtjuNDEPrMYM5N/AR0FlTwA=; b=DObfC2WNMXWpuCUgYNFR/BzLTQ
	011d2xemXODe+xtwEglu+aHK8NExV37DVlbxc0a1Q1LlcdzqG67NulKj8kiSi8d9FahBjXi4mfa+t
	W+lCXdniNixN4aHoFDtfSG/KiyfCzdr7nHOVtjdeoK9a+CL5GjuFPMAer90VHrZ7GN+Xi3Dj2feHP
	mlBCCIQ0t2d6NzPvZPU/qDo6YWGLuFl1VFZ8n8S/V+8qrg30VdRInpU0OoFWPLnAF8a2qbe7fgbCq
	7+sCc0JX9SPkMSwsQYmLNQDB/+HZcgEb90fLjSJmL4ugveIZS96IilCFZE1k1IbouRQ2HXLmTdxtQ
	aDveFWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNuL-0000000FBII-1AWh;
	Mon, 09 Feb 2026 09:50:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNuJ-0000000FBHj-0bR7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:50:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4801bc32725so20834165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 01:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770630613; x=1771235413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgB5oGGHd4upF7pskvXaLtjuNDEPrMYM5N/AR0FlTwA=;
        b=WrumJdMQRYUYeTTQXKngHQ9gSaWW8VBwk9o7Fkne085vz3SV531oW/xGnUzxHUSQKR
         hRxN0qSwajrxN6g63VGoMepFbhf1VkjwUErHo3BUj43WuJfxtioWCvQu31XlbgkHRLUO
         6rT01b7aOCavmQtv//ESNaVS8K5RIDvQkLmREMEvx5bGDSsbVqsLuVesHUzcWVWM5p3Z
         W2KMR7aJ11cXJGTAl6KwMtYc9GVwLaF1tG4NmCKuEuoho38z9wCwSkOh/VbrHyclQa9Y
         8eZ5p51oKljPlpwEX8T/n1JrtuKRll27qrwXXgYsP4fRtzvG7qJUjyOSbSkVxq4spKHl
         eTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630613; x=1771235413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgB5oGGHd4upF7pskvXaLtjuNDEPrMYM5N/AR0FlTwA=;
        b=uDC4/bND04eCBLr7ZAaLqebNBe8DpcBhLYVCLngRVLA+6vL2HvMqtQ7CP/Rvh+Cflx
         Eih2OrnYRZNkX1A2lVbfly+HLXRduouVTDf3TYmlY/T89AlLiKL69RPzya561K5C4p8t
         5BKK2TRu8a/Xa8VH4iStV+tN1X5+kebjrGVFoMjsjWXdat3NBN5/+/x/yC9N3/y0AuCO
         4B+NxF8rbbENOvgFoL+DzLRcRvl5ntAwpA22hEIxLdhwxCcPh2sSLbwvLDUcbbXGoJ6p
         rdDgJMMbpm5vU3UK0tF6kPPjczIBDmCs9eVByMaZI1+CieI8OO11hZkMRdXZPQWsTrOa
         oXSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqlr4QH4HrBZHSJyMQJDyko/SF5nceDs8g4fIccFMO5e9RlvP+9jvCstNEaPa1qiNNenn3ykuv1qkBOjIjZwP5@lists.infradead.org
X-Gm-Message-State: AOJu0YxV57+4Wj83MWCBQ0ks1duUAJ0TkRumaPmHq7BUYNekNuvJj62K
	BZ74pvC1EVzTEzCQ0bIL0OqLETRHvCzRSDt5cWntMgcvUJBKux+x/Nmi95SHoDTEpqk=
X-Gm-Gg: AZuq6aIuaU5Iwmfd3SWhF/tYJ7kT3CLdwtfryxcKZxZT9HG/DPER7UYLkEcWQXYL4cc
	3lP1bY5XqxMAzKKZUZa4zNJUj65OuemIV1etLrW/YuBWyt/1sOvOcvmo+6XNVIY3JMcPYSiq1MA
	xmWStM2LYdVfD2jhZ1MzWy8MoxVcFzIXQT/jPio0xdQywt0k9HOrlEe1xS7TL7lHhDaW4SwyG2i
	Lfa1NzGbFqdTncXMRFPYP4Nd2pTr4Ar6B9Hti+7VVH1DUU/OhLTMKr9eJAN+7/IhF8worPSoslV
	lIKG1W4p9lGUful+Tj9w/Ef4P36HTF0kEMYshWyvBsGz+wl3dPP7XlrvTwFr97ME+BUXF/M9aMH
	/a0BJ1LU/jAjZOvpTsvybg3Kg+M1WiXGFr1ThDFb0g/ROjnsAuEPNW7RpYtr+/LJ1gLAarv9V2H
	OZAFoUj/7ORJUoRMzA
X-Received: by 2002:a05:600c:34d1:b0:482:ef72:5787 with SMTP id 5b1f17b1804b1-483201da065mr134091865e9.1.1770630612708;
        Mon, 09 Feb 2026 01:50:12 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320396ccbsm121940985e9.0.2026.02.09.01.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 01:50:12 -0800 (PST)
Message-ID: <b4fb6943-361b-4c48-a199-8944cef53cfc@linaro.org>
Date: Mon, 9 Feb 2026 09:50:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU events
To: Besar Wicaksono <bwicaksono@nvidia.com>
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
 Jon Hunter <jonathanh@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Ian Rogers <irogers@google.com>
References: <20260127225909.3296202-1-bwicaksono@nvidia.com>
 <CAP-5=fUxhbR1xs1f9mrkcUXZZNLrVqDG0ebhwW--WtgVRnNxNw@mail.gmail.com>
 <40988c57-ee6f-4693-afe4-2615dc43f395@linaro.org>
 <MW5PR12MB5681E958BDDCEB137E65CE54A09FA@MW5PR12MB5681.namprd12.prod.outlook.com>
 <45c02424-f090-42bc-8165-03b4ef2c0a6c@linaro.org>
 <MW5PR12MB5681FAEA87806E8BACF7B8C8A067A@MW5PR12MB5681.namprd12.prod.outlook.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <MW5PR12MB5681FAEA87806E8BACF7B8C8A067A@MW5PR12MB5681.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_015015_243224_D5C0BC84 
X-CRM114-Status: GOOD (  20.67  )
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



On 07/02/2026 12:27 am, Besar Wicaksono wrote:
> 
> 
>> -----Original Message-----
>> From: James Clark <james.clark@linaro.org>
>> Sent: Monday, February 2, 2026 3:59 AM
>> To: Besar Wicaksono <bwicaksono@nvidia.com>; Ian Rogers
>> <irogers@google.com>
>> Cc: john.g.garry@oracle.com; will@kernel.org; mike.leach@linaro.org;
>> leo.yan@linux.dev; mark.rutland@arm.com;
>> alexander.shishkin@linux.intel.com; jolsa@kernel.org;
>> adrian.hunter@intel.com; peterz@infradead.org; mingo@redhat.com;
>> acme@kernel.org; namhyung@kernel.org; linux-tegra@vger.kernel.org; linux-
>> arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org; linux-
>> kernel@vger.kernel.org; Thomas Makin <tmakin@nvidia.com>; Vikram Sethi
>> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Sean Kelley
>> <skelley@nvidia.com>; Yifei Wan <YWan@nvidia.com>; Thierry Reding
>> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Matt Ochs
>> <mochs@nvidia.com>
>> Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU
>> events
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 30/01/2026 6:08 pm, Besar Wicaksono wrote:
>>> Thank you James and Ian for the comments.
>>> I will try to address the spelling mistakes on v2.
>>>
>>> Please see my other comments inline.
>>>
>>>> -----Original Message-----
>>>> From: James Clark <james.clark@linaro.org>
>>>> Sent: Wednesday, January 28, 2026 3:37 AM
>>>> To: Ian Rogers <irogers@google.com>; Besar Wicaksono
>>>> <bwicaksono@nvidia.com>
>>>> Cc: john.g.garry@oracle.com; will@kernel.org; mike.leach@linaro.org;
>>>> leo.yan@linux.dev; mark.rutland@arm.com;
>>>> alexander.shishkin@linux.intel.com; jolsa@kernel.org;
>>>> adrian.hunter@intel.com; peterz@infradead.org; mingo@redhat.com;
>>>> acme@kernel.org; namhyung@kernel.org; linux-tegra@vger.kernel.org;
>> linux-
>>>> arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org; linux-
>>>> kernel@vger.kernel.org; Thomas Makin <tmakin@nvidia.com>; Vikram
>> Sethi
>>>> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Sean Kelley
>>>> <skelley@nvidia.com>; Yifei Wan <ywan@nvidia.com>; Thierry Reding
>>>> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Matt Ochs
>>>> <mochs@nvidia.com>
>>>> Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus
>> PMU
>>>> events
>>>>
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 28/01/2026 8:03 am, Ian Rogers wrote:
>>>>> On Tue, Jan 27, 2026 at 3:00 PM Besar Wicaksono
>>>> <bwicaksono@nvidia.com> wrote:
>>>>>>
>>>>>> Add JSON files for NVIDIA Tegra410 Olympus core PMU events.
>>>>>> Also updated the common-and-microarch.json.
>>>>>>
>>>>>> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
>>>>>> ---
>>>>>>     .../arch/arm64/common-and-microarch.json      |  90 +++
>>>>>>     tools/perf/pmu-events/arch/arm64/mapfile.csv  |   1 +
>>>>>>     .../arch/arm64/nvidia/t410/branch.json        |  45 ++
>>>>>>     .../arch/arm64/nvidia/t410/brbe.json          |   6 +
>>>>>>     .../arch/arm64/nvidia/t410/bus.json           |  48 ++
>>>>>>     .../arch/arm64/nvidia/t410/exception.json     |  62 ++
>>>>>>     .../arch/arm64/nvidia/t410/fp_operation.json  |  78 ++
>>>>>>     .../arch/arm64/nvidia/t410/general.json       |  15 +
>>>>>>     .../arch/arm64/nvidia/t410/l1d_cache.json     | 122 +++
>>>>>>     .../arch/arm64/nvidia/t410/l1i_cache.json     | 114 +++
>>>>>>     .../arch/arm64/nvidia/t410/l2d_cache.json     | 134 ++++
>>>>>>     .../arch/arm64/nvidia/t410/ll_cache.json      | 107 +++
>>>>>>     .../arch/arm64/nvidia/t410/memory.json        |  46 ++
>>>>>>     .../arch/arm64/nvidia/t410/metrics.json       | 722
>>>> ++++++++++++++++++
>>>>>>     .../arch/arm64/nvidia/t410/misc.json          | 646 ++++++++++++++++
>>>>>>     .../arch/arm64/nvidia/t410/retired.json       |  94 +++
>>>>>>     .../arch/arm64/nvidia/t410/spe.json           |  42 +
>>>>>>     .../arm64/nvidia/t410/spec_operation.json     | 230 ++++++
>>>>>>     .../arch/arm64/nvidia/t410/stall.json         | 145 ++++
>>>>>>     .../arch/arm64/nvidia/t410/tlb.json           | 158 ++++
>>>>>>     20 files changed, 2905 insertions(+)
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/branch.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/brbe.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/bus.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/exception.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/fp_operation.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/general.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/l1d_cache.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/l1i_cache.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/l2d_cache.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/ll_cache.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/memory.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/metrics.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/misc.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/retired.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/spe.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/spec_operation.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/stall.json
>>>>>>     create mode 100644 tools/perf/pmu-
>>>> events/arch/arm64/nvidia/t410/tlb.json
>>>>>>
>>>>>> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-
>>>> microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-
>>>> microarch.json
>>>>>> index 468cb085d879..6af15776ff17 100644
>>>>>> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>>>>>> +++ b/tools/perf/pmu-events/arch/arm64/common-and-
>> microarch.json
>>>>>> @@ -179,6 +179,11 @@
>>>>>>             "EventName": "BUS_CYCLES",
>>>>>>             "BriefDescription": "Bus cycle"
>>>>>>         },
>>>>>> +    {
>>>>>> +        "EventCode": "0x001E",
>>>>>> +        "EventName": "CHAIN",
>>>>>> +        "BriefDescription": "Chain a pair of event counters."
>>>>>> +    },
>>>>>
>>>>> Cool stuff :-)
>>>>>
>>>>> For wider counters AMD does something similar, but should this be an
>>>>> implementation detail rather than an exposed event? How does it
>>>>> operate as an event?
>>>>>
>>>>
>>>> CHAIN should be excluded from the json, it's used internally by the
>>>> driver when you want 64 bit counters. Userspace can't use it because it
>>>> can't control where counters are placed to make sure they're adjacent.
>>>>
>>>
>>> Sure, will address this in V2.
>>>
>>>>> [snip]
>>>>>> diff --git a/tools/perf/pmu-events/arch/arm64/mapfile.csv
>>>> b/tools/perf/pmu-events/arch/arm64/mapfile.csv
>>>>>> index bb3fa8a33496..7f0eaa702048 100644
>>>>>> --- a/tools/perf/pmu-events/arch/arm64/mapfile.csv
>>>>>> +++ b/tools/perf/pmu-events/arch/arm64/mapfile.csv
>>>>>> @@ -46,3 +46,4 @@
>>>>>>     0x00000000500f0000,v1,ampere/emag,core
>>>>>>     0x00000000c00fac30,v1,ampere/ampereone,core
>>>>>>     0x00000000c00fac40,v1,ampere/ampereonex,core
>>>>>> +0x000000004e0f0100,v1,nvidia/t410,core
>>>>>> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>>>> b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>>>>>> new file mode 100644
>>>>>> index 000000000000..532bc59dc573
>>>>>> --- /dev/null
>>>>>> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>>>>>> @@ -0,0 +1,45 @@
>>>>>> +[
>>>>>> +    {
>>>>>> +        "ArchStdEvent": "BR_MIS_PRED",
>>>>>> +        "PublicDescription": "The Event counts Branches which are
>>>> speculatively executed and mis-predicted."
>>>>>
>>>>> nit: The capitalization on Event and Branches, as well as other words,
>>>>> is a little unusual.
>>>>>
>>>>
>>>> If there's nothing specific to this CPU then the public description
>>>> could be left out entierly. The common strings already say the same
>>>> thing as this:
>>>>
>>>>        {
>>>>            "PublicDescription": "Mispredicted or not predicted branch
>>>>                                  speculatively executed",
>>>>            "EventCode": "0x10",
>>>>            "EventName": "BR_MIS_PRED",
>>>>            "BriefDescription": "Mispredicted or not predicted branch
>>>>                                 speculatively executed"
>>>>        },
>>>>
>>>>
>>>
>>> I will check on this and other events.
> 
> James, on a second thought, the description of the events was imported from
> Olympus TRM. So just to keep my import flow simpler, if there is no major
> concern, I would prefer to keep the description as is.
> 
> Thanks
> Besar
> 

Yes I think it's fine, you're already not overwriting BriefDescription 
so it will use the common ones from common-and-microarch.json by default 
unless running in verbose mode.


