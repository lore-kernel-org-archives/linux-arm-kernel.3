Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4D71073CA6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 12:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/FDyok7Gct/nyBOt42DC7zGYEhAt2O0xoN1lkGESnU=; b=d8kfgdlW4xe2ypk/ItomdxwufL
	KXHDXUHZzOFhi2FXui7NpxNdeA3/e02gQvlXCvNpiEpSb/tjlQ5O1oU5Eqft0QZJa047B11uIfCfn
	eYKrbZe4vZD1gCLMBKgd9TAfqUZz8ekq3LDOZdd4TgYyoqLtTOtFosqXYL3gXYwRpdpbeTkcWx+hf
	rtViWosVIC8RC5e/xJcEoUHZgtlGQFMIa72c1pYoKhxOH4pExFjx/RgIcHK8SjZasO+Wx96DPD29q
	JS0Mj/81cpja1DqslXZiXKYbqI610YsOanGKRzP7I2gkWFWIdwWHm3IU7ojMoqQhTWJ0e7GP2Nl6j
	Q5nn83oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARwZ-00000008p2x-2Qfp;
	Wed, 08 Apr 2026 12:23:39 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARwW-00000008p1m-13ub
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 12:23:37 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775650994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/FDyok7Gct/nyBOt42DC7zGYEhAt2O0xoN1lkGESnU=;
	b=WDPvh8oiXIk4D+Rc3p+YhpZYZr2VB7c2ClndCrhNwsArAe7+VxY2QFT+RWVRTBPPidKVsL
	gnp+yKgOZfQj0MEmTx8Lo9AYOpkpWW1LcXY75xzBhF4lyDiVllUmhYf0kBJVBr8fMxVMmO
	04ydKb8YW6/uj78GmiUorwvnTS1FHEc=
From: Usama Arif <usama.arif@linux.dev>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	bpf@vger.kernel.org,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2 1/4] perf/arm_pmuv3: Fix NULL pointer dereference in armv8pmu_sched_task()
Date: Wed,  8 Apr 2026 05:23:05 -0700
Message-ID: <20260408122307.1360475-1-usama.arif@linux.dev>
In-Reply-To: <20260318171706.2840512-2-puranjay@kernel.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_052336_466280_36FE2ACC 
X-CRM114-Status: GOOD (  13.47  )
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

On Wed, 18 Mar 2026 10:16:55 -0700 Puranjay Mohan <puranjay@kernel.org> wrote:

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
> 
> The bug was introduced by commit fa9d27773873 ("perf: arm_pmu: Kill last
> use of per-CPU cpu_armpmu pointer") which changed the function from
> using the per-CPU cpu_armpmu pointer (always valid) to dereferencing
> pmu_ctx->pmu without adding a NULL check.
> 
> Add a NULL check for pmu_ctx to avoid the crash.
> 
> Fixes: fa9d27773873 ("perf: arm_pmu: Kill last use of per-CPU cpu_armpmu pointer")
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  drivers/perf/arm_pmuv3.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Acked-by: Usama Arif <usama.arif@linux.dev>

