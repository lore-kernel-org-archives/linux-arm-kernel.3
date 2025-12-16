Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEF9D637A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 20:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gv3fR1f0d4J7Wx8tPpx3i+Ybrysql766wrV4wqRgUXM=; b=pjoVXYv9o5YGn5aX8FpRasSLtG
	Zhvi1HdSov2+DJ4IXB64gsGYcIqsQzXasgfU5nX6M6I+17Eu+J37j3aY5hFyxNZMz7LG9odIadknU
	xVztguqXEAJ0/rd1jxeVkLZyAmRIW+5VMPDuF3CgyKEHQnqUwE0Bv2FSKHaWnDvKnhf3gSQhaFF5/
	Lgf6WyfR8ePuR4bQ0l/HqmstPHk/X43oqCgIO2V0SCMJcfK80UygmnzxhPieo/Iy4iE+W9HqSECjE
	So83kJ3fAJPoWEvr5++nJ1toFp9KikZu61FXlYfJ9MSTUChX7DwC73Izw2A3HtuzOyCYGFkDkOy/B
	qihcdW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVbmf-00000005n4z-3Y6f;
	Tue, 16 Dec 2025 20:36:37 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVbmd-00000005n3o-17Em
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 20:36:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6495c4577adso7045328a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 12:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765917393; x=1766522193; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gv3fR1f0d4J7Wx8tPpx3i+Ybrysql766wrV4wqRgUXM=;
        b=IJggBz39k4VPM1tUBKw2LtO7cVmrBXdLzz/9WY81xE/O5d67nI/WhwYsD+abM8hy8c
         eXamFanU1G3UIiHRljOu8R/95UsYK+6CcOGwI4B2YU6NHJ7Qmv3iB7JvpKO1HVj3aATz
         ClX7903W1Qp/q2Nf0Q1JOn47nLnwDmHwN4T4+8w5P1UozyHIMgwfme71L6PbEWdZsz/G
         B2KwVRSJep4Q82G4Qf7Yjg3DwSCFMsXSFAkKmf0+K5uy/n/BOcuCPbKv7Ez2/609Icsp
         fa23GbY4Pk5ptXliE21YLKmZqjXV5m+USVKw+w9BCR8Bqm8Y0OkLJGmeu3QSu3okS2Ne
         jvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765917393; x=1766522193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gv3fR1f0d4J7Wx8tPpx3i+Ybrysql766wrV4wqRgUXM=;
        b=qSh7ye/0qh2z4O+v7YSsVTtAxIN3DzwFAVpJvItTvRucfCi8CVJpc5Dh89k3wBduFS
         amjYJyPuER/TTo2ZuKi3ZFMigdIcTET3x4q//PO6ManQLXbjLs5Eh32mQHNyp9FH16vj
         DeB7xNlkA/YRvATMyPhD5jig7VjEXETsf243wJ5SLXHCSOdMLDTPrsVJmHn9Mhk9ht7l
         pncXm0rnkNm5lT+OKYMNedEKCX+DEDKjDo8v1T7SQ5urXr/0/3Y6XrK6fNHaW90IHHwj
         rwnWhx9s00jru1XTjKhjhcE3LedDC6h8yzB0jYF/kr7khBBpcEr900Qak6oDyybTOOc2
         Vnhg==
X-Forwarded-Encrypted: i=1; AJvYcCVm1oVHYEVObSybI6x7Qrg/dTM9ThOGbYO2HNjiyIeF7rDr7huPfXc8p6jQNtVmaq8ZURUdjIuXEsF6CkfWL3/L@lists.infradead.org
X-Gm-Message-State: AOJu0YzKdiT/1yvxveRKt9oCqwB3C11UwfFhl8qhH6sov99UbV57smI7
	XrdThPhQIE8QYbUKVRvQlRhN4w0nIJX+05ah6mp+xDUp+kNHlwwVYjiSpFK6CA8nOEinkhAQEPh
	ddiuXLnjoe3WNkCAczyEziIyltrWtET+/UwUg3eJsaw==
X-Gm-Gg: AY/fxX5QpAIheb3YOsvJ9ng26ppYyw9pO2CIuRn6EF2GAMdoUleTEyQ0RBZP91aCEOL
	y2zu1zpYEciYOHJ1PsCH+q8P2ZAU85gvZn8kY+L6G+jWNV9WrDgKqkCdN9a9dCKDdA892DC0CHF
	QYX5oclSuFj43EMHd80oUhJSTOPX8KNvzEnhsbuID+j5w3qOvRZBxEschmk1Sbh/1Jf7vzNY1P9
	p2q/GSHdN06mcfsCMgZBVQU7Hwi5tqGtEuVKZcyyk6o1FU1Yfv6AMI4CeYuJCe3A4C82DP1D3b1
	1RRA4t+rQ9emU+8/HVHKIcBgjKU=
X-Google-Smtp-Source: AGHT+IExU87DSA2S8FSy599HClbXmZSv9EyKVLPHHplD5eT/zCPtN3v7yL9S8zyn9eTla/ftNmU4AxeJdv6gSgRVcTE=
X-Received: by 2002:a05:6402:3549:b0:649:9260:1031 with SMTP id
 4fb4d7f45d1cf-6499b2fab64mr14180164a12.32.1765917393067; Tue, 16 Dec 2025
 12:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20251105082639.342973-1-cleger@rivosinc.com> <20251105082639.342973-5-cleger@rivosinc.com>
 <CAEEQ3wnQiUdNVjUpdDgAx1=y76vSo66vCD0Wf3EGes274jnkxw@mail.gmail.com>
In-Reply-To: <CAEEQ3wnQiUdNVjUpdDgAx1=y76vSo66vCD0Wf3EGes274jnkxw@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Date: Tue, 16 Dec 2025 21:36:21 +0100
X-Gm-Features: AQt7F2oJjudh2yUHpteIzwQ-QrinFlTlFBTNMiuLYLvYre9WM5CdGCJaEQiOqa0
Message-ID: <CADGDLFgnx3z9WMZBjURx7eEFeeDwb9tj+8WAik4siR_G8erk0Q@mail.gmail.com>
Subject: Re: [External] [PATCH v8 4/5] perf: RISC-V: add support for SSE event
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Xu Lu <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_123635_365744_DBE81F59 
X-CRM114-Status: GOOD (  34.36  )
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

On Fri, Dec 12, 2025 at 4:17=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.com=
> wrote:
>
> Hi Cl=C3=A9ment,
>
> On Wed, Nov 5, 2025 at 4:29=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@ri=
vosinc.com> wrote:
> >
> > In order to use SSE within PMU drivers, register a SSE handler for the
> > local PMU event. Reuse the existing overflow IRQ handler and pass
> > appropriate pt_regs. Add a config option RISCV_PMU_SSE to select event
> > delivery via SSE events.
> >
> > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> > ---
> >  drivers/perf/Kconfig           | 10 +++++
> >  drivers/perf/riscv_pmu.c       | 23 +++++++++++
> >  drivers/perf/riscv_pmu_sbi.c   | 71 +++++++++++++++++++++++++++++-----
> >  include/linux/perf/riscv_pmu.h |  5 +++
> >  4 files changed, 99 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> > index 638321fc9800..d6ffc2b036e5 100644
> > --- a/drivers/perf/Kconfig
> > +++ b/drivers/perf/Kconfig
> > @@ -105,6 +105,16 @@ config RISCV_PMU_SBI
> >           full perf feature support i.e. counter overflow, privilege mo=
de
> >           filtering, counter configuration.
> >
> > +config RISCV_PMU_SBI_SSE
> > +       depends on RISCV_PMU && RISCV_SBI_SSE
> > +       bool "RISC-V PMU SSE events"
> > +       default n
> > +       help
> > +         Say y if you want to use SSE events to deliver PMU interrupts=
. This
> > +         provides a way to profile the kernel at any level by using NM=
I-like
> > +         SSE events. SSE events being really intrusive, this option al=
lows
> > +         to select it only if needed.
> > +
> >  config STARFIVE_STARLINK_PMU
> >         depends on ARCH_STARFIVE || COMPILE_TEST
> >         depends on 64BIT
> > diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> > index 7644147d50b4..dda2814801c0 100644
> > --- a/drivers/perf/riscv_pmu.c
> > +++ b/drivers/perf/riscv_pmu.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/irqdesc.h>
> >  #include <linux/perf/riscv_pmu.h>
> >  #include <linux/printk.h>
> > +#include <linux/riscv_sbi_sse.h>
> >  #include <linux/smp.h>
> >  #include <linux/sched_clock.h>
> >
> > @@ -254,6 +255,24 @@ void riscv_pmu_start(struct perf_event *event, int=
 flags)
> >         perf_event_update_userpage(event);
> >  }
> >
> > +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> > +static void riscv_pmu_disable(struct pmu *pmu)
> > +{
> > +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(pmu);
> > +
> > +       if (rvpmu->sse_evt)
> > +               sse_event_disable_local(rvpmu->sse_evt);
> > +}
> > +
> > +static void riscv_pmu_enable(struct pmu *pmu)
> > +{
> > +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(pmu);
> > +
> > +       if (rvpmu->sse_evt)
> > +               sse_event_enable_local(rvpmu->sse_evt);
> > +}
> > +#endif
> > +
> >  static int riscv_pmu_add(struct perf_event *event, int flags)
> >  {
> >         struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
> > @@ -411,6 +430,10 @@ struct riscv_pmu *riscv_pmu_alloc(void)
> >                 .event_mapped   =3D riscv_pmu_event_mapped,
> >                 .event_unmapped =3D riscv_pmu_event_unmapped,
> >                 .event_idx      =3D riscv_pmu_event_idx,
> > +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> > +               .pmu_enable     =3D riscv_pmu_enable,
> > +               .pmu_disable    =3D riscv_pmu_disable,
> > +#endif
> >                 .add            =3D riscv_pmu_add,
> >                 .del            =3D riscv_pmu_del,
> >                 .start          =3D riscv_pmu_start,
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.=
c
> > index e255c1b069ec..c852f64a5022 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/irqdomain.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/of.h>
> > +#include <linux/riscv_sbi_sse.h>
> >  #include <linux/cpu_pm.h>
> >  #include <linux/sched/clock.h>
> >  #include <linux/soc/andes/irq.h>
> > @@ -1038,10 +1039,10 @@ static void pmu_sbi_start_overflow_mask(struct =
riscv_pmu *pmu,
> >                 pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
> >  }
> >
> > -static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
> > +static irqreturn_t pmu_sbi_ovf_handler(struct cpu_hw_events *cpu_hw_ev=
t,
> > +                                      struct pt_regs *regs, bool from_=
sse)
> >  {
> >         struct perf_sample_data data;
> > -       struct pt_regs *regs;
> >         struct hw_perf_event *hw_evt;
> >         union sbi_pmu_ctr_info *info;
> >         int lidx, hidx, fidx;
> > @@ -1049,7 +1050,6 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, v=
oid *dev)
> >         struct perf_event *event;
> >         u64 overflow;
> >         u64 overflowed_ctrs =3D 0;
> > -       struct cpu_hw_events *cpu_hw_evt =3D dev;
> >         u64 start_clock =3D sched_clock();
> >         struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_=
addr;
> >
> > @@ -1059,13 +1059,15 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq,=
 void *dev)
> >         /* Firmware counter don't support overflow yet */
> >         fidx =3D find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COU=
NTERS);
> >         if (fidx =3D=3D RISCV_MAX_COUNTERS) {
> > -               csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
> > +               if (!from_sse)
> > +                       csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
> >                 return IRQ_NONE;
> >         }
> >
> >         event =3D cpu_hw_evt->events[fidx];
> >         if (!event) {
> > -               ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> > +               if (!from_sse)
> > +                       ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mas=
k);
> >                 return IRQ_NONE;
> >         }
> >
> > @@ -1080,16 +1082,16 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq,=
 void *dev)
> >
> >         /*
> >          * Overflow interrupt pending bit should only be cleared after =
stopping
> > -        * all the counters to avoid any race condition.
> > +        * all the counters to avoid any race condition. When using SSE=
,
> > +        * interrupt is cleared when stopping counters.
> >          */
> > -       ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> > +       if (!from_sse)
> > +               ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> >
> >         /* No overflow bit is set */
> >         if (!overflow)
> >                 return IRQ_NONE;
> >
> > -       regs =3D get_irq_regs();
> > -
> >         for_each_set_bit(lidx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUN=
TERS) {
> >                 struct perf_event *event =3D cpu_hw_evt->events[lidx];
> >
> > @@ -1145,6 +1147,51 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, =
void *dev)
> >         return IRQ_HANDLED;
> >  }
> >
> > +static irqreturn_t pmu_sbi_ovf_irq_handler(int irq, void *dev)
> > +{
> > +       return pmu_sbi_ovf_handler(dev, get_irq_regs(), false);
> > +}
> > +
> > +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> > +static int pmu_sbi_ovf_sse_handler(u32 evt, void *arg, struct pt_regs =
*regs)
> > +{
> > +       struct cpu_hw_events __percpu *hw_events =3D arg;
> > +       struct cpu_hw_events *hw_event =3D raw_cpu_ptr(hw_events);
> > +
> > +       pmu_sbi_ovf_handler(hw_event, regs, true);
> > +
> > +       return 0;
> > +}
> > +
> > +static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
> > +{
> > +       int ret;
> > +       struct sse_event *evt;
> > +       struct cpu_hw_events __percpu *hw_events =3D pmu->hw_events;
> > +
> > +       evt =3D sse_event_register(SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, 0,
> > +                                pmu_sbi_ovf_sse_handler, hw_events);
>
> As Radim suggested, we had better preset a priority for different
> events, such as these events and future ones:
> SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS
> SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP
> SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS
> SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW
> SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS
> SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS
> SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED
> SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI
> SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED

Hey Yunhui,

What do you mean exactly ? Events have default priority based on their
ID. However, the register call will set a priority =3D 0 for the event.
I'll modify that to allow using an optional priority (or even remove
it)

Thanks,

Cl=C3=A9ment

>
> Could you please help add a "global priority enum"?
>
>
> > +       if (IS_ERR(evt))
> > +               return PTR_ERR(evt);
> > +
> > +       ret =3D sse_event_enable(evt);
> > +       if (ret) {
> > +               sse_event_unregister(evt);
> > +               return ret;
> > +       }
> > +
> > +       pr_info("using SSE for PMU event delivery\n");
> > +       pmu->sse_evt =3D evt;
> > +
> > +       return ret;
> > +}
> > +#else
> > +static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
> > +{
> > +       return -EOPNOTSUPP;
> > +}
> > +#endif
> > +
> >  static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *n=
ode)
> >  {
> >         struct riscv_pmu *pmu =3D hlist_entry_safe(node, struct riscv_p=
mu, node);
> > @@ -1195,6 +1242,10 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *=
pmu, struct platform_device *pde
> >         struct cpu_hw_events __percpu *hw_events =3D pmu->hw_events;
> >         struct irq_domain *domain =3D NULL;
> >
> > +       ret =3D pmu_sbi_setup_sse(pmu);
> > +       if (!ret)
> > +               return 0;
> > +
> >         if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> >                 riscv_pmu_irq_num =3D RV_IRQ_PMU;
> >                 riscv_pmu_use_irq =3D true;
> > @@ -1229,7 +1280,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *p=
mu, struct platform_device *pde
> >                 return -ENODEV;
> >         }
> >
> > -       ret =3D request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler, =
"riscv-pmu", hw_events);
> > +       ret =3D request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_irq_handl=
er, "riscv-pmu", hw_events);
> >         if (ret) {
> >                 pr_err("registering percpu irq failed [%d]\n", ret);
> >                 return ret;
> > diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_=
pmu.h
> > index f82a28040594..08fdcf6baf4e 100644
> > --- a/include/linux/perf/riscv_pmu.h
> > +++ b/include/linux/perf/riscv_pmu.h
> > @@ -28,6 +28,8 @@
> >
> >  #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
> >
> > +struct sse_event;
> > +
> >  struct cpu_hw_events {
> >         /* currently enabled events */
> >         int                     n_events;
> > @@ -54,6 +56,9 @@ struct riscv_pmu {
> >         char            *name;
> >
> >         irqreturn_t     (*handle_irq)(int irq_num, void *dev);
> > +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> > +       struct sse_event *sse_evt;
> > +#endif
> >
> >         unsigned long   cmask;
> >         u64             (*ctr_read)(struct perf_event *event);
> > --
> > 2.43.0
> >
>
> Thanks,
> Yunhui

