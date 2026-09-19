Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA176C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 04:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tm91dTa2lD45xArkYG5Gs8XCKj+4pkepqBOPyEExGbk=; b=coMmYM3KuLXdr/1J0wbyoB2z8b
	p+IZKcKogXVYVFYgE2DVL/X/a+oW6hpXnUFGA0LI859Yp6TXYX40qAEpSH2404btue5jF8S6LbThh
	aBhGFDSC6igufOOENMgvjigmYO/zSy06dWjTWe7utO558rLZ0DXzz7pUjEGdB3kJ1balxO5TkiPdV
	Dtk/JMyQN9UU+iojIEOo9pX0IOr93fbcx6Mj3SwwafGqfs9d3fVUvaEAEb093lsudbEa0KBiXdd/+
	5J92FVA9lifrEJ1X7SMHURk7OtX72f50DWx3k6DvbrurU6pgCSJOTbdVR8pIm7zGcwOctxCrYJMp+
	ddfZSU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7mlx-0000000Fwap-3ER7;
	Sat, 19 Sep 2026 04:33:57 +0000
Received: from out01.mta.xmission.com ([166.70.13.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7mlw-0000000FwZR-0BRd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 04:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RZWen5AgjBWrYZJ5pGQA17J3wafpYMVpmSF7wo7K36U=; b=EO2SBL3QH6fRvP2pEmWE8Deu39
	ubmC1YL9TnUv3xW7YqmVKfV9zQorl7RTbINLcDw4flvs24egWErZPHeInsazuJEOx+wXktgYbOKU2
	3av3S7hgtZoCWfAKdGk0S/ctKQAa6OX9eVy0sLFq+we8ock9ZbV7V/oJdrJExXclGg6Q=;
Received: from in01.mta.xmission.com ([166.70.13.51]:60084)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x7mlZ-002Ci8-SB; Fri, 18 Sep 2026 22:33:33 -0600
Received: from ip72-198-196-98.om.om.cox.net ([72.198.196.98]:59022 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x7mlX-00H4gm-15; Fri, 18 Sep 2026 22:33:33 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  tglx@kernel.org,  mingo@redhat.com,
 peterz@infradead.org, Oleg Nesterov <oleg@redhat.com> 
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk> (Jens Axboe's message
	of "Fri, 11 Sep 2026 09:40:50 -0600")
References: <20260911154148.644489-1-axboe@kernel.dk>
Date: Fri, 18 Sep 2026 23:33:25 -0500
Message-ID: <87a4pdami2.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1x7mlX-00H4gm-15;;;mid=<87a4pdami2.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.196.98;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX19vXQSjoUfiXnvOr525YQvVO6XmJ8MQ/NI=
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for
 blocking inline issue
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: oleg@redhat.com, peterz@infradead.org, mingo@redhat.com, tglx@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, io-uring@vger.kernel.org, axboe@kernel.dk
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_213356_127675_EB6D446B 
X-CRM114-Status: GOOD (  24.14  )
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

Jens Axboe <axboe@kernel.dk> writes:

> Hi,
>
> io_uring issues requests inline with IO_URING_F_NONBLOCK and punts to
> io-wq when that isn't possible. For a range of opcodes it isn't possible
> at all, as there's no nonblocking path in the kernel for them: fsync,
> statx, openat, the *at family, xattr, fadvise, splice, etc. Those are
> punted unconditionally, and the punt costs a thread wakeup, a context
> switch and a task_work completion round trip per request. io_uring HAS
> to be cautious to prevent accidental blocking in the kernel, even if the
> operations predominantly never block. Sad story. Examples of that are
> things like an fdatasync that doesn't block, statx that hits dcache,
> openat for O_TMPFILE, etc. All of those would've completed inline just
> fine, but io_uring just cannot rely on that.
>
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
> task_struct. Folks that have been around a while may remember earlier
> attempts at this about 20 years ago.

I don't see anything immediately wrong, but I suspect I am just
not looking hard enough.

In my time working with the kernel I have never seen anyone actually get
this kind of thing correct.

The handoff that we do during exec has a bug with posix timers that
I think is 23 years old that we just caught, and still hasn't been
merged to Linus.

There was the old daemonize call that got it wrong so often I added
kthreadd.


Maybe you want something like the old solaris doors, or vfork.
Perform a synchronous task switch to this other thread, and call this
function in the other thread.  Then block waiting on the other thread
until the other thread blocks, or the function you called finishes.

Is there a reason you didn't try and do it that way?
Just a synchronous switch to and from a thread in your thread pool?

You aren't changing the mm so I really doubt changing the stack pointer
and a registers will be that expensive.


Eric

