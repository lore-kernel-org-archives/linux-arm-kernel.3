Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77491C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 01:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doNaHkXJXuFhn5Xcym0Yj5xuZsw1x9SqT36ZRZ4d1qI=; b=w2FJFGHWayfIUMLWDPWTMDrcrB
	7JqDkd/kM2v25ScW6mZer+PuqKgeC8oBoucVFlMlR9pr62mIQJDWkRt89OyiLf90ThW64idsnNAaE
	mDeRSFNJox9hrd0M8gyPyEF8Zt4vxqknoEhURjxvetHubtV8EMPCKs0bCnuGO2iVhpDXTXoD3Qloj
	sFasgU7OfAZirK3uuPBv8krp20DN4UOfoeFG3pJWaXCxE6BlgDpnlIGWtZ0g0PeIRtKEiPjw7DS3z
	vjKAEP+6KBnd4WHkELbOC8E1Eo30+FEodaQWNWqR/X2SFYblkjnOBBkdDC/uilw+JEfNCUJvd8lhb
	qE8u5Hjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tikHZ-0000000DA8g-2ixs;
	Fri, 14 Feb 2025 01:14:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tikG8-0000000DA1M-1D9E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 01:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 229E45C5CF2;
	Fri, 14 Feb 2025 01:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEEAC4CED1;
	Fri, 14 Feb 2025 01:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739495567;
	bh=Uf7KzL9WUh6ptAfCWAiZd4xZ1TBn2O4qJ3v/t3unK2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QF+90VtCu0Qy9Qs11LfnFFmM+c4AZXwaPi+22mYhA5cpsTMFj5jtbda7Oyvm4hg1w
	 4gzE3zvARRvK6BWpsxVdy9d4ibrbM0h2UYeUi9LZyK6p10uhjqvaT0PuDz0C4snJfY
	 Yeiy0QyMed5OTa1oogyOr3vr/nwrCroNp0jhnfTMGPINL1TvKXt0VL72U0jT32QkUA
	 FNsUgdbJsT95jecGOYRkHm1M17aR86xiVctJZk6aNgdJsdHQSw5i0nEehwCYRd0Ko5
	 MOtoSGT99m/dTlVghcDfFF6F7torCq1ALgTySN52JkHyeYeJgwyo1dOasPEBJDPO79
	 Jdjp12k8LOcBQ==
Date: Thu, 13 Feb 2025 17:12:44 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>, Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org, John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Liang Kan <kan.liang@linux.intel.com>,
	Yoshihiro Furudera <fj5100bi@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] perf vendor events arm64: Add A720/A520
 events/metrics
Message-ID: <Z66YjGvjD_yzEHUg@google.com>
References: <tencent_5360DA048EE5B8CF3104213F8D037C698208@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_5360DA048EE5B8CF3104213F8D037C698208@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_171248_416119_4E24CBE4 
X-CRM114-Status: GOOD (  14.18  )
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

Hello,

On Thu, Feb 13, 2025 at 11:11:01PM +0800, Yangyu Chen wrote:
> This patchset adds the perf JSON files for the Cortex-A720 and Cortex-A520
> processors. Some events have been tested on Raxda Orion 6 with Cix P1 SoC
> (8xA720 + 4xA520) running mainline Kernel with ACPI mode.

I'm curious how the name of PMUs look like.  It is cortex_a720 (or a520)?
I remember there's a logic to check the length of hex digits at the end.

Ian, are you ok with this?

Thanks,
Namhyung

> 
> Yangyu Chen (2):
>   perf vendor events arm64: Add Cortex-A720 events/metrics
>   perf vendor events arm64: Add Cortex-A520 events/metrics
> 
>  .../arch/arm64/arm/cortex-a520/bus.json       |  26 ++
>  .../arch/arm64/arm/cortex-a520/exception.json |  18 +
>  .../arm64/arm/cortex-a520/fp_operation.json   |  14 +
>  .../arch/arm64/arm/cortex-a520/general.json   |   6 +
>  .../arch/arm64/arm/cortex-a520/l1d_cache.json |  50 ++
>  .../arch/arm64/arm/cortex-a520/l1i_cache.json |  14 +
>  .../arch/arm64/arm/cortex-a520/l2_cache.json  |  46 ++
>  .../arch/arm64/arm/cortex-a520/l3_cache.json  |  21 +
>  .../arch/arm64/arm/cortex-a520/ll_cache.json  |  10 +
>  .../arch/arm64/arm/cortex-a520/memory.json    |  58 +++
>  .../arch/arm64/arm/cortex-a520/metrics.json   | 373 +++++++++++++++
>  .../arch/arm64/arm/cortex-a520/pmu.json       |   8 +
>  .../arch/arm64/arm/cortex-a520/retired.json   |  90 ++++
>  .../arm64/arm/cortex-a520/spec_operation.json |  70 +++
>  .../arch/arm64/arm/cortex-a520/stall.json     |  82 ++++
>  .../arch/arm64/arm/cortex-a520/sve.json       |  22 +
>  .../arch/arm64/arm/cortex-a520/tlb.json       |  78 ++++
>  .../arch/arm64/arm/cortex-a520/trace.json     |  32 ++
>  .../arch/arm64/arm/cortex-a720/bus.json       |  18 +
>  .../arch/arm64/arm/cortex-a720/exception.json |  62 +++
>  .../arm64/arm/cortex-a720/fp_operation.json   |  22 +
>  .../arch/arm64/arm/cortex-a720/general.json   |  10 +
>  .../arch/arm64/arm/cortex-a720/l1d_cache.json |  50 ++
>  .../arch/arm64/arm/cortex-a720/l1i_cache.json |  14 +
>  .../arch/arm64/arm/cortex-a720/l2_cache.json  |  62 +++
>  .../arch/arm64/arm/cortex-a720/l3_cache.json  |  22 +
>  .../arch/arm64/arm/cortex-a720/ll_cache.json  |  10 +
>  .../arch/arm64/arm/cortex-a720/memory.json    |  54 +++
>  .../arch/arm64/arm/cortex-a720/metrics.json   | 436 ++++++++++++++++++
>  .../arch/arm64/arm/cortex-a720/pmu.json       |   8 +
>  .../arch/arm64/arm/cortex-a720/retired.json   |  90 ++++
>  .../arch/arm64/arm/cortex-a720/spe.json       |  42 ++
>  .../arm64/arm/cortex-a720/spec_operation.json |  90 ++++
>  .../arch/arm64/arm/cortex-a720/stall.json     |  82 ++++
>  .../arch/arm64/arm/cortex-a720/sve.json       |  50 ++
>  .../arch/arm64/arm/cortex-a720/tlb.json       |  74 +++
>  .../arch/arm64/arm/cortex-a720/trace.json     |  32 ++
>  .../arch/arm64/common-and-microarch.json      |  15 +
>  tools/perf/pmu-events/arch/arm64/mapfile.csv  |   2 +
>  39 files changed, 2263 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/bus.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/exception.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/fp_operation.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/general.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l1d_cache.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l1i_cache.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l2_cache.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l3_cache.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/ll_cache.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/memory.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/metrics.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/pmu.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/retired.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/spec_operation.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/stall.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/sve.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/tlb.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/trace.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/bus.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/exception.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/fp_operation.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/general.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l1d_cache.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l1i_cache.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l2_cache.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l3_cache.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/ll_cache.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/memory.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/metrics.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/pmu.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/retired.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/spe.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/spec_operation.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/stall.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/sve.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/tlb.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/trace.json
> 
> -- 
> 2.47.2
> 

