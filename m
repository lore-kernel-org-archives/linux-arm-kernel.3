Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D71D43367
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 03:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFCMous93nLh4gEsAS4I1okVc7N85Pzly0hG2aWBuUM=; b=qg8YVUfFDjBjMEOwzlP7lv2Y0l
	tNqud0d6Y6SzXBbWVMj08YCkY2zza7nVMBhJwl9/jLVx0CcfJ6hdk8BjIDmfDkrTXap7bWDSP5P+l
	vjA1oYURLdtdo+ptvIc8IFdcETxd4/Ct7K9jsv5wcZABPXj6Ufc00FoL2l0EMy++NX52NzkjV893k
	221kmfDwng9XV3yNEM6PX1XMC2gJrA9q3i72cG4og6un5mYeFDKXCwvz+gS6gYzIxS52wIYccy9Hl
	wP23JcganvxP6Nm7VBiHsQ/OdL2J559yyRVuiHXVsRasoa6zJtnNLsa2yVv1nhj6dP67uGkCRa6OB
	E85KdW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTted-000000000KK-0KsR;
	Fri, 12 Dec 2025 03:17:15 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTteZ-000000000JJ-1xkZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 03:17:12 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-3ec6c10a295so342049fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 19:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765509430; x=1766114230; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFCMous93nLh4gEsAS4I1okVc7N85Pzly0hG2aWBuUM=;
        b=A47kFbZDXx1SJ2Hn72mQxAhdRpiMHnWZaFGYHQWocKdQqISi7NJuCDFCkOL7d8640/
         s48bttA43iuKCzqzDXW2Tocm/rflWOaFig7BYUrn/CZgqbUOr+Sd+Ko1p+95PQ4HUVhy
         yUcZ6Fx3M/aOLfrkEH1wZ4P+M5UfLg5YWMlETtFtJiPXfrx6Yekv8F0SA2yzabRUCZoZ
         v6HIo97xUc4PJw1hA5xBrg8S0pEYrgdcsC9/8vsVk3RKilkkQ4JScSmZpfqtVPvix4IJ
         w0nqAw80TOnNKNq1cNAUS0TZMJJ+lcn6pm1GaXdSrCUPZuO6wqGA5zNX0uqPHudjkEXp
         hY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765509430; x=1766114230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AFCMous93nLh4gEsAS4I1okVc7N85Pzly0hG2aWBuUM=;
        b=hQnDUWnQlYKnLm0T3DJtoH1RwTUvJa93d+68MjVBzwnNWRHeYSGSuqqGRnN8kt8IhR
         x6XysZm/DHsjzl2ix+1CMectK91gGHSVqunDaT9m58EW6vzHAxUpWZ/QmOeCG2RGJzSA
         9cUaUYRJ59EcflHhrzUggdBk0SYmjPxjRYvNBvTdyaKwMee7E3AdAyqujLMwco0vRA+/
         I7kJBJ59hHoy50/8ZUX4smU7PtRj9GavTLiPH4mluXegHobeFP/MWZHIyPWxw43s48pT
         PajMAFkX8dLZOe+XGyGCymfi5iQZbcAbs5xhMNEd6LLQWPLzXOUO16lbNTuPgN/RAnzP
         7Tng==
X-Forwarded-Encrypted: i=1; AJvYcCXImvnX7LW3qFyCsc774sqlm1MhbgD7bBhl9K2yVaKHyrZ/HhxhnmQs2IoYuJ5H1Z9p3KgvriakrVUIPQGnBUcO@lists.infradead.org
X-Gm-Message-State: AOJu0YwIlNsJOHVmsUX9PMzDdNO67NThX8Chi1CLvz+GcYz2zlFimBYQ
	trueSrmfYuVdV70slMz5683+0zGyFn2zTtWirwYOdIiE6ycN/nk+dmabppXk28s45x89XENJwHC
	CQYC4HfSrIub4UHy94UMVHqcm4cg/5Hfwlps3YlFRNg==
X-Gm-Gg: AY/fxX6c7bJAPeaiJ4kfeUtCOBv0E3GBAtLRFqOCxffqtEa7t/XasmB87daaOku6NO0
	RIE0K9MLmlWDXqHF6+sn9NTR3p4NsCJ6oVJUlexGBKnFutd73SR0CbSECqPgtYDDqVlHzrxkJCu
	hJc3ySa4wPrwIe431Sr4of0PANOFvbkYlZEgvI66MV8g1kQs4o5lrZ7HFNpUtZE8J/qwwCNDCy2
	mQZmY92BJUVs478H42stqpR4uhiCpq7OkpEOa7luoP1SQEHprz6ynYynlWx4uW7vVc5blGzHatp
	jtSFqnWfstPQ
X-Google-Smtp-Source: AGHT+IHGtJaz5VDo1oo+bpA05dEQIX9XHhxaCr8iXqpFeJg4ncLuuubWQ5MHZ6YJq2Zg5+eW/p2b3gJ8xTegd8Pmpf8=
X-Received: by 2002:a05:6820:4df9:b0:659:9a49:90d0 with SMTP id
 006d021491bc7-65b45219e83mr289306eaf.79.1765509429851; Thu, 11 Dec 2025
 19:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20251105082639.342973-1-cleger@rivosinc.com> <20251105082639.342973-5-cleger@rivosinc.com>
In-Reply-To: <20251105082639.342973-5-cleger@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 12 Dec 2025 11:16:57 +0800
X-Gm-Features: AQt7F2o4LwDRpr_6YooTQUX51t7LTV9-GFvWynO77XGw-yekaAynOUgXbOiT9Mo
Message-ID: <CAEEQ3wnQiUdNVjUpdDgAx1=y76vSo66vCD0Wf3EGes274jnkxw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251211_191711_517216_426A4194 
X-CRM114-Status: GOOD (  28.56  )
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

On Wed, Nov 5, 2025 at 4:29=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@rivo=
sinc.com> wrote:
>
> In order to use SSE within PMU drivers, register a SSE handler for the
> local PMU event. Reuse the existing overflow IRQ handler and pass
> appropriate pt_regs. Add a config option RISCV_PMU_SSE to select event
> delivery via SSE events.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> ---
>  drivers/perf/Kconfig           | 10 +++++
>  drivers/perf/riscv_pmu.c       | 23 +++++++++++
>  drivers/perf/riscv_pmu_sbi.c   | 71 +++++++++++++++++++++++++++++-----
>  include/linux/perf/riscv_pmu.h |  5 +++
>  4 files changed, 99 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 638321fc9800..d6ffc2b036e5 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -105,6 +105,16 @@ config RISCV_PMU_SBI
>           full perf feature support i.e. counter overflow, privilege mode
>           filtering, counter configuration.
>
> +config RISCV_PMU_SBI_SSE
> +       depends on RISCV_PMU && RISCV_SBI_SSE
> +       bool "RISC-V PMU SSE events"
> +       default n
> +       help
> +         Say y if you want to use SSE events to deliver PMU interrupts. =
This
> +         provides a way to profile the kernel at any level by using NMI-=
like
> +         SSE events. SSE events being really intrusive, this option allo=
ws
> +         to select it only if needed.
> +
>  config STARFIVE_STARLINK_PMU
>         depends on ARCH_STARFIVE || COMPILE_TEST
>         depends on 64BIT
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index 7644147d50b4..dda2814801c0 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -13,6 +13,7 @@
>  #include <linux/irqdesc.h>
>  #include <linux/perf/riscv_pmu.h>
>  #include <linux/printk.h>
> +#include <linux/riscv_sbi_sse.h>
>  #include <linux/smp.h>
>  #include <linux/sched_clock.h>
>
> @@ -254,6 +255,24 @@ void riscv_pmu_start(struct perf_event *event, int f=
lags)
>         perf_event_update_userpage(event);
>  }
>
> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +static void riscv_pmu_disable(struct pmu *pmu)
> +{
> +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(pmu);
> +
> +       if (rvpmu->sse_evt)
> +               sse_event_disable_local(rvpmu->sse_evt);
> +}
> +
> +static void riscv_pmu_enable(struct pmu *pmu)
> +{
> +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(pmu);
> +
> +       if (rvpmu->sse_evt)
> +               sse_event_enable_local(rvpmu->sse_evt);
> +}
> +#endif
> +
>  static int riscv_pmu_add(struct perf_event *event, int flags)
>  {
>         struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
> @@ -411,6 +430,10 @@ struct riscv_pmu *riscv_pmu_alloc(void)
>                 .event_mapped   =3D riscv_pmu_event_mapped,
>                 .event_unmapped =3D riscv_pmu_event_unmapped,
>                 .event_idx      =3D riscv_pmu_event_idx,
> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +               .pmu_enable     =3D riscv_pmu_enable,
> +               .pmu_disable    =3D riscv_pmu_disable,
> +#endif
>                 .add            =3D riscv_pmu_add,
>                 .del            =3D riscv_pmu_del,
>                 .start          =3D riscv_pmu_start,
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index e255c1b069ec..c852f64a5022 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -17,6 +17,7 @@
>  #include <linux/irqdomain.h>
>  #include <linux/of_irq.h>
>  #include <linux/of.h>
> +#include <linux/riscv_sbi_sse.h>
>  #include <linux/cpu_pm.h>
>  #include <linux/sched/clock.h>
>  #include <linux/soc/andes/irq.h>
> @@ -1038,10 +1039,10 @@ static void pmu_sbi_start_overflow_mask(struct ri=
scv_pmu *pmu,
>                 pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
>  }
>
> -static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
> +static irqreturn_t pmu_sbi_ovf_handler(struct cpu_hw_events *cpu_hw_evt,
> +                                      struct pt_regs *regs, bool from_ss=
e)
>  {
>         struct perf_sample_data data;
> -       struct pt_regs *regs;
>         struct hw_perf_event *hw_evt;
>         union sbi_pmu_ctr_info *info;
>         int lidx, hidx, fidx;
> @@ -1049,7 +1050,6 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, voi=
d *dev)
>         struct perf_event *event;
>         u64 overflow;
>         u64 overflowed_ctrs =3D 0;
> -       struct cpu_hw_events *cpu_hw_evt =3D dev;
>         u64 start_clock =3D sched_clock();
>         struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_ad=
dr;
>
> @@ -1059,13 +1059,15 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, v=
oid *dev)
>         /* Firmware counter don't support overflow yet */
>         fidx =3D find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNT=
ERS);
>         if (fidx =3D=3D RISCV_MAX_COUNTERS) {
> -               csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
> +               if (!from_sse)
> +                       csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
>                 return IRQ_NONE;
>         }
>
>         event =3D cpu_hw_evt->events[fidx];
>         if (!event) {
> -               ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> +               if (!from_sse)
> +                       ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask)=
;
>                 return IRQ_NONE;
>         }
>
> @@ -1080,16 +1082,16 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, v=
oid *dev)
>
>         /*
>          * Overflow interrupt pending bit should only be cleared after st=
opping
> -        * all the counters to avoid any race condition.
> +        * all the counters to avoid any race condition. When using SSE,
> +        * interrupt is cleared when stopping counters.
>          */
> -       ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> +       if (!from_sse)
> +               ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
>
>         /* No overflow bit is set */
>         if (!overflow)
>                 return IRQ_NONE;
>
> -       regs =3D get_irq_regs();
> -
>         for_each_set_bit(lidx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTE=
RS) {
>                 struct perf_event *event =3D cpu_hw_evt->events[lidx];
>
> @@ -1145,6 +1147,51 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, vo=
id *dev)
>         return IRQ_HANDLED;
>  }
>
> +static irqreturn_t pmu_sbi_ovf_irq_handler(int irq, void *dev)
> +{
> +       return pmu_sbi_ovf_handler(dev, get_irq_regs(), false);
> +}
> +
> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +static int pmu_sbi_ovf_sse_handler(u32 evt, void *arg, struct pt_regs *r=
egs)
> +{
> +       struct cpu_hw_events __percpu *hw_events =3D arg;
> +       struct cpu_hw_events *hw_event =3D raw_cpu_ptr(hw_events);
> +
> +       pmu_sbi_ovf_handler(hw_event, regs, true);
> +
> +       return 0;
> +}
> +
> +static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
> +{
> +       int ret;
> +       struct sse_event *evt;
> +       struct cpu_hw_events __percpu *hw_events =3D pmu->hw_events;
> +
> +       evt =3D sse_event_register(SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, 0,
> +                                pmu_sbi_ovf_sse_handler, hw_events);

As Radim suggested, we had better preset a priority for different
events, such as these events and future ones:
SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS
SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP
SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS
SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW
SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS
SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS
SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED
SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI
SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED

Could you please help add a "global priority enum"?


> +       if (IS_ERR(evt))
> +               return PTR_ERR(evt);
> +
> +       ret =3D sse_event_enable(evt);
> +       if (ret) {
> +               sse_event_unregister(evt);
> +               return ret;
> +       }
> +
> +       pr_info("using SSE for PMU event delivery\n");
> +       pmu->sse_evt =3D evt;
> +
> +       return ret;
> +}
> +#else
> +static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
> +{
> +       return -EOPNOTSUPP;
> +}
> +#endif
> +
>  static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *nod=
e)
>  {
>         struct riscv_pmu *pmu =3D hlist_entry_safe(node, struct riscv_pmu=
, node);
> @@ -1195,6 +1242,10 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pm=
u, struct platform_device *pde
>         struct cpu_hw_events __percpu *hw_events =3D pmu->hw_events;
>         struct irq_domain *domain =3D NULL;
>
> +       ret =3D pmu_sbi_setup_sse(pmu);
> +       if (!ret)
> +               return 0;
> +
>         if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
>                 riscv_pmu_irq_num =3D RV_IRQ_PMU;
>                 riscv_pmu_use_irq =3D true;
> @@ -1229,7 +1280,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu=
, struct platform_device *pde
>                 return -ENODEV;
>         }
>
> -       ret =3D request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler, "r=
iscv-pmu", hw_events);
> +       ret =3D request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_irq_handler=
, "riscv-pmu", hw_events);
>         if (ret) {
>                 pr_err("registering percpu irq failed [%d]\n", ret);
>                 return ret;
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pm=
u.h
> index f82a28040594..08fdcf6baf4e 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -28,6 +28,8 @@
>
>  #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
>
> +struct sse_event;
> +
>  struct cpu_hw_events {
>         /* currently enabled events */
>         int                     n_events;
> @@ -54,6 +56,9 @@ struct riscv_pmu {
>         char            *name;
>
>         irqreturn_t     (*handle_irq)(int irq_num, void *dev);
> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +       struct sse_event *sse_evt;
> +#endif
>
>         unsigned long   cmask;
>         u64             (*ctr_read)(struct perf_event *event);
> --
> 2.43.0
>

Thanks,
Yunhui

