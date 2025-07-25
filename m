Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2578C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZBYkUhCvYvNBr4L+bMcpjCfZP51jmndsl5D+bpk5hw=; b=km7yb59P6rdJ3LgE917LlFfdiq
	Uod9GTcycXdFh+QpM6GXX7Ca/3+/mKD9UMq6lPgiVvXgYRJDX/wEKk+iS33kC06JiOqdciV7ufr+A
	l84BYtNCKT8il4P9ibDYKPWac5DaTGj+hXssIKL51jvN3AlcEYWYt0sBKi2b7atIRdaKr5EY0GqkJ
	libbGeRdGCv/A6OkxXT+5sW9G+UcKL3FAinxNY//UNFUYBGEHfF3iRe714AjqF+GeHWa65iIfVJH8
	mk65rH4vxbNdrJVGuvVndcvQsNo/61DOkLYYUkyD33roGMV0+co2WJnvhpRHU6/SVusvsTM/dqefI
	GFHgYIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufIFR-00000009taR-1Eqq;
	Fri, 25 Jul 2025 13:14:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufICx-00000009tJU-1Qh3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 13:11:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AFA6176C;
	Fri, 25 Jul 2025 06:11:23 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2701C3F66E;
	Fri, 25 Jul 2025 06:11:27 -0700 (PDT)
Date: Fri, 25 Jul 2025 14:11:24 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <beata.michalska@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <viresh.kumar@linaro.org>,
	<vincent.guittot@linaro.org>, <yangyicong@hisilicon.com>,
	<zhanjie9@hisilicon.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <linhongye@h-partners.com>
Subject: Re: [PATCH v2] arm64: topology: Setup AMU FIE for online CPUs only
Message-ID: <20250725-courageous-myrtle-manatee-b113b5@sudeepholla>
References: <20250725102813.1404322-1-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250725102813.1404322-1-zhenglifeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_061131_467760_AB691989 
X-CRM114-Status: GOOD (  32.93  )
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

On Fri, Jul 25, 2025 at 06:28:13PM +0800, Lifeng Zheng wrote:
> When boot with maxcpu=1 restrict, and LPI(Low Power Idle States) is on,
> only CPU0 will go online. The support AMU flag of CPU0 will be set but the
> flags of other CPUs will not. This will cause AMU FIE set up fail for CPU0
> when it shares a cpufreq policy with other CPU(s). After that, when other
> CPUs are finally online and the support AMU flags of them are set, they'll
> never have a chance to set up AMU FIE, even though they're eligible.
> 
> To solve this problem, the process of setting up AMU FIE needs to be
> modified as follows:
> 
> 1. Set up AMU FIE only for the online CPUs.
> 
> 2. Try to set up AMU FIE each time a CPU goes online and do the
> freq_counters_valid() check for all the online CPUs share the same policy.
> If this check fails, clear scale freq source of these CPUs, in case they
> use different source of the freq scale.
> 
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> ---

I have no idea what changed from v1->v2 and no link to v1 for me to
refer to it and check the delta 🙁.

>  arch/arm64/kernel/topology.c | 49 ++++++++++++++++++++++++++++++++----
>  1 file changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 5d07ee85bdae..d578c496d457 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -357,12 +357,15 @@ static void amu_fie_setup(const struct cpumask *cpus)
>  
>  	/* We are already set since the last insmod of cpufreq driver */
>  	if (cpumask_available(amu_fie_cpus) &&
> -	    unlikely(cpumask_subset(cpus, amu_fie_cpus)))
> +	    cpumask_subset(cpus, amu_fie_cpus))
>  		return;
>  
> -	for_each_cpu(cpu, cpus)
> -		if (!freq_counters_valid(cpu))
> +	for_each_cpu(cpu, cpus) {
> +		if (!freq_counters_valid(cpu)) {
> +			topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpus);
>  			return;
> +		}
> +	}
>  
>  	if (!cpumask_available(amu_fie_cpus) &&
>  	    !zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL)) {
> @@ -385,7 +388,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
>  	struct cpufreq_policy *policy = data;
>  
>  	if (val == CPUFREQ_CREATE_POLICY)
> -		amu_fie_setup(policy->related_cpus);
> +		amu_fie_setup(policy->cpus);
>  
>  	/*
>  	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> @@ -404,10 +407,46 @@ static struct notifier_block init_amu_fie_notifier = {
>  	.notifier_call = init_amu_fie_callback,
>  };
>  
> +static int cpuhp_topology_online(unsigned int cpu)
> +{
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
> +	cpumask_var_t cpus_to_set;
> +
> +	if (!zalloc_cpumask_var(&cpus_to_set, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	cpumask_copy(cpus_to_set, cpumask_of(cpu));
> +
> +	policy = cpufreq_cpu_get(cpu);
> +	if (policy) {
> +		cpumask_or(cpus_to_set, cpus_to_set, policy->cpus);
> +		amu_fie_setup(cpus_to_set);
> +	}
> +
> +	free_cpumask_var(cpus_to_set);

What am I missing here as I don't see the need to for this local
copy  `cpus_to_set`.

Why can't you just call
	policy = cpufreq_cpu_get(cpu);
	if (policy)
		amu_fie_setup(cpus_to_set);


> +	return 0;
> +}
> +
>  static int __init init_amu_fie(void)
>  {
> -	return cpufreq_register_notifier(&init_amu_fie_notifier,
> +	int ret;
> +
> +	ret = cpufreq_register_notifier(&init_amu_fie_notifier,
>  					CPUFREQ_POLICY_NOTIFIER);
> +	if (ret)
> +		return ret;
> +
> +	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
> +					"arm64/topology:online",
> +					cpuhp_topology_online,
> +					NULL);
> +	if (ret < 0) {
> +		cpufreq_unregister_notifier(&init_amu_fie_notifier,
> +					    CPUFREQ_POLICY_NOTIFIER);
> +		return ret;
> +	}
> +

Why can't you just set up cpuhp_* first and then cpufreq notifier to avoid
this unregistering ?

-- 
Regards,
Sudeep

