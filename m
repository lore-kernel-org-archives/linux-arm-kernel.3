Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB9BC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+sf+p3WhWnqM+wowbpZwkUZExGfKoZLqOMvtUH8jQk=; b=Ez9KVJgBahx687hWzmZA0DQxex
	ZLixGPBEuYadpiPOvS1EHaNTvkbPdWVu7+VfdRg/AEnqGKJ90Rnu5dwyJRHobI9aBZRozoD6C/Tmq
	QEARWO4lpV9qVV8G9hQIQUYuLENQaR6rwf28aKwP/XvljDHKDrzl2/0WFA3raWRqAUWJw9x2QdD3R
	bdoXnjkQKZuB/BrEIkbuznWFC444LnymLnnBTnv2oygz8GQL7vE8WP2ZjPo9QCh6pTbhSuRcSTPLi
	zckxitqCEgTt4Ls62+fiiB81MBIZZB2U6cy6UTmTyvAUFyC6HYLSONEO8jEr5Wqw4sFlUfkG6WEdx
	vPougF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXoj-000000015gh-1zKO;
	Thu, 13 Aug 2026 15:58:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXoh-000000015gT-2yLm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:58:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2C6D60A69;
	Thu, 13 Aug 2026 15:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4221F000E9;
	Thu, 13 Aug 2026 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786636682;
	bh=X+sf+p3WhWnqM+wowbpZwkUZExGfKoZLqOMvtUH8jQk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Hp9DucV7OGLG9m/FudPQWPZAS8FQEfKoOcVhBywLxXt2TMkJ8qskyGU0U2f8bvJo5
	 8vcoabbgKXod/KTWP4b7H4Uh3W5COSWeAZAeOapWrAuHt+vCoeSGvyOeSk/2hhxk68
	 Dcb7j/eDAnqPvku+ZYZ5J8Gvlcyq2AJ3WRbq7tEBzxs6A6y9f2WtC2muZVhgE7o84p
	 QU12XP4scz6PGeizQzxMiTy4MjJRZ1cfzWw7zdcPhWpcnwsxpLtuVGfPtQBD/3Nmv1
	 yRsPbJlObOy2CcU3gUlXPljOfebCE5EuZ9ZiJzik/MNnNbKZL8OkVXvde/AUfIrCBU
	 Z3f+INhJswJIA==
Date: Fri, 14 Aug 2026 00:57:58 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Jiazi Li
 <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH v2 1/4] arm64/entry: Make
 debug_exception_enter/exit() noinstr
Message-Id: <20260814005758.c8cc04d276a0f82689ccddca@kernel.org>
In-Reply-To: <c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com>
References: <cover.1786603168.git.hongyan.xia@transsion.com>
	<c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com>
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

On Thu, 13 Aug 2026 06:49:27 +0000
Hongyan Xia <hongyan.xia@transsion.com> wrote:

> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> Commit 879a6754d3d11e30af24b7dc486f561510d62641 ran into a crash because
> debug_exception_enter/exit() triggered page faults caused by perf dwarf
> call graph tracing. That patch was a band-aid on top.
> 
> Instead of trying to band-aid all possible paths that can happen during
> instrumentation or perf tracing, simply force-inline these functions and
> use the notrace variant of preempt handling to avoid all the complexity.
> 
> Drop the RCU_LOCKDEP_WARN(): arm64_enter_el1_dbg() runs first and
> enters NMI context via ct_nmi_enter(), so RCU is always watching by the
> time debug_exception_enter() runs.
> 
> Also mark __preempt_count_add/sub() __always_inline so the preempt
> count updates fold into the noinstr callers instead of becoming
> outlined calls to instrumentable text.

Looks good to me as a kprobe maintainer.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

> 
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/include/asm/preempt.h |  4 ++--
>  arch/arm64/kernel/entry-common.c | 13 ++++---------
>  2 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index 932ea4b62042..326f221c3f56 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -41,14 +41,14 @@ static inline bool test_preempt_need_resched(void)
>  	return !current_thread_info()->preempt.need_resched;
>  }
>  
> -static inline void __preempt_count_add(int val)
> +static __always_inline void __preempt_count_add(int val)
>  {
>  	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
>  	pc += val;
>  	WRITE_ONCE(current_thread_info()->preempt.count, pc);
>  }
>  
> -static inline void __preempt_count_sub(int val)
> +static __always_inline void __preempt_count_sub(int val)
>  {
>  	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
>  	pc -= val;
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index ceb4eb11232a..d5c1d6defe29 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -292,20 +292,15 @@ static __always_inline void fpsimd_syscall_exit(void)
>   * accidentally schedule in exception context and it will force a warning
>   * if we somehow manage to schedule by accident.
>   */
> -static void debug_exception_enter(struct pt_regs *regs)
> +static __always_inline void debug_exception_enter(struct pt_regs *regs)
>  {
> -	preempt_disable();
> -
> -	/* This code is a bit fragile.  Test it. */
> -	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
> +	preempt_disable_notrace();
>  }
> -NOKPROBE_SYMBOL(debug_exception_enter);
>  
> -static void debug_exception_exit(struct pt_regs *regs)
> +static __always_inline void debug_exception_exit(struct pt_regs *regs)
>  {
> -	preempt_enable_no_resched();
> +	preempt_enable_no_resched_notrace();
>  }
> -NOKPROBE_SYMBOL(debug_exception_exit);
>  
>  UNHANDLED(el1t, 64, sync)
>  UNHANDLED(el1t, 64, irq)
> -- 
> 2.47.3
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

