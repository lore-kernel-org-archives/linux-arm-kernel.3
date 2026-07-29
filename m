Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001D5C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHBwv5zoACmz8PFmEXK3jmxmGkGxLNgEOR2StYBXKAc=; b=sh5qrKQAg2cFNn
	csqgU+TenPKMIBW2zTcEt4RPySPDhxbBpCCLwwevu2PkLJOK26f8STKgOVkgrMcKynygWjTrWS3rv
	F/9CHOFRFeTdJoXSgQ//f6pWP7pMChrEkLkFKbHWPxNoa84i4zrnEHmUlCgQkSzRpCX+Ge9oUmNKK
	euTJAm9MoXrW8A2YFzOpW1gcEtobrqbKW0N+C3OwtuQ4yPApNrj8AaMQqXXPEkdvnPsQ8+O70m/15
	drBMwRFrGV7AK5+iryqGEGf3Kk/z3CSoqFDpIa7Svd3KMRjkr1Sx8auKNzm2JCLHTKA9rTa18XrQS
	C/CFn166vCGYgxVOHVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5EQ-00000008Fxs-0A6w;
	Wed, 29 Jul 2026 14:26:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5EN-00000008FxW-2iC7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:26:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B1B61684;
	Wed, 29 Jul 2026 07:25:52 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65AA93F66F;
	Wed, 29 Jul 2026 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785335156; bh=ErNyR86wrn94FrcMH6ADSAiqZQIZlnlT9oJFEVr45DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FI9FDrTJZHGX9+blzSa+Zifj27VVeZ3rI7OJZJI8DGZsK5zLZwOnMDNbgyaoqKCTb
	 lrxc2iRf7XWqwqtLnP3wsDygP5FUgdQ5HkVKpJclAUiiGFkow2CMu0/SxHeRQ4Jk73
	 bkpLMSU9jGIJfydZoaIp0sn1y0Y8OA29YJnPJ/qc=
Message-ID: <ea269924-b563-44b9-bdf3-31072ec93375@arm.com>
Date: Wed, 29 Jul 2026 15:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260728123859.2911495-7-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_072559_773908_4761F7CF 
X-CRM114-Status: GOOD (  31.33  )
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
Cc: peterz@infradead.org, maz@kernel.org, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/28/26 13:38, Mark Rutland wrote:
> Currently arm64's this_cpu_*() ops transiently disable preemption in
> order to guarantee that the address generation and memory access(es)
> occur on the same CPU.
> 
> Transiently disabling preemption can be  expensive. When re-enabling
> preemption it is necessary to make a conditional function call to
> preempt_schedule[_notrace]() in order to handle the rare case that the
> task needs to be rescheduled. The potential function call has a number
> of negative effects on code generation (e.g. due to the need to create a
> stack frame and spill registers), and the conditionality can result in
> poor code generation and/or poor branch prediction.
> 
> This patch adds infrastructure for a scheme where this_cpu_*() ops do
> not need to transiently disable preemption, avoiding the negative
> impacts described above.
> 
> Each operation registers a critical section during which the exception
> return code will adjust the offset and addresses if preemption occurs
> mid-sequence. The critical section is registered/unregistered with a
> small prologue and epilogue which encodes three distinct GPRRs (<pcp>,
> <off>, <addr>) into a new thread_info::pcp_gprs field:
> 
>          // Prologue. Enable fixups for <off> and <addr>.
>          mrs	<tsk>, sp_el0
>          mov	<tmp>, #__VAL_PCPU_GPRS(<pcp>, <off>, <addr>)
>          strh	<tmp>, [<tsk>, #TSK_TI_PCPU_GPRS]
> 
>          // Generate cpu-specific address
>          mrs	<off>, TPIDR_ELx
>          add	<addr>, <pcp>, <off>
> 
>          // Perform access sequence
>          ldr	<val>, [<addr>]
> 
>          // Epilogue. Disable fixups
>          strh	wzr, [<tsk>, #TSK_TI_PCPU_GPRS]
> 
> If an exception is taken from within the critical section, the exception
> return code will adjust <off> to be the current CPU's offset, and will
> adjust <addr> to be (<pcp> + <off>). Distinct registers are used for
> <pcp>, <off>, and <addr>, so that the fixup can be applied safely at any
> point during the critical section.
> 
> To ensure that this_cpu_*() operations within exception handlers work
> correctly and do not corrupt state, thread_info::pcpu_gprs is saved
> into a new pt_regs::pcpu_gprs field upon exception entry, and restored
> upon exception return.
> 
> Looking at a simple this_cpu_operation:
> 
> | void outline_this_cpu_add_u64(u64 __percpu *p, u64 v)
> | {
> | 	this_cpu_add(*p, v);
> | }
> 
> Atop v7.2-rc4, with GCC 15.2.0 and defconfig, this is compiled as:
> 
> | <outline_this_cpu_add_u64>:
> |        paciasp
> |        stp     x29, x30, [sp, #-16]!
> |        mrs     x2, sp_el0
> |        mov     x29, sp
> |        ldr     w3, [x2, #8]
> |        add     w3, w3, #0x1
> |        str     w3, [x2, #8]
> |        mrs     x3, tpidr_el1
> |        add     x0, x0, x3
> | 1:     ldxr    x5, [x0]
> |        add     x5, x5, x1
> |        stxr    w4, x5, [x0]
> |        cbnz    w4, 1b
> |        ldr     x0, [x2, #8]
> |        sub     x0, x0, #0x1
> |        str     w0, [x2, #8]
> |        cbz     x0, 2f
> |        ldr     x0, [x2, #8]
> |        cbnz    x0, 3f
> | 2:     bl      preempt_schedule_notrace
> | 3:     ldp     x29, x30, [sp], #16
> |        autiasp
> |        ret
> 
> With the scheme added in this patch, this can be compiled as:
> 
> | <outline_this_cpu_add_u64>:
> |        mrs     x2, sp_el0
> |        mov     x4, #0xc80
> |        strh    w4, [x2, #20]
> |        mrs     x4, tpidr_el1
> |        add     x3, x0, x4
> | 1:     ldxr    x6, [x3]
> |        add     x6, x6, x1
> |        stxr    w5, x6, [x3]
> |        cbnz    w5, 1b
> |        strh    wzr, [x2, #20]
> |        ret
> 
> TODO: Save/restore the PCPU GPRs in __sdei_asm_handler(). This will
> require some mechanical rework to the __sdei_asm_handler() assembly.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/percpu.h      | 43 ++++++++++++++++++++++++++++
>  arch/arm64/include/asm/ptrace.h      |  5 ++++
>  arch/arm64/include/asm/thread_info.h |  1 +
>  arch/arm64/kernel/asm-offsets.c      |  2 ++
>  arch/arm64/kernel/entry-common.c     | 38 ++++++++++++++++++++++++
>  arch/arm64/kernel/entry.S            | 13 +++++++++
>  6 files changed, 102 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index 98823c97d534c..0871dcc41d759 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -5,10 +5,12 @@
>  #ifndef __ASM_PERCPU_H
>  #define __ASM_PERCPU_H
>  
> +#include <linux/bits.h>
>  #include <linux/preempt.h>
>  
>  #include <asm/alternative.h>
>  #include <asm/cmpxchg.h>
> +#include <asm/gpr-num.h>
>  #include <asm/stack_pointer.h>
>  #include <asm/sysreg.h>
>  
> @@ -51,6 +53,47 @@ static inline unsigned long __kern_my_cpu_offset(void)
>  	return off;
>  }
>  
> +#define PCPU_GPR_PCP			GENMASK(4, 0)
> +#define PCPU_GPR_OFF			GENMASK(9, 5)
> +#define PCPU_GPR_ADDR			GENMASK(14, 10)
> +
> +#define __VAL_PCPU_GPRS(pcp, off, addr)				\
> +	"("							\
> +		"(.L__gpr_num_" pcp  " << 0) | "		\
> +		"(.L__gpr_num_" off  " << 5) | "		\
> +		"(.L__gpr_num_" addr " << 10)"			\
> +	")"

Later in the patch, there is a comment stating that these registers
are not expected to overlap. I can also see that early-clobber
constraints are applied to the output registers later in the patch
series, so the code is correct.

However, would it be possible to add assertions that detect register
overlap, perhaps something like:

".if (.L__gpr_num_" pcp "== .L__gpr_num_" off ") ||"	\
"    (.L__gpr_num_" pcp "== .L__gpr_num_" addr ") ||"	\
"    (.L__gpr_num_" off "== .L__gpr_num_" addr")"	\
".error "inline asm registers overlap"			\
".endif"						\

or any other (better) way.

Such assertions would serve both as documentation and as a strong
guarantee that the registers are distinct.


Cheers
Vladimir

