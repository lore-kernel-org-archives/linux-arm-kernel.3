Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99089C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJAuqZuWQqzjYYp+EEQS1LZ8rOxNC7QZm9D+4rKS8Uw=; b=aqrapDZj2i8XcPnNnXJqbXhC4p
	vChEGAbhjFE7Qq0dCTVnFAc7FTsKUd0vtug3heucrihUPiQfyZNr+rp/W+E5I9bTsuZVjsYjx8L1Y
	h1Ng4/Na2vZaU27hdR4dmGuYzVJee2OvBzTpCMhuhZJ0rY/8BMOf3PH/eTZzn9u3f2AkAiRymnmRb
	GjGJTZmnAElfVX6A9LHvTqSztHJati3ksjw6+t50pPhqh28pNFwMr1+kbwxtSDnDaahASd+vBmLbt
	xC/aibSlv3mcBC706cn7YXa0ZKeFhUGXC3Z7cYwUvX+GTAP1n65zlvgem8hMmCknY/RvjPQ8YS4XY
	imj1wdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdin-00000001asW-1iZx;
	Fri, 17 Jul 2026 08:15:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdim-00000001arZ-10mm
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aJAuqZuWQqzjYYp+EEQS1LZ8rOxNC7QZm9D+4rKS8Uw=; b=mXwTedHCTPBwG4wlGdV424mR7k
	+wlVqaOVC7m1h0GUIbuYe13cwy338r7DoMNXp1MfOeAZSab6oZ9bm7Nn0udrJ5Runw7k2VFCntbg5
	xouVvMXG3N4Edo7l/oq7mp8WHB4rGhpNCl2n22YkueV93hktfsqhJqh7UUoP1m+ISlgZnt5b3qBgm
	LHYTkfwdpKBaVmTlRTIROjzOmVwpIAbDlCMQWISfWRe899ash5gLP4GeQWeB6A9tPrKMvvOl0/aol
	4iWIzP8u875aU7UzYYEUXc+hCXof6rP0Z89XG6PJVxbq55MV4pJtdX4yw2H8vGQordt95/f39JoUF
	988IS3+g==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdii-0000000EecD-2tbv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:14:58 +0000
Date: Fri, 17 Jul 2026 10:14:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784276095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aJAuqZuWQqzjYYp+EEQS1LZ8rOxNC7QZm9D+4rKS8Uw=;
	b=FGYbIEjWVYSKMk9LPgj3WdJkaZXfoQTZ3KsZ0JQwFf4EveNoIU7dGfwNfi5pZ2Gc1fbT6+
	uvZ8pubJzbEoHzT24DjA/9gpZm/JimXqKF94fhuSn/5RBhYZF/Z30Ncxa1/m2jWB6aPHCu
	zu5RXqS9qJbXilhl0vrJ6Y59n1fP6jiR4WDPad4jigx7GfoT94yYPptUcX3YkuJVFkHHxT
	LpaUtotPtoSpBJlLO9CGAf0RqI07QlRdTxXWIi88DmySGwXKqYqwe6ZahWa/S3yQ8x3SWY
	4QNa7HNN/uaHEgAk58o74rJWEEGTHpRQG+Rs3GoJiVJqSNCLSlLvXbZdDEeznw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784276095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aJAuqZuWQqzjYYp+EEQS1LZ8rOxNC7QZm9D+4rKS8Uw=;
	b=HUXqyjTzEg/UiDmkB4ctIsHB/e4PAgam+gL2OJUCKEPgyApAMtmlOxcA9CrposubCIt4+E
	l8aBk+0yBp4xpNBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <coresight@lists.linaro.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT" <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH v3] coresight: Fix scheduling while atomic in
 coresight_cpu_pm_notify()
Message-ID: <20260717081453.pSDTUQQW@linutronix.de>
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
 <20260716214155.2049564-1-mohamedaymanworkspace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716214155.2049564-1-mohamedaymanworkspace@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_091457_124762_B2C24C98 
X-CRM114-Status: GOOD (  13.94  )
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

On 2026-07-17 00:41:54 [+0300], Mohamed Ayman wrote:
> Dropping the last reference to a coresight_device can trigger a kernel
> panic on PREEMPT_RT builds due to a "scheduling while atomic" violation.

It is not a panic, it is a warning. A panic is after panic() is invoked.
[ Or a warning with /proc/sys/kernel/panic_on_warn=1 but in this case I
wouldn't count this a panic but as warning followed by consequences of
your own action ]

> When the CPU enters an idle state, coresight_cpu_pm_notify() is invoked
> with local interrupts disabled. It calls coresight_cpu_get_active_path(),
> which currently uses coresight_get_percpu_source_ref() to get a kobject
> reference, and then immediately drops it with coresight_put_percpu_source_ref().
> 
> If this put_device() call drops the very last reference (e.g., due to a
> concurrent device unregistration), it synchronously triggers the release
> cascade. On PREEMPT_RT, free_percpu() takes a sleeping rt-mutex.

Again, spinlock_t which becomes a sleeping lock on PREEMPT_RT.

> Furthermore, any parent device in the release chain might also acquire
> sleeping locks, causing a system crash in the atomic PM context.
> 
> Fix this by eliminating the get/put dance entirely in the PM notifier path.
> Since coresight_cpu_pm_notify() runs with IRQs disabled, it is safe to
> read the per-cpu source pointer directly under the coresight_dev_lock,
> check the mode, and return the path without unnecessarily manipulating the
> kobject refcount.

Right.

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>

There is coresight_put_percpu_source_ref() with holds coresight_dev_lock
during a put_cpu. I don't know why the lock is held, it is not obvious
to me. But it will lead to a similar problem if the put actually invokes
the release callback.

Sebastian

