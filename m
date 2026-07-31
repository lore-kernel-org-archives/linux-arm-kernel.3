Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850DBC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLZA7lMDGSkHXqQQJMmrXi9p64PgjX1G6XW8SIVrOuE=; b=v6KHZicnmS94IcVnWd2aR61qIz
	1ULXxkfRsHzUlyak9XI7rnOVZddKSOwJaviYoA2hcri1MILO98gutSeWOkXMdorPK970LALxPCkfE
	39LBgFu/P97qb06gWhk182GT3bbWfafjF36kwf3lw0+YebB/qHX4Q7SNb3jwieg1w6QnJ9HeuXtMU
	pLheHHPjLKFwW1WjQcKAYHux2GSCpLBDafs6huYvMXF1xJs+h66DyG1C1JHvSoCoDqHpw3Cwc+usH
	JhsfCPaurGn9uO0oGha8cBHCD65GPfw4rZT8fAWeoT15Vg7Pk3MpKZeTojSPxU/QCEUU8OYZEP884
	L/IpylRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppJy-0000000CuwS-1eHK;
	Fri, 31 Jul 2026 15:38:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppJv-0000000Cuw4-2Zyp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 15:38:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC561204C;
	Fri, 31 Jul 2026 08:38:41 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D0673F66F;
	Fri, 31 Jul 2026 08:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785512325; bh=a9x4qgIz9Q92tBcQfHvV6I1uFGZab7g0356wUEs9xyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NIU2U+X/bzvr6WkhvujPnTYkA2mvpYvPNj89tr79Uz29bb40kfPowWxu2x7+Ez7h5
	 xPybGNrR5qy0D7sdMCdJTQzQgL4ttnbGKJ7RlBR25CsOmsmBejIBle+UQvCRZI3LcR
	 2av30pEzSlfnRJVDUsWWEzQWzO4jBgL2ukT7BOPI=
Date: Fri, 31 Jul 2026 16:38:41 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Subject: Re: [RFC PATCH 4/9] arm64/kprobes: Make the single-step machinery
 noinstr
Message-ID: <amzBgQTasz9u9OA2@J2N7QTR9R3>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
 <6be9ac705b5dea5f03855e667f14a4967b55e5e2.1785153469.git.hongyan.xia@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6be9ac705b5dea5f03855e667f14a4967b55e5e2.1785153469.git.hongyan.xia@transsion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_083847_744861_0E11F37C 
X-CRM114-Status: GOOD (  27.56  )
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
Cc: Pu Hu <hupu@transsion.com>, Jiazi Li <jiazi.li@transsion.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Will Deacon <will@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jul 27, 2026 at 12:25:39PM +0000, Hongyan Xia wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> Convert the core of the arm64 kprobe single-step flow to noinstr:
> save_previous_kprobe(), restore_previous_kprobe(), set_current_kprobe(),
> kprobes_save_local_irqflag(), kprobes_restore_local_irqflag(),
> setup_singlestep(), reenter_kprobe() and post_kprobe_handler().
> 
> These functions only touch per-cpu state, pt_regs and DAIF, except for:
> 
> - kprobes_inc_nmissed_count(), which is generic and instrumentable; add
>   an arm64-local wrapper that calls it bounded by
>   instrumentation_begin()/end();

Why is it safe to call kprobes_inc_nmissed_count() if it can be
instrumented?

How does that work for other architectures?

> - the instruction simulation path in setup_singlestep(), whose decode
>   handlers are instrumentable; bound arch_simulate_insn() with an
>   instrumentation window;

I don't think that's sufficient. If we can instrument that code, then we
can have unbounded recursion, unless I'm missing something?

I think we need to fix that code to be noinstr safe.

Ada Cc'd was looking into making the insn code generally noinstr-safe,
but that's a big job. Maybe it's possible to clean up the subset that's
necessary for arch_simulate_insn()?

> - the unrecoverable-reentry pr_warn()/dump_kprobe()/BUG() path and the
>   default WARN_ON(), both bounded with instrumentation windows.

That sounds fine.

Mark.

> The __kprobes attribute (notrace + .kprobes.text) is replaced by
> noinstr, which is a strict superset for these functions.
> 
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 39 ++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 4e0efad5caf2..1b12341b2af3 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -14,6 +14,7 @@
>  #include <linux/extable.h>
>  #include <linux/kasan.h>
>  #include <linux/kernel.h>
> +#include <linux/instrumentation.h>
>  #include <linux/kprobes.h>
>  #include <linux/sched/debug.h>
>  #include <linux/set_memory.h>
> @@ -39,7 +40,7 @@
>  DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
>  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>  
> -static void __kprobes
> +static void noinstr
>  post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
>  
>  void *alloc_insn_page(void)
> @@ -170,7 +171,7 @@ void __kprobes arch_remove_kprobe(struct kprobe *p)
>  	}
>  }
>  
> -static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)
> +static void noinstr save_previous_kprobe(struct kprobe_ctlblk *kcb)
>  {
>  	kcb->prev_kprobe.kp = kprobe_running();
>  	kcb->prev_kprobe.status = kcb->kprobe_status;
> @@ -184,7 +185,7 @@ static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)
>  	kcb->prev_kprobe.saved_irqflag = kcb->saved_irqflag;
>  }
>  
> -static void __kprobes restore_previous_kprobe(struct kprobe_ctlblk *kcb)
> +static void noinstr restore_previous_kprobe(struct kprobe_ctlblk *kcb)
>  {
>  	__this_cpu_write(current_kprobe, kcb->prev_kprobe.kp);
>  	kcb->kprobe_status = kcb->prev_kprobe.status;
> @@ -197,7 +198,7 @@ static void __kprobes restore_previous_kprobe(struct kprobe_ctlblk *kcb)
>  	kcb->saved_irqflag = kcb->prev_kprobe.saved_irqflag;
>  }
>  
> -static void __kprobes set_current_kprobe(struct kprobe *p)
> +static void noinstr set_current_kprobe(struct kprobe *p)
>  {
>  	__this_cpu_write(current_kprobe, p);
>  }
> @@ -207,23 +208,23 @@ static void __kprobes set_current_kprobe(struct kprobe *p)
>   * simple and avoid nesting exceptions. Interrupts do have to be disabled since
>   * the kprobe state is per-CPU and doesn't get migrated.
>   */
> -static void __kprobes kprobes_save_local_irqflag(struct kprobe_ctlblk *kcb,
> -						struct pt_regs *regs)
> +static void noinstr kprobes_save_local_irqflag(struct kprobe_ctlblk *kcb,
> +					       struct pt_regs *regs)
>  {
>  	kcb->saved_irqflag = regs->pstate & DAIF_MASK;
>  	regs->pstate |= DAIF_MASK;
>  }
>  
> -static void __kprobes kprobes_restore_local_irqflag(struct kprobe_ctlblk *kcb,
> -						struct pt_regs *regs)
> +static void noinstr kprobes_restore_local_irqflag(struct kprobe_ctlblk *kcb,
> +						  struct pt_regs *regs)
>  {
>  	regs->pstate &= ~DAIF_MASK;
>  	regs->pstate |= kcb->saved_irqflag;
>  }
>  
> -static void __kprobes setup_singlestep(struct kprobe *p,
> -				       struct pt_regs *regs,
> -				       struct kprobe_ctlblk *kcb, int reenter)
> +static void noinstr setup_singlestep(struct kprobe *p,
> +				     struct pt_regs *regs,
> +				     struct kprobe_ctlblk *kcb, int reenter)
>  {
>  	unsigned long slot;
>  
> @@ -244,13 +245,15 @@ static void __kprobes setup_singlestep(struct kprobe *p,
>  		instruction_pointer_set(regs, slot);
>  	} else {
>  		/* insn simulation */
> +		instrumentation_begin();
>  		arch_simulate_insn(p, regs);
> +		instrumentation_end();
>  	}
>  }
>  
> -static int __kprobes reenter_kprobe(struct kprobe *p,
> -				    struct pt_regs *regs,
> -				    struct kprobe_ctlblk *kcb)
> +static int noinstr reenter_kprobe(struct kprobe *p,
> +				  struct pt_regs *regs,
> +				  struct kprobe_ctlblk *kcb)
>  {
>  	switch (kcb->kprobe_status) {
>  	case KPROBE_HIT_SSDONE:
> @@ -262,23 +265,29 @@ static int __kprobes reenter_kprobe(struct kprobe *p,
>  		 * recoverable one-level reentry, so handle it in the same way as
>  		 * reentry from KPROBE_HIT_ACTIVE or KPROBE_HIT_SSDONE.
>  		 */
> +		instrumentation_begin();
>  		kprobes_inc_nmissed_count(p);
> +		instrumentation_end();
>  		setup_singlestep(p, regs, kcb, 1);
>  		break;
>  	case KPROBE_REENTER:
> +		instrumentation_begin();
>  		pr_warn("Failed to recover from reentered kprobes.\n");
>  		dump_kprobe(p);
>  		BUG();
> +		instrumentation_end();
>  		break;
>  	default:
> +		instrumentation_begin();
>  		WARN_ON(1);
> +		instrumentation_end();
>  		return 0;
>  	}
>  
>  	return 1;
>  }
>  
> -static void __kprobes
> +static void noinstr
>  post_kprobe_handler(struct kprobe *cur, struct kprobe_ctlblk *kcb, struct pt_regs *regs)
>  {
>  	/* return addr restore if non-branching insn */
> -- 
> 2.47.3
> 

