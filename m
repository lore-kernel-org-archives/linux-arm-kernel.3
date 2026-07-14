Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6C5C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SXaO6AzKWtUW1cRHtzeEYtQM1jxGyHOl13QcADsOoM=; b=k2NDP5LORpy7GR
	7OXSycPbFPrSdt9euh0zeVFlY9S5v9vp77sG+SbdvV+WPmKKqi5Ll7lzQ+M1Pvq0tgy5FwdjjloxM
	tcFqN9fVTvetIh+Ijnjm2D9tu7pQNNTThlmC7ouX1/bqT6XlIh9qQSX7qQO8vphd60r4qNCYkBuWe
	UmvRy/dmc0mVrS5KwiXDPCmAgT5Etmb/mV14wN0tKkEx7HkqjlDJP8T7AG1ws3/B0KpRbwVagigFO
	qgjqKEn3s+D94KRRQgiu0i8glsY7KjvCEPD+GxWgPpLpKASbMHE61CbN0gefvd2KYOlFGdZvvSkPC
	qZmhCGVdKMbOZ5RDuTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaxK-0000000BdlD-30KK;
	Tue, 14 Jul 2026 11:05:42 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaxH-0000000BdkI-3tnj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:05:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5SXaO6AzKWtUW1cRHtzeEYtQM1jxGyHOl13QcADsOoM=;
	b=oVagbnXBtKowPKMvk1BfMQExaZ4EezGgp2oK4ZVhTYW2izKgoL5ZgkKBDUESO9YExC/D+fOZH
	Jp5+H8gDcIlUyCdyxPBRggPBDAnzxWu1kkhB+lXGWnLSIUfaiH7x9ALswFRohDlFBJ0UYumoZE+
	NOdEga2mbhCS3Ro9efTHzr4=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gzx7F5g0zzRhVN;
	Tue, 14 Jul 2026 18:56:09 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 53EFF40561;
	Tue, 14 Jul 2026 19:05:26 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 19:05:25 +0800
Message-ID: <30789c4d-cacb-49ba-8848-b69a61b02fde@huawei.com>
Date: Tue, 14 Jul 2026 19:05:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/36] arm64: irq: introduce a helper for GIC priority
 initialization
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-7-vladimir.murzin@arm.com>
 <994f9866-b7f9-408f-8aaf-3591882b5c7f@huawei.com>
 <432a52d8-0526-4477-95fe-2aba6a113153@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <432a52d8-0526-4477-95fe-2aba6a113153@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_040540_286579_3DAC99FA 
X-CRM114-Status: GOOD (  19.19  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/14/2026 6:02 PM, Vladimir Murzin wrote:
> On 7/10/26 08:44, Jinjie Ruan wrote:
>>
>> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>
>>> Arm64's `init_IRQ()` calls `local_daif_restore()` to synchronize
>>> interrupt masking via DAIF and switch to masking via PMR.  This
>>> depends on a very specific behaviour of `local_daif_restore()` which
>>> will clear DAIF if masking interrupts via PMR, which will get removed
>>> in the future.
>>>
>>> As `setup_arch()` cleared DA only earlier, introduce a dedicated
>>> helper that explicitly initializes the PMR to mask interrupts and
>>> clears DAIF, switching to IRQ priority masking.
>>>
>>> Given it is a dedicated helper, add a lockdep assertion as
>>> `setup_arch()` should always have called `trace_hardirqs_off()` when
>>> clearing DA, otherwise something bad happened.
>>>
>>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>>> ---
>>>  arch/arm64/include/asm/daifflags.h | 15 +++++++++++++++
>>>  arch/arm64/kernel/irq.c            |  7 +++----
>>>  2 files changed, 18 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
>>> index 795b35128467..56341578e7e3 100644
>>> --- a/arch/arm64/include/asm/daifflags.h
>>> +++ b/arch/arm64/include/asm/daifflags.h
>>> @@ -141,4 +141,19 @@ static __always_inline void local_daif_inherit(struct pt_regs *regs)
>>>  	 */
>>>  	write_sysreg(flags, daif);
>>>  }
>>> +
>>> +/*
>>> + * During early boot, we unmask PSR.DA before the GIC has been set up.
>>> + * If we use IRQ priority masking, the PMR and PSR will be out of sync
>>> + * after the GIC is enabled : sync them up.
>>> + */
>>> +static inline void local_interrupt_priority_init(void)
>> Maybe switch_to_pmr_masking()?
>>
> 
> I have no strong opinion on that, tbh.
> 
> Having another look at the code made me think that this helper has
> only a single caller. Perhaps we should move the system_uses_irq_prio_masking()
> check from the caller into the helper, making it clear that the helper
> is specific to pNMI without having to inspect the call site.

I think it is fine to move system_uses_irq_prio_masking() check to the
helper.

> 
> What do you reckon?
> 
>>> +{
>>> +	WARN_ON(read_sysreg(daif) & PSR_A_BIT);
>>> +	lockdep_assert_irqs_disabled();
>>> +
>>> +	gic_write_pmr(GIC_PRIO_IRQOFF);
>>> +	write_sysreg(DAIF_PROCCTX, daif);
>> otherwise LGTM
>> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>
> 
> Thanks!
> 
> Vladimir
> 
>>> +}
>>> +
>>>  #endif
>>> diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
>>> index 9fafd826002b..c73faa30268d 100644
>>> --- a/arch/arm64/kernel/irq.c
>>> +++ b/arch/arm64/kernel/irq.c
>>> @@ -126,10 +126,9 @@ void __init init_IRQ(void)
>>>  
>>>  	if (system_uses_irq_prio_masking()) {
>>>  		/*
>>> -		 * Now that we have a stack for our IRQ handler, set
>>> -		 * the PMR/PSR pair to a consistent state.
>>> +		 * Now that we have a stack for our IRQ handler,
>>> +		 * let's mask interrupts via the PMR.
>>>  		 */
>>> -		WARN_ON(read_sysreg(daif) & PSR_A_BIT);
>>> -		local_daif_restore(DAIF_PROCCTX_NOIRQ);
>>> +		local_interrupt_priority_init();
>>>  	}
>>>  }
>>
> 
> 


