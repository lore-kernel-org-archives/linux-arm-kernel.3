Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F2CD1D87F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okWEC/iPxwHapBCL3ZZGyYvTBzssGUbkrGoBgDrV58Y=; b=cOb+hpVCgJ30WC8dm88DdART4J
	eTTx3+uGNBtR8nfhluG2QTatbvFdO6ixuciWT0H+sctry1RytYiMnIf4CRs5f189zFORjAJchKrbS
	uMCQE+4sPfxY5NnkN4qc9jSgWmrvP3C5lwOXvcwD6SLVxAKl8EZNZdfSWvEs7MqW7LQu0bleaS5cO
	kKir2BYCrva4c2g3PxuaED3pqnlR22Qzg8l1q9wQmIpolD+sPsxQyiIXFN1D22EdAFY20Io8nsRvt
	b2wLDgCDNugQdf+QL+QDxkfiBRuDFTZwhlVo6PhhEaCKcl3hfyB3ydXAjflhrtces0Ai6bPqga/VG
	4647D9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3gN-00000007bup-31SV;
	Thu, 04 Dec 2025 07:23:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3gJ-00000007bu1-45ur
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 07:23:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4779a637712so3763725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 23:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764832994; x=1765437794; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=okWEC/iPxwHapBCL3ZZGyYvTBzssGUbkrGoBgDrV58Y=;
        b=bCnSaiehozvQkiVhRSJruYMHWBGZQNE57drE+oxtLnoBBpLmQ9AkLBFRIfTHnjRuYm
         Uzh6PSp64iVF7suhKojaAAL6hmP+pHl7mzxj15HA1AK34lsfI+YalVbpV0I02DXWwGrn
         TddNLfGIY3WXhDAj3hnYRHOcwhGAYEykhgFlfIparykByaaOSYSqK2LxVGFLrvLV7gES
         /WbZIat/tkbb+bghAVrtnoS1OG/+yr20UPZNmZ9y6KSxZHxZULYNoqhfyswwEtTcWgDR
         iLjS8shH4PbLAAWgpiGUs37+Zh+CQ3X4Vp7FV2ejlgUqim8a71z1xwaU+uJXFw2NOpXm
         7FbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764832994; x=1765437794;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okWEC/iPxwHapBCL3ZZGyYvTBzssGUbkrGoBgDrV58Y=;
        b=C6pU0/Sm5zAiOmRp53g/M9yVc8QQbIpRxM8WXDPjTHmw5HWFJZ3CIjNoc9TxjcaBYE
         kJXloYsRa2wqo1WIwHSy1IYgXjm6BPeHTt25IpOUc2kDwABE83gTsfnA9WqVFkBkRJlT
         2Zyp7pRFEB6fxmRI3WarR5WFdp9TidXE5kVGqdkX/DZ5mZq5/hIiHKBn30OglsjTnLDA
         RdWIR5bRjnB5ImlNCkGRGrII/7Ggc/KrdDbSTtCHL2WCVtCqVG1tvhzlbLVgIO05PV49
         4+YDU6jC727owUZV9+c5gKdNbRcIROhuyQtBvZMseKoC558HPk1EQ6svRcglMjvFs7eM
         tqhw==
X-Forwarded-Encrypted: i=1; AJvYcCUof1+BCSHVrJv1Sf0yO9o/FLH72SNjItlixq+VyZ1lez+T5NUvX2SvS2vDyWSyoBR5v50CuzC2HWhMeDlholt8@lists.infradead.org
X-Gm-Message-State: AOJu0YzQgdxRQnh5kQB1k3GOtwqTPYhYyGtSqXK+Tkf+qDPaDGT2ywrl
	V/60kpZ4hrKnXu1qNwArLzCf/acgTYu5v0SRVxc5sCnh6lcBieKMEoH3qEF/8kvrHlUWrBU0vuB
	TTQxq3sT+xj4hphwcVov2evi3CUU3AdUQsvgUJmygpg==
X-Gm-Gg: ASbGncuMdl8nvgZ/x77pS7MiIrIqbRh4ssA7m4gaPLpcwFQk0qzBGdMi297KUz/jYLv
	RlqUamwQOKACc1vJXHEiN2ix0ZiWrW57EvIv3wYc6EqTUR2XR4liWFv2v95MpJ6PqwS6WplYC+I
	C5vX6feO/bc+yMT0t6A3/qT3AVwG1y1aiBup3gcGmFWWpJmO66s4VjfzWoqfv05/NDY1mqP19O7
	gT5D97scfWbjMtZfk5XYP/qM9dqxbicMbPxOecQeVKy/7Y1ECD0nhdXDlI6G3MiPY26ZMhL7w==
X-Google-Smtp-Source: AGHT+IFaKGk1a1cfaFCq3oEJHjtRMI9goTFpitEtb54cbEHZjPz6jL2+k2TkdRXspbNqqeM3uYcrqB70IssR3M+MU1k=
X-Received: by 2002:a05:6000:4012:b0:42b:3701:c4c6 with SMTP id
 ffacd0b85a97d-42f731eb4d1mr4801776f8f.38.1764832993790; Wed, 03 Dec 2025
 23:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
 <20250523-b4-ctr_upstream_v3-v3-6-ad355304ba1c@rivosinc.com>
 <CAPqJEFr=3Re=L0CmEpCRHxovB74MDB9C8neNMfouYvWWbR0hyw@mail.gmail.com> <CAJh9TSJk0nZvqJrvTe5ENMpAB=56--+CFai0tXQnYFakKxQxQw@mail.gmail.com>
In-Reply-To: <CAJh9TSJk0nZvqJrvTe5ENMpAB=56--+CFai0tXQnYFakKxQxQw@mail.gmail.com>
From: Jimmy Ho <jimmy.ho@sifive.com>
Date: Thu, 4 Dec 2025 15:23:02 +0800
X-Gm-Features: AWmQ_bmUiiW9pn488x-Fr8fuYuHfeGljg_pilmkGRtBxdEqZhbPqlS98C4-BBjg
Message-ID: <CAJh9TS+MM+4ytsQ4tOhddNihvTrRMwV0rFRmMv1xRQTGcE18Dw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] riscv: pmu: Integrate CTR Ext support in
 riscv_pmu_dev driver
To: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, 
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
X-CRM114-CacheID: sfid-20251203_232316_093203_14231AC0 
X-CRM114-Status: GOOD (  30.53  )
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

