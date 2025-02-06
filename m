Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0D8C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYidbmwxCEV+eSEjHIGui462v/Vxn8uyk3zJ0J48/Wg=; b=UzGXmcEnvLMB/AxG4qoFFoNhf6
	EcNoXRlCFBkaz+F+MxBPSlOyRhdbndyYBzXxLrkTqdDVK501zHQHoECPMn1J7CaT11cCvk3fIDMUH
	RknAiZWtj4kRpGTJz8JPPD4x/8YGLXej3zbluVetLHS8+TK6ccxyszsz5V17OIiAdC7BPatxrlUZe
	A+Thqn8rqjFVgPVXqOrvKwZU0SB9F6+byL6UJHCfR73l0Yu5DdcV2J12ItLrMBXzetMmlbflRuf8P
	T7RJm+1C63zSkHX23yR+MgqIR6G/hqV9m0dXQmyxqsdR5iPXZAUA3MPxZKqvR6zSATq2smIFYurP0
	v7OIo5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzix-000000064Fr-2J5y;
	Thu, 06 Feb 2025 11:07:11 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzX0-000000061Yy-35dP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:52 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso4042505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839289; x=1739444089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYidbmwxCEV+eSEjHIGui462v/Vxn8uyk3zJ0J48/Wg=;
        b=CF1d5ORV1Dt5Pe2jbTlfoXsNh7y00KUkrF6KTb7PFmgKYtmmB1+U4njFIKkk4vr9v5
         O8JEIgB/prOzJ3Ua5PnU4ionXUBg6nwLc0aRCvMrKrGlAzQcsQ1K1ojh4N4c/0b/g2P2
         nsO9qU45GMILoM1WGhhhcOVe6BTsl8+k6sBx94k1TNwqPIh5gXdryj5ilefwI1OBqzx4
         1+q1zl4t33jUFlOuiR4JSClnjjLw8GuvUgwjW1XLTW0KYgSR/hpEETjjrtN+kxnOwVmX
         bBVi1HboochR+kDi88UO0WMgQbAn9sHVPFXxTaAHhEay7CG01OUOmNph/jboN6X7Z13y
         wLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839289; x=1739444089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYidbmwxCEV+eSEjHIGui462v/Vxn8uyk3zJ0J48/Wg=;
        b=PvoLdwcwMBU5Pykc/GtuajLuH3yFMz/TsTxdQGy5scypfvuY0yvuE12i7YpuAmxwjX
         XiaiHVHsS8QYyioU2+84YWbUwaKoP/T9aun8C1N3f/ysrtcU8Go/uZXU3tjKTd+N6zJU
         fvyufFuOwAAsxrQShqfW3eRVmgbOcO5YWFxCYlrqxwQEyhpyubtKcJ6rUromgFgg7wbj
         RDyBRc5uGPemSWlFDHg1HV8D+6JMg7doYXP4Y9xpE1MbS7dB8+8LmVZycSVAAMcRPJb2
         qgImJaNHzslKjfYNdGY3A56zgSas9DARoLNFJKwhZjvS21kGJsPVHSFX31jYeFUHwrRY
         XgQA==
X-Forwarded-Encrypted: i=1; AJvYcCW9fd7htT1430bAP3Km230YAMDl5KDg5hGuer/cKZ0yj0m5xAX4Ug4hTY/8cVsdthFKFAQt9etjpeaZXeTJbOMv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6dRLIcrToJD/meAFkPSPqjMBCZ9BB11ZxuIae6zKHbIjsFS0r
	6McG8iMMBlFMocdrNSN/44/Oo+yO8SVMFmpzrqr1t+LC3q6Pup9b
X-Gm-Gg: ASbGnctJVkBx3CLemDaH1rKyr6arf7TCD8YzNsbQvtAjCZHA/7c9G2nEGReV2Vd/9XI
	ydUrmA0SOs5at1IhFJTV07JbzoUpmnjBjeURBp+rexNRAzZIF7WIPUm5VgGymXo65RH6aSWld1l
	f0bUxDdnHi0k7MVUYg5xMzqbp0mVRJ7MKv8xWhh7ULoX06gVupVdbHuekR8FwEy5eE0H2uNZ5Oj
	XvymXvUJyfQ+Rg0hhIz6N9mrsD/XxNYZsdaRh456C1JKApS2WXl1lCPplRbcqpt/83KgisOJRss
	09fLZg==
X-Google-Smtp-Source: AGHT+IFphip47QJW2PrpFsbKi02KtCDzlFv4DF2sCZj2+AejG4aG7KuSt5Jt87tvagiOv6cvGdW9aA==
X-Received: by 2002:a05:600c:a47:b0:436:e3ea:64dd with SMTP id 5b1f17b1804b1-43912d3ef4bmr20857325e9.11.1738839289015;
        Thu, 06 Feb 2025 02:54:49 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:70::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd4df6bsm1429709f8f.39.2025.02.06.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:48 -0800 (PST)
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
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 09/26] rqspinlock: Protect waiters in queue from stalls
Date: Thu,  6 Feb 2025 02:54:17 -0800
Message-ID: <20250206105435.2159977-10-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7029; h=from:subject; bh=Xa/jCeO/bNAS2DABSLS2XeyE6NH1yv2QeubXVXtSfFg=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRl7An7/KiEUm98Ur9vnCib0zAC2FnG3ihYCJKd QcDong6JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZQAKCRBM4MiGSL8RyrulD/ 0QF/IO1vH6JRLlfF5fdCoL2J3bq6TUizWVQKnJM58Ak3TLWy8SAYpkkznDpIqhFohSNctWXqvIZ+9p 16sVoQkzVrUVZ7oFbcrGdJRcSkqMQc1LJCTJG+1+S0O458BwdjYHBxyoigb2bJxJ1AqoTakaX6rOFp q41csSMJragiD4b837bqZkq6Kcnt5NFp7XO/6Ca4/ZgmqpXuFA/o2zmajpZUM8v+bjVz/X16xlcuV6 SBxSHt0aPLBsnLU1BoCQrQWdpFpl1mJe+oslsG53qb/RfuoKcTBhetjeceQB8Hit/6sBcswtT44WAR Cx69D/8D2KZO/Q4Lrg08OxeuZadzrtnc6jOHnXI5DGab+HO17FzujG+flkF5KdBYru82bFLsWr3W9W P6WH1ACcX5G6Ivg/ah/wpe8/6GW6+02j3XKd5r0tgiGp4JDq0CnMOs8Sfe+LmDPiEuo+1zg/17KnwP G2OnXHvHPsyjcj5T2kVQOok60uFZk2WMFKXgMR23OcgQ/3g4sugfLA3JBDlw+xL1XfUSYgGPaGyi7o YNfJ07vRVHBXylG06/Y/GytWzKZoeQxLMeb8CkChWXxgnS28C3OZY3G1thv2fdFQ1sG/nUDTHZxqbj n/6RKyGflImPIdWq7jQWqYNDTxpBkJyANG+96Y+NtplOkmtZPIZtX2ePJ0yQ==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025450_782185_5240D49E 
X-CRM114-Status: GOOD (  36.35  )
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

Lastly, all of these waiters release the rqnode and return to the
caller. This patch underscores the point that rqspinlock's timeout does
not apply to each waiter individually, and cannot be relied upon as an
upper bound. It is possible for the rqspinlock waiters to return early
from a failed lock acquisition attempt as soon as stalls are detected.

The head waiter cannot directly WRITE_ONCE the tail to zero, as it may
race with a concurrent xchg and a non-head waiter linking its MCS node
to the head's MCS node through 'prev->next' assignment.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/rqspinlock.c | 42 +++++++++++++++++++++++++++++---
 kernel/locking/rqspinlock.h | 48 +++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+), 3 deletions(-)
 create mode 100644 kernel/locking/rqspinlock.h

diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 8e512feb37ce..fdc20157d0c9 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -77,6 +77,8 @@ struct rqspinlock_timeout {
 	u16 spin;
 };
 
+#define RES_TIMEOUT_VAL	2
+
 static noinline int check_timeout(struct rqspinlock_timeout *ts)
 {
 	u64 time = ktime_get_mono_fast_ns();
@@ -305,12 +307,18 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 	 * head of the waitqueue.
 	 */
 	if (old & _Q_TAIL_MASK) {
+		int val;
+
 		prev = decode_tail(old, qnodes);
 
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
@@ -334,7 +342,35 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 	 * sequentiality; this is because the set_locked() function below
 	 * does not imply a full barrier.
 	 */
-	val = atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK));
+	RES_RESET_TIMEOUT(ts);
+	val = atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK) ||
+				       RES_CHECK_TIMEOUT(ts, ret));
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
@@ -379,6 +415,6 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 	 * release the node
 	 */
 	__this_cpu_dec(qnodes[0].mcs.count);
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(resilient_queued_spin_lock_slowpath);
diff --git a/kernel/locking/rqspinlock.h b/kernel/locking/rqspinlock.h
new file mode 100644
index 000000000000..3cec3a0f2d7e
--- /dev/null
+++ b/kernel/locking/rqspinlock.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Resilient Queued Spin Lock defines
+ *
+ * (C) Copyright 2024 Meta Platforms, Inc. and affiliates.
+ *
+ * Authors: Kumar Kartikeya Dwivedi <memxor@gmail.com>
+ */
+#ifndef __LINUX_RQSPINLOCK_H
+#define __LINUX_RQSPINLOCK_H
+
+#include "qspinlock.h"
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
2.43.5


