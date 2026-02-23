Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEB7EC111E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sADTQtIRYR+VJutrUNJJ+f+f3upzIebxZxHC/UMsEs0=; b=nDSmMb7FTMJi1VxbeDv70/YSkL
	oqffjpfQEIxXNSIropD5rTuaS/G8dKlh9DXF3Vq/P80CTJ4zjCLRicV/ooCagVyRKPnq5XHA5eh3j
	C8Uue+fYvaJobiYaEelB3BB9rxMcsGYSCBmmw/VJROgIpnyLWfl4NdNnmej46EEAZWDOIM4aAdeaJ
	ybwd43zi2pmE0r7TatWHqhGCHqSLYNsweVM0X3wtb/eorFjU1VZPUtWHEiFpXUvtj5EGC58swBCa8
	TDxmLD4GSr+qP5YB4BiizwygpYy5TIGulvEOYtj9GQybAqPaBqrBoBGbsVG9nFwAQ4++OJWGAjha3
	jsX/uL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuagd-00000000s6L-0DH2;
	Mon, 23 Feb 2026 18:29:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaga-00000000s5W-2FDH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 18:29:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 812C941B21;
	Mon, 23 Feb 2026 18:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE51C116D0;
	Mon, 23 Feb 2026 18:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771871375;
	bh=7q9I/7S8FyRGn41y8c5S+a9DguTOS0i3PPacEUgQRsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qgnUJpT/wj6s6lkwWB/umzdAEHvuHRCFQ7ir0Vn78bLZnyRFTr176ZVjiVQAtOYFp
	 CzcQrrwBcZizcrcI89uZHn00FdON3GaK53mcUXzJOmBJBxBykeiM/reEOuwX6RLVlN
	 wiuNUkdxqp6+ZP6XPX3BIab7NESRGvPQsG84Wlqb/wzjEzctBr43M406V0A70avEd6
	 kFTI/TpueJq4b69m5CYf8z7rht9XMH1j2MOfm5jfBDjzBpD6U3KEraC9QkKiE2+UY6
	 MSd50rmoEQjHeHMYKoewR6MbQHRYUWEAWMYHNKJhqcCwESgxpBIsCLd/HLjJx12VYm
	 a5zHbXXb1UhXg==
Date: Mon, 23 Feb 2026 18:29:28 +0000
From: Will Deacon <will@kernel.org>
To: Jie Zhan <zhanjie9@hisilicon.com>
Cc: Sumit Gupta <sumitg@nvidia.com>, catalin.marinas@arm.com,
	zhenglifeng1@huawei.com, viresh.kumar@linaro.org, rafael@kernel.org,
	beata.michalska@arm.com, pierre.gondois@arm.com,
	ionela.voinescu@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, treding@nvidia.com,
	jonathanh@nvidia.com, bbasu@nvidia.com
Subject: Re: [PATCH] arm64: topology: Fix false warning in
 counters_read_on_cpu() for same-CPU reads
Message-ID: <aZyciAy8zCvrvGB7@willie-the-truck>
References: <20260127080700.3565546-1-sumitg@nvidia.com>
 <3c6d58b2-b4c9-4dc7-a705-b7626e127f33@hisilicon.com>
 <aXoJUYDrhuJgkXEr@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXoJUYDrhuJgkXEr@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_102936_615391_8D628725 
X-CRM114-Status: GOOD (  26.96  )
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

On Wed, Jan 28, 2026 at 01:04:17PM +0000, Will Deacon wrote:
> On Wed, Jan 28, 2026 at 06:50:42PM +0800, Jie Zhan wrote:
> > On 1/27/2026 4:07 PM, Sumit Gupta wrote:
> > > The counters_read_on_cpu() function warns when called with IRQs disabled
> > > to prevent deadlock in smp_call_function_single(). However, this warning
> > > is spurious when reading counters on the current CPU since no IPI is
> > > needed for same-CPU reads.
> > > 
> > > Commit 12eb8f4fff24 ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks
> > > for non-PCC regs") changed the CPPC Frequency Invariance Engine to read
> > > AMU counters directly from the scheduler tick for non-PCC register
> > > spaces (like FFH), instead of deferring to a kthread. This means
> > > counters_read_on_cpu() is now called with IRQs disabled from the tick
> > > handler, triggering the warning:
> > > 
> > > | WARNING: arch/arm64/kernel/topology.c:410 at counters_read_on_cpu
> > > | ...
> > > | Call trace:
> > > |  counters_read_on_cpu+0x88/0xa8 (P)
> > > |  cpc_read_ffh+0xdc/0x148
> > > |  cpc_read+0x260/0x518
> > > |  cppc_get_perf_ctrs+0xf0/0x398
> > > |  __cppc_scale_freq_tick+0x4c/0x148 [cppc_cpufreq]
> > > |  cppc_scale_freq_tick+0x44/0x88 [cppc_cpufreq]
> > > |  topology_scale_freq_tick+0x34/0x58
> > > |  sched_tick+0x58/0x300
> > > |  update_process_times+0xcc/0x120
> > > |  tick_nohz_handler+0xa8/0x260
> > > |  __hrtimer_run_queues+0x154/0x360
> > > |  hrtimer_interrupt+0xf4/0x2b0
> > > |  arch_timer_handler_phys+0x4c/0x78
> > > |  ....
> > > |  CPPC Cpufreq:__cppc_scale_freq_tick: failed to read perf counters
> > > |  ....
> > > 
> > > Fix this by calling the counter read function directly for same-CPU
> > > case, bypassing smp_call_function_single() entirely. Use get_cpu() to
> > > disable preemption as the counter read functions call this_cpu_has_cap()
> > > which requires a non-preemptible context.
> > > 
> > > Fixes: 12eb8f4fff24 ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs")
> > > Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> > 
> > Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com>
> > 
> > Looks fine for me except for the minor comment wrapping.
> > 
> > Thanks for spotting this.
> > I may have missed the warning log in the FFH test.
> > 
> > This happens during the short window in cpufreq_policy_online() between
> > driver->init() and the CREATE_POLICY notifier that gets AMU FIE ready.
> > After that, CPPC FIE will be stopped.
> > 
> > Ideally this can be merged together with Viresh's PR since the CPPC FIE
> > changes are there.
> > https://lore.kernel.org/all/j4qdid7iqmng4gzb5ozefemjkep3wx2b5z2yki5tnqc3vzvzf4@kvrnarvdod5p/
> 
> Right, looks like this should go via Rafael but if it doesn't make the merge
> window then I can pick it up at -rc1 (please remind me :)

Looks like this fix is still needed. Please can you post a new version,
based on -rc1, so that I can pick it up?

You'll also need to fix the SHA in the commit message and the Fixes: tag,
as 12eb8f4fff24 doesn't match the upstream change.

Will

