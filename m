Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82300CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 19:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GctXqqwq29gzrkvaDlLQqMTX++Y+8RuGuXk9QTItqHw=; b=kXyCSu/cbzKRQqmsD7eErpG5ee
	g7c5YDM2LqymalLgNWDTehecn7cGWwc7t4L9Q6hkJaUAqfbT3CWT63MpFgFpMSGHZQzwUvQjqTAuG
	C7GE8I8ij0uNU2Tmz/F7Tt4uzTqCPt302n0C3E5+T0kEdgvyKTKnmwBXjPactaG9zi5EorKUM+B6D
	oWueMsrPYDOSlEPSbY7EOeT3Gp9Rr1NSduMxdzirqRoiGMqkRS68RgUSg5ZkmOsETfV9pRZ1+yNHC
	Rzo8FgABnfkpH/K3tE70F1fzweflS64tld6lmAmO1QsG8oUmRghJpF35iFXuMW+mnI3eSTgNpTF9Q
	xXUzsJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuyQ-00000006jBw-1lPJ;
	Fri, 31 Oct 2025 19:39:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuyN-00000006jB9-1txP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 19:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38540446AF;
	Fri, 31 Oct 2025 19:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9BCC4CEE7;
	Fri, 31 Oct 2025 19:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761939582;
	bh=j0kdcnOS4wp/B9Iv4K5vIQWuojAFEyejrrlkJvsu4TI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=jppHkdIm8Vsc2CfKtKRS40xUj8v9ljGC31ZjXLKN7n02B22RecckbkASbXMG8MJTo
	 c4LmnIe815rya/Q6hAxEouyU2t3MwA+fNQ0mbZ1Nj8cCTAJ009+SHP/qROsg1tB1gD
	 +W1tvqYl2pGUpx5TvzxQiZQ4ntZm8uL7ULc4abJV1IrjqW+nSPgZKeU++KQcOHHg85
	 wTZTYEraIYwBBJGb1ggjvw4bI4SrEuxazO+AiALFg1snZIEmiXL7oVFDSCiDQsaBED
	 hpwtt3rAh0DPpTbneteqd0V5KxpZo7umvzpT/FXHY6IxrNhZeHOoY9yZebRrZ4IK0q
	 nRaljHiL5e/Hw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9999BCE0DEC; Fri, 31 Oct 2025 12:39:41 -0700 (PDT)
Date: Fri, 31 Oct 2025 12:39:41 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQUAR9MRxP6_qtEH@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_123943_540057_4817F02C 
X-CRM114-Status: GOOD (  26.77  )
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Oct 31, 2025 at 06:30:31PM +0000, Catalin Marinas wrote:
> On Thu, Oct 30, 2025 at 03:37:00PM -0700, Paul E. McKenney wrote:
> > To make event tracing safe for PREEMPT_RT kernels, I have been creating
> > optimized variants of SRCU readers that use per-CPU atomics.  This works
> > quite well, but on ARM Neoverse V2, I am seeing about 100ns for a
> > srcu_read_lock()/srcu_read_unlock() pair, or about 50ns for a single
> > per-CPU atomic operation.  This contrasts with a handful of nanoseconds
> > on x86 and similar on ARM for a atomic_set(&foo, atomic_read(&foo) + 1).
> 
> That's quite a difference. Does it get any better if
> CONFIG_ARM64_LSE_ATOMICS is disabled? We don't have a way to disable it
> on the kernel command line.

In other words, build with CONFIG_ARM64_USE_LSE_ATOMICS=n, correct?

Yes, this gets me more than an order of magnitude, and about 30% better
than my workaround of disabling interrupts around a non-atomic increment
of those counters, thank you!

Given that per-CPU atomics are usually not heavily contended, would it
make sense to avoid LSE in that case?

And I need to figure out whether I should recommend that Meta build
its arm64 kernels with CONFIG_ARM64_USE_LSE_ATOMICS=n.  And advice you
might have would be deeply appreciated!  (I am of course also following
up internally.)

> Depending on the implementation and configuration, the LSE atomics may
> skip the L1 cache and be executed closer to the memory (they used to be
> called far atomics). The CPUs try to be smarter like doing the operation
> "near" if it's in the cache but the heuristics may not always work.

My knowledge-free guess is that it is early days for LSE, and that it
therefore has significant hardware-level optimization work ahead of it.
For example, I well recall being roundly denounced by Intel engineers in
my neighborhood for reporting similar performance results on Pentium 4
back in the day.  The truth might well have set them free, but it sure
didn't make them happy!  ;-)

But what would a non-knowledge-free guess be?

> Interestingly, we had this patch recently to force a prefetch before the
> atomic:
> 
> https://lore.kernel.org/all/20250724120651.27983-1-yangyicong@huawei.com/
> 
> We rejected it but I wonder whether it improves the SRCU scenario.

No statistical difference on my system.  This is a 72-CPU Neoverse V2, in
case that matters.  Here are my results for the underlying this_cpu_inc()
and this_cpu_dec() pair of operations:

	LSE Atomics Enabled (Stock)	LSE Atomics Disabled

Without Yicong’s Patch (Stock)

			    110.786		       9.852

With Yicong’s Patch

			    109.873		       9.853

As you can see, disabling LSE gets about an order of magnitude
and Yicong's patch has no statistically significant effect.

This and more can be found in the "Per-CPU Increment/Decrement"
section of this Google document:

https://docs.google.com/document/d/1RoYRrTsabdeTXcldzpoMnpmmCjGbJNWtDXN6ZNr_4H8/edit?usp=sharing

Full disclosure: Calls to srcu_read_lock_fast() followed by
srcu_read_unlock_fast() really use one this_cpu_inc() followed by another
this_cpu_inc(), but I am not seeing any difference between the two.
And testing the underlying primitives allows my tests to give reproducible
results regardless of what state I have the SRCU code in.  ;-)

Thoughts?

							Thanx, Paul

