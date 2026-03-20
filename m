Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAF81098797
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gR+6owvU3yy7F46kJ9PtSdc6kJax+midJ3cYX5E8DmA=; b=twJRg4XJQPKV8uqj2yPGFygIwD
	CmRUQN+3bhvN09/LCVdX/5t7e90g90UMSek8Fr9MjcUIlXYSwB2xnC0XunSBQMzP7RD6Z1B+K0Ma2
	5yun1USrp9JaBlKooFey4saqe/FVP2YRnkTNxCLTkn4+PYpmIdoy6Ql2TRuOXertIh8stSB/r9cSU
	92nYc52M3VpblOvYh/G+FH/Ij9dvXqLTSzLDiqN0QPzHLCBk6zK3pnuOP86Dkxmn90oYqePnRu6cn
	NkF8ufkvNHCdbYI4cD/8iGYTV6NqAaAaFFnyQ/Hb4omhjh0B8qf0Jkz9J1K6ITlJ6XO2OVR3fsIPX
	c+2lMgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3c6z-0000000D4JB-0IxV;
	Fri, 20 Mar 2026 15:50:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3c6x-0000000D4J5-43DD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53BF060130;
	Fri, 20 Mar 2026 15:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62265C4CEF7;
	Fri, 20 Mar 2026 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774021807;
	bh=iStYPl5owYOHq6DDbCbeqEwQVN/Ca5rVrhfQiuk39DU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u5WmjTdTUrJ4iPcX6gBK3//9wTkiWnr5LdGufGsxBmzNy9bz/nDjZ764dXN/uqdUX
	 3JrNQ0VS1JPYxC+A6gQGAi2XKIaBj4ALc5AON/ihYyNlBSG5iW/Az1qDQneXKdkNEE
	 Fd9Y15CxReVK1KnKOOSaOGZU+9hd6eiKIPoupipzqpCV2F4K4+PSIn6AvHdd/ErZ1v
	 CgS8fLwFZn2pUi0KSV/yeVuVJTxo7DTxhCicdeTcnb8Ay9P2mI75kbwX+dPtBlxVxj
	 BvKL4642A9crLi+3h8kpmegZKMkCHQKC7NAwnnYmFxIwRz6PEA0FxXkia4vBXn9JdU
	 NBOT/AsQWq9vQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
In-Reply-To: <ab1gYcG_-EFNKALm@J2N7QTR9R3.cambridge.arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
 <20260320130433.GV3738786@noisy.programming.kicks-ass.net>
 <87h5qak2uv.ffs@tglx> <ab1gYcG_-EFNKALm@J2N7QTR9R3.cambridge.arm.com>
Date: Fri, 20 Mar 2026 16:50:03 +0100
Message-ID: <875x6qjyac.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: vladimir.murzin@arm.com, Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20 2026 at 14:57, Mark Rutland wrote:
> On Fri, Mar 20, 2026 at 03:11:20PM +0100, Thomas Gleixner wrote:
>> Yes. It's not an optimization. It's a correctness issue.
>> 
>> If the interrupted context is RCU idle then you have to carefully go
>> back to that context. So that the context can tell RCU it is done with
>> the idle state and RCU has to pay attention again. Otherwise all of this
>> becomes imbalanced.
>> 
>> This is about context-level nesting:
>> 
>>         ...
>> L1.A    ct_cpuidle_enter();
>> 
>>                         -> interrupt
>>  L2.A                           ct_irq_enter();
>>                                 ...             // Set NEED_RESCHED
>>  L2.B                           ct_irq_exit();
>>                                
>>         ...
>> L1.B    ct_cpuidle_exit();
>> 
>> Scheduling between #L2.B and #L1.B makes RCU rightfully upset. 
>
> I suspect I'm missing something obvious here:
>
> * Regardless of nesting, I see that scheduling between L2.B and L1.B is
>   broken because RCU isn't watching.
>
> * I'm not sure whether there's a problem with scheduling between L2.A
>   and L2.B, which is what arm64 used to do, and what arm64 would do
>   after this patch.

The only reason why it "works" is that the idle task has preemption
permanently disabled, so it won't really schedule even if need_resched()
is set. So it "works" by chance and not by design.

Apply the patch below and watch the show.

> Thanks for all of this. Even if I'm confused right now, it's very
> helpful!

RCU induced confusion is perfectly normal. Everyone suffers from that at
some point. Welcome to the club.

Thanks,

        tglx
---
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -187,9 +187,10 @@ static inline bool arch_irqentry_exit_ne
 
 void raw_irqentry_exit_cond_resched(void)
 {
+	rcu_irq_exit_check_preempt();
+
 	if (!preempt_count()) {
 		/* Sanity check RCU and thread stack */
-		rcu_irq_exit_check_preempt();
 		if (IS_ENABLED(CONFIG_DEBUG_ENTRY))
 			WARN_ON_ONCE(!on_thread_stack());
 		if (need_resched() && arch_irqentry_exit_need_resched())



