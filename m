Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4B0FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oobTzOX7i4MIy1riYu+wrYe1KnO25sT66uEV97v13co=; b=DO2MLTW4ls2spw+xl32VOnWIjJ
	uARtN4MbsGz89l4b8cKpaVNGUKSDEMqLVqvCyzEXWiGGL58Owwk3EpuV1GhRmkf2R1W4/nL+aUYmr
	h3ps4IubdeFtsrEogH2QD0spEgPC5RVGaJ8LkaOtqoFdblDJURkKBIx6BfmfcN2yc2sMZV4corJEQ
	dkAmDuqpihLe1Vw3IB7YXvwYeGplTH5/9ewewtuQMwCIvCxIYwBKdX0vjfBzJEk05fx41YaXJSRTD
	0zFgBiW5oabCXYbw10bGFX83nlMiGgmyrnKP9FGmP+Hb6LQVMyXq+h7BrtENX/VHE5bpsNHePpYcs
	8uirF5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdeV-00000000rwI-0Wmg;
	Tue, 28 Apr 2026 08:18:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdeT-00000000rw0-25TW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:18:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C16261145;
	Tue, 28 Apr 2026 08:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FA4C2BCB6;
	Tue, 28 Apr 2026 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777364320;
	bh=MhezThA/nJ+hhYlIaaGQ8ij0+fmtxu+kVhgm7c/bqys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KoiIKsZVUlhecxBNBYmQEotK+aS0RK1/dQsgOKul81md2mFjJYhmHKpjrJfr6Iz2D
	 HQQW8Qf3mT3exqI38otWfZpNxkNc0n3uo2QpDP1OBDdiDq3SMP9PCdmVWMqXL4mjpY
	 aXYPxRMk+IbwHdNuwi2PlqrV/KZxYzeaT32k3+emMojKxBTWNHLue8heBzpWmw2h86
	 FiwlCoRxoxwBkCRxOuvUUadL3Kx9BBsMiIlwbc8b1kCgDoJ7A3K5o8ZQFQcqcJgTej
	 HRm80v2iFmZMTpIjGKoQJcT56rr/m4f86WdE3+cfEeGgT6NxYSUVyQq9wfE+tBtzZW
	 oPJA0BNAFcWLg==
From: Thomas Gleixner <tglx@kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Mathias Stearn
 <mathias@mongodb.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ingo
 Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>, Florian
 Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, Matthew Wilcox
 <willy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <878qa7zexc.ffs@tglx>
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
 <CACT4Y+ZofNqpeDdgde969LzLznxbRb8CPB6m=CS2RiSmkSYPQQ@mail.gmail.com>
 <878qa7zexc.ffs@tglx>
Date: Tue, 28 Apr 2026 10:18:36 +0200
Message-ID: <875x5bzeeb.ffs@tglx>
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

On Tue, Apr 28 2026 at 10:07, Thomas Gleixner wrote:
>> Not sure if that's it, or there is something else.
>
> Can you try the updated version below?

Is there a pre-compiled version of those tcmalloc tests somewhere?

I tried to build it from source, but I really have better things to do
than wasting my time on debugging this bazel nonsense.

Thanks,

        tglx

