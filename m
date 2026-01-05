Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EA8C2A074
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjPNX53qsmSbQa6/MqIrhJqUn4vzLuo+5d9DC74SH6w=; b=nP6NWFk87+WVMtYeIAtMnMesYb
	uCG/vlO2egkWCSUCxF40xMuZrWl4VV2JyALrwkuGXPJhXj56meuTXuvV7UWsOC5pexOXS75v2FrrV
	kayW4531NW9qUytVotz15z1C08oF0G9XPzCbO8bstMFrMVP/lnTtMKVk/O5cOeEQGL1zRCPb/1blc
	Qka8krE9coDOUIxqWFPnh1Cvvw/kvX2yAwy+tWTkiSYVroXdrtWt6yoSIfCODMmIX7ikVhWNfK4Fp
	NqmNmcDKyBtGr5hCc5Orqx3159JP5GR+k5DD2s+ROxADONZSYGgCgk8mp/ZD9faK8syRJnFlosuJr
	0PHrYIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchjy-0000000B6GI-2rkb;
	Mon, 05 Jan 2026 10:23:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchjv-0000000B6Fw-0G3I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:23:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso111654585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 02:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767608584; x=1768213384; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HjPNX53qsmSbQa6/MqIrhJqUn4vzLuo+5d9DC74SH6w=;
        b=qDYGfmVk0thLntx57tA0o3me+39ksgsThCUZWHMFcrSGB6LWKondPze8AdnLWEXlyU
         50v9QBKvHuxENk9H0NfaCipmQ0JH07Y/7Oz+6s163J1MnVnpAuYeCekYQySD/MhyZy6h
         V6v7mlRugT8Yc0dGdZoxs+0/YNa7tLdG23TzD8sIpMoiGa1TmpatWGiobvmjRUzmT3pR
         +uucJfzlWWMDVfvAzBGccbUmQOucf8ewfK9kQWF/wvbbDlcqWMXBGWLwNgsEefHWrzG/
         Q6Luo2q0pYqXCW1idUr+rG+D0z05T+lI1EgyfUCmPR+HgAL+6z0O4o+6Byh2aMvdHsFF
         D6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608584; x=1768213384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjPNX53qsmSbQa6/MqIrhJqUn4vzLuo+5d9DC74SH6w=;
        b=Jyvp4DrqUM8R91inMO1iznqOjaop7fOvbLOukm341cgY5WezGF0QdYuu5vaDNPATcS
         +IrROtnb6BmKfipjAlKC37v8ljL7LfrvqcpvHCmUAF4pnKZh60euyYTJgWTceOZ38ybp
         oZipghqM+y7fldKJiFc46GAmEwQCUVwHhyYhwnneLp6s615ej0wREf//JpuL6evB6cvK
         gXaSEBbiuLJ4uGcYzXOAKVhDNEZJOm0PD0zHU6JepQbLhE8Zg1PY9K01tolx12iNVRQc
         wnW6LZkRrHIGEoAnKO1/G/B6+Jy4VYP4d7g6+yZ2etxIJ+cE2w+cp3AsN6axv5oqmJS9
         1Wgw==
X-Forwarded-Encrypted: i=1; AJvYcCUQMkUV2L0d0/0Y5Vz9U8vPNvJjF0tGoFGQOeo0HFbukD6zigeVxIrYPj3i/JPh3h3V7CqQL75ZhKBZqv0KFKcl@lists.infradead.org
X-Gm-Message-State: AOJu0YzlPudAPcH3YHR8B9XJp3dCpDjV5Gan3dT614edHKVYeGf1zgYO
	46ZUl55dTRGVW9kN7DJnEtFiNf/WMzoEuglMTulS3OyvZqD7yRsb3D+robwqzJ7WEbQ=
X-Gm-Gg: AY/fxX7Qkrt+ent3gd71EP9Ouv8UMhfxMRdcsxOdDNUzdHewotx9cKO2Zjb2srczmVn
	B6NqR5eofYMc7ZJM5mpCycrGFfEztO/Dk7UNTnd83dwQhs/N9al809Uj4/Jp0zuazedvErEXFpT
	EhBamBtiIWE8FnjllI2dh5ZOGjqWTvMeARCVskNCxSDQqeewghxCdq1mZOdbJqLWtKPnBy/zsq7
	9IoyxEZIUbhqNZBRiCgCqkVPZW7cBYlFWbS1kcqnq7folNAcpEZzt0xSUbdrAbgo45ycA6IMcpD
	4Q/PRsMa39cEaSFmUYeSs//3Ffs+ntHlINssMB98Bh6aj7N5OirSN4dYdbVDtyZ59FuGZGOqXTq
	ETTkH62p7Le3jQoVQ2pDCp4G0GMPA3hYiOe6tOOKBgjEop1sYK2FEeALC2oUCd/pRl5LVYXPh76
	lmZH+shKuKLYLlaAg0
X-Google-Smtp-Source: AGHT+IH9tKuyAlhktoMiOiAQvOA0pymhdCPq5V+2Yc35glT3RWVKqXpIPiYAUmAPxYxpzICFB6Domg==
X-Received: by 2002:a05:600c:8107:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-47d19595f00mr640717415e9.22.1767608583849;
        Mon, 05 Jan 2026 02:23:03 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452a3bsm142078455e9.11.2026.01.05.02.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 02:23:03 -0800 (PST)
Message-ID: <3513a638-c207-4ce5-b966-b274891beffe@linaro.org>
Date: Mon, 5 Jan 2026 10:23:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64: Remove uncountable events
To: Ian Rogers <irogers@google.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Akio Kakuno <fj3333bs@aa.jp.fujitsu.com>,
 Yoshihiro Furudera <fj5100bi@fujitsu.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
References: <20251231-james-perf-uncountable-events-v1-1-f2d9932999fd@linaro.org>
 <CAP-5=fUNJLoy25rS=diSXNR9h-h4m6EFPTy8M+KpTKxm6HtDSA@mail.gmail.com>
 <951f10c5-e1ac-45d4-b7ca-56aa32e57cd6@linaro.org>
 <CAP-5=fWQU59Vyb6y+W6ObOTh3nzFSofsn8sc6JzwZp7FiV+n6w@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fWQU59Vyb6y+W6ObOTh3nzFSofsn8sc6JzwZp7FiV+n6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_022307_164189_37E15FFE 
X-CRM114-Status: GOOD (  20.80  )
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



On 04/01/2026 1:27 am, Ian Rogers wrote:
> On Sat, Jan 3, 2026 at 8:38 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 02/01/2026 3:29 pm, Ian Rogers wrote:
>>> On Wed, Dec 31, 2025 at 4:13 AM James Clark <james.clark@linaro.org> wrote:
>>>>
>>>> These events are never countable by the PMU and are only intended to
>>>> be used as external inputs to trace. Therefore showing them in 'perf
>>>> list' is misleading so remove them.
>>>
>>> What does "trace" mean in this context?
>>>
>>
>> CPU trace, Either ETE (Embedded Trace Extension) or ETM (Embedded Trace
>> Macrocell). You can select PMU events as inputs to the trace block to
>> make it do things like start and stop tracing.
> 
> Ah ok, trace immediately makes me think of `perf trace` currently.
> Presumably there's no perf integration for ETE and ETM that somehow
> use these event encodings? Looks not and the changes make sense to me.

Not yet, currently you have to create kernel modules to do complex trace 
configs.

> 
> Reviewed-by: Ian Rogers <irogers@google.com>
> 
> Thanks,
> Ian
>

Thanks!

>>> Thanks,
>>> Ian
>>>
>>>> The generator script doesn't emit these events when used with the new
>>>> telemetry-solution input files [1].
>>>>
>>>> 'perf list' should only show countable events because there are events
>>>> that are sometimes implemented, sometimes countable and sometimes not,
>>>> for example TRB_TRIG. If we always include any implemented events
>>>> whether they are countable or not then it's not possible to tell whether
>>>> they are usable in perf without going to the docs, defeating the point
>>>> of 'perf list'.
>>>>
>>>> It's also not useful yet to display implemented events that are not
>>>> countable (for help in using trace rather than perf stat), because
>>>> PMU_OVFS and PMU_HOVFS are practically always implemented and TRB_TRIG
>>>> is always implemented when there is TRBE.
>>>>
>>>> [1]: https://gitlab.arm.com/telemetry-solution/telemetry-solution/-/tree/main/data/pmu/cpu
>>>>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json  |  8 --------
>>>>    tools/perf/pmu-events/arch/arm64/common-and-microarch.json | 12 ------------
>>>>    tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json   | 10 ----------
>>>>    3 files changed, 30 deletions(-)
>>>>
>>>> diff --git a/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json b/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
>>>> deleted file mode 100644
>>>> index d8b7b9f9e5fa..000000000000
>>>> --- a/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
>>>> +++ /dev/null
>>>> @@ -1,8 +0,0 @@
>>>> -[
>>>> -    {
>>>> -        "ArchStdEvent": "PMU_OVFS"
>>>> -    },
>>>> -    {
>>>> -        "ArchStdEvent": "PMU_HOVFS"
>>>> -    }
>>>> -]
>>>> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>>>> index 2416d9f8a83d..468cb085d879 100644
>>>> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>>>> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>>>> @@ -432,24 +432,12 @@
>>>>            "EventName": "TRB_WRAP",
>>>>            "BriefDescription": "Trace buffer current write pointer wrapped"
>>>>        },
>>>> -    {
>>>> -        "PublicDescription": "PMU overflow, counters accessible to EL1 and EL0",
>>>> -        "EventCode": "0x400D",
>>>> -        "EventName": "PMU_OVFS",
>>>> -        "BriefDescription": "PMU overflow, counters accessible to EL1 and EL0"
>>>> -    },
>>>>        {
>>>>            "PublicDescription": "Trace buffer Trigger Event",
>>>>            "EventCode": "0x400E",
>>>>            "EventName": "TRB_TRIG",
>>>>            "BriefDescription": "Trace buffer Trigger Event"
>>>>        },
>>>> -    {
>>>> -        "PublicDescription": "PMU overflow, counters reserved for use by EL2",
>>>> -        "EventCode": "0x400F",
>>>> -        "EventName": "PMU_HOVFS",
>>>> -        "BriefDescription": "PMU overflow, counters reserved for use by EL2"
>>>> -    },
>>>>        {
>>>>            "PublicDescription": "PE Trace Unit external output 0",
>>>>            "EventCode": "0x4010",
>>>> diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json
>>>> deleted file mode 100644
>>>> index 65bd6cdd0dd5..000000000000
>>>> --- a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json
>>>> +++ /dev/null
>>>> @@ -1,10 +0,0 @@
>>>> -[
>>>> -    {
>>>> -        "ArchStdEvent": "PMU_OVFS",
>>>> -        "BriefDescription": "This event counts the event generated each time one of the condition occurs described in Arm Architecture Reference Manual for A-profile architecture. This event is only for output to the trace unit."
>>>> -    },
>>>> -    {
>>>> -        "ArchStdEvent": "PMU_HOVFS",
>>>> -        "BriefDescription": "This event counts the event generated each time an event is counted by an event counter <n> and all of the condition occur described in Arm Architecture Reference Manual for A-profile architecture. This event is only for output to the trace unit."
>>>> -    }
>>>> -]
>>>>
>>>> ---
>>>> base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
>>>> change-id: 20251230-james-perf-uncountable-events-28adfb93b73f
>>>>
>>>> Best regards,
>>>> --
>>>> James Clark <james.clark@linaro.org>
>>>>
>>


