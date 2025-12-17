Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8CDD66B80
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 17:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhAl/2QkitxAyBjvF29Vcs5EWyxWusRSSt0g+USN7Ac=; b=KGK/s9tWzhbdVBhqfiJ0mLxh3J
	4SK0Bh/1QJXuGaaKXwRqDmkardTZRJeLG65VyjFkYZj+YBjebxtlkK4wzQhtRfnlebz2NrzeqVuHb
	psYh9KlVrOUMpnkm65bpl5FB7erBsmj5FV5vEMJt4ZrTz5WnmqXV36gFxp3F54w+FfbsotNIiTnNN
	GINJveZv2T7Gh9GytP4Fl8IlAFQgFqh2tiZw0/90TqfzJKPRVLct6HVLQyq7YNEZZ9dtzx3fK64MC
	FtMXo7FyjSPjmVHuMrvqHHIN2rkfqQxrPmQkgOYuPCzK4LmDxI31zHbLsFlUo9jHv665GfttEnvnP
	E4stK0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVvXb-00000007CJa-41dP;
	Wed, 17 Dec 2025 17:42:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVvXN-00000007C1K-43bF;
	Wed, 17 Dec 2025 17:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765993328;
	bh=xbbwvmdsU1ChpCPi2zZn8PR8coJ65LLHRP7kpiXoaFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HG3NnmKUfxhFY9swZF0kw55LtK+B1D0MOyD9zXUlfQQl5OHdchkQZw5JL1C5pFIUz
	 FxfSXht4vQkKfNxq87rN/EAya0Gg7t8FOXNNIoydSLVuWE4gLNOJEFGr6gqdU0GuEr
	 XmbxCBXp9ScP5WAz3JZIcyZtN51vgub/6e1QJ095cbFmAC4PIIpKgQnwvaOflpJuZS
	 1c6bq48w86/lISfBr3iZZQqvN9kzpldIpmwfjm198fHDtQ2AOHUWKzPRhDoV+vFhdK
	 pvzko27yQhoH7RXsGnyukg/6VCdcMnscT9WjbKO1rpmDkKpeIKo2LmszOGXcgFrIyY
	 +ZTEj7Z+45KLw==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6017E17E13F9;
	Wed, 17 Dec 2025 18:42:05 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v6 08/17] media: rkvdec: Move hevc functions to common file
Date: Wed, 17 Dec 2025 12:40:45 -0500
Message-ID: <20251217174059.1341784-9-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217174059.1341784-1-detlev.casanova@collabora.com>
References: <20251217174059.1341784-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_094210_327569_2AF08D75 
X-CRM114-Status: GOOD (  26.90  )
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

This is a preparation commit to add support for new variants of the
decoder.

The functions will later be shared with vdpu381 (rk3588) and vdpu383
(rk3576).

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/Makefile   |   1 +
 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 182 ++++++++++++++++
 .../rockchip/rkvdec/rkvdec-hevc-common.h      |  48 +++++
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    | 194 +-----------------
 4 files changed, 238 insertions(+), 187 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h

diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
index d2ba7a7c15e5..1b4bc44be23e 100644
--- a/drivers/media/platform/rockchip/rkvdec/Makefile
+++ b/drivers/media/platform/rockchip/rkvdec/Makefile
@@ -6,4 +6,5 @@ rockchip-vdec-y += \
 		   rkvdec-h264.o \
 		   rkvdec-h264-common.o \
 		   rkvdec-hevc.o \
+		   rkvdec-hevc-common.o \
 		   rkvdec-vp9.o
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
new file mode 100644
index 000000000000..23547e2e6e1d
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip video decoder hevc common functions
+ *
+ * Copyright (C) 2025 Collabora, Ltd.
+ *      Detlev Casanova <detlev.casanova@collabora.com>
+ *
+ * Copyright (C) 2023 Collabora, Ltd.
+ *      Sebastian Fricke <sebastian.fricke@collabora.com>
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ *
+ * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
+ *	Jeffy Chen <jeffy.chen@rock-chips.com>
+ */
+
+#include <linux/v4l2-common.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "rkvdec.h"
+#include "rkvdec-hevc-common.h"
+
+/*
+ * Flip one or more matrices along their main diagonal and flatten them
+ * before writing it to the memory.
+ * Convert:
+ * ABCD         AEIM
+ * EFGH     =>  BFJN     =>     AEIMBFJNCGKODHLP
+ * IJKL         CGKO
+ * MNOP         DHLP
+ */
+static void transpose_and_flatten_matrices(u8 *output, const u8 *input,
+					   int matrices, int row_length)
+{
+	int i, j, row, x_offset, matrix_offset, rot_index, y_offset, matrix_size, new_value;
+
+	matrix_size = row_length * row_length;
+	for (i = 0; i < matrices; i++) {
+		row = 0;
+		x_offset = 0;
+		matrix_offset = i * matrix_size;
+		for (j = 0; j < matrix_size; j++) {
+			y_offset = j - (row * row_length);
+			rot_index = y_offset * row_length + x_offset;
+			new_value = *(input + i * matrix_size + j);
+			output[matrix_offset + rot_index] = new_value;
+			if ((j + 1) % row_length == 0) {
+				row += 1;
+				x_offset += 1;
+			}
+		}
+	}
+}
+
+static void assemble_scalingfactor0(u8 *output, const struct v4l2_ctrl_hevc_scaling_matrix *input)
+{
+	int offset = 0;
+
+	transpose_and_flatten_matrices(output, (const u8 *)input->scaling_list_4x4, 6, 4);
+	offset = 6 * 16 * sizeof(u8);
+	transpose_and_flatten_matrices(output + offset, (const u8 *)input->scaling_list_8x8, 6, 8);
+	offset += 6 * 64 * sizeof(u8);
+	transpose_and_flatten_matrices(output + offset,
+				       (const u8 *)input->scaling_list_16x16, 6, 8);
+	offset += 6 * 64 * sizeof(u8);
+	/* Add a 128 byte padding with 0s between the two 32x32 matrices */
+	transpose_and_flatten_matrices(output + offset,
+				       (const u8 *)input->scaling_list_32x32, 1, 8);
+	offset += 64 * sizeof(u8);
+	memset(output + offset, 0, 128);
+	offset += 128 * sizeof(u8);
+	transpose_and_flatten_matrices(output + offset,
+				       (const u8 *)input->scaling_list_32x32 + (64 * sizeof(u8)),
+				       1, 8);
+	offset += 64 * sizeof(u8);
+	memset(output + offset, 0, 128);
+}
+
+/*
+ * Required layout:
+ * A = scaling_list_dc_coef_16x16
+ * B = scaling_list_dc_coef_32x32
+ * 0 = Padding
+ *
+ * A, A, A, A, A, A, B, 0, 0, B, 0, 0
+ */
+static void assemble_scalingdc(u8 *output, const struct v4l2_ctrl_hevc_scaling_matrix *input)
+{
+	u8 list_32x32[6] = {0};
+
+	memcpy(output, input->scaling_list_dc_coef_16x16, 6 * sizeof(u8));
+	list_32x32[0] = input->scaling_list_dc_coef_32x32[0];
+	list_32x32[3] = input->scaling_list_dc_coef_32x32[1];
+	memcpy(output + 6 * sizeof(u8), list_32x32, 6 * sizeof(u8));
+}
+
+static void translate_scaling_list(struct scaling_factor *output,
+				   const struct v4l2_ctrl_hevc_scaling_matrix *input)
+{
+	assemble_scalingfactor0(output->scalingfactor0, input);
+	memcpy(output->scalingfactor1, (const u8 *)input->scaling_list_4x4, 96);
+	assemble_scalingdc(output->scalingdc, input);
+	memset(output->reserved, 0, 4 * sizeof(u8));
+}
+
+void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
+					  struct scaling_factor *scaling_factor,
+					  struct v4l2_ctrl_hevc_scaling_matrix *cache)
+{
+	const struct v4l2_ctrl_hevc_scaling_matrix *scaling = run->scaling_matrix;
+
+	if (!memcmp(cache, scaling,
+		    sizeof(struct v4l2_ctrl_hevc_scaling_matrix)))
+		return;
+
+	translate_scaling_list(scaling_factor, scaling);
+
+	memcpy(cache, scaling,
+	       sizeof(struct v4l2_ctrl_hevc_scaling_matrix));
+}
+
+struct vb2_buffer *
+get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run,
+	    unsigned int dpb_idx)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	const struct v4l2_ctrl_hevc_decode_params *decode_params = run->decode_params;
+	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
+	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
+	struct vb2_buffer *buf = NULL;
+
+	if (dpb_idx < decode_params->num_active_dpb_entries)
+		buf = vb2_find_buffer(cap_q, dpb[dpb_idx].timestamp);
+
+	/*
+	 * If a DPB entry is unused or invalid, the address of current destination
+	 * buffer is returned.
+	 */
+	if (!buf)
+		return &run->base.bufs.dst->vb2_buf;
+
+	return buf;
+}
+
+#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
+
+int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
+
+	fmt->num_planes = 1;
+	if (!fmt->plane_fmt[0].sizeimage)
+		fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
+					      RKVDEC_HEVC_MAX_DEPTH_IN_BYTES;
+	return 0;
+}
+
+void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
+			      struct rkvdec_hevc_run *run)
+{
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
+	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_SLICE_PARAMS);
+	run->slices_params = ctrl ? ctrl->p_cur.p : NULL;
+	run->num_slices = ctrl ? ctrl->new_elems : 0;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_SPS);
+	run->sps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_PPS);
+	run->pps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
+	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
+
+	rkvdec_run_preamble(ctx, &run->base);
+}
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
new file mode 100644
index 000000000000..8af33bfd541c
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip video decoder hevc common functions
+ *
+ * Copyright (C) 2025 Collabora, Ltd.
+ *      Detlev Casanova <detlev.casanova@collabora.com>
+ *
+ * Copyright (C) 2023 Collabora, Ltd.
+ *      Sebastian Fricke <sebastian.fricke@collabora.com>
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ *
+ * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
+ *	Jeffy Chen <jeffy.chen@rock-chips.com>
+ */
+
+#include <media/v4l2-mem2mem.h>
+#include "rkvdec.h"
+
+#define RKV_HEVC_CABAC_TABLE_SIZE		27456
+extern const u8 rkvdec_hevc_cabac_table[RKV_HEVC_CABAC_TABLE_SIZE];
+
+struct rkvdec_hevc_run {
+	struct rkvdec_run base;
+	const struct v4l2_ctrl_hevc_slice_params *slices_params;
+	const struct v4l2_ctrl_hevc_decode_params *decode_params;
+	const struct v4l2_ctrl_hevc_sps *sps;
+	const struct v4l2_ctrl_hevc_pps *pps;
+	const struct v4l2_ctrl_hevc_scaling_matrix *scaling_matrix;
+	int num_slices;
+};
+
+struct scaling_factor {
+	u8 scalingfactor0[1248];
+	u8 scalingfactor1[96];	/*4X4 TU Rotate, total 16X4*/
+	u8 scalingdc[12];	/*N1005 Vienna Meeting*/
+	u8 reserved[4];		/*16Bytes align*/
+};
+
+void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
+					  struct scaling_factor *scaling_factor,
+					  struct v4l2_ctrl_hevc_scaling_matrix *cache);
+struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
+			       struct rkvdec_hevc_run *run,
+			       unsigned int dpb_idx);
+int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f);
+void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index b01c1bb52a04..650c20f3f4aa 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -16,6 +16,7 @@
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
+#include "rkvdec-hevc-common.h"
 
 /* Size in u8/u32 units. */
 #define RKV_SCALING_LIST_SIZE		1360
@@ -24,9 +25,6 @@
 #define RKV_RPS_SIZE			(32 / 4)
 #define RKV_RPS_LEN			600
 
-#define RKV_HEVC_CABAC_TABLE_SIZE		27456
-extern const u8 rkvdec_hevc_cabac_table[RKV_HEVC_CABAC_TABLE_SIZE];
-
 struct rkvdec_sps_pps_packet {
 	u32 info[RKV_PPS_SIZE];
 };
@@ -113,34 +111,17 @@ struct rkvdec_ps_field {
 /* Data structure describing auxiliary buffer format. */
 struct rkvdec_hevc_priv_tbl {
 	u8 cabac_table[RKV_HEVC_CABAC_TABLE_SIZE];
-	u8 scaling_list[RKV_SCALING_LIST_SIZE];
+	struct scaling_factor scaling_list;
 	struct rkvdec_sps_pps_packet param_set[RKV_PPS_LEN];
 	struct rkvdec_rps_packet rps[RKV_RPS_LEN];
 };
 
-struct rkvdec_hevc_run {
-	struct rkvdec_run base;
-	const struct v4l2_ctrl_hevc_slice_params *slices_params;
-	const struct v4l2_ctrl_hevc_decode_params *decode_params;
-	const struct v4l2_ctrl_hevc_sps *sps;
-	const struct v4l2_ctrl_hevc_pps *pps;
-	const struct v4l2_ctrl_hevc_scaling_matrix *scaling_matrix;
-	int num_slices;
-};
-
 struct rkvdec_hevc_ctx {
 	struct rkvdec_aux_buf priv_tbl;
 	struct v4l2_ctrl_hevc_scaling_matrix scaling_matrix_cache;
 	struct rkvdec_regs regs;
 };
 
-struct scaling_factor {
-	u8 scalingfactor0[1248];
-	u8 scalingfactor1[96];		/*4X4 TU Rotate, total 16X4*/
-	u8 scalingdc[12];		/*N1005 Vienna Meeting*/
-	u8 reserved[4];		/*16Bytes align*/
-};
-
 static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u32 value)
 {
 	u8 bit = field.offset % 32, word = field.offset / 32;
@@ -417,131 +398,6 @@ static void assemble_sw_rps(struct rkvdec_ctx *ctx,
 	}
 }
 
-/*
- * Flip one or more matrices along their main diagonal and flatten them
- * before writing it to the memory.
- * Convert:
- * ABCD         AEIM
- * EFGH     =>  BFJN     =>     AEIMBFJNCGKODHLP
- * IJKL         CGKO
- * MNOP         DHLP
- */
-static void transpose_and_flatten_matrices(u8 *output, const u8 *input,
-					   int matrices, int row_length)
-{
-	int i, j, row, x_offset, matrix_offset, rot_index, y_offset, matrix_size, new_value;
-
-	matrix_size = row_length * row_length;
-	for (i = 0; i < matrices; i++) {
-		row = 0;
-		x_offset = 0;
-		matrix_offset = i * matrix_size;
-		for (j = 0; j < matrix_size; j++) {
-			y_offset = j - (row * row_length);
-			rot_index = y_offset * row_length + x_offset;
-			new_value = *(input + i * matrix_size + j);
-			output[matrix_offset + rot_index] = new_value;
-			if ((j + 1) % row_length == 0) {
-				row += 1;
-				x_offset += 1;
-			}
-		}
-	}
-}
-
-static void assemble_scalingfactor0(u8 *output, const struct v4l2_ctrl_hevc_scaling_matrix *input)
-{
-	int offset = 0;
-
-	transpose_and_flatten_matrices(output, (const u8 *)input->scaling_list_4x4, 6, 4);
-	offset = 6 * 16 * sizeof(u8);
-	transpose_and_flatten_matrices(output + offset, (const u8 *)input->scaling_list_8x8, 6, 8);
-	offset += 6 * 64 * sizeof(u8);
-	transpose_and_flatten_matrices(output + offset,
-				       (const u8 *)input->scaling_list_16x16, 6, 8);
-	offset += 6 * 64 * sizeof(u8);
-	/* Add a 128 byte padding with 0s between the two 32x32 matrices */
-	transpose_and_flatten_matrices(output + offset,
-				       (const u8 *)input->scaling_list_32x32, 1, 8);
-	offset += 64 * sizeof(u8);
-	memset(output + offset, 0, 128);
-	offset += 128 * sizeof(u8);
-	transpose_and_flatten_matrices(output + offset,
-				       (const u8 *)input->scaling_list_32x32 + (64 * sizeof(u8)),
-				       1, 8);
-	offset += 64 * sizeof(u8);
-	memset(output + offset, 0, 128);
-}
-
-/*
- * Required layout:
- * A = scaling_list_dc_coef_16x16
- * B = scaling_list_dc_coef_32x32
- * 0 = Padding
- *
- * A, A, A, A, A, A, B, 0, 0, B, 0, 0
- */
-static void assemble_scalingdc(u8 *output, const struct v4l2_ctrl_hevc_scaling_matrix *input)
-{
-	u8 list_32x32[6] = {0};
-
-	memcpy(output, input->scaling_list_dc_coef_16x16, 6 * sizeof(u8));
-	list_32x32[0] = input->scaling_list_dc_coef_32x32[0];
-	list_32x32[3] = input->scaling_list_dc_coef_32x32[1];
-	memcpy(output + 6 * sizeof(u8), list_32x32, 6 * sizeof(u8));
-}
-
-static void translate_scaling_list(struct scaling_factor *output,
-				   const struct v4l2_ctrl_hevc_scaling_matrix *input)
-{
-	assemble_scalingfactor0(output->scalingfactor0, input);
-	memcpy(output->scalingfactor1, (const u8 *)input->scaling_list_4x4, 96);
-	assemble_scalingdc(output->scalingdc, input);
-	memset(output->reserved, 0, 4 * sizeof(u8));
-}
-
-static void assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
-				     struct rkvdec_hevc_run *run)
-{
-	const struct v4l2_ctrl_hevc_scaling_matrix *scaling = run->scaling_matrix;
-	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
-	struct rkvdec_hevc_priv_tbl *tbl = hevc_ctx->priv_tbl.cpu;
-	u8 *dst;
-
-	if (!memcmp((void *)&hevc_ctx->scaling_matrix_cache, scaling,
-		    sizeof(struct v4l2_ctrl_hevc_scaling_matrix)))
-		return;
-
-	dst = tbl->scaling_list;
-	translate_scaling_list((struct scaling_factor *)dst, scaling);
-
-	memcpy((void *)&hevc_ctx->scaling_matrix_cache, scaling,
-	       sizeof(struct v4l2_ctrl_hevc_scaling_matrix));
-}
-
-static struct vb2_buffer *
-get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run,
-	    unsigned int dpb_idx)
-{
-	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
-	const struct v4l2_ctrl_hevc_decode_params *decode_params = run->decode_params;
-	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
-	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
-	struct vb2_buffer *buf = NULL;
-
-	if (dpb_idx < decode_params->num_active_dpb_entries)
-		buf = vb2_find_buffer(cap_q, dpb[dpb_idx].timestamp);
-
-	/*
-	 * If a DPB entry is unused or invalid, the address of current destination
-	 * buffer is returned.
-	 */
-	if (!buf)
-		return &run->base.bufs.dst->vb2_buf;
-
-	return buf;
-}
-
 static void config_registers(struct rkvdec_ctx *ctx,
 			     struct rkvdec_hevc_run *run)
 {
@@ -644,20 +500,6 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	rkvdec_memcpy_toio(rkvdec->regs, regs, MIN(sizeof(*regs), 4 * rkvdec->variant->num_regs));
 }
 
-#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
-
-static int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx,
-				  struct v4l2_format *f)
-{
-	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
-
-	fmt->num_planes = 1;
-	if (!fmt->plane_fmt[0].sizeimage)
-		fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
-					      RKVDEC_HEVC_MAX_DEPTH_IN_BYTES;
-	return 0;
-}
-
 static enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx,
 						       struct v4l2_ctrl *ctrl)
 {
@@ -691,7 +533,7 @@ static int rkvdec_hevc_validate_sps(struct rkvdec_ctx *ctx,
 		/* Luma and chroma bit depth mismatch */
 		return -EINVAL;
 	if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
-		/* Only 8-bit and 10-bit is supported */
+		/* Only 8-bit and 10-bit are supported */
 		return -EINVAL;
 
 	if (sps->pic_width_in_luma_samples > ctx->coded_fmt.fmt.pix_mp.width ||
@@ -737,40 +579,18 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	kfree(hevc_ctx);
 }
 
-static void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
-				     struct rkvdec_hevc_run *run)
-{
-	struct v4l2_ctrl *ctrl;
-
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
-	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_HEVC_SLICE_PARAMS);
-	run->slices_params = ctrl ? ctrl->p_cur.p : NULL;
-	run->num_slices = ctrl ? ctrl->new_elems : 0;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_HEVC_SPS);
-	run->sps = ctrl ? ctrl->p_cur.p : NULL;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_HEVC_PPS);
-	run->pps = ctrl ? ctrl->p_cur.p : NULL;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
-	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
-
-	rkvdec_run_preamble(ctx, &run->base);
-}
-
 static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_hevc_run run;
+	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
+	struct rkvdec_hevc_priv_tbl *tbl = hevc_ctx->priv_tbl.cpu;
 	u32 reg;
 
 	rkvdec_hevc_run_preamble(ctx, &run);
 
-	assemble_hw_scaling_list(ctx, &run);
+	rkvdec_hevc_assemble_hw_scaling_list(&run, &tbl->scaling_list,
+					     &hevc_ctx->scaling_matrix_cache);
 	assemble_hw_pps(ctx, &run);
 	assemble_sw_rps(ctx, &run);
 	config_registers(ctx, &run);
-- 
2.52.0


