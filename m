Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA6D2F339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Es06HCOfBj21LOgB0KBJGTmP58c8IXRnj523bgcWElM=; b=XmBMm6hnFegGgAYYUqpdTN1/BY
	YV4/igiXh/1KN+BdmhSyexwjOFn2Cw9BGtqmC2jIjzUz8TulXXVegGc0RLVY3ab1KzBR1Tjq0meDT
	BbnWtjgxwlKNHff97NYtWTctRTrCyQ7NpsCTPCqOEhXoLuxSXvryazE9N7NIC3anGk1CG6tYtIre8
	0YJ7KiKt+YlYy1Q9bfPaHmWIL9wvBWbb/BojthW9PaBWDRNXUThqsW9u+h0UiaP31sMLR+Y0kfPXT
	Mhc8ONHqQT5LqqqxbAKKojt2IQE7c6WgBtN5nzQC2HLsX6XKPG2qvr8NkYejNgDJ8Vs+OeifLNehv
	rpzik06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgmT-00000007QXq-1GdC;
	Tue, 13 Jan 2026 15:58:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgmQ-00000007QXU-19dk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:58:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06DF3497;
	Tue, 13 Jan 2026 07:57:52 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 993CB3F59E;
	Tue, 13 Jan 2026 07:57:53 -0800 (PST)
Date: Tue, 13 Jan 2026 16:58:01 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lifeng Zheng <zhenglifeng1@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, dakr@kernel.org,
	ionela.voinescu@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, vincent.guittot@linaro.org,
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com,
	zhangpengjie2@huawei.com, wangzhi12@huawei.com,
	linhongye@h-partners.com,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [REPOST PATCH v6 3/3] arm64: topology: Handle AMU FIE setup on
 CPU hotplug
Message-ID: <aWZriVlQZ5jRx2o4@arm.com>
References: <20251230080115.2120612-1-zhenglifeng1@huawei.com>
 <20251230080115.2120612-4-zhenglifeng1@huawei.com>
 <CAMuHMdVeHk-Enc-M9ztwSdeAtE8YPKtJwq+273bGPEFOEsu=Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVeHk-Enc-M9ztwSdeAtE8YPKtJwq+273bGPEFOEsu=Rw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_075802_398965_F46C3164 
X-CRM114-Status: GOOD (  46.96  )
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

Hi Geert,
On Tue, Jan 13, 2026 at 11:51:45AM +0100, Geert Uytterhoeven wrote:
> Hi Lifeng,
> 
> On Tue, 30 Dec 2025 at 09:02, Lifeng Zheng <zhenglifeng1@huawei.com> wrote:
> > Currently, when a cpufreq policy is created, the AMU FIE setup process
> > checks all CPUs in the policy -- including those that are offline. If any
> > of these CPUs are offline at that time, their AMU capability flag hasn't
> > been verified yet, leading the check fail. As a result, AMU FIE is not
> > enabled, even if the CPUs that are online do support it.
> >
> > Later, when the previously offline CPUs come online and report AMU support,
> > there's no mechanism in place to re-enable AMU FIE for the policy. This
> > leaves the entire frequency domain without AMU FIE, despite being eligible.
> >
> > Restrict the initial AMU FIE check to only those CPUs that are online at
> > the time the policy is created, and allow CPUs that come online later to
> > join the policy with AMU FIE enabled.
> >
> > Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> > Acked-by: Beata Michalska <beata.michalska@arm.com>
> 
> Thanks for your patch, which is now commit 6fd9be0b7b2e957d
> ("arm64: topology: Handle AMU FIE setup on CPU hotplug") in
> arm64/for-next/core (next-20260107 and later).
> 
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -284,7 +284,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
> >         struct cpufreq_policy *policy = data;
> >
> >         if (val == CPUFREQ_CREATE_POLICY)
> > -               amu_fie_setup(policy->related_cpus);
> > +               amu_fie_setup(policy->cpus);
> >
> >         /*
> >          * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> > @@ -303,10 +303,71 @@ static struct notifier_block init_amu_fie_notifier = {
> >         .notifier_call = init_amu_fie_callback,
> >  };
> >
> > +static int cpuhp_topology_online(unsigned int cpu)
> > +{
> > +       struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
> > +
> > +       /* Those are cheap checks */
> > +
> > +       /*
> > +        * Skip this CPU if:
> > +        *  - it has no cpufreq policy assigned yet,
> > +        *  - no policy exists that spans CPUs with AMU counters, or
> > +        *  - it was already handled.
> > +        */
> > +       if (unlikely(!policy) || !cpumask_available(amu_fie_cpus) ||
> > +           cpumask_test_cpu(cpu, amu_fie_cpus))
> > +               return 0;
> > +
> > +       /*
> > +        * Only proceed if all already-online CPUs in this policy
> > +        * support AMU counters.
> > +        */
> > +       if (unlikely(!cpumask_subset(policy->cpus, amu_fie_cpus)))
> > +               return 0;
> > +
> > +       /*
> > +        * If the new online CPU cannot pass this check, all the CPUs related to
> > +        * the same policy should be clear from amu_fie_cpus mask, otherwise they
> > +        * may use different source of the freq scale.
> > +        */
> > +       if (!freq_counters_valid(cpu)) {
> > +               pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
> 
> This is triggered during resume from s2ram on Renesas R-Car H3
> (big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), when enabling the first
> little core:
> 
>     AMU: CPU[4] doesn't support AMU counters
> 
> Adding debug code:
> 
>     pr_info("Calling
> topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, %*pbl)\n",
> cpumask_pr_args(policy->related_cpus));
>     pr_info("Calling cpumask_andnot(..., %*pbl, %*pbl)\n",
> cpumask_pr_args(amu_fie_cpus), cpumask_pr_args(policy->related_cpus));
> 
> gives:
> 
>     AMU: Calling topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, 4-7)
>     AMU: Calling cpumask_andnot(..., , 4-7)
> 
> so AMU is disabled for all little cores.
> 
> Since this only happens during s2ram, and not during initial CPU
> bring-up on boot, this looks wrong to me?
This does look rather surprising. If that CPU was marked as supporting AMUs at
the initial bring-up it should be part of amu_fie_cpus mask, so the hp callback
should bail out straight away. Would you be able to add some logs to see what
that mask actually contains ?
Furthermore, freq_counters_valid is logging issues when validating the counters.
Would you be able to re-run it with the debug level to see what might be
happening under the hood, although I am still unsure why it is even reaching
that point ...

---
BR
Beata
> 
> > +               topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
> > +                                                policy->related_cpus);
> > +               cpumask_andnot(amu_fie_cpus, amu_fie_cpus, policy->related_cpus);
> > +               return 0;
> > +       }
> > +
> > +       cpumask_set_cpu(cpu, amu_fie_cpus);
> > +
> > +       topology_set_scale_freq_source(&amu_sfd, cpumask_of(cpu));
> > +
> > +       pr_debug("CPU[%u]: counter will be used for FIE.", cpu);
> > +
> > +       return 0;
> > +}
> > +
> >  static int __init init_amu_fie(void)
> >  {
> > -       return cpufreq_register_notifier(&init_amu_fie_notifier,
> > +       int ret;
> > +
> > +       ret = cpufreq_register_notifier(&init_amu_fie_notifier,
> >                                         CPUFREQ_POLICY_NOTIFIER);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
> > +                                       "arm64/topology:online",
> > +                                       cpuhp_topology_online,
> > +                                       NULL);
> > +       if (ret < 0) {
> > +               cpufreq_unregister_notifier(&init_amu_fie_notifier,
> > +                                           CPUFREQ_POLICY_NOTIFIER);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> >  }
> >  core_initcall(init_amu_fie);
> >
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > index 84ec92bff642..c0ef6ea9c111 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -34,7 +34,14 @@ EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
> >
> >  static bool supports_scale_freq_counters(const struct cpumask *cpus)
> >  {
> > -       return cpumask_subset(cpus, &scale_freq_counters_mask);
> > +       int i;
> > +
> > +       for_each_cpu(i, cpus) {
> > +               if (cpumask_test_cpu(i, &scale_freq_counters_mask))
> > +                       return true;
> > +       }
> > +
> > +       return false;
> >  }
> >
> >  bool topology_scale_freq_invariant(void)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

