Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E204CC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxJwbsrkoG8yNikWawE6fCceLbRB3E5/DU/dVJxCAZ4=; b=jtki2DEsue7yzq0rZfzaA64cWN
	98lcTo/t5ha50NeKPWf/n43Lf5t4b8tPD0MaYE3CAqo+6MIxxJS/FTYwvr6t1iudCki/d9UubRQq0
	oE8s0eUYFeuP8CTAn9/Bx2kJLbariZ35EC2rZPB4zp/8HEhYjqoP836eJYXwd88GqAJhO4Ea9HefC
	5SJl3I8hIJycEMealViW6Tq4s26L/mTuV7xHHz+UHNYY6DuDi+gTIRxk7iQ3YR6rdcN+2SWqOfn3Y
	A2N8Os0seRGMegADStpT7qOm+czNhc5GXG6Msgb8Q2BrxYPkPRvxHkSCT++2eE2j5udNV1OZGzMxa
	DBjmbLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8evh-00000002Ntv-26AI;
	Mon, 21 Sep 2026 14:23:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8evf-00000002Nso-07fl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:23:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A190819F0;
	Mon, 21 Sep 2026 07:23:30 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.carmbridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58E693F86C;
	Mon, 21 Sep 2026 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790000614; bh=2XwvUk54/jBlQoYAN3bc7UxBCQ83zSbZ3E/fbuNoCYY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=chwlilSUiv1vDIcgfcigVcVozgqkdNyN8hepwRetITJkz93hyI4Pgs6BYQm/k3rz6
	 dUbIYUEE/TIihRPGNZNRh0Yk1V00CLzaIPbZBKHUFK8/iqIGay9amA9EIgYZQkRRT5
	 ne8SRM0mLCcKQ4M9b7U8FY+zd8qUUfRFDQYxmh3E=
Message-ID: <75e7767e-f22a-45f7-ada6-72b1645ba32f@arm.com>
Date: Mon, 21 Sep 2026 15:23:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/38] arm64: nmi: Manage masking for superpriority
 interrupts
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 maz@kernel.org, lpieralisi@kernel.org, liaochang1@huawei.com
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-25-vladimir.murzin@arm.com>
 <6cf199f1-3e22-4c20-b1fc-f71b6e830a0b@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <6cf199f1-3e22-4c20-b1fc-f71b6e830a0b@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_072335_166035_6666F264 
X-CRM114-Status: GOOD (  27.27  )
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

On 9/17/26 12:41, Jinjie Ruan wrote:
> 
> 在 2026/9/14 18:20, Vladimir Murzin 写道:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> Extend logic to handle and debug exception context/state with knowlage
>> of FEAT_NMI.
>>
>> Take care to order writes to ALLINT relative to DAIF, as clearing
>> ALLINT before DAIF could result in taking an NMI while DAIF is fully
>> masked, as could setting it after DAIF.
>>
>> Since superpriority interrupts are not masked through DAIF like pseduo
>> NMIs are, we also need to modify the assembler macros for managing
>> DAIF to ensure that the masking is done in the assembly code.
>>
>> Note that save_and_disable_irq/restore_irq and
>> save_and_disable_daif/restore_irq pairs are used in distinct
>> contextes:
>>
>> - former is used in context of SW PAN to quickly disable/enable
>>   preemption
>>
>> - latter is used to completely mask all exceptions.
>>
>> For that reason split save_and_disable_daif/restore_irq into more
>> generic exception save restore pair and plumb with FEAT_NMI logic.
>>
>> Co-developed-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/include/asm/assembler.h            | 20 +++++++++--
>>  .../include/asm/interrupts/common_flags.h     | 36 +++++++++++++++++++
>>  arch/arm64/include/asm/interrupts/entry.h     |  6 ++--
>>  arch/arm64/include/asm/interrupts/masking.h   |  3 +-
>>  arch/arm64/include/asm/irqflags.h             |  3 +-
>>  arch/arm64/kernel/entry.S                     | 12 +++----
>>  6 files changed, 68 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
>> index 0b58b550e8dc..bcdbc308afba 100644
>> --- a/arch/arm64/include/asm/assembler.h
>> +++ b/arch/arm64/include/asm/assembler.h
>> @@ -37,11 +37,27 @@
>>  /*
>>   * Save/restore interrupts.
>>   */
>> -	.macro save_and_disable_daif, flags
>> -	mrs	\flags, daif
>> +	.macro save_and_disable_exceptions, flags, tmp
>> +	mrs     \flags, daif		// updates flags[9:6] with DAIF
>> +#ifdef CONFIG_ARM64_NMI
>> +alternative_if ARM64_NMI
>> +	mrs_s	\tmp, SYS_ALLINT	// updates tmp[13] with AllInt
>> +	msr_s	SYS_ALLINT_SET, xzr
>> +	orr	\flags, \flags, \tmp	// now flags[13,9:6] carry pair of AllInt,DAIF
>> +alternative_else_nop_endif
>> +#endif
>>  	msr	daifset, #0xf
>>  	.endm
>>  
>> +	.macro  restore_exceptions, flags
>> +	msr     daif, \flags		// bits other than flags[9:6] are ignored
>> +#ifdef CONFIG_ARM64_NMI
>> +alternative_if ARM64_NMI
>> +	msr_s	SYS_ALLINT, \flags	// bits other than flags[13] are ignored
>> +alternative_else_nop_endif
>> +#endif
>> +	.endm
>> +
>>  	.macro	save_and_disable_irq, flags
>>  	mrs	\flags, daif
>>  	msr	daifset, #3
>> diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
>> index c50c6e6473ec..18c9a392028a 100644
>> --- a/arch/arm64/include/asm/interrupts/common_flags.h
>> +++ b/arch/arm64/include/asm/interrupts/common_flags.h
>> @@ -20,6 +20,14 @@
>>  /*
>>   * Exception context mapping
>>   *
>> + * FEAT_NMI
>> + *
>> + * CRITICAL -> DAIF + AllInt (corresponds to the state on exception entry)
>> + * ERROR    ->  AIF + AllInt
>> + * NONMI    ->   IF + AllInt
>> + * NOIRQ    ->   IF
>> + * PROCESS  ->    0
>> + *
>>   * pseudo-NMI
>>   *
>>   * CRITICAL -> DAIF + IRQON  (corresponds to the state on exception entry)
>> @@ -76,6 +84,7 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_noirq_context(void)
>>  		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX, .pmr=GIC_PRIO_IRQOFF};
>>  
>>  	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
>> +
>>  }
> An extra blank line.
> 

Ack.

>>  
>>  static __always_inline
>> @@ -84,6 +93,9 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_nonmi_context(void)
>>  	if (system_uses_irq_prio_masking())
>>  		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ, .pmr=GIC_PRIO_IRQON};
>>  
>> +	if (system_uses_nmi())
>> +               return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ, .allint=ALLINT_ALLINT};
>> +
>>  	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
>>  }
>>  
>> @@ -93,6 +105,9 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_error_context(void)
>>  	if (system_uses_irq_prio_masking())
>>  		return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX, .pmr=GIC_PRIO_IRQON};
>>  
>> +	if (system_uses_nmi())
>> +		return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX, .allint=ALLINT_ALLINT};
>> +
>>  	return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX};
>>  }
>>  
>> @@ -102,6 +117,9 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_critical_context(void)
>>  	if (system_uses_irq_prio_masking())
>>  		return (arm64_exc_hwstate_t){.daif=DAIF_MASK, .pmr=GIC_PRIO_IRQON};
>>  
>> +	if (system_uses_nmi())
>> +		return (arm64_exc_hwstate_t){.daif=DAIF_MASK, .allint=ALLINT_ALLINT};
>> +
>>  	return (arm64_exc_hwstate_t){.daif=DAIF_MASK};
>>  }
>>  
>> @@ -131,6 +149,9 @@ arm64_exc_hwstate_t arm64_inherit_exc_hwstate(struct pt_regs *regs)
>>  	if (system_uses_irq_prio_masking())
>>  		state.pmr = regs->pmr;
>>  
>> +	if (system_uses_nmi())
>> +		state.allint = regs->pstate & PSR_ALLINT_BIT;
>> +
>>  	return state;
>>  }
>>  
>> @@ -150,6 +171,9 @@ void arm64_debug_exc_hwstate(arm64_exc_hwstate_t expected)
>>  	if (system_uses_irq_prio_masking()) {
>>  		WARN_ONCE(1, "Unexpected DAIF+PMR: 0x%x + 0x%x (expected 0x%x + 0x%x)\n",
>>  			  actual.daif, actual.pmr, expected.daif, expected.pmr);
>> +	} else if (system_uses_nmi()) {
>> +		WARN_ONCE(1, "Unexpected DAIF+ALLINT: 0x%x + 0x%x (expected 0x%x + 0x%x)\n",
>> +			  actual.daif, actual.allint, expected.daif, expected.allint);
>>  	} else {
>>  		WARN_ONCE(1, "Unexpected DAIF: 0x%x (expected 0x%x)\n",
>>  			  actual.daif, expected.daif);
>> @@ -168,6 +192,7 @@ static __always_inline
>>  void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
>>  {
>>  	bool pseudo_nmi = system_uses_irq_prio_masking();
>> +	bool nmi = system_uses_nmi();
>>  
>>  	barrier();
>>  
>> @@ -194,8 +219,19 @@ void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
>>  		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>>  	}
>>  
>> +	/*
>> +	 * Try to order ALLINT writes to be consistent with the DAIF state :
>> +	 * we don't want to take an NMI with DAIF masked or when it should
>> +	 * be masked but isn't yet.
>> +	 */
>> +	if (nmi && (hwstate.allint & ALLINT_ALLINT) && force)
>> +		_allint_set();
>> +
>>  	write_sysreg(hwstate.daif, daif);
>>  
>> +	if (nmi && !(hwstate.allint & ALLINT_ALLINT) && force)
>> +		_allint_clear();
>> +
>>  	if (pseudo_nmi && hwstate.pmr == GIC_PRIO_IRQON && force) {
>>  		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>>  		pmr_sync();
>> diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
>> index 0cfca62aa25b..2a522dd15556 100644
>> --- a/arch/arm64/include/asm/interrupts/entry.h
>> +++ b/arch/arm64/include/asm/interrupts/entry.h
>> @@ -10,7 +10,6 @@
>>  #include <asm/cpufeature.h>
>>  #include <asm/interrupts/common_flags.h>
>>  
>> -
>>  static __always_inline
>>  arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
>>  						  arm64_exc_hwstate_t next)
>> @@ -26,7 +25,8 @@ arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
>>  	if (!irqs_disabled)
>>  		trace_hardirqs_on();
>>  
>> -	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
>> +	force = (system_uses_irq_prio_masking() && prev.pmr != next.pmr) ||
>> +		(system_uses_nmi() && prev.allint != next.allint);
>>  
>>  	__arm64_update_exc_hwstate(next, force);
>>  
>> @@ -58,6 +58,7 @@ arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_c
>>  			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so larger PMR value is weaker
>>  			 */
>>  			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr > next.pmr);
>> +			WARN_ON_ONCE(system_uses_nmi() && prev.allint < next.allint);
> "prev.allint < next.allint" check should not be constrained by whether
> DAIF is equal, because it is possible that both DAIF and ALLINT change
> when the context is dropped, And when the context is dropped, ALLINT
> will only remain unchanged ( 0 -> 0 or 1 -> 1 )or be cleared, such as:
> 
>        ERROR    -> PROCESS
> 
> daif   AIF     ->   0
> allint ALLINT  ->   0
> 

It is correct that we can check ALLINT independently, but I'm not sure
what value that brings. Most invalid transitions would be covered by
the DAIF check alone, except for transitions between NOIRQ and NONMI,
where we have to rely on ALLINT.

Cheers
Vladimir

>>  		}
>>  	}
>>  
>> @@ -77,6 +78,7 @@ arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_c
>>  			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so smaller PMR value is stronger
>>  			 */
>>  			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr < next.pmr);
>> +			WARN_ON_ONCE(system_uses_nmi() && prev.allint > next.allint);
> It is the same here.
> 
> Otherwise,
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
>>  		}
>>  	}
>>  
>> diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
>> index 8729922974b0..6c5ca5befbc1 100644
>> --- a/arch/arm64/include/asm/interrupts/masking.h
>> +++ b/arch/arm64/include/asm/interrupts/masking.h
>> @@ -30,7 +30,8 @@ arm64_exc_hwstates_t local_exceptions_save_mask(arm64_exc_context_t new)
>>  	 * We've just got actual HW state so we can rely on that to
>>  	 * optimize some unnecessary updates.
>>  	 */
>> -	force = system_uses_irq_prio_masking() && actual.pmr != state.pmr;
>> +	force = (system_uses_irq_prio_masking() && actual.pmr != state.pmr) ||
>> +		(system_uses_nmi() && actual.allint != state.allint);
>>  
>>  	if (!irqs_disabled)
>>  		trace_hardirqs_on();
>> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
>> index eedbdf7358e6..31b8f4e99532 100644
>> --- a/arch/arm64/include/asm/irqflags.h
>> +++ b/arch/arm64/include/asm/irqflags.h
>> @@ -31,9 +31,10 @@
>>  typedef union arm64_exc_hwstate {
>>  	struct {
>>  		u16 daif;
>> +		u16 allint;
>>  		u8 pmr;
>>  		u8 __pad0;
>> -		u32 __pad1;
>> +		u16 __pad1;
>>  	};
>>  	unsigned long flags;
>>  } arm64_exc_hwstate_t;
>> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
>> index cb3be770f2d0..39ea3fdeb03a 100644
>> --- a/arch/arm64/kernel/entry.S
>> +++ b/arch/arm64/kernel/entry.S
>> @@ -815,7 +815,7 @@ SYM_CODE_END(__bp_harden_el1_vectors)
>>   *
>>   */
>>  SYM_FUNC_START(cpu_switch_to)
>> -	save_and_disable_daif x11
>> +	save_and_disable_exceptions x11, x12
>>  	mov	x10, #THREAD_CPU_CONTEXT
>>  	add	x8, x0, x10
>>  	mov	x9, sp
>> @@ -839,7 +839,7 @@ SYM_FUNC_START(cpu_switch_to)
>>  	ptrauth_keys_install_kernel x1, x8, x9, x10
>>  	scs_save x0
>>  	scs_load_current
>> -	restore_irq x11
>> +	restore_exceptions x11
>>  	ret
>>  SYM_FUNC_END(cpu_switch_to)
>>  NOKPROBE(cpu_switch_to)
>> @@ -866,7 +866,7 @@ NOKPROBE(ret_from_fork)
>>   * Calls func(regs) using this CPU's irq stack and shadow irq stack.
>>   */
>>  SYM_FUNC_START(call_on_irq_stack)
>> -	save_and_disable_daif x9
>> +	save_and_disable_exceptions x9, x10
>>  #ifdef CONFIG_SHADOW_CALL_STACK
>>  	get_current_task x16
>>  	scs_save x16
>> @@ -881,10 +881,10 @@ SYM_FUNC_START(call_on_irq_stack)
>>  
>>  	/* Move to the new stack and call the function there */
>>  	add	sp, x16, #IRQ_STACK_SIZE
>> -	restore_irq x9
>> +	restore_exceptions x9
>>  	blr	x1
>>  
>> -	save_and_disable_daif x9
>> +	save_and_disable_exceptions x9, x10
>>  	/*
>>  	 * Restore the SP from the FP, and restore the FP and LR from the frame
>>  	 * record.
>> @@ -892,7 +892,7 @@ SYM_FUNC_START(call_on_irq_stack)
>>  	mov	sp, x29
>>  	ldp	x29, x30, [sp], #16
>>  	scs_load_current
>> -	restore_irq x9
>> +	restore_exceptions x9
>>  	ret
>>  SYM_FUNC_END(call_on_irq_stack)
>>  NOKPROBE(call_on_irq_stack)
> -- Best regards, Jinjie
> 


