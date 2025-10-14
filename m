Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7992CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WSnuST7YxbfcQO2X5aXhitt+4Q/5PMGB2+Lss9eAxI=; b=fgCcHnUzICQPeClgLoWebEptOF
	o35FalINA91FZLv7maYyDC74HTZBMQsZiOuDhlcVVs5lO2h5+kwmsqLI0pa3rzs6YYtIYGZYlq0XN
	ZpZL2PZTpGTQBpqPpTt7fFsq0iHj3nbsak2Y3gOWEuo6cOw/npH2/p0nkXhbs8etGVS3OxmKt9zUk
	gNXXxka2LDmDOSjiKm08EqkvTVpqLWufKoRid3pOU52EdYEs4NR1IRtlz6pYHMSSLpk7V5R1dKKhz
	LrURUZMcojVnOCME2933rKhFVa7pe92zB4RO9mf8r68+XVpvnvoMujyFRLPHTdYG0ovx2u3ZiGErN
	+Bk4kWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bcF-0000000FoLo-3KZs;
	Tue, 14 Oct 2025 09:46:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bcD-0000000FoJn-3RgO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 09:46:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 443291A9A;
	Tue, 14 Oct 2025 02:46:35 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4329B3F66E;
	Tue, 14 Oct 2025 02:46:42 -0700 (PDT)
Date: Tue, 14 Oct 2025 10:46:37 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: debug: always unmask interrupts in
 el0_softstp()
Message-ID: <aO4b_Ubig2FXowLa@J2N7QTR9R3.cambridge.arm.com>
References: <20251013174317.74791-1-ada.coupriediaz@arm.com>
 <20251014092536.18831-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014092536.18831-1-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_024645_986259_10DD4F22 
X-CRM114-Status: GOOD (  26.22  )
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

On Tue, Oct 14, 2025 at 10:25:36AM +0100, Ada Couprie Diaz wrote:
> EL0 exception handlers should always call `exit_to_user_mode()` with
> interrupts unmasked.
> When handling a completed single-step, we skip the if block and
> `local_daif_restore(DAIF_PROCCTX)` never gets called,
> which ends up calling `exit_to_user_mode()` with interrupts masked.
>
> This is broken if pNMI is in use, as `do_notify_resume()` will try
> to enable interrupts, but `local_irq_enable()` will only change the PMR,
> leaving interrupts masked via DAIF.

I think we might want to spell thius out a bit more, e.g.

| We intend that EL0 exception handlers unmask all DAIF exceptions
| before calling exit_to_user_mode().
|
| When completing single-step of a suspended breakpoint, we do not call
| local_daif_restore(DAIF_PROCCTX) before calling exit_to_user_mode(),
| leaving all DAIF exceptions masked.
|
| When pseudo-NMIs are not in use this is benign.
|
| When pseudo-NMIs are in use, this is unsound. At this point interrupts
| are masked by both DAIF.IF and PMR_EL1, and subsequent irq flag
| manipulation may not work correctly. For example, a subsequent
| local_irq_enable() within exit_to_user_mode_loop() will only unmask
| interrupts via PMR_EL1 (leaving those masked via DAIF.IF), and
| anything depending on interrupts being unmasked (e.g. delivery of
| signals) will not work correctly.
|
| This can by detected by CONFIG_ARM64_DEBUG_PRIORITY_MASKING.

With or without that, this looks good to me, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> Move the call to `try_step_suspended_breakpoints()` outside of the check
> so that interrupts can be unmasked even if we don't call the step handler.
> 
> Fixes: 0ac7584c08ce ("arm64: debug: split single stepping exception entry")
> Cc: <stable@vger.kernel.org> # 6.17
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ----
> This was already broken in a similar fashion in kernels prior to v6.17,
> as `local_daif_restore()` was called _after_ the debug handlers, with some
> calling `send_user_sigtrap()` which would unmask interrupts via PMR
> while leaving them masked by DAIF.
> 
> v2: Add missing semicolon so that the patch compiles.
> My mistake for rushing a fix late, apologies.
> ---
>  arch/arm64/kernel/entry-common.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 2b0c5925502e..8473fe4791bc 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -832,6 +832,7 @@ static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
>  
>  static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
>  {
> +	bool step_done;
>  	if (!is_ttbr0_addr(regs->pc))
>  		arm64_apply_bp_hardening();
>  
> @@ -842,10 +843,11 @@ static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
>  	 * If we are stepping a suspended breakpoint there's nothing more to do:
>  	 * the single-step is complete.
>  	 */
> -	if (!try_step_suspended_breakpoints(regs)) {
> -		local_daif_restore(DAIF_PROCCTX);
> +	step_done = try_step_suspended_breakpoints(regs);
> +	local_daif_restore(DAIF_PROCCTX);
> +	if (!step_done)
>  		do_el0_softstep(esr, regs);
> -	}
> +
>  	exit_to_user_mode(regs);
>  }
>  
> 
> base-commit: 449d48b1b99fdaa076166e200132705ac2bee711
> -- 
> 2.43.0
> 

