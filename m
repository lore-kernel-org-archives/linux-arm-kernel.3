Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCEDC53219
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8DfFzu+jiw0YwnLPKzMF9rwItgemt8RX14X3+mRhAY=; b=rYM6txsGy4KqobMcI6MBMppzwr
	Hwoy3xNGIwVx+Ywu8LBUvHYmjRpYbuX9HFZNEpnc0JZ6ipe9ohpt1AQX2ZXSBbXO3Jty08+ptv4IQ
	qXaxu4h6VjbQxqm47KzIVdaOqnq3Ec5SUcO0rRnLrDfugFtdLAb3OF82vDBpi0wEXHCd3ADvXzTLD
	kkJZGpzSrUXnSFArWv7HYarcwM3kV2i+Cuvb+mnmTy0DWJEraMOxXuyD3GegUdvQrA7eXz2X4UrDD
	hDpHHHll9Zt0JoT0Ggopgo/1jo/JN/v/A87tjjHd+jFH3yyJO/mtEibhAuoZpBMxFvqEGBooLj0/E
	uE+6tedw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5Sy-00000001b3t-0RJx;
	Sun, 26 Jul 2026 20:28:56 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5So-00000001axw-1hnX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 20:28:48 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-381072761d4so1424707a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 13:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097726; x=1785702526; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8DfFzu+jiw0YwnLPKzMF9rwItgemt8RX14X3+mRhAY=;
        b=osLT2gOHIxqoqCu5kZ8gKz1w4TK0N194QKxHLBSUeK5EWFTpKRgnGTPGEHlJuVVVwq
         ghRNyMROgCiHA/kefhncpQU2hLR0sn6PbcQqhdzBrH8BBca9+nl19OlXBV1+XtLThs+j
         aUn3/76/qiBboCY8vRgiqnyD9PTikyeSd/xjYQ5tcDlSUFi5fd69iVggyoeGMXPHQbur
         iKvb0oKxYmEk+5LBdAfGpJJnJlYERu9wy6L5r2MJl8xsimIAuqEQc8YAgwoP+cTcAD0P
         iaiQXkKhTFNZy/zANk5SfAJqzAk0EDiQ64XOt5w0VhBwOm+he2mChJM6HQ7dlO6NMPHW
         4e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097726; x=1785702526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8DfFzu+jiw0YwnLPKzMF9rwItgemt8RX14X3+mRhAY=;
        b=MrBUzBOCwGJ89Ii54+gsAC6AbFb3KQAWQ0OLTlJSFHfAjondGSafICzCxHFtJ/yjKr
         2X2Ib7PHw+NVGIByBHeGvYegugCjaz3ZNE9UeROjYVI8hhBcJZsah1QOyR/c65YWCZNY
         VjB8LLMVHSFMViN4ySQdR6ggQ7Y5SbcHELrlbRaSXeiurkdDL3hsrsHs+4MJ3zYBN7Uv
         wTdOBBFy1fE5FeQoXMQRlofrYtk1TWhYD3mbTpB3/pJMoRCYgbLTYq3mFEEy+UXs8uYP
         Z7VrHFpdh1fu8uJ8iCBNcXUtWEidttwN4aW4lYB4TIQBSdp8yuw7IFwxqzui63ZUJ3kw
         J3hg==
X-Forwarded-Encrypted: i=1; AHgh+Rof5kQ0C7Afe3EBhw2zy0fN4h1qXb6QIF6KBi102/JgFKKEoF18ZD+wmdIZL7IwnrnPO5VxfhteGW4BuZ8Y+pef@lists.infradead.org
X-Gm-Message-State: AOJu0YwMz1XsJSUmRqrQiV+bW4Tl86PbnGoSRASpu1pj0DWxmSM96SL2
	y7Jpo0kgZgSqcZoaynHXRbDPLE4rac2enUWNatUpNGLn3ULDlJvfcLtv
X-Gm-Gg: AR+sD11maWBM8bRMz7u8gx//ZCOFLN+eMNibGcxbByNjCaq0Bn8ulY36teRd3q9dtVI
	8bzBowk62Mjdc1O25B+WP800DDXuNvk2t626QfkDfsOCguR7MvPRV4xgSZXk0QNtw/f/IAVF8KI
	hZken1AtMILa0kh/w/4JAVmy8iGSrHA+I58CZ3DYbrny23DxOJtXRqZz1Ahsv0tjUnuxEuuMvN4
	KPVUVE+CMLUvUN0YXziG3UKZTAEJ5asfsuf8Ni9LWQGJbPYh7jWJjinGDwnPEc9s7dmGh0WVWm9
	Es0tUm9VXSD2ov9cq5CdV4nWZbKAOJqPjYhtVDdOwnQ2DCDVu4NNv5S8MAKfmtFR26ZA4AA9axQ
	jP/ubpVDte6zZOAGofz8BWkud1JsWcIV9w3+Ykh970PjYK9FFem0Jq42B0bWH5DYxi7kekZBNLn
	GrIj0BOd1mcMtVjGPkUyMUzzLdd9ImJO45Tb04TjU6UtH6JwNN
X-Received: by 2002:a17:90b:390a:b0:38e:7d40:faea with SMTP id 98e67ed59e1d1-38f296189e3mr6139243a91.21.1785097725761;
        Sun, 26 Jul 2026 13:28:45 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4d7d:1e60:c46f:4bb9:6cdd:73bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6461ef84sm132697c88.14.2026.07.26.13.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:28:45 -0700 (PDT)
From: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Date: Sun, 26 Jul 2026 15:25:35 -0500
Subject: [PATCH 2/4] media: rkvdec: Move vp9 functions to common file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-2-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_132846_463923_F62B326C 
X-CRM114-Status: GOOD (  21.87  )
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

Refactor common VP9 functions in preparation for adding the VDPU381
variant

Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/Makefile    |   1 +
 .../platform/rockchip/rkvdec/rkvdec-vp9-common.c   |  65 ++++++++++++
 .../platform/rockchip/rkvdec/rkvdec-vp9-common.h   |  92 +++++++++++++++++
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    | 113 +--------------------
 4 files changed, 159 insertions(+), 112 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
index e629d571e4d8..2bbd67b2db11 100644
--- a/drivers/media/platform/rockchip/rkvdec/Makefile
+++ b/drivers/media/platform/rockchip/rkvdec/Makefile
@@ -12,4 +12,5 @@ rockchip-vdec-y += \
 		   rkvdec-vdpu381-hevc.o \
 		   rkvdec-vdpu383-h264.o \
 		   rkvdec-vdpu383-hevc.o \
+		   rkvdec-vp9-common.o \
 		   rkvdec-vp9.o
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.c
new file mode 100644
index 000000000000..a802f0acd27b
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip video decoder VP9 common functions
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ * Copyright (C) 2021 Collabora, Ltd.
+ *	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
+ *
+ * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
+ *	Alpha Lin <Alpha.Lin@rock-chips.com>
+ */
+#include <linux/v4l2-common.h>
+#include <media/v4l2-h264.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "rkvdec.h"
+#include "rkvdec-vp9-common.h"
+
+void write_coeff_plane(const u8 coef[6][6][3], u8 *coeff_plane)
+{
+	unsigned int idx = 0, byte_count = 0;
+	int k, m, n;
+	u8 p;
+
+	for (k = 0; k < 6; k++) {
+		for (m = 0; m < 6; m++) {
+			for (n = 0; n < 3; n++) {
+				p = coef[k][m][n];
+				coeff_plane[idx++] = p;
+				byte_count++;
+				if (byte_count == 27) {
+					idx += 5;
+					byte_count = 0;
+				}
+			}
+		}
+	}
+}
+
+struct rkvdec_decoded_buffer *
+get_ref_buf_vp9(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
+	struct vb2_buffer *buf;
+
+	/*
+	 * If a ref is unused or invalid, address of current destination
+	 * buffer is returned.
+	 */
+	buf = vb2_find_buffer(cap_q, timestamp);
+	if (!buf)
+		buf = &dst->vb2_buf;
+
+	return vb2_to_rkvdec_decoded_buf(buf);
+}
+
+void update_dec_buf_info(struct rkvdec_decoded_buffer *buf,
+			 const struct v4l2_ctrl_vp9_frame *dec_params)
+{
+	buf->vp9.width = dec_params->frame_width_minus_1 + 1;
+	buf->vp9.height = dec_params->frame_height_minus_1 + 1;
+	buf->vp9.bit_depth = dec_params->bit_depth;
+}
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.h
new file mode 100644
index 000000000000..0d042215fad2
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip video decoder VP9 common functions
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ * Copyright (C) 2021 Collabora, Ltd.
+ *	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
+ *
+ * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
+ *	Alpha Lin <Alpha.Lin@rock-chips.com>
+ */
+
+#include <media/v4l2-h264.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-vp9.h>
+
+#include "rkvdec.h"
+
+struct rkvdec_vp9_run {
+	struct rkvdec_run base;
+	const struct v4l2_ctrl_vp9_frame *decode_params;
+};
+
+struct rkvdec_vp9_intra_mode_probs {
+	u8 y_mode[105];
+	u8 uv_mode[23];
+};
+
+struct rkvdec_vp9_intra_only_frame_probs {
+	u8 coef_intra[4][2][128];
+	struct rkvdec_vp9_intra_mode_probs intra_mode[10];
+};
+
+struct rkvdec_vp9_inter_frame_probs {
+	u8 y_mode[4][9];
+	u8 comp_mode[5];
+	u8 comp_ref[5];
+	u8 single_ref[5][2];
+	u8 inter_mode[7][3];
+	u8 interp_filter[4][2];
+	u8 padding0[11];
+	u8 coef[2][4][2][128];
+	u8 uv_mode_0_2[3][9];
+	u8 padding1[5];
+	u8 uv_mode_3_5[3][9];
+	u8 padding2[5];
+	u8 uv_mode_6_8[3][9];
+	u8 padding3[5];
+	u8 uv_mode_9[9];
+	u8 padding4[7];
+	u8 padding5[16];
+	struct {
+		u8 joint[3];
+		u8 sign[2];
+		u8 classes[2][10];
+		u8 class0_bit[2];
+		u8 bits[2][10];
+		u8 class0_fr[2][2][3];
+		u8 fr[2][3];
+		u8 class0_hp[2];
+		u8 hp[2];
+		u8 padding6[3];
+	} mv;
+};
+
+struct rkvdec_vp9_probs {
+	u8 partition[16][3];
+	u8 pred[3];
+	u8 tree[7];
+	u8 skip[3];
+	u8 tx32[2][3];
+	u8 tx16[2][2];
+	u8 tx8[2][1];
+	u8 is_inter[4];
+	/* 128 bit alignment */
+	u8 padding0[3];
+	union {
+		struct rkvdec_vp9_inter_frame_probs inter;
+		struct rkvdec_vp9_intra_only_frame_probs intra_only;
+	};
+	/* 128 bit alignment */
+	u8 padding1[8];
+};
+
+void write_coeff_plane(const u8 coef[6][6][3], u8 *coeff_plane);
+
+struct rkvdec_decoded_buffer *
+get_ref_buf_vp9(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp);
+
+void update_dec_buf_info(struct rkvdec_decoded_buffer *buf,
+			 const struct v4l2_ctrl_vp9_frame *dec_params);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index d4243ce230c7..495738762713 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -23,71 +23,12 @@
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
+#include "rkvdec-vp9-common.h"
 
 #define RKVDEC_VP9_PROBE_SIZE		4864
 #define RKVDEC_VP9_COUNT_SIZE		13232
 #define RKVDEC_VP9_MAX_SEGMAP_SIZE	73728
 
-struct rkvdec_vp9_intra_mode_probs {
-	u8 y_mode[105];
-	u8 uv_mode[23];
-};
-
-struct rkvdec_vp9_intra_only_frame_probs {
-	u8 coef_intra[4][2][128];
-	struct rkvdec_vp9_intra_mode_probs intra_mode[10];
-};
-
-struct rkvdec_vp9_inter_frame_probs {
-	u8 y_mode[4][9];
-	u8 comp_mode[5];
-	u8 comp_ref[5];
-	u8 single_ref[5][2];
-	u8 inter_mode[7][3];
-	u8 interp_filter[4][2];
-	u8 padding0[11];
-	u8 coef[2][4][2][128];
-	u8 uv_mode_0_2[3][9];
-	u8 padding1[5];
-	u8 uv_mode_3_5[3][9];
-	u8 padding2[5];
-	u8 uv_mode_6_8[3][9];
-	u8 padding3[5];
-	u8 uv_mode_9[9];
-	u8 padding4[7];
-	u8 padding5[16];
-	struct {
-		u8 joint[3];
-		u8 sign[2];
-		u8 classes[2][10];
-		u8 class0_bit[2];
-		u8 bits[2][10];
-		u8 class0_fr[2][2][3];
-		u8 fr[2][3];
-		u8 class0_hp[2];
-		u8 hp[2];
-	} mv;
-};
-
-struct rkvdec_vp9_probs {
-	u8 partition[16][3];
-	u8 pred[3];
-	u8 tree[7];
-	u8 skip[3];
-	u8 tx32[2][3];
-	u8 tx16[2][2];
-	u8 tx8[2][1];
-	u8 is_inter[4];
-	/* 128 bit alignment */
-	u8 padding0[3];
-	union {
-		struct rkvdec_vp9_inter_frame_probs inter;
-		struct rkvdec_vp9_intra_only_frame_probs intra_only;
-	};
-	/* 128 bit alignment */
-	u8 padding1[11];
-};
-
 /* Data structure describing auxiliary buffer format. */
 struct rkvdec_vp9_priv_tbl {
 	struct rkvdec_vp9_probs probs;
@@ -136,11 +77,6 @@ struct rkvdec_vp9_intra_frame_symbol_counts {
 	struct rkvdec_vp9_refs_counts ref_cnt[2][4][2][6][6];
 };
 
-struct rkvdec_vp9_run {
-	struct rkvdec_run base;
-	const struct v4l2_ctrl_vp9_frame *decode_params;
-};
-
 struct rkvdec_vp9_frame_info {
 	u32 valid : 1;
 	u32 segmapid : 1;
@@ -166,27 +102,6 @@ struct rkvdec_vp9_ctx {
 	struct rkvdec_regs regs;
 };
 
-static void write_coeff_plane(const u8 coef[6][6][3], u8 *coeff_plane)
-{
-	unsigned int idx = 0, byte_count = 0;
-	int k, m, n;
-	u8 p;
-
-	for (k = 0; k < 6; k++) {
-		for (m = 0; m < 6; m++) {
-			for (n = 0; n < 3; n++) {
-				p = coef[k][m][n];
-				coeff_plane[idx++] = p;
-				byte_count++;
-				if (byte_count == 27) {
-					idx += 5;
-					byte_count = 0;
-				}
-			}
-		}
-	}
-}
-
 static void init_intra_only_probs(struct rkvdec_ctx *ctx,
 				  const struct rkvdec_vp9_run *run)
 {
@@ -348,24 +263,6 @@ static void init_probs(struct rkvdec_ctx *ctx,
 		init_inter_probs(ctx, run);
 }
 
-static struct rkvdec_decoded_buffer *
-get_ref_buf_vp9(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
-{
-	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
-	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
-	struct vb2_buffer *buf;
-
-	/*
-	 * If a ref is unused or invalid, address of current destination
-	 * buffer is returned.
-	 */
-	buf = vb2_find_buffer(cap_q, timestamp);
-	if (!buf)
-		buf = &dst->vb2_buf;
-
-	return vb2_to_rkvdec_decoded_buf(buf);
-}
-
 static dma_addr_t get_mv_base_addr(struct rkvdec_decoded_buffer *buf)
 {
 	unsigned int aligned_pitch, aligned_height, yuv_len;
@@ -446,14 +343,6 @@ static void config_seg_registers(struct rkvdec_ctx *ctx, unsigned int segid)
 		(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE);
 }
 
-static void update_dec_buf_info(struct rkvdec_decoded_buffer *buf,
-				const struct v4l2_ctrl_vp9_frame *dec_params)
-{
-	buf->vp9.width = dec_params->frame_width_minus_1 + 1;
-	buf->vp9.height = dec_params->frame_height_minus_1 + 1;
-	buf->vp9.bit_depth = dec_params->bit_depth;
-}
-
 static void update_ctx_cur_info(struct rkvdec_vp9_ctx *vp9_ctx,
 				struct rkvdec_decoded_buffer *buf,
 				const struct v4l2_ctrl_vp9_frame *dec_params)

-- 
2.43.0


