Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D754CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 20:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbJTG7c9VjlSzBjWZMoAV6APMNdMi+bJT4kSBPFUFNk=; b=p2SGFOsgmNdDYz+VDB3qNzKkDG
	Nq1L79iPo1wVQFwbad4Mdb/1MaqLTFA7c1WUfe2h553vOKnvzDu+U3xWyNSBUKex5s/KikIxtR9GZ
	aGP+bYEPpAUNzsEO3VZdmniZKFfZPU1/Jp5mfQRfAFbbdXoMoV1mDzZKAtGJtmPF9MJH3DJ7zrTYu
	HwObTWVqcLaqJs0CQgOZn00x17pVNdfwAMMSu9IXMsZicOHsyP8eFh5zQ1yRAXc8R5qX9iKILMUTs
	CiH2GU0rJgqyOIJ5k94oSOM1vm54NnjIMQTwYdY6IbnhHzN2ufvVabKAVpoqBHOQRWkfR9vngrYRl
	GRPXPHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNMX-0000000CWb7-1r85;
	Tue, 04 Nov 2025 20:10:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNMV-0000000CWak-0Ic9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 20:10:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83FD244070;
	Tue,  4 Nov 2025 20:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F35C4CEF7;
	Tue,  4 Nov 2025 20:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762287037;
	bh=yhqeCuK7vscwd9qy1eg+ADsex3is+LwTme6/sQh/Co0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hYYzCJ9+n1laop8VRxu2iEbxxy4Zu2weUy+1NvyoRhKp25YX7DHQiueCIqwEIGJwL
	 FDN+DqfI7spV7s8aADtD3a6OBJen+sfb09jWmQA19++2vGF45h0a5cfQW3wNoCzQSZ
	 7zQIjfnldlA+dZbs3ODJM7wcJi1UIXNSpKJvEvMuymHlWeZH08vU2O6GtyFWK4WMIs
	 8vZZ0tRdpC6UvgUCL5nap3DUkPjHWTB6MEL22TMIWU0NYJp3j6GuOza/XC+3j+wBx7
	 q7frwj65F0lpoIkvWsRhdD9KyjsNFrYrLkWcCu2g9xou21MR0x5TiDn3RVhm3au8xj
	 BZAfm3qjM7Log==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2ED1ACE10DA; Tue,  4 Nov 2025 12:10:36 -0800 (PST)
Date: Tue, 4 Nov 2025 12:10:36 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <174614f9-70f0-440e-ae68-dc5f540b8454@paulmck-laptop>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQoyPox1DjlBT32O@arm.com>
 <d132771d-3a3f-486c-b674-de4ec976e929@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d132771d-3a3f-486c-b674-de4ec976e929@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_121039_175076_2C8519D9 
X-CRM114-Status: GOOD (  46.31  )
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

On Tue, Nov 04, 2025 at 10:43:02AM -0800, Paul E. McKenney wrote:
> On Tue, Nov 04, 2025 at 05:05:02PM +0000, Catalin Marinas wrote:
> > On Fri, Oct 31, 2025 at 08:25:07PM -0700, Paul E. McKenney wrote:
> > > On Fri, Oct 31, 2025 at 04:38:57PM -0700, Paul E. McKenney wrote:
> > > > On Fri, Oct 31, 2025 at 10:43:35PM +0000, Catalin Marinas wrote:
> > > > > diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> > > > > index 9abcc8ef3087..e381034324e1 100644
> > > > > --- a/arch/arm64/include/asm/percpu.h
> > > > > +++ b/arch/arm64/include/asm/percpu.h
> > > > > @@ -70,6 +70,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
> > > > >  	unsigned int loop;						\
> > > > >  	u##sz tmp;							\
> > > > >  									\
> > > > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > > > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > > > >  	/* LL/SC */							\
> > > > >  	"1:	ldxr" #sfx "\t%" #w "[tmp], %[ptr]\n"			\
> > > > > @@ -91,6 +92,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
> > > > >  	unsigned int loop;						\
> > > > >  	u##sz ret;							\
> > > > >  									\
> > > > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > > > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > > > >  	/* LL/SC */							\
> > > > >  	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
> > > > > -----------------8<------------------------
> > > > 
> > > > I will give this a shot, thank you!
> > > 
> > > Jackpot!!!
> > > 
> > > This reduces the overhead to 8.427, which is significantly better than
> > > the non-LSE value of 9.853.  Still room for improvement, but much
> > > better than the 100ns values.
> > > 
> > > I presume that you will send this up the normal path, but in the meantime,
> > > I will pull this in for further local testing, and thank you!
> > 
> > After an educative discussion with the microarchitects, I think the
> > hardware is behaving as intended, it just doesn't always fit the
> > software use-cases ;). this_cpu_add() etc. (and atomic_add()) end up in
> > Linux as a STADD instruction (that's LDADD with XZR as destination; i.e.
> > no need to return the value read from memory). This is typically
> > executed as "far" or posted (unless it hits in the L1 cache) and
> > intended for stat updates. At a quick grep, it matches the majority of
> > the use-cases in Linux. Most other atomics (those with a return) are
> > executed "near", so filling the cache lines (assuming default CPUECTLR
> > configuration).
> 
> OK...
> 
> > For the SRCU case, STADD especially together with the DMB after lock and
> > before unlock, executing it far does slow things down. A microbenchmark
> > doing this in a loop is a lot worse than it would appear in practice
> > (saturating buses down the path to memory).
> 
> In this srcu_read_lock_fast_updown() case, there was no DMB.  But for
> srcu_read_lock() and srcu_read_lock_nmisafe(), yes, there would be a DMB.
> (The srcu_read_lock_fast_updown() is new and is in my -rcu tree.)
> 
> > A quick test to check this theory, if that's the functions you were
> > benchmarking (it generates LDADD instead):
> 
> Thank you for digging into this!

And this_cpu_inc_return() does speed things up on my hardware to about
the same extent as did the prefetch instruction, so thank you again.
However, it gets me more than a 4x slowdown on x86, so I cannot make
this change in common code.

So, my thought is to push arm64-only this_cpu_inc_return() into SRCU via
something like this_cpu_inc_srcu(), but not for the upcoming merge window,
but the one after that, sticking with my current interrupt-disabling
non-atomic approach in the meantime (which gets me most of the benefit).
Alternatively, would it work for me to put that cache-prefetch instruction
into SRCU for arm64?  My guess is "absolutely not!", but I figured that
I should ask.

But if both of these approaches proves problematic, I might need some
way to distinguish between systems having slow LSE and those that do not.
Or I can stick with disabling interrupts across non-atomic updates.

Thoughts?

							Thanx, Paul

> > ---------------------8<----------------------------------------
> > diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> > index 42098e0fa0b7..5a6f3999883d 100644
> > --- a/include/linux/srcutree.h
> > +++ b/include/linux/srcutree.h
> > @@ -263,7 +263,7 @@ static inline struct srcu_ctr __percpu notrace *__srcu_read_lock_fast(struct src
> >  	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
> >  
> >  	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
> > -		this_cpu_inc(scp->srcu_locks.counter); // Y, and implicit RCU reader.
> > +		this_cpu_inc_return(scp->srcu_locks.counter); // Y, and implicit RCU reader.
> >  	else
> >  		atomic_long_inc(raw_cpu_ptr(&scp->srcu_locks));  // Y, and implicit RCU reader.
> >  	barrier(); /* Avoid leaking the critical section. */
> > @@ -284,7 +284,7 @@ __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
> >  {
> >  	barrier();  /* Avoid leaking the critical section. */
> >  	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
> > -		this_cpu_inc(scp->srcu_unlocks.counter);  // Z, and implicit RCU reader.
> > +		this_cpu_inc_return(scp->srcu_unlocks.counter);  // Z, and implicit RCU reader.
> >  	else
> >  		atomic_long_inc(raw_cpu_ptr(&scp->srcu_unlocks));  // Z, and implicit RCU reader.
> >  }
> > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > index 1ff94b76d91f..c025d9135689 100644
> > --- a/kernel/rcu/srcutree.c
> > +++ b/kernel/rcu/srcutree.c
> > @@ -753,7 +753,7 @@ int __srcu_read_lock(struct srcu_struct *ssp)
> >  {
> >  	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
> >  
> > -	this_cpu_inc(scp->srcu_locks.counter);
> > +	this_cpu_inc_return(scp->srcu_locks.counter);
> >  	smp_mb(); /* B */  /* Avoid leaking the critical section. */
> >  	return __srcu_ptr_to_ctr(ssp, scp);
> >  }
> > @@ -767,7 +767,7 @@ EXPORT_SYMBOL_GPL(__srcu_read_lock);
> >  void __srcu_read_unlock(struct srcu_struct *ssp, int idx)
> >  {
> >  	smp_mb(); /* C */  /* Avoid leaking the critical section. */
> > -	this_cpu_inc(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks.counter);
> > +	this_cpu_inc_return(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks.counter);
> >  }
> >  EXPORT_SYMBOL_GPL(__srcu_read_unlock);
> >  
> > ---------------------8<----------------------------------------
> > 
> > To make things better for the non-fast variants above, we should add
> > this_cpu_inc_return_acquire() etc. semantics (strangely,
> > this_cpu_inc_return() doesn't have full barrier semantics as
> > atomic_inc_return()).
> > 
> > I'm not sure about adding the prefetch since most other uses of
> > this_cpu_add() are meant for stat updates and there's not much point in
> > brining in a cache line. I think we could add release/acquire variants
> > that generate LDADDA/L and maybe a slightly different API for the
> > __srcu_*_fast() - or use a new this_cpu_add_return_relaxed() if we add
> > full barrier semantics to the current _return() variants.
> 
> But other architectures might well have this_cpu_inc_return() running
> more slowly than this_cpu_inc().  So my thought would be to make a
> this_cpu_inc_srcu() that mapped to this_cpu_inc_return() on arm64 and
> this_cpu_inc() elsewhere.
> 
> I could imagine this_cpu_inc_local() or some such, but it is not clear
> that the added API explosion is yet justified.
> 
> Or is there a better way?
> 
> 							Thanx, Paul

