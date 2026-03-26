Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB19106F31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y9evk88hxlG3DOpWq2SYV/bIgkkPGnSZqcSWUwPcr8g=; b=UAR+RFRJhv7LLgBaijNRCh4ys2
	h9smOgngUQwcwbWmBhUg9uwwJnQJnnoBztpCGIXXlMYfLzMHPqnuMbAIhHPeAAjVruqNxg8rButDr
	/j1+g50NflKn0TsiJsrLL/3PckACeaJUaCTOAy2JpgBYwChG7XeCdQk7a4gUlTE73b9ulVh1WQpCA
	OxgQcXnConD6l8k06q+QNYh+FkIlJeXBSjl2YhGYKghv6GaMy7r+2tTplJqSDdinY4fSWhrS/2P+X
	9qFnRr/ri7Sl12kwX2dpC1YngNz9HrzikSH5FvH3zSrglyzGYht7AXD2PvC4OvirweQvs3iA6Q/57
	pTcUTEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hv6-00000005GRL-1m04;
	Thu, 26 Mar 2026 10:26:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hv2-00000005GR3-1nG7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 10:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 827A560121;
	Thu, 26 Mar 2026 10:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2702C116C6;
	Thu, 26 Mar 2026 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774520787;
	bh=TdkzCZHdM28WDeRmdIvcgFU3uvexxFP8El/TM/03qtw=;
	h=From:To:Cc:Subject:Date:From;
	b=V/VSRvxCVfDYVqCtIIYKoADCz1gpKAW6BUfAPB/MKMG0pPNkgCqdm0JfoJekUn30b
	 izWSuouSKsjIYcfVhUra68PhlulZMcmokh8D+NqknxV3iOH34jKaLP2VWMb6Ousxe8
	 A2t83pmVirg7a7KnWH8KPIF/ycD6aarUfROWrvJGb1e+G6E4DUOR0vhm6HRgI3NqNV
	 T/7bwq8gz7KOz8oYbpa8lQfDbTxAaK1frEzrgbJSXIOqpm7/0PYS/xsjb2eDeXP6Sf
	 /RQMI4VW13l/e9M4QezgYLQpVACTeK/Zb2ztqfVlyfAG+Gz4x6JLTFQzTXq+VIrQn3
	 jYkeuWd/+SK5Q==
From: Puranjay Mohan <puranjay@kernel.org>
To: Lai Jiangshan <jiangshanlai@gmail.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	rcu@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>
Subject: [PATCH] srcu: Optimize SRCU-fast per-CPU counter increments on arm64
Date: Thu, 26 Mar 2026 03:26:07 -0700
Message-ID: <20260326102608.1855088-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On architectures like arm64, this_cpu_inc() wraps the underlying atomic
instruction (ldadd) with preempt_disable/enable to prevent migration
between the per-CPU address calculation and the atomic operation.
However, SRCU does not need this protection because it sums counters
across all CPUs for grace-period detection, so operating on a "stale"
CPU's counter after migration is harmless.

This commit therefore introduces srcu_percpu_counter_inc(), which
consolidates the SRCU-fast reader counter updates into a single helper,
replacing the if/else dispatch between this_cpu_inc() and
atomic_long_inc(raw_cpu_ptr(...)) that was previously open-coded at
each call site.

On arm64, this helper uses atomic_long_fetch_add_relaxed(), which
compiles to the value-returning ldadd instruction.  This is preferred
over atomic_long_inc()'s non-value-returning stadd because ldadd is
resolved in L1 cache whereas stadd may be resolved further out in the
memory hierarchy [1].

On x86, where this_cpu_inc() compiles to a single "incl %gs:offset"
instruction with no preempt wrappers, the helper falls through to
this_cpu_inc(), so there is no change.  Architectures with
NEED_SRCU_NMI_SAFE continue to use atomic_long_inc(raw_cpu_ptr(...)),
again with no change.  All remaining architectures also use the
this_cpu_inc() path, again with no change.

refscale measurements on a 72-CPU arm64 Neoverse-V2 system show ~11%
improvement in SRCU-fast reader duration:

  Unpatched: median 9.273 ns, avg 9.319 ns (min 9.219, max 9.853)
    Patched: median 8.275 ns, avg 8.411 ns (min 8.186, max 9.183)

  Command: kvm.sh --torture refscale --duration 1 --cpus 72 \
           --configs NOPREEMPT --trust-make --bootargs \
           "refscale.scale_type=srcu-fast refscale.nreaders=72 \
           refscale.nruns=100"

[1] https://lore.kernel.org/r/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 include/linux/srcutree.h | 51 +++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
index fd1a9270cb9a..4ff18de3edfd 100644
--- a/include/linux/srcutree.h
+++ b/include/linux/srcutree.h
@@ -286,15 +286,43 @@ static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ss
  * on architectures that support NMIs but do not supply NMI-safe
  * implementations of this_cpu_inc().
  */
+
+/*
+ * Atomically increment a per-CPU SRCU counter.
+ *
+ * On most architectures, this_cpu_inc() is optimal (e.g., on x86 it is
+ * a single "incl %gs:offset" instruction).  However, on architectures
+ * like arm64, s390, and loongarch, this_cpu_inc() wraps the underlying
+ * atomic instruction with preempt_disable/enable to prevent migration
+ * between the per-CPU address calculation and the atomic operation.
+ * SRCU does not need this protection because it sums counters across
+ * all CPUs for grace-period detection, so operating on a "stale" CPU's
+ * counter after migration is harmless.
+ *
+ * On arm64, use atomic_long_fetch_add_relaxed() which compiles to the
+ * value-returning ldadd instruction instead of atomic_long_inc()'s
+ * non-value-returning stadd, because ldadd is resolved in L1 cache
+ * whereas stadd may be resolved further out in the memory hierarchy.
+ * https://lore.kernel.org/r/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop
+ */
+static __always_inline void
+srcu_percpu_counter_inc(atomic_long_t __percpu *v)
+{
+#ifdef CONFIG_ARM64
+	(void)atomic_long_fetch_add_relaxed(1, raw_cpu_ptr(v));
+#elif IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE)
+	atomic_long_inc(raw_cpu_ptr(v));
+#else
+	this_cpu_inc(v->counter);
+#endif
+}
+
 static inline struct srcu_ctr __percpu notrace *__srcu_read_lock_fast(struct srcu_struct *ssp)
 	__acquires_shared(ssp)
 {
 	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
 
-	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
-		this_cpu_inc(scp->srcu_locks.counter); // Y, and implicit RCU reader.
-	else
-		atomic_long_inc(raw_cpu_ptr(&scp->srcu_locks));  // Y, and implicit RCU reader.
+	srcu_percpu_counter_inc(&scp->srcu_locks); // Y, and implicit RCU reader.
 	barrier(); /* Avoid leaking the critical section. */
 	__acquire_shared(ssp);
 	return scp;
@@ -315,10 +343,7 @@ __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
 {
 	__release_shared(ssp);
 	barrier();  /* Avoid leaking the critical section. */
-	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
-		this_cpu_inc(scp->srcu_unlocks.counter);  // Z, and implicit RCU reader.
-	else
-		atomic_long_inc(raw_cpu_ptr(&scp->srcu_unlocks));  // Z, and implicit RCU reader.
+	srcu_percpu_counter_inc(&scp->srcu_unlocks);  // Z, and implicit RCU reader.
 }
 
 /*
@@ -335,10 +360,7 @@ struct srcu_ctr __percpu notrace *__srcu_read_lock_fast_updown(struct srcu_struc
 {
 	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
 
-	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
-		this_cpu_inc(scp->srcu_locks.counter); // Y, and implicit RCU reader.
-	else
-		atomic_long_inc(raw_cpu_ptr(&scp->srcu_locks));  // Y, and implicit RCU reader.
+	srcu_percpu_counter_inc(&scp->srcu_locks); // Y, and implicit RCU reader.
 	barrier(); /* Avoid leaking the critical section. */
 	__acquire_shared(ssp);
 	return scp;
@@ -359,10 +381,7 @@ __srcu_read_unlock_fast_updown(struct srcu_struct *ssp, struct srcu_ctr __percpu
 {
 	__release_shared(ssp);
 	barrier();  /* Avoid leaking the critical section. */
-	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
-		this_cpu_inc(scp->srcu_unlocks.counter);  // Z, and implicit RCU reader.
-	else
-		atomic_long_inc(raw_cpu_ptr(&scp->srcu_unlocks));  // Z, and implicit RCU reader.
+	srcu_percpu_counter_inc(&scp->srcu_unlocks);  // Z, and implicit RCU reader.
 }
 
 void __srcu_check_read_flavor(struct srcu_struct *ssp, int read_flavor);

base-commit: 16ad40d1089c5f212d7d87babc2376284f3bf244
-- 
2.52.0


