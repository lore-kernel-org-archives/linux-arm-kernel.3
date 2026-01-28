Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFF0D35697
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhF98Nun2om+lYN0JL6mwSJXbtKFe/yYyeyl1TtEz3I=; b=paEVTpjABYb+fGH3hFNj+lHb3p
	NHTtpu74pg9HNXLcz5ZyCuRi656wNcghXZQjUPBqIQiHzhBRydCfF2hGe9A9H/f/vTvAnfHsrv0cw
	wWxdJd/lxmYBBJcgY8qwIhZKT3CJQ7RHeT2u8IAfEK8Jd2m84IJTOxdmmROrl5nNcKSa4qdfz+qaw
	4tjHa8gFePmlE1pLLBuztv+YVi0qNilCABuvzGNWLi9ZQuvefSVyfIG0trxVjIh2xCWWVulbhnJ8x
	lHUaQXk4b+7EgW+oyMcnZETDquQYEeONW4DP+UjTljtYk0IJ9M0KclsYzJ+mt5A6Uu6c+PwGprNy9
	7fcyPnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1yc-0000000FlES-2r9s;
	Wed, 28 Jan 2026 09:36:42 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1yW-0000000FlAz-2Sdc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:36:37 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-43284ed32a0so3925807f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769592994; x=1770197794; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DhF98Nun2om+lYN0JL6mwSJXbtKFe/yYyeyl1TtEz3I=;
        b=KQvZNemcrKVpJ6XpGsCueQZnE8IeIKDE7Ft93c+7pKHMTADvucgP8oyNg6EQJ8UOLA
         TQm5jpAAe2Zp0jc+VXkbtkfcsI3WOcj8yKtKVJc9401IIJMV0gNQ+ksGPTst+YQ4OWKc
         zGXGioCYGCW4t4rwgf+hDC7sL8LzVpdjJVwt9POW1a+b4pHGVe9UA17V00ieNQesYWIg
         UDwIAFhw1XAIsDd/g3QSEABrFAa0aOjlgtonAi1Iii2ydf95giB+XNCQYVqewuaO1Uug
         msy6VVdvzqJj4ZlOj15jMn7loSMDeHosTU110G54FS4Yun336ml6spsvtm4ZYJ232IMH
         yXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769592994; x=1770197794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhF98Nun2om+lYN0JL6mwSJXbtKFe/yYyeyl1TtEz3I=;
        b=npuXGgexVDEFZSuN8/Dzez/QcTNB0ePELNkaDrWupiJxQeT4BU3krA97Plj3EJv2kl
         zlxDMoZPkra3nXvZbSBJAVotazD92r7wYmqyTV83uR1mSCS/n1HBNK4VkqYOUZCtTUg4
         AvwL7rAUr6HdXIbzbLOECfcM7eYSOS6dc5U2/5z4viGAUdMRKqxZG50J6fQ/JPJevUsa
         pGxxrmRaxNipAySMpMpYuOicNyK33Cpdi+K85KmqqanBfUhYSmhLlHubA84hOHX3gY+6
         EssF8Rot7u0QUYWq6hdV5ESNpmu4B4ij9jZ8ptUD9Zflu8gNoDJOiWbS21QCeB9I2Jvz
         nA3A==
X-Forwarded-Encrypted: i=1; AJvYcCUHW5qlVK9j08nUrC8MEgSLKxIX1wWdBBaNxHG3Kppa0Qv8U+rtSNiXlYtTrD72Sv7pFXW9Bb3TKzwVdG0xqD9/@lists.infradead.org
X-Gm-Message-State: AOJu0YxtzADzHXH/FpRqVGDpXCiOFgBW9GbyfKgAVjGrNvqURMoRIQhN
	/3oSoSMll3tvTua/eAlLJg9wSLNPhwEtilen69A64mF7g94OV826DKIkBXoRi8nojXk=
X-Gm-Gg: AZuq6aKQsNneU/YMlz756qArvDqNuPMwqOMDakS8oePz2eYT5WNJHIWhtq2NOrIwtpa
	JNP6AgGTiwkIkTrplxDHURDun3axIpaTe1izEKRokMjNVgYbX/Op014tJti+vgBbzwgYLNsVfHZ
	sEWddsl0Qepc1/MBI+EKcaPpp5CTwezI2Arm0NzKyxN5bXPzGHrIsZnvwz87uvFAt5SHeRGoeaJ
	XbEA8BmAjONLX0uG8DIfsE2QhEF3mVfVclIMp50Gh1RAwWGmAvKodgys+B07kCXJwgPlrFLeLlm
	grCp5lq8+m6htUQShFWEXvonYLlyJ+mjfNI+fD35EK/S0TJLQr5Cjvd3Y62esad2stjYFD+IQHE
	IpRymKetUQoSfGaRjXMmBZ51w7b6+x2Z0Y0aqIXuV27EQBA/wti4aH02xI1HjCXXXcyxrdDRvbb
	/RWJQvdtbGgelPkeQqpdb4FGUeDb4=
X-Received: by 2002:a5d:5f43:0:b0:435:907f:e439 with SMTP id ffacd0b85a97d-435dd05c4bamr6010824f8f.18.1769592994091;
        Wed, 28 Jan 2026 01:36:34 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4762sm5489795f8f.6.2026.01.28.01.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 01:36:33 -0800 (PST)
Message-ID: <40988c57-ee6f-4693-afe4-2615dc43f395@linaro.org>
Date: Wed, 28 Jan 2026 09:36:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU events
To: Ian Rogers <irogers@google.com>, Besar Wicaksono <bwicaksono@nvidia.com>
Cc: john.g.garry@oracle.com, will@kernel.org, mike.leach@linaro.org,
 leo.yan@linux.dev, mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, adrian.hunter@intel.com, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 tmakin@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com,
 ywan@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, mochs@nvidia.com
References: <20260127225909.3296202-1-bwicaksono@nvidia.com>
 <CAP-5=fUxhbR1xs1f9mrkcUXZZNLrVqDG0ebhwW--WtgVRnNxNw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fUxhbR1xs1f9mrkcUXZZNLrVqDG0ebhwW--WtgVRnNxNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_013636_676657_A42E1351 
X-CRM114-Status: GOOD (  23.55  )
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



On 28/01/2026 8:03 am, Ian Rogers wrote:
> On Tue, Jan 27, 2026 at 3:00 PM Besar Wicaksono <bwicaksono@nvidia.com> wrote:
>>
>> Add JSON files for NVIDIA Tegra410 Olympus core PMU events.
>> Also updated the common-and-microarch.json.
>>
>> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
>> ---
>>   .../arch/arm64/common-and-microarch.json      |  90 +++
>>   tools/perf/pmu-events/arch/arm64/mapfile.csv  |   1 +
>>   .../arch/arm64/nvidia/t410/branch.json        |  45 ++
>>   .../arch/arm64/nvidia/t410/brbe.json          |   6 +
>>   .../arch/arm64/nvidia/t410/bus.json           |  48 ++
>>   .../arch/arm64/nvidia/t410/exception.json     |  62 ++
>>   .../arch/arm64/nvidia/t410/fp_operation.json  |  78 ++
>>   .../arch/arm64/nvidia/t410/general.json       |  15 +
>>   .../arch/arm64/nvidia/t410/l1d_cache.json     | 122 +++
>>   .../arch/arm64/nvidia/t410/l1i_cache.json     | 114 +++
>>   .../arch/arm64/nvidia/t410/l2d_cache.json     | 134 ++++
>>   .../arch/arm64/nvidia/t410/ll_cache.json      | 107 +++
>>   .../arch/arm64/nvidia/t410/memory.json        |  46 ++
>>   .../arch/arm64/nvidia/t410/metrics.json       | 722 ++++++++++++++++++
>>   .../arch/arm64/nvidia/t410/misc.json          | 646 ++++++++++++++++
>>   .../arch/arm64/nvidia/t410/retired.json       |  94 +++
>>   .../arch/arm64/nvidia/t410/spe.json           |  42 +
>>   .../arm64/nvidia/t410/spec_operation.json     | 230 ++++++
>>   .../arch/arm64/nvidia/t410/stall.json         | 145 ++++
>>   .../arch/arm64/nvidia/t410/tlb.json           | 158 ++++
>>   20 files changed, 2905 insertions(+)
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/brbe.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/bus.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/exception.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/fp_operation.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/general.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l1d_cache.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l1i_cache.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l2d_cache.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/ll_cache.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/memory.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/misc.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/retired.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/spe.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/spec_operation.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/stall.json
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/tlb.json
>>
>> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>> index 468cb085d879..6af15776ff17 100644
>> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>> @@ -179,6 +179,11 @@
>>           "EventName": "BUS_CYCLES",
>>           "BriefDescription": "Bus cycle"
>>       },
>> +    {
>> +        "EventCode": "0x001E",
>> +        "EventName": "CHAIN",
>> +        "BriefDescription": "Chain a pair of event counters."
>> +    },
> 
> Cool stuff :-)
> 
> For wider counters AMD does something similar, but should this be an
> implementation detail rather than an exposed event? How does it
> operate as an event?
> 

CHAIN should be excluded from the json, it's used internally by the 
driver when you want 64 bit counters. Userspace can't use it because it 
can't control where counters are placed to make sure they're adjacent.

> [snip]
>> diff --git a/tools/perf/pmu-events/arch/arm64/mapfile.csv b/tools/perf/pmu-events/arch/arm64/mapfile.csv
>> index bb3fa8a33496..7f0eaa702048 100644
>> --- a/tools/perf/pmu-events/arch/arm64/mapfile.csv
>> +++ b/tools/perf/pmu-events/arch/arm64/mapfile.csv
>> @@ -46,3 +46,4 @@
>>   0x00000000500f0000,v1,ampere/emag,core
>>   0x00000000c00fac30,v1,ampere/ampereone,core
>>   0x00000000c00fac40,v1,ampere/ampereonex,core
>> +0x000000004e0f0100,v1,nvidia/t410,core
>> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>> new file mode 100644
>> index 000000000000..532bc59dc573
>> --- /dev/null
>> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
>> @@ -0,0 +1,45 @@
>> +[
>> +    {
>> +        "ArchStdEvent": "BR_MIS_PRED",
>> +        "PublicDescription": "The Event counts Branches which are speculatively executed and mis-predicted."
> 
> nit: The capitalization on Event and Branches, as well as other words,
> is a little unusual.
> 

If there's nothing specific to this CPU then the public description 
could be left out entierly. The common strings already say the same 
thing as this:

     {
         "PublicDescription": "Mispredicted or not predicted branch
                               speculatively executed",
         "EventCode": "0x10",
         "EventName": "BR_MIS_PRED",
         "BriefDescription": "Mispredicted or not predicted branch
                              speculatively executed"
     },


> [snip]
>> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
>> new file mode 100644
>> index 000000000000..18c2fd58ee9e
>> --- /dev/null
>> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
>> @@ -0,0 +1,722 @@
>> +[
>> +    {
>> +        "MetricName": "backend_bound",
>> +        "MetricExpr": "100 * (STALL_SLOT_BACKEND / CPU_SLOT)",
>> +        "BriefDescription": "This metric is the percentage of total slots that were stalled due to resource constraints in the backend of the processor.",
>> +        "ScaleUnit": "1percent of slots",
>> +        "MetricGroup": "TopdownL1"
> 
> Note, on x86 we place TopdownL1 in the Default metric group so it is
> shown by `perf stat` when it isn't given events or metrics to compute.
> Perhaps you want to do something similar?
> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/pmu-events/arch/x86/icelake/icl-metrics.json?h=tmp.perf-tools-next#n116
> 
> Thanks,
> Ian

That's currently true for the Arm topdown metrics in sbsa.json, but we 
probably don't actually want this because there aren't enough counters 
for the perf stat defaults plus topdown and it results in multiplexing 
and bad results.

I was planning to change it but we also don't currently expose the 
number of counters available either...



