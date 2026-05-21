Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21E5CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NPvLu4dxOkoKdNg46+oSXq3CipWU7w/mHnMaydoddU=; b=PDgdcMTjXtzKZj
	t12+8cK84FKZOVetMGWu3DS0J+5R5RCjFci90usRhDcZ6oOQk09c3ujJZqDi5pdIixQNJD7z3WcJF
	uisZH2ohyAL8+7N5FipEoibvrU2Qe0uu4JDHzuB+LdowhnFp5/jy9jZjWXHbczggvjYPIUhdP6fGw
	ov9MSC6+JXHhL5rB3NPVQzd/d4cUD71CnewWO8X0MQlQBwy0WSqhF9rNwCLrHf4srE8vMmhlxcvhg
	xxlvLnCRGhqnBOm2PmZ3F1j/PWulKGZhwPaXq+zfyXtH9s2tpcZLyD1VfZG7WdSJzZdNvBOFpw1o0
	88xMOw+4xXu5k0lusmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxwO-00000006yg3-2Gn3;
	Thu, 21 May 2026 07:35:36 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxwL-00000006yeN-1AXg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:35:34 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-366be8040a9so2419341a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 00:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348932; x=1779953732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NPvLu4dxOkoKdNg46+oSXq3CipWU7w/mHnMaydoddU=;
        b=BgX67+lsWX9y6QSM/Glnd9A48IA1AA10F44G0QkuLUzWKoX7iacX5pyT4eWGpUeUtI
         ohnaWprfFgZtSCekRdCc/rPSrlBMMDpnTUA/Pb80znAD2l77Q9/MDnTOhLL8CTSNH86k
         j13dnssXpo7uRKFxuKwolDp6xctvU8rBCucATZC3rmkKF8K4S6avllmd0ThUSlZzu0jG
         5M1AJvjd9uTO2WodkmW7MOpcw8Jkr5S2t+SxYiCsSLI+hbVMm2fg8sRnn/PrIj0Uvv9Q
         ndAe8mCwvJkLYo5/bZfpthEliFAfH4/06BT95jtnycPVs2fyLrIf3EWvKT3BalYzObfX
         xlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348932; x=1779953732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3NPvLu4dxOkoKdNg46+oSXq3CipWU7w/mHnMaydoddU=;
        b=LQGoClNHiZnvZnBoyPJKO/kmLOq4RhF9O6BizpRC8yVjS4CXzKHbKuD88PV7RsfxLs
         mMQ6DXuEy2/CZtmeznIZql0wsK9GEPPA41ZAYqvxxtwiRvfSRnlUEs8RHX6f4VEpGY8x
         N2VTP/EbATGrlmM4f/1+JdbjhbAy0y1M9rRMGOZdCgfzW9cMWAB68mjoBhdOaUol4Qru
         XbU0Tzk2gC/Eoq8l37mASQ20tenaNiU1EPYXD4M1pIx4eiM2IVIh7cruhjfLKu0nNuGE
         Dl9ZgjGHifi2cm+pT8fFdzatO0GtDS6ml+0/Frn4LYj5UFtbTZeZ2d3OpYIOvpsCcUZB
         pB2g==
X-Forwarded-Encrypted: i=1; AFNElJ+LxNDx8bct+j+nYN8qhhRgs1Jyfurlw2v2I+RbDFc6r0R/KRBodQYul4f/DugJt88g7PLzOESob6wrCVuISOHZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq5xK8h7d/2bxgVwSCVaV6aHvsToDCSjvnPe64gXrDgaqOUuC3
	XHmfAk312R/kyryJxru1///SMcJUyXGrZReCfv4E/3BrICtTk/Ig5fN4
X-Gm-Gg: Acq92OEtdcYZG89JWMjecZPG5l0s7+TStvkXDL8AG/H/qeVbiUN2jd9coG9tTMMBoQu
	aDiuLK+fQaXwXyOsIQYhtPRLTA7bMDcXkgmLp1F9qv5spFPneL53s4SKBzlAJzK6GVcOM66LxCX
	aEoMSEZHh+lGYEz/isXiNNnOSP6w5Ou0NGZG9N62Bm8ykpi/CPBlanx3yNsHmjW0RjnIxELVY0P
	tQUwnDNCe4uktJzKgSOJJNxD4x2pPef9oxkt2AV0ayKxTAdwO7rJkO7dsKHQmkwLfKuGfjCIwPJ
	jyEi17ZaBfnQiIXBjtSPA0DExmncCaaC5/fIQYh8xkDSnOid2o8sXfZPS3paoKycE8XB6e45Di0
	fbCPAzH2VkNmVEM+TJJJlpFKnvdK/wCf8jj2DLeEiE8PNcjdqHoz/FZsE58Y65H70AtBgYVLPos
	s6og8/SyrT3y3mv81eatCHNPkDY0gZ5tE=
X-Received: by 2002:a17:90b:3c08:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-36a45137990mr1777189a91.6.1779348932255;
        Thu, 21 May 2026 00:35:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/3] media: meson: vdec: Add error handling for recycle thread creation
Date: Thu, 21 May 2026 13:04:12 +0530
Message-ID: <20260521073449.10057-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260521073449.10057-1-linux.amoon@gmail.com>
References: <20260521073449.10057-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_003533_326245_BB1AF983 
X-CRM114-Status: GOOD (  18.35  )
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

Add proper error handling for kthread_run() in vdec_start_streaming().
If thread creation fails and returns an ERR_PTR, record the error,
reset sess->recycle_thread to NULL, and unwind resources via err_cleanup.
This prevents later calls to kthread_stop() in vdec_stop_streaming() from
dereferencing an ERR_PTR and causing a kernel panic. Fix this by adding the
label and invoking vdec_poweroff() to prevent hardware power leaks.

Additionally, reorder the error path to properly mirror the allocation
sequence clear the streamon status flags before emptying the M2M buffers
to avoid race conditions, and ensure DMA buffers are released gracefully
relative to the hardware state lifecycle.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: new patch
[Severity: High]
This isn't a bug introduced by this patch, but does the driver verify if
kthread_run() returns an ERR_PTR when starting the recycle thread?

If thread creation fails in vdec_start_streaming() and returns an ERR_PTR,
could a later call to kthread_stop(sess->recycle_thread) in
vdec_stop_streaming() attempt to dereference that ERR_PTR and cause a
kernel panic?
---
 drivers/staging/media/meson/vdec/vdec.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 9244fb09eb36..8615a935e86d 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -337,29 +337,37 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	sess->sequence_cap = 0;
 	sess->sequence_out = 0;
-	if (vdec_codec_needs_recycle(sess))
+	if (vdec_codec_needs_recycle(sess)) {
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
+		if (IS_ERR(sess->recycle_thread)) {
+			ret = PTR_ERR(sess->recycle_thread);
+			sess->recycle_thread = NULL;
+			goto err_cleanup;
+		}
+	}
 
 	sess->status = STATUS_INIT;
 	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
+err_cleanup:
+	vdec_poweroff(sess);
 vififo_free:
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
-	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 0;
 	else
 		sess->streamon_cap = 0;
 
+	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+
 	return ret;
 }
 
-- 
2.50.1


