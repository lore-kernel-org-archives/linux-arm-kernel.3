Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724E0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 21:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Skys7Ib/MJIC0Zt4TMDGTkTWwzuer5tjfFmoznfD5Qo=; b=IJpG/ZDuN9aRwfpNDZLLBQ6FOD
	XaBKjFeC3jGd+QS72HkxvRqm5nd8Lz7Atr5wrgykPtPOntEBFscBar0upEkLWBCOV6Yv3trV4E1CT
	IJA/yEOvtumyhAyhaupBd5GEq30MLt9H+dWgl8cYcTdz5PApp8aCidwZVTDYmqm6GzXj3ZUhIljZ8
	tGcuDuwMhNH0+WXsmuQdm79gVFgOdz2Ct4AJs5Z7eCoEoZEQ8JBfHmGVyRSQmDHy8bd4/Nb3elfP3
	2zEsP08XvjnI2kZcZlerX8pKyl1p/hiVenb4Xpviqkf07f5LMXxdeyYBxWi4icylmHSWr93wgVrta
	g5ExlQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFfsR-00000008qrl-1WX9;
	Sun, 02 Nov 2025 21:44:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFfsP-00000008qrE-0Hs7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 21:44:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7C06448D9;
	Sun,  2 Nov 2025 21:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF40DC113D0;
	Sun,  2 Nov 2025 21:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762119879;
	bh=R4kFwOOFYwrXB688uqk8xRjU0CSAKW/oggKTVNMYKqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HoNbtz9GmnNxGwEWhNeSECkfCd8sjgQCadJgzAA8UCnfQpFu6H3nb5u7Mu09hr3/H
	 oDptY4r0jGPfbbBmnOWcIHnRO1ND4GZKuFryKo1F7WcjLo0XxfZhj14m4j8ja1+clz
	 Kj4hMfmB7dfSCRkBumoIUpiiehB85RLARaOBJKGtvIgumrCsbHtZgZE9wvsyQxjkI0
	 IfFxwva1a3PCHz8tWgLhuesiBr5xEXhVSSpSzNBrfnacmGtLPk45VI3oUECeKwQw7y
	 +DdGvbjaNmNsAwmZicXIeDmgfOx9HWlX5sdGAu8hSCrgjGLdgsej49rRGAo973lskN
	 2qr32duqsG/Xw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A58B2CE16C7; Sun,  2 Nov 2025 13:44:37 -0800 (PST)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: rcu@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	rostedt@goodmis.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH 17/19] srcu: Optimize SRCU-fast-updown for arm64
Date: Sun,  2 Nov 2025 13:44:34 -0800
Message-Id: <20251102214436.3905633-17-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <082fb8ba-91b8-448e-a472-195eb7b282fd@paulmck-laptop>
References: <082fb8ba-91b8-448e-a472-195eb7b282fd@paulmck-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_134441_149116_F88B4767 
X-CRM114-Status: GOOD (  18.10  )
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

Some arm64 platforms have slow per-CPU atomic operations, for example,
the Neoverse V2.  This commit therefore moves SRCU-fast from per-CPU
atomic operations to interrupt-disabled non-read-modify-write-atomic
atomic_read()/atomic_set() operations.  This works because
SRCU-fast-updown is not invoked from read-side primitives, which
means that if srcu_read_unlock_fast() NMI handlers.  This means that
srcu_read_lock_fast_updown() and srcu_read_unlock_fast_updown() can
exclude themselves and each other

This reduces the overhead of calls to srcu_read_lock_fast_updown() and
srcu_read_unlock_fast_updown() from about 100ns to about 12ns on an ARM
Neoverse V2.  Although this is not excellent compared to about 2ns on x86,
it sure beats 100ns.

This command was used to measure the overhead:

tools/testing/selftests/rcutorture/bin/kvm.sh --torture refscale --allcpus --duration 5 --configs NOPREEMPT --kconfig "CONFIG_NR_CPUS=64 CONFIG_TASKS_TRACE_RCU=y" --bootargs "refscale.loops=100000 refscale.guest_os_delay=5 refscale.nreaders=64 refscale.holdoff=30 torture.disable_onoff_at_boot refscale.scale_type=srcu-fast-updown refscale.verbose_batched=8 torture.verbose_sleep_frequency=8 torture.verbose_sleep_duration=8 refscale.nruns=100" --trust-make

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <bpf@vger.kernel.org>
---
 include/linux/srcutree.h | 56 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
index d6f978b50472..70560dc4636c 100644
--- a/include/linux/srcutree.h
+++ b/include/linux/srcutree.h
@@ -253,6 +253,34 @@ static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ss
 	return &ssp->sda->srcu_ctrs[idx];
 }
 
+/*
+ * Non-atomic manipulation of SRCU lock counters.
+ */
+static inline struct srcu_ctr __percpu notrace *__srcu_read_lock_fast_na(struct srcu_struct *ssp)
+{
+	atomic_long_t *scnp;
+	struct srcu_ctr __percpu *scp;
+
+	lockdep_assert_preemption_disabled();
+	scp = READ_ONCE(ssp->srcu_ctrp);
+	scnp = raw_cpu_ptr(&scp->srcu_locks);
+	atomic_long_set(scnp, atomic_long_read(scnp) + 1);
+	return scp;
+}
+
+/*
+ * Non-atomic manipulation of SRCU unlock counters.
+ */
+static inline void notrace
+__srcu_read_unlock_fast_na(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
+{
+	atomic_long_t *scnp;
+
+	lockdep_assert_preemption_disabled();
+	scnp = raw_cpu_ptr(&scp->srcu_unlocks);
+	atomic_long_set(scnp, atomic_long_read(scnp) + 1);
+}
+
 /*
  * Counts the new reader in the appropriate per-CPU element of the
  * srcu_struct.  Returns a pointer that must be passed to the matching
@@ -327,12 +355,23 @@ __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
 static inline
 struct srcu_ctr __percpu notrace *__srcu_read_lock_fast_updown(struct srcu_struct *ssp)
 {
-	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
+	struct srcu_ctr __percpu *scp;
 
-	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
+	if (IS_ENABLED(CONFIG_ARM64) && IS_ENABLED(CONFIG_ARM64_USE_LSE_PERCPU_ATOMICS)) {
+		unsigned long flags;
+
+		local_irq_save(flags);
+		scp = __srcu_read_lock_fast_na(ssp);
+		local_irq_restore(flags); /* Avoids leaking the critical section. */
+		return scp;
+	}
+
+	scp = READ_ONCE(ssp->srcu_ctrp);
+	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE)) {
 		this_cpu_inc(scp->srcu_locks.counter); // Y, and implicit RCU reader.
-	else
+	} else {
 		atomic_long_inc(raw_cpu_ptr(&scp->srcu_locks));  // Y, and implicit RCU reader.
+	}
 	barrier(); /* Avoid leaking the critical section. */
 	return scp;
 }
@@ -350,10 +389,17 @@ static inline void notrace
 __srcu_read_unlock_fast_updown(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
 {
 	barrier();  /* Avoid leaking the critical section. */
-	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
+	if (IS_ENABLED(CONFIG_ARM64)) {
+		unsigned long flags;
+
+		local_irq_save(flags);
+		 __srcu_read_unlock_fast_na(ssp, scp);
+		local_irq_restore(flags);
+	} else if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE)) {
 		this_cpu_inc(scp->srcu_unlocks.counter);  // Z, and implicit RCU reader.
-	else
+	} else {
 		atomic_long_inc(raw_cpu_ptr(&scp->srcu_unlocks));  // Z, and implicit RCU reader.
+	}
 }
 
 void __srcu_check_read_flavor(struct srcu_struct *ssp, int read_flavor);
-- 
2.40.1


