Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230AEC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 03:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzZAmQauUQhmWoPotPHLA8KOY64t+3H75IzozBpNWk0=; b=sWyjtdjKshRq5cieCfulfiBfGF
	p56JpOZZVrklAVyGuqJFHtN4Iz41Yb4ck2pR4mqJ5h1LJpjwtV8QiM8w4HcHnXF3TP8Qjc5rJuHDm
	TfPf5QrpZ0qHQoS+G5vuLQVjMeGybjieVg19KYVMFeHFDY5RTqqV1RR4IIDH0vQToOC/PihgzwpX2
	KPWtoxisUhsWTgoycL6OvBEmRXnNDjB8sKFyR/FrEyXi56uJGVLltn7aJKJHKpc3zDB/MfR/7imKQ
	LeqOQNod3oeTIQi32x670HVVMNbou6eQvhS8wJKGC54jaUQFQpHOmR4ylqtslZ/mNqGzj6dlH/xwU
	OhOJR60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYLB-00000004JrM-4BfI;
	Tue, 28 Jul 2026 03:18:50 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYL8-00000004JqD-29mt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 03:18:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DzZAmQauUQhmWoPotPHLA8KOY64t+3H75IzozBpNWk0=;
	b=38FuKOIOSthq4KpehIuA4dOUq9H3SGQYTGJWWLmLHaGztE7FFkb6tJ2Gl0EFYE+erNSi5vd9R
	vqKnty2f2/NXcIMXyzq4K4MXZBDUSNlicHPNLNWTJiomR1GnUwq6UtC8zk6F3v/KXtSx+Th8lRF
	aSoa2gGApflfWer56E9Lt5A=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4h8L5x10FvzmV8f;
	Tue, 28 Jul 2026 11:09:09 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8ABF4402AB;
	Tue, 28 Jul 2026 11:18:35 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 11:18:34 +0800
Message-ID: <7a54d1c8-bf0d-4940-8d3f-28c48fc5c18f@huawei.com>
Date: Tue, 28 Jul 2026 11:18:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 09/45] arm64: entry: Avoid unnecessary
 local_irq_disable() on kernel exit
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-10-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-10-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_201847_170121_35E7BEB1 
X-CRM114-Status: GOOD (  19.02  )
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



在 2026/7/28 0:34, Vladimir Murzin 写道:
> Currently, when exiting to kernel mode, we attempt involuntary
> preemption. The preemption logic expects IRQs to be disabled, which is
> why we call local_irq_disable() before attempting preemption.
> 
> However, depending on the context, local_irq_disable() may be
> unnecessary:
> 
> - __el1_irq(), the non-NMI EL1 IRQ path, already has IRQs disabled, so
>   local_irq_disable() is redundant.
> 
> - irqentry_exit_to_kernel_mode_preempt() immediately returns when
>   exiting from an NMI-like context, so calling local_irq_disable()
>   beforehand is unnecessary work.
> 
> Split arm64_exit_to_kernel_mode() into preempt, non-preempt, and
> dispatch parts so that we can avoid this extra work where it is not
> needed.

Make sense for me, in an NMI-like context,
irqentry_exit_to_kernel_mode_preempt() and local_irq_disable() are both
unnecessary.

> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/entry-common.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 2be42d7f4eaa..72c03ccea59f 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -52,16 +52,36 @@ static noinstr irqentry_state_t arm64_enter_from_kernel_mode(struct pt_regs *reg
>   * After this function returns it is not safe to call regular kernel code,
>   * instrumentable code, or any code which may trigger an exception.
>   */
> -static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
> -					      irqentry_state_t state)
> +static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
> +						irqentry_state_t state)
>  {
> -	local_irq_disable();
> -	irqentry_exit_to_kernel_mode_preempt(regs, state);
>  	local_daif_mask();
>  	mte_check_tfsr_exit();
>  	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
>  }
>  
> +/*
> + * We are returning from the context which allows involuntary kernel preemption

Should we add the irq disabled status for preemption?

We are returning from the context which allows involuntary kernel
preemption "with irq disabled" ?

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> + */
> +static void noinstr arm64_exit_to_kernel_mode_preempt(struct pt_regs *regs,
> +						      irqentry_state_t state)
> +{
> +	irqentry_exit_to_kernel_mode_preempt(regs, state);
> +	__arm64_exit_to_kernel_mode(regs, state);
> +}
> +
> +static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
> +					      irqentry_state_t state)
> +{
> +	if (!regs_irqs_disabled(regs)) {
> +		local_irq_disable();
> +		arm64_exit_to_kernel_mode_preempt(regs, state);
> +		return;
> +	}
> +
> +	__arm64_exit_to_kernel_mode(regs, state);
> +}
> +
>  static __always_inline void arm64_syscall_enter_from_user_mode(struct pt_regs *regs)
>  {
>  	enter_from_user_mode(regs);
> @@ -510,7 +530,7 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>  	do_interrupt_handler(regs, handler);
>  	irq_exit_rcu();
>  
> -	arm64_exit_to_kernel_mode(regs, state);
> +	arm64_exit_to_kernel_mode_preempt(regs, state);
>  }
>  static void noinstr el1_interrupt(struct pt_regs *regs,
>  				  void (*handler)(struct pt_regs *))


