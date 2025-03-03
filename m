Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAE4C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSHeNmV46kRt/dp4H0+hnJsEV9KJXQ8UwiwQeMlZ2+c=; b=Zxz74QIyMdnf59lOTMj8c5V3KP
	zaC6Lmel4OS69zCey6SCnWV9grhdtCQwdR/XGgu0jjoMDVjrTRZEW0bzUFBlTvqPsoKAVxHUjsTxn
	ep4I5IoLOj4OL8+B2TyolWOJpCfMFKPDm+7S+1DH+A7Bq5tLYgqs8ll6Cxp32MZYrkVZBGI71wEBW
	cmoX8S8SGd9jF7YCy4GcFMRF/cECBEpH56DmelOKnSWI4yqXmlMETyzWJfXaNFDooHzGQOnRY64cA
	hPe8grpzPN0AzNZDwSshGceIeLfBoa251O+qzhWFMxu+ojmHmV0om69Cxq/c9MkdKal5eydPgAY9P
	1Slmnrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7t1-00000001M6H-0XLX;
	Mon, 03 Mar 2025 15:39:19 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7db-00000001IDh-176l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-390df0138beso2442171f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015402; x=1741620202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSHeNmV46kRt/dp4H0+hnJsEV9KJXQ8UwiwQeMlZ2+c=;
        b=aPvXjnW/c3TMk49yrhiwJB/+7gKaJrIXU5oBwVfm8cJKWgQBBwDYQS3M9D8ADs4CFX
         4ARm5hFFWy/ztrmLqvltXgEDlmFeO7XbZn/Qk5h+uTrVtRWiIMJJpcu9JR8pwtD+8rMg
         /C9nFtMGxf+swxBX08qw1Ui+Y4TLgDamKa85wH+v7C3USjhmWMm3gEdNF+yVupSJkvLt
         KmspVZadKQwmh5LntnFGyG/pUGu0DnQr5DhVserOySsxrstZ12JFy0QTfJcFL2PYjyc1
         0+Yd6tXinHA69ICk1f9Z3Aq/8DQR3q2U8f+pbPgSJM1yoBW64tq4SfbyRxFET6Id/87b
         M24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015402; x=1741620202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSHeNmV46kRt/dp4H0+hnJsEV9KJXQ8UwiwQeMlZ2+c=;
        b=qqOgkdd2349nSaMBMwtEjO1yxF4yxxd+GQOKPQ2SvUZdi+h4wGh2/xojPZenyKbJiI
         6MVHCBuzC7/GAGjV7ne9Sa7Uj6LIsQMcGMdY1V++C81JjVe+rTP5gQfqj5SH3RJ4jobz
         hLD/rEhePmnuWy0gPc7IAoSdLnTIuSPqlbBvrVrczkT8I8S5YTURb2NPHvG4Q+TVVpzp
         J4A104yP6Akd4t06SKYC/Ik21WZzXDfxU+oracc+f5QjMm2FNBHdjPocU1eLnESpS8ou
         Rba0wCNHp6HWHNsS1dYO08HG753pF9tfHWGkS5IqvENparauLclJ9nOJLLbFPIl1YR+7
         2QfA==
X-Forwarded-Encrypted: i=1; AJvYcCVNJsT3gdWulM6wT40ZlPggHNgtqXyDWdxWPzdLcttdLD8yaAaGW4VRBp84k+twdig433a8oGDEMs5R2EN7k+a3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgzl8mc7tJ4AMKwC9yFPy2cpMgblxPEF4THHs2DLDa4ohArh/a
	J9YXv+6QDIAAmqdKq/qRnTPSFBJ6tbA0YYlA9iYsliMgFGM0/rMI
X-Gm-Gg: ASbGnct/xVPANMCN0QXbUg8Z+522GbhpjwgJBwuHKJ1NZQJ92l3bsQR7RXrM6aMinCx
	2foBQe0UvfcXF7Lb1gxeDrmc4U5QqUBrokYERv9pf35OQ/ynK5MTiZcEYdNRSq7uhZBiH2sZABj
	icSDWRWqCPST+qezOH0mY1dK9kpkZ5udFYVKB5mdQRpYl5XSibFkgtNFXlLOJjj78qhE0p3i4aP
	WdDp1CoBeyCZBmaExVS79+KnXYTp6DRFIB2Q3MUhSE505OEZZmiyiC+RsPGbzWUvJeRCM9W5i8s
	Yk4R2kpSxB1LPzPnr4qLzG0TuQoEidNs1no=
X-Google-Smtp-Source: AGHT+IEnT4A+TUqzNaTrtLXu5OtEH4QH2hmaxPGiGwoQEqitjFfl0aXZCCxloD3CNgY+V4T+aWGquw==
X-Received: by 2002:a05:6000:2c4:b0:390:fbba:e65e with SMTP id ffacd0b85a97d-390fbbb1ce1mr6065042f8f.32.1741015401792;
        Mon, 03 Mar 2025 07:23:21 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:51::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485dcc1sm14484132f8f.87.2025.03.03.07.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:21 -0800 (PST)
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
Subject: [PATCH bpf-next v3 09/25] rqspinlock: Protect pending bit owners from stalls
Date: Mon,  3 Mar 2025 07:22:49 -0800
Message-ID: <20250303152305.3195648-10-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4562; h=from:subject; bh=1XvWGmZCOVeyUxqvFf8Y0s6SXxKLnF+WaHRbErsWH/c=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWW53FYHDbQPTx2MaF10QE+C9S9CqxKdZN1xCD5 5EH85qGJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlgAKCRBM4MiGSL8RygSbD/ 9QtT69Fbx2ynZFLU/vCOAn9155npdoPHm32pPMjxG7qV6+Th71XhvC5I9p08WQrwACm1JzGxkepYjm pDnmwck8jRMUBZWjdXi29dJEj7At072EjdZOXCp/Pzn/DxG1hBXTY/ZH9GJo3q8nxLqI/8mzOGpvR2 b9bpAUy1mnqdSz0AULDNnLik1YTh5mj/YEE1p2drByM6bXTGqqEfUlBQDrhOqf8KdBxa4dxNRcWKlB 0tNMmc0lPHuNsFGhIa98RSTjnkXRl2GzOutIcnXs93hpXKn8yL6/Un1t4hb0mHzlLTyxwVwY/g2PPn 0AA/IDGt1/cVQydezHH65YVA5Teh+546Vhq2IbW4nmbmef5EAMQ84COS1A81yPDyV5q0JTKBMjPvx1 p9XYSN4yy8hzTmwMquOoMa64dIFJQHMW0aXviAnk5fYkdWxSk5Gv34nqs96z8x2Eo7/RrZBWNCXpxA iRgBViTStzOx2G/rqo/jRde/IWmULIVwPeiAlMApDAYkehjUopupyV601mAfuY2y35Aiv6QNqYtJWc T6+pG9F4lzVDFo4lc2g8miE5ZrRBaoNA8GI9PRcWFMSNQAd8K0mEFPFYcYwWm/d8UaoZIqpQnY8Z2P uxJ+hkyt/kL3Vl61gkgHMJVOdMx+RocUAFG+5xXN2fv9S6IKl87+y7Q5xRlQ==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072323_326242_C39FE62E 
X-CRM114-Status: GOOD (  19.47  )
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

The pending bit is used to avoid queueing in case the lock is
uncontended, and has demonstrated benefits for the 2 contender scenario,
esp. on x86. In case the pending bit is acquired and we wait for the
locked bit to disappear, we may get stuck due to the lock owner not
making progress. Hence, this waiting loop must be protected with a
timeout check.

To perform a graceful recovery once we decide to abort our lock
acquisition attempt in this case, we must unset the pending bit since we
own it. All waiters undoing their changes and exiting gracefully allows
the lock word to be restored to the unlocked state once all participants
(owner, waiters) have been recovered, and the lock remains usable.
Hence, set the pending bit back to zero before returning to the caller.

Introduce a lockevent (rqspinlock_lock_timeout) to capture timeout
event statistics.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h  |  2 +-
 kernel/locking/lock_events_list.h |  5 +++++
 kernel/locking/rqspinlock.c       | 28 +++++++++++++++++++++++-----
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index 96cea871fdd2..d23793d8e64d 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -15,7 +15,7 @@
 struct qspinlock;
 typedef struct qspinlock rqspinlock_t;
 
-extern void resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val);
+extern int resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val);
 
 /*
  * Default timeout for waiting loops is 0.25 seconds
diff --git a/kernel/locking/lock_events_list.h b/kernel/locking/lock_events_list.h
index 97fb6f3f840a..c5286249994d 100644
--- a/kernel/locking/lock_events_list.h
+++ b/kernel/locking/lock_events_list.h
@@ -49,6 +49,11 @@ LOCK_EVENT(lock_use_node4)	/* # of locking ops that use 4th percpu node */
 LOCK_EVENT(lock_no_node)	/* # of locking ops w/o using percpu node    */
 #endif /* CONFIG_QUEUED_SPINLOCKS */
 
+/*
+ * Locking events for Resilient Queued Spin Lock
+ */
+LOCK_EVENT(rqspinlock_lock_timeout)	/* # of locking ops that timeout	*/
+
 /*
  * Locking events for rwsem
  */
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index efa937ea80d9..6be36798ded9 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -154,12 +154,12 @@ static DEFINE_PER_CPU_ALIGNED(struct qnode, rqnodes[_Q_MAX_NODES]);
  * contended             :    (*,x,y) +--> (*,0,0) ---> (*,0,1) -'  :
  *   queue               :         ^--'                             :
  */
-void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
+int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 {
 	struct mcs_spinlock *prev, *next, *node;
 	struct rqspinlock_timeout ts;
+	int idx, ret = 0;
 	u32 old, tail;
-	int idx;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
 
@@ -217,8 +217,25 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 * clear_pending_set_locked() implementations imply full
 	 * barriers.
 	 */
-	if (val & _Q_LOCKED_MASK)
-		smp_cond_load_acquire(&lock->locked, !VAL);
+	if (val & _Q_LOCKED_MASK) {
+		RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT);
+		res_smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret));
+	}
+
+	if (ret) {
+		/*
+		 * We waited for the locked bit to go back to 0, as the pending
+		 * waiter, but timed out. We need to clear the pending bit since
+		 * we own it. Once a stuck owner has been recovered, the lock
+		 * must be restored to a valid state, hence removing the pending
+		 * bit is necessary.
+		 *
+		 * *,1,* -> *,0,*
+		 */
+		clear_pending(lock);
+		lockevent_inc(rqspinlock_lock_timeout);
+		return ret;
+	}
 
 	/*
 	 * take ownership and clear the pending bit.
@@ -227,7 +244,7 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 */
 	clear_pending_set_locked(lock);
 	lockevent_inc(lock_pending);
-	return;
+	return 0;
 
 	/*
 	 * End of pending bit optimistic spinning and beginning of MCS
@@ -378,5 +395,6 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 * release the node
 	 */
 	__this_cpu_dec(rqnodes[0].mcs.count);
+	return 0;
 }
 EXPORT_SYMBOL(resilient_queued_spin_lock_slowpath);
-- 
2.43.5


