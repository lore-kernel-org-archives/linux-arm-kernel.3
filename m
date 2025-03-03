Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA0EC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWj7fRL2wjv9R4mziQW8bTTqGP2D1A3sv3W8wRB2IlU=; b=nRSrk5Sg3ANwn6I2FAb6F7mTmM
	2ESZ3V/9t0uJ9PzDrak+Mro+k3xWS6Tk8vRSCsrM9jHSYIHMxQC5GFS9ThOxuNrVyUYiq5O3UJaK/
	kC4WopE6HqNRIBw1IvHmlDchjogr13jZzebIQX1mUlatYoYUibP3FO/UR3XY2huipdEw6+timCOgF
	t8VZrsyr3I7ECvbzX/Not5xJptpPoYtKKj5uhn4ksK56ED7RUYDZQVxC57xndk3jyBHecy0yidA8y
	JP+gXHkZyNeyTf2g8yyEBYAfl4THF1/QcDZgOEOcgNnZ2zGF+QmXDmDjzegAxMPAPVehbkRZyCklV
	ZokyGMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7rS-00000001Lok-1yM8;
	Mon, 03 Mar 2025 15:37:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dc-00000001IEa-14f4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Mar 2025 15:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VWj7fRL2wjv9R4mziQW8bTTqGP2D1A3sv3W8wRB2IlU=; b=mtvOR/lLTkGp9N60TOrGEYtejh
	1xcWcZ3yIYzqw6r85ES+aL0saiqfRaj8fDvV4G0I3/xX+PfxuEzhd+gfHHqXZ9PqyGmZUP/F7OwrM
	b34fucCS42Td8nYoiHa53sum1eL+gUYvyTl539rx9A5OrYTvSzz34PO0vCpCUvIVSv8kI9Z+u/Lid
	U2kLsl62ZasaLHHdUy9CMxYvRz2rGGSnA6R3vhYGBFg/KpJpTJac1yTuz5bgvyhmsS8pc4gJUqqn+
	wqrH86xXP0mZ/s/I65jrIy8mdShCGsxBzcFCB8AM2H7OicHhqOe1JjfmTaiLBPt2Vlk0usgDJXOQk
	pj6nWRYg==;
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dY-00000004ZyZ-0qVV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-390f69e71c8so1672443f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015398; x=1741620198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWj7fRL2wjv9R4mziQW8bTTqGP2D1A3sv3W8wRB2IlU=;
        b=RLnzOQoa8BCAn06Pi8doRdWLX1ab/JMcJXCTpaOykO0LxHE2iLeVscjddAlDPi1Ipq
         4bNXtYmjqbNnHlOJb+wXDpMM8HJhxtMhuxHHzCBDUORL9YD3GKwDqaYoprX0aH7vXzYi
         xcFUnYjv/XRjMOMQ4mB72MU6ok82saiZhVkGJOi9i/8AsUhPGqxSKAm6oqYK/SK3nXeK
         IK7FldT7KpqQFn8ly9G/QQq56jL9c9nVV4+YErJcMBdiayIkO6NCNv6+xEsX8mYTkFON
         UaRaCqR1C7BjNFJkdjTVgiHE0Ofk6lhCg58Rus0ZA7FmLaw3QaT5Ke19REpDEO+ziMBu
         82pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015398; x=1741620198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWj7fRL2wjv9R4mziQW8bTTqGP2D1A3sv3W8wRB2IlU=;
        b=BpimqRNxcnSjCgTM3h47vZYu8/5OlCoMrGbyrhZhIMxzDgIVraS4x1pLvRN2NfjuPf
         fFAiC+tOCz4btP66gZJOAbtLBP+sb0VftvT+vzd2ZWZmbcwCbFV9zyfZ+5+S+cUeq0t4
         +n5W8uB0xNXbfojjqt2qmUKW0PuNq0XaNFbx98VQB5aAvaZFSs1UMo/3CU2QawyF5HJn
         AuCrs4OR6KL0nG2UDwv9dMyYvPi0LgzLYKI0UQUzZhfSw1nZ+aThAFIEXesRlv75SIv3
         lujlREfskSVr2awnZVwQBQIYHGS71nwevAWYsU7pY4V8HereWRnhYt3G3EG+YZrDZsmH
         R2HA==
X-Forwarded-Encrypted: i=1; AJvYcCXhYkgfbSyt1jFL2qATOLQPais6I9yv5J6qzlLR+sMjIgjShTJHc07PkfMeiYvzkyHUrTYf1Exf41zSMeqR0O+E@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzml+sKfZN8d5B8GFo1ow2OYRILCiRHLg7a72VzY5EKoWyi8NK
	wrIuFS3xNoc+BBBj/mtcTE5dir9DEnyZ/F/DfsMboLWmIs0GcNJx1xopLNvTN9s=
X-Gm-Gg: ASbGncuQCiYXvSiPOocVHD6x1GVgv8PCyFIXfL2kGUo54zkMCJpIWw5XC5woD2N3mxG
	B46LHXdqhUlwdDWOblx3q9PS0eDcCXcmeNsZuHnAyz4tXYlhh6WrnihI4U1Gue4kRAAiZqbshp2
	itVhRFJcWPlI8feEi563JWNogmNUbzmLZzZMANfwRyW9oWfJyM06qMkJN2eZPVoWVnUq+1MAuXC
	8l3e7y3ghR9V823q74eF5jOOn3693Lvk4fy36nbU1fmYxidqZO/j/L2r8kK9PK+s+QZCsh9gDWC
	gLC/tYSp8tw4l8pOo7y0R93QYz+kcT9aWw==
X-Google-Smtp-Source: AGHT+IFjm+ROX4Lt+V90Jn3TMk492UXdruKl3KBdRoIEAwuyla143y7WSrkvsYEZT3Xx7lgzY1sCvw==
X-Received: by 2002:a05:6000:1787:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-390e15da77amr15041952f8f.0.1741015397860;
        Mon, 03 Mar 2025 07:23:17 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f8034sm169770555e9.4.2025.03.03.07.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:17 -0800 (PST)
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
Subject: [PATCH bpf-next v3 06/25] rqspinlock: Drop PV and virtualization support
Date: Mon,  3 Mar 2025 07:22:46 -0800
Message-ID: <20250303152305.3195648-7-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6795; h=from:subject; bh=x1Z+pB9xhs3i58kf9Kac9b92frWP4j0eHxNENfgFcNU=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWWAhlIoArRUBi9+QCUAqMzXrVAKF0JtHZdQgoX fPFJU92JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlgAKCRBM4MiGSL8RygwXEA DAmIu9BajEdITHz1mKPuYwgeMXa7iRtPHxfqCpPmzf/TH+bsToJCV02MBZgALM6kWCm/5rAUSraLhw BnMrlVK/RcAw8Kxjwu1xmv4nZtV3SYbVUGx9WVMII5Oeyew86x2PDffmVG2n1obhHHjW3irYV8YsdE Yp1hHfinMz7/BSq/yV3BC5t/Xnfyeqm/J8YZY2QWNJBC4EKexPFCjmswgCSAaSFCcxhApWXXJzknMU MFRWSRvdZ44k9m+DhbcggcjpFSytSET3RxyTw4yuiGnXVqdQBBg0JBdMGJz/TatR2aEVIb7cJrYFAg j53Yifny9409xdRc2gl46en9AmpDm3/WgCsa0MG4u2UZyRfxyJFucVeD8D37S0ybhHJqnoRd8Idhi7 QmQz4h/wP2rzNMb9gJ5XgohE5pZ2V72I2JHpPuL7p4uQ5QTqHm+xQyirFjDGGmfxNDIuH/1w//0thM DL6ypO4I4NPgIyNpKI0IVWdOcJ4sbxDX2seupxCRksDYYMwlRTYnEPgbMhqobCiAvBuEuRRvINLHkc gdFHigGRIq+ZNPJc74y2xJvhNd4dehMSg8IlVcZDLDmYHHHUCDiHbmlnJLWJ+hw/5iLNlSJtmRadiM JCiKxpddvVm6tqQTMDIdqvcgLcDn7u2gAg21mmdVh/8SvCqLxQsKxzk73jWA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_152320_532843_068BE536 
X-CRM114-Status: GOOD (  19.60  )
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

Changes to rqspinlock in subsequent commits will be algorithmic
modifications, which won't remain in agreement with the implementations
of paravirt spin lock and virt_spin_lock support. These future changes
include measures for terminating waiting loops in slow path after a
certain point. While using a fair lock like qspinlock directly inside
virtual machines leads to suboptimal performance under certain
conditions, we cannot use the existing virtualization support before we
make it resilient as well.  Therefore, drop it for now.

Note that we need to drop qspinlock_stat.h, as it's only relevant in
case of CONFIG_PARAVIRT_SPINLOCKS=y, but we need to keep lock_events.h
in the includes, which was indirectly pulled in before.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/rqspinlock.c | 91 +------------------------------------
 1 file changed, 1 insertion(+), 90 deletions(-)

diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 414a3ec8cf70..98cdcc5f1784 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -11,8 +11,6 @@
  *          Peter Zijlstra <peterz@infradead.org>
  */
 
-#ifndef _GEN_PV_LOCK_SLOWPATH
-
 #include <linux/smp.h>
 #include <linux/bug.h>
 #include <linux/cpumask.h>
@@ -29,7 +27,7 @@
  * Include queued spinlock definitions and statistics code
  */
 #include "qspinlock.h"
-#include "qspinlock_stat.h"
+#include "lock_events.h"
 
 /*
  * The basic principle of a queue-based spinlock can best be understood
@@ -75,38 +73,9 @@
  * contexts: task, softirq, hardirq, nmi.
  *
  * Exactly fits one 64-byte cacheline on a 64-bit architecture.
- *
- * PV doubles the storage and uses the second cacheline for PV state.
  */
 static DEFINE_PER_CPU_ALIGNED(struct qnode, rqnodes[_Q_MAX_NODES]);
 
-/*
- * Generate the native code for resilient_queued_spin_unlock_slowpath(); provide NOPs
- * for all the PV callbacks.
- */
-
-static __always_inline void __pv_init_node(struct mcs_spinlock *node) { }
-static __always_inline void __pv_wait_node(struct mcs_spinlock *node,
-					   struct mcs_spinlock *prev) { }
-static __always_inline void __pv_kick_node(struct qspinlock *lock,
-					   struct mcs_spinlock *node) { }
-static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
-						   struct mcs_spinlock *node)
-						   { return 0; }
-
-#define pv_enabled()		false
-
-#define pv_init_node		__pv_init_node
-#define pv_wait_node		__pv_wait_node
-#define pv_kick_node		__pv_kick_node
-#define pv_wait_head_or_lock	__pv_wait_head_or_lock
-
-#ifdef CONFIG_PARAVIRT_SPINLOCKS
-#define resilient_queued_spin_lock_slowpath	native_resilient_queued_spin_lock_slowpath
-#endif
-
-#endif /* _GEN_PV_LOCK_SLOWPATH */
-
 /**
  * resilient_queued_spin_lock_slowpath - acquire the queued spinlock
  * @lock: Pointer to queued spinlock structure
@@ -136,12 +105,6 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
 
-	if (pv_enabled())
-		goto pv_queue;
-
-	if (virt_spin_lock(lock))
-		return;
-
 	/*
 	 * Wait for in-progress pending->locked hand-overs with a bounded
 	 * number of spins so that we guarantee forward progress.
@@ -212,7 +175,6 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 */
 queue:
 	lockevent_inc(lock_slowpath);
-pv_queue:
 	node = this_cpu_ptr(&rqnodes[0].mcs);
 	idx = node->count++;
 	tail = encode_tail(smp_processor_id(), idx);
@@ -251,7 +213,6 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 
 	node->locked = 0;
 	node->next = NULL;
-	pv_init_node(node);
 
 	/*
 	 * We touched a (possibly) cold cacheline in the per-cpu queue node;
@@ -288,7 +249,6 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 		/* Link @node into the waitqueue. */
 		WRITE_ONCE(prev->next, node);
 
-		pv_wait_node(node, prev);
 		arch_mcs_spin_lock_contended(&node->locked);
 
 		/*
@@ -312,23 +272,9 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 * store-release that clears the locked bit and create lock
 	 * sequentiality; this is because the set_locked() function below
 	 * does not imply a full barrier.
-	 *
-	 * The PV pv_wait_head_or_lock function, if active, will acquire
-	 * the lock and return a non-zero value. So we have to skip the
-	 * atomic_cond_read_acquire() call. As the next PV queue head hasn't
-	 * been designated yet, there is no way for the locked value to become
-	 * _Q_SLOW_VAL. So both the set_locked() and the
-	 * atomic_cmpxchg_relaxed() calls will be safe.
-	 *
-	 * If PV isn't active, 0 will be returned instead.
-	 *
 	 */
-	if ((val = pv_wait_head_or_lock(lock, node)))
-		goto locked;
-
 	val = atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK));
 
-locked:
 	/*
 	 * claim the lock:
 	 *
@@ -341,11 +287,6 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 */
 
 	/*
-	 * In the PV case we might already have _Q_LOCKED_VAL set, because
-	 * of lock stealing; therefore we must also allow:
-	 *
-	 * n,0,1 -> 0,0,1
-	 *
 	 * Note: at this point: (val & _Q_PENDING_MASK) == 0, because of the
 	 *       above wait condition, therefore any concurrent setting of
 	 *       PENDING will make the uncontended transition fail.
@@ -369,7 +310,6 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 		next = smp_cond_load_relaxed(&node->next, (VAL));
 
 	arch_mcs_spin_unlock_contended(&next->locked);
-	pv_kick_node(lock, next);
 
 release:
 	trace_contention_end(lock, 0);
@@ -380,32 +320,3 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	__this_cpu_dec(rqnodes[0].mcs.count);
 }
 EXPORT_SYMBOL(resilient_queued_spin_lock_slowpath);
-
-/*
- * Generate the paravirt code for resilient_queued_spin_unlock_slowpath().
- */
-#if !defined(_GEN_PV_LOCK_SLOWPATH) && defined(CONFIG_PARAVIRT_SPINLOCKS)
-#define _GEN_PV_LOCK_SLOWPATH
-
-#undef  pv_enabled
-#define pv_enabled()	true
-
-#undef pv_init_node
-#undef pv_wait_node
-#undef pv_kick_node
-#undef pv_wait_head_or_lock
-
-#undef  resilient_queued_spin_lock_slowpath
-#define resilient_queued_spin_lock_slowpath	__pv_resilient_queued_spin_lock_slowpath
-
-#include "qspinlock_paravirt.h"
-#include "rqspinlock.c"
-
-bool nopvspin;
-static __init int parse_nopvspin(char *arg)
-{
-	nopvspin = true;
-	return 0;
-}
-early_param("nopvspin", parse_nopvspin);
-#endif
-- 
2.43.5


