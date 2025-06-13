Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DCCC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 06:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X28Ylbouea5vKL5T/LKTK2QtwCKn03+9spdzrFuGEuI=; b=Fb6RDjHXG5tfz/u5j86P+Ep7A2
	1VHXqmfwOHHgDEKMH4tQ6UeTEhwtCvIP5CVed6nhCe9FGe4CA8N07Z2TJzPBtiaDx1OVVqm1ESVfM
	4NTepfGtWlVL3/g4YfCw0ekpJgAuh9EtXj0V4FYc5l9czJWaDrussIP2BUWm22MBYkK8N/MOGbTa5
	sAiuisSIUUThWlfuM+b7zczRC9UdQ8Oljm5rf/3zXBzz59KJ3lxL1+mPC/0BZHXaaxAECwB4yA7Rg
	paF3du8De1tayimCN5ty0LQgVkccs/tQbmVWxW5mX0kmNzxhP1+jdfgc1OVwGuDS/e4uKAxNRnaa9
	txpB5mGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPxgC-0000000FSeu-0c1p;
	Fri, 13 Jun 2025 06:14:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPxdv-0000000FSVv-20VD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 06:12:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 639C91D14;
	Thu, 12 Jun 2025 23:11:38 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39BB13F59E;
	Thu, 12 Jun 2025 23:11:55 -0700 (PDT)
Message-ID: <15c103f5-fd7a-4960-b984-4055a745aa5a@arm.com>
Date: Fri, 13 Jun 2025 11:41:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 03/13] arm64: debug: call software break handlers
 statically
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-4-ada.coupriediaz@arm.com>
Content-Language: en-US
In-Reply-To: <20250609173413.132168-4-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_231159_619533_AA7579C9 
X-CRM114-Status: GOOD (  35.13  )
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

A small nit - s/break handlers/break point handlers/

On 09/06/25 11:04 PM, Ada Couprie Diaz wrote:
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

Unless absolutely necessary - could we please move these renames into a
separate patch in itself instead ? That will reduce the churn and help
the reviewers see the functional changes more clearly.

> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/kgdb.h                 |  3 +
>  arch/arm64/include/asm/kprobes.h              |  8 +++
>  arch/arm64/include/asm/traps.h                |  6 ++
>  arch/arm64/include/asm/uprobes.h              |  2 +
>  arch/arm64/kernel/debug-monitors.c            | 54 +++++++++++++----
>  arch/arm64/kernel/kgdb.c                      | 22 ++-----
>  arch/arm64/kernel/probes/kprobes.c            | 31 ++--------
>  arch/arm64/kernel/probes/kprobes_trampoline.S |  2 +-
>  arch/arm64/kernel/probes/uprobes.c            |  9 +--
>  arch/arm64/kernel/traps.c                     | 59 ++++---------------
>  10 files changed, 83 insertions(+), 113 deletions(-)
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
> index be7a3680dadf..f2782560647b 100644
> --- a/arch/arm64/include/asm/kprobes.h
> +++ b/arch/arm64/include/asm/kprobes.h
> @@ -41,4 +41,12 @@ void __kretprobe_trampoline(void);
>  void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
>  
>  #endif /* CONFIG_KPROBES */
> +
> +int __kprobes kprobe_brk_handler(struct pt_regs *regs,
> +				 unsigned long esr);
> +int __kprobes kprobe_ss_brk_handler(struct pt_regs *regs,
> +				 unsigned long esr);
> +int __kprobes kretprobe_brk_handler(struct pt_regs *regs,
> +				 unsigned long esr);
> +
>  #endif /* _ARM_KPROBES_H */
> diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
> index 82cf1f879c61..e3e8944a71c3 100644
> --- a/arch/arm64/include/asm/traps.h
> +++ b/arch/arm64/include/asm/traps.h
> @@ -29,6 +29,12 @@ void arm64_force_sig_fault_pkey(unsigned long far, const char *str, int pkey);
>  void arm64_force_sig_mceerr(int code, unsigned long far, short lsb, const char *str);
>  void arm64_force_sig_ptrace_errno_trap(int errno, unsigned long far, const char *str);
>  
> +int bug_brk_handler(struct pt_regs *regs, unsigned long esr);
> +int cfi_brk_handler(struct pt_regs *regs, unsigned long esr);
> +int reserved_fault_brk_handler(struct pt_regs *regs, unsigned long esr);
> +int kasan_brk_handler(struct pt_regs *regs, unsigned long esr);
> +int ubsan_brk_handler(struct pt_regs *regs, unsigned long esr);
> +
>  int early_brk64(unsigned long addr, unsigned long esr, struct pt_regs *regs);
>  
>  /*
> diff --git a/arch/arm64/include/asm/uprobes.h b/arch/arm64/include/asm/uprobes.h
> index 014b02897f8e..3659a79a9f32 100644
> --- a/arch/arm64/include/asm/uprobes.h
> +++ b/arch/arm64/include/asm/uprobes.h
> @@ -28,4 +28,6 @@ struct arch_uprobe {
>  	bool simulate;
>  };
>  
> +int uprobe_brk_handler(struct pt_regs *regs, unsigned long esr);
> +
>  #endif
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 9e69f2e915e8..15d7158a7548 100644
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
> @@ -299,20 +302,47 @@ void unregister_kernel_break_hook(struct break_hook *hook)
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
> +		if (IS_ENABLED(CONFIG_UPROBES) &&
> +			esr_brk_comment(esr) == UPROBES_BRK_IMM)
> +			return uprobe_brk_handler(regs, esr);
> +		return DBG_HOOK_ERROR;
>  	}
>  
> +	if (esr_brk_comment(esr) == BUG_BRK_IMM)
> +		return bug_brk_handler(regs, esr);
> +
> +	if (IS_ENABLED(CONFIG_CFI_CLANG) && esr_is_cfi_brk(esr))
> +		return cfi_brk_handler(regs, esr);
> +
> +	if (esr_brk_comment(esr) == FAULT_BRK_IMM)
> +		return reserved_fault_brk_handler(regs, esr);
> +
> +	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) &&
> +		(esr_brk_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
> +		return kasan_brk_handler(regs, esr);
> +
> +	if (IS_ENABLED(CONFIG_UBSAN_TRAP) && esr_is_ubsan_brk(esr))
> +		return ubsan_brk_handler(regs, esr);
> +
> +	if (IS_ENABLED(CONFIG_KGDB)) {
> +		if (esr_brk_comment(esr) == KGDB_DYN_DBG_BRK_IMM)
> +			return kgdb_brk_handler(regs, esr);
> +		if (esr_brk_comment(esr) == KGDB_COMPILED_DBG_BRK_IMM)
> +			return kgdb_compiled_brk_handler(regs, esr);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_KPROBES)) {
> +		if (esr_brk_comment(esr) == KPROBES_BRK_IMM)
> +			return kprobe_brk_handler(regs, esr);
> +		if (esr_brk_comment(esr) == KPROBES_BRK_SS_IMM)
> +			return kprobe_ss_brk_handler(regs, esr);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_KRETPROBES) &&
> +		esr_brk_comment(esr) == KRETPROBES_BRK_IMM)
> +		return kretprobe_brk_handler(regs, esr);
> +
>  	return DBG_HOOK_ERROR;
>  }
>  NOKPROBE_SYMBOL(call_break_hook);
> diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> index f3c4d3a8a20f..b5a3b9c85a65 100644
> --- a/arch/arm64/kernel/kgdb.c
> +++ b/arch/arm64/kernel/kgdb.c
> @@ -234,21 +234,21 @@ int kgdb_arch_handle_exception(int exception_vector, int signo,
>  	return err;
>  }
>  
> -static int kgdb_brk_fn(struct pt_regs *regs, unsigned long esr)
> +int kgdb_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	kgdb_handle_exception(1, SIGTRAP, 0, regs);
>  	return DBG_HOOK_HANDLED;
>  }
> -NOKPROBE_SYMBOL(kgdb_brk_fn)
> +NOKPROBE_SYMBOL(kgdb_brk_handler)
>  
> -static int kgdb_compiled_brk_fn(struct pt_regs *regs, unsigned long esr)
> +int kgdb_compiled_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	compiled_break = 1;
>  	kgdb_handle_exception(1, SIGTRAP, 0, regs);
>  
>  	return DBG_HOOK_HANDLED;
>  }
> -NOKPROBE_SYMBOL(kgdb_compiled_brk_fn);
> +NOKPROBE_SYMBOL(kgdb_compiled_brk_handler);
>  
>  static int kgdb_step_brk_fn(struct pt_regs *regs, unsigned long esr)
>  {
> @@ -260,16 +260,6 @@ static int kgdb_step_brk_fn(struct pt_regs *regs, unsigned long esr)
>  }
>  NOKPROBE_SYMBOL(kgdb_step_brk_fn);
>  
> -static struct break_hook kgdb_brkpt_hook = {
> -	.fn		= kgdb_brk_fn,
> -	.imm		= KGDB_DYN_DBG_BRK_IMM,
> -};
> -
> -static struct break_hook kgdb_compiled_brkpt_hook = {
> -	.fn		= kgdb_compiled_brk_fn,
> -	.imm		= KGDB_COMPILED_DBG_BRK_IMM,
> -};
> -
>  static struct step_hook kgdb_step_hook = {
>  	.fn		= kgdb_step_brk_fn
>  };
> @@ -316,8 +306,6 @@ int kgdb_arch_init(void)
>  	if (ret != 0)
>  		return ret;
>  
> -	register_kernel_break_hook(&kgdb_brkpt_hook);
> -	register_kernel_break_hook(&kgdb_compiled_brkpt_hook);
>  	register_kernel_step_hook(&kgdb_step_hook);
>  	return 0;
>  }
> @@ -329,8 +317,6 @@ int kgdb_arch_init(void)
>   */
>  void kgdb_arch_exit(void)
>  {
> -	unregister_kernel_break_hook(&kgdb_brkpt_hook);
> -	unregister_kernel_break_hook(&kgdb_compiled_brkpt_hook);
>  	unregister_kernel_step_hook(&kgdb_step_hook);
>  	unregister_die_notifier(&kgdb_notifier);
>  }
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index d9e462eafb95..0c5d408afd95 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -292,8 +292,8 @@ int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
>  	return 0;
>  }
>  
> -static int __kprobes
> -kprobe_breakpoint_handler(struct pt_regs *regs, unsigned long esr)
> +int __kprobes
> +kprobe_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	struct kprobe *p, *cur_kprobe;
>  	struct kprobe_ctlblk *kcb;
> @@ -336,13 +336,8 @@ kprobe_breakpoint_handler(struct pt_regs *regs, unsigned long esr)
>  	return DBG_HOOK_HANDLED;
>  }
>  
> -static struct break_hook kprobes_break_hook = {
> -	.imm = KPROBES_BRK_IMM,
> -	.fn = kprobe_breakpoint_handler,
> -};
> -
> -static int __kprobes
> -kprobe_breakpoint_ss_handler(struct pt_regs *regs, unsigned long esr)
> +int __kprobes
> +kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
>  	unsigned long addr = instruction_pointer(regs);
> @@ -360,13 +355,8 @@ kprobe_breakpoint_ss_handler(struct pt_regs *regs, unsigned long esr)
>  	return DBG_HOOK_ERROR;
>  }
>  
> -static struct break_hook kprobes_break_ss_hook = {
> -	.imm = KPROBES_BRK_SS_IMM,
> -	.fn = kprobe_breakpoint_ss_handler,
> -};
> -
> -static int __kprobes
> -kretprobe_breakpoint_handler(struct pt_regs *regs, unsigned long esr)
> +int __kprobes
> +kretprobe_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	if (regs->pc != (unsigned long)__kretprobe_trampoline)
>  		return DBG_HOOK_ERROR;
> @@ -375,11 +365,6 @@ kretprobe_breakpoint_handler(struct pt_regs *regs, unsigned long esr)
>  	return DBG_HOOK_HANDLED;
>  }
>  
> -static struct break_hook kretprobes_break_hook = {
> -	.imm = KRETPROBES_BRK_IMM,
> -	.fn = kretprobe_breakpoint_handler,
> -};
> -
>  /*
>   * Provide a blacklist of symbols identifying ranges which cannot be kprobed.
>   * This blacklist is exposed to userspace via debugfs (kprobes/blacklist).
> @@ -422,9 +407,5 @@ int __kprobes arch_trampoline_kprobe(struct kprobe *p)
>  
>  int __init arch_init_kprobes(void)
>  {
> -	register_kernel_break_hook(&kprobes_break_hook);
> -	register_kernel_break_hook(&kprobes_break_ss_hook);
> -	register_kernel_break_hook(&kretprobes_break_hook);
> -
>  	return 0;
>  }
> diff --git a/arch/arm64/kernel/probes/kprobes_trampoline.S b/arch/arm64/kernel/probes/kprobes_trampoline.S
> index a362f3dbb3d1..b60739d3983f 100644
> --- a/arch/arm64/kernel/probes/kprobes_trampoline.S
> +++ b/arch/arm64/kernel/probes/kprobes_trampoline.S
> @@ -12,7 +12,7 @@
>  SYM_CODE_START(__kretprobe_trampoline)
>  	/*
>  	 * Trigger a breakpoint exception. The PC will be adjusted by
> -	 * kretprobe_breakpoint_handler(), and no subsequent instructions will
> +	 * kretprobe_brk_handler(), and no subsequent instructions will
>  	 * be executed from the trampoline.
>  	 */
>  	brk #KRETPROBES_BRK_IMM
> diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
> index cb3d05af36e3..ad68b4a5974d 100644
> --- a/arch/arm64/kernel/probes/uprobes.c
> +++ b/arch/arm64/kernel/probes/uprobes.c
> @@ -173,7 +173,7 @@ int arch_uprobe_exception_notify(struct notifier_block *self,
>  	return NOTIFY_DONE;
>  }
>  
> -static int uprobe_breakpoint_handler(struct pt_regs *regs,
> +int uprobe_brk_handler(struct pt_regs *regs,
>  				     unsigned long esr)
>  {
>  	if (uprobe_pre_sstep_notifier(regs))
> @@ -194,12 +194,6 @@ static int uprobe_single_step_handler(struct pt_regs *regs,
>  	return DBG_HOOK_ERROR;
>  }
>  
> -/* uprobe breakpoint handler hook */
> -static struct break_hook uprobes_break_hook = {
> -	.imm = UPROBES_BRK_IMM,
> -	.fn = uprobe_breakpoint_handler,
> -};
> -
>  /* uprobe single step handler hook */
>  static struct step_hook uprobes_step_hook = {
>  	.fn = uprobe_single_step_handler,
> @@ -207,7 +201,6 @@ static struct step_hook uprobes_step_hook = {
>  
>  static int __init arch_init_uprobes(void)
>  {
> -	register_user_break_hook(&uprobes_break_hook);
>  	register_user_step_hook(&uprobes_step_hook);
>  
>  	return 0;
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 685c11b2c553..654c8ea46ec6 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -987,7 +987,7 @@ void do_serror(struct pt_regs *regs, unsigned long esr)
>  int is_valid_bugaddr(unsigned long addr)
>  {
>  	/*
> -	 * bug_handler() only called for BRK #BUG_BRK_IMM.
> +	 * bug_brk_handler() only called for BRK #BUG_BRK_IMM.
>  	 * So the answer is trivial -- any spurious instances with no
>  	 * bug table entry will be rejected by report_bug() and passed
>  	 * back to the debug-monitors code and handled as a fatal
> @@ -997,7 +997,7 @@ int is_valid_bugaddr(unsigned long addr)
>  }
>  #endif
>  
> -static int bug_handler(struct pt_regs *regs, unsigned long esr)
> +int bug_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	switch (report_bug(regs->pc, regs)) {
>  	case BUG_TRAP_TYPE_BUG:
> @@ -1017,13 +1017,8 @@ static int bug_handler(struct pt_regs *regs, unsigned long esr)
>  	return DBG_HOOK_HANDLED;
>  }
>  
> -static struct break_hook bug_break_hook = {
> -	.fn = bug_handler,
> -	.imm = BUG_BRK_IMM,
> -};
> -
>  #ifdef CONFIG_CFI_CLANG
> -static int cfi_handler(struct pt_regs *regs, unsigned long esr)
> +int cfi_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	unsigned long target;
>  	u32 type;
> @@ -1046,15 +1041,9 @@ static int cfi_handler(struct pt_regs *regs, unsigned long esr)
>  	arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
>  	return DBG_HOOK_HANDLED;
>  }
> -
> -static struct break_hook cfi_break_hook = {
> -	.fn = cfi_handler,
> -	.imm = CFI_BRK_IMM_BASE,
> -	.mask = CFI_BRK_IMM_MASK,
> -};
>  #endif /* CONFIG_CFI_CLANG */
>  
> -static int reserved_fault_handler(struct pt_regs *regs, unsigned long esr)
> +int reserved_fault_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	pr_err("%s generated an invalid instruction at %pS!\n",
>  		"Kernel text patching",
> @@ -1064,11 +1053,6 @@ static int reserved_fault_handler(struct pt_regs *regs, unsigned long esr)
>  	return DBG_HOOK_ERROR;
>  }
>  
> -static struct break_hook fault_break_hook = {
> -	.fn = reserved_fault_handler,
> -	.imm = FAULT_BRK_IMM,
> -};
> -
>  #ifdef CONFIG_KASAN_SW_TAGS
>  
>  #define KASAN_ESR_RECOVER	0x20
> @@ -1076,7 +1060,7 @@ static struct break_hook fault_break_hook = {
>  #define KASAN_ESR_SIZE_MASK	0x0f
>  #define KASAN_ESR_SIZE(esr)	(1 << ((esr) & KASAN_ESR_SIZE_MASK))
>  
> -static int kasan_handler(struct pt_regs *regs, unsigned long esr)
> +int kasan_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	bool recover = esr & KASAN_ESR_RECOVER;
>  	bool write = esr & KASAN_ESR_WRITE;
> @@ -1107,26 +1091,14 @@ static int kasan_handler(struct pt_regs *regs, unsigned long esr)
>  	arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
>  	return DBG_HOOK_HANDLED;
>  }
> -
> -static struct break_hook kasan_break_hook = {
> -	.fn	= kasan_handler,
> -	.imm	= KASAN_BRK_IMM,
> -	.mask	= KASAN_BRK_MASK,
> -};
>  #endif
>  
>  #ifdef CONFIG_UBSAN_TRAP
> -static int ubsan_handler(struct pt_regs *regs, unsigned long esr)
> +int ubsan_brk_handler(struct pt_regs *regs, unsigned long esr)
>  {
>  	die(report_ubsan_failure(esr & UBSAN_BRK_MASK), regs, esr);
>  	return DBG_HOOK_HANDLED;
>  }
> -
> -static struct break_hook ubsan_break_hook = {
> -	.fn	= ubsan_handler,
> -	.imm	= UBSAN_BRK_IMM,
> -	.mask	= UBSAN_BRK_MASK,
> -};
>  #endif
>  
>  /*
> @@ -1138,31 +1110,20 @@ int __init early_brk64(unsigned long addr, unsigned long esr,
>  {
>  #ifdef CONFIG_CFI_CLANG
>  	if (esr_is_cfi_brk(esr))
> -		return cfi_handler(regs, esr) != DBG_HOOK_HANDLED;
> +		return cfi_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
>  #endif
>  #ifdef CONFIG_KASAN_SW_TAGS
>  	if ((esr_brk_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
> -		return kasan_handler(regs, esr) != DBG_HOOK_HANDLED;
> +		return kasan_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
>  #endif
>  #ifdef CONFIG_UBSAN_TRAP
>  	if (esr_is_ubsan_brk(esr))
> -		return ubsan_handler(regs, esr) != DBG_HOOK_HANDLED;
> +		return ubsan_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
>  #endif
> -	return bug_handler(regs, esr) != DBG_HOOK_HANDLED;
> +	return bug_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
>  }>  
>  void __init trap_init(void)
>  {
> -	register_kernel_break_hook(&bug_break_hook);
> -#ifdef CONFIG_CFI_CLANG
> -	register_kernel_break_hook(&cfi_break_hook);
> -#endif
> -	register_kernel_break_hook(&fault_break_hook);
> -#ifdef CONFIG_KASAN_SW_TAGS
> -	register_kernel_break_hook(&kasan_break_hook);
> -#endif
> -#ifdef CONFIG_UBSAN_TRAP
> -	register_kernel_break_hook(&ubsan_break_hook);
> -#endif
>  	debug_traps_init();
>  }

debug_traps_init() can be renamed as trap_init() and just drop this
redundant indirection. All applicable comments can also be changed
as required there after.

