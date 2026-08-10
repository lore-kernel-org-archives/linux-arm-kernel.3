Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B46C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4VGkU/ThHj05JvMy8SqY1U7odi02ffN3jNAhObdy4c=; b=StUJQeWCSW4JsC
	nGTT162CQUjx+lVGDP3eOMrvqPcxT2p+LhpOCxHGSY7Mfaot6OTym+q91ZY0klM1FBgm0a+LXz7pb
	F8CZb09I8KjqpLAJ5RVlR6uaasg6YAOPc1WhrlE4gEbIHJbom/iAiXxvdt7tOYadLpVZxz/lZsfGL
	kVQxcW6Y1w3PlWPfgOQZg2bNiQMqaJkxjGbNcn1BiISUUNnpe8ZZDNOTKXzRFp2f+ZRlWdbQzNiZ0
	QzyyfiNEmggJj8nG2i8varZAq7Jz/U15yGRqL9XXG3kMEZgBY97WsT4/9HlQbKNjBcfVhN1aaZrPk
	grOW9/9HC75rUwx1579Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtT2e-0000000CQHA-1tRD;
	Mon, 10 Aug 2026 16:40:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtT2c-0000000CQGN-2ZZU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:39:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D782014BF;
	Mon, 10 Aug 2026 09:39:52 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 491EB3F86F;
	Mon, 10 Aug 2026 09:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786379996; bh=WKCQbGP9SiDhEpOg5eWYTMaL6MWaimf9g6vwuwJjDBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HgRN1Gj0zbXrqcMDqWuW1BiGk+VKjACyu6nvx6ZB4QYbHKUHlOmKiPwfJXmyPuJnx
	 mHJL2wTum5B7eaergJeyQSTSfD+fVrT2JkvSNP94o7Fx6Bem2t6k7GW7OQmto/Ncw0
	 +YZHTBHjSzr7OwhyGaJ0vJVwn9ed1XTMZ4Fh+iUY=
Message-ID: <9b06f274-8db1-48e4-839e-e387c050d328@arm.com>
Date: Mon, 10 Aug 2026 17:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: entry: PSTATE_I_SET is leaking on pseudo NMI
 mode
To: Will Deacon <will@kernel.org>
References: <20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org>
 <anXkO8YpoadRzm07@J2N7QTR9R3> <anXqMsJ14r3BAbMG@gmail.com>
 <anYHjvJ1_4dDjuzw@gmail.com> <anm5T9FazACqOWXF@willie-the-truck>
 <2a97f777-d33a-4b3d-8c8c-6f6894f04c29@arm.com>
 <annoxlkkq1NpujsP@willie-the-truck>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <annoxlkkq1NpujsP@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_093958_731189_845631C1 
X-CRM114-Status: GOOD (  29.19  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, rmikey@meta.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, Breno Leitao <leitao@debian.org>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 8/10/26 16:05, Will Deacon wrote:
> On Mon, Aug 10, 2026 at 01:42:15PM +0100, Vladimir Murzin wrote:
>> On 8/10/26 12:43, Will Deacon wrote:
>>> On Fri, Aug 07, 2026 at 09:29:12AM -0700, Breno Leitao wrote:
>>>> On Fri, Aug 07, 2026 at 07:58:21AM -0700, Breno Leitao wrote:
>>>>> Meanwhile, I will try to ftrace the writes to PMR and regs->pmr to get
>>>>> a better grasp of the states machine we are in (probably on Monday).
>>>> It seems LLM found a very easy to reproduce this:
>>>>
>>>> 	bash-5.1# dmesg
>>>>
>>>> 	bash-5.1#  cd /sys/kernel/tracing
>>>> 	echo 'r:pmr vfs_read bad=+0($retval):u64' >> kprobe_events
>>>> 	echo 1 > events/kprobes/pmr/enable
>>> Nice, that triggers straightforwardly in QEMU for me. The diff below
>>> (which implements my suggestion from [1]) seems to fix the issue, but
>>> it would be good to hear feedback from one of the Arm folks.
>>>
>>> [1] https://lore.kernel.org/all/anXgWRmcjwPKG7N5@willie-the-truck/
>>>
>>> --->8
>>>
>>> diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
>>> index 795b35128467..691ee5f86dbe 100644
>>> --- a/arch/arm64/include/asm/daifflags.h
>>> +++ b/arch/arm64/include/asm/daifflags.h
>>> @@ -132,7 +132,7 @@ static __always_inline void local_daif_inherit(struct pt_regs *regs)
>>>                 trace_hardirqs_on();
>>>
>>>         if (system_uses_irq_prio_masking())
>>> -               gic_write_pmr(regs->pmr);
>>> +               gic_write_pmr(regs->pmr & ~GIC_PRIO_PSR_I_SET);
>>>
>>>         /*
>>>          * We can't use local_daif_restore(regs->pstate) here as
>>>
>> I have no strong opinion on the change, but I struggle to see how it
>> fits into the big picture.
>>
>> Specifically, I have difficulty explaining this change in isolation.
>> Everywhere else, we try to keep DAIF.I and GIC_PRIO_PSR_I_SET in sync,
>> so it is not clear why we should allow them to go out of sync when
>> inheriting the exception state from the previous context.
> Yeah, I think you're right, and looking at it some more it means we
> end up with the pmr in the IRQON state which will break
> arch_irqs_disabled().
> 

Ahh, nice catch!

>> At the same time, IIUC, the only reason we call local_irq_disable()
>> (which also causes the states to become unsynchronized) in
>> arm64_exit_to_kernel_mode() is for preemption path. So avoiding
>> local_irq_disable() (and preemption) when we interrupted a
>> non-preemptible context seems easier to follow.
> In the past, we only preempted when returning to EL1 off the back of an
> IRQ, but that was changed in ae654112eac0 ("arm64: entry: Use split
> preemption logic") which I think is where this bug was introduced.
>

I believe we started allowing preemption from EL1 exceptions other
than IRQ when we moved to the generic IRQ entry code. It turned out
that, unfortunately, this is not safe in some cases, which is what
Mark's series addressed.

I agree that the change mentioned above introduced an unconditional
local_irq_disable(), and if we want to backport it, it should be
recorded under a Fixes.
 > So we could probably hack something as you suggest, but maybe the best
> option is to take patches 8 and 9 from your FEAT_NMI series? WDYT?
> 

Whatever you prefer, tbh :)

Patch 9 codifies my understanding of how things are expected to
work. That said, I accept that I could be missing something, hence the
RFC tag.

In case you decide to take it, we probably need to:

- extend the commit message to cover Breno's report (right now, the
  commit message makes it look like a refactoring)

- add Fixes tags if we want it to be backported

Alternatively, I can respin the patch separately with the suggestions
above applied - just let me know ;)

Cheers
Vladimir

> Will
> 


