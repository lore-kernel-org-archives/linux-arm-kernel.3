Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811D61098787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/GtZL4sQUVfbfQ8o3Jwyp1Zb/OVT68tzwK+0wJfnpY=; b=xOORfec7LQrLkMcQRjc908tq7y
	UOijkWHWSQLmMAy2ax+BfMGvxOJvFrhgP6r6RUwqrIdN0Xp1QTOOBbZbH0lj4wv60b4Xm4lf+gBQ6
	pixA+syySMY0kcELQ2fHgdsipxl2k4+er5C6eJnuh8mEd/RubYuoD6etpS2SpkOl0X/ysGBQOv9k3
	/W//wSF2aaMPgLQRvkDsDQoli2OK9hs+cukaea600uPNDPLIaFG3umTfsNtZzDnW8Vk5i/6jaJaoH
	Z9SaS0w+nY24t3wIpeZQph3BuLOJIf/S0b87pIJtUGneW3SN4ZKGSQ9LWuvHT7CSEnHX2PeHOUVUz
	zZPTgk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aZT-0000000CuhY-16Bk;
	Fri, 20 Mar 2026 14:11:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aZR-0000000CuhC-2ozQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 14:11:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11D0F438B1;
	Fri, 20 Mar 2026 14:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133C8C4CEF7;
	Fri, 20 Mar 2026 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774015884;
	bh=DtYG15RsitNgOn8gCMEp+c82f1w8goXvTJLV/Xl83+0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fCBNXFMuw5c2+MRveuqhNrTyEDessp+rC+4oDFNo9uw3cl2EGe0YfrWR1kzv4WhqA
	 3ymWXown23VuL1mle9pxvJzk5hDNc8VhMdio6okbhRFjusDm/p+bKk4qk0Y7W+5/G7
	 53/fMio1oVmjktM8GQEG6BZYwtKbaUdvIYKp4pmuaRf58+aLnBWJGULVeNzvjVbJx+
	 6MFMxMuflD0vVNy0hYCv8YLt+Bwk+KavbXxzqxd0h9tIhm7xCMyan8jaxEDuc26O2B
	 8P0RWk6hGAEznr8r3NN3bi3Mds1QXzgHeA102l1wAjiMj9resnxrFPCUwx7YQ6hNVf
	 0AumKlSRgz7sg==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
In-Reply-To: <20260320130433.GV3738786@noisy.programming.kicks-ass.net>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
 <20260320130433.GV3738786@noisy.programming.kicks-ass.net>
Date: Fri, 20 Mar 2026 15:11:20 +0100
Message-ID: <87h5qak2uv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_071125_754607_E913D7BB 
X-CRM114-Status: GOOD (  24.14  )
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
Cc: vladimir.murzin@arm.com, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20 2026 at 14:04, Peter Zijlstra wrote:
> On Fri, Mar 20, 2026 at 11:30:25AM +0000, Mark Rutland wrote:
>> Thomas, Peter, I have a couple of things I'd like to check:
>> 
>> (1) The generic irq entry code will preempt from any exception (e.g. a
>>     synchronous fault) where interrupts were unmasked in the original
>>     context. Is that intentional/necessary, or was that just the way the
>>     x86 code happened to be implemented?
>> 
>>     I assume that it'd be fine if arm64 only preempted from true
>>     interrupts, but if that was intentional/necessary I can go rework
>>     this.
>
> So NMI-from-kernel must not trigger resched IIRC. There is some code
> that relies on this somewhere. And on x86 many of those synchronous
> exceptions are marked as NMI, since they can happen with IRQs disabled
> inside locks etc.
>
> But for the rest I don't think we care particularly. Notably page-fault
> will already schedule itself when possible (faults leading to IO and
> blocking).

Right. In general we allow preemption on any interrupt, trap and exception
when:

  1) the interrupted context had interrupts enabled

  2) RCU was watching in the original context

This _is_ intentional as there is no reason to defer preemption in such
a case. The RT people might get upset if you do so.

NMI like exceptions, which are not allowed to schedule, should therefore
never go through irqentry_irq_entry() and irqentry_irq_exit().

irqentry_nmi_enter() and irqentry_nmi_exit() exist for a technical
reason and are not just of decorative nature. :)

>> (2) The generic irq entry code only preempts when RCU was watching in
>>     the original context. IIUC that's just to avoid preempting from the
>>     idle thread. Is it functionally necessary to avoid that, or is that
>>     just an optimization?
>> 
>>     I'm asking because historically arm64 didn't check that, and I
>>     haven't bothered checking here. I don't know whether we have a
>>     latent functional bug.
>
> Like I told you on IRC, I *think* this is just an optimization, since if
> you hit idle, the idle loop will take care of scheduling. But I can't
> quite remember the details here, and wish we'd have written a sensible
> comment at that spot.

There is one, but it's obviously not detailed enough.

> Other places where RCU isn't watching are userspace and KVM. The first
> isn't relevant because this is return-to-kernel, and the second I'm not
> sure about.
>
> Thomas, can you remember?

Yes. It's not an optimization. It's a correctness issue.

If the interrupted context is RCU idle then you have to carefully go
back to that context. So that the context can tell RCU it is done with
the idle state and RCU has to pay attention again. Otherwise all of this
becomes imbalanced.

This is about context-level nesting:

        ...
L1.A    ct_cpuidle_enter();

                        -> interrupt
 L2.A                           ct_irq_enter();
                                ...             // Set NEED_RESCHED
 L2.B                           ct_irq_exit();
                               
        ...
L1.B    ct_cpuidle_exit();

Scheduling between #L2.B and #L1.B makes RCU rightfully upset. Think
about it this way:

L1.A    preempt_disable();
L2.A    local_bh_disable();
        ..
L2.B    local_bh_enable();
        if (need_resched())
           schedule();
L1.B    preempt_enable();

RCU is not any different. For context-level nesting of any kind the only
valid order is:

   L1.A -> L2.A -> L2.B -> L1.B

Pretty obvious if you actually think about it, no?

Thanks,

        tglx

