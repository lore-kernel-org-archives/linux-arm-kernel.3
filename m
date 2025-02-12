Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24815C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsyxvtfY98LMTH3N5krVDx/Om+FlySC2UfEwG6WNk24=; b=jQjgfx7z03WgQtFEjj3OM5Q/ZA
	Jve1JnrAFvXQYmYMM81Uj4lyuohp+NtkR4h/wGfA64aIuqZWUXPoaZrQI+1jAVFPe5uLiT2ZaiVXr
	rFpUrUN4QMEVtmtMRFVBo2nPuXC5wfEym2f5vVFjsp9WQA/8RrEBJL+ScjKCkBy4bCpZ1E9sWiCIz
	EVZ9D9TDLTlmzMvyWv9mfBRY/j5YYrotDea9WVg6LMECdQfnuF14cViP/UVCxXlQvyq5F7hLxs38y
	TneXD0QodketcoovxeqOoopJOdTUHopTFITc/Ygg515ZQ0DySooc82jk0ho1q8ei6T7uK40lqddhc
	kq3qAz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiC4A-00000007NrF-05Sv;
	Wed, 12 Feb 2025 12:42:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiC2j-00000007Nbn-0JEH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 12:40:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC907113E;
	Wed, 12 Feb 2025 04:40:59 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D74B3F58B;
	Wed, 12 Feb 2025 04:40:36 -0800 (PST)
Date: Wed, 12 Feb 2025 12:40:33 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: BUG: debug_exception_enter() disables preemption and may call
 sleeping functions on aarch64 with RT
Message-ID: <Z6yWwRcPvVGk2EyC@J2N7QTR9R3>
References: <Z6YW_Kx4S2tmj2BP@uudg.org>
 <Z6n16cK85JMyowDq@J2N7QTR9R3>
 <Z6tf8iDhNriSGjeC@uudg.org>
 <Z6vs3IWxUxhIDBBO@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6vs3IWxUxhIDBBO@uudg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_044041_196741_05B8EA1F 
X-CRM114-Status: GOOD (  32.83  )
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

On Tue, Feb 11, 2025 at 09:35:40PM -0300, Luis Claudio R. Goncalves wrote:
> On Tue, Feb 11, 2025 at 11:34:26AM -0300, Luis Claudio R. Goncalves wrote:
> > On Mon, Feb 10, 2025 at 12:49:45PM +0000, Mark Rutland wrote:
> > > On Fri, Feb 07, 2025 at 11:22:57AM -0300, Luis Claudio R. Goncalves wrote:
> ...
> > > I don't have an immediate suggestion; I'll need to go think about this
> > > for a bit. Unfortunatealy, there are several nested cans of worms here.
> > > :/
> > > 
> > > In theory, we can go split out the EL0 "debug exceptions" into separate
> > > handlers, and wouldn't generally need to disable preemption for things
> > > like BRK or single-step.
> > 
> > If this is an acceptable workaround, until we have the real solution,
> > I can work on that :)
> > 
> > Luis
> 
> I tested the prototype below and it survived 6h of ssdd and the ptrace LTP
> tests running simultaneously, in a tight loop. Would something along these
> lines be an acceptable workaround?

Sorry, no. This makes the code even more convoluted and less
maintainable.

If you want to fix single step specifically without bothering with the
rest of the rework I mentioned, the right fix is to split that out from
the other "debug exceptions", and handle that with the usual structure
we have for other synchronous exceptions like FPAC/BTI/etc:

* In arch/arm64/kernel/debug-monitors.c, add new do_el{1,0}_step()
  functions which handle their corresponding stepping logic. These
  should have the same rough shape as do_el{1,0}_fpac(), and should
  handle all the default signalling logic that would otherwise be
  handled by do_debug_exception().

  The existing single_step_handler() should be removed, or at minimum
  refactored and only called by those new do_el{1,0}_step() functions.

  The existing hook_debug_fault_code() registration of
  single_step_handler() should be removed.

  I'm not sure whether do_el0_step() needs the
  arm64_apply_bp_hardening() logic, but do_el1_step() does not.

* In entry-common.c, add new el{1,0}_step() functions. Each of
  el1h_64_sync_handler(), el0t_64_sync_handler(), and
  el0t_32_sync_handler() should be updated to call those rather than
  el{1,0}_dbg() for the corresponding EC values.

  In el0_step() it shouldn't be necessary to disable preemption, and
  that should be able to be:

  | static void noinstr el0_step(struct pt_regs *regs, unsigned long esr)
  | {
  |         enter_from_user_mode(regs);
  |         local_daif_restore(DAIF_PROCCTX);
  |         do_el0_step(regs, esr);
  |         exit_to_user_mode(regs);
  | }

  In el1_step(), I'm not *immediately sure* whether it's necessary to
  disable preemption, nor whether we need to treat this and use
  arm64_enter_el1_dbg() and arm64_exit_el1_dbg() rather than
  entry_from_kenrel_mode() and exit_to_kernel_mode().

  So we either need:

  | static void noinstr el1_step(struct pt_regs *regs, unsigned long esr)
  | {
  |         arm64_enter_el1_dbg(regs);
  |         do_el1_step(regs, esr);
  |         arm64_exit_el1_dbg(regs);
  | }

  ... or:

  | static void noinstr el1_step(struct pt_regs *regs, unsigned long esr)
  | {
  |         enter_from_kernel_mode(regs);
  |         local_daif_inherit(regs);
  |         do_el1_step(regs, esr);
  |         local_daif_mask(regs);
  |         exit_to_kernel_mode(regs);
  | }

With that, we're a step forward in the right direction.

Mark.

> 
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 8b281cf308b30..eb3b54710024f 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -933,18 +933,20 @@ void __init hook_debug_fault_code(int nr,
>   * accidentally schedule in exception context and it will force a warning
>   * if we somehow manage to schedule by accident.
>   */
> -static void debug_exception_enter(struct pt_regs *regs)
> +static void debug_exception_enter(struct pt_regs *regs, int touch_preemption)
>  {
> -	preempt_disable();
> +	if (touch_preemption)
> +		preempt_disable();
>  
>  	/* This code is a bit fragile.  Test it. */
>  	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
>  }
>  NOKPROBE_SYMBOL(debug_exception_enter);
>  
> -static void debug_exception_exit(struct pt_regs *regs)
> +static void debug_exception_exit(struct pt_regs *regs, int touch_preemption)
>  {
> -	preempt_enable_no_resched();
> +	if (touch_preemption)
> +		preempt_enable_no_resched();
>  }
>  NOKPROBE_SYMBOL(debug_exception_exit);
>  
> @@ -953,8 +955,14 @@ void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
>  {
>  	const struct fault_info *inf = esr_to_debug_fault_info(esr);
>  	unsigned long pc = instruction_pointer(regs);
> +	unsigned long req = ESR_ELx_EC(esr);
> +	int touch_preemption;
>  
> -	debug_exception_enter(regs);
> +	touch_preemption = !(IS_ENABLED(CONFIG_PREEMPT_RT) &&
> +		(req == ESR_ELx_EC_SOFTSTP_LOW || req == ESR_ELx_EC_BRK64
> +		 || req == ESR_ELx_EC_BKPT32 || req == ESR_ELx_EC_SOFTSTP_CUR));
> +
> +	debug_exception_enter(regs, touch_preemption);
>  
>  	if (user_mode(regs) && !is_ttbr0_addr(pc))
>  		arm64_apply_bp_hardening();
> @@ -963,7 +971,7 @@ void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
>  		arm64_notify_die(inf->name, regs, inf->sig, inf->code, pc, esr);
>  	}
>  
> -	debug_exception_exit(regs);
> +	debug_exception_exit(regs, touch_preemption);
>  }
>  NOKPROBE_SYMBOL(do_debug_exception);
>  
> 

