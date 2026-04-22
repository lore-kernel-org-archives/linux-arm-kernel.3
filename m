Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0856AF9EDC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZJYejPinbwg2dgZwGQp878b4bBUZhrcDpVoZap6PBA=; b=pY84NSosNHAuZfNfkqU9vcqNNq
	/MkBPEXkDbhdtidtHQoXmx+L/0WVcn2Tb3/atQ4wp58zyppUQUVHCu7RmCXJvQ8LWGJ6SR1mbIRXh
	7C5sRn1E88gdlg5aLMWGmVabLJRDtrPd8Q8irLN+MZDi0uxwDD8nIl+tvgcnyn26iSV6IvA1V/zDM
	vWS07hREEhqHF+pPO+jIPVcyEmBqbyxbasZ3zWI1inye4o5m0nSGGMjBzp3P0Ps9shbfquttgUwk/
	iLH11sp50yn0bdtNwZBeENeX9AaLhOXTns7hYGXFnqy8RpD00IzJ6KEd7TYxB3Z+XTq5pSarYZZmQ
	+EbMnrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFX8Q-0000000AFUW-2KCb;
	Wed, 22 Apr 2026 12:56:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFX8P-0000000AFTu-20CD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Apr 2026 12:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bZJYejPinbwg2dgZwGQp878b4bBUZhrcDpVoZap6PBA=; b=e6/liRiAZhw/qeNrxn/I70F0hZ
	Vf61kP1Ugbq/deh03FjHdUTeOuzaXRUvK9G/4GyBzJyG/R3P/O3BaWLVh833nqNQVQz8aO3AB5Z6e
	9YYG9F5UNL0Wno7rVQq+S7k3nmq3vFkJsDLZ0zslfPgLdq0rVkRnY1dzfqd3dNlV9bB0no05hjt+A
	ax7a8uh61rMUI+6JAK5IKxSP/YtSt4Ya/FA91gw0nURDbva+mbzDK8KPB1CBomGDLtBwwxlK+tr8R
	Al7wJeGc7kv3ETE7JmM4UqbN0GakpY7k5F7EEzGoxRbH/AvZI/9G7HOJW68rZa5w2DfdHXkcaVAuW
	4VB+BlvA==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFX8L-0000000BPjS-3ewN;
	Wed, 22 Apr 2026 12:56:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C53D93008E2; Wed, 22 Apr 2026 14:56:47 +0200 (CEST)
Date: Wed, 22 Apr 2026 14:56:47 +0200
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
Message-ID: <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
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

On Wed, Apr 22, 2026 at 11:50:26AM +0200, Mathias Stearn wrote:

> Additionally, it breaks tcmalloc specifically by failing to overwrite
> the cpu_id_start field at points where it was relied on for
> correctness.

This specific behaviour was documented as being wrong and running with
DEBUG_RSEQ would have flagged it.

The tcmalloc issue has been contentious for a long time. The tcmalloc
folks relied on something that was documented to be wrong. It has been
reported to the tcmalloc people many years ago and if you were to run
tcmalloc on most any kernel (very much including 6.19) with
DEBUG_RSEQ=y, it would have yelled.

The tcmalloc people didn't care. There was a proposal for an RSEQ
extension for what they need, and they didn't care. All this should be
in their bugzilla or whatever.

The RSEQ rework improved performance significantly for everyone, and
kept all the documented behaviour (+- arm64 bug). Tcmalloc got screwed
over because they relied on implementation behaviour that was
specifically documented to be broken. And they didn't care. Google was
very much aware of this. And hasn't lifted a finger to remedy it.



