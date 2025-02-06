Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8F8C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FML/jIvPcAoxlA62EsuMUSBptbx5cKUmte0tA2musTk=; b=UAjN0n06ya2kzLcUY+4j1duIhF
	ckTMhKBH4Ypxl8hS29/fSVhVdXiuaQ+HY4xyjwceFNFJN5iRGiT6MpG2oxg2+r3futvOxsCiXXJ/1
	aKMw3d56n5mWxR0ihQFgvAD68tn/olAYHK1jQu70Of6fvZu2KjRxTblPVRZenRV6l/CCHvITapgvL
	k5aGwhJP9bg3jHlgYwo9R0FkPzaDlNpDPkBdtVK4KRNwf9niJOU8JBva4VeQQYyPM0thVCg1nIDus
	zMEJLjVVnRgNZ9jIQLcFk1V3lMQ0Y1lYV7QB/Sm9rZiXCGTZN3zZ+E5SOq8qWUnBvZrbjIkDwynIk
	zBzupOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzdZ-000000063CO-3htq;
	Thu, 06 Feb 2025 11:01:37 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzWw-000000061X8-31xA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:47 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-4361815b96cso4768485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839285; x=1739444085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FML/jIvPcAoxlA62EsuMUSBptbx5cKUmte0tA2musTk=;
        b=IfXOL+scrpPlc17T5rkNuolnRDHusHmgg1DHuIQHiODxRxM70xDjxPbzVSnirIKxTv
         fnX3BpAGYnTftzoQtg5Eis1UOdoTtM4FjXsT5rzK912t8VT/H9do4j103hcBDVBN/nH2
         5pqkOLtfceJbNnT9thzwjR5d9vYtP5ld6OLhXSotIkenaKAUj0nfPP45II8F+tgILgIX
         U9COpBfn+bcdX7HftCtvq2bguI5XJ1amioqvwsbOpljz+1tot7LkSX/CPFcLSWVfvlQr
         Uwf5momH6fqbkUb/Uo6WzJ2sIJJGF861+Y2VdQnzKoqz9AVPc94W3CuF44bx+OLX/i/a
         nnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839285; x=1739444085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FML/jIvPcAoxlA62EsuMUSBptbx5cKUmte0tA2musTk=;
        b=nWrQjCPsM+okIQuRH7yLueMwzw1EUj2TTXIv05Iu9EeC7cYmpW7BvtT+Yx6l6CDLST
         SqqL/jPXm4Zv8fIxs+HEqBLp7dg14wFCn8roC1Vt1OTy5wj8EeF5UwZn7B2E40vZ4aXT
         eiyejM4jOytjTuL0wzc85cl9AQb+ig2v1WdWkZs2mOW7rUPeJ5c7r5B3KOQc5+fvsVsC
         sm8fbB75FmylNByIxhFYMB5Nv6cGK0YhVsua0884uP0gVedY8A0vMpN1NgL8tTwqcxo0
         TiTsyyF9PGDV6syg1jWTkK2IDhlBjquMudP4W3JbGgIJFVv6I3jm1iKjyh+UW4WarAac
         SqFA==
X-Forwarded-Encrypted: i=1; AJvYcCUex0eSyVDKJwNGXZ9tcYh+NTKlRcJgNxZK4L9syKC4q9OdV3qSL6ECP0GlUl+tzHm3dVZKHPU7xtp18I8uHmdP@lists.infradead.org
X-Gm-Message-State: AOJu0YwOZd3E/pokFLlPWji//uBBDsQF2lvBGauM4E3zkPx8KhuI+p3v
	wovQkJ+6vL8JpZVML1QvDr27ey0KOi1OTLVQ1qXYEsY/aLEnXEPa
X-Gm-Gg: ASbGncvJtRjIxOORm/G73kgtZLjVvEIKs+ZxQsFvmffkSnrVKoYdtQTrTG6pPHHEj3P
	SI8mUyaaeEIX8LDF94Hq4lrUT0K8Kz0xAH5wvBLLE3Pc8KdmCxRL1pZefXLNth3o7gF8EFUsbYK
	VmYIDtZaQfMmgxEASeCQ9RL6hBb3JoWTM0XnDzkvlbjEx7o2EyStMhxNBIfjAKRdawOktWXnRfK
	14tRqY2D2If8l5vfbykcnMXsujBMGwppijElR8uudAxkMNl+BUHz7H9kMvXQeToK8RoRjH9Kpk1
	zIQeWQ==
X-Google-Smtp-Source: AGHT+IEOmTjECXHJOHu9cs/SJ+6ticeS7+QaeLa0eVa8SFVT2qBWkqUoeVUR/OVwzkrcdhv+Xm5HzQ==
X-Received: by 2002:a05:600c:1c90:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-4390d56e3admr51732625e9.29.1738839284871;
        Thu, 06 Feb 2025 02:54:44 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:17::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f6741esm44971815e9.3.2025.02.06.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:44 -0800 (PST)
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
Subject: [PATCH bpf-next v2 06/26] rqspinlock: Drop PV and virtualization support
Date: Thu,  6 Feb 2025 02:54:14 -0800
Message-ID: <20250206105435.2159977-7-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6325; h=from:subject; bh=r7k8qGdKN/3/qwxHoOfh+ZQmucFzyerAvWUxzRBa3Nw=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRkILe/Rfrs9nCkS/jAFdrxKRcYv7G3/iAaCR9O 5XUAiaGJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZAAKCRBM4MiGSL8Ryt6cD/ 9T4mqw3kZqs2TP+tHKQuzgqUq8fvSH8yl7t36bQGme497vOAOYDUHMeNE4NNyj7xPtcdwP+75JT6jQ wb7DTCpWkXZuXyGsVYOqkRCTrIpl86UhY4KJl7kpw0Fu/l4dVh2eGgHzXhYTOAo3UfEW3sblt0q+J+ HtBSelQEJJ2OiEIXdozIXjKe1DouxA6jfr9ixQF5KRP3O4K0H2jeTFQw6ruH2RXH0V+42ZwyL/q4Sb j0fby9n8kP9ZDxMNUNWPVhnFWuMwb3b9rwsQZME31GLbIEi/IEz54iXXAjlwVeS8CtY3ZuiDqfn4LC 8vkJ/5biap6lg9ReRc9H8WCmVZuC1O18jeYfRVCk9BRgjFDmynobDC5PWqUEaxs/4weWUTipElhtHA 7rTqLuMsOilmIdBqGSY9cpHXiMj/9tfMraqZKztusV0dkACiFyAXpSgpqErFXM4z8J7b6tx0wu+gza wtTNXet8pwRgRUHVnbyGX81YgMCL5AQXwiOot10sXBM00IBvoKOrdjO2422YWhUOHy6sF6R5id4V9D gM4HflpQhz5PAIg3z56BGX8bWfOlfbWkA6/HEA5p+yyTD21iW/w4wyZuPUEWaHIhxlVrp81m7Ajv+d 8KZJHw5wvIc5BbaAV1NGrm4shlGp+OwQG7OPQO17A7Vq6h8oz8Q8NJUJBu4w==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025446_767540_4DCCCA3E 
X-CRM114-Status: GOOD (  18.53  )
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

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/rqspinlock.c | 89 -------------------------------------
 1 file changed, 89 deletions(-)

diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 18eb9ef3e908..52db60cd9691 100644
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
@@ -75,38 +73,9 @@
  * contexts: task, softirq, hardirq, nmi.
  *
  * Exactly fits one 64-byte cacheline on a 64-bit architecture.
- *
- * PV doubles the storage and uses the second cacheline for PV state.
  */
 static DEFINE_PER_CPU_ALIGNED(struct qnode, qnodes[_Q_MAX_NODES]);
 
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
 	node = this_cpu_ptr(&qnodes[0].mcs);
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
 	__this_cpu_dec(qnodes[0].mcs.count);
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


