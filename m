Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12783C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgmvOyDRE/uHdGDx6ezBHiwZ8Zmst4a3Z/7igl9yl54=; b=vY1cwwQgtrJ3juKu88rnFDBL8S
	dUUe2xJmEnLTcgFEN7OKsaukFf/WfnoJl2cZT93AfHDGOeoUG1Sqafg7wrURxm+VfVMYk0glz/9jl
	gXqf2kj7Dgoyqu8ndM9HEGj/TwdtmeOphfzUcg5mfL1VRqSTLE9Y+ryAfxOKL2jSlD68n6AZQravT
	0iTVNiSnT2fIcopIZ21g9dJQ73dt3fEO0JHjN0hqA7uEAWfaxzfRthjYA0YfpLPHcKZNatDKxxhSR
	aB/sUWOqPNwWdR4lEmmUurskg9aAgPH5VkbYatjx5UnHjepDhPZrtBU14ZFW+So7f7Gvbmcsh5QXm
	pv5qyxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7jg-00000001Jtq-3SII;
	Mon, 03 Mar 2025 15:29:40 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dS-00000001I87-1Jny
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2401174f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015393; x=1741620193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgmvOyDRE/uHdGDx6ezBHiwZ8Zmst4a3Z/7igl9yl54=;
        b=igbSSwUTLt+5Zi/hdUHj1eQyUNijeHTqXxMkjCigt2/WUk9qlyloyX50KI1DYnTjw3
         0b6tY37OKeOpLRyN9WhnLvOnYMPKtrAPoGLVqQfu6qRaIDYNc5m/D15cQ99GaJZ03OY6
         d7o332JTOjZfFJ6lJviftOTbKUD/gdxN58CJBfet6NdKU24UT7M7vY77gJdfG82NHpb7
         0RM+M95+EuwlJ19ddECCXwr9frHS3JiiGs0wdpEMkf0YvdnH0FOAu4Gir94yJzN85pmV
         H/agVXXYvaiou2MtAYAmltZmNcKOn6efdYhxnK+Pb73ANtyMkaJsKlj9z8cVPq2Pe3LW
         aiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015393; x=1741620193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgmvOyDRE/uHdGDx6ezBHiwZ8Zmst4a3Z/7igl9yl54=;
        b=T/220FR4y8QuOXy4FdVg687qYO14rPO/ES8x9wQR54FaJQmiYD1JaWf+GAsDFUQSuV
         6zPXg4aPTPQMpeJaH9wJ/15Nwm6yBBgGz9vn3NSoS+LlPw7tuFAGhvZkLvePZ0NRp2X/
         mpzjtNV2DbIm3531myo7nPd2JCnglH1G1lzzKex18Q/S7C6ovP9FzBzUocehWtnFDv84
         Zk1l81UGLgGCXWkCtDmv/IuMt79oDSIoizj1Wk7ZSM5kvB7b+WDLpgAASQJm+jwV88fM
         7ljuO9yTZARmsEhgS6UH/2R6Fsa5aX1zj1p4m0fDnkaXGggVMMNY9+ZGUAxakhpk40DA
         ze1w==
X-Forwarded-Encrypted: i=1; AJvYcCUZGzGf9ILX1SSYPOMv2WHMQp1mGUviGryNO0bOgO7NX8ul4AIhrERWZhDTW1AZ1byDqI30bBlBZei0DwFWLBjW@lists.infradead.org
X-Gm-Message-State: AOJu0YxNDDn9Wk6dpMK5f9OjX3UjhNxUF8GbBEaMXpWP/7lmRzI3wf7J
	NxHMOMOiX/JgPYRjiUHEN1/J2GVxAelvj73DxSJE0L3lyJaV1lSp
X-Gm-Gg: ASbGncsc0F5vx70Tpz4+vs7pFeXlEB9M2lXw5WpmS0XDWcyBXE/L3w/Af209pqRoGhz
	gTV67tYKJG51uB64ZMZxkiayZK9/b5V64jRJwnltvRHbgbLLvmDjzTvX6D+2gjFKmN1n8wPlrDh
	rZyneNpVTcsQ9OqU5RlYBS3SIhpI2TxWNNjfr9cLve01LavllA6QQDa9pZIClD2xGmKyrN90tq3
	bHlF0WKTFa8x28e7rM5ZZRt/Oat26nvy4LZMO93rxysYYIs2aOwRT4U2KoFZAhQuUGWm5u9kHtB
	GXTBPe5sOlSkHA1k2X+VRD0wNUiPzUrIKoQ=
X-Google-Smtp-Source: AGHT+IEZmbL4kTVe2++oKcRU5JQYI+CySPZk9bC17VESbEqwwtp816GvVhoQy61ssaTtOJsaTHaHDQ==
X-Received: by 2002:a5d:64a5:0:b0:391:b23:b318 with SMTP id ffacd0b85a97d-3910b23b573mr3648211f8f.41.1741015392642;
        Mon, 03 Mar 2025 07:23:12 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:72::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e486eea3sm14548017f8f.101.2025.03.03.07.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:12 -0800 (PST)
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
Subject: [PATCH bpf-next v3 02/25] locking: Move common qspinlock helpers to a private header
Date: Mon,  3 Mar 2025 07:22:42 -0800
Message-ID: <20250303152305.3195648-3-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13562; h=from:subject; bh=eKJ3qxGBtRJg8l1rvSHjaQtIHqaeLQcTbgGFSWnocak=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWVkVfZqT1tCitfFNFTby5Hz/Q0Ls5KtoFEDTCL cZHH7UOJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlQAKCRBM4MiGSL8RypysEA C3leDFcx+MonrV13UNP/a1KQjzZBifx/rS8N1isQIHzlulO71sBTAbTJDuZM6yq/0bU/qUs8hwXLq/ w8imvbbOhV0sg2v0XcsUu+Qqaji1dlaEl8+Yzo1SsBEL0NAFxDJtE2OgpBRNEITRSoUsbzwYGVJItt ptZni9OCm9cqgf2GOBiN2XXULRyhnYmdK/eUHMcHrEQvOy2rOdJNpf2dSxW8CcYd49oZaMAqF319OI 19D1ra8czLwFo1Y3MCrEQuT73bn0YZIwfZYdmwgoihZWMjvvZ6rNwRLzpDN5XJLhZLUZEK6pUn5Xpe GcTDtEFLciWRXU6QhN2gu0ZAm9XKtRaR4Hp5yOy3qf2tkMxt5L5ad1BnhyPm8drcY8LQPc/zB5fuIX t029FoAw1yTCn//bVcO6KrFEyGMCMgZ8/UtZpPrcIB70+R1GFk0CB/u0iyKykO1ee5ke5aVFFPZMsb KGBfAxmEcDwbj/LlC/q7xnfODH0cObC073WRxVzQMIOOBYdONvuAD5d1+YlWUOSAUNWrB8olMJS67I sIUraNIODLQ7Rw8YCl2Ekg1SRQA0pvBono+BLof7ZvXRM/L1GUVhc8kNk6XpOToWnQf5XX5OU35vVG 7APJ8S46OuAh06qCXM9teIlkPaNqlA0TdWqHhyfcftt9TvzHsXib5eD7UN6A==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072314_489999_1BC711CE 
X-CRM114-Status: GOOD (  28.00  )
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

Move qspinlock helper functions that encode, decode tail word, set and
clear the pending and locked bits, and other miscellaneous definitions
and macros to a private header. To this end, create a qspinlock.h header
file in kernel/locking. Subsequent commits will introduce a modified
qspinlock slow path function, thus moving shared code to a private
header will help minimize unnecessary code duplication.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/qspinlock.c | 193 +----------------------------------
 kernel/locking/qspinlock.h | 200 +++++++++++++++++++++++++++++++++++++
 2 files changed, 205 insertions(+), 188 deletions(-)
 create mode 100644 kernel/locking/qspinlock.h

diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
index 7d96bed718e4..af8d122bb649 100644
--- a/kernel/locking/qspinlock.c
+++ b/kernel/locking/qspinlock.c
@@ -25,8 +25,9 @@
 #include <trace/events/lock.h>
 
 /*
- * Include queued spinlock statistics code
+ * Include queued spinlock definitions and statistics code
  */
+#include "qspinlock.h"
 #include "qspinlock_stat.h"
 
 /*
@@ -67,36 +68,6 @@
  */
 
 #include "mcs_spinlock.h"
-#define MAX_NODES	4
-
-/*
- * On 64-bit architectures, the mcs_spinlock structure will be 16 bytes in
- * size and four of them will fit nicely in one 64-byte cacheline. For
- * pvqspinlock, however, we need more space for extra data. To accommodate
- * that, we insert two more long words to pad it up to 32 bytes. IOW, only
- * two of them can fit in a cacheline in this case. That is OK as it is rare
- * to have more than 2 levels of slowpath nesting in actual use. We don't
- * want to penalize pvqspinlocks to optimize for a rare case in native
- * qspinlocks.
- */
-struct qnode {
-	struct mcs_spinlock mcs;
-#ifdef CONFIG_PARAVIRT_SPINLOCKS
-	long reserved[2];
-#endif
-};
-
-/*
- * The pending bit spinning loop count.
- * This heuristic is used to limit the number of lockword accesses
- * made by atomic_cond_read_relaxed when waiting for the lock to
- * transition out of the "== _Q_PENDING_VAL" state. We don't spin
- * indefinitely because there's no guarantee that we'll make forward
- * progress.
- */
-#ifndef _Q_PENDING_LOOPS
-#define _Q_PENDING_LOOPS	1
-#endif
 
 /*
  * Per-CPU queue node structures; we can never have more than 4 nested
@@ -106,161 +77,7 @@ struct qnode {
  *
  * PV doubles the storage and uses the second cacheline for PV state.
  */
-static DEFINE_PER_CPU_ALIGNED(struct qnode, qnodes[MAX_NODES]);
-
-/*
- * We must be able to distinguish between no-tail and the tail at 0:0,
- * therefore increment the cpu number by one.
- */
-
-static inline __pure u32 encode_tail(int cpu, int idx)
-{
-	u32 tail;
-
-	tail  = (cpu + 1) << _Q_TAIL_CPU_OFFSET;
-	tail |= idx << _Q_TAIL_IDX_OFFSET; /* assume < 4 */
-
-	return tail;
-}
-
-static inline __pure struct mcs_spinlock *decode_tail(u32 tail)
-{
-	int cpu = (tail >> _Q_TAIL_CPU_OFFSET) - 1;
-	int idx = (tail &  _Q_TAIL_IDX_MASK) >> _Q_TAIL_IDX_OFFSET;
-
-	return per_cpu_ptr(&qnodes[idx].mcs, cpu);
-}
-
-static inline __pure
-struct mcs_spinlock *grab_mcs_node(struct mcs_spinlock *base, int idx)
-{
-	return &((struct qnode *)base + idx)->mcs;
-}
-
-#define _Q_LOCKED_PENDING_MASK (_Q_LOCKED_MASK | _Q_PENDING_MASK)
-
-#if _Q_PENDING_BITS == 8
-/**
- * clear_pending - clear the pending bit.
- * @lock: Pointer to queued spinlock structure
- *
- * *,1,* -> *,0,*
- */
-static __always_inline void clear_pending(struct qspinlock *lock)
-{
-	WRITE_ONCE(lock->pending, 0);
-}
-
-/**
- * clear_pending_set_locked - take ownership and clear the pending bit.
- * @lock: Pointer to queued spinlock structure
- *
- * *,1,0 -> *,0,1
- *
- * Lock stealing is not allowed if this function is used.
- */
-static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
-{
-	WRITE_ONCE(lock->locked_pending, _Q_LOCKED_VAL);
-}
-
-/*
- * xchg_tail - Put in the new queue tail code word & retrieve previous one
- * @lock : Pointer to queued spinlock structure
- * @tail : The new queue tail code word
- * Return: The previous queue tail code word
- *
- * xchg(lock, tail), which heads an address dependency
- *
- * p,*,* -> n,*,* ; prev = xchg(lock, node)
- */
-static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
-{
-	/*
-	 * We can use relaxed semantics since the caller ensures that the
-	 * MCS node is properly initialized before updating the tail.
-	 */
-	return (u32)xchg_relaxed(&lock->tail,
-				 tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
-}
-
-#else /* _Q_PENDING_BITS == 8 */
-
-/**
- * clear_pending - clear the pending bit.
- * @lock: Pointer to queued spinlock structure
- *
- * *,1,* -> *,0,*
- */
-static __always_inline void clear_pending(struct qspinlock *lock)
-{
-	atomic_andnot(_Q_PENDING_VAL, &lock->val);
-}
-
-/**
- * clear_pending_set_locked - take ownership and clear the pending bit.
- * @lock: Pointer to queued spinlock structure
- *
- * *,1,0 -> *,0,1
- */
-static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
-{
-	atomic_add(-_Q_PENDING_VAL + _Q_LOCKED_VAL, &lock->val);
-}
-
-/**
- * xchg_tail - Put in the new queue tail code word & retrieve previous one
- * @lock : Pointer to queued spinlock structure
- * @tail : The new queue tail code word
- * Return: The previous queue tail code word
- *
- * xchg(lock, tail)
- *
- * p,*,* -> n,*,* ; prev = xchg(lock, node)
- */
-static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
-{
-	u32 old, new;
-
-	old = atomic_read(&lock->val);
-	do {
-		new = (old & _Q_LOCKED_PENDING_MASK) | tail;
-		/*
-		 * We can use relaxed semantics since the caller ensures that
-		 * the MCS node is properly initialized before updating the
-		 * tail.
-		 */
-	} while (!atomic_try_cmpxchg_relaxed(&lock->val, &old, new));
-
-	return old;
-}
-#endif /* _Q_PENDING_BITS == 8 */
-
-/**
- * queued_fetch_set_pending_acquire - fetch the whole lock value and set pending
- * @lock : Pointer to queued spinlock structure
- * Return: The previous lock value
- *
- * *,*,* -> *,1,*
- */
-#ifndef queued_fetch_set_pending_acquire
-static __always_inline u32 queued_fetch_set_pending_acquire(struct qspinlock *lock)
-{
-	return atomic_fetch_or_acquire(_Q_PENDING_VAL, &lock->val);
-}
-#endif
-
-/**
- * set_locked - Set the lock bit and own the lock
- * @lock: Pointer to queued spinlock structure
- *
- * *,*,0 -> *,0,1
- */
-static __always_inline void set_locked(struct qspinlock *lock)
-{
-	WRITE_ONCE(lock->locked, _Q_LOCKED_VAL);
-}
-
+static DEFINE_PER_CPU_ALIGNED(struct qnode, qnodes[_Q_MAX_NODES]);
 
 /*
  * Generate the native code for queued_spin_unlock_slowpath(); provide NOPs for
@@ -410,7 +227,7 @@ void __lockfunc queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
 	 * any MCS node. This is not the most elegant solution, but is
 	 * simple enough.
 	 */
-	if (unlikely(idx >= MAX_NODES)) {
+	if (unlikely(idx >= _Q_MAX_NODES)) {
 		lockevent_inc(lock_no_node);
 		while (!queued_spin_trylock(lock))
 			cpu_relax();
@@ -465,7 +282,7 @@ void __lockfunc queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
 	 * head of the waitqueue.
 	 */
 	if (old & _Q_TAIL_MASK) {
-		prev = decode_tail(old);
+		prev = decode_tail(old, qnodes);
 
 		/* Link @node into the waitqueue. */
 		WRITE_ONCE(prev->next, node);
diff --git a/kernel/locking/qspinlock.h b/kernel/locking/qspinlock.h
new file mode 100644
index 000000000000..d4ceb9490365
--- /dev/null
+++ b/kernel/locking/qspinlock.h
@@ -0,0 +1,200 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Queued spinlock defines
+ *
+ * This file contains macro definitions and functions shared between different
+ * qspinlock slow path implementations.
+ */
+#ifndef __LINUX_QSPINLOCK_H
+#define __LINUX_QSPINLOCK_H
+
+#include <asm-generic/percpu.h>
+#include <linux/percpu-defs.h>
+#include <asm-generic/qspinlock.h>
+#include <asm-generic/mcs_spinlock.h>
+
+#define _Q_MAX_NODES	4
+
+/*
+ * The pending bit spinning loop count.
+ * This heuristic is used to limit the number of lockword accesses
+ * made by atomic_cond_read_relaxed when waiting for the lock to
+ * transition out of the "== _Q_PENDING_VAL" state. We don't spin
+ * indefinitely because there's no guarantee that we'll make forward
+ * progress.
+ */
+#ifndef _Q_PENDING_LOOPS
+#define _Q_PENDING_LOOPS	1
+#endif
+
+/*
+ * On 64-bit architectures, the mcs_spinlock structure will be 16 bytes in
+ * size and four of them will fit nicely in one 64-byte cacheline. For
+ * pvqspinlock, however, we need more space for extra data. To accommodate
+ * that, we insert two more long words to pad it up to 32 bytes. IOW, only
+ * two of them can fit in a cacheline in this case. That is OK as it is rare
+ * to have more than 2 levels of slowpath nesting in actual use. We don't
+ * want to penalize pvqspinlocks to optimize for a rare case in native
+ * qspinlocks.
+ */
+struct qnode {
+	struct mcs_spinlock mcs;
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+	long reserved[2];
+#endif
+};
+
+/*
+ * We must be able to distinguish between no-tail and the tail at 0:0,
+ * therefore increment the cpu number by one.
+ */
+
+static inline __pure u32 encode_tail(int cpu, int idx)
+{
+	u32 tail;
+
+	tail  = (cpu + 1) << _Q_TAIL_CPU_OFFSET;
+	tail |= idx << _Q_TAIL_IDX_OFFSET; /* assume < 4 */
+
+	return tail;
+}
+
+static inline __pure struct mcs_spinlock *decode_tail(u32 tail, struct qnode *qnodes)
+{
+	int cpu = (tail >> _Q_TAIL_CPU_OFFSET) - 1;
+	int idx = (tail &  _Q_TAIL_IDX_MASK) >> _Q_TAIL_IDX_OFFSET;
+
+	return per_cpu_ptr(&qnodes[idx].mcs, cpu);
+}
+
+static inline __pure
+struct mcs_spinlock *grab_mcs_node(struct mcs_spinlock *base, int idx)
+{
+	return &((struct qnode *)base + idx)->mcs;
+}
+
+#define _Q_LOCKED_PENDING_MASK (_Q_LOCKED_MASK | _Q_PENDING_MASK)
+
+#if _Q_PENDING_BITS == 8
+/**
+ * clear_pending - clear the pending bit.
+ * @lock: Pointer to queued spinlock structure
+ *
+ * *,1,* -> *,0,*
+ */
+static __always_inline void clear_pending(struct qspinlock *lock)
+{
+	WRITE_ONCE(lock->pending, 0);
+}
+
+/**
+ * clear_pending_set_locked - take ownership and clear the pending bit.
+ * @lock: Pointer to queued spinlock structure
+ *
+ * *,1,0 -> *,0,1
+ *
+ * Lock stealing is not allowed if this function is used.
+ */
+static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
+{
+	WRITE_ONCE(lock->locked_pending, _Q_LOCKED_VAL);
+}
+
+/*
+ * xchg_tail - Put in the new queue tail code word & retrieve previous one
+ * @lock : Pointer to queued spinlock structure
+ * @tail : The new queue tail code word
+ * Return: The previous queue tail code word
+ *
+ * xchg(lock, tail), which heads an address dependency
+ *
+ * p,*,* -> n,*,* ; prev = xchg(lock, node)
+ */
+static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
+{
+	/*
+	 * We can use relaxed semantics since the caller ensures that the
+	 * MCS node is properly initialized before updating the tail.
+	 */
+	return (u32)xchg_relaxed(&lock->tail,
+				 tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
+}
+
+#else /* _Q_PENDING_BITS == 8 */
+
+/**
+ * clear_pending - clear the pending bit.
+ * @lock: Pointer to queued spinlock structure
+ *
+ * *,1,* -> *,0,*
+ */
+static __always_inline void clear_pending(struct qspinlock *lock)
+{
+	atomic_andnot(_Q_PENDING_VAL, &lock->val);
+}
+
+/**
+ * clear_pending_set_locked - take ownership and clear the pending bit.
+ * @lock: Pointer to queued spinlock structure
+ *
+ * *,1,0 -> *,0,1
+ */
+static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
+{
+	atomic_add(-_Q_PENDING_VAL + _Q_LOCKED_VAL, &lock->val);
+}
+
+/**
+ * xchg_tail - Put in the new queue tail code word & retrieve previous one
+ * @lock : Pointer to queued spinlock structure
+ * @tail : The new queue tail code word
+ * Return: The previous queue tail code word
+ *
+ * xchg(lock, tail)
+ *
+ * p,*,* -> n,*,* ; prev = xchg(lock, node)
+ */
+static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
+{
+	u32 old, new;
+
+	old = atomic_read(&lock->val);
+	do {
+		new = (old & _Q_LOCKED_PENDING_MASK) | tail;
+		/*
+		 * We can use relaxed semantics since the caller ensures that
+		 * the MCS node is properly initialized before updating the
+		 * tail.
+		 */
+	} while (!atomic_try_cmpxchg_relaxed(&lock->val, &old, new));
+
+	return old;
+}
+#endif /* _Q_PENDING_BITS == 8 */
+
+/**
+ * queued_fetch_set_pending_acquire - fetch the whole lock value and set pending
+ * @lock : Pointer to queued spinlock structure
+ * Return: The previous lock value
+ *
+ * *,*,* -> *,1,*
+ */
+#ifndef queued_fetch_set_pending_acquire
+static __always_inline u32 queued_fetch_set_pending_acquire(struct qspinlock *lock)
+{
+	return atomic_fetch_or_acquire(_Q_PENDING_VAL, &lock->val);
+}
+#endif
+
+/**
+ * set_locked - Set the lock bit and own the lock
+ * @lock: Pointer to queued spinlock structure
+ *
+ * *,*,0 -> *,0,1
+ */
+static __always_inline void set_locked(struct qspinlock *lock)
+{
+	WRITE_ONCE(lock->locked, _Q_LOCKED_VAL);
+}
+
+#endif /* __LINUX_QSPINLOCK_H */
-- 
2.43.5


