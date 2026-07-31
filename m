Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E76C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfxSApNnDKp8oXD4We4iw4uuXptZ3JG6G+PRq4ukCHM=; b=ZSrJAGaglZL6TwuktWYgVkQbmh
	TAgMO6uDIh4ACaxObnGitFnoPLOqToKu0tVtrQnfbeOFow4oI8kZ5Ju9E5KW+sMFgt2PCDwYA45OU
	rKNioUqMGwZAvKNTZ1E14HV5IT9y6wBBO3oLVC8wxtBsbcfrpdFDKwUpQ6VR3DUUo3/de08++52Pr
	+WPQaE5AFPHOb3zf9AuW1rroeXswO9M+ld1H/6ha6iO/4QuQYCPf4z33ho+2ugsTYfoiXJRFngkmp
	0zxqUKhOwQO0kgEJjY1ntuWevg9s8ihbG10z8ZnOnPd/Joq18yVSI3VfAKFdyqayMsbB8pU9Co/fU
	y8HCsC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoQi-0000000ClHo-42ys;
	Fri, 31 Jul 2026 14:41:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoQf-0000000ClH9-43xl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:41:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E3EE204C;
	Fri, 31 Jul 2026 07:41:36 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E21943F86F;
	Fri, 31 Jul 2026 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785508900; bh=676jVp12RghrOPwzFXm6M05kWpCuXVi5gGt6A+m8Wbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcWDgzN7DaT98KKU6d9Tmxtar5LyOjNZpeu5BcDU7/tzFus9k6ofiWPauqW/8XvLE
	 o2zf4y4Lxspwp7UsYuEKgYe8M+rxOLVPdiXIW2N/AB9Ux/gg7ESj83V6Ou60SpO5DU
	 Hh1+dqSW5BT42uHBWor2NrN/HNhSOBjY3KXtPu/A=
Date: Fri, 31 Jul 2026 15:41:32 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 1/9] arm64/entry: Bound certain debug exception paths
 in instrumentation windows
Message-ID: <amy0HHNl4GIdQ6qu@J2N7QTR9R3>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
 <38af667517b99785ccbc2075f53a364ba2acc73c.1785153469.git.hongyan.xia@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38af667517b99785ccbc2075f53a364ba2acc73c.1785153469.git.hongyan.xia@transsion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074142_171266_918BF7D9 
X-CRM114-Status: GOOD (  22.63  )
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

On Mon, Jul 27, 2026 at 12:25:34PM +0000, Hongyan Xia wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> The el1 debug exception handlers are noinstr, but their payload calls
> (do_breakpoint(), do_watchpoint(), try_step_suspended_breakpoints()
> and the Cortex-A76 erratum handler) are ordinary instrumentable code.
> 
> Mark the boundaries explicitly with instrumentation_begin()/end(), in
> the same style as x86 exception entries.
> 
> The BRK handlers (do_el1_brk64(), do_el1_softstep()) will be dealt with
> in later patches.
> 
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>

Please don't do this.

The instrumentation_{begin,end}() markers don't do anything useful on
arm64 (since we don't use objtoo, etc), and adding them to a subset of
arm64's exception entry code gives the misleading impression that these
cases are different from other exception entry cases.

Mark.

> ---
>  arch/arm64/kernel/entry-common.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index ceb4eb11232a..466529cce1c3 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/context_tracking.h>
> +#include <linux/instrumentation.h>
>  #include <linux/irq-entry-common.h>
>  #include <linux/kasan.h>
>  #include <linux/linkage.h>
> @@ -380,7 +381,9 @@ static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
>  
>  	state = arm64_enter_el1_dbg(regs);
>  	debug_exception_enter(regs);
> +	instrumentation_begin();
>  	do_breakpoint(esr, regs);
> +	instrumentation_end();
>  	debug_exception_exit(regs);
>  	arm64_exit_el1_dbg(regs, state);
>  }
> @@ -388,9 +391,15 @@ static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
>  static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
>  {
>  	irqentry_state_t state;
> +	bool handled;
>  
>  	state = arm64_enter_el1_dbg(regs);
> -	if (!cortex_a76_erratum_1463225_debug_handler(regs)) {
> +
> +	instrumentation_begin();
> +	handled = cortex_a76_erratum_1463225_debug_handler(regs);
> +	instrumentation_end();
> +
> +	if (!handled) {
>  		debug_exception_enter(regs);
>  		/*
>  		 * After handling a breakpoint, we suspend the breakpoint
> @@ -398,7 +407,11 @@ static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
>  		 * If we are stepping a suspended breakpoint there's nothing more to do:
>  		 * the single-step is complete.
>  		 */
> -		if (!try_step_suspended_breakpoints(regs))
> +		instrumentation_begin();
> +		handled = try_step_suspended_breakpoints(regs);
> +		instrumentation_end();
> +
> +		if (!handled)
>  			do_el1_softstep(esr, regs);
>  		debug_exception_exit(regs);
>  	}
> @@ -413,7 +426,9 @@ static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
>  
>  	state = arm64_enter_el1_dbg(regs);
>  	debug_exception_enter(regs);
> +	instrumentation_begin();
>  	do_watchpoint(far, esr, regs);
> +	instrumentation_end();
>  	debug_exception_exit(regs);
>  	arm64_exit_el1_dbg(regs, state);
>  }
> -- 
> 2.47.3
> 

