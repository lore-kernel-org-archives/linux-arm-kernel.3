Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758D810F286C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFPGr2vHfLN0oelwoMVUCIsI6AJ/2lQYMAVc2+yuKqE=; b=He8O++vqvwkQaHU+YU79xL9ELw
	0mjv57idabh91bswFEE5p55pPzufNP1qoTywPp7AD5BWDOPqBaD50pDvtuToZPc85yvWa5oCBl7//
	eqbFl2vrU2cnwor5kbern4EkDzm+iTQZLiCevxNkKP82/7WwRUZkZVjkOc1vqsW+fYslthsKnT2t1
	eX/5l51kdh9o+w7mMDgCj/1Vf+wTo76WtT/iAWdsJB6vcIUlNH3cfr/4PZurdDbVI46XXgOp1ay/J
	rh+vWjPQh/K2AF8GfbA06Q2zvk1cBAgOxq9afkRntOjbyhJyPSKy98hgGdEqDYXyy9LF4Xw+FW2Vm
	BHe2uR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Che-0000000851X-2ipu;
	Fri, 27 Mar 2026 19:18:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ChS-000000084vF-1H3T;
	Fri, 27 Mar 2026 19:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774639108;
	bh=ztdOpe1+N7AYJi9ZYllZm3LlSnBDs1ybZtX80GDvQQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BuZZyCxveSRcGt8lKPrzVLdy6jemtDzTHLeG/oURIkavG2bMUMY0wqj76WQ1XZKUj
	 Owg4G8VKeXKidLc4n2S9ci/i6YTjoi4es0dDC4SwKYkjUK55F/nhhjmfpwlvvKDTl9
	 xKnx5jBrqmlWXQEMFNcfVzNGEH6cHGFRKIC5pGVWBwMpvn3Rke5U0wuOKJvh7gwvNr
	 c2w48UdWMVb2dkAb/K7zk9gqyomtxeXnFdRiYab5NB968UvbzmaRI8d28hvGBsLljo
	 7AQssPasMYpEQQS3ehdxFQmYg/8xgwt0XHTIfwCCphn7XBLPot4fL4RJ92Olghtoiv
	 ZSTS7f0irxN1A==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E15D17E5D22;
	Fri, 27 Mar 2026 20:18:26 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Mar 2026 15:18:20 -0400
Subject: [PATCH v2 2/4] media: rkvdec: Use the global bitwriter instead of
 local one
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rkvdec-use-bitwriter-v2-2-a5a4754b0518@collabora.com>
References: <20260327-rkvdec-use-bitwriter-v2-0-a5a4754b0518@collabora.com>
In-Reply-To: <20260327-rkvdec-use-bitwriter-v2-0-a5a4754b0518@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_121830_698590_26C3049D 
X-CRM114-Status: GOOD (  11.09  )
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

Both rkvdec-h264.c and rkvdec-hevc.c use their own bitwriter
function and macros.

Move to using the global one introduced before.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   | 109 ++++++-------
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   | 171 +++++++++------------
 2 files changed, 119 insertions(+), 161 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
index d3202cecb988..ffa606038192 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
@@ -16,6 +16,7 @@
 #include "rkvdec-regs.h"
 #include "rkvdec-cabac.h"
 #include "rkvdec-h264-common.h"
+#include "rkvdec-bitwriter.h"
 
 /* Size with u32 units. */
 #define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
@@ -25,56 +26,48 @@ struct rkvdec_sps_pps_packet {
 	u32 info[8];
 };
 
-struct rkvdec_ps_field {
-	u16 offset;
-	u8 len;
-};
-
-#define PS_FIELD(_offset, _len) \
-	((struct rkvdec_ps_field){ _offset, _len })
-
-#define SEQ_PARAMETER_SET_ID				PS_FIELD(0, 4)
-#define PROFILE_IDC					PS_FIELD(4, 8)
-#define CONSTRAINT_SET3_FLAG				PS_FIELD(12, 1)
-#define CHROMA_FORMAT_IDC				PS_FIELD(13, 2)
-#define BIT_DEPTH_LUMA					PS_FIELD(15, 3)
-#define BIT_DEPTH_CHROMA				PS_FIELD(18, 3)
-#define QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG		PS_FIELD(21, 1)
-#define LOG2_MAX_FRAME_NUM_MINUS4			PS_FIELD(22, 4)
-#define MAX_NUM_REF_FRAMES				PS_FIELD(26, 5)
-#define PIC_ORDER_CNT_TYPE				PS_FIELD(31, 2)
-#define LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4		PS_FIELD(33, 4)
-#define DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG		PS_FIELD(37, 1)
-#define PIC_WIDTH_IN_MBS				PS_FIELD(38, 9)
-#define PIC_HEIGHT_IN_MBS				PS_FIELD(47, 9)
-#define FRAME_MBS_ONLY_FLAG				PS_FIELD(56, 1)
-#define MB_ADAPTIVE_FRAME_FIELD_FLAG			PS_FIELD(57, 1)
-#define DIRECT_8X8_INFERENCE_FLAG			PS_FIELD(58, 1)
-#define MVC_EXTENSION_ENABLE				PS_FIELD(59, 1)
-#define NUM_VIEWS					PS_FIELD(60, 2)
-#define VIEW_ID(i)					PS_FIELD(62 + ((i) * 10), 10)
-#define NUM_ANCHOR_REFS_L(i)				PS_FIELD(82 + ((i) * 11), 1)
-#define ANCHOR_REF_L(i)				PS_FIELD(83 + ((i) * 11), 10)
-#define NUM_NON_ANCHOR_REFS_L(i)			PS_FIELD(104 + ((i) * 11), 1)
-#define NON_ANCHOR_REFS_L(i)				PS_FIELD(105 + ((i) * 11), 10)
-#define PIC_PARAMETER_SET_ID				PS_FIELD(128, 8)
-#define PPS_SEQ_PARAMETER_SET_ID			PS_FIELD(136, 5)
-#define ENTROPY_CODING_MODE_FLAG			PS_FIELD(141, 1)
-#define BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG	PS_FIELD(142, 1)
-#define NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(i)		PS_FIELD(143 + ((i) * 5), 5)
-#define WEIGHTED_PRED_FLAG				PS_FIELD(153, 1)
-#define WEIGHTED_BIPRED_IDC				PS_FIELD(154, 2)
-#define PIC_INIT_QP_MINUS26				PS_FIELD(156, 7)
-#define PIC_INIT_QS_MINUS26				PS_FIELD(163, 6)
-#define CHROMA_QP_INDEX_OFFSET				PS_FIELD(169, 5)
-#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG		PS_FIELD(174, 1)
-#define CONSTRAINED_INTRA_PRED_FLAG			PS_FIELD(175, 1)
-#define REDUNDANT_PIC_CNT_PRESENT			PS_FIELD(176, 1)
-#define TRANSFORM_8X8_MODE_FLAG			PS_FIELD(177, 1)
-#define SECOND_CHROMA_QP_INDEX_OFFSET			PS_FIELD(178, 5)
-#define SCALING_LIST_ENABLE_FLAG			PS_FIELD(183, 1)
-#define SCALING_LIST_ADDRESS				PS_FIELD(184, 32)
-#define IS_LONG_TERM(i)				PS_FIELD(216 + (i), 1)
+#define SEQ_PARAMETER_SET_ID				BW_FIELD(0, 4)
+#define PROFILE_IDC					BW_FIELD(4, 8)
+#define CONSTRAINT_SET3_FLAG				BW_FIELD(12, 1)
+#define CHROMA_FORMAT_IDC				BW_FIELD(13, 2)
+#define BIT_DEPTH_LUMA					BW_FIELD(15, 3)
+#define BIT_DEPTH_CHROMA				BW_FIELD(18, 3)
+#define QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG		BW_FIELD(21, 1)
+#define LOG2_MAX_FRAME_NUM_MINUS4			BW_FIELD(22, 4)
+#define MAX_NUM_REF_FRAMES				BW_FIELD(26, 5)
+#define PIC_ORDER_CNT_TYPE				BW_FIELD(31, 2)
+#define LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4		BW_FIELD(33, 4)
+#define DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG		BW_FIELD(37, 1)
+#define PIC_WIDTH_IN_MBS				BW_FIELD(38, 9)
+#define PIC_HEIGHT_IN_MBS				BW_FIELD(47, 9)
+#define FRAME_MBS_ONLY_FLAG				BW_FIELD(56, 1)
+#define MB_ADAPTIVE_FRAME_FIELD_FLAG			BW_FIELD(57, 1)
+#define DIRECT_8X8_INFERENCE_FLAG			BW_FIELD(58, 1)
+#define MVC_EXTENSION_ENABLE				BW_FIELD(59, 1)
+#define NUM_VIEWS					BW_FIELD(60, 2)
+#define VIEW_ID(i)					BW_FIELD(62 + ((i) * 10), 10)
+#define NUM_ANCHOR_REFS_L(i)				BW_FIELD(82 + ((i) * 11), 1)
+#define ANCHOR_REF_L(i)				BW_FIELD(83 + ((i) * 11), 10)
+#define NUM_NON_ANCHOR_REFS_L(i)			BW_FIELD(104 + ((i) * 11), 1)
+#define NON_ANCHOR_REFS_L(i)				BW_FIELD(105 + ((i) * 11), 10)
+#define PIC_PARAMETER_SET_ID				BW_FIELD(128, 8)
+#define PPS_SEQ_PARAMETER_SET_ID			BW_FIELD(136, 5)
+#define ENTROPY_CODING_MODE_FLAG			BW_FIELD(141, 1)
+#define BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG	BW_FIELD(142, 1)
+#define NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(i)		BW_FIELD(143 + ((i) * 5), 5)
+#define WEIGHTED_PRED_FLAG				BW_FIELD(153, 1)
+#define WEIGHTED_BIPRED_IDC				BW_FIELD(154, 2)
+#define PIC_INIT_QP_MINUS26				BW_FIELD(156, 7)
+#define PIC_INIT_QS_MINUS26				BW_FIELD(163, 6)
+#define CHROMA_QP_INDEX_OFFSET				BW_FIELD(169, 5)
+#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG		BW_FIELD(174, 1)
+#define CONSTRAINED_INTRA_PRED_FLAG			BW_FIELD(175, 1)
+#define REDUNDANT_PIC_CNT_PRESENT			BW_FIELD(176, 1)
+#define TRANSFORM_8X8_MODE_FLAG			BW_FIELD(177, 1)
+#define SECOND_CHROMA_QP_INDEX_OFFSET			BW_FIELD(178, 5)
+#define SCALING_LIST_ENABLE_FLAG			BW_FIELD(183, 1)
+#define SCALING_LIST_ADDRESS				BW_FIELD(184, 32)
+#define IS_LONG_TERM(i)				BW_FIELD(216 + (i), 1)
 
 /* Data structure describing auxiliary buffer format. */
 struct rkvdec_h264_priv_tbl {
@@ -91,20 +84,6 @@ struct rkvdec_h264_ctx {
 	struct rkvdec_regs regs;
 };
 
-static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u32 value)
-{
-	u8 bit = field.offset % 32, word = field.offset / 32;
-	u64 mask = GENMASK_ULL(bit + field.len - 1, bit);
-	u64 val = ((u64)value << bit) & mask;
-
-	buf[word] &= ~mask;
-	buf[word] |= val;
-	if (bit + field.len > 32) {
-		buf[word + 1] &= ~(mask >> 32);
-		buf[word + 1] |= val >> 32;
-	}
-}
-
 static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 			    struct rkvdec_h264_run *run)
 {
@@ -128,7 +107,7 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
 	memset(hw_ps, 0, sizeof(*hw_ps));
 
-#define WRITE_PPS(value, field) set_ps_field(hw_ps->info, field, value)
+#define WRITE_PPS(value, field) rkvdec_set_bw_field(hw_ps->info, field, value)
 	/* write sps */
 	WRITE_PPS(sps->seq_parameter_set_id, SEQ_PARAMETER_SET_ID);
 	WRITE_PPS(sps->profile_idc, PROFILE_IDC);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index ac8b825d080a..87abf93dfd5e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -18,6 +18,7 @@
 #include "rkvdec-regs.h"
 #include "rkvdec-cabac.h"
 #include "rkvdec-hevc-common.h"
+#include "rkvdec-bitwriter.h"
 
 /* Size in u8/u32 units. */
 #define RKV_SCALING_LIST_SIZE		1360
@@ -34,80 +35,72 @@ struct rkvdec_rps_packet {
 	u32 info[RKV_RPS_SIZE];
 };
 
-struct rkvdec_ps_field {
-	u16 offset;
-	u8 len;
-};
-
-#define PS_FIELD(_offset, _len) \
-	((struct rkvdec_ps_field){ _offset, _len })
-
 /* SPS */
-#define VIDEO_PARAMETER_SET_ID				PS_FIELD(0, 4)
-#define SEQ_PARAMETER_SET_ID				PS_FIELD(4, 4)
-#define CHROMA_FORMAT_IDC				PS_FIELD(8, 2)
-#define PIC_WIDTH_IN_LUMA_SAMPLES			PS_FIELD(10, 13)
-#define PIC_HEIGHT_IN_LUMA_SAMPLES			PS_FIELD(23, 13)
-#define BIT_DEPTH_LUMA					PS_FIELD(36, 4)
-#define BIT_DEPTH_CHROMA				PS_FIELD(40, 4)
-#define LOG2_MAX_PIC_ORDER_CNT_LSB			PS_FIELD(44, 5)
-#define LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE	PS_FIELD(49, 2)
-#define LOG2_MIN_LUMA_CODING_BLOCK_SIZE			PS_FIELD(51, 3)
-#define LOG2_MIN_TRANSFORM_BLOCK_SIZE			PS_FIELD(54, 3)
-#define LOG2_DIFF_MAX_MIN_LUMA_TRANSFORM_BLOCK_SIZE	PS_FIELD(57, 2)
-#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTER		PS_FIELD(59, 3)
-#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA		PS_FIELD(62, 3)
-#define SCALING_LIST_ENABLED_FLAG			PS_FIELD(65, 1)
-#define AMP_ENABLED_FLAG				PS_FIELD(66, 1)
-#define SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG		PS_FIELD(67, 1)
-#define PCM_ENABLED_FLAG				PS_FIELD(68, 1)
-#define PCM_SAMPLE_BIT_DEPTH_LUMA			PS_FIELD(69, 4)
-#define PCM_SAMPLE_BIT_DEPTH_CHROMA			PS_FIELD(73, 4)
-#define PCM_LOOP_FILTER_DISABLED_FLAG			PS_FIELD(77, 1)
-#define LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	PS_FIELD(78, 3)
-#define LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE		PS_FIELD(81, 3)
-#define NUM_SHORT_TERM_REF_PIC_SETS			PS_FIELD(84, 7)
-#define LONG_TERM_REF_PICS_PRESENT_FLAG			PS_FIELD(91, 1)
-#define NUM_LONG_TERM_REF_PICS_SPS			PS_FIELD(92, 6)
-#define SPS_TEMPORAL_MVP_ENABLED_FLAG			PS_FIELD(98, 1)
-#define STRONG_INTRA_SMOOTHING_ENABLED_FLAG		PS_FIELD(99, 1)
+#define VIDEO_PARAMETER_SET_ID				BW_FIELD(0, 4)
+#define SEQ_PARAMETER_SET_ID				BW_FIELD(4, 4)
+#define CHROMA_FORMAT_IDC				BW_FIELD(8, 2)
+#define PIC_WIDTH_IN_LUMA_SAMPLES			BW_FIELD(10, 13)
+#define PIC_HEIGHT_IN_LUMA_SAMPLES			BW_FIELD(23, 13)
+#define BIT_DEPTH_LUMA					BW_FIELD(36, 4)
+#define BIT_DEPTH_CHROMA				BW_FIELD(40, 4)
+#define LOG2_MAX_PIC_ORDER_CNT_LSB			BW_FIELD(44, 5)
+#define LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE	BW_FIELD(49, 2)
+#define LOG2_MIN_LUMA_CODING_BLOCK_SIZE			BW_FIELD(51, 3)
+#define LOG2_MIN_TRANSFORM_BLOCK_SIZE			BW_FIELD(54, 3)
+#define LOG2_DIFF_MAX_MIN_LUMA_TRANSFORM_BLOCK_SIZE	BW_FIELD(57, 2)
+#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTER		BW_FIELD(59, 3)
+#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA		BW_FIELD(62, 3)
+#define SCALING_LIST_ENABLED_FLAG			BW_FIELD(65, 1)
+#define AMP_ENABLED_FLAG				BW_FIELD(66, 1)
+#define SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG		BW_FIELD(67, 1)
+#define PCM_ENABLED_FLAG				BW_FIELD(68, 1)
+#define PCM_SAMPLE_BIT_DEPTH_LUMA			BW_FIELD(69, 4)
+#define PCM_SAMPLE_BIT_DEPTH_CHROMA			BW_FIELD(73, 4)
+#define PCM_LOOP_FILTER_DISABLED_FLAG			BW_FIELD(77, 1)
+#define LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	BW_FIELD(78, 3)
+#define LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE		BW_FIELD(81, 3)
+#define NUM_SHORT_TERM_REF_PIC_SETS			BW_FIELD(84, 7)
+#define LONG_TERM_REF_PICS_PRESENT_FLAG			BW_FIELD(91, 1)
+#define NUM_LONG_TERM_REF_PICS_SPS			BW_FIELD(92, 6)
+#define SPS_TEMPORAL_MVP_ENABLED_FLAG			BW_FIELD(98, 1)
+#define STRONG_INTRA_SMOOTHING_ENABLED_FLAG		BW_FIELD(99, 1)
 /* PPS */
-#define PIC_PARAMETER_SET_ID				PS_FIELD(128, 6)
-#define PPS_SEQ_PARAMETER_SET_ID			PS_FIELD(134, 4)
-#define DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG		PS_FIELD(138, 1)
-#define OUTPUT_FLAG_PRESENT_FLAG			PS_FIELD(139, 1)
-#define NUM_EXTRA_SLICE_HEADER_BITS			PS_FIELD(140, 13)
-#define SIGN_DATA_HIDING_ENABLED_FLAG			PS_FIELD(153, 1)
-#define CABAC_INIT_PRESENT_FLAG				PS_FIELD(154, 1)
-#define NUM_REF_IDX_L0_DEFAULT_ACTIVE			PS_FIELD(155, 4)
-#define NUM_REF_IDX_L1_DEFAULT_ACTIVE			PS_FIELD(159, 4)
-#define INIT_QP_MINUS26					PS_FIELD(163, 7)
-#define CONSTRAINED_INTRA_PRED_FLAG			PS_FIELD(170, 1)
-#define TRANSFORM_SKIP_ENABLED_FLAG			PS_FIELD(171, 1)
-#define CU_QP_DELTA_ENABLED_FLAG			PS_FIELD(172, 1)
-#define LOG2_MIN_CU_QP_DELTA_SIZE			PS_FIELD(173, 3)
-#define PPS_CB_QP_OFFSET				PS_FIELD(176, 5)
-#define PPS_CR_QP_OFFSET				PS_FIELD(181, 5)
-#define PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG	PS_FIELD(186, 1)
-#define WEIGHTED_PRED_FLAG				PS_FIELD(187, 1)
-#define WEIGHTED_BIPRED_FLAG				PS_FIELD(188, 1)
-#define TRANSQUANT_BYPASS_ENABLED_FLAG			PS_FIELD(189, 1)
-#define TILES_ENABLED_FLAG				PS_FIELD(190, 1)
-#define ENTROPY_CODING_SYNC_ENABLED_FLAG		PS_FIELD(191, 1)
-#define PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED_FLAG	PS_FIELD(192, 1)
-#define LOOP_FILTER_ACROSS_TILES_ENABLED_FLAG		PS_FIELD(193, 1)
-#define DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG		PS_FIELD(194, 1)
-#define PPS_DEBLOCKING_FILTER_DISABLED_FLAG		PS_FIELD(195, 1)
-#define PPS_BETA_OFFSET_DIV2				PS_FIELD(196, 4)
-#define PPS_TC_OFFSET_DIV2				PS_FIELD(200, 4)
-#define LISTS_MODIFICATION_PRESENT_FLAG			PS_FIELD(204, 1)
-#define LOG2_PARALLEL_MERGE_LEVEL			PS_FIELD(205, 3)
-#define SLICE_SEGMENT_HEADER_EXTENSION_PRESENT_FLAG	PS_FIELD(208, 1)
-#define NUM_TILE_COLUMNS				PS_FIELD(212, 5)
-#define NUM_TILE_ROWS					PS_FIELD(217, 5)
-#define COLUMN_WIDTH(i)					PS_FIELD(256 + ((i) * 8), 8)
-#define ROW_HEIGHT(i)					PS_FIELD(416 + ((i) * 8), 8)
-#define SCALING_LIST_ADDRESS				PS_FIELD(592, 32)
+#define PIC_PARAMETER_SET_ID				BW_FIELD(128, 6)
+#define PPS_SEQ_PARAMETER_SET_ID			BW_FIELD(134, 4)
+#define DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG		BW_FIELD(138, 1)
+#define OUTPUT_FLAG_PRESENT_FLAG			BW_FIELD(139, 1)
+#define NUM_EXTRA_SLICE_HEADER_BITS			BW_FIELD(140, 13)
+#define SIGN_DATA_HIDING_ENABLED_FLAG			BW_FIELD(153, 1)
+#define CABAC_INIT_PRESENT_FLAG				BW_FIELD(154, 1)
+#define NUM_REF_IDX_L0_DEFAULT_ACTIVE			BW_FIELD(155, 4)
+#define NUM_REF_IDX_L1_DEFAULT_ACTIVE			BW_FIELD(159, 4)
+#define INIT_QP_MINUS26					BW_FIELD(163, 7)
+#define CONSTRAINED_INTRA_PRED_FLAG			BW_FIELD(170, 1)
+#define TRANSFORM_SKIP_ENABLED_FLAG			BW_FIELD(171, 1)
+#define CU_QP_DELTA_ENABLED_FLAG			BW_FIELD(172, 1)
+#define LOG2_MIN_CU_QP_DELTA_SIZE			BW_FIELD(173, 3)
+#define PPS_CB_QP_OFFSET				BW_FIELD(176, 5)
+#define PPS_CR_QP_OFFSET				BW_FIELD(181, 5)
+#define PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG	BW_FIELD(186, 1)
+#define WEIGHTED_PRED_FLAG				BW_FIELD(187, 1)
+#define WEIGHTED_BIPRED_FLAG				BW_FIELD(188, 1)
+#define TRANSQUANT_BYPASS_ENABLED_FLAG			BW_FIELD(189, 1)
+#define TILES_ENABLED_FLAG				BW_FIELD(190, 1)
+#define ENTROPY_CODING_SYNC_ENABLED_FLAG		BW_FIELD(191, 1)
+#define PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED_FLAG	BW_FIELD(192, 1)
+#define LOOP_FILTER_ACROSS_TILES_ENABLED_FLAG		BW_FIELD(193, 1)
+#define DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG		BW_FIELD(194, 1)
+#define PPS_DEBLOCKING_FILTER_DISABLED_FLAG		BW_FIELD(195, 1)
+#define PPS_BETA_OFFSET_DIV2				BW_FIELD(196, 4)
+#define PPS_TC_OFFSET_DIV2				BW_FIELD(200, 4)
+#define LISTS_MODIFICATION_PRESENT_FLAG			BW_FIELD(204, 1)
+#define LOG2_PARALLEL_MERGE_LEVEL			BW_FIELD(205, 3)
+#define SLICE_SEGMENT_HEADER_EXTENSION_PRESENT_FLAG	BW_FIELD(208, 1)
+#define NUM_TILE_COLUMNS				BW_FIELD(212, 5)
+#define NUM_TILE_ROWS					BW_FIELD(217, 5)
+#define COLUMN_WIDTH(i)					BW_FIELD(256 + ((i) * 8), 8)
+#define ROW_HEIGHT(i)					BW_FIELD(416 + ((i) * 8), 8)
+#define SCALING_LIST_ADDRESS				BW_FIELD(592, 32)
 
 /* Data structure describing auxiliary buffer format. */
 struct rkvdec_hevc_priv_tbl {
@@ -123,20 +116,6 @@ struct rkvdec_hevc_ctx {
 	struct rkvdec_regs regs;
 };
 
-static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u32 value)
-{
-	u8 bit = field.offset % 32, word = field.offset / 32;
-	u64 mask = GENMASK_ULL(bit + field.len - 1, bit);
-	u64 val = ((u64)value << bit) & mask;
-
-	buf[word] &= ~mask;
-	buf[word] |= val;
-	if (bit + field.len > 32) {
-		buf[word + 1] &= ~(mask >> 32);
-		buf[word + 1] |= val >> 32;
-	}
-}
-
 static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 			    struct rkvdec_hevc_run *run)
 {
@@ -159,7 +138,7 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
 	memset(hw_ps, 0, sizeof(*hw_ps));
 
-#define WRITE_PPS(value, field) set_ps_field(hw_ps->info, field, value)
+#define WRITE_PPS(value, field) rkvdec_set_bw_field(hw_ps->info, field, value)
 	/* write sps */
 	WRITE_PPS(sps->video_parameter_set_id, VIDEO_PARAMETER_SET_ID);
 	WRITE_PPS(sps->seq_parameter_set_id, SEQ_PARAMETER_SET_ID);
@@ -321,17 +300,17 @@ static void assemble_sw_rps(struct rkvdec_ctx *ctx,
 	int i, j;
 	unsigned int lowdelay;
 
-#define WRITE_RPS(value, field) set_ps_field(hw_ps->info, field, value)
+#define WRITE_RPS(value, field) rkvdec_set_bw_field(hw_ps->info, field, value)
 
-#define REF_PIC_LONG_TERM_L0(i)			PS_FIELD((i) * 5, 1)
-#define REF_PIC_IDX_L0(i)			PS_FIELD(1 + ((i) * 5), 4)
-#define REF_PIC_LONG_TERM_L1(i)			PS_FIELD(((i) < 5 ? 75 : 132) + ((i) * 5), 1)
-#define REF_PIC_IDX_L1(i)			PS_FIELD(((i) < 4 ? 76 : 128) + ((i) * 5), 4)
+#define REF_PIC_LONG_TERM_L0(n)			BW_FIELD((n) * 5, 1)
+#define REF_PIC_IDX_L0(n)			BW_FIELD(1 + ((n) * 5), 4)
+#define REF_PIC_LONG_TERM_L1(n)			BW_FIELD(((n) < 5 ? 75 : 132) + ((n) * 5), 1)
+#define REF_PIC_IDX_L1(n)			BW_FIELD(((n) < 4 ? 76 : 128) + ((n) * 5), 4)
 
-#define LOWDELAY				PS_FIELD(182, 1)
-#define LONG_TERM_RPS_BIT_OFFSET		PS_FIELD(183, 10)
-#define SHORT_TERM_RPS_BIT_OFFSET		PS_FIELD(193, 9)
-#define NUM_RPS_POC				PS_FIELD(202, 4)
+#define LOWDELAY				BW_FIELD(182, 1)
+#define LONG_TERM_RPS_BIT_OFFSET		BW_FIELD(183, 10)
+#define SHORT_TERM_RPS_BIT_OFFSET		BW_FIELD(193, 9)
+#define NUM_RPS_POC				BW_FIELD(202, 4)
 
 	for (j = 0; j < run->num_slices; j++) {
 		uint st_bit_offset = 0;

-- 
2.53.0


