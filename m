Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877FEC71150
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyvANLE+PbdnFUVxLbl19ViIC+4FgVTvbVpvLa+7QBM=; b=R1085z1wwY6dk093embM7OaXOv
	JJXXbhYA+sQmqg29aZy0BT40yqv3bYThF/wTuKJB5vIh3za1wjQuM+XTetHPBimLm3B5zCezPnzGT
	WCyM7nDTQkwTSKqWiSL5h/NDJYxYXt6vOXwZWctF0wiiJpTBn5qLTAr6JzYNLM2EWoLEylBd1fSKH
	NgiVfc6Lak+hbKRtGaxjOIwSVoSjnwDMJf0dTO/mtoKhF7EAywi7nQIj3uQr8CFlMFXFSFpNOltbD
	afy/6RXvuHoFNYB3SBMKBqZ7Gtid7xXh3c1Eke/RoYHRZQ//ZLtLtmkdU4gUVVYoVRguhBiiQrFhF
	TZRoD0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq6z-0000000EjDH-1agu;
	Thu, 12 Jun 2025 22:09:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjgV-0000000Dkdf-2cgX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A24F96113B;
	Thu, 12 Jun 2025 15:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73CDC4CEEB;
	Thu, 12 Jun 2025 15:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741462;
	bh=bBMRarVFRDGfMbWiiFdvD8PpDR7gEd1eqox42pTHpu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeB4g2awCxNBi5/eCdMjbz6zNklxVDnwZS88CrgmKdgbvpf5e1Yl7L95rrhLEWWB3
	 2YUdemQXGDWIhmJjkeDTp4Cn+jrrf/T/IIq+OjErgjFdY8xar95wVEzOoOlSkDhAV3
	 tpCkTO8PAgUfHlowKti8cPyjwDu8orURt9pTyQD+35cg6tAchgbS7SmaD+NFPaNOMJ
	 zU7n7ricY/+KNG28LReGfCOK9jH30rxEK6UEFsdKrzBYdctFumhKON2829O7EtCVi1
	 dxZcITubggmOyVS3ORybQdNjSpx+NFYrPxdndHo9A1mIdcm84v0jKBq0gTbcSm5Qg/
	 js9BhyGBmagww==
Date: Thu, 12 Jun 2025 16:17:36 +0100
From: Will Deacon <will@kernel.org>
To: Lifeng Zheng <zhenglifeng1@huawei.com>, beata.michalska@arm.com,
	sudeep.holla@arm.com
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, viresh.kumar@linaro.org,
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com,
	lihuisong@huawei.com, yubowen8@huawei.com,
	vincent.guittot@linaro.org
Subject: Re: [PATCH] arm64: topology: Setup amu fie when cpu hotplugging
Message-ID: <20250612151736.GC12912@willie-the-truck>
References: <20250607094533.416368-1-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607094533.416368-1-zhenglifeng1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

[+arm topology folks]

On Sat, Jun 07, 2025 at 05:45:33PM +0800, Lifeng Zheng wrote:
> Amu fie was set up by a cpufreq policy notifier after the policy was
> created. This caused some problems:
> 
> 1. The cpus related to the same policy would all fail to set up amu fie if
> one of them couldn't pass the freq_counters_valid() check.
> 
> 2. The cpus fail to set up amu fie would never have a chance to set up
> again.

I don't fully understand this (we don't tend to use the past tense in commit
messages), but it sounds like you're saying that the singleton nature of
the AMU driver is causing you problems with late CPU hotplug. Is that
correct? Can you perhaps be a bit more specific about what goes wrong and
how to reproduce the issue, please?

> When boot with maxcpu=1 restrict, the support amu flags of the offline cpus
> would never be setup. After that, when cpufreq policy was being created,
> the online cpu might set up amu fie fail because the other cpus related to
> the same policy couldn't pass the freq_counters_valid() check. Hotplug the
> offline cpus, since the policy was already created, amu_fie_setup() would
> never be called again. All cpus couldn't setup amu fie in this situation.
> 
> After commit 1f023007f5e7 ("arm64/amu: Use capacity_ref_freq() to set AMU
> ratio"), the max_freq stores in policy data is never needed when setting up
> amu fie.  This indicates that the setting up of amu fie does not depend on
> the policy any more. So each cpu can set up amu fie separately during
> hotplug and the problems above will be solved.
> 
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> ---
>  arch/arm64/kernel/topology.c | 56 ++++++++++++++----------------------
>  1 file changed, 21 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 5d07ee85bdae..207eab4fa31f 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -351,63 +351,49 @@ int arch_freq_get_on_cpu(int cpu)
>  	return freq;
>  }
>  
> -static void amu_fie_setup(const struct cpumask *cpus)
> +static void amu_fie_setup(unsigned int cpu)
>  {
> -	int cpu;
> -
> -	/* We are already set since the last insmod of cpufreq driver */
>  	if (cpumask_available(amu_fie_cpus) &&
> -	    unlikely(cpumask_subset(cpus, amu_fie_cpus)))
> +	    cpumask_test_cpu(cpu, amu_fie_cpus))
>  		return;
>  
> -	for_each_cpu(cpu, cpus)
> -		if (!freq_counters_valid(cpu))
> -			return;
> +	if (!freq_counters_valid(cpu))
> +		return;
>  
>  	if (!cpumask_available(amu_fie_cpus) &&
>  	    !zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL)) {
> -		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%*pbl]\n",
> -			  cpumask_pr_args(cpus));
> +		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%u]\n",
> +			  cpu);
>  		return;
>  	}
>  
> -	cpumask_or(amu_fie_cpus, amu_fie_cpus, cpus);
> +	cpumask_set_cpu(cpu, amu_fie_cpus);
>  
>  	topology_set_scale_freq_source(&amu_sfd, amu_fie_cpus);

Isn't it going to be potentially expensive to call this every time a CPU
comes online?

Will

[left the rest of the patch below for the folks I added]

>  
> -	pr_debug("CPUs[%*pbl]: counters will be used for FIE.",
> -		 cpumask_pr_args(cpus));
> +	pr_debug("CPUs[%u]: counters will be used for FIE.", cpu);
>  }
>  
> -static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
> -				 void *data)
> +static int cpuhp_topology_online(unsigned int cpu)
>  {
> -	struct cpufreq_policy *policy = data;
> -
> -	if (val == CPUFREQ_CREATE_POLICY)
> -		amu_fie_setup(policy->related_cpus);
> -
> -	/*
> -	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> -	 * counters don't have any dependency on cpufreq driver once we have
> -	 * initialized AMU support and enabled invariance. The AMU counters will
> -	 * keep on working just fine in the absence of the cpufreq driver, and
> -	 * for the CPUs for which there are no counters available, the last set
> -	 * value of arch_freq_scale will remain valid as that is the frequency
> -	 * those CPUs are running at.
> -	 */
> +	amu_fie_setup(cpu);
>  
>  	return 0;
>  }
>  
> -static struct notifier_block init_amu_fie_notifier = {
> -	.notifier_call = init_amu_fie_callback,
> -};
> -
>  static int __init init_amu_fie(void)
>  {
> -	return cpufreq_register_notifier(&init_amu_fie_notifier,
> -					CPUFREQ_POLICY_NOTIFIER);
> +	int ret;
> +
> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +				"arm64/topology:online",
> +				cpuhp_topology_online,
> +				NULL);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
>  }
>  core_initcall(init_amu_fie);
>  
> -- 
> 2.33.0
> 

