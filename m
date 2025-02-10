Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E199AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nH3pvSNUkRlhL4+G+UMDC3b1XyL6w6N3TYBSbml6HW4=; b=sxaOgUhZHBigJD6e5KDn1E6kPW
	zL/1ltQ460stbMdb2KRmR5v9zLDQA4jHmt28NX/alrfcTm3VRcc8rGua6m5zBRtlJQB53Io6VicVz
	GPrNP0GVZ9LNQXG+VJ7a4YusUxugGRu8hNXlMWYACZmE3k1a8A3Q6b/yMSvcfvm15KY5lWEopzcFj
	2orD8pVF8hmWFa/fsChK0OeKYtzCkOLZ+tCGQQ+SmMcLXp4YJmH+Wkn/hH/OiWSAZhYnFPgwi/l4H
	oTTza9p34oUbpYupP9HzpJalbkfB6xdmwRknv/ToPaaOD750ZiVGfx2Ynqa110DbQD+HX3yjAsyl8
	cDcI4Pkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRWh-0000000H7dj-0wd6;
	Mon, 10 Feb 2025 11:00:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRM7-0000000H52d-34x1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 10:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nH3pvSNUkRlhL4+G+UMDC3b1XyL6w6N3TYBSbml6HW4=; b=mC4fAAucdktIJs1dcferucyMCq
	iUodFybqvGDFlBZzy1zrhMimjKL7I0TbxG2cd8C08ej2aLQ+93uVGBNzJDRzVxPSbAwx7u9Ajj/nJ
	ZjhAhHc2iZ6jdS3v+LTGwoUx+zA/cr6kSl7uJygXyMDcnvWjjQ8F1lplnLyfwApXuNnp0l3iaWPJq
	/qKbdmAqaGV+O3vhvDBFvMbLtNyEO5KrtOH077D/qCozXqswghktIN9PdUNJKsiIRKxxz4yp2tk2N
	LN6xOwsTYMhHKwNE5WckDEVNbQcAmvBv+5cd6cJJl7DAHn1L5mcbVLqpkjVk9t8y78FR08cKAw8dN
	jcINHt5A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thRM4-000000007Pm-2dgV;
	Mon, 10 Feb 2025 10:49:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2B580300318; Mon, 10 Feb 2025 11:49:31 +0100 (CET)
Date: Mon, 10 Feb 2025 11:49:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v2 00/26] Resilient Queued Spin Lock
Message-ID: <20250210104931.GE31462@noisy.programming.kicks-ass.net>
References: <20250206105435.2159977-1-memxor@gmail.com>
 <20250210093840.GE10324@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210093840.GE10324@noisy.programming.kicks-ass.net>
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

On Mon, Feb 10, 2025 at 10:38:41AM +0100, Peter Zijlstra wrote:
> On Thu, Feb 06, 2025 at 02:54:08AM -0800, Kumar Kartikeya Dwivedi wrote:
> 
> 
> > Deadlock Detection
> > ~~~~~~~~~~~~~~~~~~
> > We handle two cases of deadlocks: AA deadlocks (attempts to acquire the
> > same lock again), and ABBA deadlocks (attempts to acquire two locks in
> > the opposite order from two distinct threads). Variants of ABBA
> > deadlocks may be encountered with more than two locks being held in the
> > incorrect order. These are not diagnosed explicitly, as they reduce to
> > ABBA deadlocks.
> > 
> > Deadlock detection is triggered immediately when beginning the waiting
> > loop of a lock slow path.
> > 
> > While timeouts ensure that any waiting loops in the locking slow path
> > terminate and return to the caller, it can be excessively long in some
> > situations. While the default timeout is short (0.5s), a stall for this
> > duration inside the kernel can set off alerts for latency-critical
> > services with strict SLOs.  Ideally, the kernel should recover from an
> > undesired state of the lock as soon as possible.
> > 
> > A multi-step strategy is used to recover the kernel from waiting loops
> > in the locking algorithm which may fail to terminate in a bounded amount
> > of time.
> > 
> >  * Each CPU maintains a table of held locks. Entries are inserted and
> >    removed upon entry into lock, and exit from unlock, respectively.
> >  * Deadlock detection for AA locks is thus simple: we have an AA
> >    deadlock if we find a held lock entry for the lock we’re attempting
> >    to acquire on the same CPU.
> >  * During deadlock detection for ABBA, we search through the tables of
> >    all other CPUs to find situations where we are holding a lock the
> >    remote CPU is attempting to acquire, and they are holding a lock we
> >    are attempting to acquire. Upon encountering such a condition, we
> >    report an ABBA deadlock.
> >  * We divide the duration between entry time point into the waiting loop
> >    and the timeout time point into intervals of 1 ms, and perform
> >    deadlock detection until timeout happens. Upon entry into the slow
> >    path, and then completion of each 1 ms interval, we perform detection
> >    of both AA and ABBA deadlocks. In the event that deadlock detection
> >    yields a positive result, the recovery happens sooner than the
> >    timeout.  Otherwise, it happens as a last resort upon completion of
> >    the timeout.
> > 
> > Timeouts
> > ~~~~~~~~
> > Timeouts act as final line of defense against stalls for waiting loops.
> > The ‘ktime_get_mono_fast_ns’ function is used to poll for the current
> > time, and it is compared to the timestamp indicating the end time in the
> > waiter loop. Each waiting loop is instrumented to check an extra
> > condition using a macro. Internally, the macro implementation amortizes
> > the checking of the timeout to avoid sampling the clock in every
> > iteration.  Precisely, the timeout checks are invoked every 64k
> > iterations.
> > 
> > Recovery
> > ~~~~~~~~
> 
> I'm probably bad at reading, but I failed to find anything that
> explained how you recover from a deadlock.
> 
> Do you force unload the BPF program?

Even the simple AB-BA case,

  CPU0		CPU1
  lock-A	lock-B
  lock-B	lock-A <-

just having a random lock op return -ETIMO doesn't actually solve
anything. Suppose CPU1's lock-A will time out; it will have to unwind
and release lock-B before CPU0 can make progress.

Worse, if CPU1 isn't quick enough to unwind and release B, then CPU0's
lock-B will also time out.

At which point they'll both try again and you're stuck in the same
place, no?

Given you *have* to unwind to make progress; why not move the entire
thing to a wound-wait style lock? Then you also get rid of the whole
timeout mess.


