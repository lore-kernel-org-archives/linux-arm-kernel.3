Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372A8D15DAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFbqzagGQE3OE7F0Il3Btz96omDLmihrsRxmTL4H8OU=; b=ZzrhhcMY7o9lZuEsX7Arl1hbew
	145RWAkyvjyiRXMsT7nbznsq3ND5A3Mjbx2joOBKLp8ys9CMAEHF/MWkDIQyLChUNXuA1KzOGjoli
	s5SDLqMDTfVJ7k1rKb2Ych2yjmYC8OdQ78krp5N3lnsnEUKiSPbBezUCb9+pNoi8wARA4LRvCjzq2
	05ftXKPMqQCPK0TPXdwJZud5l6kr2ASTwfTpDYg7HzJ1qDPibV82AxMwuSFsyZjik9LokAIlFVO6W
	oyF0qu8qEt49JKb6x8+AhsE6H4m7BO235nzptfY9RgNdtdPv1AdhW8il44wQzhZj8+SUPxm/eMdDc
	e+Ri7wTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAp-00000006jEQ-48EM;
	Wed, 03 Dec 2025 15:53:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAh-00000006j29-41I5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 15:53:42 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQpAd-0007dW-K6; Wed, 03 Dec 2025 16:53:35 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 03 Dec 2025 16:52:33 +0100
Subject: [PATCH v2 11/22] media: rockchip: rga: check scaling factor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251203-spu-rga3-v2-11-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
In-Reply-To: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
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
X-CRM114-CacheID: sfid-20251203_075340_003879_D7D9F72E 
X-CRM114-Status: GOOD (  21.57  )
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

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c |  1 +
 drivers/media/platform/rockchip/rga/rga-hw.h |  1 +
 drivers/media/platform/rockchip/rga/rga.c    | 60 +++++++++++++++++++++++++---
 drivers/media/platform/rockchip/rga/rga.h    |  1 +
 4 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 8cdfe089fd636..2ed4f22a999d5 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -624,6 +624,7 @@ const struct rga_hw rga2_hw = {
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
index f02ae02de26ca..46dc94db6f85e 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -346,18 +346,47 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
-	struct rockchip_rga *rga = video_drvdata(file);
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
+	struct rockchip_rga *rga = ctx->rga;
 	const struct rga_hw *hw = rga->hw;
 	struct rga_fmt *fmt;
+	u32 min_width = hw->min_width;
+	u32 max_width = hw->max_width;
+	u32 min_height = hw->min_height;
+	u32 max_height = hw->max_height;
 
 	fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
 	if (!fmt)
 		fmt = &hw->formats[0];
 
-	pix_fmt->width = clamp(pix_fmt->width,
-			       hw->min_width, hw->max_width);
-	pix_fmt->height = clamp(pix_fmt->height,
-				hw->min_height, hw->max_height);
+	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
+	    v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming) {
+		min_width =
+			MAX(min_width, DIV_ROUND_UP(ctx->out.pix.width,
+						    hw->max_scaling_factor));
+		max_width = MIN(max_width,
+				ctx->out.pix.width * hw->max_scaling_factor);
+		min_height =
+			MAX(min_height, DIV_ROUND_UP(ctx->out.pix.height,
+						     hw->max_scaling_factor));
+		max_height = MIN(max_height,
+				 ctx->out.pix.height * hw->max_scaling_factor);
+	} else if (V4L2_TYPE_IS_CAPTURE(f->type) &&
+		   v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming) {
+		min_width =
+			MAX(min_width, DIV_ROUND_UP(ctx->in.pix.width,
+						    hw->max_scaling_factor));
+		max_width = MIN(max_width,
+				ctx->in.pix.width * hw->max_scaling_factor);
+		min_height =
+			MAX(min_height, DIV_ROUND_UP(ctx->in.pix.height,
+						     hw->max_scaling_factor));
+		max_height = MIN(max_height,
+				 ctx->in.pix.height * hw->max_scaling_factor);
+	}
+
+	pix_fmt->width = clamp(pix_fmt->width, min_width, max_width);
+	pix_fmt->height = clamp(pix_fmt->height, min_height, max_height);
 
 	v4l2_fill_pixfmt_mp_aligned(pix_fmt, pix_fmt->pixelformat,
 				    pix_fmt->width, pix_fmt->height, hw->stride_alignment);
@@ -523,12 +552,33 @@ static int vidioc_s_selection(struct file *file, void *priv,
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
index 93162b118d069..d02d5730b4e3b 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -152,6 +152,7 @@ struct rga_hw {
 	size_t cmdbuf_size;
 	u32 min_width, min_height;
 	u32 max_width, max_height;
+	u8 max_scaling_factor;
 	u8 stride_alignment;
 
 	void (*setup_cmdbuf)(struct rga_ctx *ctx);

-- 
2.52.0


