Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0121BFC5903
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+Pe6E5F67ML6hKJke7YoqbvmtddOHGFr4A2w6RaLUU=; b=qFbdhNnWjN3zKHX33GJDqoGFCq
	0ifD+d0TUVz1JqEp/irnR4yqPt/5uhl3wwuV6A3HwTvwSE/UIwQGirZcjJBts6vSA1R9vvmTc4RFl
	6ZuysR4cg7qGhZERnhPn9n44wOEWEjxrthIcWLJgad63rALclMXrq95fNRwlYHsZkCnICofJb9DaY
	eLLhC66PzUet85K5dnS1TCAPQJiATdeSuA2RhulshaULP77/dXxN14sPmkZAT3gsSKzgrE3HfhIHL
	cqfZsW3i3GL5gc+4JJFwq9pGbAkRSWF17EBCThddnp4Z+mf3BQ9cPy4GqQFWarfDy3UDTC+SbiKk0
	K5bVRRkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVfm-00000005ZGe-2d5M;
	Thu, 26 Feb 2026 07:20:34 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVfj-00000005ZGG-1vfY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772090431; x=1803626431;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=tDr1730A/DrFy+JHRefGsmFg7lJjL+tJRJhPR7ZqTSI=;
  b=efJA96A39ccoSv63YD9I8jnFb/Cbn8DeNeT6dht2IvPt2Mn0+0Z7rFDA
   RMFeBdEs+o5p9TFsZg1jZA+1eTwTUkcZMeZ/eH/GfoimOgiJjAATe+4+2
   d2JSVKBxyhwcrj1Mi/neLkVXjBYVxExB1NHKB3cm2vxT+J1Bl/ozgNyTU
   T3yBfdlW85IiqP5O5U/wzs2oWrEXuUtpYva//LS2CSEl/tRy2GHob1T05
   dPkLLI6CAr1jMYIHvZwMA88ILgozX6Z/bUNG4lsEQmBCHQLCuJ/90jQPb
   7shmDsYsons+AJ1QIspLDQ4D3ChumGyN4+0CItL+FTBVQzagQXnBSpKUM
   Q==;
X-CSE-ConnectionGUID: YyJon129RmqAS/zFJewr6g==
X-CSE-MsgGUID: b1owyzMjR9K0fjuULbuuvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98615489"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="98615489"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:20:27 -0800
X-CSE-ConnectionGUID: bBkjfjIWS2CQWyLh2ByqVA==
X-CSE-MsgGUID: KhMYPWouR5qFHDgF4581kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="215591493"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.147]) ([10.124.241.147])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:20:23 -0800
Message-ID: <fd7649cf-d436-47ab-a7b9-eb5e915fce05@linux.intel.com>
Date: Thu, 26 Feb 2026 15:20:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/10] perf vendor events intel: Update lunarlake
 events from 1.18 to 1.20
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 James Clark <james.clark@linaro.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260226045301.459948-1-irogers@google.com>
 <20260226045301.459948-7-irogers@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260226045301.459948-7-irogers@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_232031_568434_44B464D8 
X-CRM114-Status: GOOD (  17.10  )
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

It seems a typo in the shortlog, it should be meteorlake instead of
lunarlake. :)

On 2/26/2026 12:52 PM, Ian Rogers wrote:
> The updated events were published in:
> https://github.com/intel/perfmon/commit/2eebd8e2612a0655e82b88e1d2fab960315c025b
> https://github.com/intel/perfmon/commit/81c4ce2c16f05b839d2c40e8cf183ed110357b73
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
>  .../pmu-events/arch/x86/meteorlake/cache.json | 67 ++++++++++++++++---
>  .../arch/x86/meteorlake/frontend.json         | 18 +++++
>  .../arch/x86/meteorlake/pipeline.json         | 46 +++++++++++--
>  4 files changed, 116 insertions(+), 17 deletions(-)
>
> diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
> index a2dde3faad5e..8d8fd8b08166 100644
> --- a/tools/perf/pmu-events/arch/x86/mapfile.csv
> +++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
> @@ -23,7 +23,7 @@ GenuineIntel-6-3E,v24,ivytown,core
>  GenuineIntel-6-2D,v24,jaketown,core
>  GenuineIntel-6-(57|85),v16,knightslanding,core
>  GenuineIntel-6-BD,v1.21,lunarlake,core
> -GenuineIntel-6-(AA|AC|B5),v1.18,meteorlake,core
> +GenuineIntel-6-(AA|AC|B5),v1.20,meteorlake,core
>  GenuineIntel-6-1[AEF],v4,nehalemep,core
>  GenuineIntel-6-2E,v4,nehalemex,core
>  GenuineIntel-6-CC,v1.02,pantherlake,core
> diff --git a/tools/perf/pmu-events/arch/x86/meteorlake/cache.json b/tools/perf/pmu-events/arch/x86/meteorlake/cache.json
> index d3fc04b2ffbd..4c1220c19456 100644
> --- a/tools/perf/pmu-events/arch/x86/meteorlake/cache.json
> +++ b/tools/perf/pmu-events/arch/x86/meteorlake/cache.json
> @@ -513,6 +513,15 @@
>          "UMask": "0x6",
>          "Unit": "cpu_atom"
>      },
> +    {
> +        "BriefDescription": "Counts the number of unhalted cycles when the core is stalled due to an ICACHE or ITLB miss which hit in the LLC, no snoop was required. LLC provides the data. If the core has access to an L3 cache, an LLC hit refers to an L3 cache hit, otherwise it counts zeros.",
> +        "Counter": "0,1,2,3,4,5,6,7",
> +        "EventCode": "0x35",
> +        "EventName": "MEM_BOUND_STALLS_IFETCH.LLC_HIT_NOSNOOP",
> +        "SampleAfterValue": "1000003",
> +        "UMask": "0x2",
> +        "Unit": "cpu_atom"
> +    },
>      {
>          "BriefDescription": "Counts the number of unhalted cycles when the core is stalled due to an ICACHE or ITLB miss which missed all the caches. If the core has access to an L3 cache, an LLC miss refers to an L3 cache miss, otherwise it is an L2 cache miss.",
>          "Counter": "0,1,2,3,4,5,6,7",
> @@ -522,6 +531,15 @@
>          "UMask": "0x78",
>          "Unit": "cpu_atom"
>      },
> +    {
> +        "BriefDescription": "Counts the number of unhalted cycles when the core is stalled due to an ICACHE or ITLB miss which missed all the caches. DRAM, MMIO or other LOCAL memory type provides the data. If the core has access to an L3 cache, an LLC miss refers to an L3 cache miss, otherwise it is an L2 cache miss.",
> +        "Counter": "0,1,2,3,4,5,6,7",
> +        "EventCode": "0x35",
> +        "EventName": "MEM_BOUND_STALLS_IFETCH.LLC_MISS_LOCALMEM",
> +        "SampleAfterValue": "1000003",
> +        "UMask": "0x50",
> +        "Unit": "cpu_atom"
> +    },
>      {
>          "BriefDescription": "Counts the number of unhalted cycles when the core is stalled due to an L1 demand load miss.",
>          "Counter": "0,1,2,3,4,5,6,7",
> @@ -559,6 +577,24 @@
>          "UMask": "0x6",
>          "Unit": "cpu_atom"
>      },
> +    {
> +        "BriefDescription": "Counts the number of unhalted cycles when the core is stalled due to a demand load miss which hit in the LLC, no snoop was required. LLC provides the data. If the core has access to an L3 cache, an LLC hit refers to an L3 cache hit, otherwise it counts zeros.",
> +        "Counter": "0,1,2,3,4,5,6,7",
> +        "EventCode": "0x34",
> +        "EventName": "MEM_BOUND_STALLS_LOAD.LLC_HIT_NOSNOOP",
> +        "SampleAfterValue": "1000003",
> +        "UMask": "0x2",
> +        "Unit": "cpu_atom"
> +    },
> +    {
> +        "BriefDescription": "Counts the number of unhalted cycles when the core is stalled due to a demand load miss which hit in the LLC, a snoop was required, the snoop misses or the snoop hits but NO_FWD. LLC provides the data. If the core has access to an L3 cache, an LLC hit refers to an L3 cache hit, otherwise it counts zeros.",
> +        "Counter": "0,1,2,3,4,5,6,7",
> +        "EventCode": "0x34",
> +        "EventName": "MEM_BOUND_STALLS_LOAD.LLC_HIT_SNOOP",
> +        "SampleAfterValue": "1000003",
> +        "UMask": "0x4",
> +        "Unit": "cpu_atom"
> +    },
>      {
>          "BriefDescription": "Counts the number of unhalted cycles when the core is stalled due to a demand load miss which missed all the local caches. If the core has access to an L3 cache, an LLC miss refers to an L3 cache miss, otherwise it is an L2 cache miss.",
>          "Counter": "0,1,2,3,4,5,6,7",
> @@ -568,6 +604,15 @@
>          "UMask": "0x78",
>          "Unit": "cpu_atom"
>      },
> +    {
> +        "BriefDescription": "Counts the number of unhalted cycles when the core is stalled to a demand load miss and the data was provided from an unknown source. If the core has access to an L3 cache, an LLC miss refers to an L3 cache miss, otherwise it is an L2 cache miss.",
> +        "Counter": "0,1,2,3,4,5,6,7",
> +        "EventCode": "0x34",
> +        "EventName": "MEM_BOUND_STALLS_LOAD.LLC_MISS_LOCALMEM",
> +        "SampleAfterValue": "1000003",
> +        "UMask": "0x50",
> +        "Unit": "cpu_atom"
> +    },
>      {
>          "BriefDescription": "Counts the number of unhalted cycles when the core is stalled to a store buffer full condition",
>          "Counter": "0,1,2,3,4,5,6,7",
> @@ -969,7 +1014,7 @@
>          "Unit": "cpu_atom"
>      },
>      {
> -        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
> +        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 1024. Only counts with PEBS enabled.",
>          "Counter": "0,1",
>          "Data_LA": "1",
>          "EventCode": "0xd0",
> @@ -981,7 +1026,7 @@
>          "Unit": "cpu_atom"
>      },
>      {
> -        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
> +        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 128. Only counts with PEBS enabled.",
>          "Counter": "0,1",
>          "Data_LA": "1",
>          "EventCode": "0xd0",
> @@ -993,7 +1038,7 @@
>          "Unit": "cpu_atom"
>      },
>      {
> -        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
> +        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 16. Only counts with PEBS enabled.",
>          "Counter": "0,1",
>          "Data_LA": "1",
>          "EventCode": "0xd0",
> @@ -1005,7 +1050,7 @@
>          "Unit": "cpu_atom"
>      },
>      {
> -        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
> +        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 2048. Only counts with PEBS enabled.",
>          "Counter": "0,1",
>          "Data_LA": "1",
>          "EventCode": "0xd0",
> @@ -1017,7 +1062,7 @@
>          "Unit": "cpu_atom"
>      },
>      {
> -        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
> +        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 256. Only counts with PEBS enabled.",
>          "Counter": "0,1",
>          "Data_LA": "1",
>          "EventCode": "0xd0",
> @@ -1029,7 +1074,7 @@
>          "Unit": "cpu_atom"
>      },
>      {
> -        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
> +        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 32. Only counts with PEBS enabled.",
>          "Counter": "0,1",
>          "Data_LA": "1",
>          "EventCode": "0xd0",
> @@ -1041,7 +1086,7 @@
>          "Unit": "cpu_atom"
>      },
>      {
> -        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
> +        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 4. Only counts with PEBS enabled.",
>          "Counter": "0,1",
>          "Data_LA": "1",
>          "EventCode": "0xd0",
> @@ -1053,7 +1098,7 @@
>          "Unit": "cpu_atom"
>      },
>      {
> -        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
> +        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 512. Only counts with PEBS enabled.",
>          "Counter": "0,1",
>          "Data_LA": "1",
>          "EventCode": "0xd0",
> @@ -1065,7 +1110,7 @@
>          "Unit": "cpu_atom"
>      },
>      {
> -        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
> +        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 64. Only counts with PEBS enabled.",
>          "Counter": "0,1",
>          "Data_LA": "1",
>          "EventCode": "0xd0",
> @@ -1077,7 +1122,7 @@
>          "Unit": "cpu_atom"
>      },
>      {
> -        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
> +        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 8. Only counts with PEBS enabled.",
>          "Counter": "0,1",
>          "Data_LA": "1",
>          "EventCode": "0xd0",
> @@ -1159,7 +1204,7 @@
>          "Unit": "cpu_atom"
>      },
>      {
> -        "BriefDescription": "Counts the number of  stores uops retired same as MEM_UOPS_RETIRED.ALL_STORES",
> +        "BriefDescription": "Counts the number of stores uops retired.",
>          "Counter": "0,1,2,3,4,5,6,7",
>          "Data_LA": "1",
>          "EventCode": "0xd0",
> diff --git a/tools/perf/pmu-events/arch/x86/meteorlake/frontend.json b/tools/perf/pmu-events/arch/x86/meteorlake/frontend.json
> index 6484834b1127..dcf8c8e720f3 100644
> --- a/tools/perf/pmu-events/arch/x86/meteorlake/frontend.json
> +++ b/tools/perf/pmu-events/arch/x86/meteorlake/frontend.json
> @@ -430,6 +430,24 @@
>          "UMask": "0x4",
>          "Unit": "cpu_core"
>      },
> +    {
> +        "BriefDescription": "ICACHE_TAG.STALLS_INUSE",
> +        "Counter": "0,1,2,3",
> +        "EventCode": "0x83",
> +        "EventName": "ICACHE_TAG.STALLS_INUSE",
> +        "SampleAfterValue": "200003",
> +        "UMask": "0x10",
> +        "Unit": "cpu_core"
> +    },
> +    {
> +        "BriefDescription": "ICACHE_TAG.STALLS_ISB",
> +        "Counter": "0,1,2,3",
> +        "EventCode": "0x83",
> +        "EventName": "ICACHE_TAG.STALLS_ISB",
> +        "SampleAfterValue": "200003",
> +        "UMask": "0x8",
> +        "Unit": "cpu_core"
> +    },
>      {
>          "BriefDescription": "Cycles Decode Stream Buffer (DSB) is delivering any Uop",
>          "Counter": "0,1,2,3",
> diff --git a/tools/perf/pmu-events/arch/x86/meteorlake/pipeline.json b/tools/perf/pmu-events/arch/x86/meteorlake/pipeline.json
> index bfdaabe9377d..7662846745bd 100644
> --- a/tools/perf/pmu-events/arch/x86/meteorlake/pipeline.json
> +++ b/tools/perf/pmu-events/arch/x86/meteorlake/pipeline.json
> @@ -517,7 +517,7 @@
>          "Unit": "cpu_core"
>      },
>      {
> -        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles",
> +        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles. [This event is alias to CPU_CLK_UNHALTED.THREAD]",
>          "Counter": "Fixed counter 1",
>          "EventName": "CPU_CLK_UNHALTED.CORE",
>          "SampleAfterValue": "2000003",
> @@ -583,7 +583,7 @@
>          "Unit": "cpu_core"
>      },
>      {
> -        "BriefDescription": "Fixed Counter: Counts the number of unhalted reference clock cycles",
> +        "BriefDescription": "Fixed Counter: Counts the number of unhalted reference clock cycles.",
>          "Counter": "Fixed counter 2",
>          "EventName": "CPU_CLK_UNHALTED.REF_TSC",
>          "SampleAfterValue": "2000003",
> @@ -620,7 +620,7 @@
>          "Unit": "cpu_core"
>      },
>      {
> -        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles",
> +        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles. [This event is alias to CPU_CLK_UNHALTED.CORE]",
>          "Counter": "Fixed counter 1",
>          "EventName": "CPU_CLK_UNHALTED.THREAD",
>          "SampleAfterValue": "2000003",
> @@ -804,10 +804,10 @@
>          "Unit": "cpu_core"
>      },
>      {
> -        "BriefDescription": "Fixed Counter: Counts the number of instructions retired",
> +        "BriefDescription": "Fixed Counter: Counts the number of instructions retired.",
>          "Counter": "Fixed counter 0",
>          "EventName": "INST_RETIRED.ANY",
> -        "PublicDescription": "Fixed Counter: Counts the number of instructions retired Available PDIST counters: 32",
> +        "PublicDescription": "Fixed Counter: Counts the number of instructions retired. Available PDIST counters: 32",
>          "SampleAfterValue": "2000003",
>          "UMask": "0x1",
>          "Unit": "cpu_atom"
> @@ -1207,6 +1207,42 @@
>          "UMask": "0x20",
>          "Unit": "cpu_core"
>      },
> +    {
> +        "BriefDescription": "Counts the number of CLFLUSH, CLWB, and CLDEMOTE instructions retired.",
> +        "Counter": "0,1,2,3,4,5,6,7",
> +        "EventCode": "0xe0",
> +        "EventName": "MISC_RETIRED1.CL_INST",
> +        "SampleAfterValue": "1000003",
> +        "UMask": "0xff",
> +        "Unit": "cpu_atom"
> +    },
> +    {
> +        "BriefDescription": "Counts the number of LFENCE instructions retired.",
> +        "Counter": "0,1,2,3,4,5,6,7",
> +        "EventCode": "0xe0",
> +        "EventName": "MISC_RETIRED1.LFENCE",
> +        "SampleAfterValue": "1000003",
> +        "UMask": "0x2",
> +        "Unit": "cpu_atom"
> +    },
> +    {
> +        "BriefDescription": "Counts the number of accesses to KeyLocker cache.",
> +        "Counter": "0,1,2,3,4,5,6,7",
> +        "EventCode": "0xe1",
> +        "EventName": "MISC_RETIRED2.KEYLOCKER_ACCESS",
> +        "SampleAfterValue": "1000003",
> +        "UMask": "0x10",
> +        "Unit": "cpu_atom"
> +    },
> +    {
> +        "BriefDescription": "Counts the number of misses to KeyLocker cache.",
> +        "Counter": "0,1,2,3,4,5,6,7",
> +        "EventCode": "0xe1",
> +        "EventName": "MISC_RETIRED2.KEYLOCKER_MISS",
> +        "SampleAfterValue": "1000003",
> +        "UMask": "0x11",
> +        "Unit": "cpu_atom"
> +    },
>      {
>          "BriefDescription": "Cycles stalled due to no store buffers available. (not including draining form sync).",
>          "Counter": "0,1,2,3,4,5,6,7",

