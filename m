Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAF5105D990
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 01:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GEglMkKhZweGo4hVWdrwix8nzNduA14svrqJEyby74=; b=AedT8IrQkExiji
	3K0IOptGyX9fivry7vFhtd3jd+RCYJd4Mb58Bs8ZKOUEbAJz712F7s3RA/QWvYsQ838ohV9ML/roX
	+lB8LLOpyanBVLY3NRhnQA/2uB5a4CzCoE17hBHNCKwOxgY0y8ylLVqjoJUL6DKi9ZH9d53yYQHEH
	KP8CiI4Qhkt3X/gDkn2t92uGJePuLBoNQ1xKIBUiG/8BFl2wLRzyd07bsNNOjCjYzegcHLgEr4xnM
	6LVVaud+VL8raFb+3MYk5OaYzmaSpi9ZOx6zp23j95Wte/4b9QPzJOL/4H176N6gdOJW0CnK6x/5v
	/MRAMmvEu17HDcDLVaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI0n-000000086An-0eLA;
	Wed, 08 Apr 2026 01:47:21 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI0j-0000000869z-3j2S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 01:47:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+GEglMkKhZweGo4hVWdrwix8nzNduA14svrqJEyby74=;
	b=Q+UH9CmCywD18V8a2hz6yVw6T6oDFVuU9etvm6icu+/ZT+FdCNlOVGnmqGSKFzGqdf/FIpBKN
	VviI1en9jJYylAa7KTNYNW0dvgn3balkYSO4/Ww/iK71KgpZYHUoaywjhwbFoWFrqrHO+sJam+d
	0cGrmivMZd50G+NMFLyzn2w=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fr5PK5Ncvz1prLF;
	Wed,  8 Apr 2026 09:40:53 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 717D04056D;
	Wed,  8 Apr 2026 09:47:10 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Apr 2026 09:47:09 +0800
Message-ID: <2de9825f-abe8-2da6-556f-2ca740f2e732@huawei.com>
Date: Wed, 8 Apr 2026 09:47:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 06/10] arm64: entry: Don't preempt with SError or Debug
 masked
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <20260407131650.3813777-7-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260407131650.3813777-7-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_184718_251547_BC45771E 
X-CRM114-Status: GOOD (  24.22  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/4/7 21:16, Mark Rutland wrote:
> On arm64, involuntary kernel preemption has been subtly broken since the
> move to the generic irqentry code. When preemption occurs, the new task
> may run with SError and Debug exceptions masked unexpectedly, leading to
> a loss of RAS events, breakpoints, watchpoints, and single-step
> exceptions.
> 
> Prior to moving to the generic irqentry code, involuntary preemption of
> kernel mode would only occur when returning from regular interrupts, in
> a state where interrupts were masked and all other arm64-specific
> exceptions (SError, Debug, and pseudo-NMI) were unmasked. This is the
> only state in which it is valid to switch tasks.
> 
> As part of moving to the generic irqentry code, the involuntary
> preemption logic was moved such that involuntary preemption could occur
> when returning from any (non-NMI) exception. As most exception handlers
> mask all arm64-specific exceptions before this point, preemption could
> occur in a state where arm64-specific exceptions were masked. This is
> not a valid state to switch tasks, and resulted in the loss of
> exceptions described above.
> 
> As a temporary bodge, avoid the loss of exceptions by avoiding
> involuntary preemption when SError and/or Debug exceptions are masked.
> Practically speaking this means that involuntary preemption will only
> occur when returning from regular interrupts, as was the case before
> moving to the generic irqentry code.
> 
> Fixes: 99eb057ccd67 ("arm64: entry: Move arm64_preempt_schedule_irq() into __exit_to_kernel_mode()")
> Reported-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Reported-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/entry-common.h | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
> index cab8cd78f6938..20f0a7c7bde15 100644
> --- a/arch/arm64/include/asm/entry-common.h
> +++ b/arch/arm64/include/asm/entry-common.h
> @@ -29,14 +29,19 @@ static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
>  
>  static inline bool arch_irqentry_exit_need_resched(void)
>  {
> -	/*
> -	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
> -	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> -	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
> -	 * DAIF we must have handled an NMI, so skip preemption.
> -	 */
> -	if (system_uses_irq_prio_masking() && read_sysreg(daif))
> -		return false;
> +	if (system_uses_irq_prio_masking()) {
> +		/*
> +		 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
> +		 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> +		 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
> +		 * DAIF we must have handled an NMI, so skip preemption.
> +		 */
> +		if (read_sysreg(daif))
> +			return false;
> +	} else {
> +		if (read_sysreg(daif) & (PSR_D_BIT | PSR_A_BIT))
> +			return false;

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +	}
>  
>  	/*
>  	 * Preempting a task from an IRQ means we leave copies of PSTATE

