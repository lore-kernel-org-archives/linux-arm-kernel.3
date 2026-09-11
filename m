Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5D8C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mwNlgJ0Ok5ZgfwwPHL43bLSQUr6PFWje+Owka8lGt4=; b=B57InEgagV+0oTNTFCufAGtOuV
	CRoI+pMY6tCiOL1MfV4lh5qvviAFtANOziTzCDCYapMHijmKNGrNzE8I32tGEV6a3n64yTBEs+Ium
	Cy6435vyelNufXX3ayi6FUYc5ln9giDLu69OIbNmFZZmp9l/jJqH1AX5OhA9lvTjqpMPYDHXX5tLL
	bPPSKvLC+Ms5T1BNKf8L1Own3x14GrhHE2H8ZXNQIeJDqa0H7ASeKe4aLCRdLe55Dhe+5L350b6Qz
	113q3gtCeUj8jDZjp4KqSRovvdTGoxxyDeOraXuvHStzM8v52Vp55zONuVyfuP+GWTKo9bKxDtrCj
	V/KnPgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OY-0000000H6LR-39fw;
	Fri, 11 Sep 2026 15:42:30 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OB-0000000H624-1WMe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:08 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466cc9b4b63so120355fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141326; x=1789746126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1mwNlgJ0Ok5ZgfwwPHL43bLSQUr6PFWje+Owka8lGt4=;
        b=aR5Hya5mobcessyRkOjZTDaC/dOtnWfkAHasNY2LyEO9gJGafnOJOTgaRfK7NRQfsw
         Rsvpyh+9DrGcOT8WP+dKpZ9pARFWsT5a2DmfE0XkEwSA3eCSinKVTeMjWwxPZ5+wHxQW
         2ag8GyRA3pax3TpERHSL6bYKO4cdfX1KPDy9nz51ImF2sZfYI/OW4hXNiuTbzoaUxn3J
         UjkFqxIi1Lm9IW7EGxAa3mR8ZDMGV5LqPFDxCMoItV/ycXEj0dHGByYl90Uuu4d9AsWc
         6fonPdKCXT3Ba/0HjolYcmoF572U9zw72QtWa+l3QfAseNOOJVi/g0Scp8WHoea6t6vF
         EZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141326; x=1789746126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1mwNlgJ0Ok5ZgfwwPHL43bLSQUr6PFWje+Owka8lGt4=;
        b=ZP5f0SrxBgQ7IKT5uAKlIdYl55S/FQG13gWwDwri9We98yiZKDK47NuV/MJHkToYQf
         /TcusLUW6OfzTK68z3s0AwlCM9eZQ996G2RC+SDSpjcEJIJdgdVkiN3qnjPxhyy46Hve
         Oh/312FZQ+UrKZXkYkY+KgDVEDxev5cSLIopwjIUkDkbA0y8OSerL5UWLCLCX/qRi8aa
         IYQW8PHt+g6dAnEewaq3z0fi1DSbVMx8b4ohrClYG7oftlBfFZvJenCtXaodG6Yp6gam
         iGGIhiFLwxIYDkbHJevFBIXF70rIGo8qepq8cm5xW9v7Dvk8r7tZagIJiPu7UqbMeOj6
         eLPw==
X-Gm-Message-State: AFuF++lvYKe3LmXgRiB+yXNMrZMaPd5NxEHeLJ0d6HvE4+bA/Eswfvjg
	9yeXjpd4khszUwruGphu4Om+wTwm1cH+Pri2gqDnKB+AasRmAfwUp1iODbsVdQGjD7+CdLZdDdD
	cv0tJSpQ=
X-Gm-Gg: AYBFou0gmX2BTLX6/Hc8CJu5doJ2Rgi/y6wl0hrATxYLC1WbTfRPHNT5Rzk0J3CdvdV
	HRczCYfWUz5TVoB2zuHVL7CdfbdjbuQxGb6/e36HOYnva7Z61ZK1tl3cWeRij3nJZmY5oxHJCRN
	ISXswCf7sHYcs354eDgglORUn/EaTxtorrFJBI74dxs9wlZXw+/Ale6XEJe8esS2oUGDZftIdv4
	o6h8hf35AUaiq2kQfYFhddiFkHoIcRqJEYbgfZeUHBnGAuIJrDTRaB7p6pIgD9By9zqtNNuNmbu
	1590MMC2oFrcnES5OwadPnch65v7oRe+SkXno7UWluslVKTUsi1j5ioaqEt/iVfEql8Q1rJnx9A
	wjchC1jPzR04SummFAxWKKG25nkOTn+nja8psesIeZV/ozk1pDI3pmquk0PCe+LS5ZKHGhsISNZ
	37x6taYQ87TTEJpP9igqkx2oMRLX7eBEjD3HN9x3+O7G/7LqBAMw6snqnm+3h/1yDCBKagTgo0s
	HmlAXqfaUSSAQloD/vXbdarawiRJ+WQ09UxG74I+74=
X-Received: by 2002:a05:6820:c0d9:20b0:6b5:ec3f:497d with SMTP id 006d021491bc7-6c0a8a27f9dmr1999129eaf.24.1789141326313;
        Fri, 11 Sep 2026 08:42:06 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:05 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/15] io_uring: split io_uring_enter() and io_submit_sqes() into helpers
Date: Fri, 11 Sep 2026 09:40:58 -0600
Message-ID: <20260911154148.644489-9-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084207_501774_7F1B4244 
X-CRM114-Status: GOOD (  22.22  )
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

Move the tail of io_submit_sqes() into io_submit_sqes_end(), and split
the IORING_ENTER_GETEVENTS handling out of io_uring_enter() into
io_uring_enter_finish() and io_uring_getevents(). A later patch needs
to resume io_uring_enter() from a different task than the one that
started the syscall.

No functional changes in this patch.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 179 ++++++++++++++++++++++++++++----------------
 1 file changed, 116 insertions(+), 63 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 61053421d809..b09221e239c0 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2010,12 +2010,31 @@ static bool io_get_sqe(struct io_ring_ctx *ctx, const struct io_uring_sqe **sqe)
 	return true;
 }
 
+static int io_submit_sqes_end(struct io_ring_ctx *ctx, unsigned int entries,
+			      unsigned int left)
+	__must_hold(&ctx->uring_lock)
+{
+	int ret = entries;
+
+	if (unlikely(left)) {
+		ret -= left;
+		/* try again if it submitted nothing and can't allocate a req */
+		if (!ret && io_req_cache_empty(ctx))
+			ret = -EAGAIN;
+		current->io_uring->cached_refs += left;
+	}
+
+	io_submit_state_end(ctx);
+	 /* Commit SQ ring head once we've consumed and submitted all SQEs */
+	io_commit_sqring(ctx);
+	return ret;
+}
+
 int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 	__must_hold(&ctx->uring_lock)
 {
 	unsigned int entries;
 	unsigned int left;
-	int ret;
 
 	if (ctx->flags & IORING_SETUP_SQ_REWIND)
 		entries = ctx->sq_entries;
@@ -2026,7 +2045,7 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 	if (unlikely(!entries))
 		return 0;
 
-	ret = left = entries;
+	left = entries;
 	io_get_task_refs(left);
 	io_submit_state_start(&ctx->submit_state, left);
 
@@ -2052,18 +2071,7 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 		}
 	} while (--left);
 
-	if (unlikely(left)) {
-		ret -= left;
-		/* try again if it submitted nothing and can't allocate a req */
-		if (!ret && io_req_cache_empty(ctx))
-			ret = -EAGAIN;
-		current->io_uring->cached_refs += left;
-	}
-
-	io_submit_state_end(ctx);
-	 /* Commit SQ ring head once we've consumed and submitted all SQEs */
-	io_commit_sqring(ctx);
-	return ret;
+	return io_submit_sqes_end(ctx, entries, left);
 }
 
 static void io_rings_free(struct io_ring_ctx *ctx)
@@ -2583,6 +2591,94 @@ struct file *io_uring_ctx_get_file(unsigned int fd, bool registered)
 }
 
 
+static int io_iopoll_getevents(struct io_ring_ctx *ctx, u32 min_complete,
+			       u32 flags, const void __user *argp, size_t argsz)
+	__must_hold(&ctx->uring_lock)
+{
+	int ret;
+
+	ret = io_validate_ext_arg(ctx, flags, argp, argsz);
+	if (likely(!ret))
+		return io_iopoll_check(ctx, min_complete);
+	return ret;
+}
+
+static int io_wait_getevents(struct io_ring_ctx *ctx, u32 min_complete,
+			     u32 flags, const void __user *argp, size_t argsz)
+{
+	struct ext_arg ext_arg = { .argsz = argsz };
+	int ret;
+
+	ret = io_get_ext_arg(ctx, flags, argp, &ext_arg);
+	if (likely(!ret))
+		return io_cqring_wait(ctx, min_complete, flags, &ext_arg);
+	return ret;
+}
+
+static int io_getevents_ret(struct io_ring_ctx *ctx, int ret, int ret2)
+{
+	if (ret)
+		return ret;
+	/*
+	 * EBADR indicates that one or more CQE were dropped. Once the user has
+	 * been informed we can clear the bit as they are obviously ok with
+	 * those drops.
+	 */
+	if (unlikely(ret2 == -EBADR))
+		clear_bit(IO_CHECK_CQ_DROPPED_BIT, &ctx->check_cq);
+	return ret2;
+}
+
+static int io_uring_getevents(struct io_ring_ctx *ctx, int ret,
+			      u32 min_complete, u32 flags,
+			      const void __user *argp, size_t argsz)
+{
+	int ret2;
+
+	if (ctx->int_flags & IO_RING_F_SYSCALL_IOPOLL) {
+		/*
+		 * We disallow the app entering submit/complete with polling,
+		 * but we still need to lock the ring to prevent racing with
+		 * polled issue that got punted to a workqueue.
+		 */
+		mutex_lock(&ctx->uring_lock);
+		ret2 = io_iopoll_getevents(ctx, min_complete, flags, argp,
+					   argsz);
+		mutex_unlock(&ctx->uring_lock);
+	} else {
+		ret2 = io_wait_getevents(ctx, min_complete, flags, argp, argsz);
+	}
+	return io_getevents_ret(ctx, ret, ret2);
+}
+
+/* Finish an io_uring_enter() call that submitted and holds the uring_lock */
+static int io_uring_enter_finish(struct io_ring_ctx *ctx, int ret, u32 min_complete,
+			  u32 flags, const void __user *argp, size_t argsz)
+{
+	int ret2;
+
+	if (!(flags & IORING_ENTER_GETEVENTS)) {
+		mutex_unlock(&ctx->uring_lock);
+		return ret;
+	}
+
+	if (ctx->int_flags & IO_RING_F_SYSCALL_IOPOLL) {
+		ret2 = io_iopoll_getevents(ctx, min_complete, flags, argp,
+					   argsz);
+		mutex_unlock(&ctx->uring_lock);
+	} else {
+		/*
+		 * Ignore errors, we'll soon call io_cqring_wait() and it
+		 * should handle ownership problems if any.
+		 */
+		if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
+			(void)io_run_local_work_locked(ctx, min_complete);
+		mutex_unlock(&ctx->uring_lock);
+		ret2 = io_wait_getevents(ctx, min_complete, flags, argp, argsz);
+	}
+	return io_getevents_ret(ctx, ret, ret2);
+}
+
 SYSCALL_DEFINE6(io_uring_enter, unsigned int, fd, u32, to_submit,
 		u32, min_complete, u32, flags, const void __user *, argp,
 		size_t, argsz)
@@ -2639,57 +2735,14 @@ SYSCALL_DEFINE6(io_uring_enter, unsigned int, fd, u32, to_submit,
 			mutex_unlock(&ctx->uring_lock);
 			goto out;
 		}
-		if (flags & IORING_ENTER_GETEVENTS) {
-			if (ctx->int_flags & IO_RING_F_SYSCALL_IOPOLL)
-				goto iopoll_locked;
-			/*
-			 * Ignore errors, we'll soon call io_cqring_wait() and
-			 * it should handle ownership problems if any.
-			 */
-			if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
-				(void)io_run_local_work_locked(ctx, min_complete);
-		}
-		mutex_unlock(&ctx->uring_lock);
+		ret = io_uring_enter_finish(ctx, ret, min_complete, flags,
+					    argp, argsz);
+		goto out;
 	}
 
-	if (flags & IORING_ENTER_GETEVENTS) {
-		int ret2;
-
-		if (ctx->int_flags & IO_RING_F_SYSCALL_IOPOLL) {
-			/*
-			 * We disallow the app entering submit/complete with
-			 * polling, but we still need to lock the ring to
-			 * prevent racing with polled issue that got punted to
-			 * a workqueue.
-			 */
-			mutex_lock(&ctx->uring_lock);
-iopoll_locked:
-			ret2 = io_validate_ext_arg(ctx, flags, argp, argsz);
-			if (likely(!ret2))
-				ret2 = io_iopoll_check(ctx, min_complete);
-			mutex_unlock(&ctx->uring_lock);
-		} else {
-			struct ext_arg ext_arg = { .argsz = argsz };
-
-			ret2 = io_get_ext_arg(ctx, flags, argp, &ext_arg);
-			if (likely(!ret2))
-				ret2 = io_cqring_wait(ctx, min_complete, flags,
-						      &ext_arg);
-		}
-
-		if (!ret) {
-			ret = ret2;
-
-			/*
-			 * EBADR indicates that one or more CQE were dropped.
-			 * Once the user has been informed we can clear the bit
-			 * as they are obviously ok with those drops.
-			 */
-			if (unlikely(ret2 == -EBADR))
-				clear_bit(IO_CHECK_CQ_DROPPED_BIT,
-					  &ctx->check_cq);
-		}
-	}
+	if (flags & IORING_ENTER_GETEVENTS)
+		ret = io_uring_getevents(ctx, ret, min_complete, flags, argp,
+					 argsz);
 out:
 	if (!(flags & IORING_ENTER_REGISTERED_RING))
 		fput(file);
-- 
2.55.0


