Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEDCCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg5WEUOvKq4GC2hFnY+aKeq6nOI6T0yAiATuQ5iv40c=; b=pzo0T1KsuJlhPvhz8WHtpNgIkq
	GEBywdSeRb0WeQspF4C8XAnewtYfF3rKbRaItS3XIMQlMN3ox7IKOAZFKL5wVpG5RjxNeLdIfINjp
	yYzL7eAbyZA/4HNXkFePgXvxVR+bVlmf0Ih4g71ah2LEzZ93QaRpMWNgIhlXEUlYgoSbIeSMgKo4y
	JhgbpbUGsXF+1mDC7IuynyMPcG5VjzvqkkPsjOM60YQk/W+8AbBBAqcPrZ+tB10jkjpKC1N7qxRGY
	i4kkU6rRu6oFbxZYwx/4USK3mUdqpvG8hw6NhqcSpS/InDjyikptRNQTx73y8fFqfYsZ+bNQj2sY3
	MZ+pDFow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEkN-0000000HYVu-3rw0;
	Thu, 18 Sep 2025 13:32:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEkM-0000000HYVN-4579
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6079260215;
	Thu, 18 Sep 2025 13:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7A0C4CEEB;
	Thu, 18 Sep 2025 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758202346;
	bh=+pEtG8Y3oUecMicPeQhIDMXwYtDXk1Rb6pW2zzp8DiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEtFww7jraHMvQoHlVFwtv/NNSjNgYTN3gzvl9zlhIwnS5QPzQLxlQJmRnj7AMykY
	 2cWa9PdIbGMg4+IPb+T+YgkPRJQjxWWr4UPyQjLI5OIkm7RCI8XrWgl6ITHPcEzHZ9
	 SUTskwgCrBHXcsXuE8+gcygg/jQPb/3xGw7dLqXb9vHy6ibPemqt+Kx3Emb0BeZBP6
	 UZTN9VzxHxYfocnAmAjRxYVJ7mCC9HtGWHADoOX8sAkbuJ7Hm//RU+rEqWrB9qIZem
	 5Yo5z1yePJ0IBwJ4EBJnr0bY0xDkQUCkh+IXmAStegyksOWmPoFhZoljrss65lotX9
	 nqlUG5R+jNCaQ==
Date: Thu, 18 Sep 2025 14:32:20 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com, james.clark@linaro.org, robh@kernel.org,
	anshuman.khandual@arm.com, jonathan.cameron@huawei.com,
	hejunhao3@huawei.com, linuxarm@huawei.com, prime.zeng@hisilicon.com,
	xuwei5@huawei.com, wangyushan12@huawei.com,
	yangyicong@hisilicon.com
Subject: Re: [PATCH v2 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT
 cores
Message-ID: <aMwJ5FpGRmsyhQuZ@willie-the-truck>
References: <20250820084534.28037-1-yangyicong@huawei.com>
 <20250820084534.28037-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820084534.28037-3-yangyicong@huawei.com>
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

On Wed, Aug 20, 2025 at 04:45:34PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> CPU_CYCLES is expected to count the logical CPU (PE) clock. Currently it's
> preferred to use PMCCNTR_EL0 for counting CPU_CYCLES, but it'll count
> processor clock rather than the PE clock (ARM DDI0487 L.b D13.1.3) if
> one of the SMT siblings is not idle on a multi-threaded implementation.
> So don't use it on SMT cores.
> 
> Introduce topology_core_has_smt() for knowing the SMT implementation and
> cached it in arm_pmu::has_smt during allocation.
> 
> When counting cycles on SMT CPU 2-3 and CPU 3 is idle, without this
> patch we'll get:
> [root@client1 tmp]# perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
> --taskset 2 --timeout 1
> [...]
>  Performance counter stats for 'CPU(s) 2-3':
> 
> CPU2           2880457316      cycles
> CPU3           2880459810      cycles
>        1.254688470 seconds time elapsed
> 
> With this patch the idle state of CPU3 is observed as expected:
> [root@client1 ~]#  perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
> --taskset 2 --timeout 1
> [...]
>  Performance counter stats for 'CPU(s) 2-3':
> 
> CPU2           2558580492      cycles
> CPU3               305749      cycles
>        1.113626410 seconds time elapsed
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/perf/arm_pmu.c        |  3 +++
>  drivers/perf/arm_pmuv3.c      | 10 ++++++++++
>  include/linux/arch_topology.h | 11 +++++++++++
>  include/linux/perf/arm_pmu.h  |  1 +
>  4 files changed, 25 insertions(+)
> 
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 5c310e803dd7..137ef55d6973 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -901,6 +901,9 @@ struct arm_pmu *armpmu_alloc(void)
>  
>  		events = per_cpu_ptr(pmu->hw_events, cpu);
>  		events->percpu_pmu = pmu;
> +
> +		if (!pmu->has_smt && topology_core_has_smt(cpu))
> +			pmu->has_smt = true;

Why isn't that just:

	pmu->has_smt = topology_core_has_smt(cpu);

?

but then if that's the case, why do we need to stash the result in the
PMU at all?

>  	}
>  
>  	return pmu;
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 69c5cc8f5606..32b58a0feb33 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -981,6 +981,7 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
>  static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>  				     struct perf_event *event)
>  {
> +	struct arm_pmu *cpu_pmu = to_arm_pmu(event->pmu);
>  	struct hw_perf_event *hwc = &event->hw;
>  	unsigned long evtype = hwc->config_base & ARMV8_PMU_EVTYPE_EVENT;
>  
> @@ -1001,6 +1002,15 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>  	if (has_branch_stack(event))
>  		return false;
>  
> +	/*
> +	 * The PMCCNTR_EL0 increments from the processor clock rather than
> +	 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> +	 * counting on a WFI PE if one of its SMT silbing is not idle on a

typo: sibling

> +	 * multi-threaded implementation. So don't use it on SMT cores.
> +	 */
> +	if (cpu_pmu->has_smt)
> +		return false;
> +
>  	return true;
>  }
>  
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index d72d6e5aa200..daa1af2e8204 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -89,6 +89,17 @@ void remove_cpu_topology(unsigned int cpuid);
>  void reset_cpu_topology(void);
>  int parse_acpi_topology(void);
>  void freq_inv_set_max_ratio(int cpu, u64 max_rate);
> +
> +/*
> + * Architectures like ARM64 don't have reliable architectural way to get SMT
> + * information and depend on the firmware (ACPI/OF) report. Non-SMT core won't
> + * initialize thread_id so we can use this to detect the SMT implementation.
> + */
> +static inline bool topology_core_has_smt(int cpu)
> +{
> +	return cpu_topology[cpu].thread_id != -1;
> +}

Sudeep -- is this ok?

Will

