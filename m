Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D46C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Pn+IHk1Sk762XTDH7lvSm6CZZGNFHunM58OnD0jYLk=; b=nmEG6J8jxWm9Li
	s/yI76M4nrBnN3THmkUeZBys9K5TGHL7JWclbiogH5Vb8sa2DRSgJClh04w0N3AnTluODE676ibeu
	62Q1WaaJBAo5nSZ60/LGzZCFanr1vav6SApdhW//9aynAzHPDV29qJ7eP9A6l6HP+rKha/GVVYcTR
	mnjFUbSDtytYKvVj2K0eQCu25DrxGpCiZXgZhym/B/nawbwjjYllr4BaDZ7SZ1P+fpTTfghbZ9Tp0
	kGTiNyuAMoBCoos06uL4RBN6l5NQFMhjIYSmIPpSMhz0LPODvgmvKADx4I3QhRfnTRRIPPhZqqOTt
	FrDxQYU6uttVl+7S1YhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTV-000000098AP-3ZpB;
	Mon, 13 Jul 2026 12:09:29 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTR-0000000987y-3k8b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:09:29 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-384c94c9414so2757318a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944565; x=1784549365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Pn+IHk1Sk762XTDH7lvSm6CZZGNFHunM58OnD0jYLk=;
        b=dW1uH0wErn3q2OLj6PzywZHMVn0xBvKOc+W6fjWBW/fQAuthn67Rc0DIja5PAUFlja
         g0+SFct0cjTEyO9ffY7IMX9e51p/rB/xe8EN8zO5+MU2r0JcSbTy9aWsqAw7bBQ43kgi
         eGkjuN51eyfBan89xeENzP5ydI+pSka3gLolvOqVmqIB+70QDCwbecfE8rbvMoel8IhY
         44lZuTaK32GXbu7wbXC+HJHmO0FTqOQSrkcWw8ZbMHnBxaceVjN///1liUN/wzdj31qS
         vRBJxyHxAsZTPCknCb8pFKWj8GhAAgI1Y6Vndg+SgcIyCqzz98/mPfzGw25+QwKhkIY6
         k6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944565; x=1784549365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Pn+IHk1Sk762XTDH7lvSm6CZZGNFHunM58OnD0jYLk=;
        b=gyncB/w0s6AsmUVZzwsXBavuEQ0lNsLm+45SuEbSLB5k0b7g3hSGB4hPkcGBMK1ZpR
         6GuetnT2h5bP6/djIe8/p1hVVOSXVGaklBVdtlPQdOqZZM2eCQ5430YTqrMQcmXiohRf
         +f+Qmc8RglTXZmnGrjzRmhvnqc/FIulUe5C1umR52tPb5e19A6FX6vhqTue7ymfSzbZ5
         2Y29TrrtN+RcPzAnNmh3X7DrME+ofWI7pHVSn+0+Rr4pqjMRsYm5RQ6rQNWUYD2y0VNW
         dIHVEmZN/d8oau2Oy+mK3eVCQuYlpxfMf21YnETzdBEP1B2rCw3OJ9Sdq5hjNuzvFsh7
         ZVQg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5WRvxJAin1okn/Gk39X5fM4u8ZkPuub86Poaj1M6MJvnOLFpEVvEP/mNHok9C6UG0VulSzp/KEtvf3u0rtstk@lists.infradead.org
X-Gm-Message-State: AOJu0YxfOPI/uDI+MwpqWnpGNpItaS5cRAw1Wvvj0EPPW7FssG/DKg9O
	QgjFwUMciSpr9IQlaXpwsuML8foQBDB3MBlXdWZEGf1Fp1U+2geFVPDF
X-Gm-Gg: AfdE7cnC/rsw3T3SqTMBKii6v0T87glRxGwk3HSV2KnOAcLONMxWm78huIzvY62I96n
	VsUHjH1V7J2FlCONL0HH7jTUJ9X8R8HNwIwKY6tz8SMk8zmE1VIiiucFkwCnZKNL8lInHdJH7Yw
	RSn5f/2QN5tyrwRrn8oMxbo7YcDy3T3B3lRDwd5QN0cMnjcNhFVctv5vB4m+Y9E3pLeG+zo9FFQ
	gI6izwmp8TwuS4AOK0lCZGThuETDTf3sE8Bwl8pQ18fzyljujVz3x57L212/D5JVcGdsLwexWWN
	KLKOnnRFjm2NhK5sOcUQM+1XBqbScDJcgdZrRGS/FfwxMn7g8M2xbXJzqs3oO3Q7P1vZe4MFELj
	Putyx4K4iR8p/0paKFVwflBWd63v4a3jSDcEC2O1Et36D0LGCke/GRgS/6z6YsQzIF2JjxOUL3V
	vim+3dzREFNYvkLk7Ln1XR
X-Received: by 2002:a17:90b:2884:b0:387:e0db:bc22 with SMTP id 98e67ed59e1d1-38dc77b3846mr9100073a91.34.1783944564932;
        Mon, 13 Jul 2026 05:09:24 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:24 -0700 (PDT)
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
Subject: [PATCH v7 03/19] media: meson: vdec: Fix lifecycle leaks and race conditions in recycle_thread
Date: Mon, 13 Jul 2026 17:36:58 +0530
Message-ID: <20260713120840.17427-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050925_939717_B5969312 
X-CRM114-Status: GOOD (  22.07  )
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

Validate the return status of kthread_run() during decoder recycling
thread initialization to prevent memory leaks, and enforce robust state
checking before invoking kthread_stop() to prevent kernel panics.

If the system operates under severe memory constraints, the previous
implementation silently accepted error pointers returned by a failed
kthread_run() operation. Attempting to pass these invalid error pointers
downstream to kthread_stop() during streaming stop or application
teardown routines triggered instant kernel panics.

Furthermore, when thread initialization failed, the lack of an explicit
unwinding path leaked the session's private context (sess->priv) and its
associated firmware memory block allocations. Because sess->status was
never transitioned to STATUS_INIT, any subsequent call to stop streaming
or close the driver file node failed its state validation checks,
permanently orphaning active platform DMA assets and codec parameters.

Fix these thread lifetime and memory leak bugs via the following:

1. In vdec_start_streaming(), add an explicit IS_ERR() verification
   barrier immediately following the recycling kthread launch. If thread
   creation fails, capture the error code via PTR_ERR(), clear the
   dangling pointer tracking entry to NULL, and jump to a newly added
   'err_poweroff' label to unwind hardware settings and clear out
   allocated structural components cleanly.

2. In vdec_stop_streaming(), protect the teardown execution track by
   wrapping the kthread_stop() invocation inside a safe !IS_ERR_OR_NULL()
   conditional block to ensure the target thread structure actually exists
   in system memory before stopping it.

3. In vdec_close(), cleanly wind down and terminate any lingering
   recycling threads at the absolute entry boundary of the routine
   before flushing data framework contexts and releasing the file
   descriptor matrices to user space.

Together, these changes ensure predictable driver behavior, prevent
kernel panics during low-memory conditions, and guarantee that memory
and DMA assets are fully reclaimed during teardown.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 48 +++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index d1f35fc893de1..7fc73d5cdebbf 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -32,6 +32,10 @@ struct dummy_buf {
 /* 16 MiB for parsed bitstream swap exchange */
 #define SIZE_VIFIFO SZ_16M
 
+static void vdec_free_canvas(struct amvdec_session *sess);
+static void vdec_reset_timestamps(struct amvdec_session *sess);
+static void vdec_reset_bufs_recycle(struct amvdec_session *sess);
+
 static u32 get_output_size(u32 width, u32 height)
 {
 	return ALIGN(width * height, SZ_64K);
@@ -353,13 +357,23 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	sess->sequence_cap = 0;
 	sess->sequence_out = 0;
 
-	if (vdec_codec_needs_recycle(sess))
+	if (vdec_codec_needs_recycle(sess) && !sess->recycle_thread) {
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
-
+		if (IS_ERR(sess->recycle_thread)) {
+			ret = PTR_ERR(sess->recycle_thread);
+			sess->recycle_thread = NULL;
+			goto err_poweroff;
+		}
+	}
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
+err_poweroff:
+	vdec_poweroff(sess);
+	vdec_free_canvas(sess);
+	vdec_reset_timestamps(sess);
+	vdec_reset_bufs_recycle(sess);
 err_free_vififo:
 	if (sess->vififo_vaddr) {
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
@@ -464,7 +478,10 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	if (full_cleanup) {
 		if ((q->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
 		     !sess->streamon_out) && vdec_codec_needs_recycle(sess)) {
-			kthread_stop(sess->recycle_thread);
+			if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
+				kthread_stop(sess->recycle_thread);
+				sess->recycle_thread = NULL;
+			}
 		}
 
 		vdec_poweroff(sess);
@@ -970,6 +987,31 @@ static int vdec_open(struct file *file)
 static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
+	struct amvdec_core *core = sess->core;
+
+	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
+		kthread_stop(sess->recycle_thread);
+		sess->recycle_thread = NULL;
+	}
+
+	mutex_lock(&core->lock);
+
+	vdec_poweroff(sess);
+	vdec_free_canvas(sess);
+	core->cur_sess = NULL;
+
+	if (sess->vififo_vaddr) {
+		dma_free_coherent(core->dev, sess->vififo_size,
+				  sess->vififo_vaddr, sess->vififo_paddr);
+		sess->vififo_vaddr = NULL;
+		sess->vififo_paddr = 0;
+	}
+	vdec_reset_timestamps(sess);
+	vdec_reset_bufs_recycle(sess);
+	kfree(sess->priv);
+	sess->priv = NULL;
+
+	mutex_unlock(&core->lock);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_fh_del(&sess->fh, file);
-- 
2.50.1


