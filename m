Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F13C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxnJ+JMAeXEe0tFyoruENV/4pmqUfnDATYgkfRCTwwk=; b=qTTaPa7XzoERDxYrDlEKA8aMyH
	rQB2VjdcyT6q+J3cUMI8hZUHvIQqXH3/Dk+mwAFlSuzzgJNAIsue3w12sGLHaAc5bLkfVCpH7KjrT
	nd+SHKkTgZEj/9TZQb+K/QCxfO6uwYCdZbxw595aixdyRaVrpdK5gsy1oojFUOXGsb+HmzmtXTNSa
	ICjXmoTCbNdRSyD426jlp0SBztx4raEowi+JIA+s6mjSBldAMZw28/Bt8GY8LOVHORv1gIZJhHKGc
	iwlFPMgYMAvB/aut7pOk3XO3jrepgSDDMRp4f1aoY/UPoyEM5l9+5uWd8wMVwEDlXBanEFvdeiJA4
	WBuGtG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnqP-0000000ByEu-3Thz;
	Thu, 26 Jun 2025 14:44:53 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnm9-0000000BxbK-1ykU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 14:40:30 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-408d7e2b040so680681b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750948828; x=1751553628; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mxnJ+JMAeXEe0tFyoruENV/4pmqUfnDATYgkfRCTwwk=;
        b=GZe2cRXmy1sD8IOTMyMagtYvuvb+5/QDRmtb9Yu9e/6mpy1W5AW8f0+ZHJOOLovrgY
         /E+ta6q74So3xnRFHs41/izDbkRfbLPqIthX5fQCK7C8TrH82SMUXFaYlB7VGYY7hg1d
         xL0C7pJnlx2YpOXAOFmhgCn27cLDNyv0k3x8UO8sXaJK8QipOitqZ1932iM76Fsr+rvT
         H3H5oeMTchgpJKRhkU0HEodMb/doElwW24MHCaS6PT/Gd+zDvCSKaXrMjfBTcVU80ZaS
         W/D3g6DTwO9eG4knXhqIkdEHK31r1qL862mE3mn77TF2N5H2MZ7KhiKg3sWV/ck89T/l
         /bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948828; x=1751553628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxnJ+JMAeXEe0tFyoruENV/4pmqUfnDATYgkfRCTwwk=;
        b=b2G4G29hM+7DgyODNRR7XfWszKGurzszsySR1wLwJxP2QKZvsQcMZyR0G/pctWP6/T
         r8iLpPm9PYkAYS7Hhvt0QtrT/FDjV6ekFnlPnwkMDUZGZF31zmBvBSkGYeOB1b4ngjtm
         r0cgwQzrW9vxGasPdx0A4hnBtz8baz9H5xwS15U6i7H+sThwWBTS8INW+3JFXFEH1zgt
         oXreGlCTFWdGuyOG9u8zXY4H8HqPh1zWUIjvWIzNdefZcjHb+3uae5kt+S+hUIojPsZD
         DNII2uxKB4OZ7lTf6J1/9W85klGcAm0cYl3acBA9KcVqfaBXFKj8jp/etB+x8WkYrQis
         pD2w==
X-Forwarded-Encrypted: i=1; AJvYcCVNwOeo2k7PVaohIVfsx/FqPyULxE/JLfcvno/nLzFDy6RxwXl2yrOJYM3o/kHnrRyjtSYN0mHa5Xzf31q/d5ZK@lists.infradead.org
X-Gm-Message-State: AOJu0YxGOFybRSJowH2NpSsxj9QyBlvMpp9W+n+zUICZ1VjGcqvB3+Qd
	DsCosI9RMemMY9LCL31665FMN09HQ7mqfG5xTPXbUqpiibfrNt7Yu3Ez3iJIyxVUGvawgK6yzrP
	FZKiOrSNgsSnM8PhfNWp5JFMuwlwPEHx/wPyyDU+5Pg==
X-Gm-Gg: ASbGnctJWrtb0SikcuUuVjkDk0UDpqUuqq0e1BSBxYSRQJh3ZK2mWYkmLEaTYXtumsK
	0+og/PRkkC1Ol24ClQMVNJaieJIGAuhV+mLOxNeQu0szLvAxQ9Mb7rPb63ThzU1a8Od/Xii+hIE
	Gn9W5fvlwKlD9zdNOvr8rBAi0yWkGG8/VXKtSOPuYe8eo7
X-Google-Smtp-Source: AGHT+IGHmBJjuI+jjZm5dEoJCIPgYdOyi9w4BnG28G9e5pmpEj5kPuV2QO71c3KUdTEVfpTi32Y/zFwNrd073ovM1Nk=
X-Received: by 2002:a05:6808:4fe3:b0:401:e67c:b3be with SMTP id
 5614622812f47-40b31c96519mr95767b6e.4.1750948827854; Thu, 26 Jun 2025
 07:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
 <20250611-gs101-cpuidle-v2-2-4fa811ec404d@linaro.org> <4e827037-1bde-4eb3-a6f2-6416dace10b5@kernel.org>
In-Reply-To: <4e827037-1bde-4eb3-a6f2-6416dace10b5@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 26 Jun 2025 15:40:16 +0100
X-Gm-Features: Ac12FXyqVtwDD2H_scgEAaexOZMihIpWC1bKrXvc2_bGE_Q9OwsMvGA0M86meco
Message-ID: <CADrjBPrWZ4JkNJ-c9Qiw=5mmMKePqg6ZW=ATwi8g-1F8Qekn=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074029_518920_82B8E3BA 
X-CRM114-Status: GOOD (  54.11  )
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

Hi Krzysztof,

Thanks a lot for your review feedback!

On Wed, 18 Jun 2025 at 11:22, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/06/2025 11:34, Peter Griffin wrote:
> > Register cpu pm notifiers for gs101 which call the
> > gs101_cpu_pmu_online/offline callbacks which in turn
> > program the ACPM hint. This is required to actually
> > enter the idle state.
> >
> > A couple of corner cases are handled, namely when the
> > system is rebooting or suspending we ignore the request.
> > Additionally the request is ignored if the CPU is in
> > CPU hot plug.
> >
> > Note: this patch has a runtime dependency on adding
> > 'local-timer-stop' dt property to the CPU nodes. This
> > informs the time framework to switch to a broadcast timer
> > as the local timer will be shutdown. Without that DT
> > property specified the system hangs in early boot with
> > this patch applied.
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Noted, will fix

>
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes in v2
> >  * Add ifdef CONFIG_PM_SLEEP to avoid
> >    Fix warning: unused variable 'cpupm_pm_ops' [-Wunused-const-variable] (0-day)
> > ---
> >  drivers/soc/samsung/exynos-pmu.c | 137 +++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 133 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> > index a77288f49d249f890060c595556708334383c910..7f72ecd60994f18bb639dd8e09e1c6ff6158066b 100644
> > --- a/drivers/soc/samsung/exynos-pmu.c
> > +++ b/drivers/soc/samsung/exynos-pmu.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/array_size.h>
> >  #include <linux/arm-smccc.h>
> >  #include <linux/cpuhotplug.h>
> > +#include <linux/cpu_pm.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> >  #include <linux/mfd/core.h>
> > @@ -15,6 +16,7 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/delay.h>
> > +#include <linux/reboot.h>
> >  #include <linux/regmap.h>
> >
> >  #include <linux/soc/samsung/exynos-regs-pmu.h>
> > @@ -35,6 +37,10 @@ struct exynos_pmu_context {
> >       const struct exynos_pmu_data *pmu_data;
> >       struct regmap *pmureg;
> >       struct regmap *pmuintrgen;
> > +     spinlock_t cpupm_lock;  /* serialization lock */
>
> serialization of what? Or rather, can it be not a serialization lock? Is
> it possible? It's as useful as saying "protection against concurrent
> accesses lock". No, you need to be explicit which members and/or code
> are protected.

I can update the comment to be more verbose, but the lock is used to
ensure the cpu online/offline sequence called from CPU hotplug
callbacks and cpu pm notifiers are serialized.

>
> > +     bool __percpu *hotplug_ing;
> > +     atomic_t sys_suspended;
>
> Why re-implementing own refcnt of pm suspend status?
> pm_runtime_suspended() and others?

sys_suspended is being used to detect whether a *system* wide sleep
state is happening. I see a bunch of different drivers using a similar
approach in the kernel to set a flag from their suspend/resume
callback. Grep for things like system_suspending, is_suspending etc.
An alternative approach could be to use register_pm_notifier() and set
the flag from the callback there.

pm_runtime_suspended() tells me the runtime pm status, which is not
what I want here.

> > +     atomic_t sys_rebooting;
> >  };
> >
> >  void __iomem *pmu_base_addr;
> > @@ -336,7 +342,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
> >  #define CPU_INFORM_CLEAR     0
> >  #define CPU_INFORM_C2                1
> >
> > -static int gs101_cpuhp_pmu_online(unsigned int cpu)
> > +static int gs101_cpu_pmu_online(unsigned int cpu)
> >  {
> >       unsigned int cpuhint = smp_processor_id();
> >       u32 reg, mask;
> > @@ -358,10 +364,26 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
> >       return 0;
> >  }
> >
> > -static int gs101_cpuhp_pmu_offline(unsigned int cpu)
> > +static int gs101_cpuhp_pmu_online(unsigned int cpu)
>
> This needs either renaming or comments. One is cpu_pmu_online other is
> cpuhp_pmu_online. Sounds the same to me.

I can add some comments, but one function is specifically for CPU Hot
Plug, which is what the 'cpuhp' part was trying to convey.

>
>
> > +{
> > +     gs101_cpu_pmu_online(cpu);
> > +
> > +     /*
> > +      * Mark this CPU as having finished the hotplug.
> > +      * This means this CPU can now enter C2 idle state.
> > +      */
> > +     *per_cpu_ptr(pmu_context->hotplug_ing, cpu) = false;
>
> Quoting docs: "Per cpu data structures are designed to be used by one
> cpu exclusively".
>
> ... and further about write access. Adding standard driver code using
> "highly discouraged" practice is not something expected.

I'll update this to dynamically allocate based on num_possible_cpus()
and then read/write the flag with cpupm lock held. I didn't realize
the docs described the per_cpu remote writes as "highly discouraged
unless absolutely necessary", so thanks for highlighting that. The
per_cpu variables with remote writes seem quite widely used in the
downstream exynos-cpupm driver, but then it takes all sorts of locks
through all the different cal layers.

>
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int gs101_cpu_pmu_offline(unsigned int cpu)
> >  {
> >       u32 reg, mask;
> > -     unsigned int cpuhint = smp_processor_id();
> > +     unsigned int cpuhint;
> > +
> > +     spin_lock(&pmu_context->cpupm_lock);
>
> This does not disable interrupts...
>
> > +     cpuhint = smp_processor_id();
>
> ... which is a requirement here, according to docs, no? Maybe the
> original code had an issue, though.

CPU notifiers are called with interrupts disabled. We do use a similar
pattern in the CPU hot plug path which isn't called with IRQs disabled
though, so I'll add some locking there in the next version.

Thanks,

Peter



>
> >
> >       /* set cpu inform hint */
> >       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> > @@ -379,16 +401,89 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
> >       regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
> >       regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
> >                    reg & mask);
> > +
> > +     spin_unlock(&pmu_context->cpupm_lock);
> >       return 0;
> >  }
> >
> > +static int gs101_cpuhp_pmu_offline(unsigned int cpu)
> > +{
> > +     /*
> > +      * Mark this CPU as entering hotplug. So as not to confuse
> > +      * ACPM the CPU entering hotplug should not enter C2 idle state.
> > +      */
> > +     *per_cpu_ptr(pmu_context->hotplug_ing, cpu) = true;
> > +
> > +     gs101_cpu_pmu_offline(cpu);
> > +
> > +     return 0;
> > +}
> > +
> > +static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
> > +                                     unsigned long action, void *v)
> > +{
> > +     int cpu = smp_processor_id();
> > +
> > +     switch (action) {
> > +     case CPU_PM_ENTER:
> > +             /*
> > +              * Ignore CPU_PM_ENTER event in reboot or
> > +              * suspend sequence.
> > +              */
> > +
> > +             if (atomic_read(&pmu_context->sys_suspended) ||
> > +                 atomic_read(&pmu_context->sys_rebooting))
> > +                     return NOTIFY_OK;
> > +
> > +             if (*per_cpu_ptr(pmu_context->hotplug_ing, cpu))
> > +                     return NOTIFY_BAD;
> > +
> > +             gs101_cpu_pmu_offline(cpu);
> > +
> > +             break;
> > +     case CPU_PM_EXIT:
> > +
> > +             if (atomic_read(&pmu_context->sys_rebooting))
> > +                     return NOTIFY_OK;
> > +
> > +             gs101_cpu_pmu_online(cpu);
> > +
> > +             break;
> > +     }
> > +
> > +     return NOTIFY_OK;
> > +}
> > +
> > +static struct notifier_block gs101_cpu_pm_notifier = {
> > +     .notifier_call = gs101_cpu_pm_notify_callback,
> > +     .priority = INT_MAX     /* we want to be called first */
>
> You should say why. Everyone wants to be the first.
>
> > +};
> > +
> > +static int exynos_cpupm_reboot_notifier(struct notifier_block *nb,
> > +                                     unsigned long event, void *v)
> > +{
> > +     switch (event) {
> > +     case SYS_POWER_OFF:
> > +     case SYS_RESTART:
> > +             atomic_set(&pmu_context->sys_rebooting, 1);
> > +             break;
> > +     }
> > +
> > +     return NOTIFY_OK;
> > +}
> > +
> > +static struct notifier_block exynos_cpupm_reboot_nb = {
> > +     .priority = INT_MAX,
> > +     .notifier_call = exynos_cpupm_reboot_notifier,
> > +};
> > +
> >  static int exynos_pmu_probe(struct platform_device *pdev)
> >  {
> >       struct device *dev = &pdev->dev;
> >       struct regmap_config pmu_regmcfg;
> >       struct regmap *regmap;
> >       struct resource *res;
> > -     int ret;
> > +     int ret, cpu;
> >
> >       pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
> >       if (IS_ERR(pmu_base_addr))
> > @@ -444,6 +539,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
> >                        */
> >                       dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
> >               } else {
> > +                     pmu_context->hotplug_ing = alloc_percpu(bool);
> > +
> > +                     /* set PMU to power on */
> > +                     for_each_online_cpu(cpu)
> > +                             gs101_cpuhp_pmu_online(cpu);
> > +
> >                       cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
> >                                         "soc/exynos-pmu:prepare",
> >                                         gs101_cpuhp_pmu_online, NULL);
> > @@ -451,6 +552,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
> >                       cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> >                                         "soc/exynos-pmu:online",
> >                                         NULL, gs101_cpuhp_pmu_offline);
> > +
> > +                     cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
> > +                     spin_lock_init(&pmu_context->cpupm_lock);
> > +                     atomic_set(&pmu_context->sys_rebooting, 0);
> > +                     atomic_set(&pmu_context->sys_suspended, 0);
> > +                     register_reboot_notifier(&exynos_cpupm_reboot_nb);
> >               }
> >       }
> >
> > @@ -471,10 +578,32 @@ static int exynos_pmu_probe(struct platform_device *pdev)
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_PM_SLEEP
> > +static int exynos_cpupm_suspend_noirq(struct device *dev)
> > +{
> > +     atomic_set(&pmu_context->sys_suspended, 1);
> > +     return 0;
> > +}
> > +
> > +static int exynos_cpupm_resume_noirq(struct device *dev)
> > +{
> > +     atomic_set(&pmu_context->sys_suspended, 0);
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops cpupm_pm_ops = {
> > +     .suspend_noirq = exynos_cpupm_suspend_noirq,
> > +     .resume_noirq = exynos_cpupm_resume_noirq,
>
> SET_LATE_SYSTEM_SLEEP_PM_OPS or one of other wrappers.
>
> > +};
> > +#endif
> > +
> >  static struct platform_driver exynos_pmu_driver = {
> >       .driver  = {
> >               .name   = "exynos-pmu",
> >               .of_match_table = exynos_pmu_of_device_ids,
> > +#ifdef CONFIG_PM_SLEEP
> > +             .pm = &cpupm_pm_ops,
>
> pm_ptr
> > +#endif
> >       },
> >       .probe = exynos_pmu_probe,
> >  };
> >
>
>
> Best regards,
> Krzysztof

