Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFDFC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq3Uco6FpGsihpZ89SYXAOowuIqDUBOe/mrSf7s/Qw0=; b=JBwSmUeQnJT1NkZtklyFP0FR19
	VWVuyJ6vjQTdVDY2u1bvTE3lrVd86fK5Q94mHcKLQawHPIYCAa7wKGNR3pIgn/FvETi5wGHjORGaW
	MzwXGwX/RieD4BOXTYPapaH5AfEuVuj+XASeZh3jgEYJwn2h1czc44Fz4tXtS0whDdW3uRpiqbS8/
	lWWUc6PBEa25s1lKAGwA2VFXsLQwPRRL6eNqDrVPO/EKD5SctUzOgqMEGw0UiwRI2wFvTvby8pFmi
	fOpPeDTSMiBeVuHSArc/2vAeA+b6TCB0Uw0JMuqqRbMR3dEVeNQYs8WhQEiTyDmp7iehK08ChosSk
	Vd3CfhrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPVb-0000000DSQm-0hPz;
	Tue, 20 May 2025 16:08:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP0R-0000000DN3M-38kH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA4C75C51B9;
	Tue, 20 May 2025 15:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733DDC4CEE9;
	Tue, 20 May 2025 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755350;
	bh=reA59lt4ofkVwwLW/zMg0OB7ke53H6RSyrxEv1AEX6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNHCDfR9LHS4NBpKi59QKnlAZIqx+WrFDyq4XUvmJylJO0xsJNp71j0la0DrgFAGJ
	 XBpUnBf8rU5DSwl6k2/5HYdDoc2yZEdV5L2pLlpRseU+UmmvPu0scmjYSfAO/swhz5
	 bFf/Tg4brHL6u3TEhoKBDJd6AUwCFnKu34bO049ZIzV9QUmtIq30in/XrxCs9jr6o8
	 S9h+aK9XTin0URDiTyel4tWxu77uo/Tgd/jp7BZ9vWbJ3JpwrGWJI788xruegy6lVa
	 xZnvvEb2qSzbtW29tcPpXadmGIgrK1TBouDoRNlyfCD8H7M0fo7qX+r2QTLYvv2e60
	 WeIACAD2J42jw==
Date: Tue, 20 May 2025 16:35:46 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 02/11] arm64: debug: call software break handlers
 statically
Message-ID: <20250520153545.GB18901@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-3-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512174326.133905-3-ada.coupriediaz@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_083551_902910_C5EE1248 
X-CRM114-Status: GOOD (  34.51  )
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

On Mon, May 12, 2025 at 06:43:17PM +0100, Ada Couprie Diaz wrote:
> Software breakpoints pass an immediate value in ESR ("comment") that can
> be used to call a specialized handler (KGDB, KASAN...).
> We do so in two different ways :
>  - During early boot, `early_brk64` statically checks against known
>    immediates and calls the corresponding handler,
>  - During init, handlers are dynamically registered into a list. When
>    called, the generic software breakpoint handler will iterate over
>    the list to find the appropriate handler.
> 
> The dynamic registration does not provide any benefit here as it is not
> exported and all its uses are within the arm64 tree. It also depends on an
> RCU list, whose safe access currently relies on the non-preemptible state
> of `do_debug_exception`.
> 
> Replace the list iteration logic in `call_break_hooks` to call
> the breakpoint handlers statically if they are enabled, like in
> `early_brk64`.
> Expose the handlers in their respective headers to be reachable from
> `arch/arm64/kernel/debug-monitors.c` at link time.
> 
> Unify the naming of the software breakpoint handlers to XXX_brk_handler(),
> making it clear they are related and to differentiate from the
> hardware breakpoints.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/kgdb.h                 |  3 +
>  arch/arm64/include/asm/kprobes.h              |  6 ++
>  arch/arm64/include/asm/traps.h                |  6 ++
>  arch/arm64/include/asm/uprobes.h              |  2 +
>  arch/arm64/kernel/debug-monitors.c            | 57 ++++++++++++++----
>  arch/arm64/kernel/kgdb.c                      | 22 ++-----
>  arch/arm64/kernel/probes/kprobes.c            | 31 ++--------
>  arch/arm64/kernel/probes/kprobes_trampoline.S |  2 +-
>  arch/arm64/kernel/probes/uprobes.c            |  9 +--
>  arch/arm64/kernel/traps.c                     | 59 ++++---------------
>  10 files changed, 84 insertions(+), 113 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kgdb.h b/arch/arm64/include/asm/kgdb.h
> index 21fc85e9d2be..82a76b2102fb 100644
> --- a/arch/arm64/include/asm/kgdb.h
> +++ b/arch/arm64/include/asm/kgdb.h
> @@ -24,6 +24,9 @@ static inline void arch_kgdb_breakpoint(void)
>  extern void kgdb_handle_bus_error(void);
>  extern int kgdb_fault_expected;
>  
> +int kgdb_brk_handler(struct pt_regs *regs, unsigned long esr);
> +int kgdb_compiled_brk_handler(struct pt_regs *regs, unsigned long esr);
> +
>  #endif /* !__ASSEMBLY__ */
>  
>  /*
> diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kprobes.h
> index be7a3680dadf..b27dd6028e6a 100644
> --- a/arch/arm64/include/asm/kprobes.h
> +++ b/arch/arm64/include/asm/kprobes.h
> @@ -38,6 +38,12 @@ struct kprobe_ctlblk {
>  void arch_remove_kprobe(struct kprobe *);
>  int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
>  void __kretprobe_trampoline(void);
> +int __kprobes kprobe_brk_handler(struct pt_regs *regs,
> +				 unsigned long esr);
> +int __kprobes kprobe_ss_brk_handler(struct pt_regs *regs,
> +				 unsigned long esr);
> +int __kprobes kretprobe_brk_handler(struct pt_regs *regs,
> +				 unsigned long esr);
>  void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
>  
>  #endif /* CONFIG_KPROBES */

If you add these _after_ the #endif...

> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 676fa0231935..4ece4a93b872 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -21,8 +21,11 @@
>  #include <asm/cputype.h>
>  #include <asm/daifflags.h>
>  #include <asm/debug-monitors.h>
> +#include <asm/kgdb.h>
> +#include <asm/kprobes.h>
>  #include <asm/system_misc.h>
>  #include <asm/traps.h>
> +#include <asm/uprobes.h>
>  
>  /* Determine debug architecture. */
>  u8 debug_monitors_arch(void)
> @@ -299,20 +302,50 @@ void unregister_kernel_break_hook(struct break_hook *hook)
>  
>  static int call_break_hook(struct pt_regs *regs, unsigned long esr)
>  {
> -	struct break_hook *hook;
> -	struct list_head *list;
> -
> -	list = user_mode(regs) ? &user_break_hook : &kernel_break_hook;
> -
> -	/*
> -	 * Since brk exception disables interrupt, this function is
> -	 * entirely not preemptible, and we can use rcu list safely here.
> -	 */
> -	list_for_each_entry_rcu(hook, list, node) {
> -		if ((esr_brk_comment(esr) & ~hook->mask) == hook->imm)
> -			return hook->fn(regs, esr);
> +	if (user_mode(regs)) {
> +#ifdef CONFIG_UPROBES
> +		if (esr_brk_comment(esr) == UPROBES_BRK_IMM)
> +			return uprobe_brk_handler(regs, esr);
> +#endif
> +		return DBG_HOOK_ERROR;
>  	}
>  
> +	if (esr_brk_comment(esr) == BUG_BRK_IMM)
> +		return bug_brk_handler(regs, esr);
> +
> +#ifdef CONFIG_CFI_CLANG
> +	if (esr_is_cfi_brk(esr))
> +		return cfi_brk_handler(regs, esr);
> +#endif
> +
> +	if (esr_brk_comment(esr) == FAULT_BRK_IMM)
> +		return reserved_fault_brk_handler(regs, esr);
> +
> +#ifdef CONFIG_KASAN_SW_TAGS
> +	if ((esr_brk_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
> +		return kasan_brk_handler(regs, esr);
> +#endif
> +#ifdef CONFIG_UBSAN_TRAP
> +	if ((esr_brk_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM)
> +		return ubsan_brk_handler(regs, esr);
> +#endif
> +#ifdef CONFIG_KGDB
> +	if (esr_brk_comment(esr) == KGDB_DYN_DBG_BRK_IMM)
> +		return kgdb_brk_handler(regs, esr);
> +	if (esr_brk_comment(esr) == KGDB_COMPILED_DBG_BRK_IMM)
> +		return kgdb_compiled_brk_handler(regs, esr);
> +#endif
> +#ifdef CONFIG_KPROBES
> +	if (esr_brk_comment(esr) == KPROBES_BRK_IMM)
> +		return kprobe_brk_handler(regs, esr);
> +	if (esr_brk_comment(esr) == KPROBES_BRK_SS_IMM)
> +		return kprobe_ss_brk_handler(regs, esr);
> +#endif
> +#ifdef CONFIG_KRETPROBES
> +	if (esr_brk_comment(esr) == KRETPROBES_BRK_IMM)
> +		return kretprobe_brk_handler(regs, esr);
> +#endif

... then I think you can use IS_ENABLED() here instead of the #ifdefs.
I didn't check everything, but the diff I was hacking on is below.

Will

--->8

diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kprobes.h
index b27dd6028e6a..0d41fbbffb06 100644
--- a/arch/arm64/include/asm/kprobes.h
+++ b/arch/arm64/include/asm/kprobes.h
@@ -38,13 +38,14 @@ struct kprobe_ctlblk {
 void arch_remove_kprobe(struct kprobe *);
 int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
 void __kretprobe_trampoline(void);
+void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
+#endif /* CONFIG_KPROBES */
+
 int __kprobes kprobe_brk_handler(struct pt_regs *regs,
 				 unsigned long esr);
 int __kprobes kprobe_ss_brk_handler(struct pt_regs *regs,
 				 unsigned long esr);
 int __kprobes kretprobe_brk_handler(struct pt_regs *regs,
 				 unsigned long esr);
-void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
 
-#endif /* CONFIG_KPROBES */
 #endif /* _ARM_KPROBES_H */
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index a5f344e556df..5b199ac70476 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -227,48 +227,50 @@ NOKPROBE_SYMBOL(do_softstep);
 static int call_break_hook(struct pt_regs *regs, unsigned long esr)
 {
 	if (user_mode(regs)) {
-#ifdef CONFIG_UPROBES
-		if (esr_brk_comment(esr) == UPROBES_BRK_IMM)
+		if (IS_ENABLED(CONFIG_UPROBES) &&
+		    esr_brk_comment(esr) == UPROBES_BRK_IMM) {
 			return uprobe_brk_handler(regs, esr);
-#endif
+		}
+
 		return DBG_HOOK_ERROR;
 	}
 
 	if (esr_brk_comment(esr) == BUG_BRK_IMM)
 		return bug_brk_handler(regs, esr);
 
-#ifdef CONFIG_CFI_CLANG
-	if (esr_is_cfi_brk(esr))
+	if (IS_ENABLED(CONFIG_CFI_CLANG) && esr_is_cfi_brk(esr))
 		return cfi_brk_handler(regs, esr);
-#endif
 
 	if (esr_brk_comment(esr) == FAULT_BRK_IMM)
 		return reserved_fault_brk_handler(regs, esr);
 
-#ifdef CONFIG_KASAN_SW_TAGS
-	if ((esr_brk_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
+	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) &&
+	    (esr_brk_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM) {
 		return kasan_brk_handler(regs, esr);
-#endif
-#ifdef CONFIG_UBSAN_TRAP
-	if ((esr_brk_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM)
+	}
+
+	if (IS_ENABLED(CONFIG_UBSAN_TRAP) &&
+	    (esr_brk_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM) {
 		return ubsan_brk_handler(regs, esr);
-#endif
-#ifdef CONFIG_KGDB
-	if (esr_brk_comment(esr) == KGDB_DYN_DBG_BRK_IMM)
-		return kgdb_brk_handler(regs, esr);
-	if (esr_brk_comment(esr) == KGDB_COMPILED_DBG_BRK_IMM)
-		return kgdb_compiled_brk_handler(regs, esr);
-#endif
-#ifdef CONFIG_KPROBES
-	if (esr_brk_comment(esr) == KPROBES_BRK_IMM)
-		return kprobe_brk_handler(regs, esr);
-	if (esr_brk_comment(esr) == KPROBES_BRK_SS_IMM)
-		return kprobe_ss_brk_handler(regs, esr);
-#endif
-#ifdef CONFIG_KRETPROBES
-	if (esr_brk_comment(esr) == KRETPROBES_BRK_IMM)
+	}
+
+	if (IS_ENABLED(CONFIG_KGDB)) {
+		if (esr_brk_comment(esr) == KGDB_DYN_DBG_BRK_IMM)
+			return kgdb_brk_handler(regs, esr);
+		if (esr_brk_comment(esr) == KGDB_COMPILED_DBG_BRK_IMM)
+			return kgdb_compiled_brk_handler(regs, esr);
+	}
+
+	if (IS_ENABLED(CONFIG_KPROBES)) {
+		if (esr_brk_comment(esr) == KPROBES_BRK_IMM)
+			return kprobe_brk_handler(regs, esr);
+		if (esr_brk_comment(esr) == KPROBES_BRK_SS_IMM)
+			return kprobe_ss_brk_handler(regs, esr);
+	}
+
+	if (IS_ENABLED(CONFIG_KRETPROBES) &&
+	    esr_brk_comment(esr) == KRETPROBES_BRK_IMM)
 		return kretprobe_brk_handler(regs, esr);
-#endif
 
 	return DBG_HOOK_ERROR;
 }

