Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059D2CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/Ek69utHb+AfaGxzGs1kO33G5UhqmdOfj2jpDtXH+g=; b=d8RfOZ6r1fXWmhzOuQTh5M/TOA
	+BCoivv0+OJm9RZpJDWT1vi7E3LNWih+RJxrYwyFEbSCOzVXa21tZm3nGK6ljq1RObja1Io0YkhAD
	6JIfFtY3lNzfL1BRCAOxUf/3lKkr8YJYJGgSDOKpX2H9g8loKb+In7GbHXxRlWBS4EZ+0TInXwE0z
	ovuShz54nxqurgQwASXDuEd55DZHhV696MSOtvdytmPN3O06xSQk4tD8Wy/Mht1DwYjTOf/9YBN3D
	HJhTA4ipYVmaoLWPx8EsKHy6ojjwF3Mo3camHDM2cKdPt5nR3hBmeGtyYKRxdEDD/qG2aPqWqVzJj
	gyclZ7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLtl-0000000DpoE-3hrU;
	Mon, 27 Oct 2025 12:00:29 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLtj-0000000DpnJ-04KF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:00:28 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-932e88546a8so2301456241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 05:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761566423; x=1762171223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/Ek69utHb+AfaGxzGs1kO33G5UhqmdOfj2jpDtXH+g=;
        b=jKEUeflYicoRSOvAycZrlQAhK2bbNnAbDK0Uxj7em1+Tew2q8lSfeAlU8FSM3IsPLj
         7zqMfgP6jtEAgNauLZq5kllL6t/jnVfbrySGLgDjSPLlb1w5tzVX349wV0Mo5WlshxEk
         CTtN5zFUu6iydl/swY9flfvp9NMhDS23NYI0rUM/ZlhULdgLmUtUd3Kyw1YTvwCL48Ox
         G+uOL6nShjwqVPPWTnT5r2eMUw2lxcAJNHx744yX7BVfPAq6xylHi5YMja6ch2VvYGIZ
         IrMWsw4PAdfFDknAhDwBzltNw5D4oX9EjADkix3l8Gi6G59R39AnB4IZ8a1Fcid9o4N4
         Hbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761566423; x=1762171223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/Ek69utHb+AfaGxzGs1kO33G5UhqmdOfj2jpDtXH+g=;
        b=PkiZEwAHw2gdJoRY4Bp66/MCOYov8uLyF+o2VAlO18q4hikzi7D8JJ/6esebANNoFH
         WA73tbPwT36J3ilIxQCmIann4YbHallAyPS89eW+nwwltzat9+5Gax2R8ES+0qbjviHr
         06IPg4eImVCZ0vOBVWHFj5ECZS6oJMudQpMhGXUcFshsReqLwEkB/unmpDZRQHJVTqp0
         3g18YRNnydKvGORkvBlDFFY5EGkB5Ic5VdZzdYw6Ux9N1Lv5GL5Ph6TZ08/xSR2lM72V
         3eeY39MZoSTWgPpecCBKKWb0spsnLmIzbCmTKX48EY6uSo1YZWIjPG/2LCFVjpOIiQDP
         sxbA==
X-Forwarded-Encrypted: i=1; AJvYcCXeyMos7CizYQ2MyyqJR0uH7NHzNx20ajvet24AjWb/ly8w+tZggRtu9t/mi1m9WNWeYAGdOjmz8rENhc5rmYAU@lists.infradead.org
X-Gm-Message-State: AOJu0YwyviXHZLt8cfNUJ6dyDknxTewWjA5ugAvF0INQKnvwPQrjSkrV
	yhz7qXvcs3b343g28HB33P0/XLGiAOHWzY+2pT2nqS8S4VvXQtmX9l2hI2mQfW2lPIXSBe3FwBq
	fDtVmWtxzGS31CKv5V2h0Xd49fAhI3R95DFEz19k7nQ==
X-Gm-Gg: ASbGncvasxlt0JSFqnA+vT2Q0FRjMSTg79vC/QL7Nkwxaby/ni3GCjID8JbQef/EqBr
	51XHq0bkW5Fd94YJmD1uywu+39skpP2MHKecEP3ttZHe0pqGia5ZwsN6JSRtBp+z6tp3pFrjuIQ
	dg+dsu0l2x34UH5krlRGF7GQayqpbszYqByy0Sd1HB+pUp9Nf0LazI8gHlkeXIs6XP9XK23GhRu
	QfxdT/FRDbRplJKlQ8VmJJeORS75DugNnyCiMNtstQO5Go0gcLNvAlJTzXMzTy4h4FBb7AkTIPZ
	eupnN6H8
X-Google-Smtp-Source: AGHT+IG6bqM/wPCWR652EUOCHAARXfJbRuDTf92USEunsCE7HjS0usBH+GOh3Rf0EFVRhZK0N/pQWTS2hjxhm64gC0g=
X-Received: by 2002:a05:6102:1610:b0:51c:4443:16c7 with SMTP id
 ada2fe7eead31-5db3e124a07mr4343228137.6.1761566422416; Mon, 27 Oct 2025
 05:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250908181717.1997461-1-cleger@rivosinc.com> <20250908181717.1997461-3-cleger@rivosinc.com>
In-Reply-To: <20250908181717.1997461-3-cleger@rivosinc.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 27 Oct 2025 20:00:11 +0800
X-Gm-Features: AWmQ_bmYSYOktWVqDnG7qQb31huRrG1ETDDxWo5XFgw973gCYPiQwHFRn1NbS4Y
Message-ID: <CAPYmKFuVC3CwHbytPzQCHOYPoQp2LhucbLRRRRsqHk9upkrW8A@mail.gmail.com>
Subject: Re: [External] [PATCH v7 2/5] riscv: add support for SBI Supervisor
 Software Events extension
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_050027_141379_C8D86827 
X-CRM114-Status: GOOD (  43.30  )
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

On Tue, Sep 9, 2025 at 2:19=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@rivo=
sinc.com> wrote:
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
>  arch/riscv/include/asm/sse.h         |  47 +++++++
>  arch/riscv/include/asm/switch_to.h   |  14 +++
>  arch/riscv/include/asm/thread_info.h |   1 +
>  arch/riscv/kernel/Makefile           |   1 +
>  arch/riscv/kernel/asm-offsets.c      |  14 +++
>  arch/riscv/kernel/sbi_sse.c          | 174 ++++++++++++++++++++++++++
>  arch/riscv/kernel/sbi_sse_entry.S    | 178 +++++++++++++++++++++++++++
>  9 files changed, 447 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/include/asm/sse.h
>  create mode 100644 arch/riscv/kernel/sbi_sse.c
>  create mode 100644 arch/riscv/kernel/sbi_sse_entry.S
>
> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index 2a16e88e13de..416dddd37d67 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -90,16 +90,24 @@
>  #define PER_CPU_OFFSET_SHIFT 3
>  #endif
>
> -.macro asm_per_cpu dst sym tmp
> -       lw    \tmp, TASK_TI_CPU_NUM(tp)
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
> +       lw \tmp, TASK_TI_CPU_NUM(tp)
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
> index 000000000000..d3ce8c2b5221
> --- /dev/null
> +++ b/arch/riscv/include/asm/sse.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +#ifndef __ASM_SSE_H
> +#define __ASM_SSE_H
> +
> +#include <asm/sbi.h>
> +
> +#ifdef CONFIG_RISCV_SBI_SSE
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
> +       unsigned int hart_id;
> +       unsigned int cpu_id;
> +};
> +
> +static inline bool sse_event_is_global(u32 evt)
> +{
> +       return !!(evt & SBI_SSE_EVENT_GLOBAL);
> +}
> +
> +void arch_sse_event_update_cpu(struct sse_event_arch_data *arch_evt, int=
 cpu);
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
> index 0e71eb82f920..70e68e630216 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -88,6 +88,19 @@ static inline void __switch_to_envcfg(struct task_stru=
ct *next)
>                         :: "r" (next->thread.envcfg) : "memory");
>  }
>
> +#ifdef CONFIG_RISCV_SBI_SSE
> +DECLARE_PER_CPU(struct task_struct *, __sbi_sse_entry_task);
> +
> +static inline void __switch_sbi_sse_entry_task(struct task_struct *next)
> +{
> +       __this_cpu_write(__sbi_sse_entry_task, next);
> +}
> +#else
> +static inline void __switch_sbi_sse_entry_task(struct task_struct *next)
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
> +       __switch_sbi_sse_entry_task(__next);                    \
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
> index c7b542573407..16637e01a6b3 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -99,6 +99,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)  +=3D mcount-dyn.o
>  obj-$(CONFIG_PERF_EVENTS)      +=3D perf_callchain.o
>  obj-$(CONFIG_HAVE_PERF_REGS)   +=3D perf_regs.o
>  obj-$(CONFIG_RISCV_SBI)                +=3D sbi.o sbi_ecall.o
> +obj-$(CONFIG_RISCV_SBI_SSE)    +=3D sbi_sse.o sbi_sse_entry.o
>  ifeq ($(CONFIG_RISCV_SBI), y)
>  obj-$(CONFIG_SMP)              +=3D sbi-ipi.o
>  obj-$(CONFIG_SMP) +=3D cpu_ops_sbi.o
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offs=
ets.c
> index 6e8c0d6feae9..1b0d8624ef6e 100644
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
> @@ -528,4 +530,16 @@ void asm_offsets(void)
>         DEFINE(FREGS_A6,            offsetof(struct __arch_ftrace_regs, a=
6));
>         DEFINE(FREGS_A7,            offsetof(struct __arch_ftrace_regs, a=
7));
>  #endif
> +
> +#ifdef CONFIG_RISCV_SBI_SSE
> +       OFFSET(SSE_REG_EVT_STACK, sse_event_arch_data, stack);
> +       OFFSET(SSE_REG_EVT_SHADOW_STACK, sse_event_arch_data, shadow_stac=
k);
> +       OFFSET(SSE_REG_EVT_TMP, sse_event_arch_data, tmp);
> +       OFFSET(SSE_REG_HART_ID, sse_event_arch_data, hart_id);
> +       OFFSET(SSE_REG_CPU_ID, sse_event_arch_data, cpu_id);
> +
> +       DEFINE(SBI_EXT_SSE, SBI_EXT_SSE);
> +       DEFINE(SBI_SSE_EVENT_COMPLETE, SBI_SSE_EVENT_COMPLETE);
> +       DEFINE(ASM_NR_CPUS, NR_CPUS);
> +#endif
>  }
> diff --git a/arch/riscv/kernel/sbi_sse.c b/arch/riscv/kernel/sbi_sse.c
> new file mode 100644
> index 000000000000..626912a0927d
> --- /dev/null
> +++ b/arch/riscv/kernel/sbi_sse.c
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +#include <linux/nmi.h>
> +#include <linux/scs.h>
> +#include <linux/bitfield.h>
> +#include <linux/percpu-defs.h>
> +
> +#include <asm/asm-prototypes.h>
> +#include <asm/switch_to.h>
> +#include <asm/irq_stack.h>
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
> +
> +DEFINE_PER_CPU(struct task_struct *, __sbi_sse_entry_task);
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

IE_SIE may not always be enabled in CSR_IE(for example when we disable
CONFIG_ACLINT_SSWI and use imsic for ipi). Maybe we should send ipi to
the current cpu here.

Best regards,
Xu Lu

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
> +
> +static void arch_sse_stack_cpu_sync(struct sse_event_arch_data *arch_evt=
)
> +{
> +       void *p_stack =3D arch_evt->stack;
> +       unsigned long stack =3D (unsigned long) stack_pointer_to_alloc(p_=
stack);
> +       unsigned long stack_end =3D stack + SSE_STACK_SIZE;
> +
> +       /*
> +        * Flush the tlb to avoid taking any exception when accessing the
> +        * vmapped stack inside the SSE handler
> +        */
> +       if (sse_event_is_global(arch_evt->evt_id))
> +               flush_tlb_kernel_range(stack, stack_end);
> +       else
> +               local_flush_tlb_kernel_range(stack, (unsigned long) stack=
_end);
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
> +
> +static void arch_sse_stack_cpu_sync(struct sse_event_arch_data *arch_evt=
) {}
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
> +void arch_sse_event_update_cpu(struct sse_event_arch_data *arch_evt, int=
 cpu)
> +{
> +       arch_evt->cpu_id =3D cpu;
> +       arch_evt->hart_id =3D cpuid_to_hartid_map(cpu);
> +}
> +
> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id=
,
> +                       int cpu)
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
> +       arch_sse_event_update_cpu(arch_evt, cpu);
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
> +       arch_sse_stack_cpu_sync(arch_evt);
> +
> +       sret =3D sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_REGISTER, arch_evt-=
>evt_id,
> +                        (unsigned long)handle_sse, (unsigned long)arch_e=
vt, 0,
> +                        0, 0);
> +
> +       return sbi_err_map_linux_errno(sret.error);
> +}
> diff --git a/arch/riscv/kernel/sbi_sse_entry.S b/arch/riscv/kernel/sbi_ss=
e_entry.S
> new file mode 100644
> index 000000000000..612510b98445
> --- /dev/null
> +++ b/arch/riscv/kernel/sbi_sse_entry.S
> @@ -0,0 +1,178 @@
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
> + * a7: contains a sse_event_arch_data struct pointer
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
> +#ifdef CONFIG_SMP
> +       lw t4, SSE_REG_HART_ID(a7)
> +       lw t3, SSE_REG_CPU_ID(a7)
> +
> +       bne t4, a6, .Lfind_hart_id_slowpath
> +
> +.Lcpu_id_found:
> +#else
> +       mv t3, zero
> +#endif
> +
> +       asm_per_cpu_with_cpu t2 __sbi_sse_entry_task t1 t3
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
> +       csrrw s4, CSR_SSCRATCH, x0
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
> +#ifdef CONFIG_SMP
> +.Lfind_hart_id_slowpath:
> +
> +       /* Restore current task struct from __sbi_sse_entry_task */
> +       li t1, ASM_NR_CPUS
> +       /* Slowpath to find the CPU id associated to the hart id */
> +       la t0, __cpuid_to_hartid_map
> +
> +.Lhart_id_loop:
> +       REG_L t2, 0(t0)
> +       beq t2, a6, .Lcpu_id_found
> +
> +       /* Increment pointer and CPU number */
> +       addi t3, t3, 1
> +       addi t0, t0, RISCV_SZPTR
> +       bltu t3, t1, .Lhart_id_loop
> +
> +       /*
> +        * This should never happen since we expect the hart_id to match =
one
> +        * of our CPU, but better be safe than sorry
> +        */
> +       la tp, init_task
> +       la a0, sse_hart_id_panic_string
> +       la t0, panic
> +       jalr t0
> +#endif
> +
> +SYM_CODE_END(handle_sse)
> +
> +SYM_DATA_START_LOCAL(sse_hart_id_panic_string)
> +    .ascii "Unable to match hart_id with cpu\0"
> +SYM_DATA_END(sse_hart_id_panic_string)
> --
> 2.43.0
>

