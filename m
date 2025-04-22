Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B88C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOD3Gx0CyCTCJeGS+Eyn7E5U4WA4L4fXoUPWM9d/JHA=; b=eVUqrm9+jhsuqrDkcmyzVtrUoe
	pD0ivGa9m6pSqKDfWSMEqzyZ+QVirB1QsJzPkrSp6eYI1g8ZsjDyWU0olKfiD1R+iTNzG/VsxUT7r
	eEUyNnXmLBse0oUJoBsYHWGcHMGa3hFU3CfmpQrdchrk2NzX59N7QExJIL8Ht6LPiv25pNRhgz566
	zHQGlenBPhOQkoTdEM7E3FXzfNv9RNQ+dxjYynJljdOaqZH+mARZ+C9On9NJWwDGXBnj0nPREY4Qq
	6WMydrbianpF+776BgjbZKWA7x23WGPcV5gQj823R/DdtkDjTIrXyIu8JDE12kTZuI6oabwrzyv7o
	boBwWwsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FgM-00000007kUK-0hpt;
	Tue, 22 Apr 2025 15:37:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EUm-00000007T8P-2UlI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:21:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56BF1152B;
	Tue, 22 Apr 2025 07:21:03 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 485253F66E;
	Tue, 22 Apr 2025 07:21:07 -0700 (PDT)
Date: Tue, 22 Apr 2025 15:21:02 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Liang Kan <kan.liang@linux.intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 2/2] coresight: etm-perf: Add AUX_NON_CONTIGUOUS_PAGES to
 cs_etm PMU
Message-ID: <20250422142102.GI28953@e132581.arm.com>
References: <20250421215818.3800081-1-yabinc@google.com>
 <20250421215818.3800081-3-yabinc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421215818.3800081-3-yabinc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_072108_677537_40488916 
X-CRM114-Status: GOOD (  20.38  )
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

On Mon, Apr 21, 2025 at 02:58:18PM -0700, Yabin Cui wrote:
> The cs_etm PMU, regardless of the underlying trace sink (ETF, ETR or
> TRBE), doesn't require contiguous pages for its AUX buffer.

Though contiguous pages are not mandatory for TRBE, I would set the
PERF_PMU_CAP_AUX_NO_SG flag for it.  This can potentially benefit
performance.

For non per CPU sinks, it is fine to allocate non-contiguous pages.

Thanks,
Leo

> This patch adds the PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES capability
> to the cs_etm PMU. This allows the kernel to allocate non-contiguous
> pages for the AUX buffer, reducing memory fragmentation when using
> cs_etm.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f4cccd68e625..c98646eca7f8 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -899,7 +899,8 @@ int __init etm_perf_init(void)
>  	int ret;
>  
>  	etm_pmu.capabilities		= (PERF_PMU_CAP_EXCLUSIVE |
> -					   PERF_PMU_CAP_ITRACE);
> +					   PERF_PMU_CAP_ITRACE |
> +					   PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES);
>  
>  	etm_pmu.attr_groups		= etm_pmu_attr_groups;
>  	etm_pmu.task_ctx_nr		= perf_sw_context;
> -- 
> 2.49.0.805.g082f7c87e0-goog
> 
> 

