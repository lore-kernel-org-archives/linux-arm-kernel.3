Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CC1C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIfzvbF9lQOS0Q5Mk0PjItDgkSYXNspy5rDBjNN6W9k=; b=T49XHq16tV+WCIXMDTPHHtNVFJ
	GmbsdCYrWCE47rfx0nq68DpJVPPQ4UUbC+QxMxMgZSs/VUj5UKj/HKBGY3sWMlbG9m3yF5db26AOc
	7k/55agUGUVBqLNH5OUKnRIZ0OPt5qXJb+8TwNs7wL/j+9N7gTsx9JnYWlvawARYYic6bJGGcKzEx
	Ij//d5l2FkW/noK9tEflgEsOuVnmnsXCLv9hpLb/Ajqr5tUeS4jMl58UttJTWQ9R6bHuqO/VTJnfD
	CJa9DZMnhXl3ynnaATharswaGpw/JrzIY5hXUA60baf9A3p0+NNvCFcl3UxW2vsdx1gMd1xKgvcEj
	Werhy9cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXpy-000000015tj-39PK;
	Thu, 13 Aug 2026 15:59:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXpx-000000015tb-3ZT5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:59:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B12E40A66;
	Thu, 13 Aug 2026 15:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD41C1F000E9;
	Thu, 13 Aug 2026 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786636761;
	bh=fIfzvbF9lQOS0Q5Mk0PjItDgkSYXNspy5rDBjNN6W9k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=loRIf+WM5aGb+iZmBh4a4ZGJh0XZzoZiI4pi2FvbRyZ6bABBtjcnpLF5ex387T6VW
	 97SM3IAr2cfhNhGLc19jJpHk73j2lrfIvsLe1Rk7hdjOKNy7aAAPN4pDH2+5xfJrOv
	 dAMQcjXpSKaezNIcQsDsLBqF2u39DnxgeD4HWzEMAH0QbWXk1vfpQmw33ToTZnaqd4
	 /V+9nObkCtU/RwiMUYHnFh7nritvnSAgd7tDT0KU7jL9svqwYo2x88cZymvkNZhUEu
	 9GQi08VlhucwLAu8sPkD/ZaYtujC0So/e0LK3hMoBxUlbD1FB9oXwCcTq4+z7y0Gpz
	 yVcMtMsV4E+QQ==
Date: Fri, 14 Aug 2026 00:59:16 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jiazi
 Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>
Subject: Re: [RFC PATCH v2 2/4] arm64/debug: Make the Kprobe functions
 noinstr
Message-Id: <20260814005916.78060337f26a550bb792e1f7@kernel.org>
In-Reply-To: <f9ec50138a7022b8d83bf3ce8e55534202e17e55.1786603168.git.hongyan.xia@transsion.com>
References: <cover.1786603168.git.hongyan.xia@transsion.com>
	<f9ec50138a7022b8d83bf3ce8e55534202e17e55.1786603168.git.hongyan.xia@transsion.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 13 Aug 2026 06:49:42 +0000
Hongyan Xia <hongyan.xia@transsion.com> wrote:

> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> The Kprobe debug exception path must be run with extra care. NOKPROBE
> isn't sufficient, as other instrumentation like ftrace still opens a can
> of worms that is very complex to deal with.
> 
> Mark the three main Kprobe entry points noinstr, as well as the debug
> exception paths that lead to and exit from these entry points. Note that
> noinstr attribute is stronger and can safely replace NOKPROBE and
> __kprobe modifiers.
> 
> Also mark esr_brk_comment() __always_inline, as clang does not
> reliably inline plain static inline functions into noinline (noinstr)
> callers such as call_el1_break_hook().
> 

Looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you,

> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/include/asm/esr.h       | 2 +-
>  arch/arm64/include/asm/kprobes.h   | 9 +++------
>  arch/arm64/kernel/debug-monitors.c | 6 ++----
>  arch/arm64/kernel/probes/kprobes.c | 6 +++---
>  4 files changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
> index f816f5d77f1a..a75bfdb7e5fe 100644
> --- a/arch/arm64/include/asm/esr.h
> +++ b/arch/arm64/include/asm/esr.h
> @@ -437,7 +437,7 @@
>  #ifndef __ASSEMBLER__
>  #include <asm/types.h>
>  
> -static inline unsigned long esr_brk_comment(unsigned long esr)
> +static __always_inline unsigned long esr_brk_comment(unsigned long esr)
>  {
>  	return esr & ESR_ELx_BRK64_ISS_COMMENT_MASK;
>  }
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
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 29307642f4c9..5cf4fb8ddf83 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -207,7 +207,7 @@ void do_el1_softstep(unsigned long esr, struct pt_regs *regs)
>  }
>  NOKPROBE_SYMBOL(do_el1_softstep);
>  
> -static int call_el1_break_hook(struct pt_regs *regs, unsigned long esr)
> +static int noinstr call_el1_break_hook(struct pt_regs *regs, unsigned long esr)
>  {
>  	if (esr_brk_comment(esr) == BUG_BRK_IMM)
>  		return bug_brk_handler(regs, esr);
> @@ -245,7 +245,6 @@ static int call_el1_break_hook(struct pt_regs *regs, unsigned long esr)
>  
>  	return DBG_HOOK_ERROR;
>  }
> -NOKPROBE_SYMBOL(call_el1_break_hook);
>  
>  /*
>   * We have already unmasked interrupts and enabled preemption
> @@ -261,14 +260,13 @@ void do_el0_brk64(unsigned long esr, struct pt_regs *regs)
>  	send_user_sigtrap(TRAP_BRKPT);
>  }
>  
> -void do_el1_brk64(unsigned long esr, struct pt_regs *regs)
> +void noinstr do_el1_brk64(unsigned long esr, struct pt_regs *regs)
>  {
>  	if (call_el1_break_hook(regs, esr) == DBG_HOOK_HANDLED)
>  		return;
>  
>  	die("Oops - BRK", regs, esr);
>  }
> -NOKPROBE_SYMBOL(do_el1_brk64);
>  
>  #ifdef CONFIG_COMPAT
>  void do_bkpt32(unsigned long esr, struct pt_regs *regs)
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 4e0efad5caf2..0e66abf9958e 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -350,7 +350,7 @@ int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
>  	return 0;
>  }
>  
> -int __kprobes
> +int noinstr
>  kprobe_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	struct kprobe *p, *cur_kprobe;
> @@ -394,7 +394,7 @@ kprobe_brk_handler(struct pt_regs *regs, unsigned long esr)
>  	return DBG_HOOK_HANDLED;
>  }
>  
> -int __kprobes
> +int noinstr
>  kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
> @@ -413,7 +413,7 @@ kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)
>  	return DBG_HOOK_ERROR;
>  }
>  
> -int __kprobes
> +int noinstr
>  kretprobe_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	if (regs->pc != (unsigned long)__kretprobe_trampoline)
> -- 
> 2.47.3
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

