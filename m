Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB2DCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtGthQ0upOgEQqzx2TwZo3OjqznpTQZNr4AegOn3my4=; b=Vg6wu+V+F1qaFqyfvi1YJuXzyy
	RkNvJ3prOzumXbtYXkMZimVTIY7DcUa91EYYGaKlKjztg6LODpdnWynHRbce9Z+UmrNkav59F5SDR
	b3n5zQJZfz5qre7KbmAYY45TPPtedg1mRbaF6aenwdB799WEi/1+eunksaOjEzkJwsdyZz+OzsA4G
	C7wyZAXZ+cnoTdLEwFIZe/GbVjlxmMcx6fcsHFIkzp5YULJC3A0QaXqjJHbFuc7UvsC11uNXlT+qR
	5rKpBGtGbCWf0wdmOvEkzUUOd1ljYvcEcQ3zfXCtMxKDB0woOA4kq5OmewhszTs5gI5cBW8BtFCG3
	CFK3SYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfRP-00000002FLN-0LBh;
	Thu, 28 Aug 2025 16:25:35 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraAl-00000001DfF-348C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 10:48:04 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-771fa65b0e1so433783b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756378083; x=1756982883; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QtGthQ0upOgEQqzx2TwZo3OjqznpTQZNr4AegOn3my4=;
        b=IuogTAuyL4Vhur9h0Y8200CI3NXo67fIUPena1zFdodwrwYpCi+VQKev5ZMSvvjfnG
         JDw+///TZaFxODAosarvilcOVQP3lYvibwz00T7sS0SiLQbERlhXHNx8/qePtdOYZkoG
         cJ+PkyE6hHL7uM7erI1cTPd2Y/5/nYvnyzoi/u2df92eyuPBeP5NXWa6DE34EFK9sA+X
         dEqU7r7smwdAgIoCq07RshsCFhb2xaK6I5IsEYC2M8MmlR7fEQUb8/Za8xtdiZq7IJGi
         vbmj4Xr6pk2n0vWYs43QIX5hdymVyyHDOFcykc4iP6tpcRzAFkjEDuRf4xD3vD+J/Di+
         kyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756378083; x=1756982883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtGthQ0upOgEQqzx2TwZo3OjqznpTQZNr4AegOn3my4=;
        b=VauQkA3CciiewDbmdnWEW9zbkK6/t8tdUSumeuBD+HjdLqd37BKZ9L2WuBv6pTJnHe
         VpP2909/BZ88rt4UtYR0yjBNuq+IJkLULyjgGIHyr30yOMu2XYWTn5ynklx1JbDswD6M
         XYfDeG/+HRBzcklV/rX18oN7LkDYY1KtMdrgS8Q1UI2uBsULN1ajeXHKsBfky2t3W50L
         lnJ1LxgQQ8mT+TBVSFv9CMS6cIPmXHREdAQo75c6DpWNoZQGBjSWpDEG/RGwrRrCs9cE
         8JqMuoDoiv/FWncJBSBinYedR4yyAOq/UmOfGfuhYaXBfe/NwkjoF6G30c/cfn5gEh5g
         PN0g==
X-Forwarded-Encrypted: i=1; AJvYcCVEVrhLOxbl/c/WRaf54VESe7zMqRu/hBl2y9JCoFYX0EKx3YDl7NOctGnZwX3Dfzqufna7XbRm3hn6/h6llqrt@lists.infradead.org
X-Gm-Message-State: AOJu0Yzku4lJIHg1z6/sks91FHG+YO3M+JQR9ahco1hVEGj9IbW6XNRB
	CV7K57A5BbBxa3182ZN7QzNphsn+bxNy5O33+gXb311sxfOp/pwOJaB8JZy+3cmtPbM=
X-Gm-Gg: ASbGnctrPelLaqfdxbjkG+ByjfBpPGS5w4epDI9ZamaiOw4swtHAyLGv9LWvG9PzU9n
	PsYe1Jm4jvAovShAsIq8b5/fnY/9es7UJkMTRBpj2wBouqBk/OuGe1i5wY3vOcHhQOyJRsKUMCX
	D83zYq7CcczyHM2Yl/xvQ6oA6D7gFJiEwqFxIIqZ5Mv47FIYkoBoGsj0H2ldQ9RNqehpUKTuhek
	xH0VMwwYyylWLH0UaqTyi5QGYkASaS3ViuFEPq1xxyXv1W1Xlx/Hw42WEjqlgWFJ9SVIvxB0U1U
	KkSJctnLu1GK5Mbx3Fylh0dOxVcFf4QPhvx3BzOrVnwji3cEAUg++RVuofwDZfqO3UnCYhpoWdK
	hhgSOfTMKptdbJf63yGxKM3SKn3zt2Z5Dzc80rWYC/DhGfapeDGO5J6CM8+gJwh+Kv9gi8tkm/u
	PAqA==
X-Google-Smtp-Source: AGHT+IFg/4U1C4hDt6D+sol//DAeZoKYVjecS/OZxJBf4KsldAhJFeGu7S6YWjTmOrdEcSNq1kGx/g==
X-Received: by 2002:a05:6a00:66ea:b0:770:573f:fc60 with SMTP id d2e1a72fcca58-770573ffe32mr19626815b3a.0.1756378082801;
        Thu, 28 Aug 2025 03:48:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772093cac4bsm4314244b3a.12.2025.08.28.03.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 03:48:02 -0700 (PDT)
Message-ID: <15af1c5c-abab-4b2a-a32c-4933b2c325d6@rivosinc.com>
Date: Thu, 28 Aug 2025 12:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [PATCH v6 2/5] riscv: add support for SBI Supervisor
 Software Events extension
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
References: <20250808153901.2477005-1-cleger@rivosinc.com>
 <20250808153901.2477005-3-cleger@rivosinc.com>
 <CAEEQ3w=iMtePajsANgJ=imUfGyWUag2m1Y9kexHT3BDuL5+dtg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAEEQ3w=iMtePajsANgJ=imUfGyWUag2m1Y9kexHT3BDuL5+dtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_034803_784543_9365B134 
X-CRM114-Status: GOOD (  30.00  )
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



On 18/08/2025 11:08, yunhui cui wrote:
> Hi Clément,
> 
> On Fri, Aug 8, 2025 at 11:39 PM Clément Léger <cleger@rivosinc.com> wrote:
>>
>> The SBI SSE extension allows the supervisor software to be notified by
>> the SBI of specific events that are not maskable. The context switch is
>> handled partially by the firmware which will save registers a6 and a7.
>> When entering kernel we can rely on these 2 registers to setup the stack
>> and save all the registers.
>>
>> Since SSE events can be delivered at any time to the kernel (including
>> during exception handling, we need a way to locate the current_task for
>> context tracking. On RISC-V, it is sotred in scratch when in user space
>> or tp when in kernel space (in which case SSCRATCH is zero). But at a
>> at the beginning of exception handling, SSCRATCH is used to swap tp and
>> check the origin of the exception. If interrupted at that point, then,
>> there is no way to reliably know were is located the current
>> task_struct. Even checking the interruption location won't work as SSE
>> event can be nested on top of each other so the original interruption
>> site might be lost at some point. In order to retrieve it reliably,
>> store the current task in an additional __sse_entry_task per_cpu array.
>> This array is then used to retrieve the current task based on the
>> hart ID that is passed to the SSE event handler in a6.
>>
>> That being said, the way the current task struct is stored should
>> probably be reworked to find a better reliable alternative.
>>
>> Since each events (and each CPU for local events) have their own
>> context and can preempt each other, allocate a stack (and a shadow stack
>> if needed for each of them (and for each cpu for local events).
>>
>> When completing the event, if we were coming from kernel with interrupts
>> disabled, simply return there. If coming from userspace or kernel with
>> interrupts enabled, simulate an interrupt exception by setting IE_SIE in
>> CSR_IP to allow delivery of signals to user task. For instance this can
>> happen, when a RAS event has been generated by a user application and a
>> SIGBUS has been sent to a task.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/asm.h         |  14 ++-
>>  arch/riscv/include/asm/scs.h         |   7 ++
>>  arch/riscv/include/asm/sse.h         |  47 +++++++
>>  arch/riscv/include/asm/switch_to.h   |  14 +++
>>  arch/riscv/include/asm/thread_info.h |   1 +
>>  arch/riscv/kernel/Makefile           |   1 +
>>  arch/riscv/kernel/asm-offsets.c      |  14 +++
>>  arch/riscv/kernel/sse.c              | 154 +++++++++++++++++++++++
>>  arch/riscv/kernel/sse_entry.S        | 180 +++++++++++++++++++++++++++
>>  9 files changed, 429 insertions(+), 3 deletions(-)
>>  create mode 100644 arch/riscv/include/asm/sse.h
>>  create mode 100644 arch/riscv/kernel/sse.c
>>  create mode 100644 arch/riscv/kernel/sse_entry.S
>>
>> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
>> index a8a2af6dfe9d..982c4be9a9c3 100644
>> --- a/arch/riscv/include/asm/asm.h
>> +++ b/arch/riscv/include/asm/asm.h
>> @@ -90,16 +90,24 @@
>>  #define PER_CPU_OFFSET_SHIFT 3
>>  #endif
>>
>> -.macro asm_per_cpu dst sym tmp
>> -       REG_L \tmp, TASK_TI_CPU_NUM(tp)
>> -       slli  \tmp, \tmp, PER_CPU_OFFSET_SHIFT
>> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
>> +       slli  \tmp, \cpu, PER_CPU_OFFSET_SHIFT
>>         la    \dst, __per_cpu_offset
>>         add   \dst, \dst, \tmp
>>         REG_L \tmp, 0(\dst)
>>         la    \dst, \sym
>>         add   \dst, \dst, \tmp
>>  .endm
>> +
>> +.macro asm_per_cpu dst sym tmp
>> +       REG_L \tmp, TASK_TI_CPU_NUM(tp)
>> +       asm_per_cpu_with_cpu \dst \sym \tmp \tmp
>> +.endm
>>  #else /* CONFIG_SMP */
>> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
>> +       la    \dst, \sym
>> +.endm
>> +
>>  .macro asm_per_cpu dst sym tmp
>>         la    \dst, \sym
>>  .endm
>> diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
>> index 0e45db78b24b..62344daad73d 100644
>> --- a/arch/riscv/include/asm/scs.h
>> +++ b/arch/riscv/include/asm/scs.h
>> @@ -18,6 +18,11 @@
>>         load_per_cpu gp, irq_shadow_call_stack_ptr, \tmp
>>  .endm
>>
>> +/* Load the per-CPU IRQ shadow call stack to gp. */
>> +.macro scs_load_sse_stack reg_evt
>> +       REG_L gp, SSE_REG_EVT_SHADOW_STACK(\reg_evt)
>> +.endm
>> +
>>  /* Load task_scs_sp(current) to gp. */
>>  .macro scs_load_current
>>         REG_L   gp, TASK_TI_SCS_SP(tp)
>> @@ -41,6 +46,8 @@
>>  .endm
>>  .macro scs_load_irq_stack tmp
>>  .endm
>> +.macro scs_load_sse_stack reg_evt
>> +.endm
>>  .macro scs_load_current
>>  .endm
>>  .macro scs_load_current_if_task_changed prev
>> diff --git a/arch/riscv/include/asm/sse.h b/arch/riscv/include/asm/sse.h
>> new file mode 100644
>> index 000000000000..8929a268462c
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/sse.h
>> @@ -0,0 +1,47 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024 Rivos Inc.
>> + */
>> +#ifndef __ASM_SSE_H
>> +#define __ASM_SSE_H
>> +
>> +#include <asm/sbi.h>
>> +
>> +#ifdef CONFIG_RISCV_SSE
>> +
>> +struct sse_event_interrupted_state {
>> +       unsigned long a6;
>> +       unsigned long a7;
>> +};
>> +
>> +struct sse_event_arch_data {
>> +       void *stack;
>> +       void *shadow_stack;
>> +       unsigned long tmp;
>> +       struct sse_event_interrupted_state interrupted;
>> +       unsigned long interrupted_phys;
>> +       u32 evt_id;
>> +       unsigned int hart_id;
>> +       unsigned int cpu_id;
>> +};
>> +
>> +static inline bool sse_event_is_global(u32 evt)
>> +{
>> +       return !!(evt & SBI_SSE_EVENT_GLOBAL);
>> +}
>> +
>> +void arch_sse_event_update_cpu(struct sse_event_arch_data *arch_evt, int cpu);
>> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id,
>> +                       int cpu);
>> +void arch_sse_free_event(struct sse_event_arch_data *arch_evt);
>> +int arch_sse_register_event(struct sse_event_arch_data *arch_evt);
>> +
>> +void sse_handle_event(struct sse_event_arch_data *arch_evt,
>> +                     struct pt_regs *regs);
>> +asmlinkage void handle_sse(void);
>> +asmlinkage void do_sse(struct sse_event_arch_data *arch_evt,
>> +                      struct pt_regs *reg);
>> +
>> +#endif
>> +
>> +#endif
>> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
>> index 0e71eb82f920..cd1cead0c682 100644
>> --- a/arch/riscv/include/asm/switch_to.h
>> +++ b/arch/riscv/include/asm/switch_to.h
>> @@ -88,6 +88,19 @@ static inline void __switch_to_envcfg(struct task_struct *next)
>>                         :: "r" (next->thread.envcfg) : "memory");
>>  }
>>
>> +#ifdef CONFIG_RISCV_SSE
>> +DECLARE_PER_CPU(struct task_struct *, __sse_entry_task);
>> +
>> +static inline void __switch_sse_entry_task(struct task_struct *next)
>> +{
>> +       __this_cpu_write(__sse_entry_task, next);
>> +}
>> +#else
>> +static inline void __switch_sse_entry_task(struct task_struct *next)
>> +{
>> +}
>> +#endif
>> +
>>  extern struct task_struct *__switch_to(struct task_struct *,
>>                                        struct task_struct *);
>>
>> @@ -122,6 +135,7 @@ do {                                                        \
>>         if (switch_to_should_flush_icache(__next))      \
>>                 local_flush_icache_all();               \
>>         __switch_to_envcfg(__next);                     \
>> +       __switch_sse_entry_task(__next);                        \
>>         ((last) = __switch_to(__prev, __next));         \
>>  } while (0)
>>
>> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>> index f5916a70879a..28e9805e61fc 100644
>> --- a/arch/riscv/include/asm/thread_info.h
>> +++ b/arch/riscv/include/asm/thread_info.h
>> @@ -36,6 +36,7 @@
>>  #define OVERFLOW_STACK_SIZE     SZ_4K
>>
>>  #define IRQ_STACK_SIZE         THREAD_SIZE
>> +#define SSE_STACK_SIZE         THREAD_SIZE
>>
>>  #ifndef __ASSEMBLY__
>>
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index c7b542573407..62e4490b34ee 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -99,6 +99,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)  += mcount-dyn.o
>>  obj-$(CONFIG_PERF_EVENTS)      += perf_callchain.o
>>  obj-$(CONFIG_HAVE_PERF_REGS)   += perf_regs.o
>>  obj-$(CONFIG_RISCV_SBI)                += sbi.o sbi_ecall.o
>> +obj-$(CONFIG_RISCV_SSE)                += sse.o sse_entry.o
>>  ifeq ($(CONFIG_RISCV_SBI), y)
>>  obj-$(CONFIG_SMP)              += sbi-ipi.o
>>  obj-$(CONFIG_SMP) += cpu_ops_sbi.o
>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>> index 6e8c0d6feae9..315547c3a2ef 100644
>> --- a/arch/riscv/kernel/asm-offsets.c
>> +++ b/arch/riscv/kernel/asm-offsets.c
>> @@ -14,6 +14,8 @@
>>  #include <asm/ptrace.h>
>>  #include <asm/cpu_ops_sbi.h>
>>  #include <asm/stacktrace.h>
>> +#include <asm/sbi.h>
>> +#include <asm/sse.h>
>>  #include <asm/suspend.h>
>>
>>  void asm_offsets(void);
>> @@ -528,4 +530,16 @@ void asm_offsets(void)
>>         DEFINE(FREGS_A6,            offsetof(struct __arch_ftrace_regs, a6));
>>         DEFINE(FREGS_A7,            offsetof(struct __arch_ftrace_regs, a7));
>>  #endif
>> +
>> +#ifdef CONFIG_RISCV_SSE
>> +       OFFSET(SSE_REG_EVT_STACK, sse_event_arch_data, stack);
>> +       OFFSET(SSE_REG_EVT_SHADOW_STACK, sse_event_arch_data, shadow_stack);
>> +       OFFSET(SSE_REG_EVT_TMP, sse_event_arch_data, tmp);
>> +       OFFSET(SSE_REG_HART_ID, sse_event_arch_data, hart_id);
>> +       OFFSET(SSE_REG_CPU_ID, sse_event_arch_data, cpu_id);
>> +
>> +       DEFINE(SBI_EXT_SSE, SBI_EXT_SSE);
>> +       DEFINE(SBI_SSE_EVENT_COMPLETE, SBI_SSE_EVENT_COMPLETE);
>> +       DEFINE(ASM_NR_CPUS, NR_CPUS);
>> +#endif
>>  }
>> diff --git a/arch/riscv/kernel/sse.c b/arch/riscv/kernel/sse.c
>> new file mode 100644
>> index 000000000000..d2da7e23a74a
>> --- /dev/null
>> +++ b/arch/riscv/kernel/sse.c
>> @@ -0,0 +1,154 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (C) 2024 Rivos Inc.
>> + */
>> +#include <linux/nmi.h>
>> +#include <linux/scs.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/riscv_sse.h>
>> +#include <linux/percpu-defs.h>
>> +
>> +#include <asm/asm-prototypes.h>
>> +#include <asm/switch_to.h>
>> +#include <asm/irq_stack.h>
>> +#include <asm/sbi.h>
>> +#include <asm/sse.h>
>> +
>> +DEFINE_PER_CPU(struct task_struct *, __sse_entry_task);
>> +
>> +void __weak sse_handle_event(struct sse_event_arch_data *arch_evt, struct pt_regs *regs)
>> +{
>> +}
>> +
>> +void do_sse(struct sse_event_arch_data *arch_evt, struct pt_regs *regs)
>> +{
>> +       nmi_enter();
>> +
>> +       /* Retrieve missing GPRs from SBI */
>> +       sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, arch_evt->evt_id,
>> +                 SBI_SSE_ATTR_INTERRUPTED_A6,
>> +                 (SBI_SSE_ATTR_INTERRUPTED_A7 - SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
>> +                 arch_evt->interrupted_phys, 0, 0);
>> +
>> +       memcpy(&regs->a6, &arch_evt->interrupted, sizeof(arch_evt->interrupted));
>> +
>> +       sse_handle_event(arch_evt, regs);
>> +
>> +       /*
>> +        * The SSE delivery path does not uses the "standard" exception path
>> +        * (see sse_entry.S) and does not process any pending signal/softirqs
>> +        * due to being similar to a NMI.
>> +        * Some drivers (PMU, RAS) enqueue pending work that needs to be handled
>> +        * as soon as possible by bottom halves. For that purpose, set the SIP
>> +        * software interrupt pending bit which will force a software interrupt
>> +        * to be serviced once interrupts are reenabled in the interrupted
>> +        * context if they were masked or directly if unmasked.
>> +        */
>> +       csr_set(CSR_IP, IE_SIE);
> 
> When using perf record, will S mode interrupts experience starvation?

It shouldn't starve the other interrupts since after returning to S-mode
(before servicing the interrupt), the hart will still be able to set
other interrupts as pending which will be serviced as well I think. At
least, I did not observed anything indicating that S-mode was not
servicing interrupts anymore.

Clément

> 
>> +
>> +       nmi_exit();
>> +}
>> +
>> +static void *alloc_to_stack_pointer(void *alloc)
>> +{
>> +       return alloc ? alloc + SSE_STACK_SIZE : NULL;
>> +}
>> +
>> +static void *stack_pointer_to_alloc(void *stack)
>> +{
>> +       return stack - SSE_STACK_SIZE;
>> +}
>> +
>> +#ifdef CONFIG_VMAP_STACK
>> +static void *sse_stack_alloc(unsigned int cpu)
>> +{
>> +       void *stack = arch_alloc_vmap_stack(SSE_STACK_SIZE, cpu_to_node(cpu));
>> +
>> +       return alloc_to_stack_pointer(stack);
>> +}
>> +
>> +static void sse_stack_free(void *stack)
>> +{
>> +       vfree(stack_pointer_to_alloc(stack));
>> +}
>> +#else /* CONFIG_VMAP_STACK */
>> +static void *sse_stack_alloc(unsigned int cpu)
>> +{
>> +       void *stack = kmalloc(SSE_STACK_SIZE, GFP_KERNEL);
>> +
>> +       return alloc_to_stack_pointer(stack);
>> +}
>> +
>> +static void sse_stack_free(void *stack)
>> +{
>> +       kfree(stack_pointer_to_alloc(stack));
>> +}
>> +#endif /* CONFIG_VMAP_STACK */
>> +
>> +static int sse_init_scs(int cpu, struct sse_event_arch_data *arch_evt)
>> +{
>> +       void *stack;
>> +
>> +       if (!scs_is_enabled())
>> +               return 0;
>> +
>> +       stack = scs_alloc(cpu_to_node(cpu));
>> +       if (!stack)
>> +               return -ENOMEM;
>> +
>> +       arch_evt->shadow_stack = stack;
>> +
>> +       return 0;
>> +}
>> +
>> +void arch_sse_event_update_cpu(struct sse_event_arch_data *arch_evt, int cpu)
>> +{
>> +       arch_evt->cpu_id = cpu;
>> +       arch_evt->hart_id = cpuid_to_hartid_map(cpu);
>> +}
>> +
>> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id, int cpu)
>> +{
>> +       void *stack;
>> +
>> +       arch_evt->evt_id = evt_id;
>> +       stack = sse_stack_alloc(cpu);
>> +       if (!stack)
>> +               return -ENOMEM;
>> +
>> +       arch_evt->stack = stack;
>> +
>> +       if (sse_init_scs(cpu, arch_evt)) {
>> +               sse_stack_free(arch_evt->stack);
>> +               return -ENOMEM;
>> +       }
>> +
>> +       if (sse_event_is_global(evt_id)) {
>> +               arch_evt->interrupted_phys =
>> +                                       virt_to_phys(&arch_evt->interrupted);
>> +       } else {
>> +               arch_evt->interrupted_phys =
>> +                               per_cpu_ptr_to_phys(&arch_evt->interrupted);
>> +       }
>> +
>> +       arch_sse_event_update_cpu(arch_evt, cpu);
>> +
>> +       return 0;
>> +}
>> +
>> +void arch_sse_free_event(struct sse_event_arch_data *arch_evt)
>> +{
>> +       scs_free(arch_evt->shadow_stack);
>> +       sse_stack_free(arch_evt->stack);
>> +}
>> +
>> +int arch_sse_register_event(struct sse_event_arch_data *arch_evt)
>> +{
>> +       struct sbiret sret;
>> +
>> +       sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_REGISTER, arch_evt->evt_id,
>> +                        (unsigned long)handle_sse, (unsigned long)arch_evt, 0,
>> +                        0, 0);
>> +
>> +       return sbi_err_map_linux_errno(sret.error);
>> +}
> ...
> 
> Thanks,
> Yunhui


