Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C29AFDEE4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 21:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgDWQLcCxxTbf77gCRwJMLCdNBNFSveBSyAvc4lmV9w=; b=icB0yNN2IVKJLcAByRst40EXir
	mcWfwo0D4Y2TLz7X1IMmbsWTGnPSzDbBXMDtB4beacdpZrvC8/y93WjHl3T0CBEfT+aAaCyk5WGAR
	Rcu/a2rP/B5Mbu0KEgW5L4VNTdUAzNX/d7X+G1IZN5Y2HvS2AMkWKDmO8pDpaSKlXcD1I6x7/SXCQ
	lc7WvDwRaNw0uwGZ5OSJ64btUuscMAlB7umQFsAmlFdHTrd6ZyC1b0w1z3rgoxiROxfvqwv8/z+91
	hU8ZaZZKOFjXm2SyPPHIs7I+vsXfF6v9iqh808QBLzW7ithbofb0Ap4wt9i/WyNkWlIdwUaDALfnc
	LoclwdeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1Cr-0000000CJcN-3jrV;
	Thu, 23 Apr 2026 21:03:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1Cp-0000000CJbr-1p21
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 21:03:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D49444084C;
	Thu, 23 Apr 2026 21:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1538C2BCAF;
	Thu, 23 Apr 2026 21:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776978206;
	bh=jicRkjxAdp8AcCcPUjbadYpVexqneFhcKTzet6r3h5c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Vfsw7X80JLWG87rigYmms+aaE4YkaApjZI6XVr2Of47GDY1sjxLsk08O4Wb/e0WF7
	 Y+X3OjI+cvAGecePqQNIkeNmKI17+7FIEwGdW5eokHlBN8zdAn7Kcmc7SZAiyWwFMv
	 W3tcYISr4cc7mNrPwcgpI8hiYUU7HxrJ4at+dKeGX5i7qVQA703sY04okfDhbIevYU
	 /K/m1+1/7NVBdG0rw7BeXh4l16CejUB8uIpZUUpy2dXvuUA2hB72DLZw1wJazay9Su
	 PdxbgbJ1XW/xUSXhyKt494yRjuRUU7RoD46c1++UfjtQYxgNYBgrjhA9OOcO8jS9OD
	 ms7z+qkM/i3CA==
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra
 <peterz@infradead.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ingo Molnar <mingo@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Blake
 Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx>
 <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx>
 <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
Date: Thu, 23 Apr 2026 23:03:23 +0200
Message-ID: <874il11jac.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_140327_516518_1092CE64 
X-CRM114-Status: GOOD (  22.50  )
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

On Thu, Apr 23 2026 at 10:41, Linus Torvalds wrote:
> If that rule was actually an important part of the ABI, it shouldn't
> have been a debug thing.

It's a debug thing because it's too expensive to be enabled by
default. And it's actually valuable for validating RSEQ critical section
ABI correctness as they can't be single stepped with a debugger as the
break point interruption would immediately canceled.

> So:
>
>  (a) the debug code in question needs to just be removed, since it's
> now actively detrimental, and means that any kernel developer who
> *does* enable it can't actually test this case any more. It's checking
> for something that has been shown to not be true.
>
>  (b) we need to fix this (revert if it can't be fixed otherwise)
>
> I see some patches flying around, but am not clear on whether there
> was an actual patch that make this work again?

There are two issues:

  1) ARM64

     On ARM64 RSEQ got broken completely with the partial move to the
     generic entry code. There are patches flying around which "fix" it
     and Mark is working on a more complete solution as there are other
     subtle issues with that aside of the obvious RSEQ wreckage. The
     latter could have been detected with the existing RSEQ selftests if
     any CI would actually run them on -next.

     That's uninteresting and unrelated to the tcmalloc issue. It's just
     a boring bug which will be fixed in the next couple of days.


  2) The tcmalloc problem

     That's a known problem for at least 6 years. tcmalloc assumes that
     it "owns" rseq and can do whatever it wants with it.

     In 2022 the glibc people requested that tcmalloc becomes
     interoperable with the reasonable expection of glibc to utilize
     rseq as well:

          https://github.com/google/tcmalloc/issues/144

     Status unresolved.

     That means that using tcmalloc requires to tell glibc to _NOT_ use
     rseq and at the same time precludes any other library which wants
     to use it for the documented purposes. So this code sequence blows
     up in your face:

        x = tcmalloc();
        dostuff(x)
          evaluate(rseq::cpu_id_start, rseq::cpu_id)

     because tcmalloc overwrites rseq::cpu_id_start and thereby breaks
     the ABI which evaluate() is rightfully depending on.

     That has absolutely nothing to do with the kernel as there is no
     kernel interaction between tcmalloc's abuse and the subsequent
     evaluation of rseq::cpu_id_start. The kernel has no way to fix that
     problem at all.

     Now back to your generally correct and agreed on "observed
     behaviour" rule.

     Feel free to enforce it, but be aware that you thereby set a
     precedence that a single abuser can then rightfully own a general
     shared interface of the kernel forever and force everybody else to
     give up.

     The tcmalloc developers actually documented that they own the
     world:

     // Note: this makes __rseq_abi.cpu_id_start unusable for its original purpose.

     Do you seriously want to proliferate that?

Thanks,

        tglx




