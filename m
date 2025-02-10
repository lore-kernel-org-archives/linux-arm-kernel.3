Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A59C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZR/U7aoKXyMToJmd6a+gi9jp0U5/yih3/l97CmMQipU=; b=TwfDdM6PnJo3ruJIlnRwogbBTx
	XPD1zo1dfioW1hyDMyJS0dK97sBVabWBOKGaDZzRVH9hUUHfmUSnqSvdKbYHjdpYSqOMSIccON2D0
	yfq/XhoVUqy+OKknEoOiPqyeuzNdWaexpuBk25n2SwVz0dJoqk5MNkPgQwKqunigGpD7tPcnwop/0
	R4kcHZ0OnmgYaWaFvl2VGf9+kFC5NKGkISXfMk/Y8FNCMqU6XzFLMnJARVc+dFIuO05yv8Z7kPkUp
	nCK8r/rKfqlkFn36RgVqGyitSGTQdx1QFdqFNWxGg0zZ4RPCYMAOXr59jERJSnHTPSK+opwJlo0Su
	JLXP2toQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSEL-0000000HHcb-02Ft;
	Mon, 10 Feb 2025 11:45:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thS2T-0000000HEUh-0CPZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:33:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95BD41007;
	Mon, 10 Feb 2025 03:33:38 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DC243F5A1;
	Mon, 10 Feb 2025 03:33:09 -0800 (PST)
Date: Mon, 10 Feb 2025 11:33:07 +0000
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
Subject: Re: [PATCH -next v5 04/22] arm64: entry: Rework
 arm64_preempt_schedule_irq()
Message-ID: <Z6nj81GG_dLOzozI@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-5-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-5-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_033321_177062_2F48327F 
X-CRM114-Status: GOOD (  23.27  )
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

On Fri, Dec 06, 2024 at 06:17:26PM +0800, Jinjie Ruan wrote:
> The generic entry do preempt_schedule_irq() by checking if need_resched()
> satisfied, but arm64 has some of its own additional checks such as
> GIC priority masking.
> 
> In preparation for moving arm64 over to the generic entry code, rework
> arm64_preempt_schedule_irq() to check whether it need resched in a check
> function called arm64_need_resched().

I think what this is saying is that the generic entry code has the form:

| raw_irqentry_exit_cond_resched()
| {
| 	if (!preempt_count()) {
| 		...
| 		if (need_resched())
| 			preempt_schedule_irq();
| 	}
| }

... but it's not obvious why it's better to have and
arm64_need_resched() rather than a arm64_preempt_schedule_irq().

Having some idea of the change you intend to make to the generic code
would be helpful, and/or that generic change should be made earlier as a
preparatory patch.

Mark.

> No functional changes.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/entry-common.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 7a588515ee07..da68c089b74b 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -83,10 +83,10 @@ DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>  #define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
>  #endif
>  
> -static void __sched arm64_preempt_schedule_irq(void)
> +static inline bool arm64_need_resched(void)
>  {
>  	if (!need_irq_preemption())
> -		return;
> +		return false;
>  
>  	/*
>  	 * Note: thread_info::preempt_count includes both thread_info::count
> @@ -94,7 +94,7 @@ static void __sched arm64_preempt_schedule_irq(void)
>  	 * preempt_count().
>  	 */
>  	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
> -		return;
> +		return false;
>  
>  	/*
>  	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
> @@ -103,7 +103,7 @@ static void __sched arm64_preempt_schedule_irq(void)
>  	 * DAIF we must have handled an NMI, so skip preemption.
>  	 */
>  	if (system_uses_irq_prio_masking() && read_sysreg(daif))
> -		return;
> +		return false;
>  
>  	/*
>  	 * Preempting a task from an IRQ means we leave copies of PSTATE
> @@ -113,8 +113,10 @@ static void __sched arm64_preempt_schedule_irq(void)
>  	 * Only allow a task to be preempted once cpufeatures have been
>  	 * enabled.
>  	 */
> -	if (system_capabilities_finalized())
> -		preempt_schedule_irq();
> +	if (!system_capabilities_finalized())
> +		return false;
> +
> +	return true;
>  }
>  
>  /*
> @@ -139,7 +141,8 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> -		arm64_preempt_schedule_irq();
> +		if (arm64_need_resched())
> +			preempt_schedule_irq();
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 

