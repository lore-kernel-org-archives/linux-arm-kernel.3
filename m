Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51306C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 04:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKFTMq+hnBTZnKp36KmBoZtDRC/OW8f8R/+Z8qZPaAU=; b=NWVbJsZ0meYuulOt9IEme+5dOX
	qAbk4X9zhMqGR+FHqpo/8o3/uRpowyDGH2ZHPlF3FmK7IXVmAbGVZIzauXB0dCAcxmHfIG/0PEoSQ
	a2k9pwW9X98hba9nyAvdeYIql5h+dS5+wClDEPGpJ9Pz35wZ5dbd3hClsbtrHGEV4Z9a7cJmoh1zi
	J+lEATP5ag2wQYtvGWUA4hbEmdm7YNUNCx3UReLDuqn61akvxFshWchTB2gyH/mGDT6BOwgxFlyR9
	GTV42/0kI6y2ZiNl6OMbIZy1pCfpbDERKXXmeAaNzatQ5a9+Q7FHcfwAmfJWXu9ferRe4oLTbtssd
	WLQ6siFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBYw-0000000DuTO-1cIa;
	Fri, 24 Jan 2025 04:44:58 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBXc-0000000DuDn-2jyx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 04:43:37 +0000
Received: from [100.79.193.133] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id 587782109A4D;
	Thu, 23 Jan 2025 20:43:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 587782109A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1737693815;
	bh=QKFTMq+hnBTZnKp36KmBoZtDRC/OW8f8R/+Z8qZPaAU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R7/V3+qSr0OQfR/J1vW+FSrLbRjpPFu0F+UUsldIlli3fhu6edaCEvHPoQIjwhhlY
	 WLWF5MECEWqCCx7suk84F0ierfNQ/OqCtdYgJpnCcOLq2tsGWJ6kL26fiY/8h7S5MN
	 66VOaynimLozQnwQwYi25fSs/hD4evh4QoTRENm4=
Message-ID: <e78d7ddd-6e49-4b16-a1e5-79558d73ce52@linux.microsoft.com>
Date: Fri, 24 Jan 2025 10:13:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] arm64: Provide an AMU-based version of
 arch_freq_get_on_cpu
To: Beata Michalska <beata.michalska@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 ionela.voinescu@arm.com, sudeep.holla@arm.com, will@kernel.org,
 catalin.marinas@arm.com, rafael@kernel.org, viresh.kumar@linaro.org
Cc: sumitg@nvidia.com, yang@os.amperecomputing.com,
 vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
 zhanjie9@hisilicon.com
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-5-beata.michalska@arm.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20250121084435.2839280-5-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_204336_744897_9DD0ADBF 
X-CRM114-Status: GOOD (  28.55  )
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


On 21-01-2025 14:14, Beata Michalska wrote:
> With the Frequency Invariance Engine (FIE) being already wired up with
> sched tick and making use of relevant (core counter and constant
> counter) AMU counters, getting the average frequency for a given CPU,
> can be achieved by utilizing the frequency scale factor which reflects
> an average CPU frequency for the last tick period length.
>
> The solution is partially based on APERF/MPERF implementation of
> arch_freq_get_on_cpu.
>
> Suggested-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>   arch/arm64/kernel/topology.c | 109 +++++++++++++++++++++++++++++++----
>   1 file changed, 99 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index cb180684d10d..5f5738b174c7 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -17,6 +17,7 @@
>   #include <linux/cpufreq.h>
>   #include <linux/init.h>
>   #include <linux/percpu.h>
> +#include <linux/sched/isolation.h>
>   
>   #include <asm/cpu.h>
>   #include <asm/cputype.h>
> @@ -88,18 +89,28 @@ int __init parse_acpi_topology(void)
>    * initialized.
>    */
>   static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
> -static DEFINE_PER_CPU(u64, arch_const_cycles_prev);
> -static DEFINE_PER_CPU(u64, arch_core_cycles_prev);
>   static cpumask_var_t amu_fie_cpus;
>   
> +struct amu_cntr_sample {
> +	u64		arch_const_cycles_prev;
> +	u64		arch_core_cycles_prev;
> +	unsigned long	last_scale_update;
> +};
> +
> +static DEFINE_PER_CPU_SHARED_ALIGNED(struct amu_cntr_sample, cpu_amu_samples);
> +
>   void update_freq_counters_refs(void)
>   {
> -	this_cpu_write(arch_core_cycles_prev, read_corecnt());
> -	this_cpu_write(arch_const_cycles_prev, read_constcnt());
> +	struct amu_cntr_sample *amu_sample = this_cpu_ptr(&cpu_amu_samples);
> +
> +	amu_sample->arch_core_cycles_prev = read_corecnt();
> +	amu_sample->arch_const_cycles_prev = read_constcnt();
>   }
>   
>   static inline bool freq_counters_valid(int cpu)
>   {
> +	struct amu_cntr_sample *amu_sample = per_cpu_ptr(&cpu_amu_samples, cpu);
> +
>   	if ((cpu >= nr_cpu_ids) || !cpumask_test_cpu(cpu, cpu_present_mask))
>   		return false;
>   
> @@ -108,8 +119,8 @@ static inline bool freq_counters_valid(int cpu)
>   		return false;
>   	}
>   
> -	if (unlikely(!per_cpu(arch_const_cycles_prev, cpu) ||
> -		     !per_cpu(arch_core_cycles_prev, cpu))) {
> +	if (unlikely(!amu_sample->arch_const_cycles_prev ||
> +		     !amu_sample->arch_core_cycles_prev)) {
>   		pr_debug("CPU%d: cycle counters are not enabled.\n", cpu);
>   		return false;
>   	}
> @@ -152,17 +163,22 @@ void freq_inv_set_max_ratio(int cpu, u64 max_rate)
>   
>   static void amu_scale_freq_tick(void)
>   {
> +	struct amu_cntr_sample *amu_sample = this_cpu_ptr(&cpu_amu_samples);
>   	u64 prev_core_cnt, prev_const_cnt;
>   	u64 core_cnt, const_cnt, scale;
>   
> -	prev_const_cnt = this_cpu_read(arch_const_cycles_prev);
> -	prev_core_cnt = this_cpu_read(arch_core_cycles_prev);
> +	prev_const_cnt = amu_sample->arch_const_cycles_prev;
> +	prev_core_cnt = amu_sample->arch_core_cycles_prev;
>   
>   	update_freq_counters_refs();
>   
> -	const_cnt = this_cpu_read(arch_const_cycles_prev);
> -	core_cnt = this_cpu_read(arch_core_cycles_prev);
> +	const_cnt = amu_sample->arch_const_cycles_prev;
> +	core_cnt = amu_sample->arch_core_cycles_prev;
>   
> +	/*
> +	 * This should not happen unless the AMUs have been reset and the
> +	 * counter values have not been restored - unlikely
> +	 */
>   	if (unlikely(core_cnt <= prev_core_cnt ||
>   		     const_cnt <= prev_const_cnt))
>   		return;
> @@ -182,6 +198,8 @@ static void amu_scale_freq_tick(void)
>   
>   	scale = min_t(unsigned long, scale, SCHED_CAPACITY_SCALE);
>   	this_cpu_write(arch_freq_scale, (unsigned long)scale);
> +
> +	amu_sample->last_scale_update = jiffies;
>   }
>   
>   static struct scale_freq_data amu_sfd = {
> @@ -189,6 +207,77 @@ static struct scale_freq_data amu_sfd = {
>   	.set_freq_scale = amu_scale_freq_tick,
>   };
>   
> +static __always_inline bool amu_fie_cpu_supported(unsigned int cpu)
> +{
> +	return cpumask_available(amu_fie_cpus) &&
> +		cpumask_test_cpu(cpu, amu_fie_cpus);
> +}
> +
> +#define AMU_SAMPLE_EXP_MS	20
> +
> +int arch_freq_get_on_cpu(int cpu)
> +{
> +	struct amu_cntr_sample *amu_sample;
> +	unsigned int start_cpu = cpu;
> +	unsigned long last_update;
> +	unsigned int freq = 0;
> +	u64 scale;
> +
> +	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
> +		return -EOPNOTSUPP;
> +
> +retry:
> +	amu_sample = per_cpu_ptr(&cpu_amu_samples, cpu);
> +
> +	last_update = amu_sample->last_scale_update;
> +
> +	/*
> +	 * For those CPUs that are in full dynticks mode, or those that have
> +	 * not seen tick for a while, try an alternative source for the counters
> +	 * (and thus freq scale), if available, for given policy: this boils
> +	 * down to identifying an active cpu within the same freq domain, if any.
> +	 */
> +	if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
> +	    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
> +		struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> +		int ref_cpu = cpu;
> +
> +		if (!policy)
> +			return -EINVAL;
> +
> +		if (!cpumask_intersects(policy->related_cpus,
> +					housekeeping_cpumask(HK_TYPE_TICK))) {
> +			cpufreq_cpu_put(policy);
> +			return -EOPNOTSUPP;
> +		}
> +
> +
> +		do {
> +			ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
> +						    start_cpu, false);
> +
> +		} while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
> +
> +		cpufreq_cpu_put(policy);
> +
> +		if (ref_cpu >= nr_cpu_ids)
> +			/* No alternative to pull info from */
> +			return -EAGAIN;
> +
> +		cpu = ref_cpu;
> +		goto retry;

If you are going to spin a new revision, can you use while loop instead 
of using goto for looping? This will help improve the readability.

> +	}
> +	/*
> +	 * Reversed computation to the one used to determine
> +	 * the arch_freq_scale value
> +	 * (see amu_scale_freq_tick for details)
> +	 */
> +	scale = arch_scale_freq_capacity(cpu);
> +	freq = scale * arch_scale_freq_ref(cpu);
> +	freq >>= SCHED_CAPACITY_SHIFT;
> +	return freq;
> +}
> +
>   static void amu_fie_setup(const struct cpumask *cpus)
>   {
>   	int cpu;

