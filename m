Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D4DD6406B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 02:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tG7gbuCGz2VEtDJz5NoA+5yzBAJyFs+yPzvYJuVK8o=; b=e3dTnuawcxG7n/xVhUID9Dk766
	DwvUsN2lLqjXkL/eGmfNouCkyxSrGA07LksVY2/uOGmFVgEEir6D3yjzPpY79KChzR2VzD1bkp9Si
	tZyEBA8Z2jEMxsOIJ1o/2WvTRBd9E3yfkQqgGkHxkXBeoc6q1nPkr53HR5TdETlSljUmmyXlc1wy9
	HeGMTCJaeM5RKxKV0V+NKbxmKd9PudQHqn+yIKAAql2BymvfZmpi3E/tSo9BtR5IwgTEsggMytCHk
	ds0kW2amIsq6YdVS3Jwhf/zEI8GO73809gIpesaPnIpyox3xXtUBzFh3TnPafwZxG1nUvWw1CGitE
	oHc2xIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhBQ-000000063PD-05yE;
	Wed, 17 Dec 2025 02:22:32 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhBM-000000063OY-3pU5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 02:22:30 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4557f0e5ed2so84589b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 18:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765938145; x=1766542945; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tG7gbuCGz2VEtDJz5NoA+5yzBAJyFs+yPzvYJuVK8o=;
        b=HMUryf9dqOz+/EOOmwoLRhbDG3FKYGF4Cd1XghkRwEgyPDncina1Ic3eAmzR1mPC5w
         doZuiyRc8CayvwQHPWWfEGyAa7KGheOrvKPPI8CGjHDXM1UhuCEFyk3yhhByD4itPcbu
         1y3amiDzLZMZa6GHK3ck2aidtWsnhz0py0dXn2YVXHC1uPFKZb1xXNcntbFuaHMf8QZY
         7Q5IPQ4eozBhXTERBo/MjYIsXz1dFuf5NlR2NR8rjrrTQk80GqiezB1JxygggJOgcSMr
         7AAVsYCOvaY0GzEwdRvKE+JSxpUP0+rSOl5qNsV8RlJhx9pkArcg0j/JJee6FDwDfTCZ
         bKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765938145; x=1766542945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8tG7gbuCGz2VEtDJz5NoA+5yzBAJyFs+yPzvYJuVK8o=;
        b=okMFw9Kx7ihGMxNU1RuGhzbnUJTXnZNOlyrIpf8N0gm8DxvvSPbhhVrTlxga7xIVXE
         w5gooo4y6+S0DqBujP9vymvX/mOiz8BPahLpEoz2X/fuXbXcKMM4DAV2M2GvKNwqM1tJ
         UteJqoVyF1QCNwAPE+ti9bTvufewDEUDX4nOLL2nkL7KhjWz1DHE93SPa0ERdV+g+yJj
         5F8mzEsKBUC3Nv//qxU3pFDg61/hiyiAmOSXQggQqObfqpTylbWVyVoBDDU44Q+sH64d
         TmNif1XXIvUXDMcQtB2TTdBWxYjkSjW+T27XIkTzWji1fMwwEXMYWlSppdcDJ013o0Ol
         91/A==
X-Forwarded-Encrypted: i=1; AJvYcCVpmhte02xHPcGaaQNBKDcRyCGfYMtwtaTj0fLGSk7MUQ2rb1sIbfTs3SFUpUTOJUwAp/RW5XJrLNHrWKRKLwTc@lists.infradead.org
X-Gm-Message-State: AOJu0YzzQHh3wnqKLIh4IzRj+l2L81oO4H/6W9d1gucxg+bgTQ9lxzM8
	RymnX+YGFKaBYts2LdToHkHvxXK9agPxy3DyODxEgnVZR35KMyVmqOXa7kGy7LVGytzFpBwTUou
	oZxbDOKuV0RZl8hYWhDIRPYSa3wrvKsihLtm46h4u+A==
X-Gm-Gg: AY/fxX5mIvjCU65jR5vyXX5uEsuDg2Au6+TVbM2IMQTj0mJpdHBQ2+mNrzbLzYMQA8g
	k+gQbcmxgH2V5dg9UAqwTH6sWW9WWzxedY4LhZHmw93w+kFgXoWYeHlhStHYtUUh+2Ob55g689g
	H1ihko0v6VwV5MFq0gMkJpdOPSn2fN9hsB/k2zjo8KmoeBZngyoVG6/xS4YJublxKaHAcdIxPy0
	293VnB0LS4letNLpyFuUNBCkEnswmRNa8/52vc+ydKKjOFHFDl3YUVFbMWQSq+4dAlfXDZtTRUD
	CA==
X-Google-Smtp-Source: AGHT+IF5C9jac6/7XdxNi+eVsUaFjO5ejIrN7BfKgN/LL9TP5xxRqOeyUIjESNZMLJWCpvedvtQAlZcB5wQF7jF+R5s=
X-Received: by 2002:a05:6808:1312:b0:450:aef0:ffd0 with SMTP id
 5614622812f47-455ab7988edmr8518830b6e.29.1765938145219; Tue, 16 Dec 2025
 18:22:25 -0800 (PST)
MIME-Version: 1.0
References: <20251105082639.342973-1-cleger@rivosinc.com> <20251105082639.342973-5-cleger@rivosinc.com>
 <CAEEQ3wnQiUdNVjUpdDgAx1=y76vSo66vCD0Wf3EGes274jnkxw@mail.gmail.com> <CADGDLFgnx3z9WMZBjURx7eEFeeDwb9tj+8WAik4siR_G8erk0Q@mail.gmail.com>
In-Reply-To: <CADGDLFgnx3z9WMZBjURx7eEFeeDwb9tj+8WAik4siR_G8erk0Q@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 17 Dec 2025 10:22:13 +0800
X-Gm-Features: AQt7F2rsyyv5lusN6nINqVf6NilAzTgu6JoWTmmLqNsuUE50eR63ntU_bvWdUNk
Message-ID: <CAEEQ3wmLvBy0rVCwP_LcF9ube0=a1K6QFyp9jnE7JRMXxL11nw@mail.gmail.com>
Subject: Re: [External] [PATCH v8 4/5] perf: RISC-V: add support for SSE event
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Xu Lu <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_182228_986964_EAA9C937 
X-CRM114-Status: GOOD (  34.66  )
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

Hi Cl=C3=A9ment,

On Wed, Dec 17, 2025 at 4:36=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> On Fri, Dec 12, 2025 at 4:17=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.c=
om> wrote:
> >
> > Hi Cl=C3=A9ment,
> >
> > On Wed, Nov 5, 2025 at 4:29=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@=
rivosinc.com> wrote:
> > >
> > > In order to use SSE within PMU drivers, register a SSE handler for th=
e
> > > local PMU event. Reuse the existing overflow IRQ handler and pass
> > > appropriate pt_regs. Add a config option RISCV_PMU_SSE to select even=
t
> > > delivery via SSE events.
> > >
> > > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> > > ---
> > >  drivers/perf/Kconfig           | 10 +++++
> > >  drivers/perf/riscv_pmu.c       | 23 +++++++++++
> > >  drivers/perf/riscv_pmu_sbi.c   | 71 +++++++++++++++++++++++++++++---=
--
> > >  include/linux/perf/riscv_pmu.h |  5 +++
> > >  4 files changed, 99 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> > > index 638321fc9800..d6ffc2b036e5 100644
> > > --- a/drivers/perf/Kconfig
> > > +++ b/drivers/perf/Kconfig
> > > @@ -105,6 +105,16 @@ config RISCV_PMU_SBI
> > >           full perf feature support i.e. counter overflow, privilege =
mode
> > >           filtering, counter configuration.
> > >
> > > +config RISCV_PMU_SBI_SSE
> > > +       depends on RISCV_PMU && RISCV_SBI_SSE
> > > +       bool "RISC-V PMU SSE events"
> > > +       default n
> > > +       help
> > > +         Say y if you want to use SSE events to deliver PMU interrup=
ts. This
> > > +         provides a way to profile the kernel at any level by using =
NMI-like
> > > +         SSE events. SSE events being really intrusive, this option =
allows
> > > +         to select it only if needed.
> > > +
> > >  config STARFIVE_STARLINK_PMU
> > >         depends on ARCH_STARFIVE || COMPILE_TEST
> > >         depends on 64BIT
> > > diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> > > index 7644147d50b4..dda2814801c0 100644
> > > --- a/drivers/perf/riscv_pmu.c
> > > +++ b/drivers/perf/riscv_pmu.c
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/irqdesc.h>
> > >  #include <linux/perf/riscv_pmu.h>
> > >  #include <linux/printk.h>
> > > +#include <linux/riscv_sbi_sse.h>
> > >  #include <linux/smp.h>
> > >  #include <linux/sched_clock.h>
> > >
> > > @@ -254,6 +255,24 @@ void riscv_pmu_start(struct perf_event *event, i=
nt flags)
> > >         perf_event_update_userpage(event);
> > >  }
> > >
> > > +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> > > +static void riscv_pmu_disable(struct pmu *pmu)
> > > +{
> > > +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(pmu);
> > > +
> > > +       if (rvpmu->sse_evt)
> > > +               sse_event_disable_local(rvpmu->sse_evt);
> > > +}
> > > +
> > > +static void riscv_pmu_enable(struct pmu *pmu)
> > > +{
> > > +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(pmu);
> > > +
> > > +       if (rvpmu->sse_evt)
> > > +               sse_event_enable_local(rvpmu->sse_evt);
> > > +}
> > > +#endif
> > > +
> > >  static int riscv_pmu_add(struct perf_event *event, int flags)
> > >  {
> > >         struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
> > > @@ -411,6 +430,10 @@ struct riscv_pmu *riscv_pmu_alloc(void)
> > >                 .event_mapped   =3D riscv_pmu_event_mapped,
> > >                 .event_unmapped =3D riscv_pmu_event_unmapped,
> > >                 .event_idx      =3D riscv_pmu_event_idx,
> > > +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> > > +               .pmu_enable     =3D riscv_pmu_enable,
> > > +               .pmu_disable    =3D riscv_pmu_disable,
> > > +#endif
> > >                 .add            =3D riscv_pmu_add,
> > >                 .del            =3D riscv_pmu_del,
> > >                 .start          =3D riscv_pmu_start,
> > > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sb=
i.c
> > > index e255c1b069ec..c852f64a5022 100644
> > > --- a/drivers/perf/riscv_pmu_sbi.c
> > > +++ b/drivers/perf/riscv_pmu_sbi.c
> > > @@ -17,6 +17,7 @@
> > >  #include <linux/irqdomain.h>
> > >  #include <linux/of_irq.h>
> > >  #include <linux/of.h>
> > > +#include <linux/riscv_sbi_sse.h>
> > >  #include <linux/cpu_pm.h>
> > >  #include <linux/sched/clock.h>
> > >  #include <linux/soc/andes/irq.h>
> > > @@ -1038,10 +1039,10 @@ static void pmu_sbi_start_overflow_mask(struc=
t riscv_pmu *pmu,
> > >                 pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
> > >  }
> > >
> > > -static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
> > > +static irqreturn_t pmu_sbi_ovf_handler(struct cpu_hw_events *cpu_hw_=
evt,
> > > +                                      struct pt_regs *regs, bool fro=
m_sse)
> > >  {
> > >         struct perf_sample_data data;
> > > -       struct pt_regs *regs;
> > >         struct hw_perf_event *hw_evt;
> > >         union sbi_pmu_ctr_info *info;
> > >         int lidx, hidx, fidx;
> > > @@ -1049,7 +1050,6 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq,=
 void *dev)
> > >         struct perf_event *event;
> > >         u64 overflow;
> > >         u64 overflowed_ctrs =3D 0;
> > > -       struct cpu_hw_events *cpu_hw_evt =3D dev;
> > >         u64 start_clock =3D sched_clock();
> > >         struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapsho=
t_addr;
> > >
> > > @@ -1059,13 +1059,15 @@ static irqreturn_t pmu_sbi_ovf_handler(int ir=
q, void *dev)
> > >         /* Firmware counter don't support overflow yet */
> > >         fidx =3D find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_C=
OUNTERS);
> > >         if (fidx =3D=3D RISCV_MAX_COUNTERS) {
> > > -               csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
> > > +               if (!from_sse)
> > > +                       csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
> > >                 return IRQ_NONE;
> > >         }
> > >
> > >         event =3D cpu_hw_evt->events[fidx];
> > >         if (!event) {
> > > -               ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> > > +               if (!from_sse)
> > > +                       ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_m=
ask);
> > >                 return IRQ_NONE;
> > >         }
> > >
> > > @@ -1080,16 +1082,16 @@ static irqreturn_t pmu_sbi_ovf_handler(int ir=
q, void *dev)
> > >
> > >         /*
> > >          * Overflow interrupt pending bit should only be cleared afte=
r stopping
> > > -        * all the counters to avoid any race condition.
> > > +        * all the counters to avoid any race condition. When using S=
SE,
> > > +        * interrupt is cleared when stopping counters.
> > >          */
> > > -       ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> > > +       if (!from_sse)
> > > +               ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> > >
> > >         /* No overflow bit is set */
> > >         if (!overflow)
> > >                 return IRQ_NONE;
> > >
> > > -       regs =3D get_irq_regs();
> > > -
> > >         for_each_set_bit(lidx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_CO=
UNTERS) {
> > >                 struct perf_event *event =3D cpu_hw_evt->events[lidx]=
;
> > >
> > > @@ -1145,6 +1147,51 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq=
, void *dev)
> > >         return IRQ_HANDLED;
> > >  }
> > >
> > > +static irqreturn_t pmu_sbi_ovf_irq_handler(int irq, void *dev)
> > > +{
> > > +       return pmu_sbi_ovf_handler(dev, get_irq_regs(), false);
> > > +}
> > > +
> > > +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> > > +static int pmu_sbi_ovf_sse_handler(u32 evt, void *arg, struct pt_reg=
s *regs)
> > > +{
> > > +       struct cpu_hw_events __percpu *hw_events =3D arg;
> > > +       struct cpu_hw_events *hw_event =3D raw_cpu_ptr(hw_events);
> > > +
> > > +       pmu_sbi_ovf_handler(hw_event, regs, true);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
> > > +{
> > > +       int ret;
> > > +       struct sse_event *evt;
> > > +       struct cpu_hw_events __percpu *hw_events =3D pmu->hw_events;
> > > +
> > > +       evt =3D sse_event_register(SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, =
0,
> > > +                                pmu_sbi_ovf_sse_handler, hw_events);
> >
> > As Radim suggested, we had better preset a priority for different
> > events, such as these events and future ones:
> > SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS
> > SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP
> > SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS
> > SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW
> > SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS
> > SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS
> > SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED
> > SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI
> > SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED
>
> Hey Yunhui,
>
> What do you mean exactly ? Events have default priority based on their
> ID. However, the register call will set a priority =3D 0 for the event.
> I'll modify that to allow using an optional priority (or even remove
> it)

Actually, each event needs to be assigned a reasonable priority.
Reference: https://lore.kernel.org/all/CAEEQ3wmEVVHC=3DS795dFsQ9iM5Xkz-KOBe=
_CxXbvzyDBUo3wU6A@mail.gmail.com/

>
> Thanks,
>
> Cl=C3=A9ment
>
> >
> > Could you please help add a "global priority enum"?
> >
> >
> > > +       if (IS_ERR(evt))
> > > +               return PTR_ERR(evt);
> > > +
> > > +       ret =3D sse_event_enable(evt);
> > > +       if (ret) {
> > > +               sse_event_unregister(evt);
> > > +               return ret;
> > > +       }
> > > +
> > > +       pr_info("using SSE for PMU event delivery\n");
> > > +       pmu->sse_evt =3D evt;
> > > +
> > > +       return ret;
> > > +}
> > > +#else
> > > +static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
> > > +{
> > > +       return -EOPNOTSUPP;
> > > +}
> > > +#endif
> > > +
> > >  static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node =
*node)
> > >  {
> > >         struct riscv_pmu *pmu =3D hlist_entry_safe(node, struct riscv=
_pmu, node);
> > > @@ -1195,6 +1242,10 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu=
 *pmu, struct platform_device *pde
> > >         struct cpu_hw_events __percpu *hw_events =3D pmu->hw_events;
> > >         struct irq_domain *domain =3D NULL;
> > >
> > > +       ret =3D pmu_sbi_setup_sse(pmu);
> > > +       if (!ret)
> > > +               return 0;
> > > +
> > >         if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> > >                 riscv_pmu_irq_num =3D RV_IRQ_PMU;
> > >                 riscv_pmu_use_irq =3D true;
> > > @@ -1229,7 +1280,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu =
*pmu, struct platform_device *pde
> > >                 return -ENODEV;
> > >         }
> > >
> > > -       ret =3D request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler=
, "riscv-pmu", hw_events);
> > > +       ret =3D request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_irq_han=
dler, "riscv-pmu", hw_events);
> > >         if (ret) {
> > >                 pr_err("registering percpu irq failed [%d]\n", ret);
> > >                 return ret;
> > > diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/risc=
v_pmu.h
> > > index f82a28040594..08fdcf6baf4e 100644
> > > --- a/include/linux/perf/riscv_pmu.h
> > > +++ b/include/linux/perf/riscv_pmu.h
> > > @@ -28,6 +28,8 @@
> > >
> > >  #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
> > >
> > > +struct sse_event;
> > > +
> > >  struct cpu_hw_events {
> > >         /* currently enabled events */
> > >         int                     n_events;
> > > @@ -54,6 +56,9 @@ struct riscv_pmu {
> > >         char            *name;
> > >
> > >         irqreturn_t     (*handle_irq)(int irq_num, void *dev);
> > > +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> > > +       struct sse_event *sse_evt;
> > > +#endif
> > >
> > >         unsigned long   cmask;
> > >         u64             (*ctr_read)(struct perf_event *event);
> > > --
> > > 2.43.0
> > >
> >
> > Thanks,
> > Yunhui

Thanks,
Yunhui

