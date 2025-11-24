Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B48ACFD365
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 22:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81ZZyTqpr/VTRgjV5SNyhefBc8GXmhSu3D/xLVl/wcc=; b=EFRNGM8nYRy7gjxfBfPXX2Dp03
	GGYrTABoBz7fqQ0HGBI+OGwgf8Z0aM/IJ3Hbnxr1ZvOqVFklsjBfmKAadqpRn/mEnXDtnUK8M9SqZ
	EQnLfaEFyi07Y2layOv4gEpxxALQ/DjJqsGPKHWQDCSZrlrt/1Hqexz0/XgE/OYxbjNH9w5XojPmy
	xEhgVK4QSRbjDwz07AVRmyePeNFE1kOw2aRylKhcx0IQ7eFOw2UaJmn/ccwo4HYPJcPQZzsLqj7tH
	ZP7bz+UeL/RMR1W2FTSVix9dc7h0WqD4sNFjv+YsdCBgoz5Xx5y6ubmbzGNOMuHKGcYD7S9AcK7U3
	ox0R3WHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNfLR-0000000CPjD-2mVT;
	Mon, 24 Nov 2025 22:47:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNfLP-0000000CPim-1Lin
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 22:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3017343D17;
	Mon, 24 Nov 2025 22:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D94C4CEF1;
	Mon, 24 Nov 2025 22:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764024458;
	bh=2wy8ehXzr9jvFTSWp5rIJ9UVgYX28BfvWePNf2TNPXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qgc6Wl7aaPK5/FaCkyrpsXlSpoMlG/loLGZakm6F7R/Avo/8iLoiyZ9fxVQpSlG9z
	 oCtri/77Aw2AgHimvGWZmU38fkY5E1Fl+N3XqFftGKXG0bm7r1hAD3H4k0aq8isnxf
	 EZh4reQ/TZs8uWbsdLFkioZ/0ohC0M6uiWczaG/Xgc0jtlT2wMdczPyXl5LeQuqCXU
	 62d9EjQa+SPj8DzsRnXQSaXlb5px6GCu8dCV+QUca9b33WycMwa0zspke6DBt6/fkL
	 /KN6Ts77sXkz5XtubqTfCDeQZ+2KmzwratNuYN4FhmWDXlxIr5h0CoMv2pBhuflKKA
	 b7U0Bq1vElYYA==
Date: Mon, 24 Nov 2025 23:47:35 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Will Deacon <will@kernel.org>, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	rostedt@goodmis.org, Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 15/16] srcu: Optimize SRCU-fast-updown for arm64
Message-ID: <aSTgh8B0SiKz2t5c@pavilion.home>
References: <bb177afd-eea8-4a2a-9600-e36ada26a500@paulmck-laptop>
 <20251105203216.2701005-15-paulmck@kernel.org>
 <aQ9AoauJKLYeYvrn@willie-the-truck>
 <d53a5852-f84a-4dae-9bf4-312751880452@paulmck-laptop>
 <aRHLV8lLX0fxQICR@willie-the-truck>
 <ab6cd1c2-39c5-4b39-9585-6123835a6229@paulmck-laptop>
 <aSRX1HKNdks5pHsd@willie-the-truck>
 <c632fb32-dccb-4c61-9b2e-d0c2b55fb2e4@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c632fb32-dccb-4c61-9b2e-d0c2b55fb2e4@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_144739_402880_96705E5E 
X-CRM114-Status: GOOD (  31.99  )
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

Le Mon, Nov 24, 2025 at 09:20:25AM -0800, Paul E. McKenney a écrit :
> On Mon, Nov 24, 2025 at 01:04:20PM +0000, Will Deacon wrote:
> > On Mon, Nov 10, 2025 at 09:29:43AM -0800, Paul E. McKenney wrote:
> > > On Mon, Nov 10, 2025 at 11:24:07AM +0000, Will Deacon wrote:
> > > > On Sat, Nov 08, 2025 at 10:38:32AM -0800, Paul E. McKenney wrote:
> > > > > On Sat, Nov 08, 2025 at 01:07:45PM +0000, Will Deacon wrote:
> > > > > > On Wed, Nov 05, 2025 at 12:32:15PM -0800, Paul E. McKenney wrote:
> > > > > > > Some arm64 platforms have slow per-CPU atomic operations, for example,
> > > > > > > the Neoverse V2.  This commit therefore moves SRCU-fast from per-CPU
> > > > > > > atomic operations to interrupt-disabled non-read-modify-write-atomic
> > > > > > > atomic_read()/atomic_set() operations.  This works because
> > > > > > > SRCU-fast-updown is not invoked from read-side primitives, which
> > > > > > > means that if srcu_read_unlock_fast() NMI handlers.  This means that
> > > > > > > srcu_read_lock_fast_updown() and srcu_read_unlock_fast_updown() can
> > > > > > > exclude themselves and each other
> > > > > > > 
> > > > > > > This reduces the overhead of calls to srcu_read_lock_fast_updown() and
> > > > > > > srcu_read_unlock_fast_updown() from about 100ns to about 12ns on an ARM
> > > > > > > Neoverse V2.  Although this is not excellent compared to about 2ns on x86,
> > > > > > > it sure beats 100ns.
> > > > > > > 
> > > > > > > This command was used to measure the overhead:
> > > > > > > 
> > > > > > > tools/testing/selftests/rcutorture/bin/kvm.sh --torture refscale --allcpus --duration 5 --configs NOPREEMPT --kconfig "CONFIG_NR_CPUS=64 CONFIG_TASKS_TRACE_RCU=y" --bootargs "refscale.loops=100000 refscale.guest_os_delay=5 refscale.nreaders=64 refscale.holdoff=30 torture.disable_onoff_at_boot refscale.scale_type=srcu-fast-updown refscale.verbose_batched=8 torture.verbose_sleep_frequency=8 torture.verbose_sleep_duration=8 refscale.nruns=100" --trust-make
> > > > > > > 
> > > > > > > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > > > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > > > > Cc: Will Deacon <will@kernel.org>
> > > > > > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > > > > > Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > > > > > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > > > > > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > > > > > Cc: <linux-arm-kernel@lists.infradead.org>
> > > > > > > Cc: <bpf@vger.kernel.org>
> > > > > > > ---
> > > > > > >  include/linux/srcutree.h | 51 +++++++++++++++++++++++++++++++++++++---
> > > > > > >  1 file changed, 48 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > I've queued the per-cpu tweak from Catalin in the arm64 fixes tree [1]
> > > > > > for 6.18, so please can you drop this SRCU commit from your tree?
> > > > > 
> > > > > Very good!  Adding Frederic on CC since he is doing the pull request
> > > > > for the upcoming merge window.
> > > > > 
> > > > > But if this doesn't show up in -rc1, we reserve the right to put it
> > > > > back in.
> > > > > 
> > > > > Sorry, couldn't resist!   ;-)
> > > > 
> > > > I've merged it as a fix, so hopefully it will show up in v6.18-rc6.
> > > 
> > > Even better, thank you!!!
> > 
> > It landed in Linus' tree here:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm64?id=535fdfc5a228524552ee8810c9175e877e127c27
> 
> Again, thank you, and Breno has started backporting it for use in
> our fleet.
> 
> > Please can you drop the SRCU change from -next? It still shows up in
> > 20251121.
> 
> This one?
> 
> 11f748499236 ("srcu: Optimize SRCU-fast-updown for arm64")
> 
> if so, Frederic, could you please drop this commit?

Dropped, thanks!

(And I'm glad to do so given how error-prone it can be).

-- 
Frederic Weisbecker
SUSE Labs

