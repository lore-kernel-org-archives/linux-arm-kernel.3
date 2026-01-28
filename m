Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3873D35693
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6AufGzCauozU62AVkZNeaJiFmyszDBPGtNBvMtZMz8=; b=EV/L3yoP9rYA3tHIlHCqbRP3fI
	akhRrVpu61x1F3wOPpR4Y1vO6ySNL00fzvIJFSW1ER4+Ux2hulA18OYPStvVbuIhBbl9t2jIYJb5E
	iHZvR/AiSKI2pARkr+J9zRFuiXVAVROQj6Pv4P9rbl/pzCbmFZxKV2Qb9BFibsm1y4fxH2L4e5HH4
	crsL4N/ByV4W0W2HXektz0E2p7yyxkxHlVA4zFpXEFDM+bgHDfwVpQR1IkF60fFsMgvRYosZGLQJZ
	jE3eFhmM0Uoo+hUD7c2RnuB+PEd5KPA/1xKfEx/diFBtJbYbmOF4cHDpZTKMFr11Nlc1DNfPLFCRu
	UoIbQZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl38c-0000000Fruf-1EIS;
	Wed, 28 Jan 2026 10:51:07 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl38W-0000000Fru0-0rS4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 10:51:03 +0000
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4f1JqY2ps8z12LDY;
	Wed, 28 Jan 2026 18:46:49 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 9731240538;
	Wed, 28 Jan 2026 18:50:43 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Jan
 2026 18:50:42 +0800
Message-ID: <3c6d58b2-b4c9-4dc7-a705-b7626e127f33@hisilicon.com>
Date: Wed, 28 Jan 2026 18:50:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: topology: Fix false warning in
 counters_read_on_cpu() for same-CPU reads
To: Sumit Gupta <sumitg@nvidia.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <zhenglifeng1@huawei.com>, <viresh.kumar@linaro.org>,
	<rafael@kernel.org>, <beata.michalska@arm.com>, <pierre.gondois@arm.com>,
	<ionela.voinescu@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: <treding@nvidia.com>, <jonathanh@nvidia.com>, <bbasu@nvidia.com>
References: <20260127080700.3565546-1-sumitg@nvidia.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20260127080700.3565546-1-sumitg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_025100_590010_E7C76973 
X-CRM114-Status: GOOD (  24.53  )
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


Hi Sumit,

On 1/27/2026 4:07 PM, Sumit Gupta wrote:
> The counters_read_on_cpu() function warns when called with IRQs disabled
> to prevent deadlock in smp_call_function_single(). However, this warning
> is spurious when reading counters on the current CPU since no IPI is
> needed for same-CPU reads.
> 
> Commit 12eb8f4fff24 ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks
> for non-PCC regs") changed the CPPC Frequency Invariance Engine to read
> AMU counters directly from the scheduler tick for non-PCC register
> spaces (like FFH), instead of deferring to a kthread. This means
> counters_read_on_cpu() is now called with IRQs disabled from the tick
> handler, triggering the warning:
> 
> | WARNING: arch/arm64/kernel/topology.c:410 at counters_read_on_cpu
> | ...
> | Call trace:
> |  counters_read_on_cpu+0x88/0xa8 (P)
> |  cpc_read_ffh+0xdc/0x148
> |  cpc_read+0x260/0x518
> |  cppc_get_perf_ctrs+0xf0/0x398
> |  __cppc_scale_freq_tick+0x4c/0x148 [cppc_cpufreq]
> |  cppc_scale_freq_tick+0x44/0x88 [cppc_cpufreq]
> |  topology_scale_freq_tick+0x34/0x58
> |  sched_tick+0x58/0x300
> |  update_process_times+0xcc/0x120
> |  tick_nohz_handler+0xa8/0x260
> |  __hrtimer_run_queues+0x154/0x360
> |  hrtimer_interrupt+0xf4/0x2b0
> |  arch_timer_handler_phys+0x4c/0x78
> |  ....
> |  CPPC Cpufreq:__cppc_scale_freq_tick: failed to read perf counters
> |  ....
> 
> Fix this by calling the counter read function directly for same-CPU
> case, bypassing smp_call_function_single() entirely. Use get_cpu() to
> disable preemption as the counter read functions call this_cpu_has_cap()
> which requires a non-preemptible context.
> 
> Fixes: 12eb8f4fff24 ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs")
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>

Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com>

Looks fine for me except for the minor comment wrapping.

Thanks for spotting this.
I may have missed the warning log in the FFH test.

This happens during the short window in cpufreq_policy_online() between
driver->init() and the CREATE_POLICY notifier that gets AMU FIE ready.
After that, CPPC FIE will be stopped.

Ideally this can be merged together with Viresh's PR since the CPPC FIE
changes are there.
https://lore.kernel.org/all/j4qdid7iqmng4gzb5ozefemjkep3wx2b5z2yki5tnqc3vzvzf4@kvrnarvdod5p/

Jie

> ---
>  arch/arm64/kernel/topology.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 539b38935182..57b71f403007 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -401,12 +401,29 @@ static inline
>  int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
>  {
>  	/*
> -	 * Abort call on counterless CPU or when interrupts are
> -	 * disabled - can lead to deadlock in smp sync call.
> +	 * Abort call on counterless CPU.
>  	 */
>  	if (!cpu_has_amu_feat(cpu))
>  		return -EOPNOTSUPP;
>  
> +	/*
> +	 * For same-CPU reads, call the function directly since no IPI
> +	 * is needed and this is safe even with IRQs disabled.
> +	 * Use get_cpu() to disable preemption as the counter read
> +	 * functions call this_cpu_has_cap() which requires a
> +	 * non-preemptible context.
> +	 */
Wrap at 80 chars?
> +	if (cpu == get_cpu()) {
> +		func(val);
> +		put_cpu();
> +		return 0;
> +	}
> +	put_cpu();
> +
> +	/*
> +	 * Reading from a remote CPU requires IRQs enabled to avoid
> +	 * deadlock in smp_call_function_single().
> +	 */
>  	if (WARN_ON_ONCE(irqs_disabled()))
>  		return -EPERM;
>  

