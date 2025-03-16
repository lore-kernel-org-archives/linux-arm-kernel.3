Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ADBC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2y/CQninyYBUKgOmM8/BKgG1hjtF3cTKSSqa63B7Zo=; b=Gr+6ByF7HDKlEqZBVQ6VCkwmYn
	Ze+JhnnETMJFnU9eMmpPiszGxOy5cy7XwgpIStpJyW9LCZJwb62ew+L0yjgGY2/AUrNItecsVXLQI
	dG8KpKQwek9jhYSM6dphvqK+vRTHqBsWJty1xFutq2P9zyzwISqQpgWBzQzppp/lfpAF9TV73Nv2p
	pkLR2L5EAkXUkQN9QB/4TBhJbBUwOgr00Ue3Q49hWIzJqcCVCeC81jwl2ZgzkvLhR/ke8GeuLy4PV
	MHr35YGJ9jxP9s7AbwM5A3OfGKw3Gfi/S1x4Wxzg0T60AvB2FHICQ50T23EW5JtD8DIgTE4tS4PfS
	hBLvomyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfOG-0000000HE5J-1rpS;
	Sun, 16 Mar 2025 04:14:20 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfG1-0000000HCBB-3Hg9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:05:51 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso11625635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097948; x=1742702748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2y/CQninyYBUKgOmM8/BKgG1hjtF3cTKSSqa63B7Zo=;
        b=W4+iuNeMAXFCcRkq9qvAEr5dZTsuSNkOpiup2N+oHd43Twe3v53BELgHm41Z5fdZfa
         a8Py+lTtnpP1PDOOin8UOh9aCkNdFqpGR9ut06HH5RTxwCeZhcDiHpTDRl7VT6eIzOAr
         v+oNA9wn5lqVH8EeW7RQQ0BFM58DhfzZ3/EwgD8K0x5UPXwYzBqR8W27I5d7ZzSO3Fzt
         kqTsOPeufHlYrSauroUgb2Qpp1cU96v4L8AOw/QpVwcZ3kmfoHxxYSLVC8I8N8/cXf48
         OcDnNTrtKT6eMjiCYSRuRtx4SpqrfPzTfFIw5PgpkQR9U9r7P9K6dx0D4+ewnTdqI14Y
         6nYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097948; x=1742702748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2y/CQninyYBUKgOmM8/BKgG1hjtF3cTKSSqa63B7Zo=;
        b=Bnr8Zt7L3/9NmjitEUQv5WHkJtbkKemWJ2w+CJ6QdwNUMZnCQ4ci6293Lc5iSjgihR
         SpV5TggKBQiU5hp3uaq8lFYh8X+dYrShVsx955Kg2IRPDqaeXQM1iO29LceEaQbGLeOc
         a8jn2tR1adsNqGw4SXgicTlOs9P3IVUyrISF/dB/W+/iQ6zI4Pwv7JDC+gokxZVw7K3q
         8xDH+nzIqO+6CiFmsLBYZ2/CEPLZwnifjOEMNu4vlmwfWhcDNNkqW7g0G2h5V0hNNBPU
         Q8snTGuJL817wbCPrRj/h57wRKM7+AK+615L+zgmfkAV/WO1/+i+Px0sBTl3OaFpJFau
         vubw==
X-Forwarded-Encrypted: i=1; AJvYcCVuTqc5+/cqlGK4ldD3MbWp4Kx1UU83BUscwzArbF9Wqo4JsZ8B8Gd2RzEZFUtd/7Wde6m/ZqJKA6Glzz5Rancx@lists.infradead.org
X-Gm-Message-State: AOJu0YzraKMQgFc4tlypw+kRz7zsqWOE5ZvCoyrQqeiuMIecfMGfGaU4
	IUs5fQDhyTNSB0juIx1M80ZLmeTVRUSNGDj5ix7SrEet45M854uR
X-Gm-Gg: ASbGnctwN3Q4rMiUuzzAYAtMRmY3XcneYR8KLKK9BKmeQbv2/RlUAqXtHV5ugdhh8cX
	7w71zvC+v/gYTeFndhbClrs0iFWr40R+C7cA2PZMh+U4OslZ6laacek3YNS9OKhH8p1/J/tL0yc
	b/DaNLoS4wpnIpJ5CoQEyDi71YsuMZR2LNMQqisho8dzD16ogrYDu6CrsJXfnAa75b8BWMLStcP
	waf1njMUWORtODZYfU7mxGrlbO3oxKoy1wjr7pw+/es+jkru8xA7TDn5R2fsKZJ5+Cqviu7IVJY
	jmqvJJnkynCrTCGmQ0YuUHBJQbsDnas9KA==
X-Google-Smtp-Source: AGHT+IFEdFdDXX9mlo+XtsgH+mGwVEJHM88X5q2zA7d0QlYla/iKH6Eki4j8d7sIyrRi/+0SAHZX/g==
X-Received: by 2002:a05:6000:1564:b0:391:487f:2828 with SMTP id ffacd0b85a97d-3971cd5741emr10187766f8f.10.1742097948274;
        Sat, 15 Mar 2025 21:05:48 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:6::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7e9f8asm10778057f8f.81.2025.03.15.21.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:05:47 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v4 04/25] locking: Copy out qspinlock.c to kernel/bpf/rqspinlock.c
Date: Sat, 15 Mar 2025 21:05:20 -0700
Message-ID: <20250316040541.108729-5-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14298; h=from:subject; bh=DTAwKIVBPvF1KKfxWrr0m6ASI2nIK7yi8aJrpCgtpuQ=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3blMqF8h+waofaYnPYffWsyIxmJXHoZWK8cilz sx2D7EOJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN2wAKCRBM4MiGSL8RyqWDD/ 4iz3IWbiJGJg7NDgqC/uX4CYqzlAw+XBoYpqBZ/clcvmzbcRmbTxPUZ0R9Ie5CE0I0dwwV+EyXzgyB hdRetK1UASNu62rCl1VvTLKutqrKZTV0fSgJi0G+Lc+HIXzLFJQN8HOs6021WdsJ3hQVe0Nodfaayc rOZ38nVZc1VOkyLt6sZogAB11mcfHkIxiCxNuYR2PeJf+4sZGbYVzCDIcm9tOdXHdlwuSZVs0D/iC/ 7C2qmm5QAFZEqLkwkng+38O8+fvezDqYrCo/9JoXbgxRheezxc7SigIeSWuLGhJHjChmQ9La+Z0GaS jq/pHgViyDFaWG6M728MpakUQzHNZc4exWIIWZ4RW7txFmj8jx2VkOZ66ujXVcmsq+WEXKQIKpKbPx ixuSnEPKewz1R6iZfbQ1RK3La6Wb7uaoIIwYiE5N+L1mpAisgmWBioo+mP+yYpwX2tBA0ysFM5N3Ai pu/r8fsLYaL4NBMM4qwyDdUfYUbjDVc4UbnmoKu2BDyEtvF7ZMoo4Szfav/DmdfmbPsWvdcNvEwl84 XQKvCfEK4kkUO0GpJFyJjVgSZwvDgSdBQ40EZeT6K62Yh+6HAnW06odP4bjb4LDbUEcIZxlW8u/YuW 8AQZa8G/aKtb1jxi7Ceo45b2pVKB6qCXKqVJSl5wLSrHXIrRteojWecbpAXA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210550_011529_861B2168 
X-CRM114-Status: GOOD (  32.95  )
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

In preparation for introducing a new lock implementation, Resilient
Queued Spin Lock, or rqspinlock, we first begin our modifications by
using the existing qspinlock.c code as the base. Simply copy the code to
a new file and rename functions and variables from 'queued' to
'resilient_queued'.

Since we place the file in kernel/bpf, include needs to be relative.

This helps each subsequent commit in clearly showing how and where the
code is being changed. The only change after a literal copy in this
commit is renaming the functions where necessary, and rename qnodes to
rqnodes. Let's also use EXPORT_SYMBOL_GPL for rqspinlock slowpath.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/bpf/rqspinlock.c | 410 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 410 insertions(+)
 create mode 100644 kernel/bpf/rqspinlock.c

diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
new file mode 100644
index 000000000000..762108cb0f38
--- /dev/null
+++ b/kernel/bpf/rqspinlock.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Resilient Queued Spin Lock
+ *
+ * (C) Copyright 2013-2015 Hewlett-Packard Development Company, L.P.
+ * (C) Copyright 2013-2014,2018 Red Hat, Inc.
+ * (C) Copyright 2015 Intel Corp.
+ * (C) Copyright 2015 Hewlett-Packard Enterprise Development LP
+ *
+ * Authors: Waiman Long <longman@redhat.com>
+ *          Peter Zijlstra <peterz@infradead.org>
+ */
+
+#ifndef _GEN_PV_LOCK_SLOWPATH
+
+#include <linux/smp.h>
+#include <linux/bug.h>
+#include <linux/cpumask.h>
+#include <linux/percpu.h>
+#include <linux/hardirq.h>
+#include <linux/mutex.h>
+#include <linux/prefetch.h>
+#include <asm/byteorder.h>
+#include <asm/qspinlock.h>
+#include <trace/events/lock.h>
+
+/*
+ * Include queued spinlock definitions and statistics code
+ */
+#include "../locking/qspinlock.h"
+#include "../locking/qspinlock_stat.h"
+
+/*
+ * The basic principle of a queue-based spinlock can best be understood
+ * by studying a classic queue-based spinlock implementation called the
+ * MCS lock. A copy of the original MCS lock paper ("Algorithms for Scalable
+ * Synchronization on Shared-Memory Multiprocessors by Mellor-Crummey and
+ * Scott") is available at
+ *
+ * https://bugzilla.kernel.org/show_bug.cgi?id=206115
+ *
+ * This queued spinlock implementation is based on the MCS lock, however to
+ * make it fit the 4 bytes we assume spinlock_t to be, and preserve its
+ * existing API, we must modify it somehow.
+ *
+ * In particular; where the traditional MCS lock consists of a tail pointer
+ * (8 bytes) and needs the next pointer (another 8 bytes) of its own node to
+ * unlock the next pending (next->locked), we compress both these: {tail,
+ * next->locked} into a single u32 value.
+ *
+ * Since a spinlock disables recursion of its own context and there is a limit
+ * to the contexts that can nest; namely: task, softirq, hardirq, nmi. As there
+ * are at most 4 nesting levels, it can be encoded by a 2-bit number. Now
+ * we can encode the tail by combining the 2-bit nesting level with the cpu
+ * number. With one byte for the lock value and 3 bytes for the tail, only a
+ * 32-bit word is now needed. Even though we only need 1 bit for the lock,
+ * we extend it to a full byte to achieve better performance for architectures
+ * that support atomic byte write.
+ *
+ * We also change the first spinner to spin on the lock bit instead of its
+ * node; whereby avoiding the need to carry a node from lock to unlock, and
+ * preserving existing lock API. This also makes the unlock code simpler and
+ * faster.
+ *
+ * N.B. The current implementation only supports architectures that allow
+ *      atomic operations on smaller 8-bit and 16-bit data types.
+ *
+ */
+
+#include "../locking/mcs_spinlock.h"
+
+/*
+ * Per-CPU queue node structures; we can never have more than 4 nested
+ * contexts: task, softirq, hardirq, nmi.
+ *
+ * Exactly fits one 64-byte cacheline on a 64-bit architecture.
+ *
+ * PV doubles the storage and uses the second cacheline for PV state.
+ */
+static DEFINE_PER_CPU_ALIGNED(struct qnode, rqnodes[_Q_MAX_NODES]);
+
+/*
+ * Generate the native code for resilient_queued_spin_unlock_slowpath(); provide NOPs
+ * for all the PV callbacks.
+ */
+
+static __always_inline void __pv_init_node(struct mcs_spinlock *node) { }
+static __always_inline void __pv_wait_node(struct mcs_spinlock *node,
+					   struct mcs_spinlock *prev) { }
+static __always_inline void __pv_kick_node(struct qspinlock *lock,
+					   struct mcs_spinlock *node) { }
+static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
+						   struct mcs_spinlock *node)
+						   { return 0; }
+
+#define pv_enabled()		false
+
+#define pv_init_node		__pv_init_node
+#define pv_wait_node		__pv_wait_node
+#define pv_kick_node		__pv_kick_node
+#define pv_wait_head_or_lock	__pv_wait_head_or_lock
+
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+#define resilient_queued_spin_lock_slowpath	native_resilient_queued_spin_lock_slowpath
+#endif
+
+#endif /* _GEN_PV_LOCK_SLOWPATH */
+
+/**
+ * resilient_queued_spin_lock_slowpath - acquire the queued spinlock
+ * @lock: Pointer to queued spinlock structure
+ * @val: Current value of the queued spinlock 32-bit word
+ *
+ * (queue tail, pending bit, lock value)
+ *
+ *              fast     :    slow                                  :    unlock
+ *                       :                                          :
+ * uncontended  (0,0,0) -:--> (0,0,1) ------------------------------:--> (*,*,0)
+ *                       :       | ^--------.------.             /  :
+ *                       :       v           \      \            |  :
+ * pending               :    (0,1,1) +--> (0,1,0)   \           |  :
+ *                       :       | ^--'              |           |  :
+ *                       :       v                   |           |  :
+ * uncontended           :    (n,x,y) +--> (n,0,0) --'           |  :
+ *   queue               :       | ^--'                          |  :
+ *                       :       v                               |  :
+ * contended             :    (*,x,y) +--> (*,0,0) ---> (*,0,1) -'  :
+ *   queue               :         ^--'                             :
+ */
+void __lockfunc resilient_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
+{
+	struct mcs_spinlock *prev, *next, *node;
+	u32 old, tail;
+	int idx;
+
+	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
+
+	if (pv_enabled())
+		goto pv_queue;
+
+	if (virt_spin_lock(lock))
+		return;
+
+	/*
+	 * Wait for in-progress pending->locked hand-overs with a bounded
+	 * number of spins so that we guarantee forward progress.
+	 *
+	 * 0,1,0 -> 0,0,1
+	 */
+	if (val == _Q_PENDING_VAL) {
+		int cnt = _Q_PENDING_LOOPS;
+		val = atomic_cond_read_relaxed(&lock->val,
+					       (VAL != _Q_PENDING_VAL) || !cnt--);
+	}
+
+	/*
+	 * If we observe any contention; queue.
+	 */
+	if (val & ~_Q_LOCKED_MASK)
+		goto queue;
+
+	/*
+	 * trylock || pending
+	 *
+	 * 0,0,* -> 0,1,* -> 0,0,1 pending, trylock
+	 */
+	val = queued_fetch_set_pending_acquire(lock);
+
+	/*
+	 * If we observe contention, there is a concurrent locker.
+	 *
+	 * Undo and queue; our setting of PENDING might have made the
+	 * n,0,0 -> 0,0,0 transition fail and it will now be waiting
+	 * on @next to become !NULL.
+	 */
+	if (unlikely(val & ~_Q_LOCKED_MASK)) {
+
+		/* Undo PENDING if we set it. */
+		if (!(val & _Q_PENDING_MASK))
+			clear_pending(lock);
+
+		goto queue;
+	}
+
+	/*
+	 * We're pending, wait for the owner to go away.
+	 *
+	 * 0,1,1 -> *,1,0
+	 *
+	 * this wait loop must be a load-acquire such that we match the
+	 * store-release that clears the locked bit and create lock
+	 * sequentiality; this is because not all
+	 * clear_pending_set_locked() implementations imply full
+	 * barriers.
+	 */
+	if (val & _Q_LOCKED_MASK)
+		smp_cond_load_acquire(&lock->locked, !VAL);
+
+	/*
+	 * take ownership and clear the pending bit.
+	 *
+	 * 0,1,0 -> 0,0,1
+	 */
+	clear_pending_set_locked(lock);
+	lockevent_inc(lock_pending);
+	return;
+
+	/*
+	 * End of pending bit optimistic spinning and beginning of MCS
+	 * queuing.
+	 */
+queue:
+	lockevent_inc(lock_slowpath);
+pv_queue:
+	node = this_cpu_ptr(&rqnodes[0].mcs);
+	idx = node->count++;
+	tail = encode_tail(smp_processor_id(), idx);
+
+	trace_contention_begin(lock, LCB_F_SPIN);
+
+	/*
+	 * 4 nodes are allocated based on the assumption that there will
+	 * not be nested NMIs taking spinlocks. That may not be true in
+	 * some architectures even though the chance of needing more than
+	 * 4 nodes will still be extremely unlikely. When that happens,
+	 * we fall back to spinning on the lock directly without using
+	 * any MCS node. This is not the most elegant solution, but is
+	 * simple enough.
+	 */
+	if (unlikely(idx >= _Q_MAX_NODES)) {
+		lockevent_inc(lock_no_node);
+		while (!queued_spin_trylock(lock))
+			cpu_relax();
+		goto release;
+	}
+
+	node = grab_mcs_node(node, idx);
+
+	/*
+	 * Keep counts of non-zero index values:
+	 */
+	lockevent_cond_inc(lock_use_node2 + idx - 1, idx);
+
+	/*
+	 * Ensure that we increment the head node->count before initialising
+	 * the actual node. If the compiler is kind enough to reorder these
+	 * stores, then an IRQ could overwrite our assignments.
+	 */
+	barrier();
+
+	node->locked = 0;
+	node->next = NULL;
+	pv_init_node(node);
+
+	/*
+	 * We touched a (possibly) cold cacheline in the per-cpu queue node;
+	 * attempt the trylock once more in the hope someone let go while we
+	 * weren't watching.
+	 */
+	if (queued_spin_trylock(lock))
+		goto release;
+
+	/*
+	 * Ensure that the initialisation of @node is complete before we
+	 * publish the updated tail via xchg_tail() and potentially link
+	 * @node into the waitqueue via WRITE_ONCE(prev->next, node) below.
+	 */
+	smp_wmb();
+
+	/*
+	 * Publish the updated tail.
+	 * We have already touched the queueing cacheline; don't bother with
+	 * pending stuff.
+	 *
+	 * p,*,* -> n,*,*
+	 */
+	old = xchg_tail(lock, tail);
+	next = NULL;
+
+	/*
+	 * if there was a previous node; link it and wait until reaching the
+	 * head of the waitqueue.
+	 */
+	if (old & _Q_TAIL_MASK) {
+		prev = decode_tail(old, rqnodes);
+
+		/* Link @node into the waitqueue. */
+		WRITE_ONCE(prev->next, node);
+
+		pv_wait_node(node, prev);
+		arch_mcs_spin_lock_contended(&node->locked);
+
+		/*
+		 * While waiting for the MCS lock, the next pointer may have
+		 * been set by another lock waiter. We optimistically load
+		 * the next pointer & prefetch the cacheline for writing
+		 * to reduce latency in the upcoming MCS unlock operation.
+		 */
+		next = READ_ONCE(node->next);
+		if (next)
+			prefetchw(next);
+	}
+
+	/*
+	 * we're at the head of the waitqueue, wait for the owner & pending to
+	 * go away.
+	 *
+	 * *,x,y -> *,0,0
+	 *
+	 * this wait loop must use a load-acquire such that we match the
+	 * store-release that clears the locked bit and create lock
+	 * sequentiality; this is because the set_locked() function below
+	 * does not imply a full barrier.
+	 *
+	 * The PV pv_wait_head_or_lock function, if active, will acquire
+	 * the lock and return a non-zero value. So we have to skip the
+	 * atomic_cond_read_acquire() call. As the next PV queue head hasn't
+	 * been designated yet, there is no way for the locked value to become
+	 * _Q_SLOW_VAL. So both the set_locked() and the
+	 * atomic_cmpxchg_relaxed() calls will be safe.
+	 *
+	 * If PV isn't active, 0 will be returned instead.
+	 *
+	 */
+	if ((val = pv_wait_head_or_lock(lock, node)))
+		goto locked;
+
+	val = atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK));
+
+locked:
+	/*
+	 * claim the lock:
+	 *
+	 * n,0,0 -> 0,0,1 : lock, uncontended
+	 * *,*,0 -> *,*,1 : lock, contended
+	 *
+	 * If the queue head is the only one in the queue (lock value == tail)
+	 * and nobody is pending, clear the tail code and grab the lock.
+	 * Otherwise, we only need to grab the lock.
+	 */
+
+	/*
+	 * In the PV case we might already have _Q_LOCKED_VAL set, because
+	 * of lock stealing; therefore we must also allow:
+	 *
+	 * n,0,1 -> 0,0,1
+	 *
+	 * Note: at this point: (val & _Q_PENDING_MASK) == 0, because of the
+	 *       above wait condition, therefore any concurrent setting of
+	 *       PENDING will make the uncontended transition fail.
+	 */
+	if ((val & _Q_TAIL_MASK) == tail) {
+		if (atomic_try_cmpxchg_relaxed(&lock->val, &val, _Q_LOCKED_VAL))
+			goto release; /* No contention */
+	}
+
+	/*
+	 * Either somebody is queued behind us or _Q_PENDING_VAL got set
+	 * which will then detect the remaining tail and queue behind us
+	 * ensuring we'll see a @next.
+	 */
+	set_locked(lock);
+
+	/*
+	 * contended path; wait for next if not observed yet, release.
+	 */
+	if (!next)
+		next = smp_cond_load_relaxed(&node->next, (VAL));
+
+	arch_mcs_spin_unlock_contended(&next->locked);
+	pv_kick_node(lock, next);
+
+release:
+	trace_contention_end(lock, 0);
+
+	/*
+	 * release the node
+	 */
+	__this_cpu_dec(rqnodes[0].mcs.count);
+}
+EXPORT_SYMBOL_GPL(resilient_queued_spin_lock_slowpath);
+
+/*
+ * Generate the paravirt code for resilient_queued_spin_unlock_slowpath().
+ */
+#if !defined(_GEN_PV_LOCK_SLOWPATH) && defined(CONFIG_PARAVIRT_SPINLOCKS)
+#define _GEN_PV_LOCK_SLOWPATH
+
+#undef  pv_enabled
+#define pv_enabled()	true
+
+#undef pv_init_node
+#undef pv_wait_node
+#undef pv_kick_node
+#undef pv_wait_head_or_lock
+
+#undef  resilient_queued_spin_lock_slowpath
+#define resilient_queued_spin_lock_slowpath	__pv_resilient_queued_spin_lock_slowpath
+
+#include "../locking/qspinlock_paravirt.h"
+#include "rqspinlock.c"
+
+bool nopvspin;
+static __init int parse_nopvspin(char *arg)
+{
+	nopvspin = true;
+	return 0;
+}
+early_param("nopvspin", parse_nopvspin);
+#endif
-- 
2.47.1


