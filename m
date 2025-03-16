Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376AFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZDPUUfPIPI1I/a7znm6GXK798ScLYPYP7jBEkUfqo8=; b=2UpW8o29doYIeLQaOaGP30yh8D
	6ZDJcJjU+dpUCnAa/mXQoBH2Og9JiNAn/mK6yBUSg0br485KA8OyOwzOiDeJRtxl39EH67WAD0U0T
	pV+FKKnjp/11C2RW2qEIAgrBFwGpCVrJW6tSFbjecJhbv1cqKf86GZIN3S9fFC91v3eAXV+GYuZWP
	1KmepunIyhXvmhskf2GAytflBD5/SbWv1D1AITM1c0UvVRUaCS3lBPPSkgcXEovgYKnCX2qW2JJEg
	/T8j1omifmChSZE06JTaKCGYQ1N2N+YrLftQBgBZKjadepjHeNk2af6nZRqwNZLXC6p8Fml+b6kNU
	2PMo6LwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfKx-0000000HDQh-3A8z;
	Sun, 16 Mar 2025 04:10:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfFz-0000000HC90-22n2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:05:49 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-43690d4605dso6606655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097946; x=1742702746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZDPUUfPIPI1I/a7znm6GXK798ScLYPYP7jBEkUfqo8=;
        b=lEEpXhPddsMjbVTPihJUAw/fe5r9NqCKnb89HJP+ck/+00prkqYaRBeQHRIrzSMjJw
         AlrV11fTU+ZOV8GSW/sHQw8G1QgzrAnVUfb5Ui9bg1vafUPufqDcsyo+fJ8+iRb56mcZ
         qfmlPQIkXFhwJMxgBWz8fR40dtTBIRJ6ivMxCVzHt4a2Jld6sVgAkmky7knoNO/29Mhz
         etMp6gSmUXqA6s88CE6Va4h6YgHK9LtNEfteAYVE3EOnUg/ZUJ6QRU/6ybeOHHH4c6RZ
         6bAIr6qbdDl4f4XkgNpA705X4nft0wgEQ3NIKB9d0LE5hTssDSbRmrH2RxDAsG8QMJad
         hXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097946; x=1742702746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZDPUUfPIPI1I/a7znm6GXK798ScLYPYP7jBEkUfqo8=;
        b=lQrAum4pCFQWlpECSOpNOIp5OCt85kDSlneNwt3UChFsbp7agTe6ZziiqzxMXx28Wv
         eJfkhVJQwCBSXHd3+xTz7cVfvCB3XpByqGGs3V60GN1Y2sb16EfLA1697uPenRdyf0ZV
         vbpT49dNgCzPR2FoUAggAoM+c2bCPwBBAby7AWRcNEJqidq+HSUHV4Jp434hbbdM1PJW
         T39ijt9sFcHTVOJFYB+ydDW8QCH3lLVBcUBXH62i1yzMen5Y+PzkXEf48wjSu1GmvQIl
         aqiUJF38uE0upelqCUoILc9KgZO8zwjqJPloBgzOIExtmRU8hCPx8T6YDh254IiBbCjU
         /x1g==
X-Forwarded-Encrypted: i=1; AJvYcCWAfYh7O91vN/imVQcJYxl+/z5ecpmEbHZzwFDSyYS1XzsnFOa6Wr2ZXl4EGky76ep64K8conBrvSwcqqG8Shvv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+YaPkSIUD2Y61EvRwHANepNN46O/Xp+X+T1jXQtJWzC1Iuo8t
	NdT8qlXWohogXQV3A1uHqjWdh2P0I46IXC2KtLlt9XgloDGDFI5Z
X-Gm-Gg: ASbGncs/AesxwqVyMygbYMEYnxFDTHSTGl/wab5mQZjkbMpdiT+3XuLho/AKlC2Ztjw
	RfPtTzd2cJs4ZyWV6uYo/YQCbclxUQaHxbro91a5T/t/NZd25SdVjREp7+gajclTwNNaX2hntGl
	MM+6uBFSePi7POTkskshFOZTakaDZo7hWyn2vyhZd3VOrZ42F6BU4drVIk0xRg1phpsYfhnDYJO
	t8R/cuMmOhypGhX/AzulTfFiZAU1IAGQn6bUeihvHQeExmSeFt5yW//28D000htDZhI41Yvf54d
	ft4IMN8+D/CNuuUhWUaLDKA1o0LGouQ8qg==
X-Google-Smtp-Source: AGHT+IGQENkXPWklAfMwa5tz+DJLXBtrNTvE3SYBajxXKIcQybZMggtMRpVOuyPRCt7uZr8imHSk7A==
X-Received: by 2002:adf:b511:0:b0:391:2bab:d2fd with SMTP id ffacd0b85a97d-3972086e264mr8092081f8f.37.1742097945494;
        Sat, 15 Mar 2025 21:05:45 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:3::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffc4173sm67180505e9.20.2025.03.15.21.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:05:44 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 02/25] locking: Move common qspinlock helpers to a private header
Date: Sat, 15 Mar 2025 21:05:18 -0700
Message-ID: <20250316040541.108729-3-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13562; h=from:subject; bh=P6WGJXH3MTYAaWinW8eboOniR3lR+VqqyTTeTx9qsto=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3bMavRJM1KjtMppAwdQp0y3W5tnfeN56xhPQqP M1qWb9WJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN2wAKCRBM4MiGSL8RyreTD/ 4hVzlupZxK+mXnZN8k0vM3l0bfdhXAjegYO6MB4u/i91194228LN6CqHYReD3NrKgIY7Ue/lOtB5I8 pe6xiAeiXsjhwaxVw+eERShrPtXscrLjqVkPbhYaUpztghP5FcpkEiHrtf0Ovl1mV3AioL8+6Yud4a 855N6w8ocvsmrAjpnk7ZG3LlTm2/sqyQ/oSATI/ru4AY+Npf46eYKJPRQgZmUCHnTHycySFMZ/0O9y 4sZpNEcRRxc5gekVdr1W5QxoZ8exvppkXShi14L8nOQtu07c7MIvXstpHDOjpgBiUp2S2lEaoSxwuJ e3PMjaLA59vDdLR+cjJ0ONxQDARw/hXHz0hJZ0Y6KtzdJ6YHyQrMQyboYuuk68RN9xyKHCziUOmdLw 3QB7tcInWuPYX0gO9t5CjDcd5uYjUE+jBNb5ZVL3I9eLcaDXPaydxo37NnezFHGPOAKrgVt2OpwekQ 3Ydi+cTB2XWKxI8kABZ6BZPbW2LrCGMQbmad22jcHBlWed26N8fAYEIehmtbwSCE1AlSuX+jTR0jLw wIWBpXB9Tsrio20/PuUDpgbem6EDL2zHfZhFYrLtNTtbLpI8ttEz/hBqaeOveace8E/95yjGlAzosm me8B3MJ2NYiphGOt8QwTmzvU3+qxGbwXERjjtIv0R2DUcIe8gjvYD7V85LEg==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210547_534915_C384B70B 
X-CRM114-Status: GOOD (  28.27  )
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
2.47.1


