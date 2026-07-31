Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A98CC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAxOsLYpK9eFmi4OxuFp7qfHkUr7yvIHaNSSrtdi+OQ=; b=qGfVvyNeZCkqYMMqU/wkgNAnDI
	JJFhPEVgJlrIFvlp2rRwhlssiaJRDvLGQ4rGDCR9uIwR7ic/Y1sqwRlE2UzbPHZW50rhWrJ4CB4no
	eKU+MSXb4bfGhVvpcLB492yYB3CVsPen5v5nWTLwP5oAAU+CRwMynNuJzdx54Ta7/tCS8IW49ouNE
	m3sJBf+juAyO8VVBmsnKuZkwbwhDHdWGiB8b1YbXGG4rYXyNQSfb3Wg6Tkgy0dsaMt6KC3CrV432M
	FQH5oMHzROq2RHzR4+ka8MoqI5eA5g23Z/0C6k7Dqleplm5iJgJAlS+D1T7qiIQTAJfghEZZ/pzD9
	1SQOlkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpp7C-0000000Ctqe-3KTL;
	Fri, 31 Jul 2026 15:25:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpp78-0000000Ctpv-1Jfk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 15:25:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDAF4204C;
	Fri, 31 Jul 2026 08:25:28 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 930313F66F;
	Fri, 31 Jul 2026 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785511532; bh=QCuz6mWm4b2OnDvgJj6FOQ71UL0rPX8NCGIBuN1iKEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tu0ZOyDPm/zoA1LcwEK8YcKgXEQCb4LLg/ECvdVNDteJCr6UWbnRROZmbmZ2kBS5X
	 oMibasxGm+YO7qMHvd7twzvCapACtYYXc5UULpmHsR3czM6TR4RzHwSXElLVT/3CxV
	 s5iDyXByz9Orvq5sz1vLW9Y6N5jYJdYjuWCXIhac=
Date: Fri, 31 Jul 2026 16:25:20 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 3/9] arm64/debug-monitors: Make
 do_el1_brk64()/do_el1_softstep() noinstr
Message-ID: <amy-YDef9iuQUPZe@J2N7QTR9R3>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
 <c914d2b8ff0421eb35665eba7b49c92f3857d2bb.1785153469.git.hongyan.xia@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c914d2b8ff0421eb35665eba7b49c92f3857d2bb.1785153469.git.hongyan.xia@transsion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_082535_004939_650973A6 
X-CRM114-Status: GOOD (  28.20  )
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

On Mon, Jul 27, 2026 at 12:25:38PM +0000, Hongyan Xia wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> Convert do_el1_brk64(), do_el1_softstep() and call_el1_break_hook() to
> noinstr. The kprobe and kretprobe BRK handlers (converted to noinstr in
> the following patches) are dispatched directly. Every other BRK handler
> are ordinary instrumentable code and now run bounded by
> instrumentation_begin()/end().

Why is it necessary to change do_el1_softstep()?

Neither kprobes nor kretprobes uses software stepping since commit:

  7ee31a3aa8f4 ("arm64: kprobes: Use BRK instead of single-step when executing instructions out-of-line")

... so either that shouldn't be necessary, or there's a problem that
needs to be described in this commit message.

> With this, everything on the el1 debug exception path from the vectors
> down to the kprobe handlers is noinstr, and instrumentation only runs
> inside explicit instrumentation windows.
> 
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/kernel/debug-monitors.c | 74 +++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 29307642f4c9..a970ab6327cd 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -11,6 +11,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/hardirq.h>
>  #include <linux/init.h>
> +#include <linux/instrumentation.h>
>  #include <linux/ptrace.h>
>  #include <linux/kprobes.h>
>  #include <linux/stat.h>
> @@ -193,59 +194,65 @@ void do_el0_softstep(unsigned long esr, struct pt_regs *regs)
>  	user_rewind_single_step(current);
>  }
>  
> -void do_el1_softstep(unsigned long esr, struct pt_regs *regs)
> +void noinstr do_el1_softstep(unsigned long esr, struct pt_regs *regs)
>  {
> -	if (kgdb_single_step_handler(regs, esr) == DBG_HOOK_HANDLED)
> +	int handled;
> +
> +	instrumentation_begin();
> +	handled = kgdb_single_step_handler(regs, esr);
> +	instrumentation_end();
> +
> +	if (handled == DBG_HOOK_HANDLED)
>  		return;
>  
> +	instrumentation_begin();
>  	pr_warn("Unexpected kernel single-step exception at EL1\n");
> +	instrumentation_end();
>  	/*
>  	 * Re-enable stepping since we know that we will be
>  	 * returning to regs.
>  	 */
>  	set_regs_spsr_ss(regs);
>  }
> -NOKPROBE_SYMBOL(do_el1_softstep);

As above, I don't think it's necessary to change do_el1_softstep(), but
I might be missing something that you haven't described in the commit
message.

Is the existing NOKPROBE_SYMBOL() annotation actually necessary? It
looks like that dates from before commit 7ee31a3aa8f4, and I suspect we
can delete it even without making this noinstr.

I don't think you need to make structural changes here.  Given the first
thing the function does is an unconditional call to an instrumented
function, we're not gaining anything by litering this with
instrumentation_{begin,end}().

> -static int call_el1_break_hook(struct pt_regs *regs, unsigned long esr)
> +static int noinstr call_el1_break_hook(struct pt_regs *regs, unsigned long esr)
>  {
> -	if (esr_brk_comment(esr) == BUG_BRK_IMM)
> -		return bug_brk_handler(regs, esr);
> -
> -	if (IS_ENABLED(CONFIG_CFI) && esr_is_cfi_brk(esr))
> -		return cfi_brk_handler(regs, esr);
> -
> -	if (esr_brk_comment(esr) == FAULT_BRK_IMM)
> -		return reserved_fault_brk_handler(regs, esr);
> -
> -	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) &&
> -		(esr_brk_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
> -		return kasan_brk_handler(regs, esr);
> -
> -	if (IS_ENABLED(CONFIG_UBSAN_TRAP) && esr_is_ubsan_brk(esr))
> -		return ubsan_brk_handler(regs, esr);
> -
> -	if (IS_ENABLED(CONFIG_KGDB)) {
> -		if (esr_brk_comment(esr) == KGDB_DYN_DBG_BRK_IMM)
> -			return kgdb_brk_handler(regs, esr);
> -		if (esr_brk_comment(esr) == KGDB_COMPILED_DBG_BRK_IMM)
> -			return kgdb_compiled_brk_handler(regs, esr);
> -	}
> +	unsigned long comment = esr_brk_comment(esr);
> +	int ret = DBG_HOOK_ERROR;
>  
>  	if (IS_ENABLED(CONFIG_KPROBES)) {
> -		if (esr_brk_comment(esr) == KPROBES_BRK_IMM)
> +		if (comment == KPROBES_BRK_IMM)
>  			return kprobe_brk_handler(regs, esr);
> -		if (esr_brk_comment(esr) == KPROBES_BRK_SS_IMM)
> +		if (comment == KPROBES_BRK_SS_IMM)
>  			return kprobe_ss_brk_handler(regs, esr);
>  	}
>  
>  	if (IS_ENABLED(CONFIG_KRETPROBES) &&
> -		esr_brk_comment(esr) == KRETPROBES_BRK_IMM)
> +	    comment == KRETPROBES_BRK_IMM)
>  		return kretprobe_brk_handler(regs, esr);
>  
> -	return DBG_HOOK_ERROR;
> +	instrumentation_begin();
> +	if (comment == BUG_BRK_IMM)
> +		ret = bug_brk_handler(regs, esr);
> +	else if (IS_ENABLED(CONFIG_CFI) && esr_is_cfi_brk(esr))
> +		ret = cfi_brk_handler(regs, esr);
> +	else if (comment == FAULT_BRK_IMM)
> +		ret = reserved_fault_brk_handler(regs, esr);
> +	else if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) &&
> +		 (comment & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
> +		ret = kasan_brk_handler(regs, esr);
> +	else if (IS_ENABLED(CONFIG_UBSAN_TRAP) && esr_is_ubsan_brk(esr))
> +		ret = ubsan_brk_handler(regs, esr);
> +	else if (IS_ENABLED(CONFIG_KGDB)) {
> +		if (comment == KGDB_DYN_DBG_BRK_IMM)
> +			ret = kgdb_brk_handler(regs, esr);
> +		else if (comment == KGDB_COMPILED_DBG_BRK_IMM)
> +			ret = kgdb_compiled_brk_handler(regs, esr);
> +	}
> +	instrumentation_end();
> +
> +	return ret;
>  }
> -NOKPROBE_SYMBOL(call_el1_break_hook);

I don't think you need to make any structural changes to
call_el1_break_hook(). Just mark it as noinstr, and remove the
NOKPROBE_SYMBOL() annotation. The existing control flow will be safe.

>  /*
>   * We have already unmasked interrupts and enabled preemption
> @@ -261,14 +268,15 @@ void do_el0_brk64(unsigned long esr, struct pt_regs *regs)
>  	send_user_sigtrap(TRAP_BRKPT);
>  }
>  
> -void do_el1_brk64(unsigned long esr, struct pt_regs *regs)
> +void noinstr do_el1_brk64(unsigned long esr, struct pt_regs *regs)
>  {
>  	if (call_el1_break_hook(regs, esr) == DBG_HOOK_HANDLED)
>  		return;
>  
> +	instrumentation_begin();
>  	die("Oops - BRK", regs, esr);
> +	instrumentation_end();
>  }
> -NOKPROBE_SYMBOL(do_el1_brk64);

Likewise, just mark do_el1_brk64() as noinstr and remove the
NOKPROBE_SYMBOL() annotation, without the instrumentation_{begin,end}()
calls.

Mark.

