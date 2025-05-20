Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E158C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtuX4DU10uxD1b345CopD6oH+0T50X3QFAsst0aN8Eg=; b=g42bD/GjXaepKW7/IB9gB8uwrh
	ONFvrR5XFv4n7DvSk/hWXbcvG0HbwfWq0Wp9tIMwEGw1hmyTz5sdTXk8LjGpmfC/SzWFG4FVCqGcB
	jOLF5ApON53cTq8D4xgG93FfgXIL69zY1dhBfzOuTslRMTtUnFt2WfKBfaKnK09iwuqzbK60j/qGi
	h4u4kXX2VUx5JL/D0jDqKpgpXjIkG/ioUpIsLI4YiAblm0kKGQSmPFZ6IqRAzLF6zMijhojkeb0eO
	TywXPM9tVFATzwqaJYD9/scsgsOhP6sPY6Rr4nWTX8aTTQerk6YjpWuC+Fa7q94f3g/siUu68q6cA
	KEiW4gow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQ5x-0000000DaAU-2kRa;
	Tue, 20 May 2025 16:45:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPqB-0000000DXlh-3vb5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 16:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4644462A07;
	Tue, 20 May 2025 16:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6FBC4CEE9;
	Tue, 20 May 2025 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747758559;
	bh=ckd9rSJ/Xv3sV4r08zDszjQLLRLTgonDZIAQzk23w4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ch/vJ07ysETY0S4PJzVBQlTkuaJVC1IRsrsZSEM0oRybaR58CjJ0Dq6kxDEo3lsIO
	 s6OfVOnJkI3dsa6SMy2zhmttWY39xBebN9HY/ZpxZLM9acfWyIKyPNVfxZYxgo6FAV
	 oCtrQykD05D95ZvrAQ05WDrB/80KxdXx8VAKGZADM38SBcDXlKU80KJWBjW+fNGIDu
	 YHt8KMUCg1vivz8GsLLvPgwBQ1cm8OLC6Gvkptkw9NLaUyFH5/i9cNnqGs6Cv1AoIZ
	 UmO50YCa/TtZPunuXOlpvpy6rrZaBprhFuf3LBzsR1zyJbo6tcsHJSKV/MFP39aF0Q
	 6ph+TU669oP3g==
Date: Tue, 20 May 2025 17:29:14 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 07/11] arm64: debug: split single stepping exception
 entry
Message-ID: <20250520162913.GA19155@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-8-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512174326.133905-8-ada.coupriediaz@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, May 12, 2025 at 06:43:22PM +0100, Ada Couprie Diaz wrote:
> Currently all debug exceptions share common entry code and are routed
> to `do_debug_exception()`, which calls dynamically-registered
> handlers for each specific debug exception. This is unfortunate as
> different debug exceptions have different entry handling requirements,
> and it would be better to handle these distinct requirements earlier.
> 
> The single stepping exception has the most constraints : it can be
> exploited to train branch predictors and it needs special handling at EL1
> for the Cortex-A76 erratum #1463225. We need to conserve all those
> mitigations.
> Move the call to `arm64_apply_bp_hardening()` to `entry-common.c` as
> it is needed for exceptions coming from EL0 only.
> However, it does not write an address at FAR_EL1, as only hardware
> watchpoints do so.
> 
> The single-step handler does its own signaling if it needs to and only
> returns 0, so we can call it directly from `entry-common.c`.
> 
> Split the single stepping exception entry, adjust the function signature,
> keep the security mitigation and erratum handling.
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
> Move the call to `reinstall_suspended_bps()` to `entry-common.c` and
> adjust the relevant comments.
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
>  arch/arm64/kernel/hw_breakpoint.c  |  6 ++---
>  4 files changed, 51 insertions(+), 18 deletions(-)

[...]

> @@ -770,6 +790,25 @@ static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
>  	exit_to_user_mode(regs);
>  }
>  
> +static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
> +{
> +	if (!is_ttbr0_addr(regs->pc))
> +		arm64_apply_bp_hardening();

Similar to the other patch, I think this is a functional change. It
might be fine, but it should be called out in the commit message if it's
intentional.

> +	enter_from_user_mode(regs);
> +	/*
> +	 * After handling a breakpoint, we suspend the breakpoint
> +	 * and use single-step to move to the next instruction.
> +	 * If we have a suspended breakpoint there's nothing more to do:
> +	 * complete the single-step.
> +	 */
> +	if (reinstall_suspended_bps(regs)) {
> +		local_daif_restore(DAIF_PROCCTX);
> +		do_softstep(esr, regs);
> +	}
> +	exit_to_user_mode(regs);

I quite like the look of this now, but perhaps we could rename
reinstall_suspended_bps() and change the return value to make things a
bit more readable? For example, 'if (!stepped_suspended_breakpt(regs))'
or something like that? What do you think?

Will

