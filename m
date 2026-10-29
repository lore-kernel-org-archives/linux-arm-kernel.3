Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBB9606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z5E6RYoe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=tvo3Kx0W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9QVb+91XYYBUr8R59VhzK+f/JX4StneV4cYQuLGB04s=; b=Z5E6RYoeA2DF/dpwn88Dmocrok
	wUsE34rALY1RHfRhQPz60maGCBdBKLY1U5zqMbSzFpgr2bhnZ0/c2Gtw0iYiraoet5LIzR1u0/voN
	I3SJVzv9i1teQmsJ0X1JE7UeYTqIYFEaBuHHiDq9zOLZ2z0OqwLid3wMY5/BGwlXoS4lEH5TtRss+
	2u3el0NiUwsoqLxUohR4ikoEhnwZPHuxYHVkyZkli40Ka6J2mVP9hDWl5WHPa2uN1bV982ZCjYfUT
	wcdQMwo469JsyCIq02+tVDnFhbTMUxI6hXBvpTYpg9LKw1M8RZeibO5UOCwkVyt3HUnKSCY3OnDKI
	TpLzM8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMUi-00000008rXi-0UoU;
	Thu, 29 Oct 2026 09:32:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMUh-00000008rX3-1dzq;
	Thu, 29 Oct 2026 09:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9QVb+91XYYBUr8R59VhzK+f/JX4StneV4cYQuLGB04s=; b=tvo3Kx0WyXFmj5M1UvwLLzlyRd
	+tPht+PutUDK9vhZCFChbmxYV68/EO1F64DavgTMgqxxqQKL795BQUJuLN6EviC/v9eCsVF0z5uRC
	x19XRvbyqDt4SmLO/C0GjnzTmlX+3X5ClUru9Os+JtIBJtPmh1JX4q5R7N0X1uE76fBfVwMFUMfHX
	GNOEX8uD1TPYzyljcWQZnMmsMD+Q6hEvICezSBh4ITqD8fAbL9XAeHO2IatFqLLinlugDee5J3UDa
	chJ92lordKxmQdKlAl430pe6b5m1qQQt8HKYWyta3yjE8QAkfeSG7UXMEmHRgaJWvr/3u0cJozy0+
	1XgqVJVQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMUe-0000000E6mx-1M9Z;
	Thu, 29 Oct 2026 09:32:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6E93C300329; Thu, 29 Oct 2026 10:32:19 +0100 (CET)
Date: Thu, 29 Oct 2026 10:32:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 03/13] sched: Split preempt-count bookkeeping from
 raw updates
Message-ID: <20261029093219.GH1779021@noisy.programming.kicks-ass.net>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
 <20261028033127.82193-4-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028033127.82193-4-kmehltretter@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 04:31:17AM +0100, Karl Mehltretter wrote:
> Very early hardirq entry code needs to update the preempt count before
> instrumentable debug and tracing code can run. Conversely, hardirq return
> code needs to finish instrumentable validation and latency tracing before
> raw teardown.
> 
> Add a small hardirq-entry header with irqentry_hardirq_count_start() to
> stage the raw HARDIRQ_OFFSET addition and record whether it was applied in
> an opaque cookie. With DEBUG_PREEMPT and without separate reschedule bits,
> route an already-negative count through a noinstr slow helper which
> preserves the existing DEBUG_LOCKS_WARN_ON() oops short circuit. Add
> irqentry_hardirq_count_finish() to report a rejected addition or complete
> post-add debug checks and latency tracing, and add
> irqentry_hardirq_count_sub_prepare() for validation and tracing before a
> raw subtraction. Keep preempt_count_add() and preempt_count_sub() behavior
> and ordering unchanged.
> 
> Keep latency tracing in each calling path so CALLER_ADDR0 identifies the
> caller. Force the start and stop helpers inline because trace provenance
> depends on their stack frames.

Urgh, so much crazy.

So WARNs in noinstr code are 'fine'. That is, they should not happen, if
they do, bad things have happened and we need the warning out ASAP, if
it takes the machine down, too bad. See the
instrumentation_{begin,end}() markers in x86 asm/bug.h.

But yes, the tracing needs to go. But moving that around should not be
this ugly and also, that will give you the opportunity to fix
preempt_{en,dis}able_notrace(), since they currently also skip the bound
checks.

