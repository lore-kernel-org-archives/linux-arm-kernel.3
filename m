Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3780FC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhiCR0AgFIOeF4HS1CGKAOPDrkDo1F+m8u6AqUimqbQ=; b=luBqjTy7bk61sa6cfbv7W5LyMc
	XZS2z9mwZGmWnbEosU4MZQpCr1tdJnWu2qY5FzvuH8EVk9ka1H5EqO8gmhiUAnKRsaSSQVCqsW1ym
	SdhjSmM6z/7taIWmcg/th4q/JvpenqTtei8oz8NIJbb7x3OZi8cIRT8Iif0AhoLPqIB1GgkvhXzKD
	+qdfumMNFRQyu4Dg81mH/TWlCPogfHSylypWMYP3S7oRg21+/3rfnSTHGZqfndqcCY0ABQXahMGkm
	jAyGonjy02qKoIVbkkjc9LLE0ruSPaXa2DCSmq4eQuZQqHBk0BB37/LNUI1M02y6r4prrHvEyc/1s
	z6j1MeQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQsz-0000000Gygi-2YQr;
	Mon, 10 Feb 2025 10:19:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQr6-0000000Gxn9-3Z9N
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 10:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hhiCR0AgFIOeF4HS1CGKAOPDrkDo1F+m8u6AqUimqbQ=; b=uIlOErQUY2LA378P/b/PjPuCU6
	eBtpaJwVQemWIrRTzDEZa2HvMYuGsObheoeeoV/VTHEvLinm9P8vrqY2kdzlYKZ0QLuL0fMaknLTp
	YsIUtz50FTonOihHSFcLSSrrS7emKN9ATUu1G1g6mJMk3OEY/268GHKDwqxru2cgTt2blqIQdSbHE
	2sJL9+f7qXT9jEQr1tIeN95XMKhBEapQiUAdVo/HU5tqwrFNGhwlsrNMnZPSm+ksf1wakZ69nV96j
	1iRIFZmmC52W5dW8stnEHgMXq4Bw2uR9iKPilcWVLryWA6gb+shYWcQSYxb6HC8zHHaFaCJJyB81G
	lWHTLsKg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thQr5-0000000FWDr-05HJ;
	Mon, 10 Feb 2025 10:17:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9079E300318; Mon, 10 Feb 2025 11:17:30 +0100 (CET)
Date: Mon, 10 Feb 2025 11:17:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v2 09/26] rqspinlock: Protect waiters in queue
 from stalls
Message-ID: <20250210101730.GI10324@noisy.programming.kicks-ass.net>
References: <20250206105435.2159977-1-memxor@gmail.com>
 <20250206105435.2159977-10-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105435.2159977-10-memxor@gmail.com>
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

On Thu, Feb 06, 2025 at 02:54:17AM -0800, Kumar Kartikeya Dwivedi wrote:
> Implement the wait queue cleanup algorithm for rqspinlock. There are
> three forms of waiters in the original queued spin lock algorithm. The
> first is the waiter which acquires the pending bit and spins on the lock
> word without forming a wait queue. The second is the head waiter that is
> the first waiter heading the wait queue. The third form is of all the
> non-head waiters queued behind the head, waiting to be signalled through
> their MCS node to overtake the responsibility of the head.
> 
> In this commit, we are concerned with the second and third kind. First,
> we augment the waiting loop of the head of the wait queue with a
> timeout. When this timeout happens, all waiters part of the wait queue
> will abort their lock acquisition attempts. 

Why? Why terminate the whole wait-queue?

I *think* I understand, but it would be good to spell out. Also, in the
comment.

