Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15131CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 04:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaY5jS/adaVvZbKjXboBNX9JuZBrD/yz8Cvz3X2BKqY=; b=mz3A1Xh+oGrcewOCIOTj/GunBb
	1oDTrb60kZZZRy66Ilk1Ec2NQt/2ggcYIbKPCEDo/PxQlV3zrjPU1e4EdmVXY7tPEoupuysS6jvhu
	hHH8rwQ4N6FQCU40eDdJva5pQ4A3sm9Z5MEVLX3j6vLwkcz/ARax0O27XMUMqTSCtYwxlvDvMYvxI
	GQFygNRcC3oRDctBfJhAnupkk4iGtj9GvwsTMUXkv+Ix4uBMu2xZFJAZ3SZntRZuG4EDLVH9sZnhj
	IpnhoYigXX7kGsG4pReWFkk5H3m7kGSS2AnDjTNwac6NkAtpV/ANMQt989Jk3GGOwVwEHJqmreE7V
	vppYByBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ra9-000000046vh-099P;
	Tue, 30 Sep 2025 04:03:17 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ra4-000000046st-1Lg3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 04:03:14 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250930035636epoutp03ae74e184c1fed1f3f52acf08888b9d30~p80Jw0CuF3111931119epoutp032
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 03:56:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250930035636epoutp03ae74e184c1fed1f3f52acf08888b9d30~p80Jw0CuF3111931119epoutp032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759204596;
	bh=IaY5jS/adaVvZbKjXboBNX9JuZBrD/yz8Cvz3X2BKqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iBx2U+vupSJpY2oq1jgnT4aro5qGD1WCjmJAkcc431Qrg7CkjevKgzufjSaAvl66R
	 TROrwZJFwLDzqY2f9l5yfQ0v+QfaO/Hst+Bk9tWsuci+IUHuOxkYEwB2V2epqq8YMK
	 tFcM0w3FCvLLMFcuMea6yC5TZLQUzXzvQ9yfiqhQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250930035635epcas5p140112f6b04a785a9b28608ff3dd328ce~p80JKQs5S1549615496epcas5p1J;
	Tue, 30 Sep 2025 03:56:35 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cbPPZ2ygnz2SSKk; Tue, 30 Sep
	2025 03:56:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250930035633epcas5p3d859613b1d1d3319ded26da626c959bc~p80HacXXH1975219752epcas5p3U;
	Tue, 30 Sep 2025 03:56:33 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250930035629epsmtip195521ecc4b0c104190aad7cb519dbfbe~p80D8wCWG2938529385epsmtip1a;
	Tue, 30 Sep 2025 03:56:29 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
	alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
	ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 17/29] media: mfc: Add VB2 decoder support
Date: Tue, 30 Sep 2025 09:33:36 +0530
Message-Id: <20250930040348.3702923-18-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035633epcas5p3d859613b1d1d3319ded26da626c959bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035633epcas5p3d859613b1d1d3319ded26da626c959bc
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
	<CGME20250930035633epcas5p3d859613b1d1d3319ded26da626c959bc@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_210312_679553_5970A82D 
X-CRM114-Status: GOOD (  26.17  )
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

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

- Implement VB2 queue operations for decoding (setup, buffer handling,
  streaming control, multi‑view and DMA direction support).
- Added header exposing decoder VB2 operations to other MFC components.

This introduces a full VB2 backend for video decoding, aligning the driver
with standard V4L2 buffer management.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../platform/samsung/exynos-mfc/Makefile      |   2 +-
 .../platform/samsung/exynos-mfc/mfc_dec_vb2.c | 393 ++++++++++++++++++
 .../platform/samsung/exynos-mfc/mfc_dec_vb2.h |  19 +
 3 files changed, 413 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/Makefile b/drivers/media/platform/samsung/exynos-mfc/Makefile
index 19e38c886255..9127f2dc4df6 100644
--- a/drivers/media/platform/samsung/exynos-mfc/Makefile
+++ b/drivers/media/platform/samsung/exynos-mfc/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_VIDEO_EXYNOS_MFC) := exynos_mfc.o
 ccflags-y += -I$(srctree)/$(src)
 
 #Dev interface layer
-exynos_mfc-y += mfc.o
+exynos_mfc-y += mfc.o mfc_dec_vb2.o
 #Dev control layer
 exynos_mfc-y += mfc_rm.o mfc_ctx_ctrl.o mfc_debugfs.o
 #Core interface layer
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.c b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.c
new file mode 100644
index 000000000000..3097a6c0bf14
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_dec_vb2.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_dec_vb2.h"
+
+#include "mfc_rm.h"
+
+#include "base/mfc_queue.h"
+#include "base/mfc_utils.h"
+#include "base/mfc_buf.h"
+#include "base/mfc_mem.h"
+
+static int mfc_dec_queue_setup(struct vb2_queue *vq,
+			       unsigned int *buf_count, unsigned int *plane_count,
+			       unsigned int psize[], struct device *alloc_devs[])
+{
+	struct mfc_ctx *ctx = vq->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	struct mfc_raw_info *raw;
+	int i, offset;
+
+	mfc_ctx_debug_enter();
+
+	raw = &ctx->raw_buf;
+
+	/*
+	 * During queue_setup,
+	 * context information is need to for only main core
+	 */
+	core = mfc_get_main_core_lock(dev, ctx);
+	core_ctx = core->core_ctx[ctx->num];
+
+	/* Video output for decoding (source)
+	 * this can be set after getting an instance
+	 */
+	if (core_ctx->state == MFCINST_GOT_INST &&
+	    vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_debug(4, "dec src\n");
+		/* A single plane is required for input */
+		*plane_count = 1;
+		if (*buf_count < 1)
+			*buf_count = 1;
+		if (*buf_count > MFC_MAX_BUFFERS)
+			*buf_count = MFC_MAX_BUFFERS;
+
+		/* need to use minimum size to prevent qbuf fail */
+		psize[0] = 1;
+		alloc_devs[0] = dev->device;
+	/* Video capture for decoding (destination)
+	 * this can be set after the header was parsed
+	 */
+	} else if (core_ctx->state >= MFCINST_HEAD_PARSED &&
+		vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		mfc_debug(4, "dec dst\n");
+		/* Output plane count is different by the pixel format */
+		*plane_count = ctx->num_fd_frame;
+		/* Setup buffer count */
+		if (*buf_count < ctx->dpb_count)
+			*buf_count = ctx->dpb_count;
+		if (*buf_count > MFC_MAX_BUFFERS)
+			*buf_count = MFC_MAX_BUFFERS;
+
+		if (ctx->dst_fmt->mem_planes == 1) {
+			psize[0] = raw->total_plane_size;
+			alloc_devs[0] = dev->device;
+		} else {
+			for (i = 0; i < ctx->dst_fmt->num_planes; i++) {
+				psize[i] = ctx->min_dpb_size[i];
+				alloc_devs[i] = dev->device;
+			}
+		}
+		if (ctx->multi_view_enable) {
+			offset = ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW1].offset;
+			if (ctx->dst_fmt->mem_planes == 1) {
+				psize[offset] = raw->total_plane_size;
+				alloc_devs[offset] = dev->device;
+			} else {
+				for (i = 0; i < ctx->dst_fmt->num_planes; i++) {
+					psize[offset + i] = ctx->min_dpb_size[i];
+					alloc_devs[offset + i] = dev->device;
+				}
+			}
+		}
+
+		/* Decoder DPB should be read for reference */
+		vq->dma_dir = DMA_BIDIRECTIONAL;
+	} else {
+		mfc_err("State seems invalid. State = %d, vq->type = %d\n",
+			core_ctx->state, vq->type);
+		return -EINVAL;
+	}
+
+	mfc_debug(2, "buf_count: %d, plane_count: %d, type: %#x\n",
+		  *buf_count, *plane_count, vq->type);
+	for (i = 0; i < *plane_count; i++)
+		mfc_debug(2, "plane[%d] size: %d\n", i, psize[i]);
+
+	mfc_ctx_debug_leave();
+
+	return 0;
+}
+
+static void mfc_dec_unlock(struct vb2_queue *q)
+{
+	struct mfc_ctx *ctx = q->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+
+	mutex_unlock(&dev->mfc_mutex);
+}
+
+static void mfc_dec_lock(struct vb2_queue *q)
+{
+	struct mfc_ctx *ctx = q->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+
+	mutex_lock(&dev->mfc_mutex);
+}
+
+static int mfc_dec_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct mfc_ctx *ctx = vq->drv_priv;
+	struct mfc_buf *buf = vb_to_mfc_buf(vb);
+	int ret;
+
+	mfc_ctx_debug_enter();
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		ret = mfc_check_vb_with_fmt(ctx->dst_fmt, vb);
+		if (ret < 0)
+			return ret;
+		mfc_calc_base_addr(ctx, vb, ctx->dst_fmt);
+
+		buf->paddr = mfc_mem_get_paddr_vb(vb);
+		mfc_ctx_debug(2, "[DPB] vb index [%d] vb paddr %#llx daddr %#llx\n",
+			      vb->index, buf->paddr, buf->addr[0][0]);
+
+		if (call_cop(ctx, init_buf_ctrls, ctx, MFC_CTRL_TYPE_DST,
+			     vb->index) < 0)
+			mfc_ctx_err("failed in init_buf_ctrls\n");
+	} else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		ret = mfc_check_vb_with_fmt(ctx->src_fmt, vb);
+		if (ret < 0)
+			return ret;
+
+		buf->addr[0][0] = mfc_mem_get_daddr_vb(vb, 0);
+
+		if (call_cop(ctx, init_buf_ctrls, ctx, MFC_CTRL_TYPE_SRC,
+			     vb->index) < 0)
+			mfc_ctx_err("failed in init_buf_ctrls\n");
+	} else {
+		mfc_ctx_err("unknown queue type\n");
+		return -EINVAL;
+	}
+
+	mfc_ctx_debug_leave();
+
+	return 0;
+}
+
+static int mfc_dec_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct mfc_ctx *ctx = vq->drv_priv;
+	struct mfc_buf *buf = vb_to_mfc_buf(vb);
+	struct mfc_raw_info *raw;
+	unsigned int index = vb->index;
+	size_t buf_size;
+	int i;
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		raw = &ctx->raw_buf;
+		/* check the size per plane */
+		if (ctx->dst_fmt->mem_planes == 1) {
+			buf_size = vb2_plane_size(vb, 0);
+			mfc_ctx_debug(2, "[FRAME] single plane vb size: %lu, calc size: %d\n",
+				      buf_size, raw->total_plane_size);
+			if (buf_size < raw->total_plane_size) {
+				mfc_ctx_err("[FRAME] single plane size(%lu) is smaller than (%d)\n",
+					    buf_size, raw->total_plane_size);
+				return -EINVAL;
+			}
+		} else {
+			for (i = 0; i < ctx->dst_fmt->mem_planes; i++) {
+				buf_size = vb2_plane_size(vb, i);
+				mfc_ctx_debug(2, "[FRAME] plane[%d] vb size: %lu, calc size: %d\n",
+					      i, buf_size, raw->plane_size[i]);
+				if (buf_size < raw->plane_size[i]) {
+					mfc_ctx_err("[FRAME] plane[%d] size(%lu) is smaller than (%d)\n",
+						    i, buf_size, raw->plane_size[i]);
+					return -EINVAL;
+				}
+			}
+		}
+		/* Copy dst buffer flag to buf_ctrl */
+		buf->flag = call_cop(ctx, get_buf_ctrl_val, ctx,
+				     &ctx->dst_ctrls[index],
+				     V4L2_CID_MPEG_VIDEO_DST_BUF_FLAG);
+
+		mfc_mem_buf_prepare(vb, 0);
+	} else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		buf_size = vb2_plane_size(vb, 0);
+		buf->sg_size = mfc_mem_get_sg_length(ctx->dev, vb2_dma_sg_plane_desc(vb, 0));
+		vb->planes[0].bytesused = buf->vb.planes[0].bytesused;
+		vb->planes[0].data_offset = buf->vb.planes[0].data_offset;
+		mfc_ctx_debug(2, "[STREAM] vb size, %ld, %s, %ld, sg_size, %zu, %s, %u, %s, %u\n",
+			      buf_size,
+			      "dbuf size", vb->planes[0].dbuf->size,
+			      buf->sg_size,
+			      "bytesused", vb->planes[0].bytesused,
+			      "data_offset", vb->planes[0].data_offset);
+
+		call_cop(ctx, to_buf_ctrls, ctx, &ctx->src_ctrls[index]);
+
+		/* Copy src buffer flag to buf_ctrl */
+		buf->flag = call_cop(ctx, get_buf_ctrl_val, ctx,
+				     &ctx->src_ctrls[index],
+				     V4L2_CID_MPEG_VIDEO_SRC_BUF_FLAG);
+
+		mfc_mem_buf_prepare(vb, 1);
+	}
+
+	return 0;
+}
+
+static void mfc_dec_buf_finish(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct mfc_ctx *ctx = vq->drv_priv;
+	struct mfc_buf *buf = vb_to_mfc_buf(vb);
+	unsigned int index = vb->index;
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		/* Copy to dst buffer flag */
+		call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+			 V4L2_CID_MPEG_VIDEO_DST_BUF_FLAG, buf->flag);
+		mfc_ctx_debug(4, "[FLAG] dst update buf[%d] flag = %#x\n",
+			      index, buf->flag);
+
+		call_cop(ctx, to_ctx_ctrls, ctx, &ctx->dst_ctrls[index]);
+
+		mfc_mem_buf_finish(vb, 0);
+	} else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		/* Copy to src buffer flag */
+		call_cop(ctx, update_buf_val, ctx, &ctx->src_ctrls[index],
+			 V4L2_CID_MPEG_VIDEO_SRC_BUF_FLAG, buf->flag);
+		mfc_ctx_debug(4, "[FLAG] src update buf[%d] flag = %#x\n",
+			      index, buf->flag);
+
+		call_cop(ctx, to_ctx_ctrls, ctx, &ctx->src_ctrls[index]);
+	}
+}
+
+static void mfc_dec_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct mfc_ctx *ctx = vq->drv_priv;
+	unsigned int index = vb->index;
+
+	mfc_ctx_debug_enter();
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		if (call_cop(ctx, cleanup_buf_ctrls, ctx,
+			     MFC_CTRL_TYPE_DST, index) < 0)
+			mfc_ctx_err("failed in cleanup_buf_ctrls\n");
+	} else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (call_cop(ctx, cleanup_buf_ctrls, ctx,
+			     MFC_CTRL_TYPE_SRC, index) < 0)
+			mfc_ctx_err("failed in cleanup_buf_ctrls\n");
+	} else {
+		mfc_ctx_err("unknown queue type\n");
+	}
+
+	mfc_ctx_debug_leave();
+}
+
+static int mfc_dec_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct mfc_ctx *ctx = q->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+
+	mfc_rm_update_real_time(ctx);
+
+	mfc_rm_request_work(dev, MFC_WORK_TRY, ctx);
+
+	return 0;
+}
+
+static void mfc_dec_stop_streaming(struct vb2_queue *q)
+{
+	struct mfc_ctx *ctx = q->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+
+	mfc_ctx_info("dec stop_streaming is called, type : %d\n", q->type);
+	MFC_TRACE_CTX("** DEC streamoff(type:%d)\n", q->type);
+
+	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		mfc_rm_request_work(ctx->dev, MFC_WORK_BUTLER, ctx);
+
+	mfc_rm_instance_dec_stop(dev, ctx, q->type);
+}
+
+static void mfc_dec_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct mfc_ctx *ctx = vq->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_buf *buf = vb_to_mfc_buf(vb);
+	int i;
+	unsigned char *stream_vir = NULL;
+
+	mfc_ctx_debug_enter();
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mutex_lock(&ctx->op_mode_mutex);
+		buf->src_index = ctx->serial_src_index++;
+		mfc_ctx_debug(2, "[BUFINFO] ctx[%d] add src index: %d(%d), addr: 0x%08llx\n",
+			      ctx->num, vb->index, buf->src_index,
+			      buf->addr[0][0]);
+		mutex_unlock(&ctx->op_mode_mutex);
+
+		if (vb->memory == V4L2_MEMORY_DMABUF &&
+		    mfc_rm_query_state(ctx, SMALLER, MFCINST_HEAD_PARSED))
+			stream_vir = vb2_plane_vaddr(vb, 0);
+
+		buf->vir_addr[0] = stream_vir;
+
+		mfc_add_tail_buf(ctx, &ctx->src_buf_ready_queue, buf);
+
+		if (dev->debugfs.debug_ts == 1)
+			mfc_ctx_info("[TS] framerate: %ld, timestamp: %lld\n",
+				     ctx->framerate, buf->vb.vb2_buf.timestamp);
+
+		MFC_TRACE_CTX("Q src[%d](%d) fd: %d, %#llx\n",
+			      vb->index, buf->src_index, vb->planes[0].m.fd, buf->addr[0][0]);
+	} else if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		for (i = 0; i < ctx->num_fd_frame; i++) {
+			// ToDo: if multi_view, vir_addr array_size could be over 3
+			buf->vir_addr[i] = vb2_plane_vaddr(vb, i);
+			mfc_ctx_debug(2, "[BUFINFO] ctx[%d] add dst index: %d, addr[0][%d]: 0x%08llx\n",
+				      ctx->num, vb->index, i, buf->addr[0][i]);
+			if (ctx->multi_view_enable) {
+				mfc_ctx_debug(2, "[BUFINFO-VIEW1] ctx[%d] add dst index: %d, addr[2][%d]: 0x%08llx\n",
+					      ctx->num, vb->index, i, buf->addr[2][i]);
+			}
+		}
+		mfc_store_dpb(ctx, vb);
+
+		if ((vb->memory == V4L2_MEMORY_USERPTR || vb->memory == V4L2_MEMORY_DMABUF) &&
+		    mfc_is_queue_count_same(&ctx->buf_queue_lock,
+					    &ctx->dst_buf_queue, dec->total_dpb_count))
+			ctx->capture_state = QUEUE_BUFS_MMAPED;
+
+		MFC_TRACE_CTX("Q dst[%d][%d] fd: %d, %#llx / used %#lx\n",
+			      vb->index, buf->dpb_index, vb->planes[0].m.fd,
+			      buf->addr[0][0], dec->dynamic_used);
+	} else {
+		mfc_ctx_err("Unsupported buffer type (%d)\n", vq->type);
+	}
+
+	mfc_rm_request_work(dev, MFC_WORK_TRY, ctx);
+
+	mfc_ctx_debug_leave();
+}
+
+static const struct vb2_ops mfc_dec_qops = {
+	.queue_setup		= mfc_dec_queue_setup,
+	.wait_prepare		= mfc_dec_unlock,
+	.wait_finish		= mfc_dec_lock,
+	.buf_init		= mfc_dec_buf_init,
+	.buf_prepare		= mfc_dec_buf_prepare,
+	.buf_finish		= mfc_dec_buf_finish,
+	.buf_cleanup		= mfc_dec_buf_cleanup,
+	.start_streaming	= mfc_dec_start_streaming,
+	.stop_streaming		= mfc_dec_stop_streaming,
+	.buf_queue		= mfc_dec_buf_queue,
+};
+
+const struct vb2_ops *mfc_get_dec_vb2_ops(void)
+{
+	return &mfc_dec_qops;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.h b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.h
new file mode 100644
index 000000000000..3d0cb7b14ce5
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_dec_vb2.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_DEC_VB2_H
+#define __MFC_DEC_VB2_H __FILE__
+
+#include "base/mfc_common.h"
+
+const struct vb2_ops *mfc_get_dec_vb2_ops(void);
+
+#endif /* __MFC_DEC_VB2_H */
-- 
2.34.1


