Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EBFC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIwUeFtb2rgpZypFvq5Uvr0k1u6Xe8moD+czEvfbQMY=; b=tvJM9BTi1YVP5BApsOTTqbnbMd
	5axeIVlz3TraU1/1dlYM5pqv0J3TKMV2jxBFx/LOVU1ozCvoI4/6ZVntNNRYN+oQMj8pym39VkqPj
	sBC9bKAFL9DjLvIPVAfUVtyCP6+JRxzss7bPPOq5TLy7uVT8dtG9o511xjmd+dAxurU85nS3qmJxn
	bXEyDrA//sHrFV7DI+Dmq0X6rWOt9rhYPY7OeS3Avee1MnjP+iaWKSIx0E4ijZitcAAdkux28hUst
	kcyVXHqRTfyI0W/mC4IqNvOCliksbTaoz8MdZFMMs7+PIgTyRVXHrMU8ZTqstCDf6W43OPgPwR9d/
	KBWe4kcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OZ-0000000H6MK-2BAY;
	Fri, 11 Sep 2026 15:42:31 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OH-0000000H68l-2acA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:16 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6bd209cf210so517740eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141332; x=1789746132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIwUeFtb2rgpZypFvq5Uvr0k1u6Xe8moD+czEvfbQMY=;
        b=Ycm44po3Kvnpw5pLm//Wpuztz3OSjdnh51F9QbutM20Nwl2WLiJuAMhAY/YsPoCdid
         XnXTTDISC9EfdMh9P1vgztmlaXkSGKE1AXQ3XQpb5+nWUWyPn4xdsuJVty1iAqIxbVKh
         ePOXbk7t5KZZkxIl/1dgkMKvTFXvdClqoIrKMhcm0OnJeOpGeMKM0q/cfHYUzA5dM5b1
         jhS+HJQB31ZEYsWypzfsLd01O7hFfq6kdaxY50WugUPKrTgK0CxW3D1AWaOXh1f/QNQ6
         NlAGI6ukRDZwboHvVaA8/0NKrFoNYcxKnVPxvhcor52kBuv6JKo74pA6Q+rrz4D1I+/c
         xO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141332; x=1789746132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mIwUeFtb2rgpZypFvq5Uvr0k1u6Xe8moD+czEvfbQMY=;
        b=AN7GaHxkJY3aqCMRITVVoTiovGR459N11WKYYSeYnpf1zBj9cBwwOpUPwCqoqPbuG2
         mfzYeyVxqRY30jjYLnrq3vNLvdkTwFos2pAMR2aL3bHNiC+y0oX/3e5+ml45rL5Ajoon
         6QzYyJn60/FlrYpb6FjXLxPxupf40BGhKSZdcP1R5upTz3/CArrmk8LnSbpagMCLk7VG
         OhG1hZvnVhMi/zSq+CPUEkbvcmraVq26l09xtsprcLouyjFyjajVeli8HK7ky7X/+Fcb
         U4RN+6H+jGmlYAjw7Q84bX+Ov3K2ZgbwzZRH74n2ro39AQU5wD9mZtpDlQGYmqaUzHpA
         BThA==
X-Gm-Message-State: AFuF++nn2ZixMIqunKj9gN4rt3oNaLcZWO1EPLxgORCXpGwDYrhJaaiY
	d6JNljGgsKpsODO+uuErRrcguHUPUejhjEnpR43rEg0Vn/IV6PW2YvZ8+O481GCwsUU=
X-Gm-Gg: AYBFou1P/inc051O2J7lwRpnu7mLop+1S5RVKxr9fH7ZOfbA8kkHx1VJJHAo9ZTHYHQ
	nAtDeCnt8odfvMSDKhcmah9BMavFP6CARcGpPCUuMfzmc5Tcwc/YrdbBzrDFCgQnJWXt0jX2CMO
	TYGj6mM7ywPp3cSFB6zLVGh/aglifMc9aUsoINMF+avPwPJTGQQi4UHD4urnjb+rg60geQcmeI5
	1Aya3Z94apBlgRf1kvUBTdarna+GraeWcpvk7Bh3T1latyUGOPkbMyLWqS+4zkNfhc3V96JU33q
	eMMacGNpHcRAWOmWgZsyDDy8V7lbvjJwikJDwkjQAmyK+psTVeDEWZxi/i5JXkvMBvQkiZmGhwB
	kP09aSgrXkLXcd6Q+edX6z8v5+szzvk6ZOWjE4znPjtSuwLWlBNZRIA8CI1cilGD3hGhRrk4p6p
	n1uASO3vjwSjd4Bn/LlcKBp+U5KgEm2hGpDc7g3ckO2eFKz6wUAKOAH6XETw1SersX3KYsAOqGS
	w0uSBfBlvMsTv4bg6KxYJ1B5BRi
X-Received: by 2002:a05:6820:55d4:10b0:6b1:3534:a5b8 with SMTP id 006d021491bc7-6c0ba03ff05mr2428688eaf.15.1789141331976;
        Fri, 11 Sep 2026 08:42:11 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:10 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 12/15] io_uring: defer the identity migration to the end of the submission
Date: Fri, 11 Sep 2026 09:41:02 -0600
Message-ID: <20260911154148.644489-13-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084213_732642_5344ADD3 
X-CRM114-Status: GOOD (  32.76  )
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

A handoff currently migrates the full identity (tid, signals, cgroup,
sched attributes, register state) before the promoted worker resumes
the SQ ring. With N blockable SQEs in one io_uring_enter(), that puts a
complete migration between each of them, where the old behaviour was N
cheap io-wq punts.

None of that is needed to run kernel code on the submitter's behalf,
only its creds and io_uring context are. Have the promoted task adopt
the creds and continue the submission right away. If it blocks and
hands off again, it just goes back to being a worker. Only the task
that ends the submission migrates the identity, once, from the original
submitter which is parked in io_wq_handoff_worker() until then.

A task demoted while running the handoff function now also goes through
io_wq_handoff_worker() rather than straight into the worker loop, so it
doesn't exit or rename itself while its state is still being read.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h |  5 +--
 include/linux/thread_handoff.h |  4 +++
 io_uring/handoff.c             | 64 +++++++++++++++++++++++-----------
 io_uring/handoff.h             |  7 ++--
 io_uring/io-wq.c               | 33 +++++++++++-------
 io_uring/io-wq.h               |  3 +-
 kernel/thread_handoff.c        |  6 ++++
 7 files changed, 83 insertions(+), 39 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 81bc4810fcab..6c8fe7232aa2 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -151,9 +151,10 @@ struct io_handoff {
 	/* the submitter's signal mask while blocking issues run without */
 	sigset_t			sigmask;
 	bool				sigsaved;
-	/* the task the identity came from, and the task refs it held */
+	/* identity source, and the task this hop took the worker from */
 	struct task_struct		*src;
-	unsigned int			src_refs;
+	struct task_struct		*prev;
+	unsigned int			prev_refs;
 	struct thread_handoff_stats	stats;
 	/* io_uring_enter() arguments, to resume the syscall */
 	struct file			*file;
diff --git a/include/linux/thread_handoff.h b/include/linux/thread_handoff.h
index e1c17b833e7c..203ab6ef73e0 100644
--- a/include/linux/thread_handoff.h
+++ b/include/linux/thread_handoff.h
@@ -29,6 +29,7 @@ bool thread_handoff_compatible(struct task_struct *src,
 			       struct task_struct *dst);
 bool thread_handoff_prepare(struct task_struct *tsk);
 void thread_handoff_stats_take(struct thread_handoff_stats *st);
+void thread_handoff_adopt_creds(struct task_struct *src);
 int thread_handoff_finish(struct task_struct *src,
 			  struct thread_handoff_stats *st);
 
@@ -62,6 +63,9 @@ static inline bool thread_handoff_prepare(struct task_struct *tsk)
 static inline void thread_handoff_stats_take(struct thread_handoff_stats *st)
 {
 }
+static inline void thread_handoff_adopt_creds(struct task_struct *src)
+{
+}
 static inline int thread_handoff_finish(struct task_struct *src,
 					struct thread_handoff_stats *st)
 {
diff --git a/io_uring/handoff.c b/io_uring/handoff.c
index 25e9e06812a7..ddc3c4d6a4f3 100644
--- a/io_uring/handoff.c
+++ b/io_uring/handoff.c
@@ -89,7 +89,8 @@ bool __io_handoff_begin(struct io_kiocb *req)
 		return false;
 	if (!tctx->io_wq)
 		return false;
-	if (!thread_handoff_allowed(current))
+	/* an intermediate task's own user state doesn't matter, it stays */
+	if (!tctx->handoff.src && !thread_handoff_allowed(current))
 		return false;
 	/* the SQ head is published while we may still be running */
 	if (io_req_sqe_copy(req, IO_URING_F_INLINE))
@@ -98,12 +99,15 @@ bool __io_handoff_begin(struct io_kiocb *req)
 	if (!io_wq_handoff_spare(tctx->io_wq, !io_req_unbound(req), false))
 		return false;
 	/* would interrupt the issue right away, and can't be handled here */
-	if (signal_pending(current))
+	if (task_sigpending(current))
 		return false;
 
 	ho->req = req;
 	io_handoff_block_signals(ho);
 	current->flags |= PF_IO_HANDOFF;
+	/* already queued task_work gets picked up by io_handoff_end() too */
+	if (test_thread_flag(TIF_NOTIFY_SIGNAL))
+		clear_notify_signal();
 	return true;
 }
 
@@ -148,8 +152,8 @@ static void io_handoff_task_refs(struct io_uring_task *tctx,
 	WRITE_ONCE(tctx->task, dst);
 	raw_spin_unlock(&tctx->task_ref_lock);
 
-	/* dropped by the promoted task once it's done taking over */
-	tctx->handoff.src_refs = nr;
+	/* dropped by the promoted task */
+	tctx->handoff.prev_refs = nr;
 }
 
 /* move tctx task_work queued on @task along to the tctx's new task */
@@ -205,6 +209,8 @@ void io_uring_task_sleeping(struct task_struct *tsk)
 	struct io_handoff *ho = &tctx->handoff;
 	struct io_kiocb *req = ho->req;
 	struct io_ring_ctx *ctx = req->ctx;
+	/* the identity being handed around, ours unless we're intermediate */
+	struct task_struct *src = ho->src ?: tsk;
 	struct task_struct *dst;
 	bool bound;
 
@@ -213,23 +219,26 @@ void io_uring_task_sleeping(struct task_struct *tsk)
 	/* the issue path is touching state that needs the ring lock held */
 	if (ctx->submit_lock_depth)
 		return;
-	if (!thread_handoff_prepare(tsk))
+	if (src == tsk && !thread_handoff_prepare(tsk))
 		return;
 
 	/* don't let the woken worker preempt us before we've committed */
 	preempt_disable();
 	bound = !io_req_unbound(req);
-	dst = io_wq_handoff_claim(tctx->io_wq, bound, io_handoff_resume);
+	dst = io_wq_handoff_claim(tctx->io_wq, bound, io_handoff_resume, src);
 	if (!dst) {
 		preempt_enable();
 		return;
 	}
 
 	/* committed, @req is ours as the worker from here on */
-	ho->src = tsk;
+	ho->src = src;
+	ho->prev = tsk;
 	ho->ctx = ctx;
 	ho->bound = bound;
-	thread_handoff_stats_take(&ho->stats);
+	/* our accounting follows the identity, an intermediate's doesn't */
+	if (src == tsk)
+		thread_handoff_stats_take(&ho->stats);
 
 	io_handoff_release_ring(ctx, ho);
 	io_handoff_move_tctx(tctx, tsk, dst);
@@ -261,24 +270,29 @@ int io_handoff_complete(struct io_kiocb *req, int ret)
 	return -EIOCBQUEUED;
 }
 
-/* runs on the promoted task, finishes io_uring_enter() for the submitter */
+/*
+ * Runs on the promoted task, finishes io_uring_enter() for the submitter. Only
+ * takes its identity if it gets through the submission without handing off.
+ */
 static long io_handoff_resume(void)
 {
 	struct io_uring_task *tctx = current->io_uring;
 	struct io_handoff *ho = &tctx->handoff;
-	struct task_struct *src = ho->src;
+	struct task_struct *src = ho->src, *prev = ho->prev;
 	struct io_ring_ctx *ctx = ho->ctx;
 	bool bound = ho->bound;
 	long ret;
 
-	if (WARN_ON_ONCE(thread_handoff_finish(src, &ho->stats)))
-		force_sig(SIGKILL);
-	io_wq_handoff_finished(src);
-	put_task_struct_many(src, ho->src_refs);
-	ho->src_refs = 0;
-	ho->src = NULL;
+	/* enough of the identity to issue requests on its behalf */
+	thread_handoff_adopt_creds(src);
+	put_task_struct_many(prev, ho->prev_refs);
+	ho->prev_refs = 0;
+	ho->prev = NULL;
 	ho->req = NULL;
 	ho->ctx = NULL;
+	/* an intermediate task has nothing we still need, let it work */
+	if (prev != src)
+		io_wq_handoff_finished(prev);
 
 	/* flush what the blocked batch left behind, then submit the rest */
 	io_run_task_work();
@@ -291,12 +305,20 @@ static long io_handoff_resume(void)
 		if (ret > 0)
 			ho->consumed += ret;
 	}
-	/* the identity came with the mask the blocking issue ran under */
-	io_handoff_submit_end();
+
+	mutex_unlock(&ctx->uring_lock);
+
+	/* submission done, become the submitter and return to userspace */
+	if (WARN_ON_ONCE(thread_handoff_finish(src, &ho->stats)))
+		force_sig(SIGKILL);
+	if (ho->sigsaved)
+		__io_handoff_restore_signals(ho);
+	io_wq_handoff_finished(src);
+	ho->src = NULL;
+
 	ret = ho->consumed;
-	if (ret != ho->to_submit) {
-		mutex_unlock(&ctx->uring_lock);
-	} else {
+	if (ret == ho->to_submit && (ho->flags & IORING_ENTER_GETEVENTS)) {
+		mutex_lock(&ctx->uring_lock);
 		ret = io_uring_enter_finish(ctx, ret, ho->min_complete,
 					    ho->flags, ho->argp, ho->argsz);
 	}
diff --git a/io_uring/handoff.h b/io_uring/handoff.h
index 833c6314d3b7..b8ded4916606 100644
--- a/io_uring/handoff.h
+++ b/io_uring/handoff.h
@@ -44,12 +44,15 @@ static inline void io_handoff_enter(struct file *file, u32 to_submit,
 	ho->argsz = argsz;
 }
 
-/* a submit call is done issuing, restore the signal mask if we changed it */
+/*
+ * Done issuing, restore the signal mask if we changed it. Not with a handoff
+ * in flight, io_handoff_resume() does that once it has the identity.
+ */
 static inline void io_handoff_submit_end(void)
 {
 	struct io_handoff *ho = &current->io_uring->handoff;
 
-	if (unlikely(ho->sigsaved))
+	if (unlikely(ho->sigsaved) && !ho->src)
 		__io_handoff_restore_signals(ho);
 }
 
diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 3d4eb4992d5b..d29e5a80eddd 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -829,22 +829,22 @@ static int io_wq_worker(void *data)
 	 * Only returns if we got handed an identity. -EIOCBQUEUED means we got
 	 * demoted again while running it, back to the worker loop.
 	 */
+	fn = io_wq_worker_run(worker);
 	for (;;) {
-		long ret;
+		long ret = fn();
 
-		fn = io_wq_worker_run(worker);
-		ret = fn();
 		/* what we return is what userspace gets on some archs */
 		if (ret != -EIOCBQUEUED)
 			return ret;
-		worker = current->worker_private;
+		fn = io_wq_handoff_worker();
 	}
 }
 
 /* find and claim an idle sleeping worker, see io_wq_worker_idle_done() */
 static struct io_worker *io_wq_acct_handoff_claim(struct io_wq *wq,
 						  struct io_wq_acct *acct,
-						  io_wq_handoff_fn *fn)
+						  io_wq_handoff_fn *fn,
+						  struct task_struct *src)
 {
 	struct io_worker *worker, *found = NULL;
 	struct hlist_nulls_node *n;
@@ -856,7 +856,7 @@ static struct io_worker *io_wq_acct_handoff_claim(struct io_wq *wq,
 		/* only claimable inside the idle sleep of the worker loop */
 		if (!test_bit(IO_WORKER_F_IDLE_SLEEP, &worker->flags))
 			continue;
-		if (!thread_handoff_compatible(current, worker->task))
+		if (!thread_handoff_compatible(src, worker->task))
 			continue;
 		clear_bit(IO_WORKER_F_FREE, &worker->flags);
 		hlist_nulls_del_init_rcu(&worker->nulls_node);
@@ -897,15 +897,17 @@ int io_wq_task_work_add(struct task_struct *task, struct callback_head *cb,
 	return 0;
 }
 
-/* claim an idle worker to hand our identity to, pairs with _commit() */
+/* claim an idle worker to hand @src's identity to, pairs with _commit() */
 struct task_struct *io_wq_handoff_claim(struct io_wq *wq, bool bound,
-					io_wq_handoff_fn *fn)
+					io_wq_handoff_fn *fn,
+					struct task_struct *src)
 {
 	struct io_worker *worker;
 
-	worker = io_wq_acct_handoff_claim(wq, io_get_acct(wq, bound), fn);
+	worker = io_wq_acct_handoff_claim(wq, io_get_acct(wq, bound), fn, src);
 	if (!worker)
-		worker = io_wq_acct_handoff_claim(wq, io_get_acct(wq, !bound), fn);
+		worker = io_wq_acct_handoff_claim(wq, io_get_acct(wq, !bound),
+						  fn, src);
 	if (worker)
 		return worker->task;
 	return NULL;
@@ -958,9 +960,14 @@ io_wq_handoff_fn *io_wq_handoff_worker(void)
 
 	WARN_ON_ONCE(!io_wq_current_is_worker());
 
-	/* the promoted task reads our state until it's done migrating it */
-	wait_var_event(&worker->handoff,
-		atomic_read_acquire(&worker->handoff) == IO_WORKER_HANDOFF_FINISHED);
+	/*
+	 * Wait until nobody needs our state anymore, which may be a while if
+	 * an identity is still parked on us. Hence TASK_IDLE.
+	 */
+	___wait_var_event(&worker->handoff,
+			  atomic_read_acquire(&worker->handoff) ==
+						IO_WORKER_HANDOFF_FINISHED,
+			  TASK_IDLE, 0, 0, schedule());
 	atomic_set(&worker->handoff, IO_WORKER_HANDOFF_NONE);
 
 	snprintf(buf, sizeof(buf), "iou-wrk-%d", worker->wq->task->pid);
diff --git a/io_uring/io-wq.h b/io_uring/io-wq.h
index 98357b665e54..df451838828d 100644
--- a/io_uring/io-wq.h
+++ b/io_uring/io-wq.h
@@ -52,7 +52,8 @@ typedef long (io_wq_handoff_fn)(void);
 
 /* claim an idle worker, it runs @fn instead of the worker loop when woken */
 struct task_struct *io_wq_handoff_claim(struct io_wq *wq, bool bound,
-					io_wq_handoff_fn *fn);
+					io_wq_handoff_fn *fn,
+					struct task_struct *src);
 
 void io_wq_handoff_commit(struct task_struct *dst);
 io_wq_handoff_fn *io_wq_handoff_worker(void);
diff --git a/kernel/thread_handoff.c b/kernel/thread_handoff.c
index 1901eb85bae8..822fdd9a0e7f 100644
--- a/kernel/thread_handoff.c
+++ b/kernel/thread_handoff.c
@@ -393,6 +393,12 @@ static void thread_handoff_creds(struct task_struct *dst,
 	put_cred_many(old, 2);
 }
 
+/* the part of thread_handoff_finish() needed to run kernel code for @src */
+void thread_handoff_adopt_creds(struct task_struct *src)
+{
+	thread_handoff_creds(current, src);
+}
+
 /* the user requested affinity follows, the effective mask derives from it */
 static void thread_handoff_affinity(struct task_struct *dst,
 				    struct task_struct *src)
-- 
2.55.0


