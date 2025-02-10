Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3DCC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPTbEBHoIY8+cXM2iAmEeydTBPY4FXVj1s/MhtcMTjs=; b=p/72BVeCwyVMG5Jj/U9rJajMPz
	xwdJgDUav2a8B0G1aFxFDrXoBOLNxY90FVGJ8qLX1JCu0240+1Noe4v8CoSPv2wS6OIiR8J30YUbh
	7iFg5khrUEoMW5vP3i0e5ehalfK2jBW8nzOMO7FwR6hMDVdJuLHp0RyfR7uQlmEan6xL87L5QnRHs
	cO5T6nc75cIltHVg5bkIakm4Xd+ijjDxCU+c0Qk3dNOqD5XIAEZwLNj3mmPFnKZ+qOOEXXqb3gQS4
	Hrzs17W+Bd/0yJOgvZr309ptqvaAJmxnrY0QZEVJak6CTx1237TdfraG08t99fHmIWbTY8ifcao9G
	/vRUip2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRvE-0000000HCxW-1GKZ;
	Mon, 10 Feb 2025 11:25:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRaY-0000000H8Xq-2dax
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:04:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A58111007;
	Mon, 10 Feb 2025 03:04:49 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 347353F5A1;
	Mon, 10 Feb 2025 03:04:21 -0800 (PST)
Date: Mon, 10 Feb 2025 11:04:15 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
	sstabellini@kernel.org, tglx@linutronix.de, peterz@infradead.org,
	luto@kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kees@kernel.org, wad@chromium.org,
	akpm@linux-foundation.org, samitolvanen@google.com,
	masahiroy@kernel.org, hca@linux.ibm.com, aliceryhl@google.com,
	rppt@kernel.org, xur@google.com, paulmck@kernel.org, arnd@arndb.de,
	mbenes@suse.cz, puranjay@kernel.org, pcc@google.com,
	ardb@kernel.org, sudeep.holla@arm.com, guohanjun@huawei.com,
	rafael@kernel.org, liuwei09@cestc.cn, dwmw@amazon.co.uk,
	Jonathan.Cameron@huawei.com, liaochang1@huawei.com,
	kristina.martsenko@arm.com, ptosi@google.com, broonie@kernel.org,
	thiago.bauermann@linaro.org, kevin.brodsky@arm.com,
	joey.gouly@arm.com, liuyuntao12@huawei.com, leobras@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v5 01/22] arm64: ptrace: Replace
 interrupts_enabled() with regs_irqs_disabled()
Message-ID: <Z6nc_itA5KT1Gk2i@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-2-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_030430_756083_E3E1C0A1 
X-CRM114-Status: GOOD (  26.15  )
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

On Fri, Dec 06, 2024 at 06:17:23PM +0800, Jinjie Ruan wrote:
> The generic entry code expects architecture code to provide
> regs_irqs_disabled(regs) function, but arm64 does not have this and
> provides inerrupts_enabled(regs), which has the opposite polarity.
> 
> In preparation for moving arm64 over to the generic entry code,
> relace arm64's interrupts_enabled() with regs_irqs_disabled() and
> update its callers under arch/arm64.
> 
> For the moment, a definition of interrupts_enabled() is provided for
> the GICv3 driver. Once arch/arm implement regs_irqs_disabled(), this
> can be removed.
> 
> No functional changes.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/daifflags.h  | 2 +-
>  arch/arm64/include/asm/ptrace.h     | 7 +++++++
>  arch/arm64/include/asm/xen/events.h | 2 +-
>  arch/arm64/kernel/acpi.c            | 2 +-
>  arch/arm64/kernel/debug-monitors.c  | 2 +-
>  arch/arm64/kernel/entry-common.c    | 4 ++--
>  arch/arm64/kernel/sdei.c            | 2 +-
>  7 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
> index fbb5c99eb2f9..5fca48009043 100644
> --- a/arch/arm64/include/asm/daifflags.h
> +++ b/arch/arm64/include/asm/daifflags.h
> @@ -128,7 +128,7 @@ static inline void local_daif_inherit(struct pt_regs *regs)
>  {
>  	unsigned long flags = regs->pstate & DAIF_MASK;
>  
> -	if (interrupts_enabled(regs))
> +	if (!regs_irqs_disabled(regs))
>  		trace_hardirqs_on();
>  
>  	if (system_uses_irq_prio_masking())
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index 47ff8654c5ec..bcfa96880377 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -214,9 +214,16 @@ static inline void forget_syscall(struct pt_regs *regs)
>  		(regs)->pmr == GIC_PRIO_IRQON :				\
>  		true)
>  
> +/*
> + * Used by the GICv3 driver, can be removed once arch/arm implements
> + * regs_irqs_disabled() directly.
> + */
>  #define interrupts_enabled(regs)			\
>  	(!((regs)->pstate & PSR_I_BIT) && irqs_priority_unmasked(regs))
>  
> +#define regs_irqs_disabled(regs)			\
> +	(((regs)->pstate & PSR_I_BIT) || (!irqs_priority_unmasked(regs)))

Please make this:

| static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
| {
| 	return (regs->pstate & PSR_I_BIT) || !irqs_priority_unmasked(regs);
| }
| 
| #define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))

That way this matches the style of x86 and s390, and with
interrupts_enabled() defined in terms of regs_irqs_disabled(), the two
cannot accidentaly diverge.

>  #define fast_interrupts_enabled(regs) \
>  	(!((regs)->pstate & PSR_F_BIT))

We should probably delete this at the same time; it's unused and we
don't want any new users to show up.

With those changes:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

>  
> diff --git a/arch/arm64/include/asm/xen/events.h b/arch/arm64/include/asm/xen/events.h
> index 2788e95d0ff0..2977b5fe068d 100644
> --- a/arch/arm64/include/asm/xen/events.h
> +++ b/arch/arm64/include/asm/xen/events.h
> @@ -14,7 +14,7 @@ enum ipi_vector {
>  
>  static inline int xen_irqs_disabled(struct pt_regs *regs)
>  {
> -	return !interrupts_enabled(regs);
> +	return regs_irqs_disabled(regs);
>  }
>  
>  #define xchg_xen_ulong(ptr, val) xchg((ptr), (val))
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index e6f66491fbe9..732f89daae23 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -403,7 +403,7 @@ int apei_claim_sea(struct pt_regs *regs)
>  	return_to_irqs_enabled = !irqs_disabled_flags(arch_local_save_flags());
>  
>  	if (regs)
> -		return_to_irqs_enabled = interrupts_enabled(regs);
> +		return_to_irqs_enabled = !regs_irqs_disabled(regs);
>  
>  	/*
>  	 * SEA can interrupt SError, mask it and describe this as an NMI so
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 58f047de3e1c..460c09d03a73 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -231,7 +231,7 @@ static void send_user_sigtrap(int si_code)
>  	if (WARN_ON(!user_mode(regs)))
>  		return;
>  
> -	if (interrupts_enabled(regs))
> +	if (!regs_irqs_disabled(regs))
>  		local_irq_enable();
>  
>  	arm64_force_sig_fault(SIGTRAP, si_code, instruction_pointer(regs),
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index b260ddc4d3e9..c547e70428d3 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -73,7 +73,7 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
>  {
>  	lockdep_assert_irqs_disabled();
>  
> -	if (interrupts_enabled(regs)) {
> +	if (!regs_irqs_disabled(regs)) {
>  		if (regs->exit_rcu) {
>  			trace_hardirqs_on_prepare();
>  			lockdep_hardirqs_on_prepare();
> @@ -569,7 +569,7 @@ static void noinstr el1_interrupt(struct pt_regs *regs,
>  {
>  	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
>  
> -	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && !interrupts_enabled(regs))
> +	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
>  		__el1_pnmi(regs, handler);
>  	else
>  		__el1_irq(regs, handler);
> diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
> index 255d12f881c2..27a17da635d8 100644
> --- a/arch/arm64/kernel/sdei.c
> +++ b/arch/arm64/kernel/sdei.c
> @@ -247,7 +247,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
>  	 * If we interrupted the kernel with interrupts masked, we always go
>  	 * back to wherever we came from.
>  	 */
> -	if (mode == kernel_mode && !interrupts_enabled(regs))
> +	if (mode == kernel_mode && regs_irqs_disabled(regs))
>  		return SDEI_EV_HANDLED;
>  
>  	/*
> -- 
> 2.34.1
> 

