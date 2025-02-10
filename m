Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A2BC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9H1rC9k4lkppNYazNCN879GU1pPKlH/YsZFjfac2do=; b=szLaCZq3inzq3VvGyQfD0tgjma
	00IOA+MH0gPvOxpidk4J24lPdSq3Pm0Po6K+bhY9z0FVU0o5JIud1cRGML2+v1lkIJnjDYfeb6ltn
	K4Q1ux7wVEbz7CY6ro4+7BtOhxz7uBRwuIl1Pb8l1Sokr4ykh8F4QfPpY1aKEPMSDZhE01f96js+Y
	5jI4QEnrgYibbD8NubKADEyIPbNI9JYbwUY2zp8eZ6ojX0JnCGMnfimpiYxToIDfWViMoNtNWhxni
	dtcVrXXOsTI29Wy2mfZfsw8Vzp6ntMa2EO9Q2z5J8e1ejXsO00KQ0I6vYK9nnqpVFzFQlIgnFhFGq
	dVYeXJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSJy-0000000HJKZ-2aWT;
	Mon, 10 Feb 2025 11:51:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thS98-0000000HGZp-3eVt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:40:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5354F1424;
	Mon, 10 Feb 2025 03:40:34 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2C3A3F5A1;
	Mon, 10 Feb 2025 03:40:05 -0800 (PST)
Date: Mon, 10 Feb 2025 11:40:03 +0000
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
Subject: Re: [PATCH -next v5 05/22] arm64: entry: Use preempt_count() and
 need_resched() helper
Message-ID: <Z6nlkyxAZEtY_M7T@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-6-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-6-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_034015_002453_DA8A8E28 
X-CRM114-Status: GOOD (  22.37  )
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

On Fri, Dec 06, 2024 at 06:17:27PM +0800, Jinjie Ruan wrote:
> The generic entry code uses preempt_count() and need_resched() helpers to
> check if it is time to resched. Currently, arm64 use its own check logic,
> that is "READ_ONCE(current_thread_info()->preempt_count == 0", which is
> equivalent to "preempt_count() == 0 && need_resched()".

Hmm. The existing code relies upon preempt_fold_need_resched() to work
correctly. If we want to move from:

	READ_ONCE(current_thread_info()->preempt_count) == 0

... to:

	!preempt_count() && need_resched()

... then that change should be made *before* we change the preemption
logic to preempt non-IRQ exceptions in patch 3. Otherwise, that logic is
consuming stale data most of the time.

Mark.

> In preparation for moving arm64 over to the generic entry code, use
> these helpers to replace arm64's own code and move it ahead.
> 
> No functional changes.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/entry-common.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index da68c089b74b..efd1a990d138 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -88,14 +88,6 @@ static inline bool arm64_need_resched(void)
>  	if (!need_irq_preemption())
>  		return false;
>  
> -	/*
> -	 * Note: thread_info::preempt_count includes both thread_info::count
> -	 * and thread_info::need_resched, and is not equivalent to
> -	 * preempt_count().
> -	 */
> -	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
> -		return false;
> -
>  	/*
>  	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
>  	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> @@ -141,8 +133,10 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> -		if (arm64_need_resched())
> -			preempt_schedule_irq();
> +		if (!preempt_count() && need_resched()) {
> +			if (arm64_need_resched())
> +				preempt_schedule_irq();
> +		}
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 

