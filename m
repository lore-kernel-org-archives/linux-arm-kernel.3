Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E19EDB7D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 01:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDrgltfSK6mSCyyVg4mYTUVCd6VbQDkka8UiJiTC4TU=; b=0RhtM76/06u12+
	QBhjpGwF+QVH7vIJjmxNnnd6osffodz6rFj3UYQrow2tZqVgdvDr8TknI4388ZVfkpRp9ewf7L799
	al4DYPrAA20zHNujeaxOcF7z3XBoFS1ZmKyy0eV1oRNt3BLfmCwMxi3OGbLGVJqLjxDMeS0TXX6a1
	ngNgNvuaR8AA/E7r2q86tMi7fSdiMZCbjdtQf6r/GVeKzK7ZYqUpRDDSFaoadCJi8JHX35xWElJYS
	z/6cQB8xHk8zf0YUtpQLN+5hmHgD0yUIPI7qC0WGI5SSNy76n8P2VWvzxsUT9GPia/FaWJeKujjIM
	8LSH10AqyUdXwK1pFHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAHuV-000000085vi-0npd;
	Wed, 08 Apr 2026 01:40:51 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAHuR-000000085vJ-3rjd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 01:40:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aDrgltfSK6mSCyyVg4mYTUVCd6VbQDkka8UiJiTC4TU=;
	b=5pZBsSTZ85GTD8pSLxVdtCz2C6SY2LU8nF0stKwKaoUT0wbxzEVk/OlTQH3CpACV8rieJeyiP
	RdS3EQM2NWPfJsdepU2Y/l8MrrPH3dEC0lVu8wtAX0Dw8T2QBmqPSfeZuKiD+wKx1ruMFIySP6O
	yGW1kTkmQKI+ujnjve/KRR8=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fr5G806RfzpTBG;
	Wed,  8 Apr 2026 09:34:40 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A34AB4048F;
	Wed,  8 Apr 2026 09:40:39 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Apr 2026 09:40:38 +0800
Message-ID: <66eb3cfc-fdb9-def0-00be-3c1dd3c2884d@huawei.com>
Date: Wed, 8 Apr 2026 09:40:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 05/10] entry: Split preemption from
 irqentry_exit_to_kernel_mode()
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <20260407131650.3813777-6-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260407131650.3813777-6-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_184048_608524_A5A492F3 
X-CRM114-Status: GOOD (  29.83  )
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
Cc: vladimir.murzin@arm.com, will@kernel.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/4/7 21:16, Mark Rutland wrote:
> Some architecture-specific work needs to be performed between the state
> management for exception entry/exit and the "real" work to handle the
> exception. For example, arm64 needs to manipulate a number of exception
> masking bits, with different exceptions requiring different masking.
> 
> Generally this can all be hidden in the architecture code, but for arm64
> the current structure of irqentry_exit_to_kernel_mode() makes this
> particularly difficult to handle in a way that is correct, maintainable,
> and efficient.
> 
> The gory details are described in the thread surrounding:
> 
>   https://lore.kernel.org/lkml/acPAzdtjK5w-rNqC@J2N7QTR9R3/
> 
> The summary is:
> 
> * Currently, irqentry_exit_to_kernel_mode() handles both involuntary
>   preemption AND state management necessary for exception return.
> 
> * When scheduling (including involuntary preemption), arm64 needs to
>   have all arm64-specific exceptions unmasked, though regular interrupts
>   must be masked.
> 
> * Prior to the state management for exception return, arm64 needs to
>   mask a number of arm64-specific exceptions, and perform some work with
>   these exceptions masked (with RCU watching, etc).
> 
> While in theory it is possible to handle this with a new arch_*() hook
> called somewhere under irqentry_exit_to_kernel_mode(), this is fragile
> and complicated, and doesn't match the flow used for exception return to
> user mode, which has a separate 'prepare' step (where preemption can
> occur) prior to the state management.
> 
> To solve this, refactor irqentry_exit_to_kernel_mode() to match the
> style of {irqentry,syscall}_exit_to_user_mode(), moving preemption logic
> into a new irqentry_exit_to_kernel_mode_preempt() function, and moving
> state management in a new irqentry_exit_to_kernel_mode_after_preempt()
> function. The existing irqentry_exit_to_kernel_mode() is left as a
> caller of both of these, avoiding the need to modify existing callers.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  include/linux/irq-entry-common.h | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> Thomas/Peter/Andy, as mentioned on IRC, I haven't created kerneldoc
> comments for these new functions because the existing comments don't
> seem all that consistent (e.g. for user mode vs kernel mode), and I
> suspect we want to rewrite them all in one go for wider consistency.
> 
> I'm happy to respin this, or to follow-up with that as per your
> preference.
> 
> Mark.
> 
> diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
> index 2206150e526d8..24830baa539c6 100644
> --- a/include/linux/irq-entry-common.h
> +++ b/include/linux/irq-entry-common.h
> @@ -421,10 +421,18 @@ static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct p
>  	return ret;
>  }
>  
> -static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, irqentry_state_t state)
> +static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs, irqentry_state_t state)
>  {
> -	lockdep_assert_irqs_disabled();
> +	if (regs_irqs_disabled(regs) || state.exit_rcu)
> +		return;
> +
> +	if (IS_ENABLED(CONFIG_PREEMPTION))
> +		irqentry_exit_cond_resched();
> +}
>  
> +static __always_inline void
> +irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_t state)
> +{
>  	if (!regs_irqs_disabled(regs)) {
>  		/*
>  		 * If RCU was not watching on entry this needs to be done
> @@ -443,9 +451,6 @@ static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, i
>  		}
>  
>  		instrumentation_begin();
> -		if (IS_ENABLED(CONFIG_PREEMPTION))
> -			irqentry_exit_cond_resched();
> -
>  		/* Covers both tracing and lockdep */
>  		trace_hardirqs_on();
>  		instrumentation_end();
> @@ -459,6 +464,17 @@ static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, i
>  	}
>  }
>  
> +static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, irqentry_state_t state)
> +{
> +	lockdep_assert_irqs_disabled();
> +
> +	instrumentation_begin();
> +	irqentry_exit_to_kernel_mode_preempt(regs, state);
> +	instrumentation_end();
> +
> +	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
> +}

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +
>  /**
>   * irqentry_enter - Handle state tracking on ordinary interrupt entries
>   * @regs:	Pointer to pt_regs of interrupted context

