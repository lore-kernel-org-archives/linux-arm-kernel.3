Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FB4C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXySvVPD8n9L3wHgfAk3CsgqrZiSI4gc2+mRC1vWaSk=; b=Lpk4n4JfniBwqst3RAOwn2eBQe
	P7KSEAlva8KxJY7yf/GZnw36N46clk5uKVb0iNnSUK27wvmdaz4QcWF9Y3Wq7iGqF/+ZeL5FvxJPL
	JEkkgayR7QO7eYiemd996xRY88eTDgBWeerkZpUjUZ9RcjlZ2YxChaF6zAAmKNSkDhj+jEhkyjfDR
	WbfxiNJx1yOoqE3VWms9x1dD+S4+poH6zOgJoDnVGGB1eVGX8IdPQUXh41I9Q1CxrXl1Xycg5siM1
	c072ENk0b5srkJUTyVUPyBx9JUPHf0yj+4ypCwzneiD7VdvgEhVOeFcJv6ckHneFVCbIS5v2WPKsf
	QDjJgJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSjH-0000000HMuH-2Fv0;
	Mon, 10 Feb 2025 12:17:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSNA-0000000HJsx-1QWI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:54:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 102F0113E;
	Mon, 10 Feb 2025 03:55:00 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 921673F5A1;
	Mon, 10 Feb 2025 03:54:31 -0800 (PST)
Date: Mon, 10 Feb 2025 11:54:29 +0000
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
Subject: Re: [PATCH -next v5 08/22] arm64: entry: Use different helpers to
 check resched for PREEMPT_DYNAMIC
Message-ID: <Z6no9e7nBORuEWIK@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-9-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-9-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_035444_501153_48037CA4 
X-CRM114-Status: GOOD (  23.72  )
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

On Fri, Dec 06, 2024 at 06:17:30PM +0800, Jinjie Ruan wrote:
> In generic entry, when PREEMPT_DYNAMIC is enabled or disabled, two
> different helpers are used to check whether resched is required
> and some common code is reused.
> 
> In preparation for moving arm64 over to the generic entry code,
> use new helper to check resched when PREEMPT_DYNAMIC enabled and
> reuse common code for the disabled case.
> 
> No functional changes.

Please fold this together with the last two patches; it's undoing
changes you made in patch 6, and it'd be far clearer to see that all at
once.

Mark.

> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/preempt.h |  3 +++
>  arch/arm64/kernel/entry-common.c | 21 +++++++++++----------
>  2 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index d0f93385bd85..0f0ba250efe8 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -93,11 +93,14 @@ void dynamic_preempt_schedule(void);
>  #define __preempt_schedule()		dynamic_preempt_schedule()
>  void dynamic_preempt_schedule_notrace(void);
>  #define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
> +void dynamic_irqentry_exit_cond_resched(void);
> +#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
>  
>  #else /* CONFIG_PREEMPT_DYNAMIC */
>  
>  #define __preempt_schedule()		preempt_schedule()
>  #define __preempt_schedule_notrace()	preempt_schedule_notrace()
> +#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
>  
>  #endif /* CONFIG_PREEMPT_DYNAMIC */
>  #endif /* CONFIG_PREEMPTION */
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 029f8bd72f8a..015a65d19b52 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -75,10 +75,6 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
>  	return state;
>  }
>  
> -#ifdef CONFIG_PREEMPT_DYNAMIC
> -DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#endif
> -
>  static inline bool arm64_need_resched(void)
>  {
>  	/*
> @@ -106,17 +102,22 @@ static inline bool arm64_need_resched(void)
>  
>  void raw_irqentry_exit_cond_resched(void)
>  {
> -#ifdef CONFIG_PREEMPT_DYNAMIC
> -	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> -		return;
> -#endif
> -
>  	if (!preempt_count()) {
>  		if (need_resched() && arm64_need_resched())
>  			preempt_schedule_irq();
>  	}
>  }
>  
> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +void dynamic_irqentry_exit_cond_resched(void)
> +{
> +	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> +		return;
> +	raw_irqentry_exit_cond_resched();
> +}
> +#endif
> +
>  /*
>   * Handle IRQ/context state management when exiting to kernel mode.
>   * After this function returns it is not safe to call regular kernel code,
> @@ -140,7 +141,7 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  		}
>  
>  		if (IS_ENABLED(CONFIG_PREEMPTION))
> -			raw_irqentry_exit_cond_resched();
> +			irqentry_exit_cond_resched();
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 

