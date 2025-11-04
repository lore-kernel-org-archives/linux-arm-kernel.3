Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45BACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UE3apgf+4TQiDayowreOjC+/qFoSDZmC/C8kJtAD/kU=; b=FKzeh1YWjkgXDq5u3zW2rkoWv4
	ZRCCIWLGy6ht3W33ynMnM24ho0mqZDUKwWi+CSy3OEBNgbU6xZj/QiYkr2XtC2mzDzRaRnzEU4S5D
	DvlI+velbZKvkwUBPOyOAZiBrlOoY+d6szqG/IVPyt0yRK4BE/VQYn8tUhagdFGyJS9eSvSe8rG4O
	8kI8fjVaBgE472s0BpghumUWwxqP8S5juIowW3ri6RcsIvLYesWCuv8DUbGFCtBBEuJ7wPLhhwa2q
	R7kbYsPZdsxwCyFGjOVgX11d6l9i/wMvo1s/cpQB96duvQcLggf0e/cPvP1fYHzQQztTRlsnEiy7k
	M7j6cbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLzn-0000000CRAr-1Nsa;
	Tue, 04 Nov 2025 18:43:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLzl-0000000CRAf-0XrR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:43:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40D62601EC;
	Tue,  4 Nov 2025 18:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC40C4CEF7;
	Tue,  4 Nov 2025 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762281783;
	bh=p5gPxvZwjTtiYWUDQITB0IZvUrPLRaazjaVBauekS8w=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=cyLCzPQpaoTkN09wTQaWglC/VC/eUTtvNtOlZxQswQflWbJPSbqL03o2P8ScQO1zk
	 y5MiUNL1KVwNiWXjsgDCjtx4zqJ463q2p5D7BAnQePNB8jQc4geNa22lZ9qp5wjsuT
	 mKS9zdoTXeH9ih6oTLGpk7LOEivJOTxouwGjpyiXmz+VVuKe16z3AEluzqXGswaGAu
	 Jh2vYMqaPJwM5GuzyCNmC99D/+W2tOzT37QCtiAu3+S8DU2DFODnKVHGAYCVdfQhYT
	 XORMm/syJdRVc30D5VJt0l3/n3argYO7LYKz4vs/F6VV9W2H9t/vojXj+mmmkjrazz
	 6TQfUitug3ebA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B5434CE0BB3; Tue,  4 Nov 2025 10:43:02 -0800 (PST)
Date: Tue, 4 Nov 2025 10:43:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <d132771d-3a3f-486c-b674-de4ec976e929@paulmck-laptop>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQoyPox1DjlBT32O@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQoyPox1DjlBT32O@arm.com>
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

On Tue, Nov 04, 2025 at 05:05:02PM +0000, Catalin Marinas wrote:
> On Fri, Oct 31, 2025 at 08:25:07PM -0700, Paul E. McKenney wrote:
> > On Fri, Oct 31, 2025 at 04:38:57PM -0700, Paul E. McKenney wrote:
> > > On Fri, Oct 31, 2025 at 10:43:35PM +0000, Catalin Marinas wrote:
> > > > diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> > > > index 9abcc8ef3087..e381034324e1 100644
> > > > --- a/arch/arm64/include/asm/percpu.h
> > > > +++ b/arch/arm64/include/asm/percpu.h
> > > > @@ -70,6 +70,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
> > > >  	unsigned int loop;						\
> > > >  	u##sz tmp;							\
> > > >  									\
> > > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > > >  	/* LL/SC */							\
> > > >  	"1:	ldxr" #sfx "\t%" #w "[tmp], %[ptr]\n"			\
> > > > @@ -91,6 +92,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
> > > >  	unsigned int loop;						\
> > > >  	u##sz ret;							\
> > > >  									\
> > > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > > >  	/* LL/SC */							\
> > > >  	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
> > > > -----------------8<------------------------
> > > 
> > > I will give this a shot, thank you!
> > 
> > Jackpot!!!
> > 
> > This reduces the overhead to 8.427, which is significantly better than
> > the non-LSE value of 9.853.  Still room for improvement, but much
> > better than the 100ns values.
> > 
> > I presume that you will send this up the normal path, but in the meantime,
> > I will pull this in for further local testing, and thank you!
> 
> After an educative discussion with the microarchitects, I think the
> hardware is behaving as intended, it just doesn't always fit the
> software use-cases ;). this_cpu_add() etc. (and atomic_add()) end up in
> Linux as a STADD instruction (that's LDADD with XZR as destination; i.e.
> no need to return the value read from memory). This is typically
> executed as "far" or posted (unless it hits in the L1 cache) and
> intended for stat updates. At a quick grep, it matches the majority of
> the use-cases in Linux. Most other atomics (those with a return) are
> executed "near", so filling the cache lines (assuming default CPUECTLR
> configuration).

OK...

> For the SRCU case, STADD especially together with the DMB after lock and
> before unlock, executing it far does slow things down. A microbenchmark
> doing this in a loop is a lot worse than it would appear in practice
> (saturating buses down the path to memory).

In this srcu_read_lock_fast_updown() case, there was no DMB.  But for
srcu_read_lock() and srcu_read_lock_nmisafe(), yes, there would be a DMB.
(The srcu_read_lock_fast_updown() is new and is in my -rcu tree.)

> A quick test to check this theory, if that's the functions you were
> benchmarking (it generates LDADD instead):

Thank you for digging into this!

> ---------------------8<----------------------------------------
> diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> index 42098e0fa0b7..5a6f3999883d 100644
> --- a/include/linux/srcutree.h
> +++ b/include/linux/srcutree.h
> @@ -263,7 +263,7 @@ static inline struct srcu_ctr __percpu notrace *__srcu_read_lock_fast(struct src
>  	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
>  
>  	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
> -		this_cpu_inc(scp->srcu_locks.counter); // Y, and implicit RCU reader.
> +		this_cpu_inc_return(scp->srcu_locks.counter); // Y, and implicit RCU reader.
>  	else
>  		atomic_long_inc(raw_cpu_ptr(&scp->srcu_locks));  // Y, and implicit RCU reader.
>  	barrier(); /* Avoid leaking the critical section. */
> @@ -284,7 +284,7 @@ __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
>  {
>  	barrier();  /* Avoid leaking the critical section. */
>  	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
> -		this_cpu_inc(scp->srcu_unlocks.counter);  // Z, and implicit RCU reader.
> +		this_cpu_inc_return(scp->srcu_unlocks.counter);  // Z, and implicit RCU reader.
>  	else
>  		atomic_long_inc(raw_cpu_ptr(&scp->srcu_unlocks));  // Z, and implicit RCU reader.
>  }
> diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> index 1ff94b76d91f..c025d9135689 100644
> --- a/kernel/rcu/srcutree.c
> +++ b/kernel/rcu/srcutree.c
> @@ -753,7 +753,7 @@ int __srcu_read_lock(struct srcu_struct *ssp)
>  {
>  	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
>  
> -	this_cpu_inc(scp->srcu_locks.counter);
> +	this_cpu_inc_return(scp->srcu_locks.counter);
>  	smp_mb(); /* B */  /* Avoid leaking the critical section. */
>  	return __srcu_ptr_to_ctr(ssp, scp);
>  }
> @@ -767,7 +767,7 @@ EXPORT_SYMBOL_GPL(__srcu_read_lock);
>  void __srcu_read_unlock(struct srcu_struct *ssp, int idx)
>  {
>  	smp_mb(); /* C */  /* Avoid leaking the critical section. */
> -	this_cpu_inc(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks.counter);
> +	this_cpu_inc_return(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks.counter);
>  }
>  EXPORT_SYMBOL_GPL(__srcu_read_unlock);
>  
> ---------------------8<----------------------------------------
> 
> To make things better for the non-fast variants above, we should add
> this_cpu_inc_return_acquire() etc. semantics (strangely,
> this_cpu_inc_return() doesn't have full barrier semantics as
> atomic_inc_return()).
> 
> I'm not sure about adding the prefetch since most other uses of
> this_cpu_add() are meant for stat updates and there's not much point in
> brining in a cache line. I think we could add release/acquire variants
> that generate LDADDA/L and maybe a slightly different API for the
> __srcu_*_fast() - or use a new this_cpu_add_return_relaxed() if we add
> full barrier semantics to the current _return() variants.

But other architectures might well have this_cpu_inc_return() running
more slowly than this_cpu_inc().  So my thought would be to make a
this_cpu_inc_srcu() that mapped to this_cpu_inc_return() on arm64 and
this_cpu_inc() elsewhere.

I could imagine this_cpu_inc_local() or some such, but it is not clear
that the added API explosion is yet justified.

Or is there a better way?

							Thanx, Paul

