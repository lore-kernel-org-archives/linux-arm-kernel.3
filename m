Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8B4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M52KCQrGH2efvkkWtyT/9Kw89ZxEs+AuVcYa54xJZ9k=; b=lZG+y+vAvyCQQM
	EAxWuTO4+VZ/R7/xz8hd/IPPXHkMWzsOhxcSxEB/tdLZrlKvSO/xmDbFBTRdugK8RnfXuBhW5mn7j
	5mnjRm/gJkPev1or87lhP674qWAWjM/ZRiBKiIlELaKy8gRgAXRKYJnddu7z+U7Fkkm3xC6au5P7I
	bATmQskM+mCqn/iOJ/+wDW2hVyZ/gb/fZ/e9xrWc7kSPNoisg5qZh8U/aW/Kq9ow+yietM1Uwt5ZA
	L0wLYCEl9iMgP4PJcCRCehl871Fdhwi2gYbKfN06TRX0yuRSk2mGFaKF/PDwfqCLL5v8X7EInGHBP
	TOHkonOnIKlNNWCumOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFUM-000000098gn-1FQ8;
	Mon, 13 Jul 2026 12:10:22 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFUJ-000000098em-2yKe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:10:21 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2456432a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944619; x=1784549419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M52KCQrGH2efvkkWtyT/9Kw89ZxEs+AuVcYa54xJZ9k=;
        b=S2sGS9nW3ki7m7QiQsAv0XG6u0BfJcrxQGRZ0rf2i1ENlYpOlH9q3Tk9nPhtZWUB4n
         BkY4q3OLbNOjYzGz2wZ1hj4YDtNJDPL5CETHeRzvpnDPkucnwGRUiaguHLiFJF7jJwAj
         cdvc+CavEVghjro8YNYE77wYPKcN01/oFNB894BdKzCXwLdaYm4vXl3IvoB2Vk99CMBB
         0a1JzvLG67CLv3/RxvgHibJA2ohfkJx9uVvrwObQ+FeWeJxdL3aeB13fW4hKdocHTw5l
         V0Q4pdcLf0yxu+ot35uEktnpBLe3hILNrknx688XmMcW8FoiRHui15yad4wXVIhcUEbI
         p/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944619; x=1784549419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M52KCQrGH2efvkkWtyT/9Kw89ZxEs+AuVcYa54xJZ9k=;
        b=dBq4kNlP8SESMFjhz5XCThp3mG3M7NI5KeP0Ol5UoXbon6/ilErrfur7u0oNt2QdLq
         qmbU7U+RVdauXwKPw3mQaCutBbSb4bjdPpOiMC1GU0NSEGPWmGoeC4tHIP0H+zjAQSxS
         1uWER8i7aJARBRKimaXPSRkWeoIflYpuSrik04KUGV7VzXMjV6nUBxffy+3MdbGM5M5r
         qrw48bAvst4aw6h8URH4M0UaEWvoBeIYCuxs4tp8pneu/W/H2c2cOeElXLk1WV9RYp44
         HTuDxqTJ9BJA9Q3onLEklZFBXWmHS5w4Q9gh7lv6KG64TM1G8qrhNlXYg23ojmB9ZKwT
         4gtA==
X-Forwarded-Encrypted: i=1; AHgh+RqUe0TKeVbRrKf7oCUNdTMjWEf289Ds4yHGXdt60E2ODl4fGrLh9oGXiHSJ+wI6QLJIixUrryEPQ5CNPu9+K/en@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxm6KJLs9sbt4IiHvON1l/gcEvfQb8xdgeFzUjuxATrDcrpQUu
	kGCnRiA15rD1ij5moqvYh+MQ6JImRQPetUM/bS1hSY6oI2gYkdid538O
X-Gm-Gg: AfdE7ckXYbTusyltXie1XR3aY270trCXYaf5Q1z1C2OTQ8HZoetJhlkGZvl3KW92q0W
	l0KQPSuAftC7c7p9dSA+5K5R0lS1u+wTvQiJYQ7Yrj2BiRcA3/ORsgayPgCrRWm3IpexG5S6/b+
	tbMfEPQ8mGoPeeeDyjwc2IV2rXIXOmN4GARhpMDY6pIX5MAW+lkKe0vjdrMurymzc7CB5xOSQfB
	GaVU+zUwVNClupwPf5tD7JWpOnxgV0rpzZ9ILNa7YlvCN+VGeZF3HWC/Bk+jpLY6RkZDzBzpBgC
	XXDCBTz9aWMk/4Di7B9xLSCbZkoHK2gDUKCf5nj3EgSP6o9xhLKU1mEqi4ODoiaIlDQOqTsInQC
	7z2dHVtNRcYj4vLuKtyjmYMUCw2vHjYEqh9HPnp+7a8mNibOQp9l+jiudNHbyl8i0L4yb15/Y09
	6cVgCOfX48fQ==
X-Received: by 2002:a17:90b:58cc:b0:380:540:d499 with SMTP id 98e67ed59e1d1-38dc78224a5mr7942822a91.6.1783944618568;
        Mon, 13 Jul 2026 05:10:18 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:17 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 08/19] media: meson: vdec: Fix concurrent execution races and unsafe teardown
Date: Mon, 13 Jul 2026 17:37:03 +0530
Message-ID: <20260713120840.17427-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051019_754793_6D5A9DB3 
X-CRM114-Status: GOOD (  22.33  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Address data races involving 'should_stop' and prevent multi-session
hardware clobbering by enforcing atomic tracking and strict owner
validation during device teardown.

The esparser work queue reads 'sess->should_stop' outside of critical
regions without serialization primitives, risking data races or visibility
delays. Furthermore, vdec_close() and vdec_stop_streaming() blindly
shut down hardware components (via poweroff and canvas frees) and nullify
'core->cur_sess' without confirming that the executing session actually
owns the active hardware context. In multi-session scenarios, this allows
a closing inactive session to inadvertently break a running session.

To fix these synchronization and lifecycle issues with the following
changes use thread-safe flagging: Wrap reads and writes of
'sess->should_stop' in READ_ONCE() and WRITE_ONCE() to prevent compiler
optimizations from caching the condition variables across scheduling
boundaries and optimizations across workqueue execution threads.

Also safe context releasing: transition 'core->cur_sess' pointer
clearings to use smp_store_release(). This ensures all prior internal
memory structures are entirely flushed and visible to other execution
cores.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c |  2 +-
 drivers/staging/media/meson/vdec/vdec.c     | 88 ++++++++++++++-------
 2 files changed, 59 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index e5d3d817b9b2b..959673742e699 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -379,7 +379,7 @@ void esparser_queue_all_src(struct work_struct *work)
 
 		scoped_guard(mutex, &sess->lock) {
 			/* Safe atomic tracking check: exit loop if session is shutting down */
-			if (sess->should_stop)
+			if (READ_ONCE(sess->should_stop))
 				return;
 
 			/* Queue completely empty: exit work loop cleanly */
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 6fe9722577179..83a9b1238972a 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -287,9 +287,13 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct amvdec_session *sess = vb2_get_drv_priv(q);
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 	struct amvdec_core *core = sess->core;
+	struct device *dev = core->dev_dec;
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
+	/* Reset workqueue loop shutdown signal to allow streaming */
+	WRITE_ONCE(sess->should_stop, 0);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 1;
 	else
@@ -336,7 +340,7 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		dma_alloc_coherent(sess->core->dev, sess->vififo_size,
 				   &sess->vififo_paddr, GFP_KERNEL);
 	if (!sess->vififo_vaddr) {
-		dev_err(sess->core->dev, "Failed to request VIFIFO buffer\n");
+		dev_err(dev, "Failed to request VIFIFO buffer\n");
 		ret = -ENOMEM;
 		goto err_cleanup_session;
 	}
@@ -388,10 +392,12 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		sess->streamon_cap = 0;
 
 	mutex_lock(&core->lock);
-	if (core->cur_sess == sess)
-		core->cur_sess = NULL;
-	if (sess->status != STATUS_NEEDS_RESUME)
-		sess->status = STATUS_STOPPED;
+	if (core->cur_sess == sess) {
+		/* Safely clear hardware ownership since we were confirmed as the owner */
+		smp_store_release(&core->cur_sess, NULL);
+		if (sess->status != STATUS_NEEDS_RESUME)
+			sess->status = STATUS_STOPPED;
+	}
 	mutex_unlock(&core->lock);
 err_unlock_no_hw:
 	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
@@ -441,6 +447,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	enum amvdec_status old_status;
 	bool full_cleanup = false;
 
+	/* Signal workqueue loop to abort instantly */
+	WRITE_ONCE(sess->should_stop, 1);
+
 	/* flush buffers to kill background workqueue thread */
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
@@ -493,26 +502,33 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		cancel_work_sync(&sess->esparser_queue_work);
 		mutex_lock(&core->lock);
 
-		vdec_poweroff(sess);
-		vdec_free_canvas(sess);
+		if (core->cur_sess == sess) {
+			vdec_poweroff(sess);
+			vdec_free_canvas(sess);
+
+			if (sess->vififo_vaddr) {
+				dma_free_coherent(sess->core->dev,
+						  sess->vififo_size,
+						  sess->vififo_vaddr,
+						  sess->vififo_paddr);
+				sess->vififo_vaddr = NULL;
+				sess->vififo_paddr = 0;
+			}
 
-		if (sess->vififo_vaddr) {
-			dma_free_coherent(sess->core->dev, sess->vififo_size,
-					  sess->vififo_vaddr, sess->vififo_paddr);
-			sess->vififo_vaddr = NULL;
-			sess->vififo_paddr = 0;
-		}
+			vdec_reset_timestamps(sess);
+			vdec_reset_bufs_recycle(sess);
 
-		vdec_reset_timestamps(sess);
-		vdec_reset_bufs_recycle(sess);
-		core->cur_sess = NULL;
+			kfree(sess->priv);
+			sess->priv = NULL;
 
-		kfree(sess->priv);
-		sess->priv = NULL;
+			/* Safely clear hardware ownership since we were confirmed as the owner */
+			smp_store_release(&core->cur_sess, NULL);
+		}
 	} else {
 		if (sess->status == STATUS_NEEDS_RESUME)
 			sess->changed_format = 0;
 	}
+
 	mutex_unlock(&core->lock);
 }
 
@@ -802,7 +818,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 	if (cmd->cmd == V4L2_DEC_CMD_START) {
 		v4l2_m2m_clear_state(sess->m2m_ctx);
-		sess->should_stop = 0;
+		WRITE_ONCE(sess->should_stop, 0);
 		return 0;
 	}
 
@@ -812,7 +828,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 	dev_dbg(dev, "Received V4L2_DEC_CMD_STOP\n");
 
-	sess->should_stop = 1;
+	WRITE_ONCE(sess->should_stop, 1);
 
 	v4l2_m2m_mark_stopped(sess->m2m_ctx);
 
@@ -998,6 +1014,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct amvdec_core *core = sess->core;
 
+	/* Signal workqueue loop to abort instantly */
+	WRITE_ONCE(sess->should_stop, 1);
+
 	/* Synchronize and flush pending hardware interrupt service routines */
 	synchronize_irq(core->vdec_irq);
 	/* Ensure esparser ISR finishes executing */
@@ -1012,21 +1031,30 @@ static int vdec_close(struct file *file)
 
 	mutex_lock(&core->lock);
 
-	vdec_poweroff(sess);
-	vdec_free_canvas(sess);
-	core->cur_sess = NULL;
+	if (core->cur_sess == sess) {
+		vdec_poweroff(sess);
+		vdec_free_canvas(sess);
 
-	if (sess->vififo_vaddr) {
-		dma_free_coherent(core->dev, sess->vififo_size,
-				  sess->vififo_vaddr, sess->vififo_paddr);
-		sess->vififo_vaddr = NULL;
-		sess->vififo_paddr = 0;
+		if (sess->vififo_vaddr) {
+			dma_free_coherent(core->dev,
+					  sess->vififo_size,
+					  sess->vififo_vaddr,
+					  sess->vififo_paddr);
+			sess->vififo_vaddr = NULL;
+			sess->vififo_paddr = 0;
+		}
+		vdec_reset_timestamps(sess);
+		vdec_reset_bufs_recycle(sess);
 	}
-	vdec_reset_timestamps(sess);
-	vdec_reset_bufs_recycle(sess);
+
 	kfree(sess->priv);
 	sess->priv = NULL;
 
+	/* Unconditionally set our local status to stopped */
+	sess->status = STATUS_STOPPED;
+	/* Safely clear hardware ownership since we were confirmed as the owner */
+	smp_store_release(&core->cur_sess, NULL);
+
 	mutex_unlock(&core->lock);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-- 
2.50.1


