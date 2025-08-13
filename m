Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EB1C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUpc3mtx1QEBTKEwI6GiSd8dyYHwf2aaloKxRS5So10=; b=SX+eAI9RRcAsJ8dk7sE6ykb5pt
	imBJRRREUDOByMeJYqVIJG7EPLIX6bt7wY1Jb6u+voOMF7r2TJ47fj04SeRHid5z6WieTJ35i3tmc
	yU8wMWbIsEGHzAk1zEa4GjxZEIy+DK3ss5bUbSMk1d+SNuR9Ld4+u4SHyurqSfiLg0lRak6vERIYY
	RZnwEqc1tLec0bphIvR1R7CzG6YsH+TQHyd6Gi8AUEwlDXojgmKhCHNN2Nx9P2aZfYwc4mK7USNpI
	L6vFuZm5Pcb3Tfq5UBZiZxi/rvBLnSgzhntXRz/6DNgeACh/ONu4MXHNJqS1W5JmlJEq/iA/4vOcG
	kmuU5w9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAGj-0000000DbHB-2iIh;
	Wed, 13 Aug 2025 12:07:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9Lf-0000000DU2q-20jo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:08:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6224A12FC;
	Wed, 13 Aug 2025 04:08:42 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5C013F738;
	Wed, 13 Aug 2025 04:08:46 -0700 (PDT)
Date: Wed, 13 Aug 2025 13:08:31 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org,
	viresh.kumar@linaro.org, sudeep.holla@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, vincent.guittot@linaro.org,
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com,
	lihuisong@huawei.com, yubowen8@huawei.com, linhongye@h-partners.com
Subject: Re: [PATCH v3 3/3] arm64: topology: Setup AMU FIE for online CPUs
 only
Message-ID: <aJxyL1XJu-x3AFjO@arm.com>
References: <20250805093330.3715444-1-zhenglifeng1@huawei.com>
 <20250805093330.3715444-4-zhenglifeng1@huawei.com>
 <aJMmjKenJaDnRskH@arm.com>
 <561a9474-7be6-4c8a-8a5d-40efb186b3d2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <561a9474-7be6-4c8a-8a5d-40efb186b3d2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040851_595769_8D136458 
X-CRM114-Status: GOOD (  58.77  )
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

On Wed, Aug 13, 2025 at 06:17:54PM +0800, zhenglifeng (A) wrote:
> On 2025/8/6 17:55, Beata Michalska wrote:
> 
> > On Tue, Aug 05, 2025 at 05:33:30PM +0800, Lifeng Zheng wrote:
> >> When boot with maxcpu=1 restrict, and LPI(Low Power Idle States) is on,
> >> only CPU0 will go online. The support AMU flag of CPU0 will be set but the
> >> flags of other CPUs will not. This will cause AMU FIE set up fail for CPU0
> >> when it shares a cpufreq policy with other CPU(s). After that, when other
> >> CPUs are finally online and the support AMU flags of them are set, they'll
> >> never have a chance to set up AMU FIE, even though they're eligible.
> >>
> >> To solve this problem, the process of setting up AMU FIE needs to be
> >> modified as follows:
> >>
> >> 1. Set up AMU FIE only for the online CPUs.
> >>
> >> 2. Try to set up AMU FIE each time a CPU goes online and do the
> >> freq_counters_valid() check. If this check fails, clear scale freq source
> >> of all the CPUs related to the same policy, in case they use different
> >> source of the freq scale.
> >>
> >> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> >> ---
> >>  arch/arm64/kernel/topology.c | 54 ++++++++++++++++++++++++++++++++++--
> >>  1 file changed, 52 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> >> index 9317a618bb87..b68621b3c071 100644
> >> --- a/arch/arm64/kernel/topology.c
> >> +++ b/arch/arm64/kernel/topology.c
> >> @@ -385,7 +385,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
> >>  	struct cpufreq_policy *policy = data;
> >>  
> >>  	if (val == CPUFREQ_CREATE_POLICY)
> >> -		amu_fie_setup(policy->related_cpus);
> >> +		amu_fie_setup(policy->cpus);
> > I think my previous comment still stands.
> > This will indeed set the AMU FIE support for online cpus.
> > Still, on each frequency change, arch_set_freq_scale will be called with
> > `related_cpus`, and that mask will be used to verify support for AMU counters,
> > and it will report there is none as 'related_cpus' won't be a subset of
> > `scale_freq_counters_mask`. As a consequence, new scale will be set, as seen by
> > the cpufreq. Now this will be corrected on next tick but it might cause
> > disruptions. So this change should also be applied to cpufreq - if feasible, or
> > at least be proven not to be an issue. Unless I am missing smth.
> 
> I know what you mean now. Yes, I think you are right, this change should
> also be applied to cpufreq too. Thanks!
> 
> >>  
> >>  	/*
> >>  	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> >> @@ -404,10 +404,60 @@ static struct notifier_block init_amu_fie_notifier = {
> >>  	.notifier_call = init_amu_fie_callback,
> >>  };
> >>  
> >> +static int cpuhp_topology_online(unsigned int cpu)
> >> +{
> >> +	struct cpufreq_policy *policy = cpufreq_cpu_get_raw_no_check(cpu);
> >> +
> >> +	/*
> >> +	 * If the online CPUs are not all AMU FIE CPUs or the new one is already
> >> +	 * an AMU FIE one, no need to set it.
> >> +	 */
> >> +	if (!policy || !cpumask_available(amu_fie_cpus) ||
> >> +	    !cpumask_subset(policy->cpus, amu_fie_cpus) ||
> >> +	    cpumask_test_cpu(cpu, amu_fie_cpus))
> >> +		return 0;
> > This is getting rather cumbersome as the CPU that is coming online might belong
> > to a policy that is yet to be created. Both AMU FIE support, as well as cpufreq,
> > rely on dynamic hp state so, in theory, we cannot be certain that the cpufreq
> > callback will be fired first (although that seems to be the case).
> > If that does not happen, the policy will not exist, and as such given CPU
> > will not use AMUs for FIE. The problem might be hypothetical but it at least
> > deservers a comment I think.
> 
> Actually, this callback will always be fired before the cpufreq one,
> because init_amu_fie() is called before any cpufreq driver init func (It
> has to be, otherwise the init_amu_fie_notifier cannot be registered before
> it is needed.). And the callback that is setup first will be called first
> when online if rely on dynamic hp state. So in your hypothetical scenario,
> yes, the policy will not exist and this funcion will do nothing. But that's
> OK because the notifier callback will do what should be done when the
> policy is being created.
>
You are right, I definitely drifted away too much with this one.
> > Second problem is cpumask_available use: this might be the very fist CPU that
> > might potentially rely on AMUs for frequency invariance so that mask may not be
> > available yet. That does not mean AMUs setup should be skipped. Not just yet,
> > at least. Again more hypothetical.
> 
> Same, things will be done in the notifier callback when the policy is being
> created.
> 
> > BTW, there should be `amu_fie_cpu_supported'.
> 
> Sorry, I can't see why it is needed. Could you explained further?
It covers the 'cpumask_available' and `cpumask_test_cpu` so I was thinking
your condition could look like:

	if (!policy || amu_fie_cpu_supported(cpu) ||
	    !cpumask_subset(policy->cpus, amu_fie_cpus)
	    	return 0
but that one will not cover all cases so feel free to ignore me.


---
BR
Beata
> 
> >> +
> >> +	/*
> >> +	 * If the new online CPU cannot pass this check, all the CPUs related to
> >> +	 * the same policy should be clear from amu_fie_cpus mask, otherwise they
> >> +	 * may use different source of the freq scale.
> >> +	 */
> >> +	if (!freq_counters_valid(cpu)) {
> >> +		topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
> >> +						 policy->related_cpus);
> >> +		cpumask_andnot(amu_fie_cpus, amu_fie_cpus, policy->related_cpus);
> > I think it might deserve a warning as this probably should not happen.
> 
> Yes, makes sense. Thanks!
> 
> > 
> > ---
> > BR
> > Beata
> >> +		return 0;
> >> +	}
> >> +
> >> +	cpumask_set_cpu(cpu, amu_fie_cpus);
> >> +
> >> +	topology_set_scale_freq_source(&amu_sfd, cpumask_of(cpu));
> >> +
> >> +	pr_debug("CPU[%u]: counter will be used for FIE.", cpu);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int __init init_amu_fie(void)
> >>  {
> >> -	return cpufreq_register_notifier(&init_amu_fie_notifier,
> >> +	int ret;
> >> +
> >> +	ret = cpufreq_register_notifier(&init_amu_fie_notifier,
> >>  					CPUFREQ_POLICY_NOTIFIER);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
> >> +					"arm64/topology:online",
> >> +					cpuhp_topology_online,
> >> +					NULL);
> >> +	if (ret < 0) {
> >> +		cpufreq_unregister_notifier(&init_amu_fie_notifier,
> >> +					    CPUFREQ_POLICY_NOTIFIER);
> >> +		return ret;
> >> +	}
> >> +
> >> +	return 0;
> >>  }
> >>  core_initcall(init_amu_fie);
> >>  
> >> -- 
> >> 2.33.0
> >>
> > 
> 

