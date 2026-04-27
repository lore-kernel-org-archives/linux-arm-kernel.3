Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A158FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z15Wgm5Jadcf5OplbDLN3OuS8ibhyOQbcM/0NTHJ/to=; b=VXZR0MmYghBXEODApJN3hgjvJb
	LjM9WkiU1t3MgEQa+98xw3sriDs5QYufLqP6s/mshaE4EHs88JMcf1KNW9kmBgcnsehk9a9IKROCH
	pW+sgIfESmOcYDlTHu3RZLUuyR/e0zL2i5WtZS76gxziy73w4J4gEBifb+GmE4y37tTblzI8t5FI+
	vmakfhKMzmAQrAfua9pZqNwg9UltEMXJWHsuKUossDXJ7APKMiTtFP0ZZzIcaD/YO8uNS9iR5YMAg
	NQuWX3B9O4bPLn6eXygQbknuw4WP3m3Vr6sdREqVAIcOHqylSyJJoCJyaMuyviQw5MFXZbjuBes37
	8JNz4tog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHT9l-000000009sZ-09q6;
	Mon, 27 Apr 2026 21:06:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHT9i-000000009sT-3tYh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 21:06:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E8E06014C;
	Mon, 27 Apr 2026 21:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D742AC2BCB5;
	Mon, 27 Apr 2026 21:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777323973;
	bh=KBRYX6tEB+mYgRW4VfUUMxd2Mz2ql4bOLSZemcFFgzQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JkGn6Kt1y6YH2h8fUEmQXSUTStPRDHM2qzazqiwDfzrp6yp3KfOna5pLtvZI56K0/
	 4smug6gT/MjmzFbaHA7z3V1bFhyMnPQQcKKudIw4h+lcp6MfiU7D7R16jSpsMFkb2n
	 xULOmLBk0gqKQTrzvS1qWHybmBONUnBnk+2c01fOQUAru014iwvBBtBYWChmrUy4hK
	 Y/vaPQaYaLPMPvY1O/xsBHqJUIHFaP6HoKicxLjmZLF13PcsjGYbXP0hn3JG2brSIJ
	 sHKDKx5MOKEkjwpJjWT+/+mTLA5yUMDoFBYokYwNcXKNR+bjt02WD8YYBr58rffEB3
	 G8gUnHVAXeS6Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Florian Weimer
 <fweimer@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Mathias Stearn
 <mathias@mongodb.com>, Dmitry Vyukov <dvyukov@google.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, Mark Rutland
 <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Blake Oler <blake.oler@mongodb.com>, Rich Felker <dalias@libc.org>,
 Matthew Wilcox <willy@infradead.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Torvalds
 <torvalds@linuxfoundation.org>, criu@lists.linux.dev, Michael Jeanson
 <mjeanson@efficios.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <7f8783a6-1a48-4c92-850c-d285a788b491@efficios.com>
References: <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
 <87wlxy22x7.ffs@tglx> <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
 <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
 <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
 <87v7dgzbo7.ffs@tglx>
 <20260424150318.GE641209@noisy.programming.kicks-ass.net>
 <87se8kywhb.ffs@tglx> <87jyttz8cf.ffs@tglx>
 <lhujyts4zr8.fsf@oldenburg.str.redhat.com>
 <7f8783a6-1a48-4c92-850c-d285a788b491@efficios.com>
Date: Mon, 27 Apr 2026 23:06:09 +0200
Message-ID: <87bjf4yuym.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, Apr 27 2026 at 14:35, Mathieu Desnoyers wrote:
> On 2026-04-27 03:40, Florian Weimer wrote:
>> Switching to the new extensible RSEQ allocation code in older glibc
>> builds is not entirely trivial, and I would prefer not doing that.
>> Registering with a new flag is comparatively simple, and we could
>> backport it, except that it might not be compatible with CRIU.
> A third option would allow the entire range of older libc versions to
> benefit from rseq optimizations, gating the "v2" behavior on:
>
>    rseq_len > 32 || (flags & RSEQ_FLAG_V2)

No. Features beyond mm_cid require optimized mode and a larger rseq
area. That's not negotiable. See below.

> That v2 behavior would:
>
> A) Enforce the ABI contract:
>
>     - RO fields corruption -> kill process,

My patch does that already and the time slice extension muck does so too
from day one.

>     - System call within rseq critical section -> kill process,

No. That's overkill for syscall heavy workloads.

Also it's not a functional correctness problem which affects multiple
RSEQ users in an application. User space can do even worse things.

      cs_start
      call foo	// foo uses rseq too ....
      cs_end

Invoking a syscall from within the critical section is stupid, but at
least harmless vs. other usage in the same thread as the syscall needs
to return before anything else can go and use RSEQ in that thread, no?

People who develop RSEQ critical sections can enable debug mode via the
sysfs knob if they want to prove that their code is correct. That's a
debug aid, not more.

> B) Allow optimization of the rseq field updates (only update relevant
>     fields on migration),

That's part of the whole combo. Optimized behaviour and new features.

> This entirely decouples the feature enablement concern (rseq_len) from
> the strictness/optimization mode (v2).

Which causes us to sprinkle more conditionals into the hot paths for
individual features instead of simply doing unconditional stores and be
done with it. It's bad enough that we have one, we don't need more.

User space knows the size the kernel expects and if it insists on using
the original size, so be it. Keep it simple.

Thanks,

        tglx

