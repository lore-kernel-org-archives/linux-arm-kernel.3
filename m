Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFDDC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 07:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=II0j+BIxiuIysmJvhvYSaRLB//FEhaO5aatu2oW43X0=; b=jfJI83WF3ldXKIAqA3/LK/GABR
	A9XQSntKkGqvJNqaYMoU2h7twYqXlo2OOKXcIWZxBTj+GUh2431B4GTYMwOFwuyj5gCeNvVtDQ5Wt
	327lEUBFmYYxG1oUSwhkiRp81BEBH2nddNuQVDLPXXLQksQQseQ+j7bayxOHI37PxFFTFSJffHSb5
	d+EWcw79YjInVXPNpSgG/6yNrhuPNC/gRjO4lnxI8wpkQENyID3a+a/ZWa6o/bsx4Cc7bI7qA2bbR
	yo2Sm26MpEuJ45EhIgGwLbGzBON9ve4Rh3CmVEIIpOKk9Av+Sj+ZXh2dr/aY1TDXECURKEP8Rh7F+
	eEQV0VNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Vm-00000001fyu-1t88;
	Tue, 22 Jul 2025 07:34:06 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7RO-00000001eUW-2tjy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 07:29:36 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-41b357ba04fso2320317b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 00:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1753169374; x=1753774174; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=II0j+BIxiuIysmJvhvYSaRLB//FEhaO5aatu2oW43X0=;
        b=BMSmmZUs080pvjoO16gFT+jWtNUOVXHqs0kFpoENi2Q++lp3tH1Y/cQpXcnkvF05b4
         sYzzS6ex4YXcpCzTwdFWythgCZ9Suhj5Gf4e2uvROgOZboVrmFpKcZWiwQIIKDnhdX/u
         dcOYrdsHVzAwOYNpgghcaMGHhH+40I63zc2Rd6ID4jvIiWEEAUvZD/meaIWt60nkRfI0
         FCdcCsCodxQ2ryqie8eGy3iFV2RjOwwbqW7Muy+NrzBQIJ5ErrUQ0FcyUYzACcDZTYTy
         YzxT92R9rcJ2gekMNODuIfBMQvHChK6bqpPoWmR+DjNsY0IOhn3gJPvJPkYm0nBea1SH
         GNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753169374; x=1753774174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=II0j+BIxiuIysmJvhvYSaRLB//FEhaO5aatu2oW43X0=;
        b=t8juvt/se8lS2zLMM+J652eQmMe5GrBRLQ2iyQlJL5+/zgW3xYdNcpIxqSh7zcKnwG
         OSWxKNxfur5HHMtYtz4fK+hQFdcEiUBkv4qNQWGB2jjxDSZjhStdNLSDChyCSrp5eByK
         /8oxkymtpY3qXLft6T0uzCg9zPmKaT9mMjQ+5EjIPLgI2/TvaQ7eswsoqumsjOxL7MJH
         MQhv28KCnZqVVWJYAb9YtnkPvg0ptTMGvjlpNXa3M6ATk7XBkl7ilWTmor4pgkNH7mgF
         xORzQfQZJIaj+jO8jW/jOIIw35FG/WesHA42ng6GKCsWvse7wF+bfa8mKtdRI3oQ0FBc
         mvuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKVclSFccLh+oKW/Q3sJcJ+jtURnCEbUTDj8XUF35PIs1NHiBUDZf3mogiZWxyXs6dcXejlpztYSnYBGuANlmu@lists.infradead.org
X-Gm-Message-State: AOJu0YyrvJU4CnUV3uYLYyiyr5ZzrNZbGZsb1wvOaDAQjxsBgNCy7rRq
	fG/o3Fpurr0HbWmB7GxWje/ry/Bsp9LsC40pbLuvydc1aJ7wFbjao6yjDzhJAP1sNdBbWC3TJQj
	nvfLhTH3CLVHfbxx03AizU1Mj33K8qGS8wDgjuv0NBg==
X-Gm-Gg: ASbGncsypS0znu3TUUM0eyI1eP6bq79yg84kVo2VpNB1ikCv9sjLvYy5Fdm36VQGYcp
	x+qrueAnkeVJxNqHn2WzVrGC1i57ojbIJaS34zqdSOLOmr+3OTdZ7fj3EplyDsFotP93Gj2sW2O
	4fSSXjd5fQlX24r767vrjub50wAqQ3yN3QgGpDTvUxkqLnp00pThvvfeszjFYsQpOaZGUFVMRKq
	mZqC7iv0d1c
X-Google-Smtp-Source: AGHT+IGhduV1eRK/m2tq1RSruKm/yzcHcj9PEN9kIqx3QzzM1BxAoH9k58KzR90qEbIUiTqoMhmZJIe9CLW5PNe/gu8=
X-Received: by 2002:a05:6808:4f22:b0:3f7:28ac:8068 with SMTP id
 5614622812f47-41d034f2523mr17016889b6e.13.1753169373667; Tue, 22 Jul 2025
 00:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250715160234.454848-1-cleger@rivosinc.com> <20250715160234.454848-3-cleger@rivosinc.com>
In-Reply-To: <20250715160234.454848-3-cleger@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 22 Jul 2025 15:29:21 +0800
X-Gm-Features: Ac12FXzz_Pvln9IZLey17K9wv5GENIU-XnB4azKJXr1N5Id95cLJoqZJC4wcIdA
Message-ID: <CAEEQ3wkQr6dWPJOkowNO5f9QWdkQ3r2v4cZENuHp_YyBbhS0fg@mail.gmail.com>
Subject: Re: [External] [PATCH v5 2/5] riscv: add support for SBI Supervisor
 Software Events extension
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
X-CRM114-CacheID: sfid-20250722_002934_748087_932FD8E4 
X-CRM114-Status: GOOD (  42.34  )
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

On Wed, Jul 16, 2025 at 12:04=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@ri=
vosinc.com> wrote:
>
> The SBI SSE extension allows the supervisor software to be notified by
> the SBI of specific events that are not maskable. The context switch is
> handled partially by the firmware which will save registers a6 and a7.
> When entering kernel we can rely on these 2 registers to setup the stack
> and save all the registers.
>
> Since SSE events can be delivered at any time to the kernel (including
> during exception handling, we need a way to locate the current_task for
> context tracking. On RISC-V, it is sotred in scratch when in user space
> or tp when in kernel space (in which case SSCRATCH is zero). But at a
> at the beginning of exception handling, SSCRATCH is used to swap tp and
> check the origin of the exception. If interrupted at that point, then,
> there is no way to reliably know were is located the current
> task_struct. Even checking the interruption location won't work as SSE
> event can be nested on top of each other so the original interruption
> site might be lost at some point. In order to retrieve it reliably,
> store the current task in an additional __sse_entry_task per_cpu array.
> This array is then used to retrieve the current task based on the
> hart ID that is passed to the SSE event handler in a6.
>
> That being said, the way the current task struct is stored should
> probably be reworked to find a better reliable alternative.
>
> Since each events (and each CPU for local events) have their own
> context and can preempt each other, allocate a stack (and a shadow stack
> if needed for each of them (and for each cpu for local events).
>
> When completing the event, if we were coming from kernel with interrupts
> disabled, simply return there. If coming from userspace or kernel with
> interrupts enabled, simulate an interrupt exception by setting IE_SIE in
> CSR_IP to allow delivery of signals to user task. For instance this can
> happen, when a RAS event has been generated by a user application and a
> SIGBUS has been sent to a task.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/asm.h         |  14 ++-
>  arch/riscv/include/asm/scs.h         |   7 ++
>  arch/riscv/include/asm/sse.h         |  44 +++++++
>  arch/riscv/include/asm/switch_to.h   |  14 +++
>  arch/riscv/include/asm/thread_info.h |   1 +
>  arch/riscv/kernel/Makefile           |   1 +
>  arch/riscv/kernel/asm-offsets.c      |  12 ++
>  arch/riscv/kernel/sse.c              | 146 +++++++++++++++++++++++
>  arch/riscv/kernel/sse_entry.S        | 169 +++++++++++++++++++++++++++
>  9 files changed, 405 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/include/asm/sse.h
>  create mode 100644 arch/riscv/kernel/sse.c
>  create mode 100644 arch/riscv/kernel/sse_entry.S
>
> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index a8a2af6dfe9d..982c4be9a9c3 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -90,16 +90,24 @@
>  #define PER_CPU_OFFSET_SHIFT 3
>  #endif
>
> -.macro asm_per_cpu dst sym tmp
> -       REG_L \tmp, TASK_TI_CPU_NUM(tp)
> -       slli  \tmp, \tmp, PER_CPU_OFFSET_SHIFT
> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
> +       slli  \tmp, \cpu, PER_CPU_OFFSET_SHIFT
>         la    \dst, __per_cpu_offset
>         add   \dst, \dst, \tmp
>         REG_L \tmp, 0(\dst)
>         la    \dst, \sym
>         add   \dst, \dst, \tmp
>  .endm
> +
> +.macro asm_per_cpu dst sym tmp
> +       REG_L \tmp, TASK_TI_CPU_NUM(tp)
> +       asm_per_cpu_with_cpu \dst \sym \tmp \tmp
> +.endm
>  #else /* CONFIG_SMP */
> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
> +       la    \dst, \sym
> +.endm
> +
>  .macro asm_per_cpu dst sym tmp
>         la    \dst, \sym
>  .endm
> diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
> index 0e45db78b24b..62344daad73d 100644
> --- a/arch/riscv/include/asm/scs.h
> +++ b/arch/riscv/include/asm/scs.h
> @@ -18,6 +18,11 @@
>         load_per_cpu gp, irq_shadow_call_stack_ptr, \tmp
>  .endm
>
> +/* Load the per-CPU IRQ shadow call stack to gp. */
> +.macro scs_load_sse_stack reg_evt
> +       REG_L gp, SSE_REG_EVT_SHADOW_STACK(\reg_evt)
> +.endm
> +
>  /* Load task_scs_sp(current) to gp. */
>  .macro scs_load_current
>         REG_L   gp, TASK_TI_SCS_SP(tp)
> @@ -41,6 +46,8 @@
>  .endm
>  .macro scs_load_irq_stack tmp
>  .endm
> +.macro scs_load_sse_stack reg_evt
> +.endm
>  .macro scs_load_current
>  .endm
>  .macro scs_load_current_if_task_changed prev
> diff --git a/arch/riscv/include/asm/sse.h b/arch/riscv/include/asm/sse.h
> new file mode 100644
> index 000000000000..ff938bd9007d
> --- /dev/null
> +++ b/arch/riscv/include/asm/sse.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +#ifndef __ASM_SSE_H
> +#define __ASM_SSE_H
> +
> +#include <asm/sbi.h>
> +
> +#ifdef CONFIG_RISCV_SSE
> +
> +struct sse_event_interrupted_state {
> +       unsigned long a6;
> +       unsigned long a7;
> +};
> +
> +struct sse_event_arch_data {
> +       void *stack;
> +       void *shadow_stack;
> +       unsigned long tmp;
> +       struct sse_event_interrupted_state interrupted;
> +       unsigned long interrupted_phys;
> +       u32 evt_id;
> +};
> +
> +static inline bool sse_event_is_global(u32 evt)
> +{
> +       return !!(evt & SBI_SSE_EVENT_GLOBAL);
> +}
> +
> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id=
,
> +                       int cpu);
> +void arch_sse_free_event(struct sse_event_arch_data *arch_evt);
> +int arch_sse_register_event(struct sse_event_arch_data *arch_evt);
> +
> +void sse_handle_event(struct sse_event_arch_data *arch_evt,
> +                     struct pt_regs *regs);
> +asmlinkage void handle_sse(void);
> +asmlinkage void do_sse(struct sse_event_arch_data *arch_evt,
> +                      struct pt_regs *reg);
> +
> +#endif
> +
> +#endif
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/=
switch_to.h
> index 0e71eb82f920..cd1cead0c682 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -88,6 +88,19 @@ static inline void __switch_to_envcfg(struct task_stru=
ct *next)
>                         :: "r" (next->thread.envcfg) : "memory");
>  }
>
> +#ifdef CONFIG_RISCV_SSE
> +DECLARE_PER_CPU(struct task_struct *, __sse_entry_task);
> +
> +static inline void __switch_sse_entry_task(struct task_struct *next)
> +{
> +       __this_cpu_write(__sse_entry_task, next);
> +}
> +#else
> +static inline void __switch_sse_entry_task(struct task_struct *next)
> +{
> +}
> +#endif
> +
>  extern struct task_struct *__switch_to(struct task_struct *,
>                                        struct task_struct *);
>
> @@ -122,6 +135,7 @@ do {                                                 =
       \
>         if (switch_to_should_flush_icache(__next))      \
>                 local_flush_icache_all();               \
>         __switch_to_envcfg(__next);                     \
> +       __switch_sse_entry_task(__next);                        \
>         ((last) =3D __switch_to(__prev, __next));         \
>  } while (0)
>
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/as=
m/thread_info.h
> index f5916a70879a..28e9805e61fc 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -36,6 +36,7 @@
>  #define OVERFLOW_STACK_SIZE     SZ_4K
>
>  #define IRQ_STACK_SIZE         THREAD_SIZE
> +#define SSE_STACK_SIZE         THREAD_SIZE
>
>  #ifndef __ASSEMBLY__
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index c7b542573407..62e4490b34ee 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -99,6 +99,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)  +=3D mcount-dyn.o
>  obj-$(CONFIG_PERF_EVENTS)      +=3D perf_callchain.o
>  obj-$(CONFIG_HAVE_PERF_REGS)   +=3D perf_regs.o
>  obj-$(CONFIG_RISCV_SBI)                +=3D sbi.o sbi_ecall.o
> +obj-$(CONFIG_RISCV_SSE)                +=3D sse.o sse_entry.o
>  ifeq ($(CONFIG_RISCV_SBI), y)
>  obj-$(CONFIG_SMP)              +=3D sbi-ipi.o
>  obj-$(CONFIG_SMP) +=3D cpu_ops_sbi.o
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offs=
ets.c
> index 6e8c0d6feae9..651779647cdd 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -14,6 +14,8 @@
>  #include <asm/ptrace.h>
>  #include <asm/cpu_ops_sbi.h>
>  #include <asm/stacktrace.h>
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
>  #include <asm/suspend.h>
>
>  void asm_offsets(void);
> @@ -528,4 +530,14 @@ void asm_offsets(void)
>         DEFINE(FREGS_A6,            offsetof(struct __arch_ftrace_regs, a=
6));
>         DEFINE(FREGS_A7,            offsetof(struct __arch_ftrace_regs, a=
7));
>  #endif
> +
> +#ifdef CONFIG_RISCV_SSE
> +       OFFSET(SSE_REG_EVT_STACK, sse_event_arch_data, stack);
> +       OFFSET(SSE_REG_EVT_SHADOW_STACK, sse_event_arch_data, shadow_stac=
k);
> +       OFFSET(SSE_REG_EVT_TMP, sse_event_arch_data, tmp);
> +
> +       DEFINE(SBI_EXT_SSE, SBI_EXT_SSE);
> +       DEFINE(SBI_SSE_EVENT_COMPLETE, SBI_SSE_EVENT_COMPLETE);
> +       DEFINE(ASM_NR_CPUS, NR_CPUS);
> +#endif
>  }
> diff --git a/arch/riscv/kernel/sse.c b/arch/riscv/kernel/sse.c
> new file mode 100644
> index 000000000000..49d59f9ffa09
> --- /dev/null
> +++ b/arch/riscv/kernel/sse.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +#include <linux/nmi.h>
> +#include <linux/scs.h>
> +#include <linux/bitfield.h>
> +#include <linux/riscv_sse.h>
> +#include <linux/percpu-defs.h>
> +
> +#include <asm/asm-prototypes.h>
> +#include <asm/switch_to.h>
> +#include <asm/irq_stack.h>
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
> +
> +DEFINE_PER_CPU(struct task_struct *, __sse_entry_task);
> +
> +void __weak sse_handle_event(struct sse_event_arch_data *arch_evt, struc=
t pt_regs *regs)
> +{
> +}
> +
> +void do_sse(struct sse_event_arch_data *arch_evt, struct pt_regs *regs)
> +{
> +       nmi_enter();
> +
> +       /* Retrieve missing GPRs from SBI */
> +       sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, arch_evt->evt_id,
> +                 SBI_SSE_ATTR_INTERRUPTED_A6,
> +                 (SBI_SSE_ATTR_INTERRUPTED_A7 - SBI_SSE_ATTR_INTERRUPTED=
_A6) + 1,
> +                 arch_evt->interrupted_phys, 0, 0);
> +
> +       memcpy(&regs->a6, &arch_evt->interrupted, sizeof(arch_evt->interr=
upted));
> +
> +       sse_handle_event(arch_evt, regs);
> +
> +       /*
> +        * The SSE delivery path does not uses the "standard" exception p=
ath
> +        * (see sse_entry.S) and does not process any pending signal/soft=
irqs
> +        * due to being similar to a NMI.
> +        * Some drivers (PMU, RAS) enqueue pending work that needs to be =
handled
> +        * as soon as possible by bottom halves. For that purpose, set th=
e SIP
> +        * software interrupt pending bit which will force a software int=
errupt
> +        * to be serviced once interrupts are reenabled in the interrupte=
d
> +        * context if they were masked or directly if unmasked.
> +        */
> +       csr_set(CSR_IP, IE_SIE);
> +
> +       nmi_exit();
> +}
> +
> +static void *alloc_to_stack_pointer(void *alloc)
> +{
> +       return alloc ? alloc + SSE_STACK_SIZE : NULL;
> +}
> +
> +static void *stack_pointer_to_alloc(void *stack)
> +{
> +       return stack - SSE_STACK_SIZE;
> +}
> +
> +#ifdef CONFIG_VMAP_STACK
> +static void *sse_stack_alloc(unsigned int cpu)
> +{
> +       void *stack =3D arch_alloc_vmap_stack(SSE_STACK_SIZE, cpu_to_node=
(cpu));
> +
> +       return alloc_to_stack_pointer(stack);
> +}
> +
> +static void sse_stack_free(void *stack)
> +{
> +       vfree(stack_pointer_to_alloc(stack));
> +}
> +#else /* CONFIG_VMAP_STACK */
> +static void *sse_stack_alloc(unsigned int cpu)
> +{
> +       void *stack =3D kmalloc(SSE_STACK_SIZE, GFP_KERNEL);
> +
> +       return alloc_to_stack_pointer(stack);
> +}
> +
> +static void sse_stack_free(void *stack)
> +{
> +       kfree(stack_pointer_to_alloc(stack));
> +}
> +#endif /* CONFIG_VMAP_STACK */
> +
> +static int sse_init_scs(int cpu, struct sse_event_arch_data *arch_evt)
> +{
> +       void *stack;
> +
> +       if (!scs_is_enabled())
> +               return 0;
> +
> +       stack =3D scs_alloc(cpu_to_node(cpu));
> +       if (!stack)
> +               return -ENOMEM;
> +
> +       arch_evt->shadow_stack =3D stack;
> +
> +       return 0;
> +}
> +
> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id=
, int cpu)
> +{
> +       void *stack;
> +
> +       arch_evt->evt_id =3D evt_id;
> +       stack =3D sse_stack_alloc(cpu);
> +       if (!stack)
> +               return -ENOMEM;
> +
> +       arch_evt->stack =3D stack;
> +
> +       if (sse_init_scs(cpu, arch_evt)) {
> +               sse_stack_free(arch_evt->stack);
> +               return -ENOMEM;
> +       }
> +
> +       if (sse_event_is_global(evt_id)) {
> +               arch_evt->interrupted_phys =3D
> +                                       virt_to_phys(&arch_evt->interrupt=
ed);
> +       } else {
> +               arch_evt->interrupted_phys =3D
> +                               per_cpu_ptr_to_phys(&arch_evt->interrupte=
d);
> +       }
> +
> +       return 0;
> +}
> +
> +void arch_sse_free_event(struct sse_event_arch_data *arch_evt)
> +{
> +       scs_free(arch_evt->shadow_stack);
> +       sse_stack_free(arch_evt->stack);
> +}
> +
> +int arch_sse_register_event(struct sse_event_arch_data *arch_evt)
> +{
> +       struct sbiret sret;
> +
> +       sret =3D sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_REGISTER, arch_evt-=
>evt_id,
> +                        (unsigned long)handle_sse, (unsigned long)arch_e=
vt, 0,
> +                        0, 0);
> +
> +       return sbi_err_map_linux_errno(sret.error);
> +}
> diff --git a/arch/riscv/kernel/sse_entry.S b/arch/riscv/kernel/sse_entry.=
S
> new file mode 100644
> index 000000000000..c22ebfc0e063
> --- /dev/null
> +++ b/arch/riscv/kernel/sse_entry.S
> @@ -0,0 +1,169 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/linkage.h>
> +
> +#include <asm/asm.h>
> +#include <asm/csr.h>
> +#include <asm/scs.h>
> +
> +/* When entering handle_sse, the following registers are set:
> + * a6: contains the hartid
> + * a7: contains struct sse_registered_event pointer

Can it be written as struct sse_event_arch_data?

> + */
> +SYM_CODE_START(handle_sse)
> +       /* Save stack temporarily */
> +       REG_S sp, SSE_REG_EVT_TMP(a7)
> +       /* Set entry stack */
> +       REG_L sp, SSE_REG_EVT_STACK(a7)
> +
> +       addi sp, sp, -(PT_SIZE_ON_STACK)
> +       REG_S ra, PT_RA(sp)
> +       REG_S s0, PT_S0(sp)
> +       REG_S s1, PT_S1(sp)
> +       REG_S s2, PT_S2(sp)
> +       REG_S s3, PT_S3(sp)
> +       REG_S s4, PT_S4(sp)
> +       REG_S s5, PT_S5(sp)
> +       REG_S s6, PT_S6(sp)
> +       REG_S s7, PT_S7(sp)
> +       REG_S s8, PT_S8(sp)
> +       REG_S s9, PT_S9(sp)
> +       REG_S s10, PT_S10(sp)
> +       REG_S s11, PT_S11(sp)
> +       REG_S tp, PT_TP(sp)
> +       REG_S t0, PT_T0(sp)
> +       REG_S t1, PT_T1(sp)
> +       REG_S t2, PT_T2(sp)
> +       REG_S t3, PT_T3(sp)
> +       REG_S t4, PT_T4(sp)
> +       REG_S t5, PT_T5(sp)
> +       REG_S t6, PT_T6(sp)
> +       REG_S gp, PT_GP(sp)
> +       REG_S a0, PT_A0(sp)
> +       REG_S a1, PT_A1(sp)
> +       REG_S a2, PT_A2(sp)
> +       REG_S a3, PT_A3(sp)
> +       REG_S a4, PT_A4(sp)
> +       REG_S a5, PT_A5(sp)
> +
> +       /* Retrieve entry sp */
> +       REG_L a4, SSE_REG_EVT_TMP(a7)
> +       /* Save CSRs */
> +       csrr a0, CSR_EPC
> +       csrr a1, CSR_SSTATUS
> +       csrr a2, CSR_STVAL
> +       csrr a3, CSR_SCAUSE
> +
> +       REG_S a0, PT_EPC(sp)
> +       REG_S a1, PT_STATUS(sp)
> +       REG_S a2, PT_BADADDR(sp)
> +       REG_S a3, PT_CAUSE(sp)
> +       REG_S a4, PT_SP(sp)
> +
> +       /* Disable user memory access and floating/vector computing */
> +       li t0, SR_SUM | SR_FS_VS
> +       csrc CSR_STATUS, t0
> +
> +       load_global_pointer
> +       scs_load_sse_stack a7
> +
> +       /* Restore current task struct from __sse_entry_task */
> +       li t1, ASM_NR_CPUS
> +       mv t3, zero
> +
> +#ifdef CONFIG_SMP
> +       /* Find the CPU id associated to the hart id */
> +       la t0, __cpuid_to_hartid_map
> +.Lhart_id_loop:
> +       REG_L t2, 0(t0)
> +       beq t2, a6, .Lcpu_id_found
> +
> +       /* Increment pointer and CPU number */
> +       addi t3, t3, 1
> +       addi t0, t0, RISCV_SZPTR
> +       bltu t3, t1, .Lhart_id_loop
> +

Can we get the CPU number directly here? E.g., pass it during
SBI_SSE_EVENT_REGISTER, or create a reverse array of
__cpuid_to_hartid_map[]?

> +       /*
> +        * This should never happen since we expect the hart_id to match =
one
> +        * of our CPU, but better be safe than sorry
> +        */
> +       la tp, init_task
> +       la a0, sse_hart_id_panic_string
> +       la t0, panic
> +       jalr t0
> +
> +.Lcpu_id_found:
> +#endif
> +       asm_per_cpu_with_cpu t2 __sse_entry_task t1 t3
> +       REG_L tp, 0(t2)
> +
> +       mv a1, sp /* pt_regs on stack */
> +
> +       /*
> +        * Save sscratch for restoration since we might have interrupted =
the
> +        * kernel in early exception path and thus, we don't know the con=
tent of
> +        * sscratch.
> +        */
> +       csrr s4, CSR_SSCRATCH
> +       /* In-kernel scratch is 0 */
> +       csrw CSR_SCRATCH, x0
> +
> +       mv a0, a7
> +
> +       call do_sse
> +
> +       csrw CSR_SSCRATCH, s4
> +
> +       REG_L a0, PT_STATUS(sp)
> +       REG_L a1, PT_EPC(sp)
> +       REG_L a2, PT_BADADDR(sp)
> +       REG_L a3, PT_CAUSE(sp)
> +       csrw CSR_SSTATUS, a0
> +       csrw CSR_EPC, a1
> +       csrw CSR_STVAL, a2
> +       csrw CSR_SCAUSE, a3
> +
> +       REG_L ra, PT_RA(sp)
> +       REG_L s0, PT_S0(sp)
> +       REG_L s1, PT_S1(sp)
> +       REG_L s2, PT_S2(sp)
> +       REG_L s3, PT_S3(sp)
> +       REG_L s4, PT_S4(sp)
> +       REG_L s5, PT_S5(sp)
> +       REG_L s6, PT_S6(sp)
> +       REG_L s7, PT_S7(sp)
> +       REG_L s8, PT_S8(sp)
> +       REG_L s9, PT_S9(sp)
> +       REG_L s10, PT_S10(sp)
> +       REG_L s11, PT_S11(sp)
> +       REG_L tp, PT_TP(sp)
> +       REG_L t0, PT_T0(sp)
> +       REG_L t1, PT_T1(sp)
> +       REG_L t2, PT_T2(sp)
> +       REG_L t3, PT_T3(sp)
> +       REG_L t4, PT_T4(sp)
> +       REG_L t5, PT_T5(sp)
> +       REG_L t6, PT_T6(sp)
> +       REG_L gp, PT_GP(sp)
> +       REG_L a0, PT_A0(sp)
> +       REG_L a1, PT_A1(sp)
> +       REG_L a2, PT_A2(sp)
> +       REG_L a3, PT_A3(sp)
> +       REG_L a4, PT_A4(sp)
> +       REG_L a5, PT_A5(sp)
> +
> +       REG_L sp, PT_SP(sp)
> +
> +       li a7, SBI_EXT_SSE
> +       li a6, SBI_SSE_EVENT_COMPLETE
> +       ecall
> +
> +SYM_CODE_END(handle_sse)
> +
> +SYM_DATA_START_LOCAL(sse_hart_id_panic_string)
> +    .ascii "Unable to match hart_id with cpu\0"
> +SYM_DATA_END(sse_hart_id_panic_string)
> --
> 2.43.0
>
>

Thanks,
Yunhui

