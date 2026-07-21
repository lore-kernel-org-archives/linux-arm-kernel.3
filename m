Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211FDC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdTw4Ljy/iEi6EJKnYY/hTaPD8fG2xXNmAjMarXklqU=; b=w4BrCHIwdoJW9+jKvwetqdTR53
	dZJoWnN9dsnMrjjnpYmCRMnQ8DOOSyD9J5pLSQztZf08Z1AXOUxggoeZne1BAodqE7xuIPODr8Xus
	xdCVHvGOG7+nHY+tuEIxvcXpazuyFHYFMZJoa9srwXFhsxXYRdkjzqHPgMvgHKGgUg7nhfnXiyr3l
	7YgleMdsBYn8048wapimtee4whbgfvyCr7abrAG2SSUDhMU4jL0f8jdzYKEyiccgb202/e3BXnFqx
	dp19jSR08ZUXh5dT98jpWDDKb3j395kX9QvSbmX40MUveiFEktfoXYM2kgLC1EiWItzIP4s8KLiyl
	SGKwT5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFpR-0000000AG9g-0hcg;
	Tue, 21 Jul 2026 19:08:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFpO-0000000AG8n-3pkI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 19:08:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2EFF152B;
	Tue, 21 Jul 2026 12:08:23 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10ED43F58B;
	Tue, 21 Jul 2026 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784660907; bh=6TZNhGMiK6SIIRkXwPe07Z1IbHnyi9FAC1oXtous4SM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qtmSlt+YSuFKMmK97ciSuK0jD2TtFWOpJZ/4+0L3kKd7p/KzmZprjUDCL50RIJ4su
	 jZNtWdT21n9OWv405MRaEowPh4FZPtevxz8huBWMZJf7WNjfNsCKsiaSOFHzXji5nU
	 xWcioUiVkpu9s1lxQsD58gdsiYwJyJCjV8aeTl9Q=
Date: Tue, 21 Jul 2026 20:08:20 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <al_DpFJFcmVhxpvW@J2N7QTR9R3>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_120831_107457_326E7C30 
X-CRM114-Status: GOOD (  18.13  )
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
Cc: gor@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, urezki@gmail.com, Yang Shi <yang@os.amperecomputing.com>, cl@gentwo.org, david@kernel.org, tj@kernel.org, dennis@kernel.org, akpm@linux-foundation.org, will@kernel.org, agordeev@linux.ibm.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2026 at 02:23:33PM +0100, Ryan Roberts wrote:
> We have observed a few performance regressions recently, for which the
> root cause is increased use of this_cpu_*. We have somebody at Arm
> about to start an investigation into whether in-kernel rseq can solve
> the problem.

FWIW, I had a look into something rseq like (resetting the PC upon
preemption or any exception), and I ended up with a GPR fixup scheme.
That avoids the need to disable/enable preemption, and only requires a
read of current and a couple of stores, which *should* be cheap.

The approach is similar to Peter Zijlstra's in-kernel rseq scheme [1],
and Heiko Carsten's approach for s390 [2]:

  [1] https://lore.kernel.org/lkml/20260223163843.GR1282955@noisy.programming.kicks-ass.net/
  [2] https://lore.kernel.org/lkml/20260526055702.1429061-1-hca@linux.ibm.com/

A key difference is that I ignore the PC entirely, and *only* track whether
GPRs are in use by a critical section. The GPR fixup is idempotent, and
can safely be applied anywhere in the critical section. Ignoring the PC
means that (in theory at least) this should work with kprobes, etc.

I've rebased and cleaned that up a bit, and pushed a WIP version to my
arm64/percpu-fixup branch:

  git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git

I'll aim to have a more complete/polished version out in the near
future.

The key idea is that every percpu op has a critical section during which
it maintains three distinct GPRs:

  <pcp> : The original __percpu pointer.
  <off> : The percpu offset.
  <addr>: The final pointer (<pcp> + <off>).

Whenever the kernel performs an exception return back into a critical
section, it can fix up <off> and <addr>, as described below. The
critical section is roughly as follows:

	/*
	 * Prologue.
	 *
	 * At the start, <pcp> is already set, but <off> and <addr> are
	 * uninitialised.
	 *
	 * After this STR, upon an exception return into this critical
	 * section, the kernel will:
	 * 1. Update <off> to the current CPU's offset.
	 * 2. Update <addr> to be <pcp> + <off>.
	 */
	mrs	<tsk>, sp_el0
	mov	<tmp>, ENCODE_REGISTER_NUMBERS(<pcp>, <off>, <addr>)
	strh	<tmp>, [<tsk>, #TSK_TI_PCPU_GPRS]

	/*
	 * Generate the address. Any preemption within this critical
	 * section will result in <off> and <addr> being updated to
	 * match the CPU that this is resumed upon.
	 */
	mrs	<off>, TPIDR_ELx
	add	<addr>, <pcp>, <off>

	/* The actual operation, e.g. read/write/cmpxchg */
	DO_SOMETHING_WITH(<addr>)

	/*
	 * Epilogue.
	 *
	 * After this STR, the kernel will no longer apply the fixups.
	 */
	strh	wzr, [<tsk>, #TSK_TI_PCPU_GPRS]

To handle nesting, the exception code is updated to save/restore the
register numbers in pt_regs (and clearing the active value at entry) so
that this safely nests.

With that, a simple test case such as:

  u64 outline_this_cpu_read_u64(u64 __percpu *p)
  {
          return this_cpu_read(*p);
  }

... is reduced from:

  <outline_this_cpu_read_u64>:
         paciasp
         stp     x29, x30, [sp, #-32]!
         mrs     x1, sp_el0
         mov     x29, sp
         ldr     w2, [x1, #8]
         add     w2, w2, #0x1
         str     w2, [x1, #8]
         mrs     x2, tpidr_el1
         ldr     x0, [x0, x2]
         ldr     x2, [x1, #8]
         sub     x2, x2, #0x1
         str     w2, [x1, #8]
         cbz     x2, 1f
         ldr     x1, [x1, #8]
         cbnz    x1, 2f
  1:
         str     x0, [sp, #24]
         bl      0 <preempt_schedule_notrace>
         ldr     x0, [sp, #24]
  2:
         ldp     x29, x30, [sp], #32
         autiasp
         ret

... down to:

  <outline_this_cpu_read_u64>:
         mrs     x2, sp_el0        // Prologue
         mov     x4, #0xc80        // Prologue
         strh    w4, [x2, #20]     // Prologue
         mrs     x4, tpidr_el1
         add     x3, x0, x4
         ldr     x1, [x3]
         strh    wzr, [x2, #20]    // Epilogue
         mov     x0, x1
         ret

... which is clearly much better.

As noted above, the branch is a WIP. There are a bunch of things to do
(in particular, factoring out the xchg and cmpxchg assembly), but I
don't currently see a major technical blocker for the fixup approach.

Mark.

