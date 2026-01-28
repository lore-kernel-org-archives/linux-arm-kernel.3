Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE01D25B54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U34sK8t9dyQs7r7wOE98lggD9iHAg9/I2hGnLJ+IDVQ=; b=DHC3GVH0cN7tb2fCIRwljz0SVz
	Vo/lX9bFaWwDFqYcpAeon6qo1wzVD++ngDrIn6tFPNRU1wMCRX7iKTy9HN1YiHFJ+7ODrp1EPoDhX
	E+RJ7c5sAs8j7fit6SsCbrD9HULgxw85V5bpGP8MrtWQnPwIC5fXhAE9XwUl/l6myB/IaOV+GohsI
	2vHpLHPqlhmgMqcl8H9986NWQq4J9Iu58iDC56oFVV+eNKsircupZKoKfT6w2c6MelLFRNexSXsyu
	stY+FXhI2Mrlv3/r6WnV/mkuwXxGXegyp7j8/+l3Pu2p+It1C5sjrfRrvEaDQOJGhC6ZZe3K/Of1c
	408qgXkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5Df-0000000G25T-08I7;
	Wed, 28 Jan 2026 13:04:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5Dc-0000000G24g-1yN8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 13:04:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD4B5408DE;
	Wed, 28 Jan 2026 13:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5123C4CEF1;
	Wed, 28 Jan 2026 13:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769605463;
	bh=xE4iu5iJ6zbcF/HPfqdjVHU/BxKxQM4masrNQBgrmsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kFA5ETdwvJ0U9pyb9idC0lLtra94o6Jh1gMklmr1DJMd2IrIVz/BLzGF9hKz1CAHo
	 MPufivEwXiyFoxslljmNmMYZKKq2fnX4JY+LlsuNQ59P/Ce4ky4qomb7rwM4x6wlPt
	 KD1hYpmcS4bmgMJnOP3Pjj3Hq+4HWQesJIDNP753V5ByihljUbBxxp5AUJSXqAN/Q/
	 +Gisk9UH4Jxm7G/xCVXoG5cgxRP7Uw+rJXzb54A5s/JWfJOGNuKdeuldp/uBjX/UGa
	 BcCXYLAcPngOozhGonxzxhrQCRJ2/CcH8bcxjA8evYOmJwSQDzYHtQNxTivdetu69T
	 O282PvT1er2Nw==
Date: Wed, 28 Jan 2026 13:04:17 +0000
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
Message-ID: <aXoJUYDrhuJgkXEr@willie-the-truck>
References: <20260127080700.3565546-1-sumitg@nvidia.com>
 <3c6d58b2-b4c9-4dc7-a705-b7626e127f33@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c6d58b2-b4c9-4dc7-a705-b7626e127f33@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_050424_548035_1F5D0812 
X-CRM114-Status: GOOD (  20.82  )
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

On Wed, Jan 28, 2026 at 06:50:42PM +0800, Jie Zhan wrote:
> On 1/27/2026 4:07 PM, Sumit Gupta wrote:
> > The counters_read_on_cpu() function warns when called with IRQs disabled
> > to prevent deadlock in smp_call_function_single(). However, this warning
> > is spurious when reading counters on the current CPU since no IPI is
> > needed for same-CPU reads.
> > 
> > Commit 12eb8f4fff24 ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks
> > for non-PCC regs") changed the CPPC Frequency Invariance Engine to read
> > AMU counters directly from the scheduler tick for non-PCC register
> > spaces (like FFH), instead of deferring to a kthread. This means
> > counters_read_on_cpu() is now called with IRQs disabled from the tick
> > handler, triggering the warning:
> > 
> > | WARNING: arch/arm64/kernel/topology.c:410 at counters_read_on_cpu
> > | ...
> > | Call trace:
> > |  counters_read_on_cpu+0x88/0xa8 (P)
> > |  cpc_read_ffh+0xdc/0x148
> > |  cpc_read+0x260/0x518
> > |  cppc_get_perf_ctrs+0xf0/0x398
> > |  __cppc_scale_freq_tick+0x4c/0x148 [cppc_cpufreq]
> > |  cppc_scale_freq_tick+0x44/0x88 [cppc_cpufreq]
> > |  topology_scale_freq_tick+0x34/0x58
> > |  sched_tick+0x58/0x300
> > |  update_process_times+0xcc/0x120
> > |  tick_nohz_handler+0xa8/0x260
> > |  __hrtimer_run_queues+0x154/0x360
> > |  hrtimer_interrupt+0xf4/0x2b0
> > |  arch_timer_handler_phys+0x4c/0x78
> > |  ....
> > |  CPPC Cpufreq:__cppc_scale_freq_tick: failed to read perf counters
> > |  ....
> > 
> > Fix this by calling the counter read function directly for same-CPU
> > case, bypassing smp_call_function_single() entirely. Use get_cpu() to
> > disable preemption as the counter read functions call this_cpu_has_cap()
> > which requires a non-preemptible context.
> > 
> > Fixes: 12eb8f4fff24 ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs")
> > Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> 
> Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com>
> 
> Looks fine for me except for the minor comment wrapping.
> 
> Thanks for spotting this.
> I may have missed the warning log in the FFH test.
> 
> This happens during the short window in cpufreq_policy_online() between
> driver->init() and the CREATE_POLICY notifier that gets AMU FIE ready.
> After that, CPPC FIE will be stopped.
> 
> Ideally this can be merged together with Viresh's PR since the CPPC FIE
> changes are there.
> https://lore.kernel.org/all/j4qdid7iqmng4gzb5ozefemjkep3wx2b5z2yki5tnqc3vzvzf4@kvrnarvdod5p/

Right, looks like this should go via Rafael but if it doesn't make the merge
window then I can pick it up at -rc1 (please remind me :)

Will

