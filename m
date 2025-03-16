Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6A6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9oRTQ+VV5E61dUbGRZRpYYl6d2ZXF0CN+Od4Rtwxwc=; b=a3zEQPt0BMSEq37A6REJxT3Ftx
	51mq0V4l26vldbuMJGxZVSD2y9jD6mDveM5XuOPOZtsuxXbqcHAHCAv1kt0JMoCq8tsDVg8jTNAOl
	b1g7bvOcPVaL/YV1fnaLjlUj39+Qld3/QQ1lrQnafB4DhNuLv7udwPbgIy/B5aUIh+VmIPyqjl8+g
	f0lhd4C9fFp6P+spsiLFVfzjyVfRKGmumxhiUWUBuRhNOypqNhdk/7+P6FUfRnl2knMuMBmQjOlyJ
	Vo5pYDK87M0JcycMl/0MKwZVX4HOz3z3lZxU7r3DcSls8DQxYgHRz1zqmaOhtBOhNsabbG37U8gxX
	UaJiapaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfY7-0000000HEwj-3Uo4;
	Sun, 16 Mar 2025 04:24:31 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfG9-0000000HCGA-2GMN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:05:58 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso11500115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097956; x=1742702756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9oRTQ+VV5E61dUbGRZRpYYl6d2ZXF0CN+Od4Rtwxwc=;
        b=gwsmfCL+LgzbDeQkwUr82h+SeN4fk8yl3accNjdJ9FEoK84YfPOePoBWb0NcJhz7+S
         q+AHcqf7LAKhUsCjIg4hybUm+E4Wmx1g6X5Df9ix5tQ3ckMZkoq+6wV4JRlJjlO/K5Bt
         zZ+uPC92PLPvg2lkTnAV/NsAkKhppmIPZAfqMVhxxfLecLEvnfXdLtM+8uFLf0CmTYEq
         YIMIXm7zT0hcdq6yroBYNZis6vyB2MbSae7xw+7+06XoDs8Sx1zxcB+nkbG6IkR/dfDN
         zgAF4osIVhkPB96gy/f7KVmFXyZSGeMcHjQqMIgxbbtTI9wX64STo3PaQ2OiotSHwpuV
         J0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097956; x=1742702756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9oRTQ+VV5E61dUbGRZRpYYl6d2ZXF0CN+Od4Rtwxwc=;
        b=ZKmguzby1kYs+k3VPksH9MfjQA+NwQDnGNRI8m28C+JA2tdKjr1o/+iVXDe3PmYeyw
         5K57A9/RbdjYjRvDgTwVDQ/fHYhzwg0Zkrj9HjwNqI3ZKndYKds4bd+7EcnPJXe0i8Im
         Co+DIxYQrmPd2iyUxJiqeiH7y3yWPqWA8AubGJAfTSxKP7pf+u9PGFWUqLZ8UBsOsjnY
         n83VOiypN1xot6AptUV9+87ujgBXDVvKK7mCzB8umGCUiDWkZHhYNY+5LKGIvBGvY881
         0olBrNz/0FEenAGW6mMORFc0NuidZYlkIgeElEdsB+7eMWpNhPn2yckRX3vBDL55Yw0n
         j6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVzerS6jKQ6ePf9o65/kqMxcI7R6hsCr4H45D1yeoIXpo32ItLPDLUUXkz1tKTSomo3kTOmCRZ8qNdifLI5673U@lists.infradead.org
X-Gm-Message-State: AOJu0YyvT+m6tSrjell3DGviWoRB5axVvuwQXaPiMXp9e4d8cgIli7oD
	Hkf+vXeh8jCoh2YpLFY9KWSt0XjXnc1umhY4JZxl0QTY9N7NLf7HBD0mqVN2HfY=
X-Gm-Gg: ASbGncsuLByQQwj3MeAgfPJOt1FQdwN31Dg47ef+B5/ME3KKVe4H/Tnu7MP3noYq2Ys
	aq5Fs65gckuJURFr/PP74YOQDCIcelLg3d1K4mep8KdRwMEHyOh/DLApP+hYMKxUycZsVxKmSma
	GqawdypC2ag5o+pN5NYl82Fd4mNvt1fVbHkLSqxgy3YF2jhzpiNFdS0abmonhrm/aY3hgAshxAx
	I1hNA/fA9RAqpu3qH3egm6iZmidePATbzHTIuoql687Ju3z56bfWXWCDteIDHHe14aBUIlRzmwa
	RjFPZZNGz4r/HbO+DMWhINZ2WZYibtSy2yE=
X-Google-Smtp-Source: AGHT+IFkEauTHl/obyRmNhRmy/pJEBw/VAi/+QiZFNK10Y71rJhRLvMF1sFfj0C34r6TkaQ2AWy76g==
X-Received: by 2002:a05:600c:548e:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-43d1ec72a60mr95473375e9.3.1742097956021;
        Sat, 15 Mar 2025 21:05:56 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:71::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40fab8sm11240358f8f.63.2025.03.15.21.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:05:55 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 10/25] rqspinlock: Protect waiters in queue from stalls
Date: Sat, 15 Mar 2025 21:05:26 -0700
Message-ID: <20250316040541.108729-11-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8535; h=from:subject; bh=vVjQGLLHhTQCMBetlOFIdU+ojPl1vLkRKHm30dVzCfs=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3cSLlo4tmtO0ItN2MrwskyKIwLLs6w+ebaLBXo 7AIxPteJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3AAKCRBM4MiGSL8RysmSD/ 4gAxpbVRAMKnrlkkFfN4Ga5MkaT9kFKIB75NzYnTksK7CH8hhGDYv+JLi+RdymiKCyY9nzzCusLCvH DgKiy8dOd7jd4kK2asNPQv83NeMlK0Y7ez2xIW0aheacqs2xHVRzHNpXJrhlXMFk9AOjed7lRqaZkk MHYjtNrFJYw2buxWBArDplbtplJ6ZFnH/R4X9150luydwS58JO6v1dpAXhDRtZug46Mf3bEhF2OxqC jOYtEwXKFE02GDoCLR+Ux1Tq9HAULxytmj+cG4B/5lN3ArOwmML81960DEOmDRtiBuM13th+wrnsBv j5ht8UeNorxeqAqlS0DKTVL5GwgKQ0J/gMt567PrzjsdttH9cQ2U+GS1RvleETvs2fRov1kvHQlCBh zWbay++IImUzfsbrUbJsWtbQz5zd7WoeMVXwycELimgnu6pMDDfOmXnPyktSfkP+Y2afRyImMjuGmz onfCAORf8i939MF0Z78DKXqnm5ooMaXPCja7iWalvBWDsRQVJXMA4eNMfbKC582zqFpuWWwa5V8NWm VhoIH2++de0gRcjcmh/Wg9q2PogVDyiUpdPW0390l2OIviAlmCmDbOMeMMvmSAOonJmYnfqgmklT82 erZE+jj8vv/93kMS/3ldvy0UA/t4FMfRnggOei1u5ghurEjEm+jmBceT6Qrg==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210557_700313_5CF20A48 
X-CRM114-Status: GOOD (  38.16  )
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

Implement the wait queue cleanup algorithm for rqspinlock. There are
three forms of waiters in the original queued spin lock algorithm. The
first is the waiter which acquires the pending bit and spins on the lock
word without forming a wait queue. The second is the head waiter that is
the first waiter heading the wait queue. The third form is of all the
non-head waiters queued behind the head, waiting to be signalled through
their MCS node to overtake the responsibility of the head.

In this commit, we are concerned with the second and third kind. First,
we augment the waiting loop of the head of the wait queue with a
timeout. When this timeout happens, all waiters part of the wait queue
will abort their lock acquisition attempts. This happens in three steps.
First, the head breaks out of its loop waiting for pending and locked
bits to turn to 0, and non-head waiters break out of their MCS node spin
(more on that later). Next, every waiter (head or non-head) attempts to
check whether they are also the tail waiter, in such a case they attempt
to zero out the tail word and allow a new queue to be built up for this
lock. If they succeed, they have no one to signal next in the queue to
stop spinning. Otherwise, they signal the MCS node of the next waiter to
break out of its spin and try resetting the tail word back to 0. This
goes on until the tail waiter is found. In case of races, the new tail
will be responsible for performing the same task, as the old tail will
then fail to reset the tail word and wait for its next pointer to be
updated before it signals the new tail to do the same.

We terminate the whole wait queue because of two main reasons. Firstly,
we eschew per-waiter timeouts with one applied at the head of the wait
queue.  This allows everyone to break out faster once we've seen the
owner / pending waiter not responding for the timeout duration from the
head.  Secondly, it avoids complicated synchronization, because when not
leaving in FIFO order, prev's next pointer needs to be fixed up etc.

Lastly, all of these waiters release the rqnode and return to the
caller. This patch underscores the point that rqspinlock's timeout does
not apply to each waiter individually, and cannot be relied upon as an
upper bound. It is possible for the rqspinlock waiters to return early
from a failed lock acquisition attempt as soon as stalls are detected.

The head waiter cannot directly WRITE_ONCE the tail to zero, as it may
race with a concurrent xchg and a non-head waiter linking its MCS node
to the head's MCS node through 'prev->next' assignment.

One notable thing is that we must use RES_DEF_TIMEOUT * 2 as our maximum
duration for the waiting loop (for the wait queue head), since we may
have both the owner and pending bit waiter ahead of us, and in the worst
case, need to span their maximum permitted critical section lengths.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/bpf/rqspinlock.c | 55 ++++++++++++++++++++++++++++++++++++++---
 kernel/bpf/rqspinlock.h | 48 +++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+), 3 deletions(-)
 create mode 100644 kernel/bpf/rqspinlock.h

diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index 262294cfd36f..65c2b41d8937 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -77,6 +77,8 @@ struct rqspinlock_timeout {
 	u16 spin;
 };
 
+#define RES_TIMEOUT_VAL	2
+
 static noinline int check_timeout(struct rqspinlock_timeout *ts)
 {
 	u64 time = ktime_get_mono_fast_ns();
@@ -325,12 +327,18 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 * head of the waitqueue.
 	 */
 	if (old & _Q_TAIL_MASK) {
+		int val;
+
 		prev = decode_tail(old, rqnodes);
 
 		/* Link @node into the waitqueue. */
 		WRITE_ONCE(prev->next, node);
 
-		arch_mcs_spin_lock_contended(&node->locked);
+		val = arch_mcs_spin_lock_contended(&node->locked);
+		if (val == RES_TIMEOUT_VAL) {
+			ret = -EDEADLK;
+			goto waitq_timeout;
+		}
 
 		/*
 		 * While waiting for the MCS lock, the next pointer may have
@@ -353,8 +361,49 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 * store-release that clears the locked bit and create lock
 	 * sequentiality; this is because the set_locked() function below
 	 * does not imply a full barrier.
+	 *
+	 * We use RES_DEF_TIMEOUT * 2 as the duration, as RES_DEF_TIMEOUT is
+	 * meant to span maximum allowed time per critical section, and we may
+	 * have both the owner of the lock and the pending bit waiter ahead of
+	 * us.
 	 */
-	val = atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK));
+	RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT * 2);
+	val = res_atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK) ||
+					   RES_CHECK_TIMEOUT(ts, ret));
+
+waitq_timeout:
+	if (ret) {
+		/*
+		 * If the tail is still pointing to us, then we are the final waiter,
+		 * and are responsible for resetting the tail back to 0. Otherwise, if
+		 * the cmpxchg operation fails, we signal the next waiter to take exit
+		 * and try the same. For a waiter with tail node 'n':
+		 *
+		 * n,*,* -> 0,*,*
+		 *
+		 * When performing cmpxchg for the whole word (NR_CPUS > 16k), it is
+		 * possible locked/pending bits keep changing and we see failures even
+		 * when we remain the head of wait queue. However, eventually,
+		 * pending bit owner will unset the pending bit, and new waiters
+		 * will queue behind us. This will leave the lock owner in
+		 * charge, and it will eventually either set locked bit to 0, or
+		 * leave it as 1, allowing us to make progress.
+		 *
+		 * We terminate the whole wait queue for two reasons. Firstly,
+		 * we eschew per-waiter timeouts with one applied at the head of
+		 * the wait queue.  This allows everyone to break out faster
+		 * once we've seen the owner / pending waiter not responding for
+		 * the timeout duration from the head.  Secondly, it avoids
+		 * complicated synchronization, because when not leaving in FIFO
+		 * order, prev's next pointer needs to be fixed up etc.
+		 */
+		if (!try_cmpxchg_tail(lock, tail, 0)) {
+			next = smp_cond_load_relaxed(&node->next, VAL);
+			WRITE_ONCE(next->locked, RES_TIMEOUT_VAL);
+		}
+		lockevent_inc(rqspinlock_lock_timeout);
+		goto release;
+	}
 
 	/*
 	 * claim the lock:
@@ -399,6 +448,6 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 * release the node
 	 */
 	__this_cpu_dec(rqnodes[0].mcs.count);
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(resilient_queued_spin_lock_slowpath);
diff --git a/kernel/bpf/rqspinlock.h b/kernel/bpf/rqspinlock.h
new file mode 100644
index 000000000000..5d8cb1b1aab4
--- /dev/null
+++ b/kernel/bpf/rqspinlock.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Resilient Queued Spin Lock defines
+ *
+ * (C) Copyright 2024-2025 Meta Platforms, Inc. and affiliates.
+ *
+ * Authors: Kumar Kartikeya Dwivedi <memxor@gmail.com>
+ */
+#ifndef __LINUX_RQSPINLOCK_H
+#define __LINUX_RQSPINLOCK_H
+
+#include "../locking/qspinlock.h"
+
+/*
+ * try_cmpxchg_tail - Return result of cmpxchg of tail word with a new value
+ * @lock: Pointer to queued spinlock structure
+ * @tail: The tail to compare against
+ * @new_tail: The new queue tail code word
+ * Return: Bool to indicate whether the cmpxchg operation succeeded
+ *
+ * This is used by the head of the wait queue to clean up the queue.
+ * Provides relaxed ordering, since observers only rely on initialized
+ * state of the node which was made visible through the xchg_tail operation,
+ * i.e. through the smp_wmb preceding xchg_tail.
+ *
+ * We avoid using 16-bit cmpxchg, which is not available on all architectures.
+ */
+static __always_inline bool try_cmpxchg_tail(struct qspinlock *lock, u32 tail, u32 new_tail)
+{
+	u32 old, new;
+
+	old = atomic_read(&lock->val);
+	do {
+		/*
+		 * Is the tail part we compare to already stale? Fail.
+		 */
+		if ((old & _Q_TAIL_MASK) != tail)
+			return false;
+		/*
+		 * Encode latest locked/pending state for new tail.
+		 */
+		new = (old & _Q_LOCKED_PENDING_MASK) | new_tail;
+	} while (!atomic_try_cmpxchg_relaxed(&lock->val, &old, new));
+
+	return true;
+}
+
+#endif /* __LINUX_RQSPINLOCK_H */
-- 
2.47.1


