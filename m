Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC59BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhHDQAJKH3ocHzxkhwcqvNhQHWrp7KSdfiwoYhzvJgU=; b=Fh3kVztQEmkHvjmB6DJvrJubq2
	AxMiw/SwN4T5DLYa0fhv9tuEawpxR4pp2TG07m155uQ6wMbNzNDBI+P4ZgTmXY+FbtIShz1rQRCUA
	WvlP527GLEVofFS8NrZl1OttumGX4l2VFnvdrY8U8HCrUU14C6IKHs4v+qtmPdTOclOi1IqZZzCCe
	xHAPJa5Uhx5UFK+7lpPPF6XvsSIcJVddBuzJ7MkIMe8Rio42AFhMqJFRw1PF3iSPggF9Sk+QMJYu6
	0IH5wW+ELatEK2rcVRpsKG9kxIhRLWEE2249uf6A5AyO1rm131lmStPJwuj8Vmjn5AZyiWTN1/MBa
	skOdiPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7mn-00000001KX5-14H0;
	Mon, 03 Mar 2025 15:32:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dY-00000001IC1-0kjB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Mar 2025 15:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vhHDQAJKH3ocHzxkhwcqvNhQHWrp7KSdfiwoYhzvJgU=; b=f0WPLXfWcGV5F+U0YwQ83gkSe7
	VTplooD045of48pp+3Vr0ZVYxZvLRYTz6jKxawUCMAD0jlJrfmoSZMAMnpWvsW9FvU8R4w4TlNOce
	Qy7K/Gl5xmJlQniQSVJZGWgtwI6EfTGfKYlxgcA4FSmmqv/67ORedrunvW2j1Bn66/bmiXtnUKryx
	SNcyJQNHEngkC9QkGOsGJvqdNSrupewu6pO+S8aMYTkl9Sd+bj14QRs3JRq/H+Eoibl+DCVcdYbPc
	K6Gixiw6HWzuVcH8YJDNWRmQGrjanFjxnn95tC7oVZPCHgCS24ybYxd9rBRW2eURqHpxxvdxERZs9
	3diUvRgA==;
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dU-00000004Zy5-2AoV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:18 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so29223145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015395; x=1741620195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhHDQAJKH3ocHzxkhwcqvNhQHWrp7KSdfiwoYhzvJgU=;
        b=FPThzxA+Q//Xi5rb10zgM6KtqvyOZMhVxM2tDIHdMDcHm9/VIYZ5uzoUZe4wUO9r56
         fTm9bGGw1pIPiXqBUDhBH1YZLFq+ZpyLbOA9rTDU3dUIZNXq2tiAM8gKbfqtclW0tVyM
         9sgFTiMVe6qiVq/EpP3sRxIISEtf1NzjlnMZxf9DsVomRwIemxB41U1eXtK+K9zU8nhf
         R+hoDgA4RCFl7E56+erB62DpW1suEQpICC/uVvSxt2JeWHoyPGnI4RaFcS0D+5juj0je
         CDhRydr6Yn+zxZQogurM9Y5GcqibK791cnlZsAgeV0PFQfrmNtbiLrKU7YvMXHYZnYPr
         SIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015395; x=1741620195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhHDQAJKH3ocHzxkhwcqvNhQHWrp7KSdfiwoYhzvJgU=;
        b=qRsWq7taLglRrpp1GOqH8sXW86Dqyo/QGlwYRnHpamWwDlEJoEb3EnmY4QaSbJGa+k
         vcSmARWJ26CeOoKQIXdZ438A+P0xyPBrr3yqHUfA52zabz1/GXb3pI+C1+A3xDPE6htM
         hnzoib1a4Lz8+geoe4q5xCW5DsStboe61/pzAiZ0bQ1ui9mJ5/0Uq23v3XNARK6sG1Vz
         3upOd2wkipxABvbiA8/CaoupI/xXqTuBbF9pp7tZVlAjCFU30ya1mAZag/Tw6z+JFwpa
         P3O5CBSXXj2HM/yLNuxThnupVqXKg3whLCcWW9cufScCX1kiezE5ion+BAWrJNh8a4ch
         IeJw==
X-Forwarded-Encrypted: i=1; AJvYcCUiCKdynbDsknm7u7uoK7Gs2a0J7AT4ZrH0gGMCkN6EFE2cffvk2PQGW+sRMWikQwTLeqfpPepbNsfUJjcHBdpG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlm3aAZa8EhnUFQw9SzD3eYq7vVgCtk1/T1zEZYz75V74r0dQQ
	nq4DCcJY7ltJ3pgb0aNVtCqulrTh4CyzYo/TcfLzYAyV2f+/qfaynkzV19i97lE=
X-Gm-Gg: ASbGncvd29jvmAG7i0qn5oQhD7FmeABvebB1UY6vwZ4y15Ep/5g1ZoEuLxXANJ0q/j1
	/622cAk8ILb2UodI/1IJ9ZeRhpMY2WCE640xJf0nQlRvi4KgWb6G6xgSMdDHel0w4KUH+kNQ9Jg
	o3xqsQxi9UicT3E6r7iPvCDtDkoV84B1/MqVYVbhrUAco+LEzKDXjIvTUjSjZ/M+jV3jlUlz9S8
	UOzixiDkXFIKasaQSpj8D06BTpyviEmGMrB1ac30lHDkyerWvSChHAkoOtW9kAw4b8jTs33+RMM
	1eYaIJLaUFoSoGrFVLBpGU3Vlcs7QzTmgBI=
X-Google-Smtp-Source: AGHT+IE3JAxXjo712pa7fQEf55+AI3IriNv8TobwwGlXtFQEUu+iVyTKfQujHQCVAl/7LqPxVk7beQ==
X-Received: by 2002:a05:6000:1889:b0:391:1388:64ba with SMTP id ffacd0b85a97d-391138867d4mr1529975f8f.53.1741015395150;
        Mon, 03 Mar 2025 07:23:15 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:53::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532ba6sm192659325e9.12.2025.03.03.07.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:14 -0800 (PST)
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
Subject: [PATCH bpf-next v3 04/25] locking: Copy out qspinlock.c to rqspinlock.c
Date: Mon,  3 Mar 2025 07:22:44 -0800
Message-ID: <20250303152305.3195648-5-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14136; h=from:subject; bh=FniirE2Pxgu9OpGG3yatwrPHxVskM6KALs9TZCH9in0=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWWndtVbKfQ0brUJQ1Pu+p+CwSfYBiqIiL7G+dP dbh8lRCJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlgAKCRBM4MiGSL8RyhVqD/ 9bLvU1dNWAPayltIPZP16vP1AsOwOHsJyFNXWpDwNiZ1qq0VKLVkyh39BB5atzrU8GmCmvOtk4O21X zxnGzqe3KHERKzUnHAxQ84tq7TtWJmYpGb782XCl4nGCku28qV4MMEVf0kY978uJDlkI22pwpgzxXl Ad/D867MgAc6EnI7AWwCjx2npU0iiyt8W51gEKTcLQDYOV5an6SMzUJaStowYBPPOF9mZmmO/wlgSy x0tWHA3CX2ArkkHhhSPRjicpI5bPnZPRXJDHGP6qT5QHrakIh/iWZ6PgLluepWjV9l0sJJzjzturnU 5wMo9UFPiC2rDbO6mNGZ46vb5CCMdbXvReB/KUoGr/pYYSLsltLfKFt1Mq8mNXuTeSjOEwrrl45qgQ sge0VZeMBTbe0+LF41B8beG6OLHzHrRoI8HOj5/q5nN5UOUhvjVYkQY23mNGf5Otbs1iBxKUAyQvFS 9bRBOVst7t2mGL3JfUjPU6vhvThxbdWmwiJR9I1BPkEhkSI5Y8qrFR3xatt/2y4QmSYv03XvGMVxiU 8ux76lHK7T3Z8akuGqQUDJo7e8s7xsc4VQZq+432lnziprAu374O5OhUeEUlGQ+g/UB9aV5dRqWaQx cNzDpDl8Pw+F8zsoiwmdYpfZ+eJi06ZdG228YQJakYYr4dF2raMxHKG7hV+w==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_152316_744374_CD97274A 
X-CRM114-Status: GOOD (  32.56  )
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

This helps each subsequent commit in clearly showing how and where the
code is being changed. The only change after a literal copy in this
commit is renaming the functions where necessary, and rename qnodes to
rqnodes.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/rqspinlock.c | 410 ++++++++++++++++++++++++++++++++++++
 1 file changed, 410 insertions(+)
 create mode 100644 kernel/locking/rqspinlock.c

diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
new file mode 100644
index 000000000000..143d9dda36f9
--- /dev/null
+++ b/kernel/locking/rqspinlock.c
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
+#include "qspinlock.h"
+#include "qspinlock_stat.h"
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
+#include "mcs_spinlock.h"
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
+EXPORT_SYMBOL(resilient_queued_spin_lock_slowpath);
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
+#include "qspinlock_paravirt.h"
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
2.43.5


