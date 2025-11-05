Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64882CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpPlZoOl7IabXK0X9/sSLWMUWGB9sumONnVZD/FBIYA=; b=aNPhzJMpLi++QprKaJd7frW5/i
	7mJhA/fFmZ50N5ZfKeaSlpZe+vJAbrXCnjheUXjSLdhAhS9iJfBVUWwUT2NAj3sHVv1m8Vl5rwnOE
	GvRqO2Wk83McLUKtZIF64yAUdu6ad7UpofABtGODsof5GOEwpRk3h5IlK7j24lbgi9XAAT/fMDCbp
	TxHwZLxHRgjgUICXD4B6+LlSKOgYRGDbAXVUPjENb0Si4VqNc38RHovefmHSg8ZD2nieVzB2KqV7y
	2hgs1VcSpPV6BWZ++LJ+AXoQo98lqNnzt4374viThwumA0c1XhiqkxPFPCBrWHdEfU3O9RndGjfHg
	wEbejtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgKZ-0000000E489-0YoO;
	Wed, 05 Nov 2025 16:25:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgKX-0000000E47p-3CwZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D277E60215;
	Wed,  5 Nov 2025 16:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BBBC116B1;
	Wed,  5 Nov 2025 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762359952;
	bh=G3m8tDEn6jVD0cr5Gp1rwvwl7UyEMdHtRYtaTdfC7yU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=pOW5ARcZv9+dYr4KlPTm3rUtb31/yvolifs20CAsTZVkKBstFI2X84sLbx2ko7LIo
	 t/+nww6iK0lhv3skgG12FajNtRn0jIuVEaVSo3rk6ZaqTp8ToGNkBL1XtUk7NrI4I8
	 RuC9wRI291hb9SrmSLT3o77kQraoNfwBzg1van1sDmXqDT4gXkMQo1+JzdXzC1olTz
	 c6J/WmcNxvJzqLxxaybol5vL9U11NhMwtx4ZFmh35gd5Zl/E3N2RcQ6VMsVT1hjeh3
	 PyQIgQ1kAW8sRhDdgoqnlmMhOyiuaMh974Qa54MT7Jj+MdUaFfWzAjcBLBNcGgmkUn
	 uZrd0G786pb6w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 202C0CE0B1D; Wed,  5 Nov 2025 08:25:51 -0800 (PST)
Date: Wed, 5 Nov 2025 08:25:51 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <8f7997f5-fdb3-443b-90be-3c68d796b416@paulmck-laptop>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQoyPox1DjlBT32O@arm.com>
 <d132771d-3a3f-486c-b674-de4ec976e929@paulmck-laptop>
 <174614f9-70f0-440e-ae68-dc5f540b8454@paulmck-laptop>
 <aQtufeFU-PAE6YDk@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQtufeFU-PAE6YDk@arm.com>
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

On Wed, Nov 05, 2025 at 03:34:21PM +0000, Catalin Marinas wrote:
> On Tue, Nov 04, 2025 at 12:10:36PM -0800, Paul E. McKenney wrote:
> > On Tue, Nov 04, 2025 at 10:43:02AM -0800, Paul E. McKenney wrote:
> > > On Tue, Nov 04, 2025 at 05:05:02PM +0000, Catalin Marinas wrote:
> > > > For the SRCU case, STADD especially together with the DMB after lock and
> > > > before unlock, executing it far does slow things down. A microbenchmark
> > > > doing this in a loop is a lot worse than it would appear in practice
> > > > (saturating buses down the path to memory).
> > > 
> > > In this srcu_read_lock_fast_updown() case, there was no DMB.  But for
> > > srcu_read_lock() and srcu_read_lock_nmisafe(), yes, there would be a DMB.
> > > (The srcu_read_lock_fast_updown() is new and is in my -rcu tree.)
> > > 
> > > > A quick test to check this theory, if that's the functions you were
> > > > benchmarking (it generates LDADD instead):
> > > 
> > > Thank you for digging into this!
> > 
> > And this_cpu_inc_return() does speed things up on my hardware to about
> > the same extent as did the prefetch instruction, so thank you again.
> > However, it gets me more than a 4x slowdown on x86, so I cannot make
> > this change in common code.
> 
> Definitely not suggesting that we use the 'return' variants in the
> generic code. More likely change the arm64 code to use them for the
> per-CPU atomics.

Whew!!!  ;-)

> > So, my thought is to push arm64-only this_cpu_inc_return() into SRCU via
> > something like this_cpu_inc_srcu(), but not for the upcoming merge window,
> > but the one after that, sticking with my current interrupt-disabling
> > non-atomic approach in the meantime (which gets me most of the benefit).
> > Alternatively, would it work for me to put that cache-prefetch instruction
> > into SRCU for arm64?  My guess is "absolutely not!", but I figured that
> > I should ask.
> 
> Given that this_cpu_*() are meant for the local CPU, there's less risk
> of cache line bouncing between CPUs, so I'm happy to change them to
> either use PRFM or LDADD (I think I prefer the latter). This would not
> be a generic change for the other atomics, only the per-CPU ones.

I have easy access to only the one type of ARM system, and of course
the choice must be driven by a wide range of systems.  But yes, it
would be much better if we can just use this_cpu_inc().  I will use the
non-atomics protected by interrupt disabling in the meantime, but look
forward to being able to switch back.

> > But if both of these approaches proves problematic, I might need some
> > way to distinguish between systems having slow LSE and those that do not.
> 
> It's not that systems have slow or fast atomics, more like they are slow
> or fast for specific use-cases. Their default behaviour may differ and
> at least in the Arm Ltd cases, this is configurable. An STADD executed
> in the L1 cache (near) may be better for your case and some
> microbenchmarks but not necessarily for others. I've heard of results of
> database use-cases where STADD executed far is better than LDADD
> executed near when the location is shared between multiple CPUs. In
> these cases even a PRFM can be problematic as it tends to bring a unique
> copy of the cacheline invalidating the others (well, again, microarch
> specific).

Fair point, and I do need to be careful not to read too much into the
results from my one type of system.  Plus, to your point elsewhere in
this thread, making the hardware better would be quite welcome as well.

> For the Arm Ltd implementations, I think the behaviour for most of the
> (recent) CPUs is that load atomics, CAS, SWP are executed near while the
> store atomics far (subject to configuration, errata, interconnect). Arm
> should probably provide some guidance here so that other implementers
> and software people know how/when to use them.

Or make the hardware figure out what to do automatically for each use
case as it executes.  Perhaps a bit utopian, but it is nevertheless a
good direction to aim for.

							Thanx, Paul

> -- 
> Catalin

