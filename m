Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6F7C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 09:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1d11wDHcnIDQEXg/EyahnFUaeXftU1YB2XpZKCwT5kY=; b=GI2sKWuJ5IT6FP
	7IWn4iI2T8orqV3m6o+qwVj6BYtOav1bxuJig2DTWUZaQMB7S2dJCeYO8kBALQUept9ElIzkwNprN
	5NIyYsMLoR8ndCq9q0wc6tEUvma1amR++n4aBzuhh2SmgEJgQpWReyiNSPP9mkPcWDVOb7YjwaDui
	zCML1g8KtZrQ8xYkHYBeg9LRQo2XCTbGLvBdr5zokMKz4uUkb3oz2y0sjAgWj1+EMSWPYrNGT+bRQ
	ykxL7ohqoQY8/S/Dt7jrooN6ds0OGa2i0LqRZPIQGivqgHlJwFxGZHAot2LeN2VXWOZxCheNSYrqE
	CFd8SGK6AUfshBrtjEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXrE-00000003brg-0UeF;
	Wed, 05 Aug 2026 09:24:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXrB-00000003bqt-2Uxl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 09:24:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4602153B;
	Wed,  5 Aug 2026 02:24:04 -0700 (PDT)
Received: from [10.57.87.98] (unknown [10.57.87.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 110153F66F;
	Wed,  5 Aug 2026 02:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785921848; bh=5+i+m9WSJqQvin47phulhm8sOavejG6eTb3No4RAakM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eDff7BARSdi7ra/VdL2bJTZukrenI2Tt4LT4fWY3+q70NkU3JCSd+PqI3aSfZHl5w
	 jrlwfn37FLQWw1+Z2J542shyCC6COzZ2orte9z1AkShbf61cGe1r+RdM1EojbSfcf1
	 kBIcp4VTByONOgeSJ0j+npDX1QaIOSNUf3Zfih/Q=
Message-ID: <00a85d9a-8727-4b89-b33b-ce2d3358355c@arm.com>
Date: Wed, 5 Aug 2026 10:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/20] arm64: percpu: Implement preemptible read/write
 ops
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260804170503.3513916-1-mark.rutland@arm.com>
 <20260804170503.3513916-15-mark.rutland@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260804170503.3513916-15-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_022413_821613_962C83D0 
X-CRM114-Status: GOOD (  13.47  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 04/08/2026 18:04, Mark Rutland wrote:
> Use the PCPU GPR infrastructure to implement preemptible this_cpu_read()
> and this_cpu_write().
> 
> This change means that this_cpu_read() will always use a plain LDR, even
> in LTO configurations where READ_ONCE() will use LDA[P]R. Using plain
> LDR is preferable, given that the rationale for using LDA[P]R in
> READ_ONCE() was to retain address dependencies against values written by
> other CPUs, which isn't expected usage for this_cpu_read(). Using plain
> LDR will enforce fewer ordering constraints.
> 
> Test case:
> 
> | void outline_this_cpu_write_u64(u64 __percpu *p, u64 v)
> | {
> | 	this_cpu_write(*p, v);
> | }
> 
> Generated code before this patch (v7.2-rc4):
> 
> | <outline_this_cpu_write_u64>:
> |        paciasp
> |        stp     x29, x30, [sp, #-16]!
> |        mrs     x2, sp_el0
> |        mov     x29, sp
> |        ldr     w3, [x2, #8]
> |        add     w3, w3, #0x1
> |        str     w3, [x2, #8]
> |        mrs     x3, tpidr_el1
> |        str     x1, [x0, x3]
> |        ldr     x0, [x2, #8]
> |        sub     x0, x0, #0x1
> |        str     w0, [x2, #8]
> |        cbz     x0, 1f
> |        ldr     x0, [x2, #8]
> |        cbnz    x0, 2f
> | 1:     bl      preempt_schedule_notrace
> | 2:     ldp     x29, x30, [sp], #16
> |        autiasp
> |        ret
> 
> Generated code after this patch:
> 
> | <outline_this_cpu_write_u64>:
> |        mrs     x2, sp_el0
> |        mov     w3, #0x7c60
> |        strh    w3, [x2, #20]
> |        mrs     x3, tpidr_el1
> |        str     x1, [x0, x3]
> |        strh    wzr, [x2, #20]
> |        ret
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
FYI I'm seeing build warnings caused by this patch (with ftrace enabled - based 
on the warnings, I'm guessing that's the key bit), using:

aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

I haven't investigated the cause.

Thanks,
Ryan

---8<---
In file included from linux/arch/arm64/include/asm/spectre.h:17,                                                                                                                                                                       
                 from linux/arch/arm64/include/asm/processor.h:47,
                 from linux/include/linux/sched.h:13,
                 from linux/include/linux/ratelimit.h:6,
                 from linux/include/linux/dev_printk.h:16,
                 from linux/include/linux/device.h:15,
                 from linux/include/linux/node.h:18,
                 from linux/include/linux/cpu.h:17,
                 from linux/include/linux/stop_machine.h:5,
                 from linux/kernel/trace/ftrace.c:17:
linux/kernel/trace/ftrace.c: In function 'ftrace_filter_pid_sched_switch_probe':
linux/arch/arm64/include/asm/percpu.h:295:42: warning: conversion from 'long unsigned int' to 'u8' {aka 'unsigned char'} changes value from '18446744073709551615' to '255' [-Woverflow]                                               
  295 |         _pcp_wrap(__percpu_write_8, pcp, (unsigned long)(val))
      |                                          ^~~~~~~~~~~~~~~~~~~~
linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
  277 |         op(&(pcp), __VA_ARGS__);                                        \
      |                    ^~~~~~~~~~~
linux/include/linux/percpu-defs.h:369:25: note: in expansion of macro 'this_cpu_write_1'
  369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
      |                         ^~~~
linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
  500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
      |                                         ^~~~~~~~~~~~~~~~
linux/kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
 8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
      |                 ^~~~~~~~~~~~~~
linux/arch/arm64/include/asm/percpu.h:297:43: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '18446744073709551615' to '65535' [-Woverflow]
  297 |         _pcp_wrap(__percpu_write_16, pcp, (unsigned long)(val))
      |                                           ^~~~~~~~~~~~~~~~~~~~
linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
  277 |         op(&(pcp), __VA_ARGS__);                                        \
      |                    ^~~~~~~~~~~
linux/include/linux/percpu-defs.h:370:25: note: in expansion of macro 'this_cpu_write_2'
  370 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
      |                         ^~~~
linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
  500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
      |                                         ^~~~~~~~~~~~~~~~
linux/kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
 8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
      |                 ^~~~~~~~~~~~~~
linux/arch/arm64/include/asm/percpu.h:299:43: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
  299 |         _pcp_wrap(__percpu_write_32, pcp, (unsigned long)(val))
      |                                           ^~~~~~~~~~~~~~~~~~~~
linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
  277 |         op(&(pcp), __VA_ARGS__);                                        \
      |                    ^~~~~~~~~~~
linux/include/linux/percpu-defs.h:371:25: note: in expansion of macro 'this_cpu_write_4'
  371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
      |                         ^~~~
linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
  500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
      |                                         ^~~~~~~~~~~~~~~~
linux/kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
 8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
      |                 ^~~~~~~~~~~~~~
linux/kernel/trace/ftrace.c: In function 'ignore_task_cpu':
linux/arch/arm64/include/asm/percpu.h:295:42: warning: conversion from 'long unsigned int' to 'u8' {aka 'unsigned char'} changes value from '18446744073709551615' to '255' [-Woverflow]
  295 |         _pcp_wrap(__percpu_write_8, pcp, (unsigned long)(val))
      |                                          ^~~~~~~~~~~~~~~~~~~~
linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
  277 |         op(&(pcp), __VA_ARGS__);                                        \
      |                    ^~~~~~~~~~~
linux/include/linux/percpu-defs.h:369:25: note: in expansion of macro 'this_cpu_write_1'
  369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
      |                         ^~~~
linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
  500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
      |                                         ^~~~~~~~~~~~~~~~
linux/kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
 8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
      |                 ^~~~~~~~~~~~~~
linux/arch/arm64/include/asm/percpu.h:297:43: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '18446744073709551615' to '65535' [-Woverflow]
  297 |         _pcp_wrap(__percpu_write_16, pcp, (unsigned long)(val))
      |                                           ^~~~~~~~~~~~~~~~~~~~
linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
  277 |         op(&(pcp), __VA_ARGS__);                                        \
      |                    ^~~~~~~~~~~
linux/include/linux/percpu-defs.h:370:25: note: in expansion of macro 'this_cpu_write_2'
  370 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
      |                         ^~~~
linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
  500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
      |                                         ^~~~~~~~~~~~~~~~
linux/kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
 8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
      |                 ^~~~~~~~~~~~~~
linux/arch/arm64/include/asm/percpu.h:299:43: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
  299 |         _pcp_wrap(__percpu_write_32, pcp, (unsigned long)(val))
      |                                           ^~~~~~~~~~~~~~~~~~~~
linux/arch/arm64/include/asm/percpu.h:277:20: note: in definition of macro '_pcp_wrap'
  277 |         op(&(pcp), __VA_ARGS__);                                        \
      |                    ^~~~~~~~~~~
linux/include/linux/percpu-defs.h:371:25: note: in expansion of macro 'this_cpu_write_4'
  371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
      |                         ^~~~
linux/include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
  500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
      |                                         ^~~~~~~~~~~~~~~~
linux/kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
 8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
      |                 ^~~~~~~~~~~~~~
---8<---



