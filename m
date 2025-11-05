Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58AFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 20:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rhyoAUyPYyqrPfPQh+VFBxKkmqZ6zauTIFwADmmkdY=; b=mRxpZ1P0Wa7czXhz0cjKRyeldH
	Wq+1NFJEp1I+EuwoThrjgJjCFEIKDpst2iHAQTTQnQlpMYlOwyN0TdIeY6kuLARG4V3v4Hnge9hUu
	JzudFS5ZY7MNVwXzWtXxvvyh2JOq6T/Gc6UTtFkGTfGrY9bNA72vq0XUpv5ZGBNXb6/eSs+iNjQM3
	Z5O1E67XKalyu8i5k2KmUdPm44JvLJesg3FTtNhDi1R1ZvoBT8p7o1r5/5PATRWFMGZWLJlr/nHw4
	4UJ96k2IrxDQ6zjSY/yTem66g/E02wwDEnSHb+GAK7IntQGv/HqA1uEWFJZ9Yrc0JL/LefmBy6WPq
	/BJhEi3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkB8-0000000ENct-2SYB;
	Wed, 05 Nov 2025 20:32:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkB6-0000000ENby-1Vdz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 20:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C49F444AA3;
	Wed,  5 Nov 2025 20:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959E7C116B1;
	Wed,  5 Nov 2025 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762374740;
	bh=3SQyEsKa4vegmpwnk5NwDoYKeDgsfEpb4R+BPinWNcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vhydh/tQI9xr/YlHbbUKT9zHxmVTJ6t+ba3rjA8qgpeoIQrB56U/+bcCd2s6qrqcY
	 7smrOg/+KvBe9txgBp5nzq9uiPHthKUSp0Y1FkseYDmMJOaxtXvDhS/LIjP/Dq48Zs
	 xQvCyBF+NMHrht2k7PfBH6lKyKYti6Mmw+z35Vj6jfcB3/fLg4xSxULoEOThhIROGP
	 I8QQDYUlBgyVOLdMvCkVsZEx8TjNNee1O+JZEu0ff56JeVlfzMVKOIlXY+RP1Buuqp
	 NMYt36OPnMYbB4RhUS49kGrl7D1D8q+lG8vmgaGqdKSUIHMYrafKfB3XDy8sMNbpSb
	 nzlTTu9qmXFsw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AB7C6CE0FF9; Wed,  5 Nov 2025 12:32:18 -0800 (PST)
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
Subject: [PATCH v2 15/16] srcu: Optimize SRCU-fast-updown for arm64
Date: Wed,  5 Nov 2025 12:32:15 -0800
Message-Id: <20251105203216.2701005-15-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <bb177afd-eea8-4a2a-9600-e36ada26a500@paulmck-laptop>
References: <bb177afd-eea8-4a2a-9600-e36ada26a500@paulmck-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_123224_436250_BAFB60CC 
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
 include/linux/srcutree.h | 51 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
index d6f978b50472..0e06f87e1d7c 100644
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
@@ -327,8 +355,18 @@ __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
 static inline
 struct srcu_ctr __percpu notrace *__srcu_read_lock_fast_updown(struct srcu_struct *ssp)
 {
-	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
+	struct srcu_ctr __percpu *scp;
 
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
 	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
 		this_cpu_inc(scp->srcu_locks.counter); // Y, and implicit RCU reader.
 	else
@@ -350,10 +388,17 @@ static inline void notrace
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


