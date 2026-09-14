Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C03C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 19:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sc4WufYbwFCUYM3MPYQiGWQLq9nyLA8643InDHEZnzc=; b=QKwbmP72t30ZJtveBCJaupHGF3
	venZ19vx/cqjXN+h4fq9l6AjMoDZFVT5v8bosFxnpmyQZuDWPB63OJ5HCcrM+s8bKkokHhnOiM0ld
	TCBm2KADlT9kNEZ3WNLkmgADxcrNyI0z1hUc58i76EA2P/jtJQoBvxjZEv4ae7j5BhiZ011hVaTFc
	apG6yKK3bxdUhqy2rOxoPWcZqdt4KKDQzGW4tZ5AUULOId0jDXsIBuhxCf/fjEPvAJaiQwkSyuN6f
	11JD7QkCV8ZGL4rQe5gCEmh7H+5CHtJOBoW1UhoVgld112e8+QI3ZZbcOsS/Pg1qyvoDaCl4BoSZr
	Hi6VLl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6CGO-00000004WPP-3T8a;
	Mon, 14 Sep 2026 19:22:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6CGM-00000004WOY-15uu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 19:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Sc4WufYbwFCUYM3MPYQiGWQLq9nyLA8643InDHEZnzc=; b=JLnqJ8wzARePS7FyPbnm34psql
	iMkF5UT8u0BYJded3rH0Wmp0pQSW19SEi1AaC9Z+FBomoND6f9yTLp8FC/wnk8XZkorLxDdvWaOoh
	uiQeo8+WsuGAK+TkomunhRG6vREhj2h0wIOonpt1rObkNEMjILYjzirMR7aIRIcoEPLaMTGXpmybV
	cClv0cMlfIyYR0XFAJtWdQeqjNafhJnFgyQed4vkJuS1Q06rbKIfpPYMPoWu9p4B+x+8wi/2FYxAb
	x1fOjf6U0kwlcw7fhY80/Gl99YN6ARNfBpExQYBX0m5NDj8W62f6awiC5Bdc6XEwqFDyveAIdCz+5
	UrkOmE2Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6CGK-00000005y4K-3IAu;
	Mon, 14 Sep 2026 19:22:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B95123008E2; Mon, 14 Sep 2026 21:22:43 +0200 (CEST)
Date: Mon, 14 Sep 2026 21:22:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
Message-ID: <20260914192243.GA776954@noisy.programming.kicks-ass.net>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
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

On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
 
> This series issues those requests inline in blocking mode instead, and
> only pays for the offload if the request actually blocks. But by the
> time it blocks, the submitter is deep in the kernel with the request on
> its stack, so the work can't be moved to another thread. What we can
> move is the identity. If the submitting task blocks, an idle io-wq
> worker takes over its user visible identity (tid, signal state,
> credentials, scheduling attributes, cgroup, user register state),
> finishes the io_uring_enter() call and returns to userspace as the
> submitter. The original task finishes the request as an
> io-wq worker and joins the pool. Userspace is none the wiser, hopefully,
> the same tid came back from the syscall, it's just on a different
> task_struct. 

I'm still struggling my way through this thing.

So thread T1 is doing this blocking syscall. When it actually blocks,
you hand-over the userspace identifying part to another thread T2, which
will return to userspace as if it were T1.

Is this really a hand-over, or a swap? I would imagine we not have two
threads with the same tid and all that.

Also, I'm a wee bit confused, why not swap out the kernel stack with a
io-wq worker and have the original thread return to userspace. This
seems like a better defined situation. In so far as anything here is
well defined.

Swapping the kernel state seems like a simpler endeavour than swapping
all that is or might be user visible.

> Folks that have been around a while may remember earlier
> attempts at this about 20 years ago.

That was the whole threadlet thing, right? Very hazy memories of that.
I'll have to go read that back, I'm sure I still have that in my inbox
*somewhere*.

Surely we abandoned that approach for a reason. ISTR there being some
significant ick there, much like the thing you're proposing now.

Not sure yet on how things compare. Will have to dig through that stuff
again.

