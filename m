Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EF1109C027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rb88QfAm5tI17MSVTrKAMDjkVWe+1ETDCPqgI60S/tc=; b=kPMd9q2FCRea94teydpAOCfxfJ
	a+33avx5HBG+enhOb0ArHSaoFCbpIQzUD+HYXXvR03LFAabcFEIOygml4Bwu8LCz7fB27NcKp/6dV
	H2h7OE3qtWj1f9NX4u0E7pNQIaeL6NmLTX5YkRwNCRNXQKqsTse2RT1FHXGECqawLYWeX4j7zoj/V
	lzxh4ezfbw69RL+agcSWCgUqGYnqWXErAyn51FA+uwY0o9GRAr0YmGAOIdwW7cmZP1BceilflfQpG
	vB8b0RFC0+SGR4qXMCOp6+MloRnh6Cm22mzZR/orD4B2/sDYKazQ6d4szEj9g/Si2nNWtb51f9Im9
	QYxU7LfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Pa4-00000003gNr-2NQh;
	Wed, 25 Mar 2026 14:51:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZg-00000003fcB-3JKE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Mar 2026 14:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rb88QfAm5tI17MSVTrKAMDjkVWe+1ETDCPqgI60S/tc=; b=XykXs8+W+SXxqr9NoJaE3p++kn
	OdXNV+n41oJdCF+M7UIhs883i3xGvA0GOgdVhi196MJnIbP1n+MLODzA4vfNMIaKR1Uxlizxbrtgo
	z3HnsfIC2iGTTi6B1RlbxcATYIH2hnVpGGyr7gdy7NvRyNY+qCMhlDKcrqrpTMsndLTebeyJh3Jvw
	a9OxAPWPEyyJ33Hvuh27i4vqzCG4pvVjql5cn5lPZFjoqmvaaqPdAosWuXXLgJG6KTqZBInZUdK0T
	oBt98ztrrcUQnBnQTdvLXzCAw2qvH5bMLyLsms+Jlh/I+bnuiMA+aVIoUeRqjNOXEH1N/35Jp4mIH
	OfMB67nQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZb-00000006OYK-2phY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:51:11 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w5PZU-00050C-Vw; Wed, 25 Mar 2026 15:51:01 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 25 Mar 2026 15:50:47 +0100
Subject: [PATCH v4 16/27] media: rockchip: rga: check scaling factor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-spu-rga3-v4-16-e90ec1c61354@pengutronix.de>
References: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
In-Reply-To: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_145107_772431_7625235A 
X-CRM114-Status: GOOD (  21.71  )
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
index d111b348255e2..75d05c86b1c00 100644
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
2.53.0


