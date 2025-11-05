Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E31CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++09DX5Kr/cWbiaoDWd6CXQyso+aKi4c8sdLh6Pg8e0=; b=xsO1TisAPOQW27D/URuFPdpwOz
	7+EbNRQHzouJ6Dr8tI7KBbA6u1Y67i3CwP9qN+uIG4igJIzbr9RegGLztJ4H2PqSl3TxTBcz1cklA
	cGyVY/8tCBVeqtHrMy8DUkSwdZ1bEQ+DthjFCSge/HAt40Injx4v20L6XsIdejpBTJopTKtmJv0OG
	vUZ5wSWui7DxBjOnVHwMQ5g96wJ9CJotVjcM9B2Mepa0jHoDEvwRKL1BDiXkpj18k2MMggAArLNxv
	9r3a0XBvYUEkraA5FBeFPG4HoQat5jQDZx2VivZ6oGphHO9yQLjsQZPzz1L3fulh5sR6jD1qVf5ZK
	fi4Rk8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfWl-0000000Dwva-1btO;
	Wed, 05 Nov 2025 15:34:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfWj-0000000Dwuk-0Bgm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:34:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2C8514BF;
	Wed,  5 Nov 2025 07:34:16 -0800 (PST)
Received: from arm.com (unknown [10.1.26.217])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB02A3F63F;
	Wed,  5 Nov 2025 07:34:23 -0800 (PST)
Date: Wed, 5 Nov 2025 15:34:21 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQtufeFU-PAE6YDk@arm.com>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQoyPox1DjlBT32O@arm.com>
 <d132771d-3a3f-486c-b674-de4ec976e929@paulmck-laptop>
 <174614f9-70f0-440e-ae68-dc5f540b8454@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174614f9-70f0-440e-ae68-dc5f540b8454@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_073425_340081_99B33E8C 
X-CRM114-Status: GOOD (  29.54  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 04, 2025 at 12:10:36PM -0800, Paul E. McKenney wrote:
> On Tue, Nov 04, 2025 at 10:43:02AM -0800, Paul E. McKenney wrote:
> > On Tue, Nov 04, 2025 at 05:05:02PM +0000, Catalin Marinas wrote:
> > > For the SRCU case, STADD especially together with the DMB after lock and
> > > before unlock, executing it far does slow things down. A microbenchmark
> > > doing this in a loop is a lot worse than it would appear in practice
> > > (saturating buses down the path to memory).
> > 
> > In this srcu_read_lock_fast_updown() case, there was no DMB.  But for
> > srcu_read_lock() and srcu_read_lock_nmisafe(), yes, there would be a DMB.
> > (The srcu_read_lock_fast_updown() is new and is in my -rcu tree.)
> > 
> > > A quick test to check this theory, if that's the functions you were
> > > benchmarking (it generates LDADD instead):
> > 
> > Thank you for digging into this!
> 
> And this_cpu_inc_return() does speed things up on my hardware to about
> the same extent as did the prefetch instruction, so thank you again.
> However, it gets me more than a 4x slowdown on x86, so I cannot make
> this change in common code.

Definitely not suggesting that we use the 'return' variants in the
generic code. More likely change the arm64 code to use them for the
per-CPU atomics.

> So, my thought is to push arm64-only this_cpu_inc_return() into SRCU via
> something like this_cpu_inc_srcu(), but not for the upcoming merge window,
> but the one after that, sticking with my current interrupt-disabling
> non-atomic approach in the meantime (which gets me most of the benefit).
> Alternatively, would it work for me to put that cache-prefetch instruction
> into SRCU for arm64?  My guess is "absolutely not!", but I figured that
> I should ask.

Given that this_cpu_*() are meant for the local CPU, there's less risk
of cache line bouncing between CPUs, so I'm happy to change them to
either use PRFM or LDADD (I think I prefer the latter). This would not
be a generic change for the other atomics, only the per-CPU ones.

> But if both of these approaches proves problematic, I might need some
> way to distinguish between systems having slow LSE and those that do not.

It's not that systems have slow or fast atomics, more like they are slow
or fast for specific use-cases. Their default behaviour may differ and
at least in the Arm Ltd cases, this is configurable. An STADD executed
in the L1 cache (near) may be better for your case and some
microbenchmarks but not necessarily for others. I've heard of results of
database use-cases where STADD executed far is better than LDADD
executed near when the location is shared between multiple CPUs. In
these cases even a PRFM can be problematic as it tends to bring a unique
copy of the cacheline invalidating the others (well, again, microarch
specific).

For the Arm Ltd implementations, I think the behaviour for most of the
(recent) CPUs is that load atomics, CAS, SWP are executed near while the
store atomics far (subject to configuration, errata, interconnect). Arm
should probably provide some guidance here so that other implementers
and software people know how/when to use them.

-- 
Catalin

