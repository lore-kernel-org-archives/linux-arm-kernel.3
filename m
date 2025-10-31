Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1ADFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 22:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0CdrMFKCDIaUXMog2vVyZgvP4aNEghJxonSDjZ9zss=; b=WTsS6hH+Zr+z5LiR2e3HiPSmPx
	DzVC0hQXr2jmS4FoNWivQ76als1jZgIzdX6paMJlSpk2O/MM3EOVKGPAynGpCbHtt48LLHxQrlTjb
	tr6nrH4xnI4xVKYuR5DIrmqSQpNBTo2Az0LT+QcSW9a0ClRtkl0YWjVPBG6i9nwsta2vapuUTZdGH
	9Jc6RunTPaV5Gyqv+4O2GmB1Sxfh3eyYuSubseVi2Ug63yOeXSBRJ6LczwNms/8p1Q0RenLXWGspf
	fvuT23ThS0D1ih/4ei0cs5VivUou0ZexEtZ4ILUEkW1Vyt/DkqrshzNdAunbTo5iDuLq5qlZr0q4Z
	JkQ4daGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExqP-00000006sLf-2JiV;
	Fri, 31 Oct 2025 22:43:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExqO-00000006sLV-31Mu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 22:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB640601B6;
	Fri, 31 Oct 2025 22:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80604C4CEE7;
	Fri, 31 Oct 2025 22:43:38 +0000 (UTC)
Date: Fri, 31 Oct 2025 22:43:35 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQU7l-qMKJTx4znJ@arm.com>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
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

On Fri, Oct 31, 2025 at 12:39:41PM -0700, Paul E. McKenney wrote:
> On Fri, Oct 31, 2025 at 06:30:31PM +0000, Catalin Marinas wrote:
> > On Thu, Oct 30, 2025 at 03:37:00PM -0700, Paul E. McKenney wrote:
> > > To make event tracing safe for PREEMPT_RT kernels, I have been creating
> > > optimized variants of SRCU readers that use per-CPU atomics.  This works
> > > quite well, but on ARM Neoverse V2, I am seeing about 100ns for a
> > > srcu_read_lock()/srcu_read_unlock() pair, or about 50ns for a single
> > > per-CPU atomic operation.  This contrasts with a handful of nanoseconds
> > > on x86 and similar on ARM for a atomic_set(&foo, atomic_read(&foo) + 1).
> > 
> > That's quite a difference. Does it get any better if
> > CONFIG_ARM64_LSE_ATOMICS is disabled? We don't have a way to disable it
> > on the kernel command line.
> 
> In other words, build with CONFIG_ARM64_USE_LSE_ATOMICS=n, correct?

Yes.

> Yes, this gets me more than an order of magnitude, and about 30% better
> than my workaround of disabling interrupts around a non-atomic increment
> of those counters, thank you!
> 
> Given that per-CPU atomics are usually not heavily contended, would it
> make sense to avoid LSE in that case?

In theory the LSE atomics should be as fast but microarchitecture
decisions likely did not cover all the use-cases. I'll raise this
internally as well, maybe we get some ideas from the hardware people.

> And I need to figure out whether I should recommend that Meta build
> its arm64 kernels with CONFIG_ARM64_USE_LSE_ATOMICS=n.  And advice you
> might have would be deeply appreciated!  (I am of course also following
> up internally.)

I wouldn't advise turning them off just yet, they are beneficial for
other use-cases. But it needs more thinking (and not that late at night ;)).

> > Interestingly, we had this patch recently to force a prefetch before the
> > atomic:
> > 
> > https://lore.kernel.org/all/20250724120651.27983-1-yangyicong@huawei.com/
> > 
> > We rejected it but I wonder whether it improves the SRCU scenario.
> 
> No statistical difference on my system.  This is a 72-CPU Neoverse V2, in
> case that matters.

I just realised that patch doesn't touch percpu.h at all. So what about
something like (untested):

-----------------8<------------------------
diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 9abcc8ef3087..e381034324e1 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -70,6 +70,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
 	unsigned int loop;						\
 	u##sz tmp;							\
 									\
+	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
 	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
 	/* LL/SC */							\
 	"1:	ldxr" #sfx "\t%" #w "[tmp], %[ptr]\n"			\
@@ -91,6 +92,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
 	unsigned int loop;						\
 	u##sz ret;							\
 									\
+	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
 	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
 	/* LL/SC */							\
 	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
-----------------8<------------------------

> Here are my results for the underlying this_cpu_inc()
> and this_cpu_dec() pair of operations:
> 
> 	LSE Atomics Enabled (Stock)	LSE Atomics Disabled
> 
> Without Yicong’s Patch (Stock)
> 
> 			    110.786		       9.852
> 
> With Yicong’s Patch
> 
> 			    109.873		       9.853
> 
> As you can see, disabling LSE gets about an order of magnitude
> and Yicong's patch has no statistically significant effect.
> 
> This and more can be found in the "Per-CPU Increment/Decrement"
> section of this Google document:
> 
> https://docs.google.com/document/d/1RoYRrTsabdeTXcldzpoMnpmmCjGbJNWtDXN6ZNr_4H8/edit?usp=sharing
> 
> Full disclosure: Calls to srcu_read_lock_fast() followed by
> srcu_read_unlock_fast() really use one this_cpu_inc() followed by another
> this_cpu_inc(), but I am not seeing any difference between the two.
> And testing the underlying primitives allows my tests to give reproducible
> results regardless of what state I have the SRCU code in.  ;-)

Thanks. I'll go through your emails in more detail tomorrow/Monday.

-- 
Catalin

