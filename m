Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4771C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvplvBpIvMrJNBMe1rg+rn4cM0qfTbIxuzpZRhAALwg=; b=AakpyCV0nepW1YV9TtczFMVxyt
	turp/d1MicjHmXpQeqUi3xS7R10hNcl7QsmcC3VodlYxRLkNuXPtbHyLJZwiC02Q4e9EjxSzOcFb4
	ks0HnvEAkFAqiNE+tIwGDV2QQmPa6jaGuqQ3fEERUubMcqg65x8x6yxopBD8Xx0gerag2YOUQDSHQ
	xegMDDLYrRcRwEG5Libd4+StXYDgSQIsMFmoR58YrqjZB3g6NvvJPUqR+SMB5Q7wXb4dDmYIgQ6/p
	pbFvv8wrYU0azn9v9eslXNuLwPELx7h++xLCG6os2O/vttSaTf5PBlDwwv/aeB9ySg0ljIt4XzLQp
	Xsq/8uPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tasnQ-0000000C0su-27cB;
	Thu, 23 Jan 2025 08:42:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tasm7-0000000C0ce-0zqf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 08:41:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43626213fffso11314715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 00:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737621677; x=1738226477; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvplvBpIvMrJNBMe1rg+rn4cM0qfTbIxuzpZRhAALwg=;
        b=w4/77wBD9wgILZx/Ak/wVjwZmf5nbAnru56C2Jp4ma3iMT9hVfmnxvwrzuMdZCcztS
         3YF77QpWUEjdJLEX9qteH+pEbKEB2nM4uYUS6MhQv1q36/BpYJjE9HMwjEJrCVX2PdOj
         4kGqdZUcuO3nG64Nzu9Miq1XSaO0tt2LmONG0dV4OnsdFux9EvbqYt8Ms/oMWTMFZlQd
         +atV/3C6yXY+abTsgwA0Mj9v3YmKvSxii0deilXHwpfaRzjUCJribBbHal8beoWlNhs4
         /6HWUj4NKksNT2Pum+KlLzFD4NUj3e8SGyia3u1ZIM8Sr/Jv0D46AaD0ElO+q+ZoTrFO
         LckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737621677; x=1738226477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvplvBpIvMrJNBMe1rg+rn4cM0qfTbIxuzpZRhAALwg=;
        b=laNmEwNkqjvvtRtgdZeMoMez+7QY7xzBhUzq9bDhbQKAW+Bv2uGyWSiWXZD3YvG1iN
         D5EMnXs4wfijmjNGy5dSnm5V7SpyA/hqXvYpSf62fxXUNSr/d0ozziNDRILqA/eGor0n
         CBAWFYCIa/HnytIbqIuV8jzaA6LIjnqw+e1CEOg3cPqVSb/VtPfnyChtQG5XPonccVwn
         ieEnXlutELjyIajbX9rxv6puCNW/e0gELutcIFU5FN5qD2dqRy8rDMM8TqXNENAd0mJV
         HDcRO2WNK5dbEdV+e9xMDgSI/5y/p1Eaiw8JubPAjiBy8YXYNDuwmzxgADm/URnH0zht
         U/mw==
X-Forwarded-Encrypted: i=1; AJvYcCWlSSrYhoy6s9yTPRww+spl4narp3AHJXWMdXzufsCTQPSfENwuV4dtnx+Li34Gk9DzvtU//r/jvrIUrnYAlOEe@lists.infradead.org
X-Gm-Message-State: AOJu0YzcOBqufEtVZSF7EFLHzJE8hicpWd1Y9nk/OFDEWTQ4p2Kdy23c
	74EEhr9wpuVh6KoCf8rSvx4LJY2+M5u0e1qnE1iSktea865kLzBVKjhc+6+Um4Q=
X-Gm-Gg: ASbGncvCeMBY2uqvA5iqc2GudAPKY9u5biWHgm1Rp6lQJ3HDqsKFVN58ulCUaKEeSNQ
	FaXYBoOApNwWvPYlyTINeBitMHPE/I89SP71CjPSqebOl2N7dDHoztRkR5iSOSygkkrbiPEsXxG
	ASbnE8JimkCQrie0xHgARHzF3bdthKSuebB0NZnjSdY9LFUlVvgfWujpqjWDLf2Pl+Z6/MWD/BM
	psrSpzT8b7nzIazbS7abam+X+Nzrg2KwNv+++Xcj5cCdgo916Vm0PMAa+3AZr+HqTSxzO4GgbCq
	/MYrqSbOIYv1Ll/GU6uHUUVZaC/yhB4r55fnk+NoCVGK7ufFkQ==
X-Google-Smtp-Source: AGHT+IHhwAmNZoUeficiuAAjJfzCyuneM2Rpkd6FNU4i2R0s+9P0fHGg9D8UwaHjm0jBa7Xz/EkHZA==
X-Received: by 2002:a05:6000:188e:b0:386:3213:5b80 with SMTP id ffacd0b85a97d-38c22283846mr2078707f8f.24.1737621677391;
        Thu, 23 Jan 2025 00:41:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32222ebsm18331190f8f.40.2025.01.23.00.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 00:41:16 -0800 (PST)
Message-ID: <bfd24f0b-8dd1-4565-a267-fcedb2e3bbfd@rivosinc.com>
Date: Thu, 23 Jan 2025 09:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
 <a21df8a8-a50f-49df-a098-69faa51ed8cb@ghiti.fr>
 <1c06970a-3bd4-4eb3-812c-0ea361987668@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <1c06970a-3bd4-4eb3-812c-0ea361987668@ghiti.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_004119_283657_FCD232F9 
X-CRM114-Status: GOOD (  29.73  )
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



On 22/01/2025 13:23, Alexandre Ghiti wrote:
> BTW, shouldn't we "detect" the SSE extension like we do for other SBI
> extensions (I don't know if we do that for all of them though)? Not that
> it seems needed but maybe as a way to visualize that SBI supports it?

This part is done in the drivers/firmware driver. This patch is
basically the arch support for SSE (ie stack setup, registers, entry)
and does nothing on its own. The driver/firmware part handles all the
upper level logic to register/enable/etc the events and checks for the
availability of the SSE extension.

Thanks,

Clément

> 
> Thanks,
> 
> Alex
> 
> On 22/01/2025 13:15, Alexandre Ghiti wrote:
>> Hi Clément,
>>
>> On 06/12/2024 17:30, Clément Léger wrote:
>>> The SBI SSE extension allows the supervisor software to be notified by
>>> the SBI of specific events that are not maskable. The context switch is
>>> handled partially by the firmware which will save registers a6 and a7.
>>> When entering kernel we can rely on these 2 registers to setup the stack
>>> and save all the registers.
>>>
>>> Since SSE events can be delivered at any time to the kernel (including
>>> during exception handling, we need a way to locate the current_task for
>>> context tracking. On RISC-V, it is sotred in scratch when in user space
>>> or tp when in kernel space (in which case SSCRATCH is zero). But at a
>>> at the beginning of exception handling, SSCRATCH is used to swap tp and
>>> check the origin of the exception. If interrupted at that point, then,
>>> there is no way to reliably know were is located the current
>>> task_struct. Even checking the interruption location won't work as SSE
>>> event can be nested on top of each other so the original interruption
>>> site might be lost at some point. In order to retrieve it reliably,
>>> store the current task in an additionnal __sse_entry_task per_cpu array.
>>> This array is then used to retrieve the current task based on the
>>> hart ID that is passed to the SSE event handler in a6.
>>>
>>> That being said, the way the current task struct is stored should
>>> probably be reworked to find a better reliable alternative.
>>>
>>> Since each events (and each CPU for local events) have their own
>>> context and can preempt each other, allocate a stack (and a shadow stack
>>> if needed for each of them (and for each cpu for local events).
>>>
>>> When completing the event, if we were coming from kernel with interrupts
>>> disabled, simply return there. If coming from userspace or kernel with
>>> interrupts enabled, simulate an interrupt exception by setting IE_SIE in
>>> CSR_IP to allow delivery of signals to user task. For instance this can
>>> happen, when a RAS event has been generated by a user application and a
>>> SIGBUS has been sent to a task.
>>
>>
>> Nit: there are some typos in the commit log and missing ')'.
>>
>>
>>>
>>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>>> ---
>>>   arch/riscv/include/asm/asm.h         |  14 ++-
>>>   arch/riscv/include/asm/scs.h         |   7 ++
>>>   arch/riscv/include/asm/sse.h         |  38 ++++++
>>>   arch/riscv/include/asm/switch_to.h   |  14 +++
>>>   arch/riscv/include/asm/thread_info.h |   1 +
>>>   arch/riscv/kernel/Makefile           |   1 +
>>>   arch/riscv/kernel/asm-offsets.c      |  12 ++
>>>   arch/riscv/kernel/sse.c              | 134 +++++++++++++++++++++
>>>   arch/riscv/kernel/sse_entry.S        | 171 +++++++++++++++++++++++++++
>>>   9 files changed, 389 insertions(+), 3 deletions(-)
>>>   create mode 100644 arch/riscv/include/asm/sse.h
>>>   create mode 100644 arch/riscv/kernel/sse.c
>>>   create mode 100644 arch/riscv/kernel/sse_entry.S
>>>
>>> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
>>> index 776354895b81..de8427c58f02 100644
>>> --- a/arch/riscv/include/asm/asm.h
>>> +++ b/arch/riscv/include/asm/asm.h
>>> @@ -89,16 +89,24 @@
>>>   #define PER_CPU_OFFSET_SHIFT 3
>>>   #endif
>>>   -.macro asm_per_cpu dst sym tmp
>>> -    REG_L \tmp, TASK_TI_CPU_NUM(tp)
>>> -    slli  \tmp, \tmp, PER_CPU_OFFSET_SHIFT
>>> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
>>> +    slli  \tmp, \cpu, PER_CPU_OFFSET_SHIFT
>>>       la    \dst, __per_cpu_offset
>>>       add   \dst, \dst, \tmp
>>>       REG_L \tmp, 0(\dst)
>>>       la    \dst, \sym
>>>       add   \dst, \dst, \tmp
>>>   .endm
>>> +
>>> +.macro asm_per_cpu dst sym tmp
>>> +    REG_L \tmp, TASK_TI_CPU_NUM(tp)
>>> +    asm_per_cpu_with_cpu \dst \sym \tmp \tmp
>>> +.endm
>>>   #else /* CONFIG_SMP */
>>> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
>>> +    la    \dst, \sym
>>> +.endm
>>> +
>>>   .macro asm_per_cpu dst sym tmp
>>>       la    \dst, \sym
>>>   .endm
>>> diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
>>> index 0e45db78b24b..62344daad73d 100644
>>> --- a/arch/riscv/include/asm/scs.h
>>> +++ b/arch/riscv/include/asm/scs.h
>>> @@ -18,6 +18,11 @@
>>>       load_per_cpu gp, irq_shadow_call_stack_ptr, \tmp
>>>   .endm
>>>   +/* Load the per-CPU IRQ shadow call stack to gp. */
>>> +.macro scs_load_sse_stack reg_evt
>>> +    REG_L gp, SSE_REG_EVT_SHADOW_STACK(\reg_evt)
>>> +.endm
>>> +
>>>   /* Load task_scs_sp(current) to gp. */
>>>   .macro scs_load_current
>>>       REG_L    gp, TASK_TI_SCS_SP(tp)
>>> @@ -41,6 +46,8 @@
>>>   .endm
>>>   .macro scs_load_irq_stack tmp
>>>   .endm
>>> +.macro scs_load_sse_stack reg_evt
>>> +.endm
>>>   .macro scs_load_current
>>>   .endm
>>>   .macro scs_load_current_if_task_changed prev
>>> diff --git a/arch/riscv/include/asm/sse.h b/arch/riscv/include/asm/sse.h
>>> new file mode 100644
>>> index 000000000000..431a19d4cd9c
>>> --- /dev/null
>>> +++ b/arch/riscv/include/asm/sse.h
>>> @@ -0,0 +1,38 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (C) 2024 Rivos Inc.
>>> + */
>>> +#ifndef __ASM_SSE_H
>>> +#define __ASM_SSE_H
>>> +
>>> +#ifdef CONFIG_RISCV_SSE
>>> +
>>> +struct sse_event_interrupted_state {
>>> +    unsigned long a6;
>>> +    unsigned long a7;
>>> +};
>>> +
>>> +struct sse_event_arch_data {
>>> +    void *stack;
>>> +    void *shadow_stack;
>>> +    unsigned long tmp;
>>> +    struct sse_event_interrupted_state interrupted;
>>> +    unsigned long interrupted_state_phys;
>>> +    u32 evt_id;
>>> +};
>>> +
>>> +struct sse_registered_event;
>>> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32
>>> evt_id,
>>> +            int cpu);
>>> +void arch_sse_free_event(struct sse_event_arch_data *arch_evt);
>>> +int arch_sse_register_event(struct sse_event_arch_data *arch_evt);
>>> +
>>> +void sse_handle_event(struct sse_event_arch_data *arch_evt,
>>> +              struct pt_regs *regs);
>>> +asmlinkage void handle_sse(void);
>>> +asmlinkage void do_sse(struct sse_event_arch_data *arch_evt,
>>> +                struct pt_regs *reg);
>>> +
>>> +#endif
>>> +
>>> +#endif
>>> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/
>>> asm/switch_to.h
>>> index 94e33216b2d9..e166fabe04ab 100644
>>> --- a/arch/riscv/include/asm/switch_to.h
>>> +++ b/arch/riscv/include/asm/switch_to.h
>>> @@ -88,6 +88,19 @@ static inline void __switch_to_envcfg(struct
>>> task_struct *next)
>>>               :: "r" (next->thread.envcfg) : "memory");
>>>   }
>>>   +#ifdef CONFIG_RISCV_SSE
>>> +DECLARE_PER_CPU(struct task_struct *, __sse_entry_task);
>>> +
>>> +static inline void __switch_sse_entry_task(struct task_struct *next)
>>> +{
>>> +    __this_cpu_write(__sse_entry_task, next);
>>> +}
>>> +#else
>>> +static inline void __switch_sse_entry_task(struct task_struct *next)
>>> +{
>>> +}
>>> +#endif
>>> +
>>>   extern struct task_struct *__switch_to(struct task_struct *,
>>>                          struct task_struct *);
>>>   @@ -122,6 +135,7 @@ do {                            \
>>>       if (switch_to_should_flush_icache(__next))    \
>>>           local_flush_icache_all();        \
>>>       __switch_to_envcfg(__next);            \
>>> +    __switch_sse_entry_task(__next);            \
>>>       ((last) = __switch_to(__prev, __next));        \
>>>   } while (0)
>>>   diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/
>>> include/asm/thread_info.h
>>> index f5916a70879a..28e9805e61fc 100644
>>> --- a/arch/riscv/include/asm/thread_info.h
>>> +++ b/arch/riscv/include/asm/thread_info.h
>>> @@ -36,6 +36,7 @@
>>>   #define OVERFLOW_STACK_SIZE     SZ_4K
>>>     #define IRQ_STACK_SIZE        THREAD_SIZE
>>> +#define SSE_STACK_SIZE        THREAD_SIZE
>>>     #ifndef __ASSEMBLY__
>>>   diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>>> index 063d1faf5a53..1e8fb83b1162 100644
>>> --- a/arch/riscv/kernel/Makefile
>>> +++ b/arch/riscv/kernel/Makefile
>>> @@ -99,6 +99,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)    += mcount-dyn.o
>>>   obj-$(CONFIG_PERF_EVENTS)    += perf_callchain.o
>>>   obj-$(CONFIG_HAVE_PERF_REGS)    += perf_regs.o
>>>   obj-$(CONFIG_RISCV_SBI)        += sbi.o sbi_ecall.o
>>> +obj-$(CONFIG_RISCV_SSE)        += sse.o sse_entry.o
>>>   ifeq ($(CONFIG_RISCV_SBI), y)
>>>   obj-$(CONFIG_SMP)        += sbi-ipi.o
>>>   obj-$(CONFIG_SMP) += cpu_ops_sbi.o
>>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-
>>> offsets.c
>>> index e89455a6a0e5..60590a3d9519 100644
>>> --- a/arch/riscv/kernel/asm-offsets.c
>>> +++ b/arch/riscv/kernel/asm-offsets.c
>>> @@ -14,6 +14,8 @@
>>>   #include <asm/ptrace.h>
>>>   #include <asm/cpu_ops_sbi.h>
>>>   #include <asm/stacktrace.h>
>>> +#include <asm/sbi.h>
>>> +#include <asm/sse.h>
>>>   #include <asm/suspend.h>
>>>     void asm_offsets(void);
>>> @@ -511,4 +513,14 @@ void asm_offsets(void)
>>>       DEFINE(FREGS_A6,        offsetof(struct __arch_ftrace_regs, a6));
>>>       DEFINE(FREGS_A7,        offsetof(struct __arch_ftrace_regs, a7));
>>>   #endif
>>> +
>>> +#ifdef CONFIG_RISCV_SSE
>>> +    OFFSET(SSE_REG_EVT_STACK, sse_event_arch_data, stack);
>>> +    OFFSET(SSE_REG_EVT_SHADOW_STACK, sse_event_arch_data,
>>> shadow_stack);
>>> +    OFFSET(SSE_REG_EVT_TMP, sse_event_arch_data, tmp);
>>> +
>>> +    DEFINE(SBI_EXT_SSE, SBI_EXT_SSE);
>>> +    DEFINE(SBI_SSE_EVENT_COMPLETE, SBI_SSE_EVENT_COMPLETE);
>>> +    DEFINE(NR_CPUS, NR_CPUS);
>>> +#endif
>>>   }
>>> diff --git a/arch/riscv/kernel/sse.c b/arch/riscv/kernel/sse.c
>>> new file mode 100644
>>> index 000000000000..b48ae69dad8d
>>> --- /dev/null
>>> +++ b/arch/riscv/kernel/sse.c
>>> @@ -0,0 +1,134 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Copyright (C) 2024 Rivos Inc.
>>> + */
>>> +#include <linux/nmi.h>
>>> +#include <linux/scs.h>
>>> +#include <linux/bitfield.h>
>>> +#include <linux/riscv_sse.h>
>>> +#include <linux/percpu-defs.h>
>>> +
>>> +#include <asm/asm-prototypes.h>
>>> +#include <asm/switch_to.h>
>>> +#include <asm/irq_stack.h>
>>> +#include <asm/sbi.h>
>>> +#include <asm/sse.h>
>>> +
>>> +DEFINE_PER_CPU(struct task_struct *, __sse_entry_task);
>>> +
>>> +void __weak sse_handle_event(struct sse_event_arch_data *arch_evt,
>>> struct pt_regs *regs)
>>> +{
>>> +}
>>> +
>>> +void do_sse(struct sse_event_arch_data *arch_evt, struct pt_regs *regs)
>>> +{
>>> +    nmi_enter();
>>> +
>>> +    /* Retrieve missing GPRs from SBI */
>>> +    sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, arch_evt->evt_id,
>>> +          SBI_SSE_ATTR_INTERRUPTED_A6,
>>> +          (SBI_SSE_ATTR_INTERRUPTED_A7 -
>>> SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
>>> +          arch_evt->interrupted_state_phys, 0, 0);
>>> +
>>> +    memcpy(&regs->a6, &arch_evt->interrupted, sizeof(arch_evt-
>>> >interrupted));
>>> +
>>> +    sse_handle_event(arch_evt, regs);
>>> +
>>> +    /*
>>> +     * The SSE delivery path does not uses the "standard" exception
>>> path and
>>> +     * thus does not process any pending signal/softirqs. Some
>>> drivers might
>>> +     * enqueue pending work that needs to be handled as soon as
>>> possible.
>>> +     * For that purpose, set the software interrupt pending bit
>>> which will
>>> +     * be serviced once interrupts are reenabled
>>> +     */
>>> +    csr_set(CSR_IP, IE_SIE);
>>
>>
>> This looks a bit hackish and under performant to trigger an IRQ at
>> each SSE event, why is it necessary? I understand that we may want to
>> service signals right away, for example in case of a uncorrectable
>> memory error in order to send a SIGBUS to the process before it goes
>> on, but why should we care about softirqs here?
>>
>>
>>> +
>>> +    nmi_exit();
>>> +}
>>> +
>>> +#ifdef CONFIG_VMAP_STACK
>>> +static unsigned long *sse_stack_alloc(unsigned int cpu, unsigned int
>>> size)
>>> +{
>>> +    return arch_alloc_vmap_stack(size, cpu_to_node(cpu));
>>> +}
>>> +
>>> +static void sse_stack_free(unsigned long *stack)
>>> +{
>>> +    vfree(stack);
>>> +}
>>> +#else /* CONFIG_VMAP_STACK */
>>> +
>>> +static unsigned long *sse_stack_alloc(unsigned int cpu, unsigned int
>>> size)
>>> +{
>>> +    return kmalloc(size, GFP_KERNEL);
>>> +}
>>> +
>>> +static void sse_stack_free(unsigned long *stack)
>>> +{
>>> +    kfree(stack);
>>> +}
>>> +
>>> +#endif /* CONFIG_VMAP_STACK */
>>
>>
>> Can't we use kvmalloc() here to avoid the #ifdef? Or is there a real
>> benefit of using vmalloced stacks?
>>
>>
>>> +
>>> +static int sse_init_scs(int cpu, struct sse_event_arch_data *arch_evt)
>>> +{
>>> +    void *stack;
>>> +
>>> +    if (!scs_is_enabled())
>>> +        return 0;
>>> +
>>> +    stack = scs_alloc(cpu_to_node(cpu));
>>> +    if (!stack)
>>> +        return 1;
>>
>>
>> Nit: return -ENOMEM
>>
>>
>>> +
>>> +    arch_evt->shadow_stack = stack;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32
>>> evt_id, int cpu)
>>> +{
>>> +    void *stack;
>>> +
>>> +    arch_evt->evt_id = evt_id;
>>> +    stack = sse_stack_alloc(cpu, SSE_STACK_SIZE);
>>> +    if (!stack)
>>> +        return -ENOMEM;
>>> +
>>> +    arch_evt->stack = stack + SSE_STACK_SIZE;
>>> +
>>> +    if (sse_init_scs(cpu, arch_evt))
>>> +        goto free_stack;
>>> +
>>> +    if (is_kernel_percpu_address((unsigned long)&arch_evt-
>>> >interrupted)) {
>>> +        arch_evt->interrupted_state_phys =
>>> + per_cpu_ptr_to_phys(&arch_evt->interrupted);
>>> +    } else {
>>> +        arch_evt->interrupted_state_phys =
>>> +                virt_to_phys(&arch_evt->interrupted);
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +free_stack:
>>> +    sse_stack_free(arch_evt->stack - SSE_STACK_SIZE);
>>> +
>>> +    return -ENOMEM;
>>> +}
>>> +
>>> +void arch_sse_free_event(struct sse_event_arch_data *arch_evt)
>>> +{
>>> +    scs_free(arch_evt->shadow_stack);
>>> +    sse_stack_free(arch_evt->stack - SSE_STACK_SIZE);
>>> +}
>>> +
>>> +int arch_sse_register_event(struct sse_event_arch_data *arch_evt)
>>> +{
>>> +    struct sbiret sret;
>>> +
>>> +    sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_REGISTER, arch_evt-
>>> >evt_id,
>>> +             (unsigned long) handle_sse, (unsigned long) arch_evt,
>>> +             0, 0, 0);
>>> +
>>> +    return sbi_err_map_linux_errno(sret.error);
>>> +}
>>> diff --git a/arch/riscv/kernel/sse_entry.S b/arch/riscv/kernel/
>>> sse_entry.S
>>> new file mode 100644
>>> index 000000000000..0b2f890edd89
>>> --- /dev/null
>>> +++ b/arch/riscv/kernel/sse_entry.S
>>> @@ -0,0 +1,171 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (C) 2024 Rivos Inc.
>>> + */
>>> +
>>> +#include <linux/init.h>
>>> +#include <linux/linkage.h>
>>> +
>>> +#include <asm/asm.h>
>>> +#include <asm/csr.h>
>>> +#include <asm/scs.h>
>>> +
>>> +/* When entering handle_sse, the following registers are set:
>>> + * a6: contains the hartid
>>> + * a6: contains struct sse_registered_event pointer
>>> + */
>>> +SYM_CODE_START(handle_sse)
>>> +    /* Save stack temporarily */
>>> +    REG_S sp, SSE_REG_EVT_TMP(a7)
>>> +    /* Set entry stack */
>>> +    REG_L sp, SSE_REG_EVT_STACK(a7)
>>> +
>>> +    addi sp, sp, -(PT_SIZE_ON_STACK)
>>> +    REG_S ra, PT_RA(sp)
>>> +    REG_S s0, PT_S0(sp)
>>> +    REG_S s1, PT_S1(sp)
>>> +    REG_S s2, PT_S2(sp)
>>> +    REG_S s3, PT_S3(sp)
>>> +    REG_S s4, PT_S4(sp)
>>> +    REG_S s5, PT_S5(sp)
>>> +    REG_S s6, PT_S6(sp)
>>> +    REG_S s7, PT_S7(sp)
>>> +    REG_S s8, PT_S8(sp)
>>> +    REG_S s9, PT_S9(sp)
>>> +    REG_S s10, PT_S10(sp)
>>> +    REG_S s11, PT_S11(sp)
>>> +    REG_S tp, PT_TP(sp)
>>> +    REG_S t0, PT_T0(sp)
>>> +    REG_S t1, PT_T1(sp)
>>> +    REG_S t2, PT_T2(sp)
>>> +    REG_S t3, PT_T3(sp)
>>> +    REG_S t4, PT_T4(sp)
>>> +    REG_S t5, PT_T5(sp)
>>> +    REG_S t6, PT_T6(sp)
>>> +    REG_S gp, PT_GP(sp)
>>> +    REG_S a0, PT_A0(sp)
>>> +    REG_S a1, PT_A1(sp)
>>> +    REG_S a2, PT_A2(sp)
>>> +    REG_S a3, PT_A3(sp)
>>> +    REG_S a4, PT_A4(sp)
>>> +    REG_S a5, PT_A5(sp)
>>> +
>>> +    /* Retrieve entry sp */
>>> +    REG_L a4, SSE_REG_EVT_TMP(a7)
>>> +    /* Save CSRs */
>>> +    csrr a0, CSR_EPC
>>> +    csrr a1, CSR_SSTATUS
>>> +    csrr a2, CSR_STVAL
>>> +    csrr a3, CSR_SCAUSE
>>> +
>>> +    REG_S a0, PT_EPC(sp)
>>> +    REG_S a1, PT_STATUS(sp)
>>> +    REG_S a2, PT_BADADDR(sp)
>>> +    REG_S a3, PT_CAUSE(sp)
>>> +    REG_S a4, PT_SP(sp)
>>> +
>>> +    /* Disable user memory access and floating/vector computing */
>>> +    li t0, SR_SUM | SR_FS_VS
>>> +    csrc CSR_STATUS, t0
>>> +
>>> +    load_global_pointer
>>> +    scs_load_sse_stack a7
>>> +
>>> +    /* Restore current task struct from __sse_entry_task */
>>> +    li t1, NR_CPUS
>>> +    move t3, zero
>>> +
>>> +#ifdef CONFIG_SMP
>>> +    /* Find the CPU id associated to the hart id */
>>> +    la t0, __cpuid_to_hartid_map
>>> +.Lhart_id_loop:
>>> +    REG_L t2, 0(t0)
>>> +    beq t2, a6, .Lcpu_id_found
>>> +
>>> +    /* Increment pointer and CPU number */
>>> +    addi t3, t3, 1
>>> +    addi t0, t0, RISCV_SZPTR
>>> +    bltu t3, t1, .Lhart_id_loop
>>> +
>>> +    /*
>>> +     * This should never happen since we expect the hart_id to match
>>> one
>>> +     * of our CPU, but better be safe than sorry
>>> +     */
>>> +    la tp, init_task
>>> +    la a0, sse_hart_id_panic_string
>>> +    la t0, panic
>>> +    jalr t0
>>> +
>>> +.Lcpu_id_found:
>>> +#endif
>>> +    asm_per_cpu_with_cpu t2 __sse_entry_task t1 t3
>>> +    REG_L tp, 0(t2)
>>> +
>>> +    move a1, sp /* pt_regs on stack */
>>> +    /* Kernel was interrupted, create stack frame */
>>> +    beqz s1, .Lcall_do_sse
>>
>>
>> I don't understand this since in any case we will go to .Lcall_do_sse
>> right? And I don't see where s1 is initialized.
>>
>>
>>> +
>>> +.Lcall_do_sse:
>>> +    /*
>>> +     * Save sscratch for restoration since we might have interrupted
>>> the
>>> +     * kernel in early exception path and thus, we don't know the
>>> content of
>>> +     * sscratch.
>>> +     */
>>> +    csrr s4, CSR_SSCRATCH
>>> +    /* In-kernel scratch is 0 */
>>> +    csrw CSR_SCRATCH, x0
>>> +
>>> +    move a0, a7
>>> +
>>> +    call do_sse
>>> +
>>> +    csrw CSR_SSCRATCH, s4
>>> +
>>> +    REG_L a0, PT_EPC(sp)
>>> +    REG_L a1, PT_STATUS(sp)
>>> +    REG_L a2, PT_BADADDR(sp)
>>> +    REG_L a3, PT_CAUSE(sp)
>>> +    csrw CSR_EPC, a0
>>> +    csrw CSR_SSTATUS, a1
>>> +    csrw CSR_STVAL, a2
>>> +    csrw CSR_SCAUSE, a3
>>> +
>>> +    REG_L ra, PT_RA(sp)
>>> +    REG_L s0, PT_S0(sp)
>>> +    REG_L s1, PT_S1(sp)
>>> +    REG_L s2, PT_S2(sp)
>>> +    REG_L s3, PT_S3(sp)
>>> +    REG_L s4, PT_S4(sp)
>>> +    REG_L s5, PT_S5(sp)
>>> +    REG_L s6, PT_S6(sp)
>>> +    REG_L s7, PT_S7(sp)
>>> +    REG_L s8, PT_S8(sp)
>>> +    REG_L s9, PT_S9(sp)
>>> +    REG_L s10, PT_S10(sp)
>>> +    REG_L s11, PT_S11(sp)
>>> +    REG_L tp, PT_TP(sp)
>>> +    REG_L t0, PT_T0(sp)
>>> +    REG_L t1, PT_T1(sp)
>>> +    REG_L t2, PT_T2(sp)
>>> +    REG_L t3, PT_T3(sp)
>>> +    REG_L t4, PT_T4(sp)
>>> +    REG_L t5, PT_T5(sp)
>>> +    REG_L t6, PT_T6(sp)
>>> +    REG_L gp, PT_GP(sp)
>>> +    REG_L a0, PT_A0(sp)
>>> +    REG_L a1, PT_A1(sp)
>>> +    REG_L a2, PT_A2(sp)
>>> +    REG_L a3, PT_A3(sp)
>>> +    REG_L a4, PT_A4(sp)
>>> +    REG_L a5, PT_A5(sp)
>>> +
>>> +    REG_L sp, PT_SP(sp)
>>> +
>>> +    li a7, SBI_EXT_SSE
>>> +    li a6, SBI_SSE_EVENT_COMPLETE
>>> +    ecall
>>> +
>>> +SYM_CODE_END(handle_sse)
>>> +
>>> +sse_hart_id_panic_string:
>>> +    .ascii "Unable to match hart_id with cpu\0"
>>
>>
>> Thanks,
>>
>> Alex
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv


