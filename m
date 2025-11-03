Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B95CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTXgO0JufSjQq4qun96irVM1W5U+5GeYXkP+g+Q0NvM=; b=Ty7uy+DfWTLqKXcUY1PslMJHvs
	r7Q7WNrkbXDySHCbjtl1nQIRwSGeiiQ62ZxhVQPm8CuOIXaME+jSbsHZJKu1xO+qbm6ZjR1X4e4li
	3DMMQOEmzAP44FYwzT8jgWXkm+WeAshZa2dpf8xLFV8XnOXXwkfbJQheq/9IoraHVqgMj0Lyi4AyY
	P1oFrAWqTWhGc/7ja8XnGBvYMFKD26XdrlM47u6TT72o3ANuhc3OX5LddunJqv2OfiGvTFfuvk3bP
	QEfhOsPN9Px59p80zyIR4YcvtmiJlW834J0ehYNOIIVEnEbmrffBXVwUkjtWN/ynFC6Cjl6JpzEdX
	jge1yhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxwc-0000000ANB3-0SuG;
	Mon, 03 Nov 2025 17:02:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxwZ-0000000ANAN-2ORu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:02:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D613419D6;
	Mon,  3 Nov 2025 17:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EC1C4CEE7;
	Mon,  3 Nov 2025 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762189324;
	bh=z4bhIkeLe61YGtNnfKtyj+dwQB2OwI+pXpuaZfbsQts=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=YIB6Mk+zbB+GuDbJ0vWKv4vitziT/ejEWmFLfRUmfVLCbHkCc1NoXbUQ8oUDIISbW
	 OXJnzt8GUPCdEfPwgjFVlp+q3Ey0IuWRWLoZ4jKpoqkVAkJYB7wkZVirI+P/T0gs1D
	 zczVjmrjN0XRrX1f0wHJcVNwPt5QBOk27UDLUfG52wRylaTiBLO+EVJGtAaZuiuoBz
	 x1xc4vd2DbaCB4HK2AweVplZg6GowNF6DcS1HSuCkioX7pDEJStFfU5wvE3vHPwrnl
	 xbCVvjZl4YCUbCIrIwQqVaAF7zn3C5GQBxFCXVdx5HheXwY2ZHhQDUnt4iWqfo4g94
	 +Mqb1OQrjIztQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 44EABCE0B94; Mon,  3 Nov 2025 09:02:02 -0800 (PST)
Date: Mon, 3 Nov 2025 09:02:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	rostedt@goodmis.org, Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH 17/19] srcu: Optimize SRCU-fast-updown for arm64
Message-ID: <c598e85a-4008-4ca7-a424-80c324523bbb@paulmck-laptop>
References: <082fb8ba-91b8-448e-a472-195eb7b282fd@paulmck-laptop>
 <20251102214436.3905633-17-paulmck@kernel.org>
 <aQilZAXQv2P-b2eI@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQilZAXQv2P-b2eI@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_090211_651154_9EC66B8B 
X-CRM114-Status: GOOD (  28.52  )
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

On Mon, Nov 03, 2025 at 12:51:48PM +0000, Will Deacon wrote:
> Hi Paul,
> 
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

In my testing Catalin's patch wins by at least 10% on microbenchmarks.
So I am holding this one in my back pocket just in case, but yes, you
should ignore it, hopefully forever.  ;-)

							Thanx, Paul

