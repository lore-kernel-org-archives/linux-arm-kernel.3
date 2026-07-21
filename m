Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2377CC44520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 02:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avi7rPg8bCQn8Ug8NMr8tQMICmV6Aol7XJI/f/oLqqE=; b=aKe1YSodABppf5
	e5BltIw2UUskf94U8uXvZrfvYtDoMO0aBkTI7a4ReJt515Vlz1a5/s73KSZ1ykDFx71zkMDO9mMdB
	niUisfNI6wSy0gZzvZmBiQD+ygRfx/67GR7x/qQCCxXTfzg86kh97UJ2vzTHgemNW6JebYpp7nOjK
	W60s0FjNk30Bcxt1w4LlHP+Cqn7QCfwP1jDvr6puKZupfKLZ/bQ8p0kuC4/cJcy5h3ZXplitLaocE
	uTS1IX0iHKiM1u7y1OKpoEipPhj4eNtdcm+bwfJyBkN2mlzi+Y2T6PAygWDYmTh/un+a4swXFLPz7
	niz1Mm+ZfeF/goWm4N6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0Id-00000008GRS-1LZo;
	Tue, 21 Jul 2026 02:33:39 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0Ia-00000008GQh-0K6a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 02:33:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=avi7rPg8bCQn8Ug8NMr8tQMICmV6Aol7XJI/f/oLqqE=;
	b=lhRAGvtQyuLX79erXpOSfVBeNt+QL3z1ydxAnEni7mDZjc99k++bW8kdjUafICxaaQlMzdvtk
	JaIzW39kDOtPPYUKafaazYveXmP9NPjfBgUPoUFWOR36XZLLXfDLYmOpX9e9+Mq71zH7P2fjtkq
	THMGrk1hfNnOeohSOCuYkEM=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h41R76GX5z1T4GB;
	Tue, 21 Jul 2026 10:24:03 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A18FE4058C;
	Tue, 21 Jul 2026 10:33:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jul 2026 10:33:21 +0800
Message-ID: <92b8c916-e5f3-4348-ae0c-dda5cb776f6e@huawei.com>
Date: Tue, 21 Jul 2026 10:33:20 +0800
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_193336_805250_AB3F4D7B 
X-CRM114-Status: GOOD (  20.09  )
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
> 
> pNMI
> 
>   We cannot distinguish between an NMI and an IRQ on exception entry,
>   so we have to postpone unmasking the IF bits until the interrupt
>   handler. In other words, we enter the interrupt handler in
>   NONMI_CONTEXT.
>   
>   In the handler:
> 
>     1. For an NMI, we handle the NMI and then drop to NOIRQ_CONTEXT.
> 
>     2. For an IRQ, we drop to NOIRQ_CONTEXT (allowing NMIs to preempt
>        the IRQ handler) and then handle the IRQ.
> 
>   In both cases, we return from the handler in NOIRQ_CONTEXT.
> 
> FEAT_NMI
> 
>   We can distinguish between an NMI and an IRQ on exception
>   entry. Thus, for an IRQ, we can immediately drop to NOIRQ_CONTEXT
>   before passing control to the IRQ handler, allowing NMIs to preempt
>   the IRQ handler. This corresponds to case 2 of the pNMI flow above.
> 
> 
> Perhaps above could be better expressed with:
> 
> if (gic_supports_pseudo_nmis())
> 	arm64_unmask_exc_context(NONMI_CONTEXT);
> else
> 	arm64_unmask_exc_context(NOIRQ_CONTEXT);

Making it this way is reasonable.I understand that only when handling an
IRQ can the masking of NMI be canceled, which is a special case for
pseudo-NMI.

Here, not clearing the DAIF.I bit might be to prevent pseudo-NMI
nesting? Because at the interrupt entry point, it is still unclear
whether this is a pseudo-NMI or an IRQ being handled.

Best regards,
Jinjie

> 
> 
> Have I missed anything?
> 
> Cheers
> Vladimir
> 


