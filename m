Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C67DCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 09:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YD6axKKp8wDht90VyqGQ3zjwLyfLDF+g7zoFDStjFGA=; b=4/sKHpqk7/eQj1
	zRv2UbtXVRm5OsudJmDxbKXkAcAbxuDcOoXzhf5Mx9Z8kSCepaVfrN8F8TPm58a7NZGQgc4TqiJhY
	x0lZq5NtpdNpLvQin5WK6yneJQUF2YgumesgDZyIiRtpP0fSDRJHcBGi3VJD6OuyH/eSNvo4F/Y98
	JWx2cBSFVqyq3Ioallyb1opLrT29j85ddA9/jmr/Kg0g83xtEnVaW6TShyd9zFS7yZq0qqhqEEyCW
	6iaxciYxT1mC6qEkfPsWo1VN3AEFbYikLiZO53IFdHs5lY3NXgggTi62eIvTEbAh/+/rOfa2g080l
	OJmIyBAEM6owjX2UZdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGEz-00000008aa1-2FTq;
	Sat, 30 May 2026 09:44:25 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGEx-00000008aYk-1ptn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 09:44:24 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso14989455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134263; x=1780739063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD6axKKp8wDht90VyqGQ3zjwLyfLDF+g7zoFDStjFGA=;
        b=Q5zmGMY1a2/UydhlI//gP+tSnX9d/FYfo3MeAxqLvUukCpKUjVJ7woWQOOw2gZe4qM
         bSEOaFrPyVO7D161YBczYCsvaxZ5VGFjiKqKiic7uqF0JobLE3ynKFxPbbWN7zXJrALs
         Eij6dK+xrW4QzckFnBcLNKqxGqvf0vxKYgAFN5xkKoA9Y6kuU9IBIDYF3WG39+4Zi2fa
         pjfpT6thdup9zrUW0LAPlo2ljwBGOfg9SHTh5pDSt1EwQWIry0w9JEiE0bM85/aoGzSw
         ZP4nPIw8S2Y1Ah0fefkwJGTu1nykTow2hiJfrVrbJjjblFZwku1dGMH+ZwjNM+4GYLCb
         FQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134263; x=1780739063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YD6axKKp8wDht90VyqGQ3zjwLyfLDF+g7zoFDStjFGA=;
        b=lPhMsrCeWoTBkKTmgY1QfyNvS6esikrtXkC3gintNkoTP1TUhwkgRyX/Ix2/8LShc4
         cUxCIXJ7yTCLsniaIwQMTZcail/AMDyr0b22wKq9Sya6rBmDdgn//kmMVmloHdiSHEHS
         oVxKz82pZhf0bHxCQynhkyHw/RZscyLegTAOZFqTMR/ysi72GVqU/rE+r/CGkCHO87lY
         maKQPkVGo6l81krH1/fKVUg1OJtzMAGQ84LE74iUd/OXxY8q3yqxS9ZDBk58eHwbBXwh
         AW+MePGjiG4cbb93GnnKoBZZpYNeq3U5fpfHS68B3LKKIlXa38F2tVc2Nm9s/Ca8sDlE
         xICw==
X-Forwarded-Encrypted: i=1; AFNElJ/y2eMnv69Kfxo7ICq6ULPfMMVxOChkqYkfxi7jgDUgVZZq4xxx2zVoiu1YFr6h+MFW+fh/H5iCYz+gspfK5jDI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe3n9I06AeXAQES8Rh5+aSKq777skNAtO+IxFhixAtyur3cEtk
	k2+8MdllUiCdWjHiCQiU22wSPlJAR5JvxJjPUGCIWLOudt5RSjeB15Cn
X-Gm-Gg: Acq92OENeW4MuyMWf25erG8lW9bIOv9hNlbpTbmnO8OJoMj/FBiyiNOYnlx1s7oJXt5
	34Irgz74oLmZhVMtct1MKBGGaRIoe/a+GQI8tfei+gE0XAmAcd/Inyl/pvWU9dOHnfFUyDo/GY+
	/VsxaM9RqaY9hdzaVbiENkQwHyZ5SaPQWBw0tghNhGnXT64oF7JfGOE2vH+sRDuU2q0C3328636
	NC6hkm1Yn/BP9bAOFNQwCx8iI+gieC4z3kq0ED9+7ZD2BJgimRrPnZcLhZp1mFQ6loK7kS/Qck1
	QT72e5kNwe6ez0PLq8TAulUU6zahLfJWZAISedrZgGmJBSIZfHrwgwbalmhi5ohCmjWaTjyEn9Q
	6F7zOsc5KpuCINJlAVto+v/XGORTaVUO1PZO+e9URK4w7JLUiZvAeDJR48ewF0sPBfH5d5/2hQj
	9B8BoxWxLyZue962xJOUzO9Fw2pTvQafM=
X-Received: by 2002:a17:903:2305:b0:2ba:7881:948d with SMTP id d9443c01a7336-2bf367b214fmr38817185ad.1.1780134262731;
        Sat, 30 May 2026 02:44:22 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:22 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 2/8] media: meson: vdec: Fix concurrent STREAMON / STREAMOFF race conditions
Date: Sat, 30 May 2026 15:12:48 +0530
Message-ID: <20260530094326.11892-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024423_486139_5DAFF93F 
X-CRM114-Status: GOOD (  20.65  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Meson VDEC driver’s start/stop streaming paths previously
updated core->cur_sess and sess->status without synchronization,
leaving a race window between concurrent STREAMON/STREAMOFF calls.

Following change introduces proper locking discipline:

- Hold core->lock when checking or updating core->cur_sess and
  sess->status in vdec_start_streaming().
- Snapshot sess->status under the lock in vdec_stop_streaming()
  to safely evaluate hardware state after releasing the mutex.
- Ensure error unwind paths clear core->cur_sess and reset
  sess->status inside the lock.

This prevents TOCTOU races, avoids data corruption when multiple
sessions contend for the hardware, and ensures consistent session
lifecycle management.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260525104345.C8D501F00A3C@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 62 ++++++++++++++++++-------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4ffebba2341d..7233000e2232 100644
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
+		mutex_unlock(&core->lock);
+		ret = -EBUSY;
+		goto bufs_done;
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
@@ -341,8 +356,6 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
 
-	sess->status = STATUS_INIT;
-	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
@@ -350,6 +363,12 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
+	mutex_lock(&core->lock);
+	if (core->cur_sess == sess)
+		core->cur_sess = NULL;
+	sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
+
 	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
 	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
@@ -399,10 +418,23 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 	struct amvdec_core *core = sess->core;
 	struct vb2_v4l2_buffer *buf;
+	enum amvdec_status old_status;
 
-	if (sess->status == STATUS_RUNNING ||
-	    sess->status == STATUS_INIT ||
-	    (sess->status == STATUS_NEEDS_RESUME &&
+	/*
+	 * Safely snapshot the status and clear the hardware owner inside
+	 * the mutex to prevent data races with concurrent STREAMON requests.
+	 */
+	mutex_lock(&core->lock);
+	old_status = sess->status;
+	if (core->cur_sess == sess)
+		core->cur_sess = NULL;
+	sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
+
+	/* Evaluate the hardware state using our snapshot */
+	if (old_status == STATUS_RUNNING ||
+	    old_status == STATUS_INIT ||
+	    (old_status == STATUS_NEEDS_RESUME &&
 	     (!sess->streamon_out || !sess->streamon_cap))) {
 		if (vdec_codec_needs_recycle(sess))
 			kthread_stop(sess->recycle_thread);
@@ -415,8 +447,6 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		vdec_reset_bufs_recycle(sess);
 		kfree(sess->priv);
 		sess->priv = NULL;
-		core->cur_sess = NULL;
-		sess->status = STATUS_STOPPED;
 	}
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
@@ -425,8 +455,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 		sess->streamon_out = 0;
 	} else {
-		/* Drain remaining refs if was still running */
-		if (sess->status >= STATUS_RUNNING && codec_ops->drain)
+		/* Drain remaining refs if was still running using the snapshot */
+		if (old_status >= STATUS_RUNNING && codec_ops->drain)
 			codec_ops->drain(sess);
 
 		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-- 
2.50.1


