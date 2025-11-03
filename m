Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7CDCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 19:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyIQZeckruG54a+Nh6sbj5akESgvp9ezVzP4H0SsUZw=; b=KuzQg+6VDRUdTZ1Ub2wuNWbu+L
	s8sQP8brmbj2aftS9LzKZNaKtd65Txi0aSNoVAIv09dcngzz84tjZ5wzFYF1zThTCofy7SSJyCRk4
	N/Le4rqdVCcgKrNnrqzXmuVNb/s7b+eiCBTqQ8DICTr3elq6seSRu23iJ72eY8HuHu9FcNS77bs3d
	SMuPfK/Wg2wIeSYG3dFtErlh4ACcenybL/WBc3CMrAPMXEXHQOpIExJHn6IX2K30TTASufAKag4Wp
	0uESrCCFHJ2WSkVtUArs8U2hpwv3ET31j7EJrUl4iLJE8e3SQLWXPSW35Ihjd18SK0ek9upp5Ugg4
	xFFLxyhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG03v-0000000AX1p-2CBr;
	Mon, 03 Nov 2025 19:17:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG03u-0000000AX1i-09PN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 19:17:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8B3D60139;
	Mon,  3 Nov 2025 19:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E071C4CEE7;
	Mon,  3 Nov 2025 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762197471;
	bh=hXuE1VBaSY3RKRgphu5e9Wa0Cavk7sH93K8Brpnelhw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=cEeNuDTr1SboNVPsjO50nf9fbgya3TROP191it+xMY0GC6SUqqkeZSHuss3m/OFW1
	 rWuRFnTf6Mtuv12qSlGbiD03Rq6E6Wl+7KYuRVNdmNBhzsiusb0GHv5PitEUvqhEez
	 ZyprsnZuAHp8MVZ154qU3gCMzqvr7gHvnqhNMRTqvyO2zW2MynDG2+nuS2pdRtOaFv
	 +Yrem4yAAvxN9aMqqfUjCl2+Dd0xypZgu6aGCE619PdS9s8BGK5GrR/jSfEJjwIm4f
	 ACmB5v7t7iTvrEwgQYkzl+rek4TUUJ5lYi7WE+1NEjtwZ+t1rPIb8rmdj9HhuKs6MI
	 BKre6jda/c4bw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4330ACE0BB3; Mon,  3 Nov 2025 11:17:50 -0800 (PST)
Date: Mon, 3 Nov 2025 11:17:50 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	rostedt@goodmis.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH 17/19] srcu: Optimize SRCU-fast-updown for arm64
Message-ID: <8a33bf08-8ca4-4fc1-9481-fff2247e5518@paulmck-laptop>
References: <082fb8ba-91b8-448e-a472-195eb7b282fd@paulmck-laptop>
 <20251102214436.3905633-17-paulmck@kernel.org>
 <b2fb5a99-8dc2-440b-bf52-1dbcf3d7d9a7@efficios.com>
 <f89a3a56-e48a-4975-b67b-9387fe2e48c6@paulmck-laptop>
 <7cdecba1-2b30-4296-9862-3dd7bcc013d8@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cdecba1-2b30-4296-9862-3dd7bcc013d8@efficios.com>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Nov 03, 2025 at 01:16:23PM -0500, Mathieu Desnoyers wrote:
> On 2025-11-03 12:08, Paul E. McKenney wrote:
> > On Mon, Nov 03, 2025 at 08:34:10AM -0500, Mathieu Desnoyers wrote:
> [...]
> 
> > > One example is the libside (user level) rcu implementation which uses
> > > two counters per cpu [1]. One counter is the rseq fast path, and the
> > > second counter is for atomics (as fallback).
> > > 
> > > If the typical scenario we want to optimize for is thread context, we
> > > can probably remove the atomic from the fast path with just preempt off
> > > by partitioning the per-cpu counters further, one possibility being:
> > > 
> > > struct percpu_srcu_fast_pair {
> > > 	unsigned long lock, unlock;
> > > };
> > > 
> > > struct percpu_srcu_fast {
> > > 	struct percpu_srcu_fast_pair thread;
> > > 	struct percpu_srcu_fast_pair irq;
> > > };
> > > 
> > > And the grace period sums both thread and irq counters.
> > > 
> > > Thoughts ?
> > 
> > One complication here is that we need srcu_down_read() at task level
> > and the matching srcu_up_read() at softirq and/or hardirq level.
> > 
> > Or am I missing a trick in your proposed implementation?
> 
> I think you are indeed missing the crux of the solution here.
> 
> Each of task level and soft/hard irq level increments will be
> dispatched into different counters (thread vs irq). But the
> grace period will sum, for each the the two periods one after the
> next, the unlock counts and then the lock counts. It will consider
> the period as quiescent if the delta between the two sums is zero,
> e.g.
> 
>   (count[period].irq.unlock + count[period].thread.unlock -
>    count[period].irq.lock - count[period].thread.lock) == 0
> 
> so the sum does not care how the counters were incremented
> (it just does a load-relaxed), but each counter category
> have its own way of dealing with concurrency (thread: percpu
> ops, irq: atomics).
> 
> This is effectively a use of split-counters, but the split
> is across concurrency handling mechanisms rather than across
> CPUs.

Ah, got it, thank you!  But we would need an additional softirq counter,
correct?

I will keep this in my back pocket in case Catalin's and Yicong's prefetch
trick turns out to be problematic, and again, thank you!

							Thanx, Paul

