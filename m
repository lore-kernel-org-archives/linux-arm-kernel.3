Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23267C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnz59lq7Mwo2c8sTomXViytjgGyZ+J7WBRI6d6haKhs=; b=W8eO3Zxl8MlKzuCj4papkWSZs/
	v7/vNIzTJJmpoycQbj2Ml115NOsnEJ6dI+ExCnEZdxF+ABU57c4gtLwea9Rs6ajsfHgkvhubUsUGN
	yxV/gz9iNcjhrx0xvWBaDkLYSzXoPqxAckdnQzQa6XocfkGdtsr7dgkxFfI/7QBeMlkBK6luBRyPA
	3GqHw0MpRf/VSspYh9zwudB1ia/Fs5OAhICJ2SCtIRnlVNygenOq5JOAon8kp3HTI8kOGRO1tIBaB
	t0A4N+XXrKiUhpngPtJbnzEyPf7SQri49bd/Z9+xvvB+InNaEV0XP1Fh5IQGUvk4+IGSRmGWE+4FA
	XiRzwWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsH3j-00000007Xe7-2vSf;
	Fri, 07 Aug 2026 09:40:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsH3i-00000007Xdp-0JFf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 09:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dnz59lq7Mwo2c8sTomXViytjgGyZ+J7WBRI6d6haKhs=; b=P6oY7SWCP18IEwUeJ6yTRu0HMW
	ZUI1Z14yj/kKBua+s3dIWdkntudv6fPuHQlmu40iOua/T1L/2Yl6vaPq9FUSloxuI8d90e3tCUHBt
	icmmAl9PuUPYV2F5lbMXWIFGNOOarKmJVVcmXEmjOZYM6ieB+mFnBWJ/AFMg0Psif3hFSjPmXrk2o
	jxHDHLf8kASWJ7oZD6GPrWVOQGyeD6rnJcLBFT737HT8RAsh4l9gnh2pZGVYv+tsxFMBTFpBkc+Kp
	SSlmuwEXEcNcOt4Pm5ozgY9R65Ww8B0NtObF3MupGhRYszTWvK22X9wDR/HoN9ivIRV7YpCTunEHH
	zwwkTMvQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsH3R-00000008jyf-1P34;
	Fri, 07 Aug 2026 09:39:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2DBCC3004C9; Fri, 07 Aug 2026 11:39:51 +0200 (CEST)
Date: Fri, 7 Aug 2026 11:39:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Usama Arif <usama.arif@linux.dev>, Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v6 1/3] perf/core: Fix NULL pmu_ctx passed to
 pmu->sched_task()
Message-ID: <20260807093951.GS776954@noisy.programming.kicks-ass.net>
References: <20260806135224.3267890-1-puranjay@kernel.org>
 <20260806135224.3267890-2-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806135224.3267890-2-puranjay@kernel.org>
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

On Thu, Aug 06, 2026 at 06:52:21AM -0700, Puranjay Mohan wrote:
> perf_pmu_sched_task() returns early when cpuctx->task_ctx is set, and
> cpc->task_epc is only non-NULL while a task context is scheduled in on
> this CPU. __perf_pmu_sched_task() therefore always passes NULL:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 00
>   pc : armv8pmu_sched_task+0x14/0x50
>   Call trace:
>    armv8pmu_sched_task+0x14/0x50 (P)
>    perf_pmu_sched_task+0xac/0x108
>    __perf_event_task_sched_out+0x6c/0xe0
> 
> Pass &cpc->epc instead. __perf_init_event_pmu_context() sets its ->pmu
> when the PMU is registered; ->ctx stays NULL until a CPU-wide event
> attaches. That is enough here because armv8pmu_sched_task() is the only
> in-tree implementation that dereferences the argument at all, and it
> only reads ->pmu. The oops therefore needs BRBE, which arrived in v6.17.
> 
> Fixes: bd2756811766 ("perf: Rewrite core context handling")
> Cc: stable@vger.kernel.org
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  kernel/events/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index b282de3e7d7ca..9815894b67e77 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -3907,7 +3907,8 @@ static void __perf_pmu_sched_task(struct perf_cpu_pmu_context *cpc,
>  	perf_ctx_lock(cpuctx, cpuctx->task_ctx);
>  	perf_pmu_disable(pmu);
>  
> -	pmu->sched_task(cpc->task_epc, task, sched_in);
> +	pmu->sched_task(cpc->task_epc ? cpc->task_epc : &cpc->epc,
> +			task, sched_in);

This can be written like: cpc->task_epc ?: &cpc->epc.

However, if cpc-task_epc is always NULL, then this all seems like an
overly complicated way of writing: &cpc->epc. What gives?

