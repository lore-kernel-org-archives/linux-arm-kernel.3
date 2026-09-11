Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CB0C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9YT6ic9x6FyZ148rG7PDLceVb4/eE9JqVTzoSzdUWU=; b=hD67urgDjuLXHwCHd6TxL/L85N
	xC0rjqOcPcr+eM3H013p9SjekrxqnR5HQb2MMdOB4T0v8GKY9LT1SFouBhxMt+NwbdphwbNkirsxH
	9O8drMhr4ficdpTnCc2NP19P5Y66IqlPEbFAhgGOsTBAA/rjz128CLx19WgyL0y00lNaJc7tOaOEg
	P4XbQclGh6w65M68rcQKZtOiqV77KR1a7Oa04cmRCFglBxy6GH403PjwvZ06/WSNvIwrQ7YXlulv1
	yo7cilkt96e6SKcrkEUldt9loPeZS+c3t6WuUJysL2BFVkLVGpO8gLvJxzCNl9FIR2h3ZwwO7M0Ol
	yQFHsrIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Oa-0000000H6Oa-2bWu;
	Fri, 11 Sep 2026 15:42:32 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OJ-0000000H6AR-2p9l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:17 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 006d021491bc7-6bff4d6504cso536454eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141334; x=1789746134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9YT6ic9x6FyZ148rG7PDLceVb4/eE9JqVTzoSzdUWU=;
        b=abu+ANUMIOrsFm4Q5OFfxKil8gBiwzN6SCDSmJdLg+jGvBiX+4Zv1OFdiYedJLpfbG
         GH0/DK8RAIF5+7mhMHY6PTzxAspLirnIFGOLT6KMJCYeeb7SrNPWtNIGezXs/BhvqnUC
         fuK54HjwPrbbGxEggM85dmipqgXNKs2bgckxt2iuIC0BshN9a/Wc67+DHe4Jv6q4IBiV
         +Nm2IsS+RSNXT8BqfHrwiqhTCcPWhEPN9dYUCL6q12J051JxzX+fFrzSaOnay+qomPXc
         jROqaB8DNGGlzyzxo6CwMDbywJm2A/dCsFJt7NUagtD7ecRl+BLJYHLpA2Ui/NUE5rbB
         l+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141334; x=1789746134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9YT6ic9x6FyZ148rG7PDLceVb4/eE9JqVTzoSzdUWU=;
        b=Amdmf6yZhL1bxt9E2ScT7tzJffNYMCZTXwVv/kls3ixIV7060lsNB2U+GuVB4wxhxx
         0HCS3kymYzoNsSknor8UwyaPzv80NnetPMXKd/nVPZi/WGEzJ6qXSTJoCw4umrt3XbLv
         gUBBI2sf2I5N5X6d7Z7JKsP2KAl1Jvk810/HENHfPRUDZSZLmoVwCFX8xGnEIMwGe8Tz
         8T1OeGMwZ+LYn0rxOnoVi1LfmXlggUU0OJ0RyylOgH4H3SKCy76kYQG2yYy6/sbvywBb
         zI+hP2HnBAboBpfW8UGKqbBpVeLATKPAOFx/r91b5i/uhQ78ot9YdLkB2/vNzfRli0oq
         RRYQ==
X-Gm-Message-State: AFuF++lNWdkq22W7FOmJQM5Sfavtk/yh+iipI8yvHCNio+HRpF1qMIGs
	z5ArqyAHnoNayiJzQ2sxCfTPP7dsRmfl1if/aoslbzgTbS9j74SeIsksE+t9PGi8wQ8=
X-Gm-Gg: AYBFou37sUugYC/7y4BMMguJiu9zG0hvMVaBuOkI3SDR6Ca+fQsgZ3lb+MHUn3T2Qch
	eCXViPG2b9b1tptcJ0j8/t94b/9xVzVCnSOqBB+JYeFblf37udtZgoYH0Rti+T5nCZ4AE7kaFZ3
	ZdipZ1LgnElQUzcoE2jxdmL1qTzmr4h8yNP39geIp1HufV+T80t4zO91SZCPkb65DJDNMSpUn48
	3E5O+yOhCLq8IdLONsBh29WBiowBf/Vo7c0NJHOEUNYgyfaFwLhsuoeqLSVy48M/grKPDA2R5q4
	R9PL1wT5cDAQTOo+OPj9xMMhpDyVa0ahoPm6uuOyN3lRnrdqE912ljcn1kj9hDMPjWVtRBbwvv5
	jNl9S3qpdvMrS4x9MtSmIVa6TXA3pjvixit8xDTIwMLqqWtwLcyH5WdbZldBP17oBpbptHB0uSZ
	3ami2CbtDqztz2rNPrAX+nlUm+/PNSawObaN1+H/EfpCTD4o4w+NAnkIf8H8U3gFMd3cHJ2OhET
	chxxaX0Khif/ls11EuE9fWxX3kepv9GNQUtlNpymZo=
X-Received: by 2002:a05:6820:83d2:10b0:6b9:7d9e:5708 with SMTP id 006d021491bc7-6c0b9e5081cmr5077670eaf.3.1789141334570;
        Fri, 11 Sep 2026 08:42:14 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:13 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 14/15] io_uring: add tracepoints for the handoff operation
Date: Fri, 11 Sep 2026 09:41:04 -0600
Message-ID: <20260911154148.644489-15-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084215_921145_580B5731 
X-CRM114-Status: GOOD (  21.36  )
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

Add tracepoints for a handoff, a handoff that didn't happen with the
reason, and the promoted task resuming the submission.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/trace/events/io_uring.h | 114 ++++++++++++++++++++++++++++++++
 io_uring/handoff.c              |  42 +++++++++---
 2 files changed, 147 insertions(+), 9 deletions(-)

diff --git a/include/trace/events/io_uring.h b/include/trace/events/io_uring.h
index 34b31a855ea4..6043c5d46dbd 100644
--- a/include/trace/events/io_uring.h
+++ b/include/trace/events/io_uring.h
@@ -671,6 +671,120 @@ TRACE_EVENT(io_uring_local_work_run,
 	TP_printk("ring %p, count %d, loops %u", __entry->ctx, __entry->count, __entry->loops)
 );
 
+/**
+ * io_uring_handoff - a blocked submitter hands its identity to a worker
+ *
+ * @req:	pointer to a submitted request
+ * @dst:	the idle io-wq worker task taking over
+ */
+TRACE_EVENT(io_uring_handoff,
+
+	TP_PROTO(struct io_kiocb *req, struct task_struct *dst),
+
+	TP_ARGS(req, dst),
+
+	TP_STRUCT__entry (
+		__field(  void *,	ctx		)
+		__field(  void *,	req		)
+		__field(  u64,		user_data	)
+		__field(  u8,		opcode		)
+		__field(  pid_t,	src_pid		)
+		__field(  pid_t,	dst_pid		)
+
+		__string( op_str, io_uring_get_opcode(req->opcode)	)
+	),
+
+	TP_fast_assign(
+		__entry->ctx		= req->ctx;
+		__entry->req		= req;
+		__entry->user_data	= req->cqe.user_data;
+		__entry->opcode		= req->opcode;
+		__entry->src_pid	= task_pid_nr(current);
+		__entry->dst_pid	= task_pid_nr(dst);
+
+		__assign_str(op_str);
+	),
+
+	TP_printk("ring %p, request %p, user_data 0x%llx, opcode %s, identity %d handed to worker %d",
+		__entry->ctx, __entry->req, __entry->user_data,
+		__get_str(op_str), __entry->src_pid, __entry->dst_pid)
+);
+
+/**
+ * io_uring_handoff_fail - a handoff didn't happen for a request
+ *
+ * @req:	pointer to the request being issued
+ * @reason:	why. "lock", "prepare" and "worker" mean the task blocked in
+ *		place, anything else that it took the io-wq punt path instead.
+ */
+TRACE_EVENT(io_uring_handoff_fail,
+
+	TP_PROTO(struct io_kiocb *req, const char *reason),
+
+	TP_ARGS(req, reason),
+
+	TP_STRUCT__entry (
+		__field(  void *,	ctx		)
+		__field(  void *,	req		)
+		__field(  u64,		user_data	)
+		__field(  u8,		opcode		)
+
+		__string( op_str, io_uring_get_opcode(req->opcode)	)
+		__string( reason, reason			)
+	),
+
+	TP_fast_assign(
+		__entry->ctx		= req->ctx;
+		__entry->req		= req;
+		__entry->user_data	= req->cqe.user_data;
+		__entry->opcode		= req->opcode;
+
+		__assign_str(op_str);
+		__assign_str(reason);
+	),
+
+	TP_printk("ring %p, request %p, user_data 0x%llx, opcode %s, %s",
+		__entry->ctx, __entry->req, __entry->user_data,
+		__get_str(op_str), __get_str(reason))
+);
+
+/**
+ * io_uring_handoff_resume - a promoted worker continues the submission
+ *
+ * @ctx:	pointer to a ring context structure
+ * @req:	the request that blocked, owned by the demoted task by now
+ * @worker:	pid the demoted task now runs under
+ * @consumed:	SQEs consumed by earlier handoffs of this syscall
+ * @to_submit:	SQE count the syscall asked for
+ */
+TRACE_EVENT(io_uring_handoff_resume,
+
+	TP_PROTO(void *ctx, void *req, pid_t worker, unsigned int consumed,
+		 unsigned int to_submit),
+
+	TP_ARGS(ctx, req, worker, consumed, to_submit),
+
+	TP_STRUCT__entry (
+		__field(  void *,	ctx		)
+		__field(  void *,	req		)
+		__field(  pid_t,	worker		)
+		__field(  unsigned int,	consumed	)
+		__field(  unsigned int,	to_submit	)
+	),
+
+	TP_fast_assign(
+		__entry->ctx		= ctx;
+		__entry->req		= req;
+		__entry->worker		= worker;
+		__entry->consumed	= consumed;
+		__entry->to_submit	= to_submit;
+	),
+
+	TP_printk("ring %p, request %p now on worker %d, consumed %u, to_submit %u",
+		__entry->ctx, __entry->req, __entry->worker,
+		__entry->consumed, __entry->to_submit)
+);
+
 #endif /* _TRACE_IO_URING_H */
 
 /* This part must be outside protection */
diff --git a/io_uring/handoff.c b/io_uring/handoff.c
index 9c9bb7ba99f0..8aefea5d326e 100644
--- a/io_uring/handoff.c
+++ b/io_uring/handoff.c
@@ -20,6 +20,7 @@
 #include <linux/fs.h>
 #include <linux/file.h>
 #include <asm/syscall.h>
+#include <trace/events/io_uring.h>
 
 #include "io_uring.h"
 #include "io-wq.h"
@@ -52,28 +53,40 @@ bool io_handoff_possible(struct io_kiocb *req)
 		return false;
 	/* IOPOLL/SQPOLL issue differently, SQ_REWIND can't resume mid-batch */
 	if (ctx->flags & (IORING_SETUP_IOPOLL | IORING_SETUP_SQPOLL |
-			  IORING_SETUP_SQ_REWIND))
+			  IORING_SETUP_SQ_REWIND)) {
+		trace_io_uring_handoff_fail(req, "ring");
 		return false;
+	}
 	/* pollable files keep the nonblocking issue + poll retry path */
-	if (io_file_can_poll(req))
+	if (io_file_can_poll(req)) {
+		trace_io_uring_handoff_fail(req, "poll");
 		return false;
+	}
 	/* FMODE_NOWAIT files have a working nonblocking path, keep using it */
 	if ((def->pollin || def->pollout) && req->file &&
-	    (req->file->f_mode & FMODE_NOWAIT))
+	    (req->file->f_mode & FMODE_NOWAIT)) {
+		trace_io_uring_handoff_fail(req, "nowait-file");
 		return false;
+	}
 	if (!tctx->io_wq)
 		return false;
 	/* an intermediate task's own user state doesn't matter, it stays */
-	if (!tctx->handoff.src && !thread_handoff_allowed(current))
+	if (!tctx->handoff.src && !thread_handoff_allowed(current)) {
+		trace_io_uring_handoff_fail(req, "task");
 		return false;
+	}
 	/* the SQ head is published while we may still be running */
-	if (io_req_sqe_copy(req, IO_URING_F_INLINE))
+	if (io_req_sqe_copy(req, IO_URING_F_INLINE)) {
+		trace_io_uring_handoff_fail(req, "sqe");
 		return false;
+	}
 	req->flags |= REQ_F_HANDOFF;
 check_spare:
 	/* have a worker ready to take over */
-	if (!io_wq_handoff_spare(tctx->io_wq, !io_req_unbound(req), false))
+	if (!io_wq_handoff_spare(tctx->io_wq, !io_req_unbound(req), false)) {
+		trace_io_uring_handoff_fail(req, "spare");
 		return false;
+	}
 	return true;
 }
 
@@ -122,8 +135,10 @@ bool __io_handoff_begin(struct io_kiocb *req)
 	if (!io_handoff_possible(req))
 		return false;
 	/* would interrupt the issue right away, and can't be handled here */
-	if (task_sigpending(current))
+	if (task_sigpending(current)) {
+		trace_io_uring_handoff_fail(req, "signal");
 		return false;
+	}
 
 	ho->req = req;
 	io_handoff_block_signals(ho);
@@ -240,10 +255,14 @@ void io_uring_task_sleeping(struct task_struct *tsk)
 	WARN_ON_ONCE(tsk != current);
 
 	/* the issue path is touching state that needs the ring lock held */
-	if (ctx->submit_lock_depth)
+	if (ctx->submit_lock_depth) {
+		trace_io_uring_handoff_fail(req, "lock");
 		return;
-	if (src == tsk && !thread_handoff_prepare(tsk))
+	}
+	if (src == tsk && !thread_handoff_prepare(tsk)) {
+		trace_io_uring_handoff_fail(req, "prepare");
 		return;
+	}
 
 	/* don't let the woken worker preempt us before we've committed */
 	preempt_disable();
@@ -251,6 +270,7 @@ void io_uring_task_sleeping(struct task_struct *tsk)
 	dst = io_wq_handoff_claim(tctx->io_wq, bound, io_handoff_resume, src);
 	if (!dst) {
 		preempt_enable();
+		trace_io_uring_handoff_fail(req, "worker");
 		return;
 	}
 
@@ -262,6 +282,7 @@ void io_uring_task_sleeping(struct task_struct *tsk)
 	/* our accounting follows the identity, an intermediate's doesn't */
 	if (src == tsk)
 		thread_handoff_stats_take(&ho->stats);
+	trace_io_uring_handoff(req, dst);
 
 	io_handoff_release_ring(ctx, ho);
 	io_handoff_move_tctx(tctx, tsk, dst);
@@ -306,6 +327,9 @@ static long io_handoff_resume(void)
 	bool bound = ho->bound;
 	long ret;
 
+	trace_io_uring_handoff_resume(ctx, ho->req, task_pid_nr(prev),
+				      ho->consumed, ho->to_submit);
+
 	/* enough of the identity to issue requests on its behalf */
 	thread_handoff_adopt_creds(src);
 	put_task_struct_many(prev, ho->prev_refs);
-- 
2.55.0


