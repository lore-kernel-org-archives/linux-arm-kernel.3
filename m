Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD57C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 21:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9fbP9uFwM8iR/SJxb3fXue7l730uCQXSSyDn65UAz8=; b=0LoeJUMvCC3Klt96Rl/wCluqkG
	ITulC2rSfIzQyNtkVzaTG/p3b6CH++05zBLZz9S7a+77OqtxMVYlW3dXfjlvA/jYPZ8HPdkQZa5bM
	i/vrboktaOJzNCphzodzCZYvusgVEccXao9ZLp7eRhtT/YgvSpJO7lx4xqU4Ve+Lq6PNSFJ0cEO22
	QiQ5lPEl+XHPlkpmzHRjOxumhGAsrorgOXKk8rqBIww4Wlc22xFjMbspINw+qqqRn3/2hrmmMVhDF
	QrkoljRCac/FNvmn/ETMOCP9U2EHrPG68uOU/6P5M/EXjGGaK7+G9WbYOtzmXdg75PciIzZQYgN76
	Q/s4UjkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19KF-0000000AVlW-1ZAz;
	Mon, 31 Aug 2026 21:13:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19KB-0000000AVkS-2KgN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 21:13:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 875B21477;
	Mon, 31 Aug 2026 14:13:44 -0700 (PDT)
Received: from [10.57.7.56] (unknown [10.57.7.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65D873F882;
	Mon, 31 Aug 2026 14:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788210828; bh=pA19BPiNX7Qs43ej/EG+tekPIsyS1tp0DhsiOKp8opE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oFdpydl7FNjubuaA78sCowrLmKkkBXY5Qmsm6+iiaZPc44zukSBYq/Njcr/8n3atu
	 QZhby4b0gIPDcvXjvDqR/rSK2QkkF1pOLmQ46DuP5vFAvF7AW3PMJJ+O466HedCRG3
	 QwpkmZd8oVLS0AiDNCnY4Zqg/2dxBBVIw1WIDa40=
Message-ID: <f5d625d0-3b94-407c-8f64-793df9590f03@arm.com>
Date: Mon, 31 Aug 2026 22:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
To: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Mark Rutland
 <mark.rutland@arm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260831181800.1668646-1-arighi@nvidia.com>
 <20260831181800.1668646-2-arighi@nvidia.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20260831181800.1668646-2-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_141351_865280_EC963842 
X-CRM114-Status: GOOD (  27.26  )
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

On 8/31/26 19:10, Andrea Righi wrote:
> NVIDIA Olympus implements spatial SMT with symmetric steady-state PE
> capacity but two different resource modes. One-Thread Active mode gives
> one PE the full core, while waking the other PE restores Two-Thread
> Active mode and partitions decode, issue, cache, TLB, and vector
> resources. Returning to full-resource mode requires the sibling to
> remain in WFI for 10 Ki cycles.
> 
> Measurements show that pinned workloads perform equally on either PE,
> but freely migratable workloads lose substantial throughput when they
> alternate between PE identities. Consistently selecting PE0 keeps PE1
> idle, avoids repeated SMT repartitioning, and restores one-thread-per-core
> performance.
> 
> Describe this scheduling preference with SD_ASYM_PACKING and give PE0,
> identified by MPIDR_EL1.Aff0, the higher arch_asym_cpu_priority(). This is
> independent of SD_ASYM_CPUCAPACITY: SMT siblings retain equal capacity,
> while physical cores with different maximum frequencies are handled by
> a higher scheduling domain.

But why? This asympacking + CAS interaction is a bit hard to comprehend IMV.
Why can't we encode both preferences in the asym-packing priority, e.g.

priority(cpu) = is_primary(cpu) ? 2 * highest_perf(cpu)
                                : highest_perf(cpu)

so that all primary PEs are preferred over all sibling PEs, while still
preserving the highest_perf ordering within each group, and do away with
SD_ASYM_CPUCAPACITY on Vera altogether?
I had suggested this a while ago, did you have a stab at that by any chance,
too?
Am I missing something altogether?

> 
> Firmware currently provides no interface for describing the preferred
> SMT sibling. Detect Olympus by MIDR until such an interface is available.
> 
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>  arch/arm64/include/asm/topology.h |  1 +
>  arch/arm64/kernel/smp.c           |  1 +
>  arch/arm64/kernel/topology.c      | 62 +++++++++++++++++++++++++++++++
>  3 files changed, 64 insertions(+)
> > 
> diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
> index b9eaf4ad70850..edc1c59b3448d 100644
> --- a/arch/arm64/include/asm/topology.h
> +++ b/arch/arm64/include/asm/topology.h
> @@ -18,6 +18,7 @@ int pcibus_to_node(struct pci_bus *bus);
>  #include <linux/arch_topology.h>
>  
>  void update_freq_counters_refs(void);
> +void arm64_init_sched_topology(void);
>  
>  /* Replace task scheduler's default frequency-invariant accounting */
>  #define arch_scale_freq_tick topology_scale_freq_tick
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index a61dc3016a117..0135ac4eea8bd 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -443,6 +443,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
>  	hyp_mode_check();
>  	setup_system_features();
>  	setup_user_features();
> +	arm64_init_sched_topology();
>  	mark_linear_text_alias_ro();
>  }
>  
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f1..0dd9eec1c4946 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -19,6 +19,8 @@
>  #include <linux/init.h>
>  #include <linux/percpu.h>
>  #include <linux/sched/isolation.h>
> +#include <linux/sched/topology.h>
> +#include <linux/smp.h>
>  #include <linux/xarray.h>
>  
>  #include <asm/cpu.h>
> @@ -44,6 +46,66 @@
>  static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
>  static cpumask_var_t amu_fie_cpus;
>  
> +/*
> + * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
> + * two-thread active mode, with resources partitioned between the PEs.
> + *
> + * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
> + * mode. Firmware does not currently describe this preference, so detect
> + * Olympus by MIDR until a firmware interface is available.
> + */
> +static bool olympus_prefer_pe0 __ro_after_init;
> +
> +#ifdef CONFIG_SCHED_SMT
> +static int arm64_smt_flags(void)
> +{
> +	int flags = cpu_smt_flags();
> +
> +	if (olympus_prefer_pe0)
> +		flags |= SD_ASYM_PACKING;
> +
> +	return flags;
> +}
> +#endif
> +
> +static struct sched_domain_topology_level arm64_asym_smt_topology[] = {
> +#ifdef CONFIG_SCHED_SMT
> +	SDTL_INIT(tl_smt_mask, arm64_smt_flags, SMT),
> +#endif
> +#ifdef CONFIG_SCHED_CLUSTER
> +	SDTL_INIT(tl_cls_mask, cpu_cluster_flags, CLS),
> +#endif
> +#ifdef CONFIG_SCHED_MC
> +	SDTL_INIT(tl_mc_mask, cpu_core_flags, MC),
> +#endif
> +	SDTL_INIT(tl_pkg_mask, NULL, PKG),
> +	{ NULL, },
> +};
> +
> +void __init arm64_init_sched_topology(void)
> +{
> +	if (!IS_ENABLED(CONFIG_SCHED_SMT))
> +		return;
> +
> +	if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_NVIDIA_OLYMPUS)
> +		return;
> +
> +	if (!topology_core_has_smt(smp_processor_id()))
> +		return;
> +
> +	olympus_prefer_pe0 = true;
> +	set_sched_topology(arm64_asym_smt_topology);
> +	pr_info("Enabling PE0 SMT preference for NVIDIA Olympus\n");
> +}
> +
> +int arch_asym_cpu_priority(int cpu)
> +{
> +	if (!olympus_prefer_pe0)
> +		return 0;
> +
> +	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0;
> +}
> +
>  struct amu_cntr_sample {
>  	u64		arch_const_cycles_prev;
>  	u64		arch_core_cycles_prev;


