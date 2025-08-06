Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CD0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 06:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGTyiW1W/bmfQrwMo/geBG1sW2Q+gYq7PE1e9pBieNk=; b=JlS5/sj6TQlE3hSh5DyrYIFadN
	eW5LDKJR1uZ6dKI0HnuITlArJlrlERQPF4MghrT4vJb3t3fPa+z4CDM/hxCQ2dWo3mJCdj9KlkIa3
	rKvOpYFJW+EnM9sNCWV/2zftIWK6yP+ORn+E24IAuiwIPQIKSkWPRXSlvZ6lA77OS8fAovz07Qwsd
	rYiDp2ehtB2y7+f2A+OPITV1JnmPYCjFZEf0OnFjUXeoPcNXeSxMnKoCyXDiGHFSHxKu8dzwLy6aQ
	bam0mM4dzfjrRKHGEZ6xy8yX3aw3lw59nKX3uQKY49qokBMxg0C1qxNXwyvmwF8iCxVA6CQo6N7S8
	b8WV8oEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXeH-0000000EPRe-16Ef;
	Wed, 06 Aug 2025 06:29:17 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXbm-0000000EPCR-08yb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 06:26:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bxgDK4p7yz14MKj;
	Wed,  6 Aug 2025 14:21:37 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D56AE1800B1;
	Wed,  6 Aug 2025 14:26:33 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 Aug 2025 14:26:32 +0800
Message-ID: <5d81d30f-8dd4-d74c-7c8a-0714dafc09fe@huawei.com>
Date: Wed, 6 Aug 2025 14:26:31 +0800
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
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_232642_384855_0F8762D8 
X-CRM114-Status: GOOD (  30.19  )
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

This revision makes it easier for people to understand.

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

This is good.

>> + * Defaults return true.
>> + *
>> + * The main purpose is to permit arch to skip preempt a task from an
>> IRQ.
> If feel that "to avoid preemption of a task" instead of "to skip preempt
> a task"
> would make this much clearer, what do you think ?

Yes, this is more clearer.

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
> 
> Maybe improving the commit message and comment for this would be enough
> as well, as per my suggestions above.
> 
> 
> Otherwise the changes make sense and I don't see any functional issues !
> 
> Thanks,
> Ada
> 
> 

