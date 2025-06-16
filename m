Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0369C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsOVS09lI+kverE8nQVRcM6FHbf7HpicqccuqFOO9hE=; b=h7Xjcm+7j8KUQxmf9H8iKpKl+B
	aN/j3Zw2xR1SyrcCmZvWT9S6UDMuScybbzmYxnzFt9x2VH/8L1+t56Y7ZKqZDZlzEXPs5Muj+Uyu+
	di3b9RYUgNBRmMniW6CTEdnYcwDeCR5KTfXeu/udFi7XqWepwZksgdXv8w4XCOO2yPa+8nWlmJ2RX
	1b2JdzTudIV+lbYbMhZhtYFQaHSKqLRPnllf9vBoD0bG0HOowRl4SD/7G759XwFVty2NbiH7EVtTc
	z0jYfxfMx6HbAfSwHEKhTlpFt6zRkfEPGEKI5DxGtn/TKwRfkvzG9bAFPsxuEnjiLdHmSfsEEeOoB
	gC6GaiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6BW-00000003vVw-3DJY;
	Mon, 16 Jun 2025 09:31:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5XI-00000003qJQ-1p3N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 08:49:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 363A7150C;
	Mon, 16 Jun 2025 01:49:26 -0700 (PDT)
Received: from [10.164.146.15] (J09HK2D2RT.blr.arm.com [10.164.146.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D44153F58B;
	Mon, 16 Jun 2025 01:49:45 -0700 (PDT)
Message-ID: <e57645a8-2100-443d-af1d-52a25cbee6e7@arm.com>
Date: Mon, 16 Jun 2025 14:19:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] arm64: debug: refactor reinstall_suspended_bps()
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-9-ada.coupriediaz@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609173413.132168-9-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_014948_562936_41CC3007 
X-CRM114-Status: GOOD (  24.25  )
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
> `reinstall_suspended_bps()` plays a key part in the stepping process
> when we have hardware breakpoints and watchpoints enabled.
> It checks if we need to step one, will re-enable it if it has
> been handled and will return whether or not we need to proceed with
> a single-step.
> 
> However, the current naming and return values make it harder to understand
> the logic and goal of the function.
> 
> Rename it `try_step_suspended_breakpoints()` and change the return value
> to a boolean, aligning it with similar functions used in
> `do_el0_undef()` like `try_emulate_mrs()`, and making its behaviour
> more obvious.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/debug-monitors.h |  6 +++---
>  arch/arm64/kernel/debug-monitors.c      |  2 +-
>  arch/arm64/kernel/hw_breakpoint.c       | 25 ++++++++++++-------------
>  3 files changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
> index caee1d923f9c..586290e95d87 100644
> --- a/arch/arm64/include/asm/debug-monitors.h
> +++ b/arch/arm64/include/asm/debug-monitors.h
> @@ -84,11 +84,11 @@ void kernel_rewind_single_step(struct pt_regs *regs);
>  void kernel_fastforward_single_step(struct pt_regs *regs);
>  
>  #ifdef CONFIG_HAVE_HW_BREAKPOINT
> -int reinstall_suspended_bps(struct pt_regs *regs);
> +bool try_step_suspended_breakpoints(struct pt_regs *regs);
>  #else
> -static inline int reinstall_suspended_bps(struct pt_regs *regs)
> +static inline bool try_step_suspended_breakpoints(struct pt_regs *regs)
>  {
> -	return -ENODEV;
> +	return false;
>  }
>  #endif
>  
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 02ba2c5e40ec..74ffdfeff76f 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -195,7 +195,7 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
>  	 * If we are stepping a pending breakpoint, call the hw_breakpoint
>  	 * handler first.
>  	 */
> -	if (!reinstall_suspended_bps(regs))
> +	if (try_step_suspended_breakpoints(regs))
>  		return 0;
>  
>  	if (call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
> diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
> index d7eede5d869c..309ae24d4548 100644
> --- a/arch/arm64/kernel/hw_breakpoint.c
> +++ b/arch/arm64/kernel/hw_breakpoint.c
> @@ -847,36 +847,35 @@ NOKPROBE_SYMBOL(watchpoint_handler);
>  /*
>   * Handle single-step exception.
>   */
> -int reinstall_suspended_bps(struct pt_regs *regs)
> +bool try_step_suspended_breakpoints(struct pt_regs *regs)
>  {
>  	struct debug_info *debug_info = &current->thread.debug;
> -	int handled_exception = 0, *kernel_step;
> -
> -	kernel_step = this_cpu_ptr(&stepping_kernel_bp);
> +	int *kernel_step = this_cpu_ptr(&stepping_kernel_bp);
> +	bool handled_exception = false;
>  
>  	/*
>  	 * Called from single-step exception handler.
> -	 * Return 0 if execution can resume, 1 if a SIGTRAP should be
> -	 * reported.
> +	 * Return true if we stepped a breakpoint and can resume execution,
> +	 * false if we need to handle a single-step.
>  	 */
>  	if (user_mode(regs)) {
>  		if (debug_info->bps_disabled) {
>  			debug_info->bps_disabled = 0;
>  			toggle_bp_registers(AARCH64_DBG_REG_BCR, DBG_ACTIVE_EL0, 1);
> -			handled_exception = 1;
> +			handled_exception = true;
>  		}
>  
>  		if (debug_info->wps_disabled) {
>  			debug_info->wps_disabled = 0;
>  			toggle_bp_registers(AARCH64_DBG_REG_WCR, DBG_ACTIVE_EL0, 1);
> -			handled_exception = 1;
> +			handled_exception = true;
>  		}
>  
>  		if (handled_exception) {
>  			if (debug_info->suspended_step) {
>  				debug_info->suspended_step = 0;
>  				/* Allow exception handling to fall-through. */
> -				handled_exception = 0;
> +				handled_exception = false;
>  			} else {
>  				user_disable_single_step(current);
>  			}
> @@ -890,17 +889,17 @@ int reinstall_suspended_bps(struct pt_regs *regs)
>  
>  		if (*kernel_step != ARM_KERNEL_STEP_SUSPEND) {
>  			kernel_disable_single_step();
> -			handled_exception = 1;
> +			handled_exception = true;
>  		} else {
> -			handled_exception = 0;
> +			handled_exception = false;
>  		}
>  
>  		*kernel_step = ARM_KERNEL_STEP_NONE;
>  	}
>  
> -	return !handled_exception;
> +	return handled_exception;
>  }
> -NOKPROBE_SYMBOL(reinstall_suspended_bps);
> +NOKPROBE_SYMBOL(try_step_suspended_breakpoints);
>  
>  /*
>   * Context-switcher for restoring suspended breakpoints.

This makes sense.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

