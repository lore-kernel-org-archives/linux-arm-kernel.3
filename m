Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07F6C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 06:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hu86WNjJ+kA/XeSuM7zN7dq8Faj07B8lKH5Il6BqR+4=; b=Sf6+DhJvRFV6x7C6UGniDnnuVJ
	oD9DlDtSeU9Mp6Bu4S6oQ5obv14sgiqflJZatw11HKYSyUq9lpfaOrJYCdxIcBX9CJDViVUs6ZGOP
	TTJC7a7e4U+EMGg4i2ervRB4RzlIWZhXWY2qpjGW+iSxyjv36GHrLfnG46a/9gsMpKar8oNzNakFA
	Dkq3wy0oqsEoL3m/ERhlJiMovoZb8U5fT6+URKNdLApPKSDZanaeeUE3y43iM/LSwZDC1iduF49pg
	SeccsxbPUjVgXNhe20ycVW5DDDq+JUelaqDRBrnxoCXFP6HzBC1oX2oESywTgbQAIlm4Htju9NxaW
	2QzSEq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxS3-00000006z9X-1LA1;
	Wed, 29 Jul 2026 06:07:35 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxS0-00000006z8C-2Yh3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 06:07:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84861fc51f5so287855b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 23:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305252; x=1785910052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hu86WNjJ+kA/XeSuM7zN7dq8Faj07B8lKH5Il6BqR+4=;
        b=Q4imaKY1tBL8pfQgMk6pw9UgDQo0rfSQAAf4hsI1gjDXaYdCgkLiMP0sZXaAmvROI1
         nUTTo5EgWMlCPURPNK5ImWV0dqxrU7p9UInm6r6bCdcGV0TbxxV9CypYqleelgj5q1My
         UhvI/tXeacBNHldGdxh4y4Q/olnlZZLtIuDBZ7MEp9pyG91NtuQ0sWScC236jkyopuLc
         JBOlEOtsRzpV69eajC3i4+Zt6p0RbEGd5pmI6zLp+4NaW5ZVBqkCIb2CbKipEHcMaJXV
         O6WwTR8KAzf1ZQkld8VrNCFm2+Dh92smEr6ELgftNB2d8MhaxGOMBVwO9Qdx2SMQu+NV
         6xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305252; x=1785910052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hu86WNjJ+kA/XeSuM7zN7dq8Faj07B8lKH5Il6BqR+4=;
        b=KTgfewjPHXak1Dp9YVlZtGfPkLzVRogQORXzGN5i22qVx3ExajT7+6HDPKE8UyrW3C
         MsLlywjciocDIRUUFfnZmWcz4y/HXTety+ZxyLt/x2Vh5qdi2Ms1UE7MKCvhpcD0kd93
         tmlz68onrAadgpj/SseFqTKJiAwabtirXuC/y+yDffdY0KNa2Hy0B0UJcavqGZZMifsV
         sLh0mMfhIA0x9obIALDTJDwiyZea2+CKrBVrLZgmLAKZg8dfioovyp5ruSvW7SHqPifr
         MU/tGCDBgBVVn7jye27z0LvssJnzTc2W04eWFB0lMFCPNKhsag0bg12K2UFJI3a1fpAB
         XuaA==
X-Forwarded-Encrypted: i=1; AHgh+RpbJ+peY41TfXNwSsC21HqIXQpsUPR5peqwopssJd3YbZP+UoCV94nRapfmutU9ze4WSR+RwNt/409byBDJNUrK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7jWpUCQ4DZ9aT8x9INRsoFGzdMhVa9oJ0Xz9kwc6Uh/U6zVNS
	nnmFBaFATRUwQrq9BH6MKIzlVNJcrF0LXxutLtHqJtJn5NVzxmjWFEe1
X-Gm-Gg: AR+sD13TEQdu1ArBDH0c4I832kvbfxNDnvviJlItzscN+02UgCHGZaYmDpaxYXtMdcI
	mBOoXrr/LhCFgkRi7LbV4m4pa6wWUwZl5XF9/zZ1yydSwGCz3rvhnUiSSum4IQdw9ZaqR6YUHZj
	L2UVownTIoTYVQf9cwDuUsHNGXRehZwjLmls8vcsXNaRQbW9tdTW6GzrB/oDHaB9bU3WwpE/mYQ
	E15VmOsdsL3QlH1lSa/TLTAYW8P3e9ZYyLBkiqOPxKr+YzI6iBk6I8DhgZhFsneKKMcBD9pQqYF
	DTLoPf/f0lboFz7pM4GJlujzQpVd4/ymMGrEbrMmGx2I+/JEUcIizQutWtm5CQMr2gVs3yaxjz/
	dhhQs0smUZ9fjeyX3cf+KKDhBniklAmSmIfvFM4PEe0N4jPpWE1M5/pyGYFc7pgj7hcBknKkJUt
	cc+7rWIbbkL8Ohxp7gXpCeAbIlobEPZd7i7CYcPq1PeVLQbwzxOCFhTMqsgaymkn859AqRwDdAd
	WUGE56jW8p4TI057sgLBwjH/uwNt4tt6WtCFF8SohTa+6K47V4=
X-Received: by 2002:a05:6a00:b91:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84e931ec99amr5885268b3a.6.1785305251710;
        Tue, 28 Jul 2026 23:07:31 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm805504b3a.31.2026.07.28.23.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:07:31 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Frank.li@oss.nxp.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v5 1/2] media: hantro: release runtime resources when device_run fails
Date: Wed, 29 Jul 2026 06:04:39 +0000
Message-ID: <20260729060440.2092-2-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729060440.2092-1-tharitt97@gmail.com>
References: <20260729060440.2092-1-tharitt97@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_230732_661607_447C454F 
X-CRM114-Status: GOOD (  19.54  )
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

device_run() acquires a runtime PM reference and enables the VPU clocks
before invoking the codec-specific run callback.

If clk_bulk_enable() fails, the runtime PM reference is left held. If
the codec-specific run callback fails, both the enabled clocks and the
runtime PM reference are left held.

Make the clocks part of the device's runtime PM state by enabling them
from the runtime-resume callback and disabling them from the
runtime-suspend callback.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 .../media/platform/verisilicon/hantro_drv.c   | 66 +++++++++++--------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..d6fcd4f7f9da 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -59,8 +59,7 @@ static const struct v4l2_event hantro_eos_event = {
 	.type = V4L2_EVENT_EOS
 };
 
-static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
-				    struct hantro_ctx *ctx,
+static void hantro_job_finish_no_pm(struct hantro_ctx *ctx,
 				    enum vb2_buffer_state result)
 {
 	struct vb2_v4l2_buffer *src, *dst;
@@ -86,15 +85,13 @@ static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
 					 result);
 }
 
-static void hantro_job_finish(struct hantro_dev *vpu,
-			      struct hantro_ctx *ctx,
+static void hantro_job_finish(struct hantro_ctx *ctx,
 			      enum vb2_buffer_state result)
 {
-	pm_runtime_put_autosuspend(vpu->dev);
-
-	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+	struct hantro_dev *vpu = ctx->dev;
 
-	hantro_job_finish_no_pm(vpu, ctx, result);
+	pm_runtime_put_autosuspend(vpu->dev);
+	hantro_job_finish_no_pm(ctx, result);
 }
 
 void hantro_irq_done(struct hantro_dev *vpu,
@@ -111,7 +108,7 @@ void hantro_irq_done(struct hantro_dev *vpu,
 	if (cancel_delayed_work(&vpu->watchdog_work)) {
 		if (result == VB2_BUF_STATE_DONE && ctx->codec_ops->done)
 			ctx->codec_ops->done(ctx);
-		hantro_job_finish(vpu, ctx, result);
+		hantro_job_finish(ctx, result);
 	}
 }
 
@@ -127,7 +124,7 @@ void hantro_watchdog(struct work_struct *work)
 		vpu_err("frame processing timed out!\n");
 		if (ctx->codec_ops->reset)
 			ctx->codec_ops->reset(ctx);
-		hantro_job_finish(vpu, ctx, VB2_BUF_STATE_ERROR);
+		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
 	}
 }
 
@@ -170,29 +167,24 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
-	ret = pm_runtime_resume_and_get(ctx->dev->dev);
-	if (ret < 0)
-		goto err_cancel_job;
-
-	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
-	if (ret)
-		goto err_cancel_job;
+	ret = pm_runtime_resume_and_get(vpu->dev);
+	if (ret < 0) {
+		hantro_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
+		return;
+	}
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
-	if (ctx->codec_ops->run(ctx))
-		goto err_cancel_job;
-
-	return;
-
-err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	ret = ctx->codec_ops->run(ctx);
+	if (ret)
+		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
@@ -1296,10 +1288,30 @@ static void hantro_remove(struct platform_device *pdev)
 static int hantro_runtime_resume(struct device *dev)
 {
 	struct hantro_dev *vpu = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
+	if (ret)
+		return ret;
+
+	if (vpu->variant->runtime_resume) {
+		ret = vpu->variant->runtime_resume(vpu);
+		if (ret)
+			goto err_disable_clocks;
+	}
+
+	return 0;
 
-	if (vpu->variant->runtime_resume)
-		return vpu->variant->runtime_resume(vpu);
+err_disable_clocks:
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+	return ret;
+}
 
+static int hantro_runtime_suspend(struct device *dev)
+{
+	struct hantro_dev *vpu = dev_get_drvdata(dev);
+
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
 	return 0;
 }
 #endif
@@ -1307,7 +1319,7 @@ static int hantro_runtime_resume(struct device *dev)
 static const struct dev_pm_ops hantro_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(NULL, hantro_runtime_resume, NULL)
+	SET_RUNTIME_PM_OPS(hantro_runtime_suspend, hantro_runtime_resume, NULL)
 };
 
 static struct platform_driver hantro_driver = {
-- 
2.47.3


