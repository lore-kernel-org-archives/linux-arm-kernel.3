Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2028C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KS2pWiQ23rjin5V97dhap/FGn+0uPlh0nCgHK2nY5mo=; b=j712ShoAoeZUv4E8Tz+VtoEgRJ
	c0yB8LbgYnwvU+Gkl8N5qz4nRGm/IClltz1sedDZ7tSwvXk04/bc0mwZTe4WWpX0h11376OmCVO0L
	Mxqx3E738U+pyHAWMNLWH08V7TrUox8AJ0CoXHqhe7ByU4v/nHXiF+fZqP3aXJmrjIn84uT7C6U3I
	E6ivbGY7+819vy08gxC0puL1rvzf/kJhjZWQvPFGBTitDWc2mfz4915CJ0N44PX/nhXa5EiqzvbAl
	R+Tf5wksdMelffyvhmOOQQWbldH8hh4x8pfPJVdxCGN3FN2Q/yqgO6ZxmtFu0HFHNY9ZShguMIXsL
	WnxUOzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl3AJ-000000043OP-0kJh;
	Sat, 18 Jul 2026 11:25:07 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl3AF-000000043Ne-3dFy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 11:25:04 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84a2dcede83so7396773b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784373903; x=1784978703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KS2pWiQ23rjin5V97dhap/FGn+0uPlh0nCgHK2nY5mo=;
        b=qBDrxnt7uM4sn+AWriedrCe3cxeqM5UE4h3N5ncBacI0iQsC6MGlyjlHMb+O/AJntv
         NsCZCO1wiWhLIMEsZ60eKCI7YXbuDvnrFW/amCIJb8pcGRw4B7G8AHSaDYAhcur7DUUF
         ncvFRoT9/bBTzgAdqDF/KpmUPDZmpLGBESCGBhHb3hQb+GiYSwG3vUBchMwIR5ERfJLH
         38dcjQakaA65PE5ilvY0/+yNYsT/co4M/edOhygaZJwRqbXO/c7AdSTo1y81eCVYFyKn
         G0Ax2hifkSzEx4JgpaDnsIwXt02YiSz176GPBDL5GkbhBYIKpeesmXHefBnx0kCiLvtj
         Vhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784373903; x=1784978703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KS2pWiQ23rjin5V97dhap/FGn+0uPlh0nCgHK2nY5mo=;
        b=J/LmuGFqltHQvULNTmJueVA3hQo2RcymGOzasPLjmaTKGwArUjyLxbPswdvgY7Ki4K
         49ssAFXP+hMGYOFR1UAQNOYQNTJ/lh2BKxs1R/0K3nh4XsJ/qNcQR1A4+VF9djB8Ikwz
         KO0cAMTGOyYNpGj3il6hIvMHu05QLYM+MTnzzvKJNVKipOeQvMoogPSN8pk5bwYoa042
         O+uNE1i/0WY8tBWWsrKLC2Yd9BmvJ9NyGiV2VD3NaCytrWNuvScs0bvcbmAeqn2DP3Ep
         4tXomxECsgj9ichfhrnxuKOSoHwLBPGoE9vKaaHw5NmNVZQgW/mSaXuhC+H+MvXo5D8v
         vZyg==
X-Forwarded-Encrypted: i=1; AHgh+RrTuIVtCyOfMbwjrjMXcDsafgCsxjB8xc2y41lW3BOVJPfJ5TVxtps+99gmiKoTo+d6ODxUqJGSEDGYKlLyNnZ7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx47+7BnakRCZo8VIXwsHBNybtCn4V4Yoi49vsBNsU5tDKZNz8f
	34UUsR58Unvz+OTE51rgt9u3OVDoM6y07su6mZvrxPth/+T+3yTZVeqW
X-Gm-Gg: AfdE7clHq1IMI4+CUbji9BzdmOWsq3ZBTW7gk5OFRGWUXe4t3E/dXFOG1bybck/5QtV
	UDAEKFcFYLzmiq6JUPMiABzTTdy378qkRweb/HkexEtxzzRygSv5OaVPhc9cM2ToSknszLwFxNR
	drIUgw6v8vTAVyMORWIgFPkDXj0UAqv8eZePm5RRscSmq0Zqm7reSDHBaJTWdkLF42ComUY2BPF
	3O5a3gJc6fntoppKePAJeCUYe6L9TeT0i7WE6aF9O/sRCZ/p1KT0vng2X1Wju991bB0L5kPygye
	iwDnLtiU1T4SFn4WKNomTUBa83DTrFaSLtQXB2VFvhyTDmOLiwiaG6ltFGrR7lYqX/TRpCbb6u6
	8FJE9A74wGya4hCR19WtPrQSEwe1P/Lvhm4tBKHiraAkd19GIbACvOobowVjUUsabtuGF
X-Received: by 2002:a05:6a00:1385:b0:848:80ec:5d2 with SMTP id d2e1a72fcca58-84c294fc343mr6613679b3a.51.1784373902792;
        Sat, 18 Jul 2026 04:25:02 -0700 (PDT)
Received: from lgs.. ([101.36.109.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af30bd6sm2639355b3a.39.2026.07.18.04.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 04:25:02 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Fan Wu <fanwu01@zju.edu.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v2] media: mtk-jpeg: drain hardware completion before freeing context
Date: Sat, 18 Jul 2026 19:24:48 +0800
Message-ID: <20260718112448.3289122-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_042503_911997_9EB5451B 
X-CRM114-Status: GOOD (  18.11  )
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

The change referenced by the Fixes tag cancels ctx->jpeg_work before
freeing the JPEG context.

That prevents the worker itself from accessing the context after it has
been freed. However, the multi-core workers return after programming a
hardware instance. The IRQ handler or the per-hardware timeout work can
then continue to access the context through hw_param.curr_ctx after the
worker has completed.

If userspace closes the file while a hardware job is still pending,
cancel_work_sync() can return and mtk_jpeg_release() can free the
context before the IRQ or timeout path has finished using it.

Track the number of in-flight hardware jobs for each context and wait
for them to complete in mtk_jpeg_release().

Use a per-hardware active flag to ensure that only the IRQ handler or
the timeout work completes each job. Clear hw_param.curr_ctx and drop
the in-flight count only after the completion path has finished all
accesses to the context.

Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path due to uncancelled work")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Replace the undefined mtk_jpeg_release_hw() call with per-context
    in-flight hardware job tracking.
  - Ensure that only the IRQ or timeout path completes each hardware job.
  - Clear hw_param.curr_ctx after the completion path stops using the
    context.
  - Keep hardware instances busy until the timeout path has finished
    accessing their saved context and buffers.

 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 12 ++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 14 +++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 25 +++++++++++++------
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 25 +++++++++++++------
 4 files changed, 61 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec483081..d41c0e0516b9 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1161,6 +1161,8 @@ static int mtk_jpeg_open(struct file *file)
 	}
 
 	INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
+	atomic_set(&ctx->hw_jobs, 0);
+	init_waitqueue_head(&ctx->hw_jobs_wq);
 	INIT_LIST_HEAD(&ctx->dst_done_queue);
 	spin_lock_init(&ctx->done_queue_lock);
 	v4l2_fh_init(&ctx->fh, vfd);
@@ -1202,8 +1204,12 @@ static int mtk_jpeg_release(struct file *file)
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
-	if (jpeg->variant->jpeg_worker)
+	if (jpeg->variant->jpeg_worker) {
 		cancel_work_sync(&ctx->jpeg_work);
+		wait_event(ctx->hw_jobs_wq,
+			   atomic_read(&ctx->hw_jobs) == 0);
+	}
+
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
@@ -1640,6 +1646,8 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
+	atomic_inc(&ctx->hw_jobs);
+	atomic_set_release(&comp_jpeg[hw_id]->hw_param.job_active, 1);
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
@@ -1759,6 +1767,8 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		goto setdst_end;
 	}
 
+	atomic_inc(&ctx->hw_jobs);
+	atomic_set_release(&comp_jpeg[hw_id]->hw_param.job_active, 1);
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 02ed0ed5b736..be8ada60782a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -103,6 +103,7 @@ struct mtk_jpeg_hw_param {
 	struct vb2_v4l2_buffer *src_buffer;
 	struct vb2_v4l2_buffer *dst_buffer;
 	struct mtk_jpeg_ctx *curr_ctx;
+	atomic_t job_active;
 };
 
 enum mtk_jpegenc_hw_id {
@@ -282,6 +283,8 @@ struct mtk_jpeg_q_data {
  * @restart_interval:		jpeg encoder restart interval
  * @ctrl_hdl:			controls handler
  * @jpeg_work:			jpeg encoder workqueue
+ * @hw_jobs:			number of hardware jobs still referencing this context
+ * @hw_jobs_wq:			wait queue for hardware job completion
  * @total_frame_num:		encoded frame number
  * @dst_done_queue:		encoded frame buffer queue
  * @done_queue_lock:		encoded frame operation spinlock
@@ -299,6 +302,8 @@ struct mtk_jpeg_ctx {
 	struct v4l2_ctrl_handler ctrl_hdl;
 
 	struct work_struct jpeg_work;
+	atomic_t hw_jobs;
+	wait_queue_head_t hw_jobs_wq;
 	u32 total_frame_num;
 	struct list_head dst_done_queue;
 	/* spinlock protecting the encode done buffer */
@@ -306,4 +311,13 @@ struct mtk_jpeg_ctx {
 	u32 last_done_frame_num;
 };
 
+static inline void
+mtk_jpeg_hw_job_done(struct mtk_jpeg_hw_param *hw_param,
+		     struct mtk_jpeg_ctx *ctx)
+{
+	WRITE_ONCE(hw_param->curr_ctx, NULL);
+	if (atomic_dec_and_test(&ctx->hw_jobs))
+		wake_up(&ctx->hw_jobs_wq);
+}
+
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 32372781daf5..c2d40653891a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -527,7 +527,12 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 			     job_timeout_work.work);
 	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_ctx *ctx;
+
+	if (atomic_cmpxchg(&cjpeg->hw_param.job_active, 1, 0) != 1)
+		return;
 
+	ctx = cjpeg->hw_param.curr_ctx;
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
@@ -535,11 +540,13 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
 	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
 	pm_runtime_put(cjpeg->dev);
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	mtk_jpegdec_put_buf(cjpeg);
+	mtk_jpeg_hw_job_done(&cjpeg->hw_param, ctx);
+
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
-	v4l2_m2m_buf_done(src_buf, buf_state);
-	mtk_jpegdec_put_buf(cjpeg);
 }
 
 static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
@@ -555,12 +562,10 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	struct mtk_jpegdec_comp_dev *jpeg = priv;
 	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
 
-	cancel_delayed_work(&jpeg->job_timeout_work);
+	if (atomic_cmpxchg(&jpeg->hw_param.job_active, 1, 0) != 1)
+		return IRQ_HANDLED;
 
-	ctx = jpeg->hw_param.curr_ctx;
-	src_buf = jpeg->hw_param.src_buffer;
-	dst_buf = jpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+	cancel_delayed_work(&jpeg->job_timeout_work);
 
 	irq_status = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
 	dec_irq_ret = mtk_jpeg_dec_enum_result(irq_status);
@@ -570,6 +575,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	if (dec_irq_ret != MTK_JPEG_DEC_RESULT_EOF_DONE)
 		dev_warn(jpeg->dev, "Jpg Dec occurs unknown Err.");
 
+	ctx = jpeg->hw_param.curr_ctx;
+	src_buf = jpeg->hw_param.src_buffer;
+	dst_buf = jpeg->hw_param.dst_buffer;
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+
 	jpeg_src_buf =
 		container_of(src_buf, struct mtk_jpeg_src_buf, b);
 
@@ -582,6 +592,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	mtk_jpegdec_put_buf(jpeg);
 	pm_runtime_put(ctx->jpeg->dev);
 	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
+	mtk_jpeg_hw_job_done(&jpeg->hw_param, ctx);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index b312a15d707b..b08f94845613 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -257,7 +257,12 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_ctx *ctx;
+
+	if (atomic_cmpxchg(&cjpeg->hw_param.job_active, 1, 0) != 1)
+		return;
 
+	ctx = cjpeg->hw_param.curr_ctx;
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
@@ -265,11 +270,13 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
 	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
 	pm_runtime_put(cjpeg->dev);
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	mtk_jpegenc_put_buf(cjpeg);
+	mtk_jpeg_hw_job_done(&cjpeg->hw_param, ctx);
+
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
-	v4l2_m2m_buf_done(src_buf, buf_state);
-	mtk_jpegenc_put_buf(cjpeg);
 }
 
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
@@ -283,12 +290,10 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	struct mtk_jpegenc_comp_dev *jpeg = priv;
 	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
 
-	cancel_delayed_work(&jpeg->job_timeout_work);
+	if (atomic_cmpxchg(&jpeg->hw_param.job_active, 1, 0) != 1)
+		return IRQ_HANDLED;
 
-	ctx = jpeg->hw_param.curr_ctx;
-	src_buf = jpeg->hw_param.src_buffer;
-	dst_buf = jpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+	cancel_delayed_work(&jpeg->job_timeout_work);
 
 	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
 		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
@@ -297,6 +302,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
 		dev_warn(jpeg->dev, "Jpg Enc occurs unknown Err.");
 
+	ctx = jpeg->hw_param.curr_ctx;
+	src_buf = jpeg->hw_param.src_buffer;
+	dst_buf = jpeg->hw_param.dst_buffer;
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+
 	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
 						 ctx->jpeg->variant->support_34bit);
 	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
@@ -305,6 +315,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	mtk_jpegenc_put_buf(jpeg);
 	pm_runtime_put(ctx->jpeg->dev);
 	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
+	mtk_jpeg_hw_job_done(&jpeg->hw_param, ctx);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
-- 
2.43.0


