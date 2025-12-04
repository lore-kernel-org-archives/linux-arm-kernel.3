Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C46D1CDCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 03:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okWEC/iPxwHapBCL3ZZGyYvTBzssGUbkrGoBgDrV58Y=; b=jNRXnrVqsRLH2i1RBFVx/BTv1i
	FQg1tprbGb51N1z9mV/9m+rL2OFcvFXaQ70uzHkxYSUPkvNcGrDbKaI5QxND18gMfIYawEDAWWbni
	DjpeZoLqAfB1xLp/K7Z1S8e59xXDRNuJOWrPx1u7ITTQGKneV3t1tlfKQucwvjkRzEuJKrTtSnvmF
	/q+PIH3021Hp7iq18eEceOVYgmRex3lnIPrpnq7wApkvHPcksl8QPy7WicJILt3B5eJ5x5ID+hSLx
	D3B73wsRBNBAm3SdxN+UO5f7G+vdr4hH0uqAl2w4b3SnlXsdpwuWKAufwcA2dfFpk3dvse+BpWupr
	J5clRyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0Su-00000007QL5-1ocu;
	Thu, 04 Dec 2025 03:57:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0Sq-00000007QKH-0IOm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 03:57:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42e2e671521so327739f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 19:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764820625; x=1765425425; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=okWEC/iPxwHapBCL3ZZGyYvTBzssGUbkrGoBgDrV58Y=;
        b=mcW5tCtDeKYXs/fxYLiIfTaLHyJvGqfGl6cVRmAGc68+pibJYropGnoN2r4BUxW1bA
         olUzgBrnd+JgnEQHr8Hy8DmNqzfWfoXTJ4ShwKI7DkGhMGCdKPPqNwjMBcBBMWmNtefN
         oyamhCqs/abckoi+JNz4bVEAC1TJoafNemmOCXl2O7HXIcpbEdeQw7IF0LsO3pUnV0ds
         cZgo6TVPrqXkfRlc9p2ZYc/XDomYkbbp5eRcTbK6hSbGlcGLXH9WHnjEBSEfUo2CZEm1
         TRz1jnswp1c1ofNsORhKyz9AYin9Q/KAOmwUMHTqDKnAj8wlFMzp/86HP5kEirKRFvdq
         pspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764820625; x=1765425425;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okWEC/iPxwHapBCL3ZZGyYvTBzssGUbkrGoBgDrV58Y=;
        b=WUWxyyVVTEQznMFanvxXcRSG3XjQ9x1yuqL5VjFHAccFg2WDlHYpHtUw5/ZBlUjK3s
         YRRep9PLgIguaiU7tFHOXD1X3HphSxyGgq9haDtWDq8B86aJnGEBkkzmMCKa6xDZADCf
         Fx2BIdzINX9WYcfWKAbmroBnZ5T9xHQRLLlkOJ3azDkYCvIYzX5Hd3X6qRErhayu3PJn
         J+9bAf6R/WZiDM6isuD5TQ9hqRjgAPO3NSaidUsBkEvLTkbLHqgFSUlD6MNc/WWY7Kg6
         BXDLX/FLuImlnfzNg9vd4N3/z6AYH9NMkrpLYCgQE2ReSWQgJR9C+spf3McmRg5Q2l3T
         oSbw==
X-Forwarded-Encrypted: i=1; AJvYcCX5NHwt9svkrHrPrc46PwFwQSqz2Xaw8uHIYIeRuIIxhSCSVgaHZ4iGlUWc9k6gAtcxkEQec7mhr0OZlBFHjJ13@lists.infradead.org
X-Gm-Message-State: AOJu0YyCBUJudXxpLQOojk2JeuV4fRvaqD5SixzHYHDKKUxM8lozqCxE
	puByaFJkUaKAZgre/FA6Ao3cByUOJXxwht7qkFikS2fwsd7EiCNBpiRC4radnBjb8K/y3jZny8k
	WCOC55PY295zASqCtVo7XtbKQ59RGVOMHGI8xvzC9EA==
X-Gm-Gg: ASbGnct5Xaq8f2snfO5KjSIdsu09pomcMfOBolEgMDNQELlZc/dDQP4isjF6DciaJUO
	+fmfuw1H1U+8NI3H1FsP6qGkJjRp4IrxFLamg9Dl+g+pAUvkJCRPn735Pfi7bY+m9NA6Bk0vTvA
	pf2DNftOrrJcyvA075lYf8JLVDqjuwts+4o+WU7Au591I7NjZNqT2xGbglgwhw1LT8QQrwtyR3T
	qzpj507zHXPL9l7WPnfReR5f49eT9H4TjR/W9BRvEQ+IWt+wthnjMhUpXezrqxUSBFNbqIZDQ==
X-Google-Smtp-Source: AGHT+IEY7s+3eyCqfIKSZqMakE7dNGsLTPhL1IL5G66m9i8O6D+WqBplrxA/nvb3Sc8t+ks/VUJVjaMiah5FHZONyPw=
X-Received: by 2002:a05:6000:4212:b0:42b:3dfb:645f with SMTP id
 ffacd0b85a97d-42f79858038mr1000158f8f.47.1764820624734; Wed, 03 Dec 2025
 19:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
 <20250523-b4-ctr_upstream_v3-v3-6-ad355304ba1c@rivosinc.com> <CAPqJEFr=3Re=L0CmEpCRHxovB74MDB9C8neNMfouYvWWbR0hyw@mail.gmail.com>
In-Reply-To: <CAPqJEFr=3Re=L0CmEpCRHxovB74MDB9C8neNMfouYvWWbR0hyw@mail.gmail.com>
From: Jimmy Ho <jimmy.ho@sifive.com>
Date: Thu, 4 Dec 2025 11:56:53 +0800
X-Gm-Features: AWmQ_blU2yYn2rCdC2QKjaMEY5Jg5LSw32Q3EJYwEkvkceud3D2wmUV5r3WnXKM
Message-ID: <CAJh9TSJk0nZvqJrvTe5ENMpAB=56--+CFai0tXQnYFakKxQxQw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] riscv: pmu: Integrate CTR Ext support in
 riscv_pmu_dev driver
To: "To: Peter Zijlstra" <peterz@infradead.org>, mingo@redhat.com, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, adrian.hunter@intel.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
	Alexandre Ghiti <alex@ghiti.fr>, Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
	Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Beeman Strong <beeman@rivosinc.com>, 
	"Cc:" <linux-perf-users@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	palmer@sifive.com, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_195708_176699_A8276A04 
X-CRM114-Status: GOOD (  30.20  )
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

Hi Rajnesh,

> This integrates recently added CTR ext support in riscv_pmu_dev driver
> to enable branch stack sampling using PMU events.
>
> This mainly adds CTR enable/disable callbacks in rvpmu_ctr_stop()
> and rvpmu_ctr_start() function to start/stop branch recording along
> with the event.
>
> PMU overflow handler rvpmu_ovf_handler() is also updated to sample
> CTR entries in case of the overflow for the particular event programmed
> to records branches. The recorded entries are fed to core perf for
> further processing.
>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_common.c |  3 +-
>  drivers/perf/riscv_pmu_dev.c    | 67 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 67 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_common.c b/drivers/perf/riscv_pmu_common.c
> index b2dc78cbbb93926964f81f30be9ef4a1c02501df..0b032b8d8762e77d2b553643b0f9064e7c789cfe
> 100644
> --- a/drivers/perf/riscv_pmu_common.c
> +++ b/drivers/perf/riscv_pmu_common.c
> @@ -329,8 +329,7 @@ static int riscv_pmu_event_init(struct perf_event *event)
>         u64 event_config = 0;
>         uint64_t cmask;
>
> -       /* driver does not support branch stack sampling */
> -       if (has_branch_stack(event))
> +       if (needs_branch_stack(event) && !riscv_pmu_ctr_supported(rvpmu))
>                 return -EOPNOTSUPP;
>
>         hwc->flags = 0;
> diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
> index 95e6dd272db69f53b679e5fc3450785e45d5e8b9..b0c616fb939fcc61f7493877a8801916069f16f7
> 100644
> --- a/drivers/perf/riscv_pmu_dev.c
> +++ b/drivers/perf/riscv_pmu_dev.c
> @@ -1038,7 +1038,7 @@ static void rvpmu_sbi_ctr_stop(struct perf_event
> *event, unsigned long flag)
>  static void pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
>                            bool sched_in)
>  {
> -       /* Call CTR specific Sched hook. */
> +       riscv_pmu_ctr_sched_task(pmu_ctx, sched_in);
>  }
>
>  static int rvpmu_sbi_find_num_ctrs(void)
> @@ -1370,6 +1370,13 @@ static irqreturn_t rvpmu_ovf_handler(int irq, void *dev)
>                 hw_evt->state |= PERF_HES_UPTODATE;
>                 perf_sample_data_init(&data, 0, hw_evt->last_period);
>                 if (riscv_pmu_event_set_period(event)) {
> +                       if (needs_branch_stack(event)) {
> +                               riscv_pmu_ctr_consume(cpu_hw_evt, event);
> +                               perf_sample_save_brstack(
> +                                       &data, event,
> +
> &cpu_hw_evt->branches->branch_stack, NULL);
> +                       }
> +
>                         /*
>                          * Unlike other ISAs, RISC-V don't have to
> disable interrupts
>                          * to avoid throttling here. As per the
> specification, the
> @@ -1569,16 +1576,23 @@ static int rvpmu_deleg_ctr_get_idx(struct
> perf_event *event)
>
>  static void rvpmu_ctr_add(struct perf_event *event, int flags)
>  {
> +       if (needs_branch_stack(event))
> +               riscv_pmu_ctr_add(event);
>  }
>
>  static void rvpmu_ctr_del(struct perf_event *event, int flags)
>  {
> +       if (needs_branch_stack(event))
> +               riscv_pmu_ctr_del(event);
>  }
>
>  static void rvpmu_ctr_start(struct perf_event *event, u64 ival)
>  {
>         struct hw_perf_event *hwc = &event->hw;
>
> +       if (needs_branch_stack(event))
> +               riscv_pmu_ctr_enable(event);
> +
>         if (riscv_pmu_cdeleg_available() && !pmu_sbi_is_fw_event(event))
>                 rvpmu_deleg_ctr_start(event, ival);
>         else
> @@ -1593,6 +1607,9 @@ static void rvpmu_ctr_stop(struct perf_event
> *event, unsigned long flag)
>  {
>         struct hw_perf_event *hwc = &event->hw;
>
> +       if (needs_branch_stack(event) && flag != RISCV_PMU_STOP_FLAG_RESET)
> +               riscv_pmu_ctr_disable(event);
> +
>         if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
>             (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
>                 rvpmu_reset_scounteren((void *)event);
> @@ -1650,6 +1667,9 @@ static u32 rvpmu_find_ctrs(void)
>
>  static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
>  {
> +       if (needs_branch_stack(event) && !riscv_pmu_ctr_valid(event))
> +               return -EOPNOTSUPP;
> +
>         if (riscv_pmu_cdeleg_available() && !pmu_sbi_is_fw_event(event))
>                 return rvpmu_cdeleg_event_map(event, econfig);
>         else
> @@ -1696,6 +1716,8 @@ static int rvpmu_starting_cpu(unsigned int cpu,
> struct hlist_node *node)
>                 enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
>         }
>
> +       riscv_pmu_ctr_starting_cpu();
> +
>         if (sbi_pmu_snapshot_available())
>                 return pmu_sbi_snapshot_setup(pmu, cpu);
>
> @@ -1710,6 +1732,7 @@ static int rvpmu_dying_cpu(unsigned int cpu,
> struct hlist_node *node)
>
>         /* Disable all counters access for user mode now */
>         csr_write(CSR_SCOUNTEREN, 0x0);
> +       riscv_pmu_ctr_dying_cpu();
>
>         if (sbi_pmu_snapshot_available())
>                 return pmu_sbi_snapshot_disable();
> @@ -1833,6 +1856,29 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
>         cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
>  }
>
> +static int branch_records_alloc(struct riscv_pmu *pmu)
> +{
> +       struct branch_records __percpu *tmp_alloc_ptr;
> +       struct branch_records *records;
> +       struct cpu_hw_events *events;
> +       int cpu;
> +
> +       if (!riscv_pmu_ctr_supported(pmu))
> +               return 0;
> +
> +       tmp_alloc_ptr = alloc_percpu_gfp(struct branch_records, GFP_KERNEL);
> +       if (!tmp_alloc_ptr)
> +               return -ENOMEM;
> +
> +       for_each_possible_cpu(cpu) {
> +               events = per_cpu_ptr(pmu->hw_events, cpu);
> +               records = per_cpu_ptr(tmp_alloc_ptr, cpu);
> +               events->branches = records;
> +       }
> +
> +       return 0;
> +}
> +
>  static void rvpmu_event_init(struct perf_event *event)
>  {
>         /*
> @@ -1845,6 +1891,9 @@ static void rvpmu_event_init(struct perf_event *event)
>                 event->hw.flags |= PERF_EVENT_FLAG_USER_ACCESS;
>         else
>                 event->hw.flags |= PERF_EVENT_FLAG_LEGACY;
> +
> +       if (branch_sample_call_stack(event))
> +               event->attach_state |= PERF_ATTACH_TASK_DATA;
>  }
>
>  static void rvpmu_event_mapped(struct perf_event *event, struct mm_struct *mm)
> @@ -1992,6 +2041,15 @@ static int rvpmu_device_probe(struct
> platform_device *pdev)
>                 pmu->pmu.attr_groups = riscv_cdeleg_pmu_attr_groups;
>         else
>                 pmu->pmu.attr_groups = riscv_sbi_pmu_attr_groups;
> +
> +       ret = riscv_pmu_ctr_init(pmu);
> +       if (ret)
> +               goto out_free;
> +
> +       ret = branch_records_alloc(pmu);
> +       if (ret)
> +               goto out_ctr_finish;
> +
>         pmu->cmask = cmask;
>         pmu->ctr_add = rvpmu_ctr_add;
>         pmu->ctr_del = rvpmu_ctr_del;
> @@ -2008,6 +2066,10 @@ static int rvpmu_device_probe(struct
> platform_device *pdev)
>         pmu->csr_index = rvpmu_csr_index;
>         pmu->sched_task = pmu_sched_task;
>
> +       ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING,
> &pmu->node);
> +       if (ret)
> +               goto out_ctr_finish;

This hotplug registration should be removed, since there is already
one in the original code.
Otherwise, It will cause the CPU hotplug down to loop infinitely.

Best regards,
Jimmy Ho

> +
>         ret = riscv_pm_pmu_register(pmu);
>         if (ret)
>                 goto out_unregister;
> @@ -2057,6 +2119,9 @@ static int rvpmu_device_probe(struct
> platform_device *pdev)
>  out_unregister:
>         riscv_pmu_destroy(pmu);
>
> +out_ctr_finish:
> +       riscv_pmu_ctr_finish(pmu);
> +
>  out_free:
>         kfree(pmu);
>         return ret;
>
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

