Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B26DFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oc9TnYP0ELw2gTNOmHBfMg01eyu2JvG2Rc/mXPMTrsM=; b=alBkOOHjBX1cAfqC3PeRDYm+G8
	VHOAN8MV7LoYmqbKt4eb37Q4OUBT/oIg4fvS+aBqRneuekp/D9MgLCOW5rHa6ciQZ+WxxCpkdfLPz
	TD1f/CI6xICcoWoww9PuzlleRWk4d/2cYUcGeVwo4WCAmbYMbXIVc6GGInp0SplA8KcFFm2QAQOhV
	k6Q6V109Rz2rSrY/EoSO0H1v+VnO90XsThMIqA25CBHWgXdQutBOfb4wnhU1qbucFFFnD540kPSjc
	irLD+h/Ne5t9v2nQnxfwSDCj9zSs57xzSzmfp6PcoppbJef7Na3RZS9QhEjTj9hbUsUc4KYt614VU
	nHoeEM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJkY-0000000GkT7-2eYa;
	Mon, 27 Apr 2026 11:03:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJkX-0000000GkT1-0URJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 11:03:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69CE460180;
	Mon, 27 Apr 2026 11:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579ACC2BCB6;
	Mon, 27 Apr 2026 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777287816;
	bh=mfBAB9FOwkm1Dop7GmMwc5djKkLgtg5prbiveNDEdfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=otd0/abjUvw83JPGQOA2ciEwz7mgMnJ3o+QFjuaxPsN8ubpwpOxV9sHQbzcm8jOv/
	 2EaWRp+AzJjyJDmuGRGuqtVXjqmLLqRSUYP6qLpo3SmOYNNOUc61RQdmt3SGB/g5D4
	 Dr0LeH5zkb3vAWr0/LJDfuCVK6FPnLHng4CzEjBemuBmrdVfBeVDQCoyB8ii3Bn6X1
	 SHgxf1ryl6sPypmZYS+ccHOZWr1+xdFe7fj2EnwJPbT3aYAhXZ2pKHly5nHzURbFoE
	 8DA0/mz3h362AGfaBATTWHfXod8o5mHpRv3safu6kJ4CvsXEV2xvboDPilL0fE4u/m
	 tTx+VMWL4/K5w==
From: Thomas Gleixner <tglx@kernel.org>
To: Florian Weimer <fweimer@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Mathias Stearn
 <mathias@mongodb.com>, Dmitry Vyukov <dvyukov@google.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ingo
 Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>, Rich
 Felker <dalias@libc.org>, Matthew Wilcox <willy@infradead.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds
 <torvalds@linuxfoundation.org>, criu@lists.linux.dev
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <lhujyts4zr8.fsf@oldenburg.str.redhat.com>
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
Date: Mon, 27 Apr 2026 13:03:32 +0200
Message-ID: <87h5owzmuz.ffs@tglx>
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

On Mon, Apr 27 2026 at 09:40, Florian Weimer wrote:
> * Thomas Gleixner:
>> The real question is how to differentiate between the legacy and the
>> optimized mode. I have two working variants to achieve that:
>>
>>    1) The fully safe option requires a new flag for RSEQ
>>       registration. It obviously requires a glibc update. (Suggested by
>>       PeterZ)
>
> Without glibc changes, RSEQ would keep working, but with the old,
> problematic performance, right?

Correct.

> If we don't have a notification in the auxiliary vector, we'd have to do
> two system calls at process start, which isn't ideal, but is probably
> not a significant issue, either.
>
> I haven't verified this, but it looks like introducing the flag breaks
> CRIU?  In dump_thread_rseq, we have this:
>
>         if (rseqc.flags != 0) {
>                 pr_err("something wrong with ptrace(PTRACE_GET_RSEQ_CONFIGURATION, %d) flags = 0x%x\n", tid,
>                        rseqc.flags);
>                 return -1;
>         }

Yeah. That'd need to be fixed or work around.

> I suppose a workaround could make this behavior flag a prctl flag.  CRIU
> wouldn't dump and restore that until taught about it.  If the new
> behavior is switched on explicitly by the flag, it would be
> backwards-compatible, except that restoring with unpatched CRIU would
> lead to a performance loss.

It's worse. The flag will also enable extended RSEQ features beyond
mmcid and requires that the registered rseq size is >= offsetof(struct
rseq, end)'

>>    2) Determine the requirements of the registering task via the size of
>>       the registered RSEQ area.
>>
>>       The original implementation, which TCMalloc depends on, registers
>>       a 32 byte region (ORIG_RSEG_SIZE). This region has 32 byte
>>       alignment requirement.
>>
>>       The extension safe newer variant exposes the kernel RSEQ feature
>>       size via getauxval(AT_RSEQ_FEATURE_SIZE) and the alignment
>>       requirement via getauxval(AT_RSEQ_ALIGN). The alignment
>>       requirement is that the registered rseq region is aligned to the
>>       next power of two of the feature size. The kernel currently has a
>>       feature size of 33 bytes, which means the alignment requirement is
>>       64 bytes.
>
> There are still glibc builds in use that do not use AT_RSEQ_ALIGN, and
> instead unconditionally reserve a size of 32.  In some builds, the RSEQ
> area is not aligned to a multiple of 64, which makes glibc
> indistinguishable from tcmalloc.

That's how it is. So with a size of 32 this will fallback to legacy mode
and not unlock the extended features independent of the alignment. The
alignment requirements are:

          Size 32:     32 bytes
          Size >32:    64 bytes

> You could look at the location of the thread pointer relative to the
> RSEQ area at registration to tell them apart, but that is perhaps too
> nasty.

*Blink*

> Switching to the new extensible RSEQ allocation code in older glibc
> builds is not entirely trivial, and I would prefer not doing that.
> Registering with a new flag is comparatively simple, and we could
> backport it, except that it might not be compatible with CRIU.

Neither with CRIU nor with the requirement to support additional
features which require the registered rseq memory size to be at least as
large as the kernel requires. That's why we have AT_RSEQ_FEATURE_SIZE.

Otherwise we'd end up with runtime conditionals for every single
feature, which just adds more gunk into the hotpaths and ends up in a
ever growing compatibility nightmare.

So if a process runs on a newer kernel with let's say 40 bytes rseq
size, then it can't be safely migrated with CRIU to a older kernel with
32 bytes rseq size as you don't know whether the process uses some of
the extended features in the newer kernel already. But that's not any
different from extended syscall features etc.

So with the size based detection we end up with the following:

  Size 32:             legacy mode no matter whether that's TCMalloc or
                       glibc. Does not support extended features
  
  Size >= kernel size: optimized mode with support for extended features

Thanks,

        tglx



