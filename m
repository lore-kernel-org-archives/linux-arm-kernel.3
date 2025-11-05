Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EAECCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaCaYeMtVzCsK6wJw6l1jEtSjJk2/gEEBL6If1DGsSI=; b=dSP0FxmIeORBU+b7MU8TM1LR2/
	UL3MB9Qc8t4OrdF4h3x26BCH/p9H+ghGAtn6/Nq9FszpY/HSyhTDoLPCZsRQ8ZBaZ6SLlsTJPR19j
	csQ5I1i/1X+tx8xdzBZlNMSKkhK5JF2qMAyPuGZKxNskvzeKV1dPphs0Hg9T8t5CKXfQ8JZvDXEcy
	LlJ+Zki395mHbbowZWZqSIZomWQ0Svd5xIq0e7hHFBx3FcpTXtpWGY3g/O7GaThLWXSGDfNfiOYoc
	pjDmb0X4EX8qbaNf1itUV90XK5p4358DafPJzPy95ZKDnG0BYdH8ZJxxCIEAnPLREhu0Sw5No12TW
	xSr2/NSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfI7-0000000DuXb-1bOC;
	Wed, 05 Nov 2025 15:19:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfI4-0000000DuVg-1bmJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:19:18 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vGfHy-0002IK-3E; Wed, 05 Nov 2025 16:19:10 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Wed, 05 Nov 2025 16:18:49 +0100
Subject: [PATCH 1/2] media: staging: imx: request mbus_config in csi_start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-media-imx-fixes-v1-1-99e48b4f5cbc@pengutronix.de>
References: <20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de>
In-Reply-To: <20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 Michael Tretter <michael.tretter@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_071916_436584_0D66D101 
X-CRM114-Status: GOOD (  17.74  )
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

Request the upstream mbus_config in csi_start, which starts the stream,
instead of caching it in link_validate.

This allows to get rid of the mbus_cfg field in the struct csi_priv and
avoids state in the driver.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Fixes: 4a34ec8e470c ("[media] media: imx: Add CSI subdev driver")
Cc: stable@vger.kernel.org
---
 drivers/staging/media/imx/imx-media-csi.c | 40 ++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index fd7e37d803e7..55a7d8f38465 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -97,9 +97,6 @@ struct csi_priv {
 	/* the mipi virtual channel number at link validate */
 	int vc_num;
 
-	/* media bus config of the upstream subdevice CSI is receiving from */
-	struct v4l2_mbus_config mbus_cfg;
-
 	spinlock_t irqlock; /* protect eof_irq handler */
 	struct timer_list eof_timeout_timer;
 	int eof_irq;
@@ -403,7 +400,8 @@ static void csi_idmac_unsetup_vb2_buf(struct csi_priv *priv,
 }
 
 /* init the SMFC IDMAC channel */
-static int csi_idmac_setup_channel(struct csi_priv *priv)
+static int csi_idmac_setup_channel(struct csi_priv *priv,
+				   struct v4l2_mbus_config *mbus_cfg)
 {
 	struct imx_media_video_dev *vdev = priv->vdev;
 	const struct imx_media_pixfmt *incc;
@@ -432,7 +430,7 @@ static int csi_idmac_setup_channel(struct csi_priv *priv)
 	image.phys0 = phys[0];
 	image.phys1 = phys[1];
 
-	passthrough = requires_passthrough(&priv->mbus_cfg, infmt, incc);
+	passthrough = requires_passthrough(mbus_cfg, infmt, incc);
 	passthrough_cycles = 1;
 
 	/*
@@ -572,11 +570,12 @@ static void csi_idmac_unsetup(struct csi_priv *priv,
 	csi_idmac_unsetup_vb2_buf(priv, state);
 }
 
-static int csi_idmac_setup(struct csi_priv *priv)
+static int csi_idmac_setup(struct csi_priv *priv,
+			   struct v4l2_mbus_config *mbus_cfg)
 {
 	int ret;
 
-	ret = csi_idmac_setup_channel(priv);
+	ret = csi_idmac_setup_channel(priv, mbus_cfg);
 	if (ret)
 		return ret;
 
@@ -595,7 +594,8 @@ static int csi_idmac_setup(struct csi_priv *priv)
 	return 0;
 }
 
-static int csi_idmac_start(struct csi_priv *priv)
+static int csi_idmac_start(struct csi_priv *priv,
+			   struct v4l2_mbus_config *mbus_cfg)
 {
 	struct imx_media_video_dev *vdev = priv->vdev;
 	int ret;
@@ -619,7 +619,7 @@ static int csi_idmac_start(struct csi_priv *priv)
 	priv->last_eof = false;
 	priv->nfb4eof = false;
 
-	ret = csi_idmac_setup(priv);
+	ret = csi_idmac_setup(priv, mbus_cfg);
 	if (ret) {
 		v4l2_err(&priv->sd, "csi_idmac_setup failed: %d\n", ret);
 		goto out_free_dma_buf;
@@ -701,7 +701,8 @@ static void csi_idmac_stop(struct csi_priv *priv)
 }
 
 /* Update the CSI whole sensor and active windows */
-static int csi_setup(struct csi_priv *priv)
+static int csi_setup(struct csi_priv *priv,
+		     struct v4l2_mbus_config *mbus_cfg)
 {
 	struct v4l2_mbus_framefmt *infmt, *outfmt;
 	const struct imx_media_pixfmt *incc;
@@ -719,7 +720,7 @@ static int csi_setup(struct csi_priv *priv)
 	 * if cycles is set, we need to handle this over multiple cycles as
 	 * generic/bayer data
 	 */
-	if (is_parallel_bus(&priv->mbus_cfg) && incc->cycles) {
+	if (is_parallel_bus(mbus_cfg) && incc->cycles) {
 		if_fmt.width *= incc->cycles;
 		crop.width *= incc->cycles;
 	}
@@ -730,7 +731,7 @@ static int csi_setup(struct csi_priv *priv)
 			     priv->crop.width == 2 * priv->compose.width,
 			     priv->crop.height == 2 * priv->compose.height);
 
-	ipu_csi_init_interface(priv->csi, &priv->mbus_cfg, &if_fmt, outfmt);
+	ipu_csi_init_interface(priv->csi, mbus_cfg, &if_fmt, outfmt);
 
 	ipu_csi_set_dest(priv->csi, priv->dest);
 
@@ -745,9 +746,17 @@ static int csi_setup(struct csi_priv *priv)
 
 static int csi_start(struct csi_priv *priv)
 {
+	struct v4l2_mbus_config mbus_cfg = { .type = 0 };
 	struct v4l2_fract *input_fi, *output_fi;
 	int ret;
 
+	ret = csi_get_upstream_mbus_config(priv, &mbus_cfg);
+	if (ret) {
+		v4l2_err(&priv->sd,
+			 "failed to get upstream media bus configuration\n");
+		return ret;
+	}
+
 	input_fi = &priv->frame_interval[CSI_SINK_PAD];
 	output_fi = &priv->frame_interval[priv->active_output_pad];
 
@@ -758,7 +767,7 @@ static int csi_start(struct csi_priv *priv)
 		return ret;
 
 	/* Skip first few frames from a BT.656 source */
-	if (priv->mbus_cfg.type == V4L2_MBUS_BT656) {
+	if (mbus_cfg.type == V4L2_MBUS_BT656) {
 		u32 delay_usec, bad_frames = 20;
 
 		delay_usec = DIV_ROUND_UP_ULL((u64)USEC_PER_SEC *
@@ -769,12 +778,12 @@ static int csi_start(struct csi_priv *priv)
 	}
 
 	if (priv->dest == IPU_CSI_DEST_IDMAC) {
-		ret = csi_idmac_start(priv);
+		ret = csi_idmac_start(priv, &mbus_cfg);
 		if (ret)
 			goto stop_upstream;
 	}
 
-	ret = csi_setup(priv);
+	ret = csi_setup(priv, &mbus_cfg);
 	if (ret)
 		goto idmac_stop;
 
@@ -1138,7 +1147,6 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 
 	mutex_lock(&priv->lock);
 
-	priv->mbus_cfg = mbus_cfg;
 	is_csi2 = !is_parallel_bus(&mbus_cfg);
 	if (is_csi2) {
 		/*

-- 
2.47.3


