Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00E3CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XVKM6UF53pfme8D8bHidJVAWdDzjlL10/7ImpYmQCA=; b=uNGq8/bWR+oAYKXikppFlZyEUT
	LfHpzL/Rqn5adg7gY6hdk+Yf3Eanu6mz0LMBYTlXafFntbIK0InO2JVKywx2Sd/NYYkyEO5+cWEdB
	64iv2+pN1kKXW0ZgeTBglhMt9erFkSsJItoGGjoYxAHO92i4YRO9iT7xN19truhLM1oeoE5KGpnC+
	pqN4GOBu5VLSk/OZ7EAKpoBOZP5/T97+l8+0z0G4KT2yRrgNSfLBLIOxa057W78u5OjdmVCDTedBi
	FS1xbLmaWziuP+V6WAMxoLAktS45YUDLfSKLWeeVRWFP36L9tmJgjWHLT3zazIRZ7a326SWQ5xzic
	XUyfWRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExV8-00000006rJX-096S;
	Fri, 31 Oct 2025 22:21:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExV6-00000006rJO-1qe1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 22:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39A4960256;
	Fri, 31 Oct 2025 22:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18ACC4CEE7;
	Fri, 31 Oct 2025 22:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761949298;
	bh=kbtWjVrlAh1nObdL3lBppK9zumwscuazIRUIkocJERM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=MLvHUeD/zj82Xj+2g6Rb9DRhatOKw6rEfMxe7UUqrHOXadulrX1kK+aWLDiX23nti
	 iJe/4fEuxeRtqIb8kBIcyM1pGJ3420VlL8Kv42uZi+6vmOT+OfcE9eiPEcHri3FiHM
	 Wq7Tb1eWsxH7VpV+y8LPM7twKRETKWwTLT4rqD7mDvloOUCXqy7brGTjUIUPoHbYoD
	 Cd0ylmWoaHAVAFSb242z5OCgegR6fJK2CfcQ3hJ9FND72hgTpLwoNm7mY9EXM8wuAN
	 QSJGArw0G1I+YJ3iQ2GRLexzKvP/2cD0pdWS8xSTQ6D9N77FlAclwJGBnnWGCol8V5
	 ykzwtYqbXWn/g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4F617CE0DEC; Fri, 31 Oct 2025 15:21:38 -0700 (PDT)
Date: Fri, 31 Oct 2025 15:21:38 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <43c2b8f3-e7b3-4f0d-837c-eabc059af0f4@paulmck-laptop>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Reply-To: paulmck@kernel.org
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
> 
> Yes, this gets me more than an order of magnitude, and about 30% better
> than my workaround of disabling interrupts around a non-atomic increment
> of those counters, thank you!
> 
> Given that per-CPU atomics are usually not heavily contended, would it
> make sense to avoid LSE in that case?

For example, how about something like the patch below?

							Thanx, Paul

------------------------------------------------------------------------

commit 0c0b71d19c997915c5ef5fe7e32eb56b4e4a750e
Author: Paul E. McKenney <paulmckrcu@fb.com>
Date:   Fri Oct 31 14:14:13 2025 -0700

    arm64: Separately select LSE for per-CPU atomics
    
    LSE atomics provide better scalability, but not always better single-CPU
    performance.  In fact, on the ARM Neoverse V2, they degrade single-CPU
    performance by an order of magnitude, from about 5ns per operation to
    about 50ns.
    
    Now per-CPU atomics are rarely contended, in fact, a given per-CPU
    variable is usually used mostly by the CPU in question.  This means
    that LSE's better scalability does not help, but its degraded single-CPU
    performance does hurt.
    
    Therefore, provide a new default-n ARM64_USE_LSE_PERCPU_ATOMICS Kconfig
    option that uses LSE for per-CPU atomics.  This means that default kernel
    builds will use non-LSE atomics for this case, but will still use LSE
    atomics for the global atomic variables that are more likely to be
    heavily contended, and thus are more likely to benefit from LSE.
    
    Signed-off-by: Paul E. McKenney <paulmckrcu@fb.com>
    Cc: Catalin Marinas <catalin.marinas@arm.com>
    Cc: Will Deacon <will@kernel.org>
    Cc: <linux-arm-kernel@lists.infradead.org>

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 58b782779138..b91b7cbe4569 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1927,6 +1927,21 @@ config ARM64_USE_LSE_ATOMICS
 	  atomic routines. This incurs a small overhead on CPUs that do
 	  not support these instructions.
 
+config ARM64_USE_LSE_PERCPU_ATOMICS
+	bool "LSE for per-CPU atomic instructions"
+	default n
+	help
+	  As part of the Large System Extensions, ARMv8.1 introduces new
+	  atomic instructions that are designed specifically to scale in
+	  very large systems.  However, contention on per-CPU atomics
+	  is usually quite low by design, so these atomics likely benefit
+	  from higher performance, even if this is purchased with reduced
+	  performance under high contention.
+
+	  Say Y here to make use of these instructions for the in-kernel
+	  per-CPU atomic routines. This incurs a small overhead on CPUs
+	  that do not support these instructions.
+
 endmenu # "ARMv8.1 architectural features"
 
 menu "ARMv8.2 architectural features"
diff --git a/arch/arm64/include/asm/lse.h b/arch/arm64/include/asm/lse.h
index 3129a5819d0e..2d5eff217d63 100644
--- a/arch/arm64/include/asm/lse.h
+++ b/arch/arm64/include/asm/lse.h
@@ -26,12 +26,19 @@
 /* In-line patching at runtime */
 #define ARM64_LSE_ATOMIC_INSN(llsc, lse)				\
 	ALTERNATIVE(llsc, __LSE_PREAMBLE lse, ARM64_HAS_LSE_ATOMICS)
+#if IS_ENABLED(CONFIG_ARM64_USE_LSE_PERCPU_ATOMICS)
+#define ARM64_LSE_PERCPU_ATOMIC_INSN(llsc, lse)				\
+	ALTERNATIVE(llsc, __LSE_PREAMBLE lse, ARM64_HAS_LSE_ATOMICS)
+#else
+#define ARM64_LSE_PERCPU_ATOMIC_INSN(llsc, lse)	llsc
+#endif
 
 #else	/* CONFIG_ARM64_LSE_ATOMICS */
 
 #define __lse_ll_sc_body(op, ...)		__ll_sc_##op(__VA_ARGS__)
 
 #define ARM64_LSE_ATOMIC_INSN(llsc, lse)	llsc
+#define ARM64_LSE_PERCPU_ATOMIC_INSN(llsc, lse)	llsc
 
 #endif	/* CONFIG_ARM64_LSE_ATOMICS */
 #endif	/* __ASM_LSE_H */
diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 9abcc8ef3087..eaa3c2f87407 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -70,7 +70,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
 	unsigned int loop;						\
 	u##sz tmp;							\
 									\
-	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
+	asm volatile (ARM64_LSE_PERCPU_ATOMIC_INSN(			\
 	/* LL/SC */							\
 	"1:	ldxr" #sfx "\t%" #w "[tmp], %[ptr]\n"			\
 		#op_llsc "\t%" #w "[tmp], %" #w "[tmp], %" #w "[val]\n"	\
@@ -91,7 +91,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
 	unsigned int loop;						\
 	u##sz ret;							\
 									\
-	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
+	asm volatile (ARM64_LSE_PERCPU_ATOMIC_INSN(			\
 	/* LL/SC */							\
 	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
 		#op_llsc "\t%" #w "[ret], %" #w "[ret], %" #w "[val]\n"	\

