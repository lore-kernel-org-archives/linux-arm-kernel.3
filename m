Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B8EC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vHIYEHJqme0gI4jLTtintEZJNWn/ID2vfmcQE7LyaU=; b=f7V1VaErtEYY13jl9G+FPcWBvQ
	CdUnyizv+p+M1AFxrYUP2MhfFLOwryxZdsdBx3PsOcsfFDEsWwqkO0Em7/Kz/OZ0PxyS100lqPOpu
	2fy3+sMdO+Hi1QNKB+KNvVXsv7wtSpx3UcxhUuANF8FDkglmFVylsfWWYAwCgtlsuI5DTCrHswIGq
	y7ep1V5wfkxuIHJfGTlapT3iMxe70Jd17v+zZ8KPlnVx/5epGv39KRNrZTHdPahI8D5ZFVxH+SDIb
	B0+QuTUyr3mirhoG9xmVc8cF0raIkBr+sEKTidb/EBjyZ1c2KRlCaugD2WjeSZVQy8rm8SplmLoaa
	QKqHbsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OZ-0000000H6Ln-078m;
	Fri, 11 Sep 2026 15:42:31 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OC-0000000H647-3mqt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:10 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7f48c750afcso1100809a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141327; x=1789746127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vHIYEHJqme0gI4jLTtintEZJNWn/ID2vfmcQE7LyaU=;
        b=urIWOTP7e9Fi7QqxcUIXdvhB7UHemO/H/6nVOYQR49rGc1d6dlIrcqYWhUGLispIyq
         xsFc9Bs6z14f8EVHHsfEk2LxLxLTchk2I1DIGNugCHsN9ICbwUkHKZqoPMtbGJJ6CRGE
         9SrrYMmnInN9k5rx3bH1KEmCGwtlyZZhIWzDScJgOZ9OTf1epWm37xcZ29L9gTNvJRH1
         aJQm784YXPiWFyjci/xlKPD0gVwP3QvrXzDLbqeNC+JYNYnQ7Rr4pmvK+qXVEwY79Mki
         PywcDFT+AZidLfQKcC4anLyCP+Y5h0ZI96UKuO4HH24N4WmLCDTzuG/NETapP+toscGB
         fDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141327; x=1789746127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0vHIYEHJqme0gI4jLTtintEZJNWn/ID2vfmcQE7LyaU=;
        b=LWLspmsUfqzKN0p4gnkgzZ4ZATACA4Xr6aMTcrELbG4TM3rdrWS7iQo54v8nzGOwxN
         5FraartULLAdR0CdVhZ5uo4MOgUtH7GF5LZX6lGKyR8XhAP8GV4ym53ffY2LPMq2LKXC
         Pyb6mcIQQHkYRY0h3GNZg6HLK1ayn9lMa9+L66ODfF1YnK6kLsWpcoz6ZNCeOrtQp2Qe
         pb4m9g1g2yMkvMLix4gn1EYheaUtXVSip1PNoQIw6kBJsMoOLyEvNI/L0mxJqLNdDBJl
         3NwlZPhgvkbcN80vGE4wpCoBFwhBP7lckaJSRJ5pfq96qFL/nzUXYMZeawF16cn+xJ4N
         tZTA==
X-Gm-Message-State: AFuF++k8HYkycTyhfzAXKWnnvU1WH+mQTCYoRLqKuSDyqxHJOHmbkQHK
	8J2tMFqUCAISBGIpeBIv2UMTCSyByysoEdM14B/Se/qZ/ZesJ44oM30Rvq76hJAlJrk=
X-Gm-Gg: AYBFou1RHm9ROBM3Dg3UfnRiI6Jd67pBXr+bJLxFOQ5yCkzr2vD+1guEXklucCB1voT
	6eQpxpiJCGtbh4sropBK7yBV0bws4IM3tTtfvv1h7BHZkGaj6oGxCX/G/D0NcFjIOcv7VKlmCrh
	sJYOtyPy9l2MohW1TbLMKKJRoO4hfPgidmMQS860XdKLRczXL//Wb6rLi64uq83L9fHtv+nGXNN
	VlgcdNy+OmZPVrT+PtCzMDgRQt3zvyDMb1axJ7zEtAv+5OYBe0Sof7xYKs6j5bIwgGVhNVUDx0l
	bEkycpeCcyvK525VidiMRwapAUOa0oA9opB88RCDMsxlNV0WhA1crJIhQnoFUbvPEQy6RtSIgYk
	abvMAE72FPkQqn9+RZiAllD9grQHF+oapIKGta0JuClsHRNFqqQ9J8bw/3ak9KguuRi+a4Zfq3D
	xBwFhCWYc5uFUozfv1y3Z1rvNK9U49iFsrIBz4Iyl5b3IAHQieeusMt2ujdabOnib+I9h04tCyA
	EP2ffo+5+p/op0fWmBsK7589TtmDwxMY1HqSGJT1kCh
X-Received: by 2002:a05:6820:c0d4:10b0:6be:d716:524d with SMTP id 006d021491bc7-6c0bcea90bcmr2738418eaf.64.1789141327530;
        Fri, 11 Sep 2026 08:42:07 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:06 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 09/15] io_uring: keep the submission plug on the io_submit_sqes() stack
Date: Fri, 11 Sep 2026 09:40:59 -0600
Message-ID: <20260911154148.644489-10-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084209_011539_37A9828E 
X-CRM114-Status: GOOD (  14.70  )
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

The submission plug is embedded in the ring's submit state, which only
works while a single task runs the whole batch. With a submitter
identity handoff another task finishes the batch, and the block layer
caches current->plug across sleeps. Put the plug on the stack of
io_submit_sqes() instead, it stays with the task that started it.

No functional changes in this patch.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h |  3 ++-
 io_uring/io_uring.c            | 10 +++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 50a4a0ad222f..0b0d73688b8c 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -298,7 +298,8 @@ struct io_submit_state {
 	bool			need_plug;
 	bool			cq_flush;
 	unsigned short		submit_nr;
-	struct blk_plug		plug;
+	/* the submitting task's plug, lives on its stack */
+	struct blk_plug		*plug;
 };
 
 struct io_alloc_cache {
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index b09221e239c0..100ade1eee3e 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1810,7 +1810,7 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 		if (state->need_plug && def->plug) {
 			state->plug_started = true;
 			state->need_plug = false;
-			blk_start_plug_nr_ios(&state->plug, state->submit_nr);
+			blk_start_plug_nr_ios(state->plug, state->submit_nr);
 		}
 	}
 
@@ -1938,13 +1938,14 @@ static void io_submit_state_end(struct io_ring_ctx *ctx)
 	/* flush only after queuing links as they can generate completions */
 	io_submit_flush_completions(ctx);
 	if (state->plug_started)
-		blk_finish_plug(&state->plug);
+		blk_finish_plug(state->plug);
 }
 
 /*
  * Start submission side cache.
  */
 static void io_submit_state_start(struct io_submit_state *state,
+				  struct blk_plug *plug,
 				  unsigned int max_ios)
 {
 	state->plug_started = false;
@@ -1952,6 +1953,8 @@ static void io_submit_state_start(struct io_submit_state *state,
 	state->submit_nr = max_ios;
 	/* set only head, no need to init link_last in advance */
 	state->link.head = NULL;
+	/* on the submitter's stack, the block layer caches current->plug */
+	state->plug = plug;
 }
 
 static void io_commit_sqring(struct io_ring_ctx *ctx)
@@ -2035,6 +2038,7 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 {
 	unsigned int entries;
 	unsigned int left;
+	struct blk_plug plug;
 
 	if (ctx->flags & IORING_SETUP_SQ_REWIND)
 		entries = ctx->sq_entries;
@@ -2047,7 +2051,7 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 
 	left = entries;
 	io_get_task_refs(left);
-	io_submit_state_start(&ctx->submit_state, left);
+	io_submit_state_start(&ctx->submit_state, &plug, left);
 
 	do {
 		const struct io_uring_sqe *sqe;
-- 
2.55.0


