Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75B3C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAOeNgcoqL33KiDySFvl0CYTM4qzSmTk0iyHPZgyOXc=; b=Ybz7YH7NXblDUg0j2mrTRQoD5p
	u7Ma7Rve5dskcnTUgEA2+cJ3i13Bv/crCugli9CT1eANek5zHfKJHuRAfjaiG4IoyCskcjGSNZh43
	0LavseIVEM4V2vfldIbrclD14hnWVgT2sufApxqb3QnRKiXV9Ru7iiwdewP53WTlnNlnwgKtG3nud
	sZ6lXjHHR8pTDvutrHOp2Jh3r6gv5czo0mls98lBnr55gM3693NteZxCl2Rf2dMUSzuhKbpKiMlNY
	MhZaGc6BfDsFehEeJ+V6V2d6xwzsSwCTVKp5bNK8pSNn9zPYQoR6gTj/E/yiAVkOX3G7MRShJv5Nb
	oIPKqg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OZ-0000000H6M2-1WJe;
	Fri, 11 Sep 2026 15:42:31 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OE-0000000H66M-2M8p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:13 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6b35cc0a8c3so1000255eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141329; x=1789746129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAOeNgcoqL33KiDySFvl0CYTM4qzSmTk0iyHPZgyOXc=;
        b=uRFk720jsXiC+JqdqltSdRCP/LgHquUoWo5dLrXV0hNyMEuHUf+rjaMl2uOxtnQRxq
         XRXPmu6ovBJ1xuwX2oewrKeD3Sp2ctPQYNlthXZYvilj/ro7zZje2i5oPdtwv6DVycqN
         g0U4K00dbojUBTQClrf7dHTYwt2JndG3jT7nwABEvpAMUqB513Y35fD5Aa+Fbtj1X/C+
         K5Z+PWD3CU5KxRCGQBSqvY1xQQd+f0T3awtv83SLDm1hTRzbnfgFhYjsJRO9dLzQKYOp
         e4JpR6oC6bClTTs+6suL+APdqu/q+i6PAwFMcpFr0lBtgUPQVGtpR17HqbSEOsFZUpm2
         b3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141329; x=1789746129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAOeNgcoqL33KiDySFvl0CYTM4qzSmTk0iyHPZgyOXc=;
        b=Za2Ir7+DbhWP+x4g+gLycS6t2n7OgUBioNW6dHiUtBoMLbqE3vtXpLmdsb3qO4KEyK
         mU38b8/vS3v5rqlTuVtU/IM2yMLvIQn7KnlW3vz1tj8Xbvmarpv6GwA8gkvNaZaSB1jM
         xoIBNDkluU/rPlc5pHh435Y3h0VdueKoF2htgrPbpRC4bscmgoZW21LV0lP9nbAKLYaL
         I6bsG/bllSb6yz6S8ZvWPmecXzD/ZwVfZMQvr8i9AXyMN1o22otjCBLyw87mQi2SNg5W
         mPET9M8o19R9i0+S8WqvTl30RCGjUfoJ5vPyJ+P4qk/ghhL+ZzQFDkG0vN2caPafnvTw
         1oyA==
X-Gm-Message-State: AFuF++mHCzjmMOytGga1XrtsgDu3j1Dt7x4o7bDg9OV2yVbnaRYqDZIv
	TcZiSdeZkGpN/mxjSjPsuSNoOA26vo84NMjbSpu24URToznBuSyIvHK6YMlqgeeJqPE=
X-Gm-Gg: AYBFou35zzD2VQ53SIqR/dyG5cYtv6+YenVnXEJP9ZBsqVe3E47guQL9VujRayM47kD
	RQ3bHBF1UOA4Ytxci7wEZUkhFkme9ebyQ2C6fG2vwa5mjPSZ4B1Hwvfo95J0BySs/RgpT4F4wz/
	NJmRs0yfPoOMFtl5PIjn8up5Z+UHb6v7AOk/RPJkKpPCkluzxOLyxb3HjIXzSg8VSkxosPQCJEn
	uMaO45+DNZBbcbiAFIht7WzaH5roC4EKhxPgD/+pNOqvPmIokofl5xsIIX6Wy/3jBFbNvOHdDCO
	jKu/zzmV2QQ2wzweEoZe6Bsw0ZM0VgHyJnZQ8uWQw38HRAJ7v0WwohR0+VXKv5yspsvB63HOkEO
	THTRI2tr9UvwtIuiKDMmRxxkKzDgxOk5O7OArpnUkntRtEI+gA2XFupJVE9mGc1B3N1w8aGyN4e
	sZmk4f6CyzKUlHghGG9G3K9Dt+rtYBVnXj24eNZ1/mVQ4/2cx7nV2lUy+q4PiIedA6b3Lmnj/jQ
	mdxEeoBcysGbGxo/+YkuPsMfT2U3WqiT1W5zUa/AFs=
X-Received: by 2002:a05:6820:208d:b0:6c0:14e9:1850 with SMTP id 006d021491bc7-6c0bae0b281mr3497013eaf.21.1789141328879;
        Fri, 11 Sep 2026 08:42:08 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:08 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 10/15] io-wq: support handing a task identity to an idle worker
Date: Fri, 11 Sep 2026 09:41:00 -0600
Message-ID: <20260911154148.644489-11-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084210_706160_76A2C00F 
X-CRM114-Status: GOOD (  31.08  )
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

Add the io-wq side of handing a blocked submitter's identity to an idle
worker. io_wq_handoff_claim() picks an idle worker that can take over
the identity of the current task, and arranges for it to run a caller
supplied function when it wakes instead of continuing as a worker.

Only a worker inside the idle sleep of the worker loop is claimable,
being on the free list isn't enough as it may be sleeping elsewhere.
This is tracked in acct->nr_iosleep. Redundant workers exit through
the normal idle timeout.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io-wq.c | 263 ++++++++++++++++++++++++++++++++++++++++++++---
 io_uring/io-wq.h |  14 +++
 kernel/fork.c    |   3 +-
 3 files changed, 267 insertions(+), 13 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 2ca223e47d41..3d4eb4992d5b 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -20,6 +20,7 @@
 #include <linux/sched/sysctl.h>
 #include <uapi/linux/io_uring.h>
 #include <linux/kcov.h>
+#include <linux/thread_handoff.h>
 
 #include "io-wq.h"
 #include "slist.h"
@@ -32,6 +33,15 @@ enum {
 	IO_WORKER_F_UP		= 0,	/* up and active */
 	IO_WORKER_F_RUNNING	= 1,	/* account as running */
 	IO_WORKER_F_FREE	= 2,	/* worker on free list */
+	IO_WORKER_F_IDLE_SLEEP	= 3,	/* in the idle sleep of the worker loop */
+};
+
+/* worker->handoff handshake */
+enum {
+	IO_WORKER_HANDOFF_NONE		= 0,
+	IO_WORKER_HANDOFF_PROMOTE,	/* claimed, set under ->workers_lock */
+	IO_WORKER_HANDOFF_DONE,		/* claimer took over the worker */
+	IO_WORKER_HANDOFF_FINISHED,	/* identity moved, demoted released */
 };
 
 enum {
@@ -64,6 +74,10 @@ struct io_worker {
 	struct callback_head create_work;
 	int init_retries;
 
+	atomic_t handoff;
+	io_wq_handoff_fn *handoff_fn;
+	struct task_struct *handoff_task;
+
 	union {
 		struct rcu_head rcu;
 		struct delayed_work work;
@@ -88,6 +102,9 @@ struct io_wq_acct {
 	unsigned max_workers;
 	atomic_t nr_running;
 
+	/* workers in the idle sleep, claimable for a handoff */
+	atomic_t nr_iosleep;
+
 	/**
 	 * The list of free workers.  Protected by #workers_lock
 	 * (write) and RCU (read).
@@ -151,6 +168,8 @@ static bool io_acct_cancel_pending_work(struct io_wq *wq,
 					struct io_wq_acct *acct,
 					struct io_cb_cancel_data *match);
 static void create_worker_cb(struct callback_head *cb);
+static void create_worker_cont(struct callback_head *cb);
+static bool io_task_work_match(struct callback_head *cb, void *data);
 static void io_wq_cancel_tw_create(struct io_wq *wq);
 
 static inline unsigned int __io_get_work_hash(unsigned int work_flags)
@@ -233,7 +252,7 @@ static bool io_task_worker_match(struct callback_head *cb, void *data)
 	return worker == data;
 }
 
-static void io_worker_exit(struct io_worker *worker)
+static void __noreturn io_worker_exit(struct io_worker *worker)
 {
 	struct io_wq *wq = worker->wq;
 	struct io_wq_acct *acct = io_wq_get_acct(worker);
@@ -411,7 +430,7 @@ static bool io_queue_worker_create(struct io_worker *worker,
 
 	atomic_inc(&wq->worker_refs);
 	init_task_work(&worker->create_work, func);
-	if (!task_work_add(wq->task, &worker->create_work, TWA_SIGNAL)) {
+	if (!io_wq_task_work_add(wq->task, &worker->create_work, TWA_SIGNAL)) {
 		/*
 		 * EXIT may have been set after checking it above, check after
 		 * adding the task_work and remove any creation item if it is
@@ -687,19 +706,48 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 	} while (1);
 }
 
-static int io_wq_worker(void *data)
+/*
+ * Leave the idle sleep, check if we got claimed while in it. Serialized with
+ * the claimer by ->workers_lock, so a claim can't be missed or raced.
+ */
+static bool io_wq_worker_idle_done(struct io_wq_acct *acct,
+				   struct io_worker *worker)
 {
-	struct io_worker *worker = data;
-	struct io_wq_acct *acct = io_wq_get_acct(worker);
-	struct io_wq *wq = worker->wq;
-	bool exit_mask = false, last_timeout = false;
-	char buf[TASK_COMM_LEN] = {};
+	bool promoted;
 
-	set_mask_bits(&worker->flags, 0,
-		      BIT(IO_WORKER_F_UP) | BIT(IO_WORKER_F_RUNNING));
+	atomic_dec(&acct->nr_iosleep);
+	raw_spin_lock(&acct->workers_lock);
+	clear_bit(IO_WORKER_F_IDLE_SLEEP, &worker->flags);
+	/* the claimer may have committed already, DONE rather than PROMOTE */
+	promoted = atomic_read(&worker->handoff) != IO_WORKER_HANDOFF_NONE;
+	raw_spin_unlock(&acct->workers_lock);
 
-	snprintf(buf, sizeof(buf), "iou-wrk-%d", wq->task->pid);
-	set_task_comm(current, buf);
+	WARN_ON_ONCE(promoted && worker->handoff_task != current);
+	return promoted;
+}
+
+/* claimed, wait for the claimer to finish taking over the worker struct */
+static io_wq_handoff_fn *io_wq_worker_promoted(struct io_worker *worker)
+{
+	io_wq_handoff_fn *fn = worker->handoff_fn;
+
+	/* stop the scheduler from treating us as a worker while we wait */
+	current->flags &= ~(PF_IO_WORKER | PF_USER_WORKER);
+
+	wait_var_event(&worker->handoff,
+		atomic_read_acquire(&worker->handoff) == IO_WORKER_HANDOFF_DONE);
+
+	WARN_ON_ONCE(current->worker_private);
+	atomic_set(&worker->handoff, IO_WORKER_HANDOFF_NONE);
+	return fn;
+}
+
+/* the worker loop, only returns if claimed for a handoff */
+static io_wq_handoff_fn *io_wq_worker_run(struct io_worker *worker)
+{
+	struct io_wq_acct *acct = io_wq_get_acct(worker);
+	bool exit_mask = false, last_timeout = false;
+	struct io_wq *wq = worker->wq;
 
 	while (!test_bit(IO_WQ_BIT_EXIT, &wq->state)) {
 		long ret;
@@ -724,6 +772,11 @@ static int io_wq_worker(void *data)
 		if ((last_timeout && (exit_mask || acct->nr_workers > 1)) ||
 		    test_bit(IO_WQ_BIT_EXIT_ON_IDLE, &wq->state)) {
 			acct->nr_workers--;
+			/* a handoff can't claim an exiting worker */
+			if (test_bit(IO_WORKER_F_FREE, &worker->flags)) {
+				clear_bit(IO_WORKER_F_FREE, &worker->flags);
+				hlist_nulls_del_rcu(&worker->nulls_node);
+			}
 			raw_spin_unlock(&acct->workers_lock);
 			__set_current_state(TASK_RUNNING);
 			break;
@@ -733,7 +786,12 @@ static int io_wq_worker(void *data)
 		raw_spin_unlock(&acct->workers_lock);
 		if (io_run_task_work())
 			continue;
+		/* claimable only in this sleep, the free list isn't enough */
+		set_bit(IO_WORKER_F_IDLE_SLEEP, &worker->flags);
+		atomic_inc(&acct->nr_iosleep);
 		ret = schedule_timeout(WORKER_IDLE_TIMEOUT);
+		if (unlikely(io_wq_worker_idle_done(acct, worker)))
+			return io_wq_worker_promoted(worker);
 		if (signal_pending(current)) {
 			struct ksignal ksig;
 
@@ -752,9 +810,190 @@ static int io_wq_worker(void *data)
 		io_worker_handle_work(acct, worker);
 
 	io_worker_exit(worker);
+}
+
+static int io_wq_worker(void *data)
+{
+	struct io_worker *worker = data;
+	struct io_wq *wq = worker->wq;
+	io_wq_handoff_fn *fn;
+	char buf[TASK_COMM_LEN] = {};
+
+	set_mask_bits(&worker->flags, 0,
+		      BIT(IO_WORKER_F_UP) | BIT(IO_WORKER_F_RUNNING));
+
+	snprintf(buf, sizeof(buf), "iou-wrk-%d", wq->task->pid);
+	set_task_comm(current, buf);
+
+	/*
+	 * Only returns if we got handed an identity. -EIOCBQUEUED means we got
+	 * demoted again while running it, back to the worker loop.
+	 */
+	for (;;) {
+		long ret;
+
+		fn = io_wq_worker_run(worker);
+		ret = fn();
+		/* what we return is what userspace gets on some archs */
+		if (ret != -EIOCBQUEUED)
+			return ret;
+		worker = current->worker_private;
+	}
+}
+
+/* find and claim an idle sleeping worker, see io_wq_worker_idle_done() */
+static struct io_worker *io_wq_acct_handoff_claim(struct io_wq *wq,
+						  struct io_wq_acct *acct,
+						  io_wq_handoff_fn *fn)
+{
+	struct io_worker *worker, *found = NULL;
+	struct hlist_nulls_node *n;
+
+	raw_spin_lock(&acct->workers_lock);
+	if (test_bit(IO_WQ_BIT_EXIT, &wq->state))
+		goto out_unlock;
+	hlist_nulls_for_each_entry(worker, n, &acct->free_list, nulls_node) {
+		/* only claimable inside the idle sleep of the worker loop */
+		if (!test_bit(IO_WORKER_F_IDLE_SLEEP, &worker->flags))
+			continue;
+		if (!thread_handoff_compatible(current, worker->task))
+			continue;
+		clear_bit(IO_WORKER_F_FREE, &worker->flags);
+		hlist_nulls_del_init_rcu(&worker->nulls_node);
+		worker->handoff_fn = fn;
+		worker->handoff_task = worker->task;
+		atomic_set_release(&worker->handoff, IO_WORKER_HANDOFF_PROMOTE);
+		found = worker;
+		break;
+	}
+out_unlock:
+	raw_spin_unlock(&acct->workers_lock);
+	if (found)
+		wake_up_process(found->handoff_task);
+	return found;
+}
+
+/*
+ * task_work_add() that doesn't notify a task inside a blocking inline issue,
+ * it'd interrupt the sleep. io_handoff_end() picks pending work up instead.
+ */
+int io_wq_task_work_add(struct task_struct *task, struct callback_head *cb,
+			enum task_work_notify_mode notify)
+{
+	int ret;
+
+	if (notify != TWA_SIGNAL && notify != TWA_SIGNAL_NO_IPI)
+		return task_work_add(task, cb, notify);
+
+	ret = task_work_add(task, cb, TWA_NONE);
+	if (ret)
+		return ret;
+	if (READ_ONCE(task->flags) & PF_IO_HANDOFF)
+		return 0;
+	if (notify == TWA_SIGNAL)
+		set_notify_signal(task);
+	else
+		__set_notify_signal(task);
 	return 0;
 }
 
+/* claim an idle worker to hand our identity to, pairs with _commit() */
+struct task_struct *io_wq_handoff_claim(struct io_wq *wq, bool bound,
+					io_wq_handoff_fn *fn)
+{
+	struct io_worker *worker;
+
+	worker = io_wq_acct_handoff_claim(wq, io_get_acct(wq, bound), fn);
+	if (!worker)
+		worker = io_wq_acct_handoff_claim(wq, io_get_acct(wq, !bound), fn);
+	if (worker)
+		return worker->task;
+	return NULL;
+}
+
+/* we take over the worker @dst was, @dst goes on to run the handoff fn */
+void io_wq_handoff_commit(struct task_struct *dst)
+{
+	struct io_worker *worker = dst->worker_private;
+	struct task_struct *src = current;
+	struct io_wq *wq = worker->wq;
+	struct callback_head *cb;
+
+	WARN_ON_ONCE(src->worker_private);
+	WARN_ON_ONCE(worker->task != dst);
+	WARN_ON_ONCE(wq->task != src);
+
+	/* the sched hooks around @dst's wakeup cope with NULL worker_private */
+	WRITE_ONCE(dst->worker_private, NULL);
+	src->worker_private = worker;
+	WRITE_ONCE(worker->task, src);
+	src->flags |= PF_IO_WORKER | PF_USER_WORKER;
+
+	/* the user task owns the wq */
+	get_task_struct(dst);
+	WRITE_ONCE(wq->task, dst);
+
+	/* move pending worker creations along, we may block for a while */
+	while ((cb = task_work_cancel_match(src, io_task_work_match, wq))) {
+		struct io_worker *w = container_of(cb, struct io_worker,
+						  create_work);
+
+		if (!task_work_add(dst, cb, TWA_SIGNAL))
+			continue;
+		io_worker_cancel_cb(w);
+		if (cb->func == create_worker_cont)
+			kfree(w);
+	}
+	put_task_struct(src);
+
+	atomic_set_release(&worker->handoff, IO_WORKER_HANDOFF_DONE);
+	wake_up_var(&worker->handoff);
+}
+
+/* worker loop entry for a demoted task, only returns on another handoff */
+io_wq_handoff_fn *io_wq_handoff_worker(void)
+{
+	struct io_worker *worker = current->worker_private;
+	char buf[TASK_COMM_LEN] = {};
+
+	WARN_ON_ONCE(!io_wq_current_is_worker());
+
+	/* the promoted task reads our state until it's done migrating it */
+	wait_var_event(&worker->handoff,
+		atomic_read_acquire(&worker->handoff) == IO_WORKER_HANDOFF_FINISHED);
+	atomic_set(&worker->handoff, IO_WORKER_HANDOFF_NONE);
+
+	snprintf(buf, sizeof(buf), "iou-wrk-%d", worker->wq->task->pid);
+	set_task_comm(current, buf);
+	set_cpus_allowed_ptr(current, worker->wq->cpu_mask);
+
+	return io_wq_worker_run(worker);
+}
+
+/* release the demoted task @tsk to run as the worker it now is */
+void io_wq_handoff_finished(struct task_struct *tsk)
+{
+	struct io_worker *worker = tsk->worker_private;
+
+	atomic_set_release(&worker->handoff, IO_WORKER_HANDOFF_FINISHED);
+	wake_up_var(&worker->handoff);
+}
+
+/* idle sleepers to keep around as handoff targets */
+#define IO_WQ_HANDOFF_SPARES	2
+
+/* true if a worker is claimable, @topup forks one if below the target */
+bool io_wq_handoff_spare(struct io_wq *wq, bool bound, bool topup)
+{
+	struct io_wq_acct *acct = io_get_acct(wq, bound);
+	unsigned int idle;
+
+	idle = atomic_read(&acct->nr_iosleep);
+	if (topup && idle < IO_WQ_HANDOFF_SPARES)
+		io_wq_create_worker(wq, acct);
+	return idle > 0;
+}
+
 /*
  * Called when a worker is scheduled in. Mark us as currently running.
  */
diff --git a/io_uring/io-wq.h b/io_uring/io-wq.h
index 42f00a47a9c9..98357b665e54 100644
--- a/io_uring/io-wq.h
+++ b/io_uring/io-wq.h
@@ -4,6 +4,7 @@
 
 #include <linux/refcount.h>
 #include <linux/io_uring_types.h>
+#include <linux/task_work.h>
 
 struct io_wq;
 
@@ -47,6 +48,19 @@ void io_wq_set_exit_on_idle(struct io_wq *wq, bool enable);
 void io_wq_enqueue(struct io_wq *wq, struct io_wq_work *work);
 void io_wq_hash_work(struct io_wq_work *work, void *val);
 
+typedef long (io_wq_handoff_fn)(void);
+
+/* claim an idle worker, it runs @fn instead of the worker loop when woken */
+struct task_struct *io_wq_handoff_claim(struct io_wq *wq, bool bound,
+					io_wq_handoff_fn *fn);
+
+void io_wq_handoff_commit(struct task_struct *dst);
+io_wq_handoff_fn *io_wq_handoff_worker(void);
+bool io_wq_handoff_spare(struct io_wq *wq, bool bound, bool topup);
+void io_wq_handoff_finished(struct task_struct *tsk);
+int io_wq_task_work_add(struct task_struct *task, struct callback_head *cb,
+			enum task_work_notify_mode notify);
+
 int io_wq_cpu_affinity(struct io_uring_task *tctx, cpumask_var_t mask);
 int io_wq_max_workers(struct io_wq *wq, int *new_count);
 bool io_wq_worker_stopped(void);
diff --git a/kernel/fork.c b/kernel/fork.c
index 510c8a9aa870..f31af9c5bae7 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2688,11 +2688,12 @@ struct task_struct * __init fork_idle(int cpu)
  * creating io_uring workers. It returns a created task, or an error pointer.
  * The returned task is inactive, and the caller must fire it up through
  * wake_up_new_task(p). All signals are blocked in the created task.
+ * CLONE_SYSVSEM as a worker may take over a user thread's identity.
  */
 struct task_struct *create_io_thread(int (*fn)(void *), void *arg, int node)
 {
 	unsigned long flags = CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|
-			      CLONE_IO|CLONE_VM|CLONE_UNTRACED;
+			      CLONE_IO|CLONE_VM|CLONE_UNTRACED|CLONE_SYSVSEM;
 	struct kernel_clone_args args = {
 		.flags		= flags,
 		.fn		= fn,
-- 
2.55.0


