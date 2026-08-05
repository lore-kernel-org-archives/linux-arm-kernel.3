Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4B0C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L58QuRttbq8ipfvicwBxGanLWWeJ0MgayPUEKQeAujc=; b=cLRlj/CvQtJdC9
	qeJnAeyztAoR4aTrInPQbhhoEXdV4qU5VvIV6fKV+h0zkotxtIg0uwfzlV/iIWak2n9ERolEu58AJ
	5ou3otBZD8aCzR3Z0lAk1CZDhuE+SMerBTTIZZGQV1EkmZErL3tHb71qwn0mW0yvAi+cwHY2ivVDk
	IvVmycJIgAR1eU82k4a/VLDnhcbVApsyIOC7Z2StNx8rUyjsIz6NXqdE90sJ97Q3qZBgs8QFFxV1U
	C+MA43pf5LECqS+xC1kyqYOeb24yPkP+P3ULPigTVLJDfzd2680fyfkLPYcY5JDuZhZpmaEeKHZCT
	JM9qsc0qtnfros2ZoKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraQZ-00000003s5a-4ACs;
	Wed, 05 Aug 2026 12:08:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraQX-00000003s52-2PVL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:08:55 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4957eefd361so6643025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 05:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785931731; x=1786536531; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L58QuRttbq8ipfvicwBxGanLWWeJ0MgayPUEKQeAujc=;
        b=qF5b5PXnLNHKR4wx+qSWvwDNG7lVczWoKjZh4aqYAzFpw5nGVKaesws5wCsE+MsEAU
         0cVf9D4/9NoGZCW+L5hq7NqEJ1XVZhGOTPjfCIU1aX9u3/Ra/z9k8FI2YjEUvF/ICrMq
         VXmBPtNta0b62QLJKPHMpXg9II9CL94W24mx8Jb8iZF0P4ihv5bJr8sfhJihc3hWh71v
         BtNFfUaCjF2CnJpw2uOZLUivPXsM43gZM1NiH9S/hqG6rLJfVfXXPkh6kd5kfI8+TB+A
         mFoxRyevUvMakAZ/ZjoQ5oeIvHAFsnZZvM/oST0nFxA+YSYrOhO4sQRf1SkSmSXccKNh
         UzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785931731; x=1786536531;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L58QuRttbq8ipfvicwBxGanLWWeJ0MgayPUEKQeAujc=;
        b=JMNdRodad04HYxgb3g/oNkIMkAQo5gFIat8fMjGa3rSil86Gc1jOMihbYF45ZC9yL3
         BkCFrtHtd6rUKCdCT569D5sd2bgltGzYzqbwRicYy2uxzNz+Sgz9bfhZEuCKVW4i2U64
         glEIxTPfUoPozn0pTRx3cD9KHW1ClQU58JByUFlvw5RWUiXDEenqlhY6iC3aoPBcUCsT
         F8meh/YMly56tQpVkKNO31IHeUPB49sQTPvUPoBJFwsGp/q3m2a4uDMpfHENz6LQvIfV
         ML38hGrR+d5Ca8hKNLz2tffDiQtXxoMTPb8zYl0Isd7JM14TmhugukZGPmYrqHPEpO4P
         Wcfg==
X-Forwarded-Encrypted: i=1; AHgh+RrmsdoplbbsEPMbwKil5Tsl/tJnGxlffT1c3ylrYXdxzH6MAVA8XZtmXuoXl7FJw2OTNpeFQlN7EAN5cmLyXv+v@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx7yIzs/PjDU+WFkq2EkMJg/CyssMKLzv2Yql2d7GPCien35te
	dAHoJRj6962ChGPbV1V0gTFXM+nM23W+ySAtEMqleHI6UJdJXkfcIcIln1RWqLdx4Vg=
X-Gm-Gg: AR+sD11W4bUu8+HjLsXfyQNocc3GK0Q2TIsci1Kp+348Ppi8dVXARJP9K/ah+INw05c
	f71uGwwzGrVTqQIfE1YCgaX0iG08gKMzFMrj2f0rXyXSgjhPsuUWGqOFIBbQYyfIS37EjDovx6H
	baOvDdXaMEkQ/t/31FUZYPKw1j+bZr8TYCVUkkC/LerlMu3f0oaZ7R7wCaTHILqZ1yN3oY80sKF
	ZmPZ6eFwpRV6qizI1+5jCX4+bJkgYqEfPbOh0H+agRDETSJgA+P4vT/9hvFPbnb8tORn6q1liZo
	rBVHBVeMU5JJka1VNla1gVlfbBlzo76nY2WuFlb349iLguJzeL8QU5ThpscLcsENN/RCh673f12
	yNlv6vPQ84fxG3Jw8EAT4GG30WaLbSMSweFquyImOV5M4JnE0rsfcXV8JTxA9EqpyNBa+NTeZ8N
	XOytoG1AEZ1us07JXf4LEwOo5H4qfYKa2iEeabcTbXNZ4nbhWtjXI0NsnYQ7PAYlVMbVufdLVzQ
	cL6YuwCGOR6YKQ9SuLs6sdjzg==
X-Received: by 2002:a05:600c:524a:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4994e71d349mr61612425e9.7.1785931731173;
        Wed, 05 Aug 2026 05:08:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23e250sm9440714f8f.26.2026.08.05.05.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:08:50 -0700 (PDT)
Date: Wed, 5 Aug 2026 13:08:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v2 14/20] arm64: percpu: Implement preemptible
 read/write ops
Message-ID: <20260805130848.6d533293@pumpkin>
In-Reply-To: <00a85d9a-8727-4b89-b33b-ce2d3358355c@arm.com>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
	<20260804170503.3513916-15-mark.rutland@arm.com>
	<00a85d9a-8727-4b89-b33b-ce2d3358355c@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_050853_681808_70763670 
X-CRM114-Status: GOOD (  25.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 5 Aug 2026 10:24:04 +0100
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 04/08/2026 18:04, Mark Rutland wrote:
> > Use the PCPU GPR infrastructure to implement preemptible this_cpu_read()
> > and this_cpu_write().
> > 
> > This change means that this_cpu_read() will always use a plain LDR, even
> > in LTO configurations where READ_ONCE() will use LDA[P]R. Using plain
> > LDR is preferable, given that the rationale for using LDA[P]R in
> > READ_ONCE() was to retain address dependencies against values written by
> > other CPUs, which isn't expected usage for this_cpu_read(). Using plain
> > LDR will enforce fewer ordering constraints.
> > 
> > Test case:
> > 
> > | void outline_this_cpu_write_u64(u64 __percpu *p, u64 v)
> > | {
> > | 	this_cpu_write(*p, v);
> > | }
> > 
> > Generated code before this patch (v7.2-rc4):
> > 
> > | <outline_this_cpu_write_u64>:
> > |        paciasp
> > |        stp     x29, x30, [sp, #-16]!
> > |        mrs     x2, sp_el0
> > |        mov     x29, sp
> > |        ldr     w3, [x2, #8]
> > |        add     w3, w3, #0x1
> > |        str     w3, [x2, #8]
> > |        mrs     x3, tpidr_el1
> > |        str     x1, [x0, x3]
> > |        ldr     x0, [x2, #8]
> > |        sub     x0, x0, #0x1
> > |        str     w0, [x2, #8]
> > |        cbz     x0, 1f
> > |        ldr     x0, [x2, #8]
> > |        cbnz    x0, 2f
> > | 1:     bl      preempt_schedule_notrace
> > | 2:     ldp     x29, x30, [sp], #16
> > |        autiasp
> > |        ret
> > 
> > Generated code after this patch:
> > 
> > | <outline_this_cpu_write_u64>:
> > |        mrs     x2, sp_el0
> > |        mov     w3, #0x7c60
> > |        strh    w3, [x2, #20]
> > |        mrs     x3, tpidr_el1
> > |        str     x1, [x0, x3]
> > |        strh    wzr, [x2, #20]
> > |        ret
> > 
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: James Morse <james.morse@arm.com>
> > Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Yang Shi <yang@os.amperecomputing.com>
> > ---  
> FYI I'm seeing build warnings caused by this patch (with ftrace enabled - based 
> on the warnings, I'm guessing that's the key bit), using:
> 
> aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> 
> I haven't investigated the cause.

It'll be the earlier patch that changed the casts.
The code is doing:
		this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
			       FTRACE_PID_IGNORE);
where the constant is -1.
I suspect the warning messages are coming from the switch case that are
optimised away because the size if wrong (ftrace_ignore_pid seems to
be a pid number to ignore and is 32 bits.

That does seem a long-winded way to access per-cpu data.
To make any sense the code must be running with preemption disabled and
be caching info in per-cpu memory.
In which case it can just access it directly.
OTOH it could save the 'global' address of the per-cpu data and then access
it using the pointer so that access would be a normal one.

	David

> 
> Thanks,
> Ryan
> 
> ---8<---
> In file included from linux/arch/arm64/include/asm/spectre.h:17,                                                                                                                                                                       
>                  from linux/arch/arm64/include/asm/processor.h:47,
>                  from linux/include/linux/sched.h:13,
>                  from linux/include/linux/ratelimit.h:6,
>                  from linux/include/linux/dev_printk.h:16,
>                  from linux/include/linux/device.h:15,
>                  from linux/include/linux/node.h:18,
>                  from linux/include/linux/cpu.h:17,
>                  from linux/include/linux/stop_machine.h:5,
>                  from linux/kernel/trace/ftrace.c:17:
> linux/kernel/trace/ftrace.c: In function 'ftrace_filter_pid_sched_switch_probe':
> linux/arch/arm64/include/asm/percpu.h:295:42: warning: conversion from 'long unsigned int' to 'u8' {aka 'unsigned char'} changes value from '18446744073709551615' to '255' [-Woverflow]                                               
>   295 |         _pcp_wrap(__percpu_write_8, pcp, (unsigned long)(val))
>       |                                          ^~~~~~~~~~~~~~~~~~~~
> linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
>   277 |         op(&(pcp), __VA_ARGS__);                                        \
>       |                    ^~~~~~~~~~~
> linux/include/linux/percpu-defs.h:369:25: note: in expansion of macro 'this_cpu_write_1'
>   369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
>       |                         ^~~~
> linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
>   500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
>       |                                         ^~~~~~~~~~~~~~~~
> linux/kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
>  8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
>       |                 ^~~~~~~~~~~~~~
> linux/arch/arm64/include/asm/percpu.h:297:43: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '18446744073709551615' to '65535' [-Woverflow]
>   297 |         _pcp_wrap(__percpu_write_16, pcp, (unsigned long)(val))
>       |                                           ^~~~~~~~~~~~~~~~~~~~
> linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
>   277 |         op(&(pcp), __VA_ARGS__);                                        \
>       |                    ^~~~~~~~~~~
> linux/include/linux/percpu-defs.h:370:25: note: in expansion of macro 'this_cpu_write_2'
>   370 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
>       |                         ^~~~
> linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
>   500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
>       |                                         ^~~~~~~~~~~~~~~~
> linux/kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
>  8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
>       |                 ^~~~~~~~~~~~~~
> linux/arch/arm64/include/asm/percpu.h:299:43: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
>   299 |         _pcp_wrap(__percpu_write_32, pcp, (unsigned long)(val))
>       |                                           ^~~~~~~~~~~~~~~~~~~~
> linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
>   277 |         op(&(pcp), __VA_ARGS__);                                        \
>       |                    ^~~~~~~~~~~
> linux/include/linux/percpu-defs.h:371:25: note: in expansion of macro 'this_cpu_write_4'
>   371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
>       |                         ^~~~
> linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
>   500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
>       |                                         ^~~~~~~~~~~~~~~~
> linux/kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
>  8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
>       |                 ^~~~~~~~~~~~~~
> linux/kernel/trace/ftrace.c: In function 'ignore_task_cpu':
> linux/arch/arm64/include/asm/percpu.h:295:42: warning: conversion from 'long unsigned int' to 'u8' {aka 'unsigned char'} changes value from '18446744073709551615' to '255' [-Woverflow]
>   295 |         _pcp_wrap(__percpu_write_8, pcp, (unsigned long)(val))
>       |                                          ^~~~~~~~~~~~~~~~~~~~
> linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
>   277 |         op(&(pcp), __VA_ARGS__);                                        \
>       |                    ^~~~~~~~~~~
> linux/include/linux/percpu-defs.h:369:25: note: in expansion of macro 'this_cpu_write_1'
>   369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
>       |                         ^~~~
> linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
>   500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
>       |                                         ^~~~~~~~~~~~~~~~
> linux/kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
>  8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
>       |                 ^~~~~~~~~~~~~~
> linux/arch/arm64/include/asm/percpu.h:297:43: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '18446744073709551615' to '65535' [-Woverflow]
>   297 |         _pcp_wrap(__percpu_write_16, pcp, (unsigned long)(val))
>       |                                           ^~~~~~~~~~~~~~~~~~~~
> linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
>   277 |         op(&(pcp), __VA_ARGS__);                                        \
>       |                    ^~~~~~~~~~~
> linux/include/linux/percpu-defs.h:370:25: note: in expansion of macro 'this_cpu_write_2'
>   370 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
>       |                         ^~~~
> linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
>   500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
>       |                                         ^~~~~~~~~~~~~~~~
> linux/kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
>  8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
>       |                 ^~~~~~~~~~~~~~
> linux/arch/arm64/include/asm/percpu.h:299:43: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
>   299 |         _pcp_wrap(__percpu_write_32, pcp, (unsigned long)(val))
>       |                                           ^~~~~~~~~~~~~~~~~~~~
> linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
>   277 |         op(&(pcp), __VA_ARGS__);                                        \
>       |                    ^~~~~~~~~~~
> linux/include/linux/percpu-defs.h:371:25: note: in expansion of macro 'this_cpu_write_4'
>   371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
>       |                         ^~~~
> linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
>   500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
>       |                                         ^~~~~~~~~~~~~~~~
> linux/kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
>  8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
>       |                 ^~~~~~~~~~~~~~
> ---8<---
> 
> 


