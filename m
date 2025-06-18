Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15928C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 06:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d75iMO225RqnSPxtMwe2JWDfR9+5wuRF/NfwWBxLUuM=; b=OApXo6jjG3XDy6nd9wlHxWbB5d
	a5/qOUIwXn+7WMce/ahctYItTruWlzDrPDgVjBvU6gtJrmZgmRXKZO+FrMkVLWTrk8oaX/I8Kv/3I
	fKRewvgtINVTxiJPStNrR8/6UAKqREcYCl3Ram6XJoSTX13xqpWv+aM7NSmI05N603d6kMU+KsG3K
	mOAno6bpi+4eFDLtkPC8DJBAIGtG8+1CCdvUaePx82Zduqeov3fpq+20iD7yFaSN5fM7dbnGfB85n
	4ok6fNtnmNTMI2cptcO1dDm33Om8p1qADJwQttU+Vaanz7seRO4y8eC+G041EvYqaxu3WZMbHEiGM
	dvJoX69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmHG-00000009AgZ-1F2O;
	Wed, 18 Jun 2025 06:28:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmF1-00000009AOF-2yc1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 06:25:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDA1014BF;
	Tue, 17 Jun 2025 23:25:22 -0700 (PDT)
Received: from [10.163.35.185] (unknown [10.163.35.185])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 825A73F66E;
	Tue, 17 Jun 2025 23:25:40 -0700 (PDT)
Message-ID: <413d61bf-807e-406f-97a7-180ed7eef2e0@arm.com>
Date: Wed, 18 Jun 2025 11:55:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] arm64: debug: split single stepping exception
 entry
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-10-ada.coupriediaz@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609173413.132168-10-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_232547_842800_4CD019BD 
X-CRM114-Status: GOOD (  40.29  )
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

On 09/06/25 11:04 PM, Ada Couprie Diaz wrote:
> Currently all debug exceptions share common entry code and are routed
> to `do_debug_exception()`, which calls dynamically-registered
> handlers for each specific debug exception. This is unfortunate as
> different debug exceptions have different entry handling requirements,
> and it would be better to handle these distinct requirements earlier.

I guess makes sense to mention this in the commit message as this is the
common motivation for these dynamic to static exception handler changes.

> 
> The single stepping exception has the most constraints : it can be
> exploited to train branch predictors and it needs special handling at EL1
> for the Cortex-A76 erratum #1463225. We need to conserve all those
> mitigations.
> However, it does not write an address at FAR_EL1, as only hardware
> watchpoints do so.
> 
> The single-step handler does its own signaling if it needs to and only
> returns 0, so we can call it directly from `entry-common.c`.
> 
> Split the single stepping exception entry, adjust the function signature,
> keep the security mitigation and erratum handling.
> 
> Move the call to `arm64_apply_bp_hardening()` to `entry-common.c` so that
> we can do it as early as possible, and only for the exceptions coming
> from EL0, where it is needed.
> This is safe to do as it is `noinstr`, as are all the functions it
> may call. `el0_ia()` and `el0_pc()` already call it this way.

> 
> When taking a soft-step exception from EL0, most of the single stepping
> handling is safely preemptible : the only possible handler is
> `uprobe_singlestep_handler()`. It only operates on task-local data and
> properly checks its validity, then raises a Thread Information Flag,
> processed before returning to userspace in `do_notify_resume()`, which
> is already preemptible.
> However, the soft-step handler first calls `reinstall_suspended_bps()`
> to check if there is any hardware breakpoint or watchpoint pending
> or already stepped through.
> This cannot be preempted as it manipulates the hardware breakpoint and
> watchpoint registers.
> 
> Move the call to `try_step_suspended_breakpoints()` to `entry-common.c`
> and adjust the relevant comments.
> We can now safely unmask interrupts before handling the step itself,
> fixing a PREEMPT_RT issue where the handler could call a sleeping function
> with preemption disabled.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/Z6YW_Kx4S2tmj2BP@uudg.org/
> ---
>  arch/arm64/include/asm/exception.h |  1 +
>  arch/arm64/kernel/debug-monitors.c | 19 +++----------
>  arch/arm64/kernel/entry-common.c   | 43 ++++++++++++++++++++++++++++++
>  arch/arm64/kernel/hw_breakpoint.c  |  2 +-
>  4 files changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
> index 926bad7b6704..d6648b68a4c3 100644
> --- a/arch/arm64/include/asm/exception.h
> +++ b/arch/arm64/include/asm/exception.h
> @@ -62,6 +62,7 @@ void do_el1_gcs(struct pt_regs *regs, unsigned long esr);
>  void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
>  			struct pt_regs *regs);
>  void do_breakpoint(unsigned long esr, struct pt_regs *regs);
> +void do_softstep(unsigned long esr, struct pt_regs *regs);
>  void do_fpsimd_acc(unsigned long esr, struct pt_regs *regs);
>  void do_sve_acc(unsigned long esr, struct pt_regs *regs);
>  void do_sme_acc(unsigned long esr, struct pt_regs *regs);
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 74ffdfeff76f..3f5503d61aee 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -21,6 +21,7 @@
>  #include <asm/cputype.h>
>  #include <asm/daifflags.h>
>  #include <asm/debug-monitors.h>
> +#include <asm/exception.h>
>  #include <asm/kgdb.h>
>  #include <asm/kprobes.h>
>  #include <asm/system_misc.h>
> @@ -188,18 +189,10 @@ static void send_user_sigtrap(int si_code)
>  			      "User debug trap");
>  }
>  
> -static int single_step_handler(unsigned long unused, unsigned long esr,
> -			       struct pt_regs *regs)
> +void do_softstep(unsigned long esr, struct pt_regs *regs)
do_softstep() has been chosen here just to match the corresponding ESR
macros ESR_ELx_EC_SOFTSTP_[LOW|CUR] - although it does make sense and
also consistent.

>  {
> -	/*
> -	 * If we are stepping a pending breakpoint, call the hw_breakpoint
> -	 * handler first.
> -	 */
> -	if (try_step_suspended_breakpoints(regs))
> -		return 0;

This check has been moved individual exception handling functions.

> -
>  	if (call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
> -		return 0;
> +		return;
>  
>  	if (user_mode(regs)) {
>  		send_user_sigtrap(TRAP_TRACE);
> @@ -219,10 +212,8 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
>  		 */
>  		set_regs_spsr_ss(regs);
>  	}
> -
> -	return 0;
>  }
> -NOKPROBE_SYMBOL(single_step_handler);
> +NOKPROBE_SYMBOL(do_softstep);
>  
>  static int call_break_hook(struct pt_regs *regs, unsigned long esr)
>  {
> @@ -329,8 +320,6 @@ NOKPROBE_SYMBOL(try_handle_aarch32_break);
>  
>  void __init debug_traps_init(void)
>  {
> -	hook_debug_fault_code(DBG_ESR_EVT_HWSS, single_step_handler, SIGTRAP,
> -			      TRAP_TRACE, "single-step handler");
Right, this dynamic hook registration is no longer required.

>  	hook_debug_fault_code(DBG_ESR_EVT_BRK, brk_handler, SIGTRAP,
>  			      TRAP_BRKPT, "BRK handler");
>  }
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index be2add6b4ae3..5fb636efd554 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -535,6 +535,24 @@ static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
>  	arm64_exit_el1_dbg(regs);
>  }
>  
> +static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
> +{
> +	arm64_enter_el1_dbg(regs);
> +	if (!cortex_a76_erratum_1463225_debug_handler(regs)) {

Although mentioned in the commit message, this constraint is not
there in the present code though.

> +		debug_exception_enter(regs);
> +		/*
> +		 * After handling a breakpoint, we suspend the breakpoint
> +		 * and use single-step to move to the next instruction.
> +		 * If we are stepping a suspended breakpoint there's nothing more to do:
> +		 * the single-step is complete.
> +		 */
> +		if (!try_step_suspended_breakpoints(regs))
> +			do_softstep(esr, regs);
> +		debug_exception_exit(regs);
> +	}
> +	arm64_exit_el1_dbg(regs);
> +}
> +
>  static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
>  {
>  	unsigned long far = read_sysreg(far_el1);
> @@ -587,6 +605,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>  		el1_breakpt(regs, esr);
>  		break;
>  	case ESR_ELx_EC_SOFTSTP_CUR:
> +		el1_softstp(regs, esr);
> +		break;Changes to EL1 exception handling as required.

>  	case ESR_ELx_EC_WATCHPT_CUR:
>  	case ESR_ELx_EC_BRK64:
>  		el1_dbg(regs, esr);
> @@ -793,6 +813,25 @@ static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
>  	exit_to_user_mode(regs);
>  }
>  
> +static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
> +{
> +	if (!is_ttbr0_addr(regs->pc))
> +		arm64_apply_bp_hardening();
> +
> +	enter_from_user_mode(regs);
> +	/*
> +	 * After handling a breakpoint, we suspend the breakpoint
> +	 * and use single-step to move to the next instruction.
> +	 * If we are stepping a suspended breakpoint there's nothing more to do:
> +	 * the single-step is complete.
> +	 */
> +	if (!try_step_suspended_breakpoints(regs)) {
> +		local_daif_restore(DAIF_PROCCTX);
> +		do_softstep(esr, regs);
> +	}
> +	exit_to_user_mode(regs);
> +}
> +
>  static void noinstr el0_dbg(struct pt_regs *regs, unsigned long esr)
>  {
>  	/* Only watchpoints write FAR_EL1, otherwise its UNKNOWN */
> @@ -875,6 +914,8 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
>  		el0_breakpt(regs, esr);
>  		break;
>  	case ESR_ELx_EC_SOFTSTP_LOW:
> +		el0_softstp(regs, esr);
> +		break;
>  	case ESR_ELx_EC_WATCHPT_LOW:
>  	case ESR_ELx_EC_BRK64:
>  		el0_dbg(regs, esr);
> @@ -997,6 +1038,8 @@ asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
>  		el0_breakpt(regs, esr);
>  		break;
>  	case ESR_ELx_EC_SOFTSTP_LOW:
> +		el0_softstp(regs, esr);
> +		break;

Changes to EL0 exception handling as required.

>  	case ESR_ELx_EC_WATCHPT_LOW:
>  	case ESR_ELx_EC_BKPT32:
>  		el0_dbg(regs, esr);
> diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
> index 309ae24d4548..8a80e13347c8 100644
> --- a/arch/arm64/kernel/hw_breakpoint.c
> +++ b/arch/arm64/kernel/hw_breakpoint.c
> @@ -854,7 +854,7 @@ bool try_step_suspended_breakpoints(struct pt_regs *regs)
>  	bool handled_exception = false;
>  
>  	/*
> -	 * Called from single-step exception handler.
> +	 * Called from single-step exception entry.Hmm, alright but does not make much difference through.

>  	 * Return true if we stepped a breakpoint and can resume execution,
>  	 * false if we need to handle a single-step.
>  	 */



