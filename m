Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CC1D262B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 22:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFS2elZucCwvUVq8bKQIqEMZIkwDxUlnbv7np3qdY9I=; b=4gqc63JpmJxDYoeddFxxDSp0WF
	tHf7YgqPl5ZT0eKLSLle0lFou8A36m9jOe+bNNnhxe+LFoWpMpqTdBcidrPyDFUmh065hJNXa/6iW
	DUz1i7LVayg4DFImDBwRX56SZkG+fCDMHESOK0myDRBvD3ydHD9ZKJlheGIZwRQ0tf195m0rFace3
	uWiaqbetGDNd3OqQ6P34QZqzTWc+IlyZpfbunQ+ao9tZnZIsGiUkftMaaSYDRylrq7zNZ9PqO50P1
	BSQjORVxAxAG0S0hg9bHyxF+UkO5V9vBqRRBWJ7i2+0saQDsbLeLqjzSrvanA4dnR5DV7u+o103ev
	3LxFSisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viK5s-00000004XYm-1r6u;
	Tue, 20 Jan 2026 22:21:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viK5i-00000004XJl-039Z;
	Tue, 20 Jan 2026 22:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768947647;
	bh=ebNX74oIktlqbhW/zDTev3zZOJaq70cmk36Ev38690M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yy1oh7qkw/I3wpuNmYGY5AM4wYkmd4X0wcNoRjdV+geoY0JAIhxb+oL43ddVf7g8R
	 gL5JU6uGcvjlGXiAfXnNWJSAF1kxJou+UNIni8+DVz4RraKV7uZv0B7Pa1iEzSpIjr
	 JaWPlzzKa0dEyCRMft9dsBEbPcilAE3IVsdSZ/Y7rDlveLekn01+RrOkBG0Ll7o8BA
	 NMQSVi097y2lRqAvJ+GqgUbdP9R38lT5YRfH8a8aSgoAXR/yOVjG+i+3JW9XWVffWw
	 p9Ak4wk4knVtvGxHMAXW1vpkYN6X0oNKrA+tz3Hbnf9dekzutAv4HeNqc//EL3G+Ya
	 pg9z3EdPWLCvw==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68D2017E140C;
	Tue, 20 Jan 2026 23:20:43 +0100 (CET)
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
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v9 06/17] media: rkvdec: Use structs to represent the HW RPS
Date: Tue, 20 Jan 2026 17:20:06 -0500
Message-ID: <20260120222018.404741-7-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120222018.404741-1-detlev.casanova@collabora.com>
References: <20260120222018.404741-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_142050_367251_E4DC5D6D 
X-CRM114-Status: GOOD (  14.54  )
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

This is in preparation to add support for other variants of the decoder.

Moving to struct representation is mainly to prepare for multicore
support that is present in e.g. rk3588.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../platform/rockchip/rkvdec/rkvdec-h264.c    | 93 +++++++++++++++++--
 1 file changed, 84 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
index 44e8f0098d921..d1d19dd6167b4 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
@@ -18,7 +18,6 @@
 
 /* Size with u32 units. */
 #define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
-#define RKV_RPS_SIZE			((128 + 128) / 4)
 #define RKV_ERROR_INFO_SIZE		(256 * 144 * 4)
 
 #define RKVDEC_NUM_REFLIST		3
@@ -33,6 +32,40 @@ struct rkvdec_sps_pps_packet {
 	u32 info[8];
 };
 
+struct rkvdec_rps_entry {
+	u32 dpb_info0:          5;
+	u32 bottom_flag0:       1;
+	u32 view_index_off0:    1;
+	u32 dpb_info1:          5;
+	u32 bottom_flag1:       1;
+	u32 view_index_off1:    1;
+	u32 dpb_info2:          5;
+	u32 bottom_flag2:       1;
+	u32 view_index_off2:    1;
+	u32 dpb_info3:          5;
+	u32 bottom_flag3:       1;
+	u32 view_index_off3:    1;
+	u32 dpb_info4:          5;
+	u32 bottom_flag4:       1;
+	u32 view_index_off4:    1;
+	u32 dpb_info5:          5;
+	u32 bottom_flag5:       1;
+	u32 view_index_off5:    1;
+	u32 dpb_info6:          5;
+	u32 bottom_flag6:       1;
+	u32 view_index_off6:    1;
+	u32 dpb_info7:          5;
+	u32 bottom_flag7:       1;
+	u32 view_index_off7:    1;
+} __packed;
+
+struct rkvdec_rps {
+	u16 frame_num[16];
+	u32 reserved0;
+	struct rkvdec_rps_entry entries[12];
+	u32 reserved1[66];
+} __packed;
+
 struct rkvdec_ps_field {
 	u16 offset;
 	u8 len;
@@ -93,7 +126,7 @@ struct rkvdec_ps_field {
 struct rkvdec_h264_priv_tbl {
 	s8 cabac_table[4][464][2];
 	struct rkvdec_h264_scaling_list scaling_list;
-	u32 rps[RKV_RPS_SIZE];
+	struct rkvdec_rps rps;
 	struct rkvdec_sps_pps_packet param_set[256];
 	u8 err_info[RKV_ERROR_INFO_SIZE];
 };
@@ -259,6 +292,51 @@ static void lookup_ref_buf_idx(struct rkvdec_ctx *ctx,
 	}
 }
 
+static void set_dpb_info(struct rkvdec_rps_entry *entries,
+			 u8 reflist,
+			 u8 refnum,
+			 u8 info,
+			 bool bottom)
+{
+	struct rkvdec_rps_entry *entry = &entries[(reflist * 4) + refnum / 8];
+	u8 idx = refnum % 8;
+
+	switch (idx) {
+	case 0:
+		entry->dpb_info0 = info;
+		entry->bottom_flag0 = bottom;
+		break;
+	case 1:
+		entry->dpb_info1 = info;
+		entry->bottom_flag1 = bottom;
+		break;
+	case 2:
+		entry->dpb_info2 = info;
+		entry->bottom_flag2 = bottom;
+		break;
+	case 3:
+		entry->dpb_info3 = info;
+		entry->bottom_flag3 = bottom;
+		break;
+	case 4:
+		entry->dpb_info4 = info;
+		entry->bottom_flag4 = bottom;
+		break;
+	case 5:
+		entry->dpb_info5 = info;
+		entry->bottom_flag5 = bottom;
+		break;
+	case 6:
+		entry->dpb_info6 = info;
+		entry->bottom_flag6 = bottom;
+		break;
+	case 7:
+		entry->dpb_info7 = info;
+		entry->bottom_flag7 = bottom;
+		break;
+	}
+}
+
 static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 			    struct v4l2_h264_reflist_builder *builder,
 			    struct rkvdec_h264_run *run)
@@ -268,11 +346,10 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
 
-	u32 *hw_rps = priv_tbl->rps;
+	struct rkvdec_rps *hw_rps = &priv_tbl->rps;
 	u32 i, j;
-	u16 *p = (u16 *)hw_rps;
 
-	memset(hw_rps, 0, sizeof(priv_tbl->rps));
+	memset(hw_rps, 0, sizeof(*hw_rps));
 
 	/*
 	 * Assign an invalid pic_num if DPB entry at that position is inactive.
@@ -284,7 +361,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
 			continue;
 
-		p[i] = builder->refs[i].frame_num;
+		hw_rps->frame_num[i] = builder->refs[i].frame_num;
 	}
 
 	for (j = 0; j < RKVDEC_NUM_REFLIST; j++) {
@@ -311,9 +388,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 			dpb_valid = run->ref_buf[ref->index] != NULL;
 			bottom = ref->fields == V4L2_H264_BOTTOM_FIELD_REF;
 
-			set_ps_field(hw_rps, DPB_INFO(i, j),
-				     ref->index | dpb_valid << 4);
-			set_ps_field(hw_rps, BOTTOM_FLAG(i, j), bottom);
+			set_dpb_info(hw_rps->entries, j, i, ref->index | (dpb_valid << 4), bottom);
 		}
 	}
 }
-- 
2.52.0


