Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A03EF9EDCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVW29VgTBcSEwz3Up8blF0S6ObWPFVHT6wdQNGV4Ppk=; b=adFQAUGbnlppVZN6ukDMbY1mg2
	EkcUr9MDzmaLqThlxTgH8HDMHie2NdYEZv+74wyWaOBgGeKcRUyExrEio8gfSQ44aStfv/lO428zV
	CJKn2Odnp9xKnzMAm5ksg4dsO5v2rrT+Hgz5+eVkzVG3d8wtajvA3LhCv6zgGwhoXzLLrPWLaD0Bu
	aE8r7Fd5mndnIzGJLKEESipygtRwRHGBs9tRZ+YNAWE7Z1rBFGlH/bf3tr1kJ6dwd2hg0/itrP52N
	hNetpq0XOyu3TP1VwgIuRFXu7T2+0kxB84YrS2Df+z0QPyv8d3n7r16OuZRQl1LmE+64uWRdC41Bv
	MZ0zHQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXOi-0000000AGrG-0oHu;
	Wed, 22 Apr 2026 13:13:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXOg-0000000AGqj-3TOx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Apr 2026 13:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LVW29VgTBcSEwz3Up8blF0S6ObWPFVHT6wdQNGV4Ppk=; b=tX/+ArC+dmBJ6gpIMcIYmbvE+A
	jhYyel6wJNfb+MJR+kK3WOCw7ZNeKOlhAGIcKkLUMM89y85oTDHlF2nxnLtxR4TUIAzw2am5ABfPx
	3WkGAsz2BIIbNjXqiihnqldwDQFS9bKqNfjO0wBefgzxYL2QvIVy8PXI3+GilcYW27NU1pnZCK5KZ
	fbdBWi9e5pRJjHehmA3JtJwrmcTaw4Dk2AriRrqDXEAa+n4ietTA625ZzWgXA+C8xx9h90JiyKpHS
	4TVPAMKdCeGSyANp7YOpkz7SprOauIUcKRikeDXvk5RgnFpSMPjS6ZuUU548gtCgNqhJhUbCrdW4Z
	2zL5+/Rg==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXOd-0000000Bn56-26nM;
	Wed, 22 Apr 2026 13:13:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2301B3008E2; Wed, 22 Apr 2026 15:13:38 +0200 (CEST)
Date: Wed, 22 Apr 2026 15:13:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mathias Stearn <mathias@mongodb.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Chris Kennelly <ckennelly@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
Message-ID: <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
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

On Wed, Apr 22, 2026 at 02:56:47PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 22, 2026 at 11:50:26AM +0200, Mathias Stearn wrote:
> 
> > Additionally, it breaks tcmalloc specifically by failing to overwrite
> > the cpu_id_start field at points where it was relied on for
> > correctness.
> 
> This specific behaviour was documented as being wrong and running with
> DEBUG_RSEQ would have flagged it.
> 
> The tcmalloc issue has been contentious for a long time. The tcmalloc
> folks relied on something that was documented to be wrong. It has been
> reported to the tcmalloc people many years ago and if you were to run
> tcmalloc on most any kernel (very much including 6.19) with
> DEBUG_RSEQ=y, it would have yelled.
> 
> The tcmalloc people didn't care. There was a proposal for an RSEQ
> extension for what they need, and they didn't care. All this should be
> in their bugzilla or whatever.
> 
> The RSEQ rework improved performance significantly for everyone, and
> kept all the documented behaviour (+- arm64 bug). Tcmalloc got screwed
> over because they relied on implementation behaviour that was
> specifically documented to be broken. And they didn't care. Google was
> very much aware of this. And hasn't lifted a finger to remedy it.

Also: https://lore.kernel.org/all/874io5andc.ffs@tglx/ 

