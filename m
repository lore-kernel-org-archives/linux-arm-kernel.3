Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA71BCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMHYVRQscitphGbSmvrYN8Sjl2UCr/kek2Zu546FlnI=; b=SdvouqCl0twEOSecH37n2nXsSK
	cG6TvafupESfoyxWIg6awcHsHkjs9/KjxithCXrN9Ma0iYn/asmVjaq/rzji1K+o5U2tVdbEonNhh
	RmDd19McQVHuJYW2Ju1VFzMj3rcpYXu99AgnXyp4RLtbIgeiqxIvvs5dOPz4H3GHn9bt5N+2/gVa4
	j9+DBK0XlR/US3Jr1zdYFbLJXGGhk+8i07ZyDnrpt7qRFT4KsllvKN5dxGfASY+t86fnI7PSO7U3/
	4RQQK63CFQHlupz7hWufZO8FKZlufzKQwL97+rJlMxDhm+k0Ig/g2bOZL9RwN0+JIHEMPy29f/5/W
	P6rfx8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvDP-00000009zgN-112x;
	Mon, 03 Nov 2025 14:07:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvDN-00000009zff-3s3j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:07:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA20F6013E;
	Mon,  3 Nov 2025 14:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666F7C4CEE7;
	Mon,  3 Nov 2025 14:07:18 +0000 (UTC)
Date: Mon, 3 Nov 2025 14:07:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	rostedt@goodmis.org, Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH 17/19] srcu: Optimize SRCU-fast-updown for arm64
Message-ID: <aQi3E-3hoNWYocOl@arm.com>
References: <082fb8ba-91b8-448e-a472-195eb7b282fd@paulmck-laptop>
 <20251102214436.3905633-17-paulmck@kernel.org>
 <aQilZAXQv2P-b2eI@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQilZAXQv2P-b2eI@willie-the-truck>
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

On Mon, Nov 03, 2025 at 12:51:48PM +0000, Will Deacon wrote:
> On Sun, Nov 02, 2025 at 01:44:34PM -0800, Paul E. McKenney wrote:
> > Some arm64 platforms have slow per-CPU atomic operations, for example,
> > the Neoverse V2.  This commit therefore moves SRCU-fast from per-CPU
> > atomic operations to interrupt-disabled non-read-modify-write-atomic
> > atomic_read()/atomic_set() operations.  This works because
> > SRCU-fast-updown is not invoked from read-side primitives, which
> > means that if srcu_read_unlock_fast() NMI handlers.  This means that
> > srcu_read_lock_fast_updown() and srcu_read_unlock_fast_updown() can
> > exclude themselves and each other
> > 
> > This reduces the overhead of calls to srcu_read_lock_fast_updown() and
> > srcu_read_unlock_fast_updown() from about 100ns to about 12ns on an ARM
> > Neoverse V2.  Although this is not excellent compared to about 2ns on x86,
> > it sure beats 100ns.
> > 
> > This command was used to measure the overhead:
> > 
> > tools/testing/selftests/rcutorture/bin/kvm.sh --torture refscale --allcpus --duration 5 --configs NOPREEMPT --kconfig "CONFIG_NR_CPUS=64 CONFIG_TASKS_TRACE_RCU=y" --bootargs "refscale.loops=100000 refscale.guest_os_delay=5 refscale.nreaders=64 refscale.holdoff=30 torture.disable_onoff_at_boot refscale.scale_type=srcu-fast-updown refscale.verbose_batched=8 torture.verbose_sleep_frequency=8 torture.verbose_sleep_duration=8 refscale.nruns=100" --trust-make
> > 
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Cc: <linux-arm-kernel@lists.infradead.org>
> > Cc: <bpf@vger.kernel.org>
> > ---
> >  include/linux/srcutree.h | 56 ++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 51 insertions(+), 5 deletions(-)
> 
> [...]
> 
> > @@ -327,12 +355,23 @@ __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
> >  static inline
> >  struct srcu_ctr __percpu notrace *__srcu_read_lock_fast_updown(struct srcu_struct *ssp)
> >  {
> > -	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
> > +	struct srcu_ctr __percpu *scp;
> >  
> > -	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
> > +	if (IS_ENABLED(CONFIG_ARM64) && IS_ENABLED(CONFIG_ARM64_USE_LSE_PERCPU_ATOMICS)) {
> > +		unsigned long flags;
> > +
> > +		local_irq_save(flags);
> > +		scp = __srcu_read_lock_fast_na(ssp);
> > +		local_irq_restore(flags); /* Avoids leaking the critical section. */
> > +		return scp;
> > +	}
> 
> Do we still need to pursue this after Catalin's prefetch suggestion for the
> per-cpu atomics?
> 
> https://lore.kernel.org/r/aQU7l-qMKJTx4znJ@arm.com
> 
> Although disabling/enabling interrupts on your system seems to be
> significantly faster than an atomic instruction, I'm worried that it's
> all very SoC-specific and on a mobile part (especially with pseudo-NMI),
> the relative costs could easily be the other way around.

My preference would be to go for the percpu atomic prefetch but we'd
need to do a bit of benchmarking to see we don't break other platforms
(unlikely though).

-- 
Catalin

