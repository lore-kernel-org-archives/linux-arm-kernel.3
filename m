Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCA9C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 03:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p5MMhuGvydnoSJS8YWU2YJW669/aG6F7+BDhQxH8HuI=; b=IGdTLXDBTL7g5w
	999OJ4faY3Srybgn1lqBY6ImoxGZEw/YMiH110jQEEFBOwtKbQxbuCzKESyhKw0cW2fHSLzuQEoXd
	kmzUPPTArmdpKSDp/f5BKk6BHKf4hFDkFIRWvWlQ3rrN9z03p2tKo3KKdWpfESfhN4umfHFxvx+yX
	zhwCDKkwIpPBEg4FaC5uFTaLjs9Tkmqg39CjHrH+j55KxF3Fr5WanuuMkn206zQopjF5ZE/Qad6QQ
	YBe0+hc8gSsrz7vrg7sM1/jpIXJSZrF5JpsZLYp+T+GTpoaxnxD7A9QqlAyJSQthmWUama5LQX+4X
	6Q3Vp1gWYvbRY9aF4xew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjt4-0000000DHqY-2lcZ;
	Thu, 23 Jul 2026 03:14:18 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjt0-0000000DHpd-2MjQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 03:14:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=p5MMhuGvydnoSJS8YWU2YJW669/aG6F7+BDhQxH8HuI=;
	b=MHhoOhZX2tBQatLRNbbyxKQ5kqI1Gs3Q61Baywp4L1REzYefHBpjyQA885tga6/GAYmZKOlGh
	FGUcmBAxeH4y6G7Y7PpSuzyOZ7vB10Ntq/ADX53MYTWBUA5ojbVnmcp4gUfR/8XKp9jQFGWnEfU
	XU6xqluYO1oJqCaBY21ITz0=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h5GF35GbgzKm6J;
	Thu, 23 Jul 2026 11:04:39 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B4FE4056C;
	Thu, 23 Jul 2026 11:14:05 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Jul 2026 11:14:04 +0800
Message-ID: <c7f61830-9b91-4c8d-9a1e-2efcd3d3d9a9@huawei.com>
Date: Thu, 23 Jul 2026 11:14:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 30/36] arm64: irq: Report FEAT_NMI masking local IRQs
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-31-vladimir.murzin@arm.com>
 <b9d0683d-4469-4a8c-be1d-77d8b9836c0a@huawei.com>
 <023e200c-2458-4604-bdb7-f861be639049@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <023e200c-2458-4604-bdb7-f861be639049@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_201415_276256_5CAC0FC3 
X-CRM114-Status: GOOD (  21.91  )
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



在 2026/7/22 21:55, Vladimir Murzin 写道:
> On 7/21/26 10:06, Jinjie Ruan wrote:
>>
>> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>
>>> As we clear SCTLR_EL1.SPINTMASK when enabling FEAT_NMI, ALLINT masks
>>> IRQs and FIQs regardless of superpriority.
>>> Update irqflags.h and `regs_irqs_disabled()` to take it into account,
>>> so we properly keep track of
>>>
>>> We have documentation at the top of irqflags.h which explains the DAIF
>>> masking. Since the additional masking with NMIs is related and also
>>> covers the IF in DAIF, extend the comment to note what's going on
>>> with NMIs.
>>>
>>> Co-developed-by: Mark Brown <broonie@kernel.org>
>>> Signed-off-by: Mark Brown <broonie@kernel.org>
>>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>>> ---
>>>  arch/arm64/include/asm/irqflags.h | 17 +++++++++++++++++
>>>  arch/arm64/include/asm/ptrace.h   |  9 ++++++++-
>>>  2 files changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
>>> index b571d34bf11d..a291a231d644 100644
>>> --- a/arch/arm64/include/asm/irqflags.h
>>> +++ b/arch/arm64/include/asm/irqflags.h
>>> @@ -20,6 +20,16 @@
>>>   * always masked and unmasked together, and have no side effects for other
>>>   * flags. Keeping to this order makes it easier for entry.S to know which
>>>   * exceptions should be unmasked.
>>> + *
>>> + * With the addition of the FEAT_NMI extension we gain an additional
>>> + * class of superpriority IRQ/FIQ which is separately masked with a
>>> + * choice of modes controlled by SCTLR_ELn.{SPINTMASK,NMI}.
>>> + * Linux sets SPINTMASK to 0 and NMI to 1 which results in ALLINT.ALLINT
>>> + * masking both superpriority interrupts and IRQ/FIQ regardless of the
>>> + * I and F settings. Since these superpriority interrupts are being
>>> + * used as NMIs we do not include them in the interrupt masking here,
>>> + * anything that requires that NMIs be masked needs to explicitly do so,
>>> + * but we do check for ALLINT masking IRQs/FIQs.
>>>   */
>>>  
>>>   /*
>>> @@ -103,6 +113,9 @@ static __always_inline unsigned long arch_local_save_flags(void)
>>>  {
>>>  	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
>>>  
>>> +	if (system_uses_nmi())
>>> +		hwstate.allint = read_sysreg_s(SYS_ALLINT);
>>> +
>>>  	if (system_uses_irq_prio_masking())
>>>  		hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
>>>  
>>> @@ -117,6 +130,10 @@ static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
>>>  	if (hwstate.daif & PSR_I_BIT)
>>>  		return true;
>>>  
>>> +	/* SCTLR_EL1.SPINTMASK is clear, so ALLINT masks *all* IRQs/FIQs. */
>>> +	if (system_uses_nmi() && hwstate.allint > 0)
>> The ">0" here doesn't seem very rigorous, maybe:
>>
>> if (system_uses_nmi() && hwstate.allint & ALLINT_ALLINT)
>>
> 
> Agree.
> 
>>> +		return true;
>>> +
>>>  	if (system_uses_irq_prio_masking() && hwstate.pmr < GIC_PRIO_IRQON)
>>>  		return true;
>>>  
>>> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
>>> index c630165882e8..096d85d75bd7 100644
>>> --- a/arch/arm64/include/asm/ptrace.h
>>> +++ b/arch/arm64/include/asm/ptrace.h
>>> @@ -206,9 +206,16 @@ static inline void forget_syscall(struct pt_regs *regs)
>>>  		(regs)->pmr >= GIC_PRIO_IRQON :				\
>>>  		true)
>>>  
>>> +#define irqs_allint_clear(regs)				\
>>> +	(system_uses_nmi() ?				\
>>> +		((regs)->pstate & PSR_ALLINT_BIT) == 0:	\
>>> +		true)
>>> +
>>>  static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
>>>  {
>>> -	return (regs->pstate & PSR_I_BIT) || !irqs_priority_unmasked(regs);
>>> +	return (regs->pstate & PSR_I_BIT) ||
>>> +		!irqs_priority_unmasked(regs) ||
>>> +		!irqs_allint_clear(regs);
>> Why not define the logic for disable? The semantics of
>> regs_irqs_disabled() is "interrupts disabled".
>>
>> 204 #define
>> irqs_priority_masked(regs)>----->------->------->------->-------\
>> 205 >-------(system_uses_irq_prio_masking()
>> ?>------>------->------->-------\
>> 206 >------->-------(regs)->pmr == GIC_PRIO_IRQOFF
>> :>------->------->-------\
>> 207 >------->-------false)
>> 208
>> 209 #define irqs_allint_masked(regs)>------->------->------->-------\
>> 210 >-------(system_uses_nmi() ?>--->------->------->-------\
>> 211 >------->-------((regs)->pstate & PSR_ALLINT_BIT) :>----\
>> 212 >------->-------false)
>> 213
>> 214 static __always_inline bool regs_irqs_disabled(const struct pt_regs
>> *regs)
>> 215 {
>> 216 >-------return (regs->pstate & PSR_I_BIT) ||
>> 217 >------->-------irqs_priority_masked(regs) ||
>> 218 >------->-------irqs_allint_masked(regs);
>>
> 
> That's in line with my proposal [1], with that it would look like
> 
> static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
> {
>         if (regs->pstate & PSR_I_BIT)
>                 return true;
> 
>         if (system_uses_nmi())
>                 return !!(regs->pstate & PSR_ALLINT_BIT);
> 
>         if (system_uses_irq_prio_masking()) {
>                 WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
>                              regs->pmr != GIC_PRIO_IRQOFF &&
>                              regs->pmr != GIC_PRIO_IRQON);
> 
>                 return regs->pmr != GIC_PRIO_IRQON;
>         }
> 
>         return false;
> }

I like this style.

> 
> 
> [1] https://lore.kernel.org/linux-arm-kernel/fedf2b3e-14ed-4483-8cdf-d31f1ac97b84@arm.com/
> 
>> otherwise, LGTM
>> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>
>>>  }
>>>  
>>>  #define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))
>>
> 
> Cheers
> Vladimir
> 


