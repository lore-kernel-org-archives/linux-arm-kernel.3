Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30238C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sAMQJe5vVju+xw6dJW3WghhvwFE3YrREE0PUOURcOY=; b=LlD5c1hAm1I93YKrop9Ln/WE0n
	eBI6fmjDKovG4pnF5EFGV50sDxbAG4CgTsaMOyJ1rQhe5EVjrWoNNaLszFWGN6/fvhxR7aYSV+Zop
	bzpAKeZol0nWzrPKZ5TbcIIWd7JERQ48QNLFfQxfjRns0oZCUDCP99Wri1a4l2elTbawdQqZov+tg
	boL/O1jlxQyewdd9tsnkkp6SgfTHof9iUL7IPb8I3YtQfn/evIpFUiGIQfxCpneeEkoFvjjXd3Qsx
	IVP8sup5qQjY1ttqNWsCznvvWTyCqMKBTNudgknrgx/OVg4Y/FmdMTa4ypYc2KCPMGNAvSNhmqPvo
	s4aahQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90uo-00000005bUT-2sPr;
	Tue, 22 Sep 2026 13:52:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90um-00000005bTa-09xX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:52:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C863E152B;
	Tue, 22 Sep 2026 06:51:59 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 499823F86F;
	Tue, 22 Sep 2026 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790085123; bh=mN8FAnOCnbg4oeGxnqwzvzID0aysvHOiCajSlQITXVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sopNtH72i0s44RtNWpc9YyyyZmKWsJgDJyx3hZOJLFsLB3fbeg3hzrqFgCX3rjvXJ
	 XRSdQIwNf5DHhxFEDv0rca3FHUqtpQUT4RGX+yp1IMJfbgOInxXLi9XGT32MVPCM97
	 FAN0IAxHOJtrxdi65D4crKLgmMBNxAz3vtm5UvU0=
Date: Tue, 22 Sep 2026 14:51:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 19/21] arm64: entry: The great stack switcheroo
Message-ID: <arKH_pqMvtmPpjZM@arm.com>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-20-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918161407.2300-20-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_065208_169680_400FAEFA 
X-CRM114-Status: GOOD (  23.67  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 05:14:03PM +0100, Will Deacon wrote:
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 9738142780df..9d734cd09f62 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -327,7 +327,7 @@ static void debug_exception_exit(struct pt_regs *regs)
>  }
>  NOKPROBE_SYMBOL(debug_exception_exit);
>  
> -static void noinstr el1t_64_check_overflow_stack(struct pt_regs *regs)
> +static void noinstr el1h_64_check_overflow_stack(struct pt_regs *regs)
>  {
>  	unsigned long sp = kernel_stack_pointer(regs) - sizeof(*regs);
>  	unsigned long ovf_stack = (unsigned long)this_cpu_ptr(overflow_stack);
> @@ -343,28 +343,28 @@ static void noinstr el1t_64_check_overflow_stack(struct pt_regs *regs)
>  		cpu_park_loop();
>  }
>  
> -asmlinkage void noinstr el1t_64_sync_handler(struct pt_regs *regs)
> +asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>  {
> -	el1t_64_check_overflow_stack(regs);
> -	el1h_64_sync_handler(regs);
> +	el1h_64_check_overflow_stack(regs);
> +	el1t_64_sync_handler(regs);
>  }

The code in el1h_64_check_overflow_stack() is introduced in patch 16 but
I thought I'd reply here as that's where the check becomes relevant. It
does:

	if (sp < ovf_stack || sp > ovf_stack + OVERFLOW_STACK_SIZE)
		cpu_park_loop();

What's missing in this check is the SDEI stacks. I guess not a
correctness problem but if we ever get a fault on this path we don't get
to print anything, just park the CPU. If we want this fixes, I think the
simplest is getting SDEI to use SPSel=0.

> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index 38f9327e6a0a..afcd84510daf 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -54,6 +54,12 @@
>  
>  	.macro kernel_ventry_el1h, regsize:req, label:req
>  	sub	sp, sp, #PT_REGS_SIZE
> +	b	el1h_\regsize\()_\label
> +	.endm
> +
> +	.macro kernel_ventry_el1t, regsize:req, label:req
> +	msr	spsel, #0			// Stay on the kernel stack
> +	sub	sp, sp, #PT_REGS_SIZE

Courtesy of an LLM - pKVM's inject_host_exception() (nVHE) doesn't take
the host mode into account and always delivers it to the EL1h vector
instead of EL1t (e.g. mem abort).

> diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
> index 4c89931a6a92..4d1205d04383 100644
> --- a/arch/arm64/kvm/hyp/entry.S
> +++ b/arch/arm64/kvm/hyp/entry.S
> @@ -31,6 +31,7 @@ SYM_FUNC_START(__guest_enter)
>  	save_callee_saved_regs x1
>  
>  	// Save hyp's sp_el0 and tpidrro_el0
> +	activate_exception_stack
>  	save_sp_el0	x1, x2
>  	save_tpidrro_el0 x1, x2
>  
> @@ -50,6 +51,7 @@ alternative_else_nop_endif
>  	// that would usually be synchonized by the ERET.
>  	isb
>  	mov	x0, #ARM_EXCEPTION_IRQ
> +	deactivate_exception_stack
>  	ret
>  
>  1:
> @@ -167,6 +169,7 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
>  	// Restore hyp's sp_el0 and tpidrro_el0
>  	restore_sp_el0 x2, x3
>  	restore_tpidrro_el0 x2, x3
> +	deactivate_exception_stack

I almost got lost here but I think the LLMs may have a point. In
__guest_exit() we switch to the EL2t mode above and a bit further down
we unmask the SError. However, we haven't run __deactivate_traps() yet,
so the VBAR_EL2 still points to the kvm_hyp_vector which has the EL2t
entries as invalid.

It gets worse with el2t_error_invalid taken. __guest_exit_panic() goes
to hyp_panic() since we already did a set_loaded_vcpu xzr.

The easiest fix is to popluate the kvm_hyp_vector with valid EL2t
entries. I don't think deferring the SError enabling after the VBAR
restoring helps as we need to associate the SError with the guest, so
it makes sense to take it on the kvm_hyp_vector paths.

-- 
Catalin

