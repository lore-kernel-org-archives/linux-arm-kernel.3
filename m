Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC0DC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26NN2voef8YBl9mHMwb0pP++w/F7eMXxYYY8spi7/jc=; b=ZfePQX3YoS6V5untHNvGXMrkb0
	OOyVNN9sq0050th9/0W1SA8uvnIKt+eK09PEyvCCLFAkXrqvlbRXKY+4QG7PCiaDRsJYfY2AjaVWw
	SO69bIyDBzFcqLWTismwroCpI9qNJglW4HAXBPo0rSBMNGrAERTCMsGSQhhVFIQgh/7zzUPBO73Gi
	/ufO3PDJNHKempGVbXDYK41tyFsq5ycbLd8c+Jcq3FKcLZoOmK+ccyOnmAdt5NoL1Jyzg5CIkwnK3
	KR73VMU1Mc5iky1S67Gs6RLCv7Y4fffI/0WN+LCDbOF2T+DqdHLhFIAEmWDIQFPuRUka9QRppu06D
	NlP94e5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OZ-0000000H6N5-30Fy;
	Fri, 11 Sep 2026 15:42:31 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53O8-0000000H601-2ee9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:05 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6b0496f4bbcso882750eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141324; x=1789746124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26NN2voef8YBl9mHMwb0pP++w/F7eMXxYYY8spi7/jc=;
        b=GHrWsvFV2j4ihHlB2CbVTrcB4Mfj5njrea4s8rnLdlwh7g2Eau0/GvHSYbL6IxOhaN
         hMft84BXpRcZUFmpNP0Stu5DvqNk4kmVhZmptX/BIPUJoQBqVb39lwck3ndCRnok3ghF
         uyiV0kPCwE5wrBQvv/VdN9Rr340IJCY5AQKBH1MCU2YjyBk43zNY4v9E1QryWfExW8g5
         bliF+deYbfXKCrJskVDiHxhTFF0hgsIW3HvJDoOltklmIrImtyMSqbRafjHKOGJh87xB
         T0uIOaiOUJv9BoembMOHpU5noLEvNlQL1i7Krfni4qCC9y+djpi57I9YjgvKHTrdq5Wv
         XzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141324; x=1789746124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26NN2voef8YBl9mHMwb0pP++w/F7eMXxYYY8spi7/jc=;
        b=JPuogH7aUb7ejchjuYvzQ/y9zCgLAWo13MXgHdpuQa+ndcvsdx81NG/ebDg4cVUU78
         OMFb8j7qgzgYYKG6gtVP4R1CDuhkrEIO6v+dX7D2EA8G0Z/+6i99r3yGKN9BxwTutD6H
         lPAtLBSudNtPOXqjEIYflkEnK4wRNEq9QVh0WsbMBx7ceXXYVVVYLSojWF8GAXYlE3RM
         FXueCcVJIeCg22UGngI1Vbw9eU0rppDGK2sn8uGzfOnW5r/kZpf6ja650niHenazJ2B4
         tL0F2cgj3xCN4SBrn95FW+iG9mV8pvUVTBM3KtHEV8P7pTBvcDISMcLp8NQRCshwioew
         h1NA==
X-Gm-Message-State: AFuF++m/oSv1IcHYss23SzxI5qW0xbyLqX8CJ5VFvcxodyVzVAMMAT4Z
	GbY2iI0oKQVAEx/soRo8N1lnzcXM9p+ghBsCPmCLh7rYq5YDwijlpsZCjtK3Y5T1vRQ=
X-Gm-Gg: AYBFou2/NmjOZz4zZmstjbUa+JUaEpE6VIKu2qWtkIP1b3PkLuzH10zcj+AqaoofMOv
	ZU9DJXcLooDXJuDvcGC/23uz9cEkGdUn/N0IyXaEg9lo9/uMUyxiQktpZjTqmKdUetla7GraGum
	irZNu/xB8YC0vD9f+Z7jbdJDLXwIHBBRpaz95fDol/qCAnZxQ3zKiC03PgkzJktF5d+jaB5j52E
	tDHLDUOptjud3PeLNX8PFh8fHp3LgO5foqy4BOs5teB24uOBsittWH2yJ6DukQtatZep7PybVmv
	b+awDxvWvnaV51FTFSxPJmAjbMQs2ukxfM5vll9UmLurtMQKOgZxPhop5laeFukSoXEIL602HfH
	vWMHShhb6ep3DDIfztuF5aP9zSn/2E34f1UXjUnEejQN52NIAPQcRAPrPq4j5ZQzuzI5iQriw+1
	twPnMsuMcxUNNOqjVw4NTivNh+t7SZp5+3crjZAEjmUqUDFz2NK/igLTCV48oEyC+Ccxfz+ECYJ
	n65XjUjCCQRvccWo1OuFNcvMUbk5t5EGfNJcO5Vwd6v
X-Received: by 2002:a05:6820:2903:b0:6ba:3635:7ffd with SMTP id 006d021491bc7-6c0bde5bcd5mr3300243eaf.64.1789141323624;
        Fri, 11 Sep 2026 08:42:03 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:02 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 06/15] io_uring: keep the tctx nodes on a list
Date: Fri, 11 Sep 2026 09:40:56 -0600
Message-ID: <20260911154148.644489-7-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084204_693522_E9B23C13 
X-CRM114-Status: GOOD (  14.79  )
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

tctx->xa is indexed by the ring pointer, which makes it a deep and
sparse xarray. Iterating it with xa_for_each() is expensive, 12 usec
for a single entry in testing. Keep the nodes on a list as well and
walk that instead, lookups by ring stay in the xarray.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h |  2 ++
 io_uring/tctx.c                | 10 ++++++----
 io_uring/tctx.h                |  2 ++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 39629ee77b91..4af3d579ead6 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -153,6 +153,8 @@ struct io_uring_task {
 	struct file			*registered_rings[IO_RINGFD_REG_MAX];
 
 	struct xarray			xa;
+	/* the nodes in ->xa, for walking without the xarray lookup cost */
+	struct list_head		node_list;
 	struct wait_queue_head		wait;
 	atomic_t			in_cancel;
 	atomic_t			inflight_tracked;
diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index 466b7300e208..737dfad4a976 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -105,6 +105,7 @@ __cold struct io_uring_task *io_uring_alloc_task_context(struct task_struct *tas
 
 	tctx->task = task;
 	xa_init(&tctx->xa);
+	INIT_LIST_HEAD(&tctx->node_list);
 	init_waitqueue_head(&tctx->wait);
 	atomic_set(&tctx->in_cancel, 0);
 	atomic_set(&tctx->inflight_tracked, 0);
@@ -135,6 +136,7 @@ static int io_tctx_install_node(struct io_ring_ctx *ctx,
 		kfree(node);
 		return ret;
 	}
+	list_add(&node->tctx_link, &tctx->node_list);
 
 	mutex_lock(&ctx->tctx_lock);
 	list_add(&node->ctx_node, &ctx->tctx_list);
@@ -227,6 +229,7 @@ __cold void io_uring_del_tctx_node(unsigned long index)
 
 	WARN_ON_ONCE(current != node->task);
 	WARN_ON_ONCE(list_empty(&node->ctx_node));
+	list_del(&node->tctx_link);
 
 	mutex_lock(&node->ctx->tctx_lock);
 	list_del(&node->ctx_node);
@@ -243,11 +246,10 @@ __cold void io_uring_del_tctx_node(unsigned long index)
 __cold void io_uring_clean_tctx(struct io_uring_task *tctx)
 {
 	struct io_wq *wq = tctx->io_wq;
-	struct io_tctx_node *node;
-	unsigned long index;
+	struct io_tctx_node *node, *tmp;
 
-	xa_for_each(&tctx->xa, index, node) {
-		io_uring_del_tctx_node(index);
+	list_for_each_entry_safe(node, tmp, &tctx->node_list, tctx_link) {
+		io_uring_del_tctx_node((unsigned long)node->ctx);
 		cond_resched();
 	}
 	if (wq) {
diff --git a/io_uring/tctx.h b/io_uring/tctx.h
index 76ad1ad4594e..9a139816ce4f 100644
--- a/io_uring/tctx.h
+++ b/io_uring/tctx.h
@@ -2,6 +2,8 @@
 
 struct io_tctx_node {
 	struct list_head	ctx_node;
+	/* on tctx->node_list, only ever touched by the owning task */
+	struct list_head	tctx_link;
 	struct task_struct	*task;
 	struct io_ring_ctx	*ctx;
 };
-- 
2.55.0


