Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78505CD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Fcf3M41YWw0iWEZKArt8pCRnWWk5NkBkXH0J0yuF1c=; b=jJhxpPbqEcIzvb8NwGby7gg4wg
	k6vfiTx6PtsetiGkC/tcK89sEqjUtBlLKlFSQFqX+yLL6mmEo2tnpT48wdcm5X3RVdwmLCY7Ws9z9
	bhA2AbrCTYTaDWIkGJUYLL8Shz0Em4IkhNxmHVx8j+ieKjFfcR23uOIxniFCuV2nZQrVHgzKqdO5k
	q0AnySKiJRgbi/H3WHgK82Nq5nQN8Qm66gggEFNYZZ8sz+umt2OGjGxRGGhV/62hpFG7HNfbzuVP+
	Qqquu9Kltwb6PrNFJdjQLtNn8jYCMJO/Q4EU/ZF7gCLZfYZhhICnDVOFClNrqs/KI34K88zckolG+
	VCmnJj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXz-00000008jay-2xFj;
	Fri, 15 May 2026 15:33:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([185.203.201.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXk-00000008j3G-2AZ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:33:44 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuX8-0005OF-24; Fri, 15 May 2026 17:33:02 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:42 +0200
Subject: [PATCH v6 16/28] media: rockchip: rga: reuse cmdbuf contents
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-16-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
In-Reply-To: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_083342_894830_CD8EBBF4 
X-CRM114-Status: GOOD (  19.10  )
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

Reuse the command buffer contents instead of completely writing it
for every frame. Therefore we only need to replace the source and
destination addresses for each frame. This reduces the amount of CPU
and memory operations done in each frame. A new cmdbuf_dirty flag notes
if the cmdbuf has to be rewritten on the next frame.

The initial idea of initializing the cmdbuf on streamon broke the
ability to update controls while streaming (e.g. mirroring).

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
Changes in v6:
- Reworked the commit to not setup the cmdbuf on streamon but rather
  re-initialize it on the next frame when something changed.
- Sasahiko flagged the cmdbuf setup at streamon:
  https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86%40pengutronix.de?part=17
- Dropped Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
  due to the reworked patch and commit message contents

Changes in v5:
- Don't set the flipping and rotation values at streamon and preventing
  the userspace from chainging them at runtime
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 13 +++++++++----
 drivers/media/platform/rockchip/rga/rga.c    | 11 +++++++++--
 drivers/media/platform/rockchip/rga/rga.h    |  2 ++
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index dac3cb6aa17d3..567d39e58d33f 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -417,8 +417,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 {
 	struct rockchip_rga *rga = ctx->rga;
 
-	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
-
 	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
 	/*
 	 * Due to hardware bug,
@@ -427,11 +425,9 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 	rga_cmd_set_src1_addr(ctx, dst->dma_desc_pa);
 
 	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
-	rga_cmd_set_mode(ctx);
 
 	rga_cmd_set_src_info(ctx, &src->offset);
 	rga_cmd_set_dst_info(ctx, &dst->offset);
-	rga_cmd_set_trans_info(ctx);
 
 	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
 
@@ -440,6 +436,14 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 				   PAGE_SIZE, DMA_BIDIRECTIONAL);
 }
 
+static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
+{
+	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
+
+	rga_cmd_set_mode(ctx);
+	rga_cmd_set_trans_info(ctx);
+}
+
 static void rga_hw_start(struct rockchip_rga *rga,
 			 struct rga_vb_buffer *src,  struct rga_vb_buffer *dst)
 {
@@ -582,6 +586,7 @@ const struct rga_hw rga2_hw = {
 	.max_height = MAX_HEIGHT,
 	.stride_alignment = 4,
 
+	.setup_cmdbuf = rga_hw_setup_cmdbuf,
 	.start = rga_hw_start,
 	.handle_irq = rga_handle_irq,
 	.get_version = rga_get_version,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index d080cb672740b..394b14b9469df 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -38,6 +38,11 @@ static void device_run(void *prv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&rga->ctrl_lock, flags);
+	if (ctx->cmdbuf_dirty) {
+		ctx->cmdbuf_dirty = false;
+		rga->hw->setup_cmdbuf(ctx);
+	}
+	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
 
 	rga->curr = ctx;
 
@@ -47,8 +52,6 @@ static void device_run(void *prv)
 	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
 	rga->hw->start(rga, vb_to_rga(src), vb_to_rga(dst));
-
-	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
 }
 
 static irqreturn_t rga_isr(int irq, void *prv)
@@ -141,6 +144,7 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctx->fill_color = ctrl->val;
 		break;
 	}
+	ctx->cmdbuf_dirty = true;
 	spin_unlock_irqrestore(&ctx->rga->ctrl_lock, flags);
 	return 0;
 }
@@ -228,6 +232,7 @@ static int rga_open(struct file *file)
 		ret = -ENOMEM;
 		goto rel_ctx;
 	}
+	ctx->cmdbuf_dirty = true;
 
 	ctx->rga = rga;
 	/* Set default formats */
@@ -448,6 +453,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm->crop.height = pix_fmt->height;
 
 	frm->pix = *pix_fmt;
+	ctx->cmdbuf_dirty = true;
 
 	v4l2_dbg(debug, 1, &rga->v4l2_dev,
 		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
@@ -564,6 +570,7 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	}
 
 	f->crop = s->r;
+	ctx->cmdbuf_dirty = true;
 
 	return ret;
 }
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 38518146910a6..5360f092fecf0 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -55,6 +55,7 @@ struct rga_ctx {
 
 	void *cmdbuf_virt;
 	dma_addr_t cmdbuf_phy;
+	bool cmdbuf_dirty;
 
 	int osequence;
 	int csequence;
@@ -152,6 +153,7 @@ struct rga_hw {
 	u32 max_width, max_height;
 	u8 stride_alignment;
 
+	void (*setup_cmdbuf)(struct rga_ctx *ctx);
 	void (*start)(struct rockchip_rga *rga,
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
 	bool (*handle_irq)(struct rockchip_rga *rga);

-- 
2.54.0


