Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A03C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGLPPrMw0OdNYsDmFUIkQOyHy6AzM3xMjDUKZFMw3xU=; b=yOq1pQENVoGWKPb7ZD5UdAoMRi
	udDWi4ezNltM/JMVyUPnPp+nHgFouVwapboXzwHgEWIj3rElUU45NHadGkgqSPdt+pnYGnZMoM3zc
	KEPVFI/X9tp/nRTNbBUct/+3MVcC/I6dab0VnxypGIjYpywrknBSrSVYoljODHgKiG0qUUPqh8UeR
	mvoeP+spL5P0BCsIdgkMGJcTYVO7JJ6cIGLCzRzYA/4XfrWy5TyHik04kfGStrs1906qZbEgNFV9B
	WmaGctVuVIB/6BxJXtWN/YF71zacIZBh6mIr2qZam9t4xsKLWMWUpOIf7NlhnoKbPyVnrsIV5/668
	K9V/uKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaJ-00000005EAi-45Ov;
	Mon, 16 Jun 2025 18:29:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCpy-000000051Zk-3yKt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 16:37:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79D8C1424;
	Mon, 16 Jun 2025 09:37:10 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6007F3F673;
	Mon, 16 Jun 2025 09:37:29 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:37:19 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, catalin.marinas@arm.com,
	will@kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, maddy@linux.ibm.com, tglx@linutronix.de,
	bigeasy@linutronix.de, vschneid@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] sched: preempt: Move dynamic keys into kernel/sched
Message-ID: <aFBIPxOGbWfTCWLm@J2N7QTR9R3>
References: <20250610075344.1379597-1-sshegde@linux.ibm.com>
 <20250610075344.1379597-2-sshegde@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610075344.1379597-2-sshegde@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_093735_075847_F0F84FD2 
X-CRM114-Status: GOOD (  24.78  )
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

On Tue, Jun 10, 2025 at 01:23:44PM +0530, Shrikanth Hegde wrote:
> Dynamic preemption can be static key or static call based.
> Static key is used to check kernel preemption depending on
> the current preemption model. i.e enable for lazy, full. 
> 
> Code is spread currently across entry/common.c, arm64 and latest being
> powerpc. There is little arch specific to it. For example, arm64,
> powerpc does the same thing. It is better to move it into kernel/sched 
> since preemption is more closely associated with scheduler.  
> 
> Plus, Any new arch that wants dynamic preemption enabled need to have 
> only HAVE_PREEMPT_DYNAMIC_KEY. 
> 
> This is more of code movement. No functional change. 
> 
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

I've tested this on arm64 atop v6.16-rc2, building and booting defconfig
and defconfig + PREEMPT_DYNAMIC=y.

It builds cleanly, boots fine, and I think this is obviously correct
given it's just moving things around, so FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Catalin, Will, are you happy with this?

I assume this would go via the tip tree?

Mark.

> ---
>  arch/arm64/include/asm/preempt.h   |  1 -
>  arch/arm64/kernel/entry-common.c   |  8 --------
>  arch/powerpc/include/asm/preempt.h | 16 ----------------
>  arch/powerpc/kernel/interrupt.c    |  4 ----
>  include/linux/entry-common.h       |  1 -
>  include/linux/sched.h              |  8 ++++++++
>  kernel/entry/common.c              |  1 -
>  kernel/sched/core.c                |  4 ++++
>  8 files changed, 12 insertions(+), 31 deletions(-)
>  delete mode 100644 arch/powerpc/include/asm/preempt.h
> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index 0159b625cc7f..a9348e65d75e 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -87,7 +87,6 @@ void preempt_schedule_notrace(void);
>  
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  
> -DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>  void dynamic_preempt_schedule(void);
>  #define __preempt_schedule()		dynamic_preempt_schedule()
>  void dynamic_preempt_schedule_notrace(void);
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index b260ddc4d3e9..b1c854fb4884 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -259,14 +259,6 @@ static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs)
>  		lockdep_hardirqs_on(CALLER_ADDR0);
>  }
>  
> -#ifdef CONFIG_PREEMPT_DYNAMIC
> -DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#define need_irq_preemption() \
> -	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> -#else
> -#define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
> -#endif
> -
>  static void __sched arm64_preempt_schedule_irq(void)
>  {
>  	if (!need_irq_preemption())
> diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/include/asm/preempt.h
> deleted file mode 100644
> index 000e2b9681f3..000000000000
> --- a/arch/powerpc/include/asm/preempt.h
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __ASM_POWERPC_PREEMPT_H
> -#define __ASM_POWERPC_PREEMPT_H
> -
> -#include <asm-generic/preempt.h>
> -
> -#if defined(CONFIG_PREEMPT_DYNAMIC)
> -#include <linux/jump_label.h>
> -DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#define need_irq_preemption() \
> -	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> -#else
> -#define need_irq_preemption()   (IS_ENABLED(CONFIG_PREEMPTION))
> -#endif
> -
> -#endif /* __ASM_POWERPC_PREEMPT_H */
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index e0c681d0b076..4d62d785ad26 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -25,10 +25,6 @@
>  unsigned long global_dbcr0[NR_CPUS];
>  #endif
>  
> -#if defined(CONFIG_PREEMPT_DYNAMIC)
> -DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#endif
> -
>  #ifdef CONFIG_PPC_BOOK3S_64
>  DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
>  static inline bool exit_must_hard_disable(void)
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index f94f3fdf15fc..8624faa1f8b9 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -549,7 +549,6 @@ void raw_irqentry_exit_cond_resched(void);
>  DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
>  #define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
>  #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> -DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>  void dynamic_irqentry_exit_cond_resched(void);
>  #define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
>  #endif
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 45e5953b8f32..ebd230382027 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2115,6 +2115,14 @@ static inline int _cond_resched(void)
>  
>  #endif /* !CONFIG_PREEMPTION || CONFIG_PREEMPT_DYNAMIC */
>  
> +#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> +DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +#define need_irq_preemption() \
> +	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> +#else
> +#define need_irq_preemption()   (IS_ENABLED(CONFIG_PREEMPTION))
> +#endif
> +
>  #define cond_resched() ({			\
>  	__might_resched(__FILE__, __LINE__, 0);	\
>  	_cond_resched();			\
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index a8dd1f27417c..b8ffd7127338 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -268,7 +268,6 @@ void raw_irqentry_exit_cond_resched(void)
>  #if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
>  DEFINE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
>  #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> -DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>  void dynamic_irqentry_exit_cond_resched(void)
>  {
>  	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 62b3416f5e43..6af2bab187cb 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7083,6 +7083,10 @@ EXPORT_SYMBOL(dynamic_preempt_schedule_notrace);
>  
>  #endif /* CONFIG_PREEMPTION */
>  
> +#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +#endif
> +
>  /*
>   * This is the entry point to schedule() from kernel preemption
>   * off of IRQ context.
> -- 
> 2.43.0
> 

