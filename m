Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DBDFDEE2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RjHtx1jwbqQ55OcNCnJbcpuJoTX9YBGzZbzlHhCrsM=; b=BC01LJHcInSMMlbOILrK6CuJR8
	3m4O/ik7FXvAOFtWublW6FwLDkQJ6NlMf7BU1Vo7dusiWBhOQFp7Dloqxvc5l+9t0PU03NzBZirCQ
	gHz5q9RN1ZZvhTkZefWO/EqDPf3YzFtbnfeUgm/ze9SCc+RuDgHuJOxa/EPoy7/kG7C1jbzcoM4ww
	LrG3KSdxOgPTuoLqGyRU5OGYmQKA5XGzT5kfBdvoB2YNXwRZc6NLsFILmi6n0Kes3VN95EDg7k+ix
	dF+uqXAvUCqsrNqngYdjOfxz53AAd7cK7HP1r/AzNGshxeHAQhSJjAuwz8KgyWRkfhSd/w6pNktkj
	4ebFI09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxiO-0000000C1xe-1tix;
	Thu, 23 Apr 2026 17:19:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxiM-0000000C1xY-3ohF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:19:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3D4960139;
	Thu, 23 Apr 2026 17:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E18C2BCAF;
	Thu, 23 Apr 2026 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776964785;
	bh=Cdmfkm8GEQ2TJcnyq/J8jHFvtrJGx0HP6bi3r/GUzuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iDopWkP4JMOa0oed1lMMwY3+J0HB/CaIEcZaEPVxbZGqZImRl7y3AoHTReBd/KSkP
	 dI7Q0rp7J5qByrzrg7P/zpks1NsLxI0ddqk5TEJOGNCOLpAL6crEIi21ckZgOyL1Ey
	 +7e4FgZ61xdTiOsQOQ1Win77DpXPVAxp9KSzkQWCfSiUmnGxinyswJxG9KGR1jgnOS
	 QE05YJ+x227s4UzoF8yxQrAp6JV2qzbxR35bT5v/0Fhd+64GjSPvauUn51IHJQq6Kb
	 pZG+fQIN7K+Us4iIk18xy67XVpfavN79uYlSzycQ8QH2J42d9zQGklZq7HYdJkANlS
	 8jJYvh11g3X7A==
From: Thomas Gleixner <tglx@kernel.org>
To: Mathias Stearn <mathias@mongodb.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ingo Molnar <mingo@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Blake
 Oler <blake.oler@mongodb.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx>
 <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
Date: Thu, 23 Apr 2026 19:19:41 +0200
Message-ID: <87cxzp1tn6.ffs@tglx>
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

On Thu, Apr 23 2026 at 14:11, Mathias Stearn wrote:

Cc+ Linus

> Of course, even if we make that change, it will only apply to _future_
> binaries. That's why we prefer a kernel fix so that users will be able
> to run our existing releases (or any containers that use them) on a
> modern kernel.

I understand that and as everyone else I would be happy to do that, but
the price everyone pays for proliferating the tcmalloc insanity is not
cheap either.

So let me recap the whole situation and how we got there:

  1) The original RSEQ implementation updates the rseq::cpu_id_start
     field in user space more or less unconditionally on every exit to
     user, whether the CPU/MMCID have been changed or not.

     That went unnoticed for years because nothing used rseq aside of
     google and tcmalloc. Once glibc registered rseq, this resulted in a
     up to 15% performance penalty for syscall heavy workloads.

  2) The rseq::cpu_id_start field is documented as read only for user
     space in the ABI contract and guaranteed to be updated by the
     kernel when a task is migrated to a different CPU.

  3) The RO for userspace property has been enforced by RSEQ debugging
     mode since day one. If such a debug enabled kernel detects user
     space changing the field it kills the task/application.

  4) tcmalloc abused the suboptimal implementation (see #1) and
     scribbled over rseq::cpu_id_start for their own nefarious purposes.

  5) As a consequence of #4 tcmalloc cannot be used on a RSEQ debug
     enabled kernel. Which means a developer cannot validate his RSEQ
     code against a debug kernel when tcmalloc is in use on the system
     as that would crash the tcmalloc dependent applications due to #3.

  6) As a consequence of #4 tcmalloc cannot be used together with any
     other facility/library which wants to utilize the ABI guaranteed
     properties of rseq::cpu_id_start in the same application.

  7) tcmalloc violates the ABI from day one and has since refused to
     address the problem despite being offered a kernel side rseq
     extension to solve it many years ago.

  8) When addressing the performance issues of RSEQ the unconditional
     update stopped to exist under the valid assumption that the kernel
     has only to satisfy the guaranteed ABI properties, especially when
     they are enforcable by RSEQ debug.

     As a consequence this exposed the tcmalloc ABI violation because
     the unconditional pointless overwriting of something which did not
     change stopped to happen.

Due to #4 everyone is in a hard place and up a creek without a paddle.

Here are the possible solutions:

  A) Mathias suggested to force overwrite rseq:cpu_id_start everytime
     the rseq::rseq_cs field is cleared by the kernel under the not yet
     validated theoretical assumption that this cures the problem for
     tcmalloc.

     If that's sufficient that would be harmless performance wise
     because the write would be inside the already existing STAC/CLAC
     section and just add some more noise to the rseq critical section
     operations.

     That would allow existing tcmalloc usage to continue, but
     obviously would neither solve #5 and #6 above nor provide an
     incentive for tcmalloc to actually fix their crap.

  B) If that's not sufficient then keeping tcmalloc alive would require
     to go back to the previous state and let everyone else pay the
     price in terms of performance overhead.

  C) Declare that this is not a regression because the ABI guarantee is
     not violated and the RO property has been enforcable by RSEQ
     debugging since day one.

In my opinion #C is the right thing to do, but I can see a case being
made for the lightweight fix Mathias suggested (#A) _if_ and only _if_
that is sufficient. Picking #A would also mean that user space people
have to take up the fight against tcmalloc when they want to use the
RSEQ guaranteed ABI along with tcmalloc in the same application or use a
RSEQ debug kernel to validate their own code.

Going back to the full unconditional nightmare (#B) is not an option at
all as anybody else has to take the massive performance hit.

Oh well...

Thanks,

        tglx

