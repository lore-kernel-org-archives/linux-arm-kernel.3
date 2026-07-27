Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B35FC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iGjw8JNSkZGfBnUlq2+/WKJTBO6Mk7E/IPx2aQlf3Y=; b=kbkZX9Wqlp6ak/+cAWCwRVjgH0
	JcyuoVq1Q59/hj6tN56Gkol/GuwevEqZZ2rQhjT6YPqAxb3fSg9vznPVyMMvlEoXc9ofoW2t6i3GI
	IthxKOxPw47bEr+Fz0jS4bz8wCCQWJOasHLP6eeE7OJ4rUH+vmJJczdbOquUWPXg3VsfqwXGbAFoO
	6TRi3cbTUukOLUH/VIk1ffyA47k2uvvJ/wuu85AMBdeRXYRpwDjWHwcuQ3qtmNKTq5EUg2Evpz0qD
	tpNMhvrzrShhoLOXwv/hy2CPABMdCInhfObAx5P8+Ge2X3iKhTzFRZGCOFvWcBEJoCcw2Qq4PqFej
	xTyRmmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woL1w-00000002nM1-44Wp;
	Mon, 27 Jul 2026 13:06:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woL1r-00000002nJo-2MIV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:06:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF5FC1476;
	Mon, 27 Jul 2026 06:05:52 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E86743F66F;
	Mon, 27 Jul 2026 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785157557; bh=mmEOawEsswncTtaCfmhbMug5h9MllDiZo3z/ZHQ47QU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bghBWnGaLgykHXNC+IELPKx7lTB+1igZl0fVFheThwlG/5u+nJGeBChEYSU6uXWBN
	 T3qUdJXdnLhM//mcQXqzw3u92HRsXyzlrv0url3UkOwitlsbpAxtLDwBueU+33cmia
	 lOYH2cpsT95BXmUm9EeZmM75sJFqFptGj/r5p17U=
Message-ID: <5af733ed-a4d5-4d96-a5de-43caab9b0bd9@arm.com>
Date: Mon, 27 Jul 2026 14:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/36] arm64: entry: replace DAIF helpers with entry
 helpers
To: "Liao, Chang" <liaochang1@huawei.com>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com,
 catalin.marinas@arm.com, will@kernel.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-13-vladimir.murzin@arm.com>
 <6bfbb77f-6c98-44ba-a396-b5d5287d190d@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <6bfbb77f-6c98-44ba-a396-b5d5287d190d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_060559_846946_2D78DCFB 
X-CRM114-Status: GOOD (  30.30  )
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

On 7/14/26 13:14, Liao, Chang wrote:
> Hi, Vladimir and Ada,
> 
> 在 2026/7/9 20:13, Vladimir Murzin 写道:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> Replace all uses of the `local_daif_...` helpers in `entry-common.c`
>> with the new entry-specific exception masking helpers.
>>
>> Also replace `local_irq_disable()` with a switch to NOIRQ context
>> using the new helpers. This provides:
>>
>> - consistency checks for hardware state
>>
>> - a unified style for managing exception context
>>
>> Now that exception context is tracked explicitly, involuntary kernel
>> preemption can be optimized. We either preempt:
>>
>> - from PROCESS exception context, or
>>
>> - when returning from an interrupt handler, where the GIC code
>>   switches from NONMI to NOIRQ exception context
>>
>> To support this split, divide `arm64_exit_to_kernel_mode()` into
>> preempt, non-preempt, and dispatch parts.
>>
>> Remove `local_daif_inherit()`, since it is no longer used.
>>
>> Now that both the irqflags API and entry code handle DAIF and PMR
>> correctly, remove `GIC_PRIO_PSR_I_SET` from the PMR value set by
>> `kernel_entry` in `entry.S` and by `init_gic_priority_masking()` in
>> `kernel/smp.c`.
>>
>> The `local_daif_...` helpers and other specialized code still use
>> `GIC_PRIO_PSR_I_SET` for now; this commit does not change their
>> behavior.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/include/asm/daifflags.h |  22 ---
>>  arch/arm64/kernel/entry-common.c   | 272 ++++++++++++++++++++---------
>>  arch/arm64/kernel/entry.S          |   2 +-
>>  arch/arm64/kernel/smp.c            |   2 +-
>>  4 files changed, 190 insertions(+), 108 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
>> index 56341578e7e3..6b14ec4d4dbe 100644
>> --- a/arch/arm64/include/asm/daifflags.h
>> +++ b/arch/arm64/include/asm/daifflags.h
>> @@ -120,28 +120,6 @@ static __always_inline void local_daif_restore(unsigned long flags)
>>  		trace_hardirqs_off();
>>  }
>>  
>> -/*
>> - * Called by synchronous exception handlers to restore the DAIF bits that were
>> - * modified by taking an exception.
>> - */
>> -static __always_inline void local_daif_inherit(struct pt_regs *regs)
>> -{
>> -	unsigned long flags = regs->pstate & DAIF_MASK;
>> -
>> -	if (!regs_irqs_disabled(regs))
>> -		trace_hardirqs_on();
>> -
>> -	if (system_uses_irq_prio_masking())
>> -		gic_write_pmr(regs->pmr);
>> -
>> -	/*
>> -	 * We can't use local_daif_restore(regs->pstate) here as
>> -	 * system_has_prio_mask_debugging() won't restore the I bit if it can
>> -	 * use the pmr instead.
>> -	 */
>> -	write_sysreg(flags, daif);
>> -}
>> -
>>  /*
>>   * During early boot, we unmask PSR.DA before the GIC has been set up.
>>   * If we use IRQ priority masking, the PMR and PSR will be out of sync
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index 2be42d7f4eaa..a13653b228b7 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -18,11 +18,11 @@
>>  #include <linux/thread_info.h>
>>  
>>  #include <asm/cpufeature.h>
>> -#include <asm/daifflags.h>
>>  #include <asm/esr.h>
>>  #include <asm/exception.h>
>>  #include <asm/fpsimd.h>
>>  #include <asm/irq_regs.h>
>> +#include <asm/interrupts/entry.h>
>>  #include <asm/kprobes.h>
>>  #include <asm/mmu.h>
>>  #include <asm/processor.h>
>> @@ -52,12 +52,11 @@ static noinstr irqentry_state_t arm64_enter_from_kernel_mode(struct pt_regs *reg
>>   * After this function returns it is not safe to call regular kernel code,
>>   * instrumentable code, or any code which may trigger an exception.
>>   */
>> -static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
>> -					      irqentry_state_t state)
>> +static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
>> +						irqentry_state_t state,
>> +						arm64_exc_hwstate_t hwstate)
>>  {
>> -	local_irq_disable();
>> -	irqentry_exit_to_kernel_mode_preempt(regs, state);
>> -	local_daif_mask();
>> +	arm64_mask_exc_context(hwstate);
>>  	mte_check_tfsr_exit();
>>  	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
>>  }
>> @@ -69,6 +68,30 @@ static __always_inline void arm64_syscall_enter_from_user_mode(struct pt_regs *r
>>  	sme_enter_from_user_mode();
>>  }
>>  
>> +/*
>> + * We are returning from the context which allows involuntary kernel preemption
>> + */
>> +static void noinstr arm64_exit_to_kernel_mode_preempt(struct pt_regs *regs,
>> +						      irqentry_state_t state,
>> +						      arm64_exc_hwstate_t hwstate)
>> +{
>> +	irqentry_exit_to_kernel_mode_preempt(regs, state);
>> +	__arm64_exit_to_kernel_mode(regs, state, hwstate);
>> +}
>> +
>> +static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
>> +					      irqentry_state_t state,
>> +					      arm64_exc_hwstate_t hwstate)
>> +{
>> +	if (!arch_irqs_disabled_flags(hwstate.flags)) {
>> +		hwstate = arm64_lift_exc_context(hwstate, NOIRQ_CONTEXT);
>> +		arm64_exit_to_kernel_mode_preempt(regs, state, hwstate);
>> +		return;
>> +	}
>> +
>> +	__arm64_exit_to_kernel_mode(regs, state, hwstate);
>> +}
>> +
>>  /*
>>   * Handle IRQ/context state management when entering from user mode.
>>   * Before this function is called it is not safe to call regular kernel code,
>> @@ -82,11 +105,12 @@ static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
>>  	sme_enter_from_user_mode();
>>  }
>>  
>> -static __always_inline void arm64_syscall_exit_to_user_mode(struct pt_regs *regs)
>> +static __always_inline void arm64_syscall_exit_to_user_mode(struct pt_regs *regs,
>> +							    arm64_exc_hwstate_t hwstate)
>>  {
>> -	local_irq_disable();
>> +	hwstate = arm64_lift_exc_context(hwstate, NOIRQ_CONTEXT);
>>  	syscall_exit_to_user_mode_prepare(regs);
>> -	local_daif_mask();
>> +	arm64_mask_exc_context(hwstate);
> To be honest, arm64_mask_exc_context() is not quite self-explanatory. To make the code
> more readable, could we use arm64_lift_exc_context(hwstate, CRITICAL_CONTEXT) directly
> here instead?
> 

That suggestion is similar to one of my early implementations. One
piece of offline feedback I received was that, in most cases, we
only need simple unmask/mask operations, with only a few cases
requiring something more involved. The idea was therefore to keep
the common and boring cases using unmask/mask, while using
drop/lift only for the non-trivial cases so they immediately stand
out.

I'm more than happy to revisit if there is consesus on use expicit
drop/lift everywhere...


>>  	sme_exit_to_user_mode();
>>  	mte_check_tfsr_exit();
>>  	exit_to_user_mode();
>> @@ -97,11 +121,12 @@ static __always_inline void arm64_syscall_exit_to_user_mode(struct pt_regs *regs
>>   * After this function returns it is not safe to call regular kernel code,
>>   * instrumentable code, or any code which may trigger an exception.
>>   */
>> -static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
>> +static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs,
>> +						    arm64_exc_hwstate_t hwstate)
>>  {
>> -	local_irq_disable();
>> +	hwstate = arm64_lift_exc_context(hwstate, NOIRQ_CONTEXT);
>>  	irqentry_exit_to_user_mode_prepare(regs);
>> -	local_daif_mask();
>> +	arm64_mask_exc_context(hwstate);
>>  	sme_exit_to_user_mode();
>>  	mte_check_tfsr_exit();
>>  	exit_to_user_mode();
> Looking through the exception exit paths from EL0 to user mode, they all seem to boil down
> to two distinct patterns of exception mask transitions:
> 
> 1. Interrupts (e.g., el0_interrupt): Transition goes from NOIRQ_CONTEXT to CRITICAL_CONTEXT.
> 2. Other exceptions (e.g., el0_svc, el0_error, ret_from_fork): Transition goes from
>    PROCESS_CONTEXT to CRITICAL_CONTEXT.
> 
> Currently, these two helper functions share a lot of duplicate boilerplate code and
> hide these transitions behind less self-explanatory helpers like arm64_mask_exc_context().
> To make the state-machine transitions explicit and unify the exit flow, I would suggest
> reworking these helpers as follows:
> 
> /* Prepare for syscall exit by lifting the implicit PROCESS_CONTEXT to NOIRQ_CONTEXT */
> static __always_inline arm64_exc_hwstate_t
> arm64_syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
> {
> 	arm64_exc_hwstate_t hwstate =
> 		arm64_lift_exc_context(arm64_exc_hwstate_of_context(PROCESS_CONTEXT), NOIRQ_CONTEXT);
> 	syscall_exit_to_user_mode_prepare(regs);
> 	return hwstate;
> }
> 
> /* Prepare for other EL0 exceptions exit by lifting the inherited hwstate to NOIRQ_CONTEXT */
> static __always_inline arm64_exc_hwstate_t
> arm64_exit_to_user_mode_prepare(struct pt_regs *regs, arm64_exc_hwstate_t hwstate)
> {
> 	hwstate = arm64_lift_exc_context(hwstate, NORIRQ_CONTEXT);
> 	irqentry_exit_to_user_mode_prepare(regs);
> 	return hwstate;
> }
> 
> /* Finalize the exit by lifting to CRITICAL_CONTEXT before entering assembly world */
> static __always_inline
> void arm64_exit_to_user_mode(arm64_exc_hwstate_t hwstate)
> {
> 	arm64_lift_exc_context(hwstate, CRITICAL_CONTEXT);
> 	sme_exit_to_user_mode();
> 	mte_check_tfsr_exit();
> 	exit_to_user_mode();
> }
> 
> asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
> {
> 	arm64_exc_hwstate_t hwstate = arm64_syscall_exit_to_user_mode_prepare(regs);
> 	arm64_exit_to_user_mode(hwstate);
> }
> 

I don't have a strong opinion on this. If there is strong support
for going that way, I'm happy to follow. The only thing I'd point
out is that this would probably need to be a separate patch,
either as a preparatory step or as a later optimization.

Cheers
Vladimir

>> @@ -109,7 +134,10 @@ static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
>>  
>>  asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
>>  {
>> -	arm64_syscall_exit_to_user_mode(regs);
>> +	arm64_exc_hwstate_t hwstate = arm64_exc_hwstate_of_context(PROCESS_CONTEXT);
>> +
>> +	arm64_syscall_exit_to_user_mode(regs, hwstate);
>> +	arm64_debug_exc_context(CRITICAL_CONTEXT);
>>  }
>>  
>>  /*
>> @@ -315,63 +343,69 @@ UNHANDLED(el1t, 64, error)
>>  static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>>  {
>>  	unsigned long far = read_sysreg(far_el1);
>> +	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>> -	local_daif_inherit(regs);
>> +	hwstate = arm64_inherit_exc_context(regs);
>>  	do_mem_abort(far, esr, regs);
>> -	arm64_exit_to_kernel_mode(regs, state);
>> +	arm64_exit_to_kernel_mode(regs, state, hwstate);
>>  }
>>  
>>  static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
>>  {
>>  	unsigned long far = read_sysreg(far_el1);
>> +	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>> -	local_daif_inherit(regs);
>> +	hwstate = arm64_inherit_exc_context(regs);
>>  	do_sp_pc_abort(far, esr, regs);
>> -	arm64_exit_to_kernel_mode(regs, state);
>> +	arm64_exit_to_kernel_mode(regs, state, hwstate);
>>  }
>>  
>>  static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>> -	local_daif_inherit(regs);
>> +	hwstate = arm64_inherit_exc_context(regs);
>>  	do_el1_undef(regs, esr);
>> -	arm64_exit_to_kernel_mode(regs, state);
>> +	arm64_exit_to_kernel_mode(regs, state, hwstate);
>>  }
>>  
>>  static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>> -	local_daif_inherit(regs);
>> +	hwstate = arm64_inherit_exc_context(regs);
>>  	do_el1_bti(regs, esr);
>> -	arm64_exit_to_kernel_mode(regs, state);
>> +	arm64_exit_to_kernel_mode(regs, state, hwstate);
>>  }
>>  
>>  static void noinstr el1_gcs(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>> -	local_daif_inherit(regs);
>> +	hwstate = arm64_inherit_exc_context(regs);
>>  	do_el1_gcs(regs, esr);
>> -	arm64_exit_to_kernel_mode(regs, state);
>> +	arm64_exit_to_kernel_mode(regs, state, hwstate);
>>  }
>>  
>>  static void noinstr el1_mops(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>> -	local_daif_inherit(regs);
>> +	hwstate = arm64_inherit_exc_context(regs);
>>  	do_el1_mops(regs, esr);
>> -	arm64_exit_to_kernel_mode(regs, state);
>> +	arm64_exit_to_kernel_mode(regs, state, hwstate);
>>  }
>>  
>>  static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
>> @@ -431,12 +465,13 @@ static void noinstr el1_brk64(struct pt_regs *regs, unsigned long esr)
>>  
>>  static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>> -	local_daif_inherit(regs);
>> +	hwstate = arm64_inherit_exc_context(regs);
>>  	do_el1_fpac(regs, esr);
>> -	arm64_exit_to_kernel_mode(regs, state);
>> +	arm64_exit_to_kernel_mode(regs, state, hwstate);
>>  }
>>  
>>  asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>> @@ -486,16 +521,20 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>>  	default:
>>  		__panic_unhandled(regs, "64-bit el1h sync", esr);
>>  	}
>> +
>> +	arm64_debug_exc_context(CRITICAL_CONTEXT);
>>  }
>>  
>>  static __always_inline void __el1_pnmi(struct pt_regs *regs,
>>  				       void (*handler)(struct pt_regs *))
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>>  
>>  	state = irqentry_nmi_enter(regs);
>> +	hwstate = arm64_unmask_exc_context(NONMI_CONTEXT);
>>  	do_interrupt_handler(regs, handler);
>> -	local_daif_mask();
>> +	arm64_mask_exc_context(hwstate);
>>  	irqentry_nmi_exit(regs, state);
>>  }
>>  
>> @@ -506,21 +545,32 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>>  
>> +	arm64_unmask_exc_context(NONMI_CONTEXT);
>> +
>>  	irq_enter_rcu();
>>  	do_interrupt_handler(regs, handler);
>>  	irq_exit_rcu();
>>  
>> -	arm64_exit_to_kernel_mode(regs, state);
>> +	/*
>> +	 * If pseudo-NMIs are enabled and the interrupted context had
>> +	 * IRQs unmasked, the interrupt handler will have cleared DAIF
>> +	 * and switched to PMR masking in order to handle
>> +	 * NMIs. Otherwise it would keep IF.  In both cases on return
>> +	 * we effectivly have NOIRQ_CONTEXT - keep track of it
>> +	 */
>> +	arm64_debug_exc_context(NOIRQ_CONTEXT);
>> +	arm64_exit_to_kernel_mode_preempt(regs, state, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
>>  }
>> +
>>  static void noinstr el1_interrupt(struct pt_regs *regs,
>>  				  void (*handler)(struct pt_regs *))
>>  {
>> -	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
>> -
>>  	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
>>  		__el1_pnmi(regs, handler);
>>  	else
>>  		__el1_irq(regs, handler);
>> +
>> +	arm64_debug_exc_context(CRITICAL_CONTEXT);
>>  }
>>  
>>  asmlinkage void noinstr el1h_64_irq_handler(struct pt_regs *regs)
>> @@ -536,28 +586,31 @@ asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
>>  asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
>>  {
>>  	unsigned long esr = read_sysreg(esr_el1);
>> +	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>>  
>> -	local_daif_restore(DAIF_ERRCTX);
>> +	hwstate = arm64_unmask_exc_context(ERROR_CONTEXT);
>>  	state = irqentry_nmi_enter(regs);
>>  	do_serror(regs, esr);
>> -	local_daif_mask();
>> +	arm64_mask_exc_context(hwstate);
>>  	irqentry_nmi_exit(regs, state);
>>  }
>>  
>>  static void noinstr el0_da(struct pt_regs *regs, unsigned long esr)
>>  {
>>  	unsigned long far = read_sysreg(far_el1);
>> +	arm64_exc_hwstate_t hwstate;
>>  
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_mem_abort(far, esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_ia(struct pt_regs *regs, unsigned long esr)
>>  {
>>  	unsigned long far = read_sysreg(far_el1);
>> +	arm64_exc_hwstate_t hwstate;
>>  
>>  	/*
>>  	 * We've taken an instruction abort from userspace and not yet
>> @@ -568,114 +621,139 @@ static void noinstr el0_ia(struct pt_regs *regs, unsigned long esr)
>>  		arm64_apply_bp_hardening();
>>  
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_mem_abort(far, esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_fpsimd_acc(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_fpsimd_acc(esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_sve_acc(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_sve_acc(esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_sme_acc(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_sme_acc(esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_fpsimd_exc(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_fpsimd_exc(esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_sys(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_el0_sys(esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_pc(struct pt_regs *regs, unsigned long esr)
>>  {
>>  	unsigned long far = read_sysreg(far_el1);
>> +	arm64_exc_hwstate_t hwstate;
>>  
>>  	if (!is_ttbr0_addr(instruction_pointer(regs)))
>>  		arm64_apply_bp_hardening();
>>  
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_sp_pc_abort(far, esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_sp(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_sp_pc_abort(regs->sp, esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_undef(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_el0_undef(regs, esr);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_bti(struct pt_regs *regs)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_el0_bti(regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_mops(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_el0_mops(regs, esr);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_gcs(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_el0_gcs(regs, esr);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_inv(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	bad_el0_sync(regs, 0, esr);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	if (!is_ttbr0_addr(regs->pc))
>>  		arm64_apply_bp_hardening();
>>  
>> @@ -683,12 +761,13 @@ static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
>>  	debug_exception_enter(regs);
>>  	do_breakpoint(esr, regs);
>>  	debug_exception_exit(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> -	arm64_exit_to_user_mode(regs);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>>  	bool step_done;
>>  
>>  	if (!is_ttbr0_addr(regs->pc))
>> @@ -702,50 +781,56 @@ static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
>>  	 * the single-step is complete.
>>  	 */
>>  	step_done = try_step_suspended_breakpoints(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	if (!step_done)
>>  		do_el0_softstep(esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_watchpt(struct pt_regs *regs, unsigned long esr)
>>  {
>>  	/* Watchpoints are the only debug exception to write FAR_EL1 */
>>  	unsigned long far = read_sysreg(far_el1);
>> +	arm64_exc_hwstate_t hwstate;
>>  
>>  	arm64_enter_from_user_mode(regs);
>>  	debug_exception_enter(regs);
>>  	do_watchpoint(far, esr, regs);
>>  	debug_exception_exit(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> -	arm64_exit_to_user_mode(regs);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_brk64(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_el0_brk64(esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_svc(struct pt_regs *regs)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>>  	arm64_syscall_enter_from_user_mode(regs);
>>  	cortex_a76_erratum_1463225_svc_handler();
>>  	fpsimd_syscall_enter();
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_el0_svc(regs);
>> -	arm64_syscall_exit_to_user_mode(regs);
>> +	arm64_syscall_exit_to_user_mode(regs, hwstate);
>>  	fpsimd_syscall_exit();
>>  }
>>  
>>  static void noinstr el0_fpac(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_el0_fpac(regs, esr);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
>> @@ -814,6 +899,8 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
>>  	default:
>>  		el0_inv(regs, esr);
>>  	}
>> +
>> +	arm64_debug_exc_context(CRITICAL_CONTEXT);
>>  }
>>  
>>  static void noinstr el0_interrupt(struct pt_regs *regs,
>> @@ -821,7 +908,7 @@ static void noinstr el0_interrupt(struct pt_regs *regs,
>>  {
>>  	arm64_enter_from_user_mode(regs);
>>  
>> -	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
>> +	arm64_unmask_exc_context(NONMI_CONTEXT);
>>  >  	if (regs->pc & BIT(55))
>>  		arm64_apply_bp_hardening();
>> @@ -830,7 +917,14 @@ static void noinstr el0_interrupt(struct pt_regs *regs,
>>  	do_interrupt_handler(regs, handler);
>>  	irq_exit_rcu();
>>  
>> -	arm64_exit_to_user_mode(regs);
>> +	/*
>> +	 * For the same reason as in el1_irq() we effectivly
>> +	 * have NOIRQ_CONTEXT on return from handler - keep
>> +	 * track of it
>> +	 */
>> +	arm64_debug_exc_context(NOIRQ_CONTEXT);
>> +	arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
>> +	arm64_debug_exc_context(CRITICAL_CONTEXT);
>>  }
>>  
>>  static void noinstr __el0_irq_handler_common(struct pt_regs *regs)
>> @@ -856,15 +950,17 @@ asmlinkage void noinstr el0t_64_fiq_handler(struct pt_regs *regs)
>>  static void noinstr __el0_error_handler_common(struct pt_regs *regs)
>>  {
>>  	unsigned long esr = read_sysreg(esr_el1);
>> +	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>>  
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_ERRCTX);
>> +	hwstate = arm64_unmask_exc_context(ERROR_CONTEXT);
>>  	state = irqentry_nmi_enter(regs);
>>  	do_serror(regs, esr);
>>  	irqentry_nmi_exit(regs, state);
>> -	local_daif_restore(DAIF_PROCCTX);
>> -	arm64_exit_to_user_mode(regs);
>> +	hwstate = arm64_drop_exc_context(hwstate, PROCESS_CONTEXT);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>> +	arm64_debug_exc_context(CRITICAL_CONTEXT);
>>  }
>>  
>>  asmlinkage void noinstr el0t_64_error_handler(struct pt_regs *regs)
>> @@ -875,27 +971,33 @@ asmlinkage void noinstr el0t_64_error_handler(struct pt_regs *regs)
>>  #ifdef CONFIG_COMPAT
>>  static void noinstr el0_cp15(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_el0_cp15(esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_svc_compat(struct pt_regs *regs)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_syscall_enter_from_user_mode(regs);
>>  	cortex_a76_erratum_1463225_svc_handler();
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_el0_svc_compat(regs);
>> -	arm64_syscall_exit_to_user_mode(regs);
>> +	arm64_syscall_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  static void noinstr el0_bkpt32(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>> +
>>  	arm64_enter_from_user_mode(regs);
>> -	local_daif_restore(DAIF_PROCCTX);
>> +	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
>>  	do_bkpt32(esr, regs);
>> -	arm64_exit_to_user_mode(regs);
>> +	arm64_exit_to_user_mode(regs, hwstate);
>>  }
>>  
>>  asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
>> @@ -946,6 +1048,8 @@ asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
>>  	default:
>>  		el0_inv(regs, esr);
>>  	}
>> +
>> +	arm64_debug_exc_context(CRITICAL_CONTEXT);
>>  }
>>  
>>  asmlinkage void noinstr el0t_32_irq_handler(struct pt_regs *regs)
>> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
>> index f63049ac32dc..cb3be770f2d0 100644
>> --- a/arch/arm64/kernel/entry.S
>> +++ b/arch/arm64/kernel/entry.S
>> @@ -316,7 +316,7 @@ alternative_else_nop_endif
>>  
>>  	mrs_s	x20, SYS_ICC_PMR_EL1
>>  	str	w20, [sp, #S_PMR]
>> -	mov	x20, #GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET
>> +	mov	x20, #GIC_PRIO_IRQON
>>  	msr_s	SYS_ICC_PMR_EL1, x20
>>  
>>  .Lskip_pmr_save\@:
>> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
>> index d46022f72075..b91cf163aac7 100644
>> --- a/arch/arm64/kernel/smp.c
>> +++ b/arch/arm64/kernel/smp.c
>> @@ -185,7 +185,7 @@ static void init_gic_priority_masking(void)
>>  	WARN_ON(!(cpuflags & PSR_I_BIT));
>>  	WARN_ON(!(cpuflags & PSR_F_BIT));
>>  
>> -	gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);
>> +	gic_write_pmr(GIC_PRIO_IRQON);
>>  }
>>  
>>  /*
> 
> -- BR Liao, Chang
> 


