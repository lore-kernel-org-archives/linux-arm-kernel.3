Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2F9C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RcGks6YdaJ2UkXyVy3FKEoUGQQvU1qrezFrY/Mkmuw=; b=jUkEjVxoqI0bBJOWg7PgZTRb3V
	DPj5ovwmFLvph2P5KZBBe7CcaJPAaQgxEGy0xPYu1x0MRnQqkQOjZWDTaaYOMPU6iCYfA/Ykt2RlW
	JhD4QHJ5MEKcZJzCkLUTWzxlEDuoJBsQIX9uB75s90vN32ATLZmX9juQD4uiN0S6UaE20GWPqI1TN
	K5KV6tnvQ1WKKVZOcu04unx84KuRiU6qAgn2eO5rffLTd7txVe37clbp5aNF8iXc2br52Qu4+2g6y
	wQZ7ZtU6GRDYDTisih2lsPGtqCMB4RNwlst5E+7LX4wBxpiJQNhV2BR5/2WomOMgEm6wU5xNL//M5
	McskvmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OA-0000000H61a-11na;
	Fri, 11 Sep 2026 15:42:06 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53O2-0000000H5xj-44TJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:01 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4ab89cff9c7so488530b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141318; x=1789746118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RcGks6YdaJ2UkXyVy3FKEoUGQQvU1qrezFrY/Mkmuw=;
        b=0ngkeLmPQDFQNO3RvwgeSXczH7TF3VAdN0zo6gLY4tYqPij9ufz7BYtrC66Z58qcRD
         uImsWpsLZODh3/SL34E031U6REjcPtoBYLVkfVhyX3Dd5aEdM/KeO/LGxJLbYEA1hFyE
         308JV6y3Nq/EeNMAp4W3fCl8m4c4gDMh+kjrgMHhwYQIJdIaQGFCCuY/JXA+9j6rnnJl
         5QVfbFXo4hRIezEg2kgGft3r6D0v6GrjQwF6BB6UvLpY1jFnWkytTgsUHiLmqvz6WvpL
         xA6sDFmiItXZyQ9qpUwE3C0LtZx8GcqrtaVZb4FoT8RV2+xYbAIioqoKRZ49LnYShaHY
         YbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141318; x=1789746118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RcGks6YdaJ2UkXyVy3FKEoUGQQvU1qrezFrY/Mkmuw=;
        b=KoNtj6gRnBIrA5+Egiwl4b8GeTrERB5IY7f3aTbStJdFRdPexQr356hh85uCNL9qXL
         QcV0C9dcLV9PHbTWbE4j+MkewIeS1jrdf0KH13DXtI/vMrJDiQSvSU4PGlRgePIJq8MP
         RLZxNhrs0YnEgWsNDyObeB1Ycfu95XcyCj0WKKFOiyVfyFqkqP18tk2pAnRWVCxK25ZM
         yu7MAu2K8k/9QsHlEkNTahODEwhdYyxyT58bbu6rhsOMNJZNW0ISFwQUb5Adwo1pCmGk
         N6r1GRCMXXAl2d9m6WZLgNweH16HqEPg8UToT0CAVUybwBBsTd67sEQllnojaWYcLF5W
         irAg==
X-Gm-Message-State: AFuF++nfJGju1aHRMIVbB1ufQiHrWXitgLhgGZskDFiMLF3DihiJQJaF
	wIsUYSkOGNuoUG8AMCxE8KehWd7a2GefUEk9pfqtRtCtH2s5DDnIr9gkHz6chqoj674=
X-Gm-Gg: AYBFou1+L/TaFHM8eYrJw5HT+QmXbKOJJoMdZiBRCAvKuc7hdr24mUqyds4rsGGyrku
	fpyaCwOScZyoTgjpQpFJAlwgdC0udWqc04us6BJH97lVICZDDDpJ9dyVt7QLRLUZHp3/q4Tmjk1
	aRkxDliU4IXyfjdZUDIR+sBT/AjqhGwEnjpHekZvIUgdL9IL/Az+lPGHwMUTTuaMQ9SEBU4LzBY
	lDgxkD9P1obeluj9v9eALZ91Y+2f2wdfzWWK82jUYTqK1kezqlRfc5GblqqvVE6VK9pPO6vMyd9
	4Ih08QLofUtR6TacppY3WalMg4+/Wt71Vx93yH4OlFn70hFspv9Hf5XZC6V8E5ZIydnKoh7tz0x
	HrOyETT2gSSyriVANhTODyMckzvIKqUm6+XQpb8uj9PDMuQbdT2V4Zz/CM4QPML8Y3yndy6TjCQ
	ay7QoOzDVC4m+fM0RzMPvopUmjoCPkE07TGpv8EOK4avBxbhOxsb6c/884mFwqqFjpf3CSQSzSA
	dDrjRsWgL8RMvqfSd0rwNTXOBU6SLqyWiYJaN7gYFk=
X-Received: by 2002:a05:6820:c446:20b0:69d:a4f0:4191 with SMTP id 006d021491bc7-6c0b9a57494mr2410199eaf.12.1789141317982;
        Fri, 11 Sep 2026 08:41:57 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:41:57 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 02/15] sched: call into io_uring when a PF_IO_HANDOFF task blocks
Date: Fri, 11 Sep 2026 09:40:52 -0600
Message-ID: <20260911154148.644489-3-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084159_016575_DBD83CDC 
X-CRM114-Status: GOOD (  15.58  )
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

Add PF_IO_HANDOFF, set by io_uring on a task for the duration of an
inline request issue that may block, and have sched_submit_work() call
io_uring_task_sleeping() when such a task blocks. Placeholder for now.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring.h | 5 +++++
 include/linux/sched.h    | 2 +-
 kernel/fork.c            | 3 ++-
 kernel/sched/core.c      | 3 +++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/linux/io_uring.h b/include/linux/io_uring.h
index d1aa4edfc2a5..969de22c3d0f 100644
--- a/include/linux/io_uring.h
+++ b/include/linux/io_uring.h
@@ -60,4 +60,9 @@ static inline int io_uring_fork(struct task_struct *tsk)
 }
 #endif
 
+/* called from sched_submit_work() when a PF_IO_HANDOFF task blocks */
+static inline void io_uring_task_sleeping(struct task_struct *tsk)
+{
+}
+
 #endif
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a325cc..310310865029 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1816,7 +1816,7 @@ extern struct pid *cad_pid;
 						 * I am cleaning dirty pages from some other bdi. */
 #define PF_KTHREAD		0x00200000	/* I am a kernel thread */
 #define PF_RANDOMIZE		0x00400000	/* Randomize virtual address space */
-#define PF__HOLE__00800000	0x00800000
+#define PF_IO_HANDOFF		0x00800000	/* io_uring: hand identity off if the task blocks */
 #define PF__HOLE__01000000	0x01000000
 #define PF__HOLE__02000000	0x02000000
 #define PF_NO_SETAFFINITY	0x04000000	/* Userland is not allowed to meddle with cpus_mask */
diff --git a/kernel/fork.c b/kernel/fork.c
index 416758c8a3d4..510c8a9aa870 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2190,7 +2190,8 @@ __latent_entropy struct task_struct *copy_process(
 		goto bad_fork_cleanup_count;
 
 	delayacct_tsk_init(p);	/* Must remain after dup_task_struct() */
-	p->flags &= ~(PF_SUPERPRIV | PF_WQ_WORKER | PF_IDLE | PF_NO_SETAFFINITY);
+	p->flags &= ~(PF_SUPERPRIV | PF_WQ_WORKER | PF_IDLE |
+		      PF_NO_SETAFFINITY | PF_IO_HANDOFF);
 	p->flags |= PF_FORKNOEXEC;
 	INIT_LIST_HEAD(&p->children);
 	INIT_LIST_HEAD(&p->sibling);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index eeb55367c0c6..bba1c3b26b7e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -96,6 +96,7 @@
 
 #include "../workqueue_internal.h"
 #include "../../io_uring/io-wq.h"
+#include <linux/io_uring.h>
 #include <linux/thread_handoff.h>
 #include "../smpboot.h"
 #include "../locking/mutex.h"
@@ -7352,6 +7353,8 @@ static inline void sched_submit_work(struct task_struct *tsk)
 		wq_worker_sleeping(tsk);
 	else if (task_flags & PF_IO_WORKER)
 		io_wq_worker_sleeping(tsk);
+	else if (task_flags & PF_IO_HANDOFF)
+		io_uring_task_sleeping(tsk);
 
 	/*
 	 * spinlock and rwlock must not flush block requests.  This will
-- 
2.55.0


