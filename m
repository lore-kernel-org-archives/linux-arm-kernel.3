Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C8BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cx7O0ZvPT/2toVDKrn6Vdsg3VhrmCTdy1FHTHQxi4ao=; b=vCMHiHdE3V7Ny3
	4jYQFa/e0ehawq8Y+s0dpJZVQPhuNZG4A2TZw0LDcucSyPRAHM3bUCjejtF09GeUb7FGP4XYVNV7s
	Eo/gAsah6Ls2SvbN43UGGHcStQ/OtzxZ0lHSmdlnSKzkEJQ4AQDCrLulOXRuPMWAxy3HK2DBSvbRU
	jLzV9Ax0wtaA4XSzcZNoOceU8eNdn1pbrsvWuGTwdk8jZbCyvD15zQQRFj7bNlzp02lmbDg5qAR4c
	xlK7WZkLa6VhCKZVeV4KRmFT2Vf2cMnmlxEjVVUkRFPNu5N5UtfAckd4GmbhDYUtsQND/xLCuTKsX
	aKz0g8SQHjxSOPSYSKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVQw-0000000GdEE-392x;
	Thu, 14 Aug 2025 10:43:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUJQ-0000000GPm4-05XD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:31:57 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4c2g313LRmztTJC;
	Thu, 14 Aug 2025 17:30:53 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 796DD14027A;
	Thu, 14 Aug 2025 17:31:53 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 17:31:51 +0800
Message-ID: <7c342b54-553c-013e-bed0-bc723c20464a@huawei.com>
Date: Thu, 14 Aug 2025 17:31:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 5/7] arm64: entry: Refactor
 preempt_schedule_irq() check code
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-6-ruanjinjie@huawei.com>
 <aJsh5oM3CoUELkvY@J2N7QTR9R3>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aJsh5oM3CoUELkvY@J2N7QTR9R3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_023156_376717_08E4A475 
X-CRM114-Status: GOOD (  18.88  )
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
Cc: sstabellini@kernel.org, puranjay@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, xen-devel@lists.xenproject.org, leitao@debian.org, ryan.roberts@arm.com, akpm@linux-foundation.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2025/8/12 19:13, Mark Rutland wrote:
> On Tue, Jul 29, 2025 at 09:54:54AM +0800, Jinjie Ruan wrote:
>> ARM64 requires an additional check whether to reschedule on return
>> from interrupt. So add arch_irqentry_exit_need_resched() as the default
>> NOP implementation and hook it up into the need_resched() condition in
>> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
>> the architecture specific version for switching over to
>> the generic entry code.
>>
>> To align the structure of the code with irqentry_exit_cond_resched()
>> from the generic entry code, hoist the need_irq_preemption()
>> and IS_ENABLED() check earlier. And different preemption check functions
>> are defined based on whether dynamic preemption is enabled.
>>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/include/asm/preempt.h |  4 ++++
>>  arch/arm64/kernel/entry-common.c | 35 ++++++++++++++++++--------------
>>  kernel/entry/common.c            | 16 ++++++++++++++-
>>  3 files changed, 39 insertions(+), 16 deletions(-)
> 
> Can you please split the change to kernel/entry/common.c into a separate
> patch? That doesn't depend on the arm64-specific changes, and it'll make
> it easier to handle any conflcits when merging this.

Sure, I'll split the change into separate patch.

> 
> Mark.
> 
>>
>> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
>> index 0159b625cc7f..0f0ba250efe8 100644
>> --- a/arch/arm64/include/asm/preempt.h
>> +++ b/arch/arm64/include/asm/preempt.h
>> @@ -85,6 +85,7 @@ static inline bool should_resched(int preempt_offset)
>>  void preempt_schedule(void);
>>  void preempt_schedule_notrace(void);
>>  
>> +void raw_irqentry_exit_cond_resched(void);
>>  #ifdef CONFIG_PREEMPT_DYNAMIC
>>  
>>  DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>> @@ -92,11 +93,14 @@ void dynamic_preempt_schedule(void);
>>  #define __preempt_schedule()		dynamic_preempt_schedule()
>>  void dynamic_preempt_schedule_notrace(void);
>>  #define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
>> +void dynamic_irqentry_exit_cond_resched(void);
>> +#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
>>  
>>  #else /* CONFIG_PREEMPT_DYNAMIC */
>>  
>>  #define __preempt_schedule()		preempt_schedule()
>>  #define __preempt_schedule_notrace()	preempt_schedule_notrace()
>> +#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
>>  
>>  #endif /* CONFIG_PREEMPT_DYNAMIC */
>>  #endif /* CONFIG_PREEMPTION */
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index 7c2299c1ba79..4f92664fd46c 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -285,19 +285,8 @@ static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs,
>>  		lockdep_hardirqs_on(CALLER_ADDR0);
>>  }
>>  
>> -#ifdef CONFIG_PREEMPT_DYNAMIC
>> -DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>> -#define need_irq_preemption() \
>> -	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
>> -#else
>> -#define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
>> -#endif
>> -
>>  static inline bool arm64_preempt_schedule_irq(void)
>>  {
>> -	if (!need_irq_preemption())
>> -		return false;
>> -
>>  	/*
>>  	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
>>  	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
>> @@ -672,6 +661,24 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
>>  	arm64_exit_nmi(regs, state);
>>  }
>>  
>> +void raw_irqentry_exit_cond_resched(void)
>> +{
>> +	if (!preempt_count()) {
>> +		if (need_resched() && arm64_preempt_schedule_irq())
>> +			preempt_schedule_irq();
>> +	}
>> +}
>> +
>> +#ifdef CONFIG_PREEMPT_DYNAMIC
>> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>> +void dynamic_irqentry_exit_cond_resched(void)
>> +{
>> +	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
>> +		return;
>> +	raw_irqentry_exit_cond_resched();
>> +}
>> +#endif
>> +
>>  static __always_inline void __el1_irq(struct pt_regs *regs,
>>  				      void (*handler)(struct pt_regs *))
>>  {
>> @@ -681,10 +688,8 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>>  	do_interrupt_handler(regs, handler);
>>  	irq_exit_rcu();
>>  
>> -	if (!preempt_count() && need_resched()) {
>> -		if (arm64_preempt_schedule_irq())
>> -			preempt_schedule_irq();
>> -	}
>> +	if (IS_ENABLED(CONFIG_PREEMPTION))
>> +		irqentry_exit_cond_resched();
>>  
>>  	exit_to_kernel_mode(regs, state);
>>  }
>> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
>> index b82032777310..4aa9656fa1b4 100644
>> --- a/kernel/entry/common.c
>> +++ b/kernel/entry/common.c
>> @@ -142,6 +142,20 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
>>  	return ret;
>>  }
>>  
>> +/**
>> + * arch_irqentry_exit_need_resched - Architecture specific need resched function
>> + *
>> + * Invoked from raw_irqentry_exit_cond_resched() to check if need resched.
>> + * Defaults return true.
>> + *
>> + * The main purpose is to permit arch to skip preempt a task from an IRQ.
>> + */
>> +static inline bool arch_irqentry_exit_need_resched(void);
>> +
>> +#ifndef arch_irqentry_exit_need_resched
>> +static inline bool arch_irqentry_exit_need_resched(void) { return true; }
>> +#endif
>> +
>>  void raw_irqentry_exit_cond_resched(void)
>>  {
>>  	if (!preempt_count()) {
>> @@ -149,7 +163,7 @@ void raw_irqentry_exit_cond_resched(void)
>>  		rcu_irq_exit_check_preempt();
>>  		if (IS_ENABLED(CONFIG_DEBUG_ENTRY))
>>  			WARN_ON_ONCE(!on_thread_stack());
>> -		if (need_resched())
>> +		if (need_resched() && arch_irqentry_exit_need_resched())
>>  			preempt_schedule_irq();
>>  	}
>>  }
>> -- 
>> 2.34.1
>>
> 
> 

