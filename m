Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E361BCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKwrXEXaLENw99YJowK3xb8rjn7NyiynQVbSpLY2vlI=; b=vxXbdEtym8eftY
	HS2C/jVGAhLNdxJXLvmwdGJSnSP/hQdM8oKJ/8WZXl166B44A/8/p7rqJCiervP1Yi2e2w/Ablbjq
	ycc0SLF3tc93XKUpdrasFVS9T/kOZgz9p0wJLYq+aJ1mJcBnewCuxltpkEnvQCpsMVndMWJQlFqes
	QCopOOTQnIWtDunrOLG3p55uDi0gGusSMJ16dFZ+uqml5RtYNgYugRNo62kaJrkPDHTeNWREyDWSY
	46gUctrJ9FTL1b2JCyHazoyEFqkfOj9hYRdS2gPWHOrDXVLT60PBtaUDCLI0zObEeLDEdWqoHAIQR
	0iVDCwC+PCFmgynAn7+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzx-0000000GsnX-3bo9;
	Mon, 25 May 2026 09:53:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzu-0000000Gskm-4Aup
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:53:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bd2c147abaso56275235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702802; x=1780307602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKwrXEXaLENw99YJowK3xb8rjn7NyiynQVbSpLY2vlI=;
        b=QvBsXgCQZV3UVx0UBG5v3OikZR2+rBckV+3IAvIVXvY9sTjstBDk+GzGO0QPWWhVFR
         jTfQypPVON3MB+y9Lf0f9cjyYzgHkQFjd5sVJtDe/qUQg8W0EqVa9PkbZseIXXERPFxg
         rM/kybAS6Ho1G5J1bnhIBSc3iy/rZQC7rbK3tpQvpaHSi2zye7+BopcNqiiu/erEwLBp
         L4SwZ6woNKvuReJku6DCfCB+C5tgDBPpRowUIQicBmkqVMQAaqVnwMv03h2rWPLmbEO1
         2doM5y1kUdmzYnevmULoSmTsGhsx9goUf50FrnKtvo+S1Mq4G+y6HK3d0Fx41x3mH4UX
         32Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702802; x=1780307602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AKwrXEXaLENw99YJowK3xb8rjn7NyiynQVbSpLY2vlI=;
        b=B2ArlhBRVYC99ExhHkvQNeYDZJKJEO2yQ9wv/4P2waQeKgzmkoOlCUggvHxVrWVrJ6
         ldFB6QEvjrQKOnS5I6u5DdWmj8DqDa2UitXuDVTQTFXICGTh648/OfJYhQ66wEilCJOo
         lswT70pbjmCW/HNsqKrWN9pFhCo5t82TVABjwZJrfRF8I0TEMhiDjZvc1rppBS6bMTdw
         pWodo+JiAfd/tLaFqtrSodgHEEQaJD78bgInGxwTXKVyf8Vx34xYaRL1EdwrUZCKlRKL
         nwYRDTWNdS4dfW9p7l6r6PxwerclQTX7A5QQ89o8MfYKoSVhZnYzox4rLSIdxT2ejiaC
         SlPA==
X-Forwarded-Encrypted: i=1; AFNElJ9pCwPqA3f58QYbyeK//SPvRTzZIhEjwVKbIuoBMiep09rxAsDAUAvmnuShSx+SVr8v43HMxljTZkuVXJjeOrqG@lists.infradead.org
X-Gm-Message-State: AOJu0YxZzkw5BzW48WJfwhe+sO9uJ3qJzPJIsLPp2l+AhvbMgg8U83FL
	NysYjXcqq2QUjW3BvoHgahxrTrgpI24EpfVVS694pdO37PLVr42g4ZwH
X-Gm-Gg: Acq92OGPUWSJJ0ZaGas0LPlUksJfw1QgnOBy64SQXm61wkGl3Z87BR+YWS1FrjKn/wP
	7dXDrhX5hFPGyxxvoewZRA1xzYQypmokFpgWQh4ouJROWmHfN23p8DwsY5KGPvfalu33tgVW8Kn
	+zWTImEdqWyRNsnu9d/v//YBKa9XQ6aaKcJ4UQNjarXVb2YpKRsgUMyyaM9OT+yKMICBME7AFam
	saU0pwoVBgnoY7WAxe3pHD/sekbvESjFcQbQcaHqO/b+Bo85SpxjOB3ghPPnpaN/e6ZwFCwr+Wi
	3K8yUytJBgoFfqMYDoB41otQMUicy/hnmgKriDazt8cE84RMiYqcUjNQRmLnStgFZOeOQp6qtOS
	yPXk5UWGbd7WoOEbEE9bNG4PYi8EnESJfXAvyn1WvRe30eImLa0N05q1bunX1AULqPexCB2z/7H
	9POjlIRS6Z4rWzzKPShrtR
X-Received: by 2002:a17:902:ebc2:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2beb031adfdmr138558515ad.6.1779702802100;
        Mon, 25 May 2026 02:53:22 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:53:21 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 6/6] media: meson: vdec: Cancel esparser work in error and stop paths
Date: Mon, 25 May 2026 15:21:54 +0530
Message-ID: <20260525095216.12078-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_025323_037375_E0843FF5 
X-CRM114-Status: GOOD (  15.89  )
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

The esparser workqueue may remain pending when streaming is stopped or
the device is closed, leading to use-after-free if it runs after session
teardown. vdec_start_streaming(), vdec_stop_streaming(), and vdec_close()
did not cancel this work, leaving a race between session cleanup and
work execution.

Fix this by calling cancel_work_sync(&sess->esparser_queue_work) in all
cleanup paths. Unlocking and relocking sess->lock around the cancel
ensures the work handler cannot run concurrently with teardown. This
prevents dangling work items from accessing freed session memory and
eliminates a potential kernel crash.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: Tried to fix the order of cancel_work_sync() which could lead to
   a use-after-free. update the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 925537bd4d0b..296b387f3667 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -372,6 +372,10 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
+	mutex_unlock(&sess->lock);
+	cancel_work_sync(&sess->esparser_queue_work);
+	mutex_lock(&sess->lock);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		sess->streamon_out = 0;
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
@@ -430,6 +434,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			kthread_stop(sess->recycle_thread);
 
 		vdec_poweroff(sess);
+		mutex_unlock(&sess->lock);
+		cancel_work_sync(&sess->esparser_queue_work);
+		mutex_lock(&sess->lock);
 		vdec_free_canvas(sess);
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
 				  sess->vififo_vaddr, sess->vififo_paddr);
@@ -948,6 +955,8 @@ static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
-- 
2.50.1


