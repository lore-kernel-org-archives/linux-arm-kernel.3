Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F34C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZochOqDxPCE1VMHIHByXhoLy0BAim+08jOm8eUkmsg=; b=PnPTnqoTeQ4EQ/
	V+K6MUQM8tsLFOdl6UujBcwAR3Ebh9Td44dR0QxN86kEDuAnkbSWIPU+JPcMnUjUiCYFTn3TqE5An
	euFlvvQFL7wrmQSdaysZ/Y8dycnswL0SZ+Skaw3LYw9RYF6RtMU8g35vWz+ujjo+e9uG2uyLQC9IA
	/2wpMuQwIIdFdKrhX0ZK545npGO8fmvimgU7qs2BeSyshfgzuIS8MsnFrZCA3caeqqtCgJk8KWeSX
	CGbdzG+0kDG4UVz4SptC4Ygr3p0irroDtTrBXIhkdNxKTVvdzY3AokLPL/KdZjoelQTMoc9iSLTE5
	A4nje5bYbCZ8aMn9mIrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyOw-0000000Ei1V-30eI;
	Wed, 15 Jul 2026 12:07:46 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyOs-0000000Ehzh-1SqY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:07:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OZochOqDxPCE1VMHIHByXhoLy0BAim+08jOm8eUkmsg=;
	b=Eh4fpSdLvB3A2DZxN/O37FvBgUdT0nMEfLnBG3n74ovBkrrvxju50APgwNFfPeqM/mLIctR5T
	4XwGwQITQ+nwLd4RJWbfa7+3GoXmbgCPOhlqZU108eXsCQVDCvI4X1nU5zZlHJhD2q92+SlWTXW
	lipUWkOQyQmTDDX7QRXsVKM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4h0ZSN5g9ZzcbNp;
	Wed, 15 Jul 2026 19:58:12 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F3F9D40537;
	Wed, 15 Jul 2026 20:07:28 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Jul 2026 20:07:28 +0800
Message-ID: <9fe11e2f-4f03-4d8b-ad9d-fea584431c9c@huawei.com>
Date: Wed, 15 Jul 2026 20:07:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 31/36] arm64: nmi: Add handling of superpriority
 interrupts as NMIs
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-32-vladimir.murzin@arm.com>
 <88a31062-f898-474f-b3a6-1a0b8586d5e3@huawei.com>
 <63cb9447-a219-4115-a6ed-c69aeaa45535@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <63cb9447-a219-4115-a6ed-c69aeaa45535@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050743_332941_158FAE39 
X-CRM114-Status: GOOD (  23.85  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/15/2026 12:24 AM, Vladimir Murzin wrote:
> On 7/10/26 11:13, Jinjie Ruan wrote:
>>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>>> index a13653b228b7..de71d5a3a6a1 100644
>>> --- a/arch/arm64/kernel/entry-common.c
>>> +++ b/arch/arm64/kernel/entry-common.c
>>> @@ -525,8 +525,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>>>  	arm64_debug_exc_context(CRITICAL_CONTEXT);
>>>  }
>>>  
>>> -static __always_inline void __el1_pnmi(struct pt_regs *regs,
>>> -				       void (*handler)(struct pt_regs *))
>>> +static __always_inline void __el1_nmi(struct pt_regs *regs,
>>> +				      void (*handler)(struct pt_regs *))
>>>  {
>>>  	arm64_exc_hwstate_t hwstate;
>>>  	irqentry_state_t state;
>>> @@ -545,7 +545,10 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>>>  
>>>  	state = arm64_enter_from_kernel_mode(regs);
>>>  
>>> -	arm64_unmask_exc_context(NONMI_CONTEXT);
>>> +	if (system_uses_nmi())
>>> +		arm64_unmask_exc_context(NOIRQ_CONTEXT);
>>> +	else
>>> +		arm64_unmask_exc_context(NONMI_CONTEXT);
>> This looks strange; whether it's a pseudo NMI or FEAT_NMI, the behavior
>> should be consistent.
> 
> Here is my understanding of how things behave.
> 
> No NMI support
> 
>   NONMI_CONTEXT and NOIRQ_CONTEXT are the same, so we cannot take any
>   IRQ while handling an IRQ. On return from the handler, we remain in
>   NOIRQ_CONTEXT. Easy.

Yes, you are completely right.

> 
> pNMI
> 
>   We cannot distinguish between an NMI and an IRQ on exception entry,

Yes, only after ack the interrupt can we determine whether the interrupt
priority is that of a pseudo-NMI interrupt.

>   so we have to postpone unmasking the IF bits until the interrupt
>   handler. In other words, we enter the interrupt handler in
>   NONMI_CONTEXT.

Yes, we set DAIF.IF to mask IRQ and pNMI at first.

>   
>   In the handler:
> 
>     1. For an NMI, we handle the NMI and then drop to NOIRQ_CONTEXT.

yes. I think what you said is the following code.

855 static void __gic_handle_irq_from_irqson(struct pt_regs *regs)
 856 {
 857 >-------bool is_nmi;
 858 >-------u32 irqnr;
 859
 860 >-------irqnr = gic_read_iar();
 861
 862 >-------is_nmi = gic_rpr_is_nmi_prio();
 863
 864 >-------if (is_nmi) {
 865 >------->-------nmi_enter();
 866 >------->-------__gic_handle_nmi(irqnr, regs);
 867 >------->-------nmi_exit();
 868 >-------}
 869
 870 >-------if (gic_prio_masking_enabled()) {
 871 >------->-------gic_pmr_mask_irqs();
 872 >------->-------gic_arch_enable_irqs();
 873 >-------}

We drop to NOIRQ_CONTEXT here by clear DAIF.IF and set pmr to IRQOFF.

 874
 875 >-------if (!is_nmi)
 876 >------->-------__gic_handle_irq(irqnr, regs);


> 
>     2. For an IRQ, we drop to NOIRQ_CONTEXT (allowing NMIs to preempt
>        the IRQ handler) and then handle the IRQ.

Yes, it corresponds to 874~876 line. We need to unmask the pseudo NMI
before handling the regular IRQ, but keep the IRQs masked to prevent
interrupt nesting.

> 
>   In both cases, we return from the handler in NOIRQ_CONTEXT.

Yes

> 
> FEAT_NMI
> 
>   We can distinguish between an NMI and an IRQ on exception
>   entry. Thus, for an IRQ, we can immediately drop to NOIRQ_CONTEXT
>   before passing control to the IRQ handler, allowing NMIs to preempt
>   the IRQ handler. This corresponds to case 2 of the pNMI flow above.
> 

I think this is not quite correct. When entering the __el1_irq()
function, if only system_uses_nmi() is true, it does not necessarily
mean it is NOIRQ_CONTEXT.

I believe the unmasking of allint, or NOIRQ_CONTEXT, should be delayed
until gic_handle_irq() actually before we processes the interrupt as
gic_unmask_pnmis() do it. At this point, it is still NONMI_CONTEXT to
keep  hardware NMI masked as isr_el1.IS is not set.


41 static __always_inline void __el1_irq(struct pt_regs *regs,
 542 >------->------->------->-------      void (*handler)(struct
pt_regs *))
 543 {
 544 >-------irqentry_state_t state;
 545
 546 >-------state = arm64_enter_from_kernel_mode(regs);
 547
 548 >-------if (system_uses_nmi())
 549 >------->-------arm64_unmask_exc_context(NOIRQ_CONTEXT);
 550 >-------else
 551 >------->-------arm64_unmask_exc_context(NONMI_CONTEXT);



568 static void noinstr el1_interrupt(struct pt_regs *regs,
 569 >------->------->------->-------  void (*handler)(struct pt_regs *))
 570 {
 571 >-------/* Is there a NMI to handle? */
 572 >-------if (regs_irqs_disabled(regs))
 573 >------->-------__el1_nmi(regs, handler);
 574 >-------else if (system_uses_nmi() && (read_sysreg(isr_el1) &
(ISR_EL1_IS | ISR_EL1_FS)))
 575 >------->-------__el1_nmi(regs, handler);
 576 >-------else
 577 >------->-------__el1_irq(regs, handler);


> 
> Perhaps above could be better expressed with:
> 
> if (gic_supports_pseudo_nmis())
> 	arm64_unmask_exc_context(NONMI_CONTEXT);
> else
> 	arm64_unmask_exc_context(NOIRQ_CONTEXT);
> 
> 
> Have I missed anything?
> 
> Cheers
> Vladimir
> 


