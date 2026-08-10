Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B94C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDKmpmY7Cr/T6MuowvZnO5OrPdsRk6rOQ3ETEw6YAD8=; b=W1WKxAjZqVvgzbqB018hMtVQrw
	0WYqoMoJLgZJhQT5TvO8b/PxmmvTfebMkoQQyX31q8wp6ngGsV54hoXgXY0gYZ0PjRq/YOj/ZASlp
	7UQSQ7wKWpA0Ex31iyuMGWuMJ+q0Zj+TJx8eII3yxOhErOEtip7jnVrphtU9cskK3KXKjk3bX/B3u
	/CWBLChj5FT//wjZGAAGqjRiVlBfEL202HTSjBU/m8ZTgekSmWzVe67itwHV3mjZ1iSgY3KtyTvIG
	pNNVjG5wfjXIcXAUkoFsvShSgtiL18/fqaGIx7dR5e6gRanRdAhUcQSdcwlNI1zC5Qu1IekPnt0Q/
	+rZ30Erg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRZW-0000000C8ys-1EO0;
	Mon, 10 Aug 2026 15:05:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRZU-0000000C8yl-42PG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:05:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 442B0408D4;
	Mon, 10 Aug 2026 15:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55911F000E9;
	Mon, 10 Aug 2026 15:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786374348;
	bh=bDKmpmY7Cr/T6MuowvZnO5OrPdsRk6rOQ3ETEw6YAD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DWZlUAu6OC1W5I6uZ+M26dhOryKQtN9NZ0sHs2ZQX0DtlF3cdHKyCrkwb2icltFtf
	 tQqxQYC1k/+GYIh8TyI+NoRxCV9rr+bFJLPTjoaKWjK4RFvKD+sPmcp6Y6LSbn6HPe
	 H9pm7IFQwmjzz+4EOjY4byzDFF7um/MkMTwXphH/e8rYQ+T3Al0F/A8TN5YaJv0he/
	 UfbeTeT10rtLW7GlLrRpcK8dfVOnysv2OAxK5gy8uj39dd/MmT46hO0QWNmIrR1Yrp
	 s4t0674cD6q4wKF3fB+a7F7GsUSvMYZ/l4kBdhg1Rifp3d3E3Xi+02j5qxLCWVCviU
	 ARN+EIQQZnEvQ==
Date: Mon, 10 Aug 2026 16:05:42 +0100
From: Will Deacon <will@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH RFC] arm64: entry: PSTATE_I_SET is leaking on pseudo NMI
 mode
Message-ID: <annoxlkkq1NpujsP@willie-the-truck>
References: <20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org>
 <anXkO8YpoadRzm07@J2N7QTR9R3>
 <anXqMsJ14r3BAbMG@gmail.com>
 <anYHjvJ1_4dDjuzw@gmail.com>
 <anm5T9FazACqOWXF@willie-the-truck>
 <2a97f777-d33a-4b3d-8c8c-6f6894f04c29@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a97f777-d33a-4b3d-8c8c-6f6894f04c29@arm.com>
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

On Mon, Aug 10, 2026 at 01:42:15PM +0100, Vladimir Murzin wrote:
> On 8/10/26 12:43, Will Deacon wrote:
> > On Fri, Aug 07, 2026 at 09:29:12AM -0700, Breno Leitao wrote:
> >> On Fri, Aug 07, 2026 at 07:58:21AM -0700, Breno Leitao wrote:
> >>> Meanwhile, I will try to ftrace the writes to PMR and regs->pmr to get
> >>> a better grasp of the states machine we are in (probably on Monday).
> >> It seems LLM found a very easy to reproduce this:
> >>
> >> 	bash-5.1# dmesg
> >>
> >> 	bash-5.1#  cd /sys/kernel/tracing
> >> 	echo 'r:pmr vfs_read bad=+0($retval):u64' >> kprobe_events
> >> 	echo 1 > events/kprobes/pmr/enable
> > Nice, that triggers straightforwardly in QEMU for me. The diff below
> > (which implements my suggestion from [1]) seems to fix the issue, but
> > it would be good to hear feedback from one of the Arm folks.
> > 
> > [1] https://lore.kernel.org/all/anXgWRmcjwPKG7N5@willie-the-truck/
> > 
> > --->8
> > 
> > diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
> > index 795b35128467..691ee5f86dbe 100644
> > --- a/arch/arm64/include/asm/daifflags.h
> > +++ b/arch/arm64/include/asm/daifflags.h
> > @@ -132,7 +132,7 @@ static __always_inline void local_daif_inherit(struct pt_regs *regs)
> >                 trace_hardirqs_on();
> > 
> >         if (system_uses_irq_prio_masking())
> > -               gic_write_pmr(regs->pmr);
> > +               gic_write_pmr(regs->pmr & ~GIC_PRIO_PSR_I_SET);
> > 
> >         /*
> >          * We can't use local_daif_restore(regs->pstate) here as
> > 
> 
> I have no strong opinion on the change, but I struggle to see how it
> fits into the big picture.
> 
> Specifically, I have difficulty explaining this change in isolation.
> Everywhere else, we try to keep DAIF.I and GIC_PRIO_PSR_I_SET in sync,
> so it is not clear why we should allow them to go out of sync when
> inheriting the exception state from the previous context.

Yeah, I think you're right, and looking at it some more it means we
end up with the pmr in the IRQON state which will break
arch_irqs_disabled().

> At the same time, IIUC, the only reason we call local_irq_disable()
> (which also causes the states to become unsynchronized) in
> arm64_exit_to_kernel_mode() is for preemption path. So avoiding
> local_irq_disable() (and preemption) when we interrupted a
> non-preemptible context seems easier to follow.

In the past, we only preempted when returning to EL1 off the back of an
IRQ, but that was changed in ae654112eac0 ("arm64: entry: Use split
preemption logic") which I think is where this bug was introduced.

So we could probably hack something as you suggest, but maybe the best
option is to take patches 8 and 9 from your FEAT_NMI series? WDYT?

Will

