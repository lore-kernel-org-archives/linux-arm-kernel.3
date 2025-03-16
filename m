Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C817EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZSlxIaXESbScuJYNNT7oHLcn/yU5dVEPTh1HXSGjKY=; b=hipk3bKMAvcDORmGg51VLx4SSF
	BLQcF7uBKCB2wq8PD9jmvSRmi5bYE9FfdE3pYJ+4A/mDao+ZgQbfRJUcezvLEPKHqjVnoANKsO2VL
	cL6O1RBTSoCIyZUFHzO8gyyWwMED8YmoPbZRhm0/7BBHo/+SpYDSLKYbXnfWpK4FJGxhSeJWW2gaO
	Ksgkzb6ZHGiO7i4Ha7rmtWUpNj93o3M4CPwbcmx4qOXFr64t81sjDot6zo1fLh7wiNo7JYcAOAj78
	94deQc3is3loWDiEPdWVP3yuzdo2fR0GcE/hzTn/Yi/7Kswag3CUJj5GXxy8xJP+NaMzNDrEiLfjo
	d62PLtlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfWT-0000000HEoS-0aOM;
	Sun, 16 Mar 2025 04:22:49 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfG8-0000000HCF4-1tCB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:05:58 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-39149bccb69so3174232f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097955; x=1742702755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZSlxIaXESbScuJYNNT7oHLcn/yU5dVEPTh1HXSGjKY=;
        b=BEdQjyayBBPFNvNZmM5EE+9d5j5Sk3+ZXqY0EdNPHSlFXjirv5rPojKjEW6PFix5ub
         iUcj12djxCL3Eybm9kehRoan5SiKBLxsIUoi5xCSJFuybsjRb2W0fvYk0eynDo9WB12q
         +2BozOGkEjM4UxgLpvhIRg9TZ+sCmJMN3K+Bi+WhFa+8J3xa8Wn9FsEwHofO3YU8pqaM
         hpJxUrGucKSJks6SsJGNUL7j5edMMSIDMCvL/Tsg3S2PBHiw84aSwJmDv8lzeqBZCrL8
         KgGBlhitU67bICX9s+1NYBBONgfXVRzCOCjxwYubjdKNR1IqnD8nyJ/0RIcLGc4lA+ur
         Sj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097955; x=1742702755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZSlxIaXESbScuJYNNT7oHLcn/yU5dVEPTh1HXSGjKY=;
        b=PdmlmDxNpIC0DalvXiDysWChCdUShFE+wpZDclDxuuMdbQ+zXyLeFi9gYlQqrgNL+L
         oYLfUXRpK9JHlaU1HzXspZ4g0HPMOP1LRZRTknmZE2VpfucrlM/GIRanQnr2yFUYfd7q
         rZrK3ioGgeVme4lnffjXKq5PVAyaAq2jmdC6pMbW5ItTHPaqKuzRYplvHP6v70nQYkB3
         tsaIV14C3w86X4lhRQtoJ41pqxAcZOg9r6ODK0/vmPx1pRpoez3RmwuQMn63R1Uwh69u
         i8zW4e/ibnDzRhpljMcup12O2fZp5zEKraekrUcdluGYps4tweZHkvI0Aq7w8KRGkUE5
         an4g==
X-Forwarded-Encrypted: i=1; AJvYcCW6D1OK0F7+UuTytJ+hTIXQmRdJT+blOy34jzUTc/hnfqo81Vjadwnql7wy3mf67Z96MK6txa7aDJ+SheiqKXhn@lists.infradead.org
X-Gm-Message-State: AOJu0YwWxkjiMjYmZaKjrjxqM/dagCgckqlNnUfRg3l+YwppNjwZwXZc
	I6pFRScBUVOqemYvExRb3opefDwMD0DxT27oBMQzfF4+oJ5KTfT1
X-Gm-Gg: ASbGncsAr4H2PJeh93RcPeuuGFznloKYc/83Gnkew+0QMFrI/5zRRQN2um3Q2oibrQW
	4ixWELyxAQT13xLDEfD11vAsVnoAY8aTgCaGhExEyq6qaL7mW9/acSlB+mahCy0q+nrPElnJg7U
	FiywFIs4t0FLzBtRozf3YMiTMdSG1Lpb+/hFbAtCYVy7CR0hVCUVTglGVhThIPfml3BTXocHlIQ
	sYLryHYG0GYr8nkA9FFYpqL5rVib0SNCaayzzm/YflAzSW1KsXkHfFeJpII0qYzwR8z2LLAMano
	WS4wnRi25HHiR6cbDSN4cAPYaKrosl1bsjk=
X-Google-Smtp-Source: AGHT+IGXqKHvuoBJmJkfw5Qx4e5pyHmiy2Na/MLB4Z1m2JlcO42ipiA1BkRJPFk9pYLAuBnL9gK5Ng==
X-Received: by 2002:a5d:588b:0:b0:391:1213:9475 with SMTP id ffacd0b85a97d-3971d8021e7mr8853463f8f.24.1742097954718;
        Sat, 15 Mar 2025 21:05:54 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:44::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a5esm10682902f8f.27.2025.03.15.21.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:05:53 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 09/25] rqspinlock: Protect pending bit owners from stalls
Date: Sat, 15 Mar 2025 21:05:25 -0700
Message-ID: <20250316040541.108729-10-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5013; h=from:subject; bh=akh5yhXfrEG7tkbyObFzFj7wBccI2uw5HAmi9Ua2XD8=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3c4jSnmA5ONpoVoAIOIOlsxwJqGlCaF71ZqrDS 9f300ICJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3AAKCRBM4MiGSL8Ryj+AD/ 9QOKlJQsL0hfRsxlnp+LcUhoinUUhuf5PSUgCRTOdkG5asYnxKe4RE+k6QEZqq50n7HbKHjFsdfrSv 5px/fRWV280XEsplziWpBm3nu9/uGIn06D/6DArjzNdiOULmNoKhIVTCdpvva8L3HI7GSTxZani9n6 MMd1j6C8TM9+oKJsg31rq03joUCbrTzttht7zSk0WcHYwGmbbQNFYepfby2aIG6QR4whRiRfFigmjD 1nOdu68WNCp+zFeB5UwD1SKNXHXAiI47mTVfHATyZW2gO+qoVjxj0jcjEQISr2U7ilsZqhtUV4qu79 0rmI1TdWYDffcf35yEPkekzca8OUaen5puFYbpAn2C5IQghtsvhiDeLpI+qrW+Dh9VrVLfJeZb4PA/ CmKe2nkK73+vP66V/atyI3Nop6a65yKO4dVVKbSm3r6dXZdycqN3CO6uWPWXasVJOnEwagR0GKKcHV 5lNkIep13oO1YQkgmpMqkC4RCf6IhbIwCFAm6j9Mt+0TJyAB8WHcAIwetF6IDcyMBK5R+DiMlKafao b9h8GkivtSiN4L7TcMtqek4PinmZ+hoaj24dkKmwfoF1g7gqEI1D1SHHR9nGA/BtBKsGojUhnVbY1O sUkCihUbg8MADno6l9S45vaZux7YwSBu0+kqCFmosGJEUxcqTgLWNTqfWjaA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210556_496448_E7852F21 
X-CRM114-Status: GOOD (  20.36  )
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
 kernel/bpf/rqspinlock.c           | 32 ++++++++++++++++++++++++++-----
 kernel/locking/lock_events_list.h |  5 +++++
 3 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index 5dd4dd8aee69..9bd11cb7acd6 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -15,7 +15,7 @@
 struct qspinlock;
 typedef struct qspinlock rqspinlock_t;
 
-extern void resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val);
+extern int resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val);
 
 /*
  * Default timeout for waiting loops is 0.25 seconds
diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index d429b923b58f..262294cfd36f 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -138,6 +138,10 @@ static DEFINE_PER_CPU_ALIGNED(struct qnode, rqnodes[_Q_MAX_NODES]);
  * @lock: Pointer to queued spinlock structure
  * @val: Current value of the queued spinlock 32-bit word
  *
+ * Return:
+ * * 0		- Lock was acquired successfully.
+ * * -ETIMEDOUT - Lock acquisition failed because of timeout.
+ *
  * (queue tail, pending bit, lock value)
  *
  *              fast     :    slow                                  :    unlock
@@ -154,12 +158,12 @@ static DEFINE_PER_CPU_ALIGNED(struct qnode, rqnodes[_Q_MAX_NODES]);
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
 
@@ -217,8 +221,25 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
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
@@ -227,7 +248,7 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 */
 	clear_pending_set_locked(lock);
 	lockevent_inc(lock_pending);
-	return;
+	return 0;
 
 	/*
 	 * End of pending bit optimistic spinning and beginning of MCS
@@ -378,5 +399,6 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 * release the node
 	 */
 	__this_cpu_dec(rqnodes[0].mcs.count);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(resilient_queued_spin_lock_slowpath);
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
-- 
2.47.1


