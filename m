Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D8AC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3+qVisYjuRaflD1DyffZTeU5aICyfpRHb97An/7xE8=; b=o2QCZLFhLRRAaPFfCAJuBmTcpz
	jn/1gPpfs3jOaWaFdFwdb2AWXk6FxDeHMYwY8GQoPbol5wmk/CnoYRGQg1dJkQEumr4p1/P9cbehi
	2ruWxdjXKwEKL5PJTptH/X6+V3QiQARY2Jaxzcz16YLm10E3sY8vaFOov7TL/3eNtbbHPB0/c5EgU
	IRt4c5yZMigFkvyPw0JFaXXFHQ/vMeKxwynecciiscL/Z+C9PjwHXD4SGiKF6i6eLg49w5gMEe5JV
	cQTqnYsstuika/1Jgm+v0o4DBS4T2zdFoeGY9CJSUZYTPX6VF20gilYqU1YQhRNtWfwPX8jlPh8eF
	dfUlZIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQw7-0000000DhJm-12KG;
	Tue, 20 May 2025 17:39:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQtx-0000000Dh1q-2RRA;
	Tue, 20 May 2025 17:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40D575C59AF;
	Tue, 20 May 2025 17:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BB4C4CEE9;
	Tue, 20 May 2025 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747762635;
	bh=0b42x+ivEyP5l3OMfgQmSLjAq9HIV5l+NtIDagsDl20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AkojSDDkAIrmtRBD4USDtEmsYxmSm8dpmPU33ULoquAZvqEMe8zz5SFVjDJPs5aST
	 UuQQ9BKPpRJRfnZPMMqLjFvS0mZjwiK9Z6QSRu6M2dNUQ4BsLHlbvp8O/9gtqVz0NU
	 KpcJll/+OLCCbkgqPv8HZHS/4lvjga7kkK5Wpw688Jj9UTWI9/Rbww4ayzjszSXLyR
	 a+epo8/UEJ0UuDKOVAPLBGwBY3weSQdcc5nIVsg4E4B+sknxeC04gBdH9awZ7RGO6p
	 PKBo3QfqNS59dFCVeA6Z9USSFeVHo12jnLII6MgoHQBUDvt5DUKCOu8WiZyapgAXVe
	 fROaenPCO1gog==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Himanshu
 Chauhan
 <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Xu Lu
 <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v4 0/4] riscv: add support for SBI Supervisor Software
 Events
In-Reply-To: <20250516152355.560448-1-cleger@rivosinc.com>
References: <20250516152355.560448-1-cleger@rivosinc.com>
Date: Tue, 20 May 2025 19:37:12 +0200
Message-ID: <87sekzi3p3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_103717_705875_41A9A918 
X-CRM114-Status: GOOD (  29.11  )
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

Cl=C3=A9ment!

Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com> writes:

> The SBI Supervisor Software Events (SSE) extensions provides a mechanism
> to inject software events from an SBI implementation to supervisor
> software such that it preempts all other supervisor level traps and
> interrupts. This extension is introduced by the SBI v3.0 specification[1].
>
> Various events are defined and can be send asynchronously to supervisor
> software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
> as platform specific events. Events can be either local (per-hart) or
> global. Events can be nested on top of each other based on priority and
> can interrupt the kernel at any time.
>
> First patch adds the SSE definitions. Second one adds support for SSE
> at arch level (entry code and stack allocations) and third one at driver
> level. Finally, the last patch add support for SSE events in the SBI PMU
> driver. Additional testing for that part is highly welcomed since there
> are a lot of possible path that needs to be exercised.
>
> Amongst the specific points that needs to be handle is the interruption
> at any point of the kernel execution and more specifically at the
> beginning of exception handling. Due to the fact that the exception entry
> implementation uses the SCRATCH CSR as both the current task struct and
> as the temporary register to switch the stack and save register, it is
> difficult to reliably get the current task struct if we get interrupted
> at this specific moment (ie, it might contain 0, the task pointer or tp).
> A fixup-like mechanism is not possible due to the nested nature of SSE
> which makes it really hard to obtain the original interruption site. In
> order to retrieve the task in a reliable manner, add an additional
> __sse_entry_task per_cpu array which stores the current task. Ideally,
> we would need to modify the way we retrieve/store the current task in
> exception handling so that it does not depend on the place where it's
> interrupted.
>
> Contrary to pseudo NMI [2], SSE does not modifies the way interrupts are
> handled and does not adds any overhead to existing code. Moreover, it
> provides "true" NMI-like interrupts which can interrupt the kernel at
> any time (even in exception handling). This is particularly crucial for
> RAS errors which needs to be handled as fast as possible to avoid any
> fault propagation.
>
> While OpenSBI SSE support is already upstream, an additional patch is
> needed for the PMU perf driver to work as expected [2].
>
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3=
.0-rc7/riscv-sbi.pdf [1]
> Link: https://github.com/rivosinc/opensbi/tree/dev/cleger/sse_pmu_irq [2]

Finally got around having a look/test!

Thanks for adding all the SSE tests to kvm-unit-tests [1]! What a hidden
gem -- at least to me!

It would be nice with similar tests in kselftest, so that we can
exercise the SSE paths on the CI worker!

...and a couple of general comments that apply to all patches.

  * There are a bunch of checkpatch warnings/errors -- not all make
    sense, but some do!
  * Minor spelling errors in the commit messages, that codespell
    catches.
  * There are some new unused variables warnings in the build.

Most of that (modulo the spellchecks) in PW [2].
=20=20
I'll have some minor things in the other patches.


Thanks for working on this, and looking forward to having it land!
Bj=C3=B6rn

[1] https://gitlab.com/kvm-unit-tests/kvm-unit-tests
[2] https://patchwork.kernel.org/project/linux-riscv/list/?series=3D963680

