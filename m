Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F48C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wE00UcNy1SuGyWGuuvNBzcoUSeaUQC7bGOfR84asgzE=; b=KVPnz/MlW9b7rYVv65o+k4wzVF
	gkyBAM+L5nsc5elzAJg1fjLAoZtpPvsfonThu7qMxEE56fc0HRj9FYjT6vAG9zBMRDtN4hi3CXWqr
	muPJvc17VnIKN3NS8hnuqAbV2Z9DJgB0bcjNOkcab885bEpPqdyXuUlw+QatAkfrCtuJdE1zXupFo
	Ttl/pC/zhxGRUm+BA9oG2kOGN5APlO31fc8rP6t4zQ3xOLHwWgSW+g1lnZvngjowpzuDia/R79Gh/
	EBX54rQxFQp+XJCam0zpo8vEyao+TjShbpppEM9CceQBQbLsbwfM3QnMb8vxu3qzg6QXrkHVmckqq
	M1NaXtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkK9m-00000007Zv5-0Kw0;
	Tue, 18 Feb 2025 09:44:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJvx-00000007WnE-0IcK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:30:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-439714a799aso26923285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 01:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739871027; x=1740475827; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wE00UcNy1SuGyWGuuvNBzcoUSeaUQC7bGOfR84asgzE=;
        b=aPmZ4ds/JwZisTUgjg5wAITEDmToSZPOyqwQF3q6pMcnP566ccHaKDZWBNdDmzJaIx
         ygFpHMIVIT93bHGkC/AJALQJ84gZ+eYars/D/BKRkod9na6zajBN0htLKOoeoFtPBD7b
         y7jNzY4i4f227kbhWjYNM6hVDfypceweBe5ZJBzUWutHWow9bNM5ERDhVzXWpwu+aQXz
         ewVkI08IGUdnjh2BJ10CPnjJ7xMO86yiQWUgWBxW7MIBeakPlUrcsiimojZfv/89imJv
         48UIMG15NJrwlaf5VamAN7EnceMi/my1MRE6zkMjRrpZHpO8VlWlm5J8TMb0g4mwohvs
         qFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739871027; x=1740475827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wE00UcNy1SuGyWGuuvNBzcoUSeaUQC7bGOfR84asgzE=;
        b=gzT9a7smky4m1G6xuP/4kpKVyzManGtaKJrIgz00aAds9ui20da1MruGEB5oIXYR9r
         +MEk3t8acRxJ08ozh/CwUMeAT2o1tynm08PrT7lpviGIkLdxAeGlgu6sorfQsyaJbSeF
         OHH9t08SkIt2/vIm3Q8d9dLhdbfFqzZsgZ2db15KM/QiZyWDyU5mgY20PpTw26sH1U5b
         k+Kn9ToW/X0szsjHAx2EAorUaTyZmtf6C8nFHH82B/vyMVYPihLjz+1h5c7hfVAZtFk8
         F8WS5Xxz4xLnqsVrbc0otvnv/USuCC9TLDFll6DRaRkHpj5PMSv8uYQlRBr6mh00dGZs
         3uOA==
X-Forwarded-Encrypted: i=1; AJvYcCVMwKiziKO7G35CQ4wHd+dibEoY/6mRYmgxY+LDOVJ1/PuopdF6Fjs1AKXvE8js6P/Sbn3Fm6/vkoQozRLW3WLS@lists.infradead.org
X-Gm-Message-State: AOJu0YxaT26AyBilj99eAcA3jSnOSdP02HtftP76QvnP66PuO1X7b68z
	uFI5SrBdpmWiNZmnBByCkjfYmYf9ADrqceRavxp1tqiCUGwtjbhowC1Mj5nDsYM=
X-Gm-Gg: ASbGncsc9v0UbYUQcVTizjjCVzQqjBHs2tZurTin7Z5WUm2Yuc9ghBj5IymZmFIif1X
	U/VSFLr6PiKszPSXpaumdLqezT1NouRuzgbkASkBbfxVhRDsVVvvH4UNRRWhYzFHWPE4KrPrxaP
	N662Hqz/N9G51tFLVzpP42WJ7bC5QuVxeAtnl5jYiwTo/gI8KbL59I1d91P6VcaK8xCLByPWDNQ
	h0GeCClG/rUOM/hGb1suLDkP3Aw61eQDs+THL9ASN13xsYzCo7g0rS4cYZiapXosn4K3zkV3Nza
	ejVq5P5TlUaAQo2nUFXrER9Nvg==
X-Google-Smtp-Source: AGHT+IHYnyamw8QWwyVOjp9nBW/UYW7o5DDa8xsRZ9a2WsL6I1a5A5iV6efBKOc6QgGc1zCXFPOP2Q==
X-Received: by 2002:a05:600c:1d1d:b0:439:8ada:e3b0 with SMTP id 5b1f17b1804b1-4398adae4e8mr39398645e9.19.1739871026824;
        Tue, 18 Feb 2025 01:30:26 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fc885sm144181505e9.9.2025.02.18.01.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 01:30:26 -0800 (PST)
Message-ID: <fe46069e-c52e-45ee-b4b3-8b929fb83b31@linaro.org>
Date: Tue, 18 Feb 2025 09:30:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] perf vendor events arm64: Add A720/A520
 events/metrics
To: Ian Rogers <irogers@google.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Namhyung Kim <namhyung@kernel.org>,
 linux-perf-users@vger.kernel.org, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Liang Kan <kan.liang@linux.intel.com>,
 Yoshihiro Furudera <fj5100bi@fujitsu.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_5360DA048EE5B8CF3104213F8D037C698208@qq.com>
 <Z66YjGvjD_yzEHUg@google.com>
 <tencent_45B4E91CA370C563D6420A1A25F992056D09@qq.com>
 <1b8b234f-6435-45cf-83e7-8e86c84f075f@linaro.org>
 <CAP-5=fVAhLLH-a0_wLo8dPoMLOb6rOJiTgGh-OFZJJoaLFE-8Q@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fVAhLLH-a0_wLo8dPoMLOb6rOJiTgGh-OFZJJoaLFE-8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_013029_105882_33FBEDDC 
X-CRM114-Status: GOOD (  20.83  )
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



On 18/02/2025 12:41 am, Ian Rogers wrote:
> On Fri, Feb 14, 2025 at 2:02 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 14/02/2025 5:49 am, Yangyu Chen wrote:
>>>
>>>
>>>> On 14 Feb 2025, at 09:12, Namhyung Kim <namhyung@kernel.org> wrote:
>>>>
>>>> Hello,
>>>>
>>>> On Thu, Feb 13, 2025 at 11:11:01PM +0800, Yangyu Chen wrote:
>>>>> This patchset adds the perf JSON files for the Cortex-A720 and Cortex-A520
>>>>> processors. Some events have been tested on Raxda Orion 6 with Cix P1 SoC
>>>>> (8xA720 + 4xA520) running mainline Kernel with ACPI mode.
>>>>
>>>> I'm curious how the name of PMUs look like.  It is cortex_a720 (or a520)?
>>>
>>> The name of PMUs comes from Arm's documentation. I have included these
>>> links in each patch.
>>>
>>>> I remember there's a logic to check the length of hex digits at the end.
>>>>
>>>
>>> Could you provide more details about this?
>>>
>>>> Ian, are you ok with this?
>>>>
>>
>> I think they wouldn't be merged because they're core PMUs, so should be
>> fine? Even though they would otherwise be merged because they're more
>> than 3 hex digits.
> 
> Do we know the PMU names? If they are cortex_a520 and cortex_a720 then

It will be "armv9_cortex_a720" from this line:

   PMUV3_INIT_SIMPLE(armv9_cortex_a720)

> this comment at least reads a little stale:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/util/pmus.c?h=perf-tools-next#n76
> ```
> /*
> * There is a '_{num}' suffix. For decimal suffixes any length
> * will do, for hexadecimal ensure more than 2 hex digits so
> * that S390's cpum_cf PMU doesn't match.
> */
> ```
> James is right that core PMUs aren't put on the same list as uncore/other PMUs.
> 
> Thanks,
> Ian
> 
>>>> Thanks,
>>>> Namhyung
>>>>
>>>>>
>>>>> Yangyu Chen (2):
>>>>>    perf vendor events arm64: Add Cortex-A720 events/metrics
>>>>>    perf vendor events arm64: Add Cortex-A520 events/metrics
>>>>>
>>>>> .../arch/arm64/arm/cortex-a520/bus.json       |  26 ++
>>>>> .../arch/arm64/arm/cortex-a520/exception.json |  18 +
>>>>> .../arm64/arm/cortex-a520/fp_operation.json   |  14 +
>>>>> .../arch/arm64/arm/cortex-a520/general.json   |   6 +
>>>>> .../arch/arm64/arm/cortex-a520/l1d_cache.json |  50 ++
>>>>> .../arch/arm64/arm/cortex-a520/l1i_cache.json |  14 +
>>>>> .../arch/arm64/arm/cortex-a520/l2_cache.json  |  46 ++
>>>>> .../arch/arm64/arm/cortex-a520/l3_cache.json  |  21 +
>>>>> .../arch/arm64/arm/cortex-a520/ll_cache.json  |  10 +
>>>>> .../arch/arm64/arm/cortex-a520/memory.json    |  58 +++
>>>>> .../arch/arm64/arm/cortex-a520/metrics.json   | 373 +++++++++++++++
>>>>> .../arch/arm64/arm/cortex-a520/pmu.json       |   8 +
>>>>> .../arch/arm64/arm/cortex-a520/retired.json   |  90 ++++
>>>>> .../arm64/arm/cortex-a520/spec_operation.json |  70 +++
>>>>> .../arch/arm64/arm/cortex-a520/stall.json     |  82 ++++
>>>>> .../arch/arm64/arm/cortex-a520/sve.json       |  22 +
>>>>> .../arch/arm64/arm/cortex-a520/tlb.json       |  78 ++++
>>>>> .../arch/arm64/arm/cortex-a520/trace.json     |  32 ++
>>>>> .../arch/arm64/arm/cortex-a720/bus.json       |  18 +
>>>>> .../arch/arm64/arm/cortex-a720/exception.json |  62 +++
>>>>> .../arm64/arm/cortex-a720/fp_operation.json   |  22 +
>>>>> .../arch/arm64/arm/cortex-a720/general.json   |  10 +
>>>>> .../arch/arm64/arm/cortex-a720/l1d_cache.json |  50 ++
>>>>> .../arch/arm64/arm/cortex-a720/l1i_cache.json |  14 +
>>>>> .../arch/arm64/arm/cortex-a720/l2_cache.json  |  62 +++
>>>>> .../arch/arm64/arm/cortex-a720/l3_cache.json  |  22 +
>>>>> .../arch/arm64/arm/cortex-a720/ll_cache.json  |  10 +
>>>>> .../arch/arm64/arm/cortex-a720/memory.json    |  54 +++
>>>>> .../arch/arm64/arm/cortex-a720/metrics.json   | 436 ++++++++++++++++++
>>>>> .../arch/arm64/arm/cortex-a720/pmu.json       |   8 +
>>>>> .../arch/arm64/arm/cortex-a720/retired.json   |  90 ++++
>>>>> .../arch/arm64/arm/cortex-a720/spe.json       |  42 ++
>>>>> .../arm64/arm/cortex-a720/spec_operation.json |  90 ++++
>>>>> .../arch/arm64/arm/cortex-a720/stall.json     |  82 ++++
>>>>> .../arch/arm64/arm/cortex-a720/sve.json       |  50 ++
>>>>> .../arch/arm64/arm/cortex-a720/tlb.json       |  74 +++
>>>>> .../arch/arm64/arm/cortex-a720/trace.json     |  32 ++
>>>>> .../arch/arm64/common-and-microarch.json      |  15 +
>>>>> tools/perf/pmu-events/arch/arm64/mapfile.csv  |   2 +
>>>>> 39 files changed, 2263 insertions(+)
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/bus.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/exception.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/fp_operation.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/general.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l1d_cache.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l1i_cache.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l2_cache.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l3_cache.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/ll_cache.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/memory.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/metrics.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/pmu.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/retired.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/spec_operation.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/stall.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/sve.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/tlb.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/trace.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/bus.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/exception.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/fp_operation.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/general.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l1d_cache.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l1i_cache.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l2_cache.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l3_cache.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/ll_cache.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/memory.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/metrics.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/pmu.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/retired.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/spe.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/spec_operation.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/stall.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/sve.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/tlb.json
>>>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/trace.json
>>>>>
>>>>> --
>>>>> 2.47.2
>>>>>
>>>
>>


