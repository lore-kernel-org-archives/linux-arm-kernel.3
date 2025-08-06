Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCF8C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 06:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBTKq9BOeE7V0EOWtitFy4uBx5c1QsTVmDutVFqDEPo=; b=qPnx4QjAwo4i3shIgda1dkG2cH
	ge3SGX6sNGCXqU5dRmix9IOvIQLGrl275rOHVhOwyCfRnVxDQk65lUqMpnP4P8E8ie0oCXVsTGS0Q
	kILyYpbpLlEWi/8u/+wtC7+gjydtlQR2WsAPu6K0S930dPCqo7spemOhEiGQLlfUi5xAjqkBFafot
	QZ292/gEExSxY4qSGTaGgIp8HBlnaRG6JVvyuk5lOd8sCBcInE87Hy7QoCVyBCvGwfY/grAa/HTmK
	0RITki5ADGUEsduPbmzirTgN2Cf7pJkSrpNnDPlWd4UN+O3+hqgiSFB/EMc7g7hNkCscu4sVy0Wkc
	ciSGOsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXu1-0000000EQnt-060q;
	Wed, 06 Aug 2025 06:45:33 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXoR-0000000EQKh-48mC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 06:39:49 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bxgfJ29swz27g4j;
	Wed,  6 Aug 2025 14:40:40 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8B11A140119;
	Wed,  6 Aug 2025 14:39:37 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 Aug 2025 14:39:36 +0800
Message-ID: <bedb35be-100b-95fb-64e4-b38edd3cd327@huawei.com>
Date: Wed, 6 Aug 2025 14:39:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 5/7] arm64: entry: Refactor
 preempt_schedule_irq() check code
Content-Language: en-US
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <puranjay@kernel.org>,
	<broonie@kernel.org>, <mbenes@suse.cz>, <ryan.roberts@arm.com>,
	<akpm@linux-foundation.org>, <chenl311@chinatelecom.cn>,
	<anshuman.khandual@arm.com>, <kristina.martsenko@arm.com>,
	<liaochang1@huawei.com>, <ardb@kernel.org>, <leitao@debian.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-6-ruanjinjie@huawei.com>
 <44fd646c-4e31-4ca6-9e22-f715ad19e0d7@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <44fd646c-4e31-4ca6-9e22-f715ad19e0d7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_233948_340191_8F6A59B4 
X-CRM114-Status: GOOD (  29.70  )
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



On 2025/8/5 23:06, Ada Couprie Diaz wrote:
> Hi Jinjie,
> 
> On 29/07/2025 02:54, Jinjie Ruan wrote:
>> ARM64 requires an additional check whether to reschedule on return
>> from interrupt. So add arch_irqentry_exit_need_resched() as the default
>> NOP implementation and hook it up into the need_resched() condition in
>> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
>> the architecture specific version for switching over to
>> the generic entry code.
> I was a bit confused by this, as I didn't see the link with the generic
> entry
> given you implement `raw_irqentry_exit_cond_resched()` in arch/arm64
> as well in this patch : I expected the arm64 implementation to be added.
> I share more thoughts below.
> 
> What do you think about something along those lines ?
> 
>     Compared to the generic entry code, arm64 does additional checks
>     when deciding to reschedule on return from an interrupt.
>     Introduce arch_irqentry_exit_need_resched() in the need_resched()
> condition
>     of the generic raw_irqentry_exit_cond_resched(), with a NOP default.
>     This will allow arm64 to implement its architecture specific checks
> when
>     switching over to the generic entry code.
> 
>> [...]
>> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
>> index b82032777310..4aa9656fa1b4 100644
>> --- a/kernel/entry/common.c
>> +++ b/kernel/entry/common.c
>> @@ -142,6 +142,20 @@ noinstr irqentry_state_t irqentry_enter(struct
>> pt_regs *regs)
>>       return ret;
>>   }
>>   +/**
>> + * arch_irqentry_exit_need_resched - Architecture specific need
>> resched function
>> + *
>> + * Invoked from raw_irqentry_exit_cond_resched() to check if need
>> resched.
> Very nit : "to check if resched is needed." ?
>> + * Defaults return true.
>> + *
>> + * The main purpose is to permit arch to skip preempt a task from an
>> IRQ.
> If feel that "to avoid preemption of a task" instead of "to skip preempt
> a task"
> would make this much clearer, what do you think ?
>> + */
>> +static inline bool arch_irqentry_exit_need_resched(void);
>> +
>> +#ifndef arch_irqentry_exit_need_resched
>> +static inline bool arch_irqentry_exit_need_resched(void) { return
>> true; }
>> +#endif
>> +
> 
> I've had some trouble reviewing this patch : on the one hand because
> I didn't notice `arch_irqentry_exit_need_resched()` was added in
> the common entry code, which is on me !
> On the other hand, I felt that the patch itself was a bit disconnected :
> we add `arch_irqentry_exit_need_resched()` in the common entry code,
> with a default NOP, but in the same function we add to arm64,
> while mentioning that this is for arm64's additional checks,
> which we only implement in patch 7.

Yes, it does.

> 
> Would it make sense to move the `arch_irqentry_exit_need_resched()`
> part of the patch to patch 7, so that the introduction and
> arch-specific implementation appear together ?
> To me it seems easier to wrap my head around, as it would look like
> "Move arm64 to generic entry, but it does additional checks : add a new
> arch-specific function controlling re-scheduling, defaulting to true,
> and implement it for arm64". I feel it could help making patch 7's
> commit message clearer as well.
> 
> From what I gathered on the archive `arch_irqentry_exit_need_resched()`
> being added here was suggested previously, so others might not have the
> same opinion.

Yes, introduce `arch_irqentry_exit_need_resched()` here may help
understand the patch's refactoring purpose.

> 
> Maybe improving the commit message and comment for this would be enough
> as well, as per my suggestions above.

Thank you! I'll improve the commit message and comment.

> 
> 
> Otherwise the changes make sense and I don't see any functional issues !
> 
> Thanks,
> Ada
> 
> 

