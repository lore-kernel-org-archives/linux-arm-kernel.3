Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09EEC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXlT0AZDw/P0jdDqjSLHMkFcW36j/TTqr+zyC4sw48M=; b=x4zRCDIowbDPjpwGAVZyHGi7qc
	EwZEUVcsCy0GN1mpRjryes9yFV4O4X8f7Sj1EkHukOvEe9H608R+u2yDXa4leMYMGDA0+K1e7N1Us
	f8MCsUIGiHALa7e6QqC9SW9FGjWYNM6WY/5Mtf38GWI5qdsSgH15yIvztR7MQQo6glZ25PoQu+iVG
	wKjO7DSErbqyGc5FhctLFqFvLQBp+U9sjuko/3/pVYjWcmG8QvgfIK6zuZ9YX3dxcdPEFFj/+72h3
	Q0OMNbEzWzcsNG93DsBzZ5F3CRScCXA7rlV2LiXnPcI2MwaNWjrP/U8BHdTNkE7k67uGbzEJDURAM
	K+TooRcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppPf-0000000CvQX-2USJ;
	Fri, 31 Jul 2026 15:44:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppPd-0000000CvQA-0hOK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 15:44:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8722F204C;
	Fri, 31 Jul 2026 08:44:35 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68AEC3F66F;
	Fri, 31 Jul 2026 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785512679; bh=8IFMauaSRCXOdSY40d+y7wLMdtMeKGcCp3XjsSmhc78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGrQGbe0Evj0ByT/v7EBKvXriDzNi04ME1P8QBWncSGoVGvanh8xa6z4E808fAjnA
	 x0ZGWdNxdLMZmAxRYWi9ZUOkRz+C+5t2E2gIx8PtVc6uMFLHCvziKTuwPr/CxugL5P
	 2IBvhiqldjKn9muNQJQDObAPCgYf8+XgQoONUJWY=
Date: Fri, 31 Jul 2026 16:44:36 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 5/9] arm64/kprobes: Invoke pre/post handlers inside
 instrumentation
Message-ID: <amzC5KrGxgfIfB-O@J2N7QTR9R3>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
 <400e92624124bb2f0efb8757032d1326ccd51d6b.1785153469.git.hongyan.xia@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <400e92624124bb2f0efb8757032d1326ccd51d6b.1785153469.git.hongyan.xia@transsion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_084441_305586_9E5A5E0D 
X-CRM114-Status: GOOD (  24.59  )
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

On Mon, Jul 27, 2026 at 12:25:41PM +0000, Hongyan Xia wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> The kprobe pre_handler() and post_handler() are arbitrary instrumentable
> code and can themselves trace, fault, or hit other kprobes. They are
> the only parts of the kprobe debug exception flow that legitimately
> need instrumentation.

That doesn't explain what this patch changes, or why.

I'm fine with marking all the kprobe functions noinstr, but we don't
need the intrumentation_{begin,end}() gunk.

In general, it's not sound for pre_handler and post_handler to invoke
arbitrary code, given that they could lead to recursion. We just hope
people don't do stupid things with them.

Mark.

> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/include/asm/kprobes.h   |  9 +++------
>  arch/arm64/kernel/probes/kprobes.c | 22 ++++++++++++++++++----
>  2 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kprobes.h
> index 35ce2c94040e..a694f7d34f45 100644
> --- a/arch/arm64/include/asm/kprobes.h
> +++ b/arch/arm64/include/asm/kprobes.h
> @@ -48,11 +48,8 @@ void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
>  
>  #endif /* CONFIG_KPROBES */
>  
> -int __kprobes kprobe_brk_handler(struct pt_regs *regs,
> -				 unsigned long esr);
> -int __kprobes kprobe_ss_brk_handler(struct pt_regs *regs,
> -				 unsigned long esr);
> -int __kprobes kretprobe_brk_handler(struct pt_regs *regs,
> -				 unsigned long esr);
> +int noinstr kprobe_brk_handler(struct pt_regs *regs, unsigned long esr);
> +int noinstr kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr);
> +int noinstr kretprobe_brk_handler(struct pt_regs *regs, unsigned long esr);
>  
>  #endif /* _ARM_KPROBES_H */
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 1b12341b2af3..e9fa66fa4217 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -301,8 +301,11 @@ post_kprobe_handler(struct kprobe *cur, struct kprobe_ctlblk *kcb, struct pt_reg
>  	}
>  	/* call post handler */
>  	kcb->kprobe_status = KPROBE_HIT_SSDONE;
> +
> +	instrumentation_begin();
>  	if (cur->post_handler)
>  		cur->post_handler(cur, regs, 0);
> +	instrumentation_end();
>  
>  	reset_current_kprobe();
>  }
> @@ -359,24 +362,28 @@ int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
>  	return 0;
>  }
>  
> -int __kprobes
> +int noinstr
>  kprobe_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	struct kprobe *p, *cur_kprobe;
>  	struct kprobe_ctlblk *kcb;
>  	unsigned long addr = instruction_pointer(regs);
> +	bool handled;
>  
>  	kcb = get_kprobe_ctlblk();
>  	cur_kprobe = kprobe_running();
>  
> +	instrumentation_begin();
>  	p = get_kprobe((kprobe_opcode_t *) addr);
>  	if (WARN_ON_ONCE(!p)) {
> +		instrumentation_end();
>  		/*
>  		 * Something went wrong. This BRK used an immediate reserved
>  		 * for kprobes, but we couldn't find any corresponding probe.
>  		 */
>  		return DBG_HOOK_ERROR;
>  	}
> +	instrumentation_end();
>  
>  	if (cur_kprobe) {
>  		/* Hit a kprobe inside another kprobe */
> @@ -387,6 +394,10 @@ kprobe_brk_handler(struct pt_regs *regs, unsigned long esr)
>  		set_current_kprobe(p);
>  		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
>  
> +		instrumentation_begin();
> +		handled = p->pre_handler && p->pre_handler(p, regs);
> +		instrumentation_end();
> +
>  		/*
>  		 * If we have no pre-handler or it returned 0, we
>  		 * continue with normal processing.  If we have a
> @@ -394,7 +405,7 @@ kprobe_brk_handler(struct pt_regs *regs, unsigned long esr)
>  		 * modify the execution path and not need to single-step
>  		 * Let's just reset current kprobe and exit.
>  		 */
> -		if (!p->pre_handler || !p->pre_handler(p, regs))
> +		if (!handled)
>  			setup_singlestep(p, regs, kcb, 0);
>  		else
>  			reset_current_kprobe();
> @@ -403,7 +414,7 @@ kprobe_brk_handler(struct pt_regs *regs, unsigned long esr)
>  	return DBG_HOOK_HANDLED;
>  }
>  
> -int __kprobes
> +int noinstr
>  kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
> @@ -422,13 +433,16 @@ kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)
>  	return DBG_HOOK_ERROR;
>  }
>  
> -int __kprobes
> +int noinstr
>  kretprobe_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	if (regs->pc != (unsigned long)__kretprobe_trampoline)
>  		return DBG_HOOK_ERROR;
>  
> +	instrumentation_begin();
>  	regs->pc = kretprobe_trampoline_handler(regs, (void *)regs->regs[29]);
> +	instrumentation_end();
> +
>  	return DBG_HOOK_HANDLED;
>  }
>  
> -- 
> 2.47.3
> 

