Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5713FC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdcuE+XVAQi0cf93QeLg5wMVqVBGS6qDBW6BTiGSU3E=; b=PRVYG6uMWKsJGqCrWq6/o7Eqww
	X7PNq7dEG/utMLAJn1mEyNJvJpKUshAMpjV3JcZNUCe1OsdMRnDBS4YOA8BqodIpEEcd0x20TqWTw
	ELgbNLreuTABz40QXG6/Z8hsdIe/wgIslUyWnNVGstnF0QoKSfZE5VrZW2gcIYR5KjrtilRMOVmgJ
	znOVFFOfSIwNx4hrs/CZorBpC3hh0B77EP6KGfkER0Z5BFxnkSgNwyW/FcsX931nQkh9tJUVX3Rip
	j1Slw0l2B+NTA9l2mHvqGrWnnsaHTgIXLOQylI6dFBflfmPskj22vt8IHKHCrd2NhCvUwNZDedJh+
	UtwRTNqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSjF-0000000HMsk-2TAm;
	Mon, 10 Feb 2025 12:17:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSHh-0000000HInZ-2qCw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:49:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D1B41424;
	Mon, 10 Feb 2025 03:49:22 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C4A63F5A1;
	Mon, 10 Feb 2025 03:48:53 -0800 (PST)
Date: Mon, 10 Feb 2025 11:48:51 +0000
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
Subject: Re: [PATCH -next v5 06/22] arm64: entry: Expand the
 need_irq_preemption() macro ahead
Message-ID: <Z6nno7db_6iOYkT2@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-7-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-7-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_034905_801128_B7A2FD36 
X-CRM114-Status: GOOD (  24.63  )
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

On Fri, Dec 06, 2024 at 06:17:28PM +0800, Jinjie Ruan wrote:
> The generic entry has the same logic as need_irq_preemption()
> macro and use a helper function to check other resched condition.
> 
> In preparation for moving arm64 over to the generic entry code,
> check and expand need_irq_preemption() ahead and extract arm64 resched
> check code to a helper function.

I think this is just saying that the goal is to align the structure of
the code with raw_irqentry_exit_cond_resched() from the generic entry
code.

It'd be a bit clearer to say that, and to do this *before* moving the
call into __exit_to_kernel_mode().

Mark.

> 
> No functional changes.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/preempt.h |  1 +
>  arch/arm64/kernel/entry-common.c | 28 +++++++++++++++++-----------
>  2 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index 0159b625cc7f..d0f93385bd85 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -85,6 +85,7 @@ static inline bool should_resched(int preempt_offset)
>  void preempt_schedule(void);
>  void preempt_schedule_notrace(void);
>  
> +void raw_irqentry_exit_cond_resched(void);
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  
>  DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index efd1a990d138..80b47ca02db2 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -77,17 +77,10 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
>  
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#define need_irq_preemption() \
> -	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> -#else
> -#define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
>  #endif
>  
>  static inline bool arm64_need_resched(void)
>  {
> -	if (!need_irq_preemption())
> -		return false;
> -
>  	/*
>  	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
>  	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> @@ -111,6 +104,22 @@ static inline bool arm64_need_resched(void)
>  	return true;
>  }
>  
> +void raw_irqentry_exit_cond_resched(void)
> +{
> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> +		return;
> +#else
> +	if (!IS_ENABLED(CONFIG_PREEMPTION))
> +		return;
> +#endif
> +
> +	if (!preempt_count()) {
> +		if (need_resched() && arm64_need_resched())
> +			preempt_schedule_irq();
> +	}
> +}
> +
>  /*
>   * Handle IRQ/context state management when exiting to kernel mode.
>   * After this function returns it is not safe to call regular kernel code,
> @@ -133,10 +142,7 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> -		if (!preempt_count() && need_resched()) {
> -			if (arm64_need_resched())
> -				preempt_schedule_irq();
> -		}
> +		raw_irqentry_exit_cond_resched();
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 

