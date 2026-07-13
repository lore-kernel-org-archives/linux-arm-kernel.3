Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0BEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9YYyee56RYzJH/7lhC6WY6QS3lP6Hx70/PxBzEZ1WM=; b=RxSXG6L7xs/lBj
	qvt2AR2CXocsJhWHvlHDdM2MxprvYNYqA/VUs39mxf+QoQTWwicAgZ4cuq4Cyfj5d8WQPxNoOIKRA
	ihA6XWszi9fr+BoF/iqEabw9kyGff2QJNZILYnDDvlTDSYBsRcBFECwjquzUAwtGrmJgx9jTkLAtv
	EXLEAErMI4bBULbAJurydPFly40hCpbeoi7Jo6mMf2trF92faNCPs6PnOr6SXc3Dy0hcTLf1PLfmK
	z5MP9Y2rYBE7xRYXvVxnpemA/dudPe+1PmExRRqM4rIj8d+etJOOuf5lqhDsVRwj285uQ17FgwKEF
	3PJS+hvZvAWlLFZNEACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTL-00000009848-2t0X;
	Mon, 13 Jul 2026 12:09:19 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTG-0000000981V-2SbB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:09:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ceae1ed204so15005365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944554; x=1784549354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9YYyee56RYzJH/7lhC6WY6QS3lP6Hx70/PxBzEZ1WM=;
        b=U5OjpUwIdPsD/yR5ujsX6iraP1C+w31OCg0ULD8GZhkvjxj3v4NpcNDe5QuLXlw9MY
         kK+Swq3/N20yhVwZYR08ENkQyUZ4tIiUWUyuue2sdUEv+YizLt6Jj1qGcqAovckInOLx
         Wf74FdWk3SfPhjxjUG5l6AyJuLNJAJCKkigrbVHZx9KnQm62LdLFsfoGChS2GFY2EPMO
         NvjRarFmrv2FRuo86IJ97J64SAkFIggVndgQLF2tgaXNB0wGm0wi6qqH10ksqdRrgFcX
         V5ZoSg0yI71/qhtmFnURRhcGSemOfQktz9k/BlkxdPTc91PUxrsw6b0aXiRiRu/DiLmS
         l1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944554; x=1784549354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9YYyee56RYzJH/7lhC6WY6QS3lP6Hx70/PxBzEZ1WM=;
        b=cJCvuECLlAAKDx7/nTGm1b7My8cRH2szeV2H2X7Hd+UvSIR0u17ECK04fwh8es34P4
         GqCig1qDnhSGKHYTCWe/+hiDYW+v/Zif07VF9cH9eP+jnyOrz2oURqwzOFSlUkiajlMT
         AmHjhsWWdWkdxkzGSH7wQ6/CWr/YhF8LrBlCqbGnnqLCUc7brPe+hgCcBrbH+u6usU/2
         lH8OXd1UA+4rFf2QnJ9AafsrT+bisZ+UVVkGyV5whdluYxKwR24xBmOQBJX7Arp3A9wV
         AdgNZZbATMLtmj8vDIDSM9wigC7Ei6ww9UGCRHrMbHi9jWDaB6k52qmxv9s5P5zvzQ8p
         V3QA==
X-Forwarded-Encrypted: i=1; AHgh+Rqk2yq2hqmoypib5tytH2N8B3cpit1XGk63yQg9wp3jZK7y27VXQ5zmX4Li1PcwQ4jRT4k+zg27bFTlr5+Gj0HT@lists.infradead.org
X-Gm-Message-State: AOJu0YxPQZQtCARWaVcpj5mj6h0V19Ct20UYtFBTY3RSxyjNlbuv6kNH
	cXnXxKkeatzBqKBunnR6gXe/DEoXhgTYpDUZcN3DbTuHJtg9ZFFXylv8
X-Gm-Gg: AfdE7cnfTkRHGeOTlppHQ0syMZgOabIgvSgTgDWQPLrEIYEsBiP8YHWDixOdVQJpmct
	gRylAxdL43jS2izgmI2JmRs9mF4B+1byg8n3Cx5BkswF9fdxGYv2ecIsGVeyyzXZ1F5SJS6JsDA
	mA4djpqidFb/JT+9Hix99Fg8C8jnohvMLIPCihQniILSp3URyyrI5paI5XdmhWbpmRT9ofdmwxs
	aU2DDuT06lHYHGrfkxz+Jk1j4gF9AjAL/x33pulpxf/S4w4jXSQxWVSmjK7BQZVTxlB9eWR3onu
	5y8AQMOEt89l30TB5u+6ICVXcJuolKoun08EQb5n+KvaWig74lhG64uGHsWOrf/KWeZdA8G+0Uy
	BVCVJU9O8rrSJNfMhvwiR6LG34Da7VjuXEOopiGvowjOa5iWJ7JGsSPWgfo35FZyyAUTp+BjpFA
	ZhRLF5xyGERq5LF2E0euAu
X-Received: by 2002:a17:90b:58f0:b0:387:e0db:bc23 with SMTP id 98e67ed59e1d1-38dc77b82bemr9015022a91.35.1783944553867;
        Mon, 13 Jul 2026 05:09:13 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:13 -0700 (PDT)
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
Subject: [PATCH v7 02/19] media: meson: vdec: Fix STREAMON / STREAMOFF race conditions and session teardown
Date: Mon, 13 Jul 2026 17:36:57 +0530
Message-ID: <20260713120840.17427-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050914_726822_39A73DE3 
X-CRM114-Status: GOOD (  22.86  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The vdec driver suffered from unsafe state transitions and race
conditions when handling concurrent STREAMON / STREAMOFF calls and
dynamic resolution change (DRC) events. Global context pointers
(e.g. core->cur_sess) and session status flags were updated outside
proper lock boundaries, allowing parallel threads to corrupt hardware
state under load.

Address these architectural stability flaws with the following changes:

1. In vdec_start_streaming(), safely encapsulate hardware occupancy
   evaluations and target session context claims within a secure mutex
   lock (core->lock). This blocks overlapping multi-threaded STREAMON
   calls from creating concurrent assignment conflicts.

2. Restructure initialization error path handlers to avoid global memory
   maps cross-contamination. Segregate buffer flushes cleanly based
   strictly on the active vb2 queue type (OUTPUT vs CAPTURE) to avoid
   incorrectly reclaiming undecoded ready blocks.

3. In vdec_stop_streaming(), introduce state-aware tracking to
   accurately identify DRC conditions. If a resolution modification
   forces a capture queue reset while the output stream is still live,
   preserve the driver's inner runtime states and bypass premature
   hardware power-off sweeps.

4. Enforce strict null-pointer safety limits inside DMA unmapping
   sequences. Explicitly clear tracking metadata entries
   (sess->vififo_vaddr = NULL) inside the VIFIFO freeing routines to
   neutralize accidental double-free risks.

Together these changes harden the driver against concurrency bugs,
eliminate memory leaks, and ensure predictable session lifecycle
management under multi threaded workloads.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260530100841.9CEBA1F00893@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 136 +++++++++++++++++-------
 1 file changed, 95 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 6ae3471155a87..d1f35fc893de1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -286,11 +286,6 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
-	if (core->cur_sess && core->cur_sess != sess) {
-		ret = -EBUSY;
-		goto bufs_done;
-	}
-
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 1;
 	else
@@ -308,9 +303,29 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	}
 
 	if (sess->status == STATUS_RUNNING ||
-	    sess->status == STATUS_NEEDS_RESUME ||
-	    sess->status == STATUS_INIT)
+	    sess->status == STATUS_NEEDS_RESUME)
+		return 0;
+
+	/*
+	 * Secure the core hardware lock before checking availability
+	 * and updating session states to prevent STREAMON race conditions.
+	 */
+	mutex_lock(&core->lock);
+	if (core->cur_sess && core->cur_sess != sess) {
+		ret = -EBUSY;
+		mutex_unlock(&core->lock);
+		goto err_unlock_no_hw;
+	}
+
+	/* If already half-initialized, do not re-initialize */
+	if (sess->status == STATUS_INIT) {
+		mutex_unlock(&core->lock);
 		return 0;
+	}
+
+	sess->status = STATUS_INIT;
+	core->cur_sess = sess;
+	mutex_unlock(&core->lock);
 
 	sess->vififo_size = SIZE_VIFIFO;
 	sess->vififo_vaddr =
@@ -319,7 +334,7 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (!sess->vififo_vaddr) {
 		dev_err(sess->core->dev, "Failed to request VIFIFO buffer\n");
 		ret = -ENOMEM;
-		goto bufs_done;
+		goto err_cleanup_session;
 	}
 
 	sess->should_stop = 0;
@@ -333,33 +348,43 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	ret = vdec_poweron(sess);
 	if (ret)
-		goto vififo_free;
+		goto err_free_vififo;
 
 	sess->sequence_cap = 0;
 	sess->sequence_out = 0;
+
 	if (vdec_codec_needs_recycle(sess))
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
 
-	sess->status = STATUS_INIT;
-	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
-vififo_free:
-	dma_free_coherent(sess->core->dev, sess->vififo_size,
-			  sess->vififo_vaddr, sess->vififo_paddr);
-bufs_done:
-	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-
+err_free_vififo:
+	if (sess->vififo_vaddr) {
+		dma_free_coherent(sess->core->dev, sess->vififo_size,
+				  sess->vififo_vaddr, sess->vififo_paddr);
+		sess->vififo_vaddr = NULL;
+		sess->vififo_paddr = 0;
+	}
+err_cleanup_session:
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 0;
 	else
 		sess->streamon_cap = 0;
 
+	mutex_lock(&core->lock);
+	if (core->cur_sess == sess)
+		core->cur_sess = NULL;
+	if (sess->status != STATUS_NEEDS_RESUME)
+		sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
+err_unlock_no_hw:
+	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+
 	return ret;
 }
 
@@ -399,30 +424,13 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 	struct amvdec_core *core = sess->core;
 	struct vb2_v4l2_buffer *buf;
+	enum amvdec_status old_status;
+	bool full_cleanup = false;
 
-	if (sess->status == STATUS_RUNNING ||
-	    sess->status == STATUS_INIT ||
-	    (sess->status == STATUS_NEEDS_RESUME &&
-	     (!sess->streamon_out || !sess->streamon_cap))) {
-		if (vdec_codec_needs_recycle(sess))
-			kthread_stop(sess->recycle_thread);
-
-		vdec_poweroff(sess);
-		vdec_free_canvas(sess);
-		dma_free_coherent(sess->core->dev, sess->vififo_size,
-				  sess->vififo_vaddr, sess->vififo_paddr);
-		vdec_reset_timestamps(sess);
-		vdec_reset_bufs_recycle(sess);
-		kfree(sess->priv);
-		sess->priv = NULL;
-		core->cur_sess = NULL;
-		sess->status = STATUS_STOPPED;
-	}
-
+	/* flush buffers to kill background workqueue thread */
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_out = 0;
 	} else {
 		/* Drain remaining refs if was still running */
@@ -431,9 +439,55 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_cap = 0;
 	}
+
+	/* Hold core lock continuously for the state and resource processing */
+	mutex_lock(&core->lock);
+	old_status = sess->status;
+
+	if (old_status == STATUS_RUNNING || old_status == STATUS_INIT ||
+	    (old_status == STATUS_NEEDS_RESUME && (!sess->streamon_out ||
+						   !sess->streamon_cap))) {
+		/*
+		 * If it's a DRC event (Capture queue streamoff only), preserve
+		 * the status
+		 */
+		if (old_status == STATUS_NEEDS_RESUME && sess->streamon_out) {
+			full_cleanup = false;
+		} else {
+			full_cleanup = true;
+			sess->status = STATUS_STOPPED;
+		}
+	}
+
+	if (full_cleanup) {
+		if ((q->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+		     !sess->streamon_out) && vdec_codec_needs_recycle(sess)) {
+			kthread_stop(sess->recycle_thread);
+		}
+
+		vdec_poweroff(sess);
+		vdec_free_canvas(sess);
+
+		if (sess->vififo_vaddr) {
+			dma_free_coherent(sess->core->dev, sess->vififo_size,
+					  sess->vififo_vaddr, sess->vififo_paddr);
+			sess->vififo_vaddr = NULL;
+			sess->vififo_paddr = 0;
+		}
+
+		vdec_reset_timestamps(sess);
+		vdec_reset_bufs_recycle(sess);
+		core->cur_sess = NULL;
+
+		kfree(sess->priv);
+		sess->priv = NULL;
+	} else {
+		if (sess->status == STATUS_NEEDS_RESUME)
+			sess->changed_format = 0;
+	}
+	mutex_unlock(&core->lock);
 }
 
 static int vdec_vb2_buf_prepare(struct vb2_buffer *vb)
-- 
2.50.1


