Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2061D41141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEhW79U6doUL/JqAk9Ut/HyEczQFD5R9B9xZcFtsnOI=; b=tU8X2A9ZwmT+JAZ/G9K3S5Xqyw
	1dVHsViykA1Ygw9lUfXHmsrYsCaGFkRVIp2lhTg+FAziEn9++p4ZbwZhi2Ge8V0nA9oaLYQAMGo+5
	yhjmqwP5Yo/3PgqqbKaq7jNoX8iA9TNstySINfvVwJZzXEFsGQJoM2rRK7BpbcJebs0IuFQHDIVnt
	+Tftwu/UGIFH2eiRp9vAZkO2h1BWyRiahnoqk1cYuzklH2ZcqwvE+QTrg2lrocRRkAQ8aneJoM7rp
	LiOlF75nlzc8UzDr8vNvNOV2TMv1ASd+DnjtYYEPqE3vr6eQBJ9WlnFkDNx9rS2RFCCHucMaL8HLP
	RPQuCfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIrV-0000000C0SE-0lft;
	Thu, 15 Jan 2026 08:37:49 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIrR-0000000C0Rp-2Lll
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:37:47 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5634feea416so540815e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 00:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466264; x=1769071064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEhW79U6doUL/JqAk9Ut/HyEczQFD5R9B9xZcFtsnOI=;
        b=PMp/lyjZUTtqBki93AQS0ouSAVTCAFOYFPgMasaqn4mW8w3GmcVHZ5cFz3Rf0bhUHP
         svnYVzjmX5GJA2IAmka8hh/TDqgm0BC3z4fTgGX6cq3ADt+f/dxENihvGuSmO/ARYTNd
         Rry4GuqAqCE9H60GEinyOuAtafrgdv9Gx1H33ZojNuizWMb5CW6YnX4sAuZgbPqYk0GQ
         Cd2FyrTSL4r7izW32lOi7QwbQlr1tDbt5RS5lapzKlzImgqdqTxTkgxZYckaXLaXPcse
         wig4TumwHrTQMmqymFSpoJ2inn+jBt9UNgvCDA36bZKta1OfSfN9zrZyEL8JMVzYbuqn
         VCQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN/N4jfoo4X3bIqMzAbrMXshXs5TN27hArG0wedLHMms+46IB2bsge4ckZYAyJK+TaTgLeiM6jAIJmNmaoOIUm@lists.infradead.org
X-Gm-Message-State: AOJu0YxwVdNuBUjy8PjIcyIAH6NQh+7Jjz7Fxt+5F0pZhCc3CbsdZavi
	pU6ZLU/FyYHoPryTx/SQaP9DsCxVxvw/9qgFy37R7jRI2DCYl0D3p76tAUx3lXFN
X-Gm-Gg: AY/fxX4CpPfJ9eXmH8dq+tiRB9KEcSG5Mck//PJy+Mh3l5fTk+UniuFlkxddjfCwhLV
	23c9eppdc+QLc0+kYe0NBt4irn9SJekbps2yDZ1wFvucaKSGEp1omZuURpXs6XoW58aN9RtfzPi
	6Cr89XBiYSkdy5289UBjFKxjKlKz/hUqMl8I0s9modswYMFzM6xRLSVd3IRKRHqOpLIGMEl8tHF
	ZsPPdw8tGDNvlqMrDKAQe0NQTfIVgL5qjpE8WZSoBNuawMh7mfOdPPH4m/Ov0MY33GHse2gokxS
	KmJG4Qd9u2RzfENGXvzFcuIodf9RfFmLakg97/6RcKYsN8GwJ0ajtPj/RUO8OoSu7YuSJQt2A+k
	H+NAnxNqHAaAs8f/Jt+f0EAnwUX2kIhicYIfWPWP01yvrM5LSBVBsTh8Un8TIONLFzpdrBXLXoy
	wfLQOTLiiWTZkgFUcVoQVJHpbHTiQaC3SkaIbFYgwENXiDIVhA5JQQ
X-Received: by 2002:a05:6102:442b:b0:5ed:dda:d16c with SMTP id ada2fe7eead31-5f1838c26d7mr1935324137.13.1768466263574;
        Thu, 15 Jan 2026 00:37:43 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5efaf4b2963sm15342151137.13.2026.01.15.00.37.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 00:37:42 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5634feea416so540791e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 00:37:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRH00sM7SMgnfl3yMDvBnqgMcM9mmzZibytQiBNRbyjXbo57FetW4hz5z23icpnUl9YUwu2h9SO7ZBuiStk+ao@lists.infradead.org
X-Received: by 2002:a05:6122:3b81:b0:563:4a88:6ea5 with SMTP id
 71dfb90a1353d-563a2093a5dmr1838362e0c.5.1768466262231; Thu, 15 Jan 2026
 00:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20251230080115.2120612-1-zhenglifeng1@huawei.com>
 <20251230080115.2120612-4-zhenglifeng1@huawei.com> <CAMuHMdVeHk-Enc-M9ztwSdeAtE8YPKtJwq+273bGPEFOEsu=Rw@mail.gmail.com>
 <aWZriVlQZ5jRx2o4@arm.com> <CAMuHMdVgbQnaCQ8U8FK6J1vJLsqc0_MC7zSTX2B=rsuF2kpEKg@mail.gmail.com>
 <41b7398c-b1a4-4b87-b6f9-07eacf4f4752@huawei.com>
In-Reply-To: <41b7398c-b1a4-4b87-b6f9-07eacf4f4752@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 09:37:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuTrF=eN5tMsjmOfWuuT9r7aCOTS7=YP6+KrSdNrhEpw@mail.gmail.com>
X-Gm-Features: AZwV_QgJfgfwWgiDZ0xWQqvqqWOvLCpdrYhSVw3ZJkes_w8m6CntQRIYTUo-KYk
Message-ID: <CAMuHMdUuTrF=eN5tMsjmOfWuuT9r7aCOTS7=YP6+KrSdNrhEpw@mail.gmail.com>
Subject: Re: [REPOST PATCH v6 3/3] arm64: topology: Handle AMU FIE setup on
 CPU hotplug
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
Cc: Beata Michalska <beata.michalska@arm.com>, catalin.marinas@arm.com, will@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, sudeep.holla@arm.com, 
	gregkh@linuxfoundation.org, dakr@kernel.org, ionela.voinescu@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linuxarm@huawei.com, jonathan.cameron@huawei.com, vincent.guittot@linaro.org, 
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com, 
	zhangpengjie2@huawei.com, wangzhi12@huawei.com, linhongye@h-partners.com, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_003745_645266_BDA2E691 
X-CRM114-Status: GOOD (  50.69  )
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

Hi Lifeng,

On Thu, 15 Jan 2026 at 03:25, zhenglifeng (A) <zhenglifeng1@huawei.com> wrote:
> On 2026/1/14 21:54, Geert Uytterhoeven wrote:
> > On Tue, 13 Jan 2026 at 16:58, Beata Michalska <beata.michalska@arm.com> wrote:
> >> On Tue, Jan 13, 2026 at 11:51:45AM +0100, Geert Uytterhoeven wrote:
> >>> On Tue, 30 Dec 2025 at 09:02, Lifeng Zheng <zhenglifeng1@huawei.com> wrote:
> >>>> Currently, when a cpufreq policy is created, the AMU FIE setup process
> >>>> checks all CPUs in the policy -- including those that are offline. If any
> >>>> of these CPUs are offline at that time, their AMU capability flag hasn't
> >>>> been verified yet, leading the check fail. As a result, AMU FIE is not
> >>>> enabled, even if the CPUs that are online do support it.
> >>>>
> >>>> Later, when the previously offline CPUs come online and report AMU support,
> >>>> there's no mechanism in place to re-enable AMU FIE for the policy. This
> >>>> leaves the entire frequency domain without AMU FIE, despite being eligible.
> >>>>
> >>>> Restrict the initial AMU FIE check to only those CPUs that are online at
> >>>> the time the policy is created, and allow CPUs that come online later to
> >>>> join the policy with AMU FIE enabled.
> >>>>
> >>>> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> >>>> Acked-by: Beata Michalska <beata.michalska@arm.com>
> >>>
> >>> Thanks for your patch, which is now commit 6fd9be0b7b2e957d
> >>> ("arm64: topology: Handle AMU FIE setup on CPU hotplug") in
> >>> arm64/for-next/core (next-20260107 and later).
> >>>
> >>>> --- a/arch/arm64/kernel/topology.c
> >>>> +++ b/arch/arm64/kernel/topology.c
> >>>> @@ -284,7 +284,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
> >>>>         struct cpufreq_policy *policy = data;
> >>>>
> >>>>         if (val == CPUFREQ_CREATE_POLICY)
> >>>> -               amu_fie_setup(policy->related_cpus);
> >>>> +               amu_fie_setup(policy->cpus);
> >>>>
> >>>>         /*
> >>>>          * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> >>>> @@ -303,10 +303,71 @@ static struct notifier_block init_amu_fie_notifier = {
> >>>>         .notifier_call = init_amu_fie_callback,
> >>>>  };
> >>>>
> >>>> +static int cpuhp_topology_online(unsigned int cpu)
> >>>> +{
> >>>> +       struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
> >>>> +
> >>>> +       /* Those are cheap checks */
> >>>> +
> >>>> +       /*
> >>>> +        * Skip this CPU if:
> >>>> +        *  - it has no cpufreq policy assigned yet,
> >>>> +        *  - no policy exists that spans CPUs with AMU counters, or
> >>>> +        *  - it was already handled.
> >>>> +        */
> >>>> +       if (unlikely(!policy) || !cpumask_available(amu_fie_cpus) ||
> >>>> +           cpumask_test_cpu(cpu, amu_fie_cpus))
> >>>> +               return 0;
> >>>> +
> >>>> +       /*
> >>>> +        * Only proceed if all already-online CPUs in this policy
> >>>> +        * support AMU counters.
> >>>> +        */
> >>>> +       if (unlikely(!cpumask_subset(policy->cpus, amu_fie_cpus)))
> >>>> +               return 0;
> >>>> +
> >>>> +       /*
> >>>> +        * If the new online CPU cannot pass this check, all the CPUs related to
> >>>> +        * the same policy should be clear from amu_fie_cpus mask, otherwise they
> >>>> +        * may use different source of the freq scale.
> >>>> +        */
> >>>> +       if (!freq_counters_valid(cpu)) {
> >>>> +               pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
> >>>
> >>> This is triggered during resume from s2ram on Renesas R-Car H3
> >>> (big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), when enabling the first
> >>> little core:
> >>>
> >>>     AMU: CPU[4] doesn't support AMU counters
> >>>
> >>> Adding debug code:
> >>>
> >>>     pr_info("Calling
> >>> topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, %*pbl)\n",
> >>> cpumask_pr_args(policy->related_cpus));
> >>>     pr_info("Calling cpumask_andnot(..., %*pbl, %*pbl)\n",
> >>> cpumask_pr_args(amu_fie_cpus), cpumask_pr_args(policy->related_cpus));
> >>>
> >>> gives:
> >>>
> >>>     AMU: Calling topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, 4-7)
> >>>     AMU: Calling cpumask_andnot(..., , 4-7)
> >>>
> >>> so AMU is disabled for all little cores.
> >>>
> >>> Since this only happens during s2ram, and not during initial CPU
> >>> bring-up on boot, this looks wrong to me?
> >> This does look rather surprising. If that CPU was marked as supporting AMUs at
> >> the initial bring-up it should be part of amu_fie_cpus mask, so the hp callback
> >> should bail out straight away. Would you be able to add some logs to see what
> >> that mask actually contains ?
> >> Furthermore, freq_counters_valid is logging issues when validating the counters.
> >> Would you be able to re-run it with the debug level to see what might be
> >> happening under the hood, although I am still unsure why it is even reaching
> >> that point ...
> >
> > Adding extra debugging info, and "#define DEBUG" at the top.
> >
> > During boot:
> >
> >     AMU: amu_fie_setup:260: cpus 0-3 amu_fie_cpus
> >     ^^^ empty amu_fie_cpus
> >     AMU: CPU0: counters are not supported.
> >     ^^^ pr_debug
> >     AMU: amu_fie_setup:260: cpus 4-7 amu_fie_cpus
> >     ^^^ empty amu_fie_cpus
> >     AMU: CPU4: counters are not supported.
> >     ^^^ pr_debug
> >
> > During resume from s2ram:
> >
> >     AMU: cpuhp_topology_online:314: cpu 1 amu_fie_cpus
> >     AMU: cpuhp_topology_online:343: skipped
> > (!cpumask_subset(policy->cpus, amu_fie_cpus))
> >     AMU: cpuhp_topology_online:314: cpu 2 amu_fie_cpus
> >     AMU: cpuhp_topology_online:343: skipped
> > (!cpumask_subset(policy->cpus, amu_fie_cpus))
> >     AMU: cpuhp_topology_online:314: cpu 3 amu_fie_cpus
> >     AMU: cpuhp_topology_online:343: skipped
> > (!cpumask_subset(policy->cpus, amu_fie_cpus))
> >     AMU: cpuhp_topology_online:314: cpu 4 amu_fie_cpus
> >     AMU: CPU4: counters are not supported.
> >     ^^^ pr_debug
> >     AMU: CPU[4] doesn't support AMU counters
> >     ^^^ pr_warn
> >     AMU: Calling topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, 4-7)
> >     AMU: Calling cpumask_andnot(..., , 4-7)
>
> Something strange here. If AMU is not supported at all, amu_fie_cpus should
> never be available and cpuhp_topology_online() should return in the first
> 'if'. Why it runs this far?

You mean the "!cpumask_available(amu_fie_cpus)" test?

include/linux/cpumask.h:

    #ifdef CONFIG_CPUMASK_OFFSTACK
    static __always_inline bool cpumask_available(cpumask_var_t mask)
    {
            return mask != NULL;
    }
    #else
    static __always_inline bool cpumask_available(cpumask_var_t mask)
    {
            return true;
    }
    #endif /* CONFIG_CPUMASK_OFFSTACK */

include/linux/cpumask_types.h:

    #ifdef CONFIG_CPUMASK_OFFSTACK
    typedef struct cpumask *cpumask_var_t;
    #else
    typedef struct cpumask cpumask_var_t[1];
    #endif /* CONFIG_CPUMASK_OFFSTACK */

So if CONFIG_CPUMASK_OFFSTACK is not enabled, it always returns true.

arch/arm64/Kconfig:

    config ARM64
        [...]
        select CPUMASK_OFFSTACK if NR_CPUS > 256

> >     AMU: cpuhp_topology_online:314: cpu 5 amu_fie_cpus
> >     AMU: cpuhp_topology_online:343: skipped
> > (!cpumask_subset(policy->cpus, amu_fie_cpus))
> >     AMU: cpuhp_topology_online:314: cpu 6 amu_fie_cpus
> >     AMU: cpuhp_topology_online:343: skipped
> > (!cpumask_subset(policy->cpus, amu_fie_cpus))
> >     AMU: cpuhp_topology_online:314: cpu 7 amu_fie_cpus
> >     AMU: cpuhp_topology_online:343: skipped
> > (!cpumask_subset(policy->cpus, amu_fie_cpus))
> >
> > Hence there is no issue, as AMU is not supported at all!
> >
> > The confusing part is in the (absence of) logging.
> > If AMU is not supported, freq_counters_valid() uses:
> >
> >      pr_debug("CPU%d: counters are not supported.\n", cpu);
> >
> > which is typically not printed, unless DEBUG is enabled.
> >
> > If freq_counters_valid() failed, the new cpuhp_topology_online() uses:
> >
> >     pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
> >
> > which is always printed.
> >
> > Given freq_counters_valid() already prints a (debug) message, I think
> > the pr_warn() should just be removed.  Do you agree, or is there still
> > another incorrect check that should prevent getting this far?
>
> I'm OK with removing it.

OK, I will send a patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

