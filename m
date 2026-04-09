Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468CEEA3C55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+c+2TMxYKY2a4wM1MvWgoQ09l9IpuEa9qHduc6bw10=; b=vtkdXCIi96n8g2q+QAsbhQK9b3
	spz5qjQfGlGNKC+Y9rdbjg97Ye4jjidNHc1pDzlc0EkprPCh7Sk2gFRS3tayRhoilJb5Fa19Ud39j
	maQZlmhk4Ry6sT8myjWK4i2w4Meh6UjiRww7O0CKQ65QIcK9D1eKfSXz0nsbIu2hw7Ogz+3WT7wwh
	ZZWX1ME4nsISkLg7Qvef76aB5Fa82OPOHjHIH03aGKmpyTvCCON4xUdTxbswYw+SEwEGhKqFuUS7r
	MIhXWH66+n3nbyBYzyDYg+wh/pNHDsZnqoznU+1m1HLom5EQJpZADU2HJYsJwoiOS6Zp0VEaSPW6E
	dKJZZrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnVO-0000000AGT6-1v7S;
	Thu, 09 Apr 2026 11:25:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnVM-0000000AGST-0DFr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 11:25:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1818E2E98;
	Thu,  9 Apr 2026 04:24:50 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66E053F632;
	Thu,  9 Apr 2026 04:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775733895; bh=HW235KFpjxbKvTk+WbTpyUdPgeAVRwPuLJY5veTJkmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MgaSFhU9wXsL9zjTQF337jQVFlBf0oLy4vD54DYAxMiZy9QaQXdCtRRSM6lNzjm7F
	 3pcPS5GyUE9NXWHm2gnn0rw+TJ1T4Bmq9xK0TG3OI6zcbldMwhU5bNi3Gx0Fr7VC4r
	 2CSnXBKqomALzglM9nDb23FJC0vpiVkBJLUyM7G0=
Date: Thu, 9 Apr 2026 12:24:53 +0100
From: Leo Yan <leo.yan@arm.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Rob Herring <robh@kernel.org>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, kernel-team@meta.com,
	James Clark <James.Clark@arm.com>
Subject: Re: [PATCH v2 1/4] perf/arm_pmuv3: Fix NULL pointer dereference in
 armv8pmu_sched_task()
Message-ID: <20260409112453.GR356832@e132581.arm.com>
References: <20260318171706.2840512-1-puranjay@kernel.org>
 <20260318171706.2840512-2-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318171706.2840512-2-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_042500_239707_1D25029C 
X-CRM114-Status: GOOD (  15.51  )
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

Hi Puranjay,

On Wed, Mar 18, 2026 at 10:16:55AM -0700, Puranjay Mohan wrote:
> This is easily triggered with:
> 
>   perf record -b -e cycles -a -- ls
> 
> which crashes on the first context switch with:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 00[.]
>   PC is at armv8pmu_sched_task+0x14/0x50
>   LR is at perf_pmu_sched_task+0xac/0x108
>   Call trace:
>     armv8pmu_sched_task+0x14/0x50 (P)
>     perf_pmu_sched_task+0xac/0x108
>     __perf_event_task_sched_out+0x6c/0xe0
>     prepare_task_switch+0x120/0x268
>     __schedule+0x1e8/0x828
>     ...
> 
> perf_pmu_sched_task() invokes the PMU sched callback with cpc->task_epc,
> which is NULL when no per-task events exist for this PMU. With CPU-wide
> branch-stack events, armv8pmu_sched_task() is still registered and
> dereferences pmu_ctx->pmu unconditionally, causing the crash.

Would not this is a bug in perf core layer that it should properly
pass &cpc->epc for CPU wide trace?

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 89b40e439717..a8cd0a26effa 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3906,7 +3906,8 @@ static void __perf_pmu_sched_task(struct perf_cpu_pmu_context *cpc,
        perf_ctx_lock(cpuctx, cpuctx->task_ctx);
        perf_pmu_disable(pmu);

-       pmu->sched_task(cpc->task_epc, task, sched_in);
+       pmu->sched_task(cpc->task_epc ? cpc->task_epc : &cpc->epc,
+                       task, sched_in);

        perf_pmu_enable(pmu);
        perf_ctx_unlock(cpuctx, cpuctx->task_ctx);


I checked other archs, most of them don't use the parameter *pmu_ctx
so the issue never hits.

My understanding is that for CPU-wide (or system-wide) tracing, we still
need to invalidate the branch record on a task switch so that a branch
stack is recorded within the same context.

Thanks,
Leo

