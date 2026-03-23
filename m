Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5086F483D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxxoWQIffcMxNo4KbNQahLK1a7hECo/5TZgBgXtpuDM=; b=Gx5mFmUWzYpVVG294G58RzG4Oz
	zYP3Q+GE24w3cMajoa4BQw0HNlx7Tfw6KJKP47T61ppNYxdBAJLx4F+GAOSht5ulu+vthkWXrC4Qe
	Pn7vpBKrg1kSq09CGMW+V4Nji+a50rp5ouSAKiY4ZHc8DrpqiU9oMtedGNbBzxAbCMvVcHg0d3Ch0
	1WdRe2h+m2Kpr4luyq4UcJktqmYOD/mo7DHMKhq7d8cfoqT8R5hybpAwMWIZ4JwHAxSFEqn7yTMud
	VS8jIQ/cO/sm6OxllTDaSlUCQMtn6L80/p8Z9tWCmwYQu4wTwZYFcZTI5W7Jl6FZqeiK6OryZcoEr
	jX2sYxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ixw-0000000HDZt-1qjM;
	Mon, 23 Mar 2026 17:21:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ixu-0000000HDZJ-074M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:21:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 069E214BF;
	Mon, 23 Mar 2026 10:21:13 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7F653F694;
	Mon, 23 Mar 2026 10:21:17 -0700 (PDT)
Date: Mon, 23 Mar 2026 17:21:12 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Message-ID: <acF2iNiuh0hs01bG@J2N7QTR9R3.cambridge.arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
 <20260320130433.GV3738786@noisy.programming.kicks-ass.net>
 <87h5qak2uv.ffs@tglx>
 <ab1gYcG_-EFNKALm@J2N7QTR9R3.cambridge.arm.com>
 <875x6qjyac.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875x6qjyac.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_102122_141308_C94FE852 
X-CRM114-Status: GOOD (  23.43  )
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

On Fri, Mar 20, 2026 at 04:50:03PM +0100, Thomas Gleixner wrote:
> On Fri, Mar 20 2026 at 14:57, Mark Rutland wrote:
> > On Fri, Mar 20, 2026 at 03:11:20PM +0100, Thomas Gleixner wrote:
> >> Yes. It's not an optimization. It's a correctness issue.
> >> 
> >> If the interrupted context is RCU idle then you have to carefully go
> >> back to that context. So that the context can tell RCU it is done with
> >> the idle state and RCU has to pay attention again. Otherwise all of this
> >> becomes imbalanced.
> >> 
> >> This is about context-level nesting:
> >> 
> >>         ...
> >> L1.A    ct_cpuidle_enter();
> >> 
> >>                         -> interrupt
> >>  L2.A                           ct_irq_enter();
> >>                                 ...             // Set NEED_RESCHED
> >>  L2.B                           ct_irq_exit();
> >>                                
> >>         ...
> >> L1.B    ct_cpuidle_exit();
> >> 
> >> Scheduling between #L2.B and #L1.B makes RCU rightfully upset. 
> >
> > I suspect I'm missing something obvious here:
> >
> > * Regardless of nesting, I see that scheduling between L2.B and L1.B is
> >   broken because RCU isn't watching.
> >
> > * I'm not sure whether there's a problem with scheduling between L2.A
> >   and L2.B, which is what arm64 used to do, and what arm64 would do
> >   after this patch.
> 
> The only reason why it "works" is that the idle task has preemption
> permanently disabled, so it won't really schedule even if need_resched()
> is set. So it "works" by chance and not by design.

Ah, I see.

Thanks -- that relieves my fear that we'd have to backport a fix to
stable kernels. Since that's safe by accident, I think we can leave
stable kernels as-is.

> Apply the patch below and watch the show.

Thanks for this too; I hadn't spotted rcu_irq_exit_check_preempt().

Info dump below, but this is just agreeing with what you said above. :)

Since rcu_irq_exit_check_preempt() doesn't dump the actual values, I
hacked up something similar and tested arm64's old logic (from v6.17).
CT_NESTING_IRQ_NONIDLE would be 0x4000000000000001, so that would
be off-by-one if we were to preempt. However, as you say, preemption is
disabled, and that happens to save us.

Thanks again!

Mark.

| ------------[ cut here ]------------
| HARK: arm64_preempt_schedule_irq() called with:
|       CT nesting: 0x0000000000000001
|   CT NMI nesting: 0x4000000000000002
|     RCU watching: yes
|    preempt_count: 0x00000001
| WARNING: CPU: 0 PID: 0 at arch/arm64/kernel/entry-common.c:286 el1_interrupt+0xf8/0x100
| Modules linked in:
| CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.17.0-00001-gc02e86492f52-dirty #8 PREEMPT 
| Hardware name: linux,dummy-virt (DT)
| pstate: 600000c9 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
| pc : el1_interrupt+0xf8/0x100
| lr : el1_interrupt+0xf8/0x100
| sp : ffffa1efd4333be0
| x29: ffffa1efd4333be0 x28: ffffa1efd434d280 x27: ffffa1efd4342360
| x26: ffffa1efd4345000 x25: 0000000000000000 x24: ffffa1efd434d280
| x23: 0000000060000009 x22: ffffa1efd31f0154 x21: ffffa1efd4333d70
| x20: 0000000000000000 x19: ffffa1efd4333c20 x18: 000000000000000a
| x17: 72702020200a7365 x16: 79203a676e696863 x15: 7461772055435220
| x14: 2020200a32303030 x13: 3130303030303030 x12: 7830203a746e756f
| x11: 0000000000000058 x10: 0000000000000018 x9 : fff000003c7e5000
| x8 : 00000000000affa8 x7 : 0000000000000084 x6 : fff000003fc7b6c0
| x5 : fff000003fc7b6c0 x4 : 0000000000000000 x3 : 0000000000000000
| x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffa1efd434d280
| Call trace:
|  el1_interrupt+0xf8/0x100 (P)
|  el1h_64_irq_handler+0x18/0x24
|  el1h_64_irq+0x6c/0x70
|  default_idle_call+0xb4/0x2a0 (P)
|  do_idle+0x210/0x270
|  cpu_startup_entry+0x34/0x40
|  rest_init+0x174/0x180
|  console_on_rootfs+0x0/0x6c
|  __primary_switched+0x88/0x90
| irq event stamp: 848
| hardirqs last  enabled at (846): [<ffffa1efd1fb0da8>] rcu_core+0xc88/0x1048
| hardirqs last disabled at (847): [<ffffa1efd1ee2444>] handle_softirqs+0x434/0x4a0
| softirqs last  enabled at (848): [<ffffa1efd1ee245c>] handle_softirqs+0x44c/0x4a0
| softirqs last disabled at (841): [<ffffa1efd1e10794>] __do_softirq+0x14/0x20
| ---[ end trace 0000000000000000 ]---

