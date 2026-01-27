Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13248D2F03E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tOZvhq4aOn+OrsPZezbn4Haw2X/1Tv1SPBsUsYRr3g=; b=R0T9vNQ+tkro5LOidNF46KNdGO
	dYkXNmiM3ghLgoHaVpO9kJbidD8GtvjsNbrQtALaC+hKgNTGrTN01FITKIi9daTD2yiAbjNLfkxv5
	LP/9V40EqxIBSfo9QN81Bvq4LL6lvEEevxDqg60v2dhsgZcs/++6PQqfWbbNjY51kiaviLzTJ8X3g
	AXO1F44gnIg4jkKqUfvUJqTMCPcKZ8tMYknILqYOQxFo7ZbUPlZwEXwA9dyfRj9bAYPyKmpcI+HrI
	WBhNPQ/y5sJm/lvh+7OQC/fJfGC6qX3WybdrDQYUoK2mb62dB4vkJiMoexUr365tKq4vtxBIyySYQ
	6219QhBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkGf-0000000ERQl-0xIH;
	Tue, 27 Jan 2026 14:42:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkFN-0000000EQKs-45P0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:40:53 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vkkF2-0007YT-N2; Tue, 27 Jan 2026 15:40:29 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 27 Jan 2026 15:39:25 +0100
Subject: [PATCH v3 16/27] media: rockchip: rga: check scaling factor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-spu-rga3-v3-16-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
In-Reply-To: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_064050_177394_2629AAD3 
X-CRM114-Status: GOOD (  21.47  )
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

Check the scaling factor to avoid potential problems. This is relevant
for the upcoming RGA3 support, as it can hang when the scaling factor
is exceeded.

There are two relevant scenarios that have to be considered to protect
against invalid scaling values:

When the output or capture is already streaming, setting the format on
the other side should consider the max scaling factor and clamp it
accordingly. This is only done in the streaming case, as it otherwise
may unintentionally clamp the value when the application sets the first
format (due to a default format on the other side).

When the format is set on both sides first, then the format won't be
corrected by above means. Therefore the second streamon call has to
check the scaling factor and fail otherwise.

As try functions should only be state aware if specified, the scaling
limitation is only done in s_fmt.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c |  1 +
 drivers/media/platform/rockchip/rga/rga-hw.h |  1 +
 drivers/media/platform/rockchip/rga/rga.c    | 47 ++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rga/rga.h    |  1 +
 4 files changed, 50 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index dcd540ed3fd5b..7a4070665fed7 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -584,6 +584,7 @@ const struct rga_hw rga2_hw = {
 	.max_width = MAX_WIDTH,
 	.min_height = MIN_HEIGHT,
 	.max_height = MAX_HEIGHT,
+	.max_scaling_factor = MAX_SCALING_FACTOR,
 	.stride_alignment = 4,
 
 	.setup_cmdbuf = rga_hw_setup_cmdbuf,
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
index f4752aa823051..fffcab0131225 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.h
+++ b/drivers/media/platform/rockchip/rga/rga-hw.h
@@ -14,6 +14,7 @@
 
 #define MIN_WIDTH 34
 #define MIN_HEIGHT 34
+#define MAX_SCALING_FACTOR 16
 
 #define RGA_TIMEOUT 500
 
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 6947c472a8b01..fad921ddd8348 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -405,10 +405,36 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rockchip_rga *rga = ctx->rga;
+	const struct rga_hw *hw = rga->hw;
 	struct vb2_queue *vq;
 	struct rga_frame *frm;
 	int ret = 0;
 	int i;
+	struct rga_frame *limit_frm = NULL;
+
+	/* Limit before try_fmt to avoid recalculating the stride */
+	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
+	    v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming)
+		limit_frm = &ctx->out;
+	if (V4L2_TYPE_IS_CAPTURE(f->type) &&
+	    v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming)
+		limit_frm = &ctx->in;
+	if (limit_frm) {
+		const struct v4l2_frmsize_stepwise frmsize = {
+			.min_width = DIV_ROUND_UP(limit_frm->pix.width,
+						  hw->max_scaling_factor),
+			.max_width =
+				limit_frm->pix.width * hw->max_scaling_factor,
+			.min_height = DIV_ROUND_UP(limit_frm->pix.height,
+						   hw->max_scaling_factor),
+			.max_height =
+				limit_frm->pix.height * hw->max_scaling_factor,
+			.step_width = 1,
+			.step_height = 1,
+		};
+		v4l2_apply_frmsize_constraints(&pix_fmt->width,
+					       &pix_fmt->height, &frmsize);
+	}
 
 	/* Adjust all values accordingly to the hardware capabilities
 	 * and chosen format.
@@ -568,12 +594,33 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	return ret;
 }
 
+static bool check_scaling(const struct rga_hw *hw, u32 src_size, u32 dst_size)
+{
+	if (src_size < dst_size)
+		return src_size * hw->max_scaling_factor >= dst_size;
+	else
+		return dst_size * hw->max_scaling_factor >= src_size;
+}
+
 static int vidioc_streamon(struct file *file, void *priv,
 			   enum v4l2_buf_type type)
 {
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	const struct rga_hw *hw = ctx->rga->hw;
 
+	if ((V4L2_TYPE_IS_OUTPUT(type) &&
+	     v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming) ||
+	    (V4L2_TYPE_IS_CAPTURE(type) &&
+	     v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming)) {
+		/*
+		 * As the other side is already streaming,
+		 * check that the max scaling factor isn't exceeded.
+		 */
+		if (!check_scaling(hw, ctx->in.pix.width, ctx->out.pix.width) ||
+		    !check_scaling(hw, ctx->in.pix.height, ctx->out.pix.height))
+			return -EINVAL;
+	}
+
 	hw->setup_cmdbuf(ctx);
 
 	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index c741213710b32..454af283b1694 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -150,6 +150,7 @@ struct rga_hw {
 	size_t cmdbuf_size;
 	u32 min_width, min_height;
 	u32 max_width, max_height;
+	u8 max_scaling_factor;
 	u8 stride_alignment;
 
 	void (*setup_cmdbuf)(struct rga_ctx *ctx);

-- 
2.52.0


