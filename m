Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F33606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2xVQ4dUE;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=tQ/2LVDo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tv1tqMoOScIzzQOLt5m408coYQlin5fQQDeQEGLeviA=; b=2xVQ4dUE90BOXt
	1uHJCRwTiC6TcA2Kf0Db++yhV3uKlJcDnwYbb2JtzCQSobPi6YfyKLsGfX2flbYsw+RO+4FlhBbaN
	AfpAhjNCq4+0crshkUxfmM0hkCTytbDH+bmfWJXFq2SpIGv1Qoh/fhab6a1qoYvQzRNpzb56Qk+k8
	p6SC7Qr3orW9NsKfXZhRwE8nMbTd2uD2i2izcjiq6N/NR9wpWxM0QJc1LkjTa0NCU5qGAQFUcmr4c
	5CaYalxSc03It0iuBOn4V2f7y7if6om1HLtdyLrMcZjwhvnAgs/HnngaP7Z+kRDOQolqf4CsczKpO
	GaF+rbbc8uVqgmp1h4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99r-00000001Ndm-2xqb;
	Tue, 03 Nov 2026 07:42:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98v-00000001MJx-1CJD;
	Tue, 03 Nov 2026 07:41:43 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05863243E;
	Tue,  3 Nov 2026 08:38:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691534;
	bh=05UNaLeWNDQ3yp9BEhsFOUV2+pu0Z6KWqI4HsVxD68I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tQ/2LVDohGiOc1TR57ujYElqUEX8/dnWEqGPz+ULG+WYm7sfxMWo6z2lq5EQPwuCU
	 h1NJTLjaS25ekYOaFe4XnwUDSo4zKa0QcA5qHAJ52copcY4dydmkR9SVEL8BlZvtBb
	 EDw0YNlsle7Pw0iEWURki+oTuZk8Vgne+A1yGCm8=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:42 +0000
Subject: [PATCH 06/16] media: rkisp1: Modernise the locking
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-6-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11781;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=05UNaLeWNDQ3yp9BEhsFOUV2+pu0Z6KWqI4HsVxD68I=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAPEyVKrN/EEDhvK1MKqgsFb3T3zT4ZtfBHZ
 1XrLNai6yaJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQDwAKCRDISVd6bEV1
 MjCZD/46SaII6ZT95rJvXrSnZHv+oebmU3i+QV0e7ldoewTocltXgkDK+Um5sVjd3XgBpEwSLb8
 75RtWlVgEQ2zhTFyJKciOD+yuTecaShEJEibXzDGwkvBaqzz+R2omM7By74hQYVORjS0otXEylN
 Vtag/fwwCqY5QmMZRiACB9yJwxTnx1wA55p0k/ezMJ4l903uLefSAEulscKyAtcbPQGb6OlriiM
 teoMO7qTDAJ/YYtkjM0kl01rZK6ppd07hbz2/6B9mpgFBGzYj+YAYt5OPwz/ugQ6i9qKgMW5/fw
 dizGXRbsw9usA4cGQPJ87mNPPXk0jXe7dNK8pC42hiQEVjiBhliD66k+7XnesLGssu0AOMZgB9/
 t5kASj7sHTc4AYoTxzuCCz7twC6eKfEKVFQ3oP98KPTmnCVUMwrCiwh0R+lu+2ajdma0qh2/Hca
 HjKzvXxYR6ah0+dlCfuO06Hp81HugvOjFPjdtOdcCCJp6QIE/qB6vg/7eEg+5XCO84iFZJOA55v
 sz7X+V1d+4Lb34eNc3v3sW1/iB6hmJ0reAvIlkV41nZHiQgA2koUmmn3tLwkl2xyGNh29VwBUQ3
 ch4ikMFXw6WBpq1c5S7/QlKq2O7ziyi3a3jsJ63iSFD+oVzPX4mdzmApUObQhOg5ijqCqLzt3yp
 DepkVIFSBIHRXsA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234120_065486_50B20AEE 
X-CRM114-Status: GOOD (  25.60  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Modernise the locking routines within the rkisp1 driver to use the
guard() macros from cleanup.h. This simplifies unlocking spin_locks
through the driver and will help ensure correct locking as the driver
is updated.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c      | 90 +++++++++++-----------
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 31 +++-----
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  | 13 ++--
 3 files changed, 62 insertions(+), 72 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 20d88865081c33a9bd6a4adc1036841505e2a87f..757fd35e248a89ff3a6af4e07491239e14dda9c4 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <media/v4l2-common.h>
@@ -796,7 +797,7 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
 	struct rkisp1_isp *isp = &cap->rkisp1->isp;
 	struct rkisp1_buffer *curr_buf;
 
-	spin_lock(&cap->buf.lock);
+	guard(spinlock)(&cap->buf.lock);
 	curr_buf = cap->buf.curr;
 
 	if (curr_buf) {
@@ -809,7 +810,6 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
 	}
 
 	rkisp1_set_next_buf(cap);
-	spin_unlock(&cap->buf.lock);
 }
 
 irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
@@ -928,9 +928,9 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
 		container_of(vbuf, struct rkisp1_buffer, vb);
 	struct rkisp1_capture *cap = vb->vb2_queue->drv_priv;
 
-	spin_lock_irq(&cap->buf.lock);
-	list_add_tail(&ispbuf->queue, &cap->buf.queue);
-	spin_unlock_irq(&cap->buf.lock);
+	scoped_guard(spinlock_irq, &cap->buf.lock) {
+		list_add_tail(&ispbuf->queue, &cap->buf.queue);
+	}
 }
 
 static int rkisp1_vb2_buf_prepare(struct vb2_buffer *vb)
@@ -958,7 +958,8 @@ static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
 {
 	struct rkisp1_buffer *buf;
 
-	spin_lock_irq(&cap->buf.lock);
+	guard(spinlock_irq)(&cap->buf.lock);
+
 	if (cap->buf.curr) {
 		vb2_buffer_done(&cap->buf.curr->vb.vb2_buf, state);
 		cap->buf.curr = NULL;
@@ -973,7 +974,6 @@ static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
 		list_del(&buf->queue);
 		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
-	spin_unlock_irq(&cap->buf.lock);
 }
 
 /*
@@ -992,46 +992,48 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
 	cap->ops->config(cap);
 
 	/* Setup a buffer for the next frame */
-	spin_lock_irq(&cap->buf.lock);
-	rkisp1_set_next_buf(cap);
-	cap->ops->enable(cap);
-
-	/*
-	 * It's safe to configure ACTIVE and SHADOW registers for the first
-	 * stream. While when the second is starting, do NOT force update
-	 * because it also updates the first one.
-	 *
-	 * The latter case would drop one more buffer(that is 2) since there's
-	 * no buffer in a shadow register when the second FE received. This's
-	 * also required because the second FE maybe corrupt especially when
-	 * run at 120fps.
-	 */
-	if (!has_self_path || !other->is_streaming) {
-		u32 reg;
+	scoped_guard(spinlock_irq, &cap->buf.lock) {
+		rkisp1_set_next_buf(cap);
+		cap->ops->enable(cap);
 
 		/*
-		 * Force cfg update.
-		 *
-		 * The ISP8000 (implementing the MAIN_STRIDE feature) as a
-		 * mp_output_format field in the CIF_MI_INIT register that must
-		 * be preserved. It can be read back, but it is not clear what
-		 * other register bits will return. Mask them out.
-		 *
-		 * On Rockchip platforms, the CIF_MI_INIT register is marked as
-		 * write-only and reads as zeros. We can skip reading it.
-		 */
-		if (rkisp1_has_feature(rkisp1, MAIN_STRIDE))
-			reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_INIT)
-			    & RKISP1_CIF_MI_INIT_MP_OUTPUT_MASK;
-		else
-			reg = 0;
-
-		reg |= RKISP1_CIF_MI_INIT_SOFT_UPD;
-		rkisp1_write(rkisp1, RKISP1_CIF_MI_INIT, reg);
-
-		rkisp1_set_next_buf(cap);
+		* It's safe to configure ACTIVE and SHADOW registers for the
+		* first stream. While when the second is starting, do NOT force
+		* update because it also updates the first one.
+		*
+		* The latter case would drop one more buffer(that is 2) since
+		* there's no buffer in a shadow register when the second FE
+		* received. This's also required because the second FE maybe
+		* corrupt especially when run at 120fps.
+		*/
+		if (!has_self_path || !other->is_streaming) {
+			u32 reg;
+
+			/*
+			 * Force cfg update.
+			 *
+			 * The ISP8000 (implementing the MAIN_STRIDE feature) as
+			 * a mp_output_format field in the CIF_MI_INIT register
+			 * that must be preserved. It can be read back, but it is
+			 * not clear what other register bits will return. Mask
+			 * them out.
+			 *
+			 * On Rockchip platforms, the CIF_MI_INIT register is
+			 * marked as write-only and reads as zeros. We can skip
+			 * reading it.
+			 */
+			if (rkisp1_has_feature(rkisp1, MAIN_STRIDE))
+				reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_INIT)
+				& RKISP1_CIF_MI_INIT_MP_OUTPUT_MASK;
+			else
+				reg = 0;
+
+			reg |= RKISP1_CIF_MI_INIT_SOFT_UPD;
+			rkisp1_write(rkisp1, RKISP1_CIF_MI_INIT, reg);
+
+			rkisp1_set_next_buf(cap);
+		}
 	}
-	spin_unlock_irq(&cap->buf.lock);
 	cap->is_streaming = true;
 }
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index e5913f8b73726d16362e429960e251b48b62d9aa..cc42b5afbf65a9a992323c40cff1a6fe2d8b61e4 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/math.h>
 #include <linux/string.h>
 
@@ -2339,13 +2340,13 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_params *params = &rkisp1->params;
 
-	spin_lock(&params->buf.lock);
+	guard(spinlock)(&params->buf.lock);
 
 	params->buf.curr = list_first_entry_or_null(&params->buf.queue,
 						    struct rkisp1_params_buffer,
 						    queue);
 	if (!params->buf.curr)
-		goto unlock;
+		return;
 
 	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
 		rkisp1_isp_isr_other_config(params, params->buf.curr->cfg);
@@ -2371,9 +2372,6 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 	 */
 	rkisp1_params_complete_buffer(params, params->buf.curr,
 				      rkisp1->isp.frame_sequence + 1);
-
-unlock:
-	spin_unlock(&params->buf.lock);
 }
 
 static const struct rkisp1_cif_isp_awb_meas_config rkisp1_awb_params_default_config = {
@@ -2445,7 +2443,7 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 
 	rkisp1_csm_config(params);
 
-	spin_lock_irq(&params->buf.lock);
+	guard(spinlock_irq)(&params->buf.lock);
 
 	/* apply the first buffer if there is one already */
 
@@ -2453,7 +2451,7 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 						    struct rkisp1_params_buffer,
 						    queue);
 	if (!params->buf.curr)
-		goto unlock;
+		return;
 
 	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
 		rkisp1_isp_isr_other_config(params, params->buf.curr->cfg);
@@ -2466,14 +2464,11 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 	/* update shadow register immediately */
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
 			      RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
-
-unlock:
-	spin_unlock_irq(&params->buf.lock);
 }
 
 void rkisp1_params_post_configure(struct rkisp1_params *params)
 {
-	spin_lock_irq(&params->buf.lock);
+	guard(spinlock_irq)(&params->buf.lock);
 
 	/*
 	 * Apply LSC parameters from the first buffer (if any is already
@@ -2487,7 +2482,7 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
 						    struct rkisp1_params_buffer,
 						    queue);
 	if (!params->buf.curr)
-		goto unlock;
+		return;
 
 	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
 		rkisp1_isp_isr_lsc_config(params, params->buf.curr->cfg);
@@ -2500,9 +2495,6 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
 			      RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
 
 	rkisp1_params_complete_buffer(params, params->buf.curr, 0);
-
-unlock:
-	spin_unlock_irq(&params->buf.lock);
 }
 
 /*
@@ -2710,9 +2702,8 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 	struct vb2_queue *vq = vb->vb2_queue;
 	struct rkisp1_params *params = vq->drv_priv;
 
-	spin_lock_irq(&params->buf.lock);
+	guard(spinlock_irq)(&params->buf.lock);
 	list_add_tail(&params_buf->queue, &params->buf.queue);
-	spin_unlock_irq(&params->buf.lock);
 }
 
 static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
@@ -2781,9 +2772,9 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 	 * and then we can iterate it and call vb2_buffer_done
 	 * without holding the lock
 	 */
-	spin_lock_irq(&params->buf.lock);
-	list_splice_init(&params->buf.queue, &tmp_list);
-	spin_unlock_irq(&params->buf.lock);
+	scoped_guard(spinlock_irq, &params->buf.lock) {
+		list_splice_init(&params->buf.queue, &tmp_list);
+	}
 
 	list_for_each_entry(buf, &tmp_list, queue)
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index d5fdb8f82dc78b0143f71d76f36817db389921b7..fba95a1786be0d6782829a5604d41893dda8e826 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
  */
 
+#include <linux/cleanup.h>
+
 #include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
@@ -112,10 +114,8 @@ static void rkisp1_stats_vb2_buf_queue(struct vb2_buffer *vb)
 	struct vb2_queue *vq = vb->vb2_queue;
 	struct rkisp1_stats *stats_dev = vq->drv_priv;
 
-
-	spin_lock_irq(&stats_dev->lock);
+	guard(spinlock_irq)(&stats_dev->lock);
 	list_add_tail(&stats_buf->queue, &stats_dev->stat);
-	spin_unlock_irq(&stats_dev->lock);
 }
 
 static int rkisp1_stats_vb2_buf_prepare(struct vb2_buffer *vb)
@@ -134,7 +134,7 @@ static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
 	struct rkisp1_buffer *buf;
 	unsigned int i;
 
-	spin_lock_irq(&stats->lock);
+	guard(spinlock_irq)(&stats->lock);
 	for (i = 0; i < RKISP1_ISP_STATS_REQ_BUFS_MAX; i++) {
 		if (list_empty(&stats->stat))
 			break;
@@ -143,7 +143,6 @@ static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
 		list_del(&buf->queue);
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 	}
-	spin_unlock_irq(&stats->lock);
 }
 
 static const struct vb2_ops rkisp1_stats_vb2_ops = {
@@ -381,7 +380,7 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
 	struct rkisp1_device *rkisp1 = stats->rkisp1;
 	unsigned int isp_mis_tmp = 0;
 
-	spin_lock(&stats->lock);
+	guard(spinlock)(&stats->lock);
 
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, RKISP1_STATS_MEAS_MASK);
 
@@ -391,8 +390,6 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
 
 	if (isp_ris & RKISP1_STATS_MEAS_MASK)
 		rkisp1_stats_send_measurement(stats, isp_ris);
-
-	spin_unlock(&stats->lock);
 }
 
 static void rkisp1_init_stats(struct rkisp1_stats *stats)

-- 
2.43.0


