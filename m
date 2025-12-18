Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CB0D6ACD7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6thN3SqE2bed/eUAcAfihLt8qrRQNEFInnRAGouUYsI=; b=EDAgn7yR/1LubwSu6dt9YBotAG
	w+SqCxtL0cin7S5LZ3+NEjfuUHDoonWAcXrYutdKBxIXxHoLp4bcTaZVsc7fQvAjz9UXt13JErx4/
	XkNMekBBkeTCb0FoNYLuVS7K6bWpZ1xXCFN7kI73XX79ouho2hsjpapJYE+IAcC/EpZXpGyQ6ywMz
	GCG5fskXNA/VCLevERcvbIouGYE2uwhwDeMubNLvAPylUoe5ktUgJvxiYk3iCSxcoRILQ6JgbIceu
	crt5fb7KLRuP1ShJeb3lzpxw//YnUB3dZGLq6wbXPe4dC9ZYBO+bPwBvjPTWYyxznKL+iWxNtd3dd
	c/+VhrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAF5-000000088dm-0b7T;
	Thu, 18 Dec 2025 09:24:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAEv-000000088aT-3cBQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:24:08 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vWAEo-0002J4-Gp; Thu, 18 Dec 2025 10:23:58 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 18 Dec 2025 10:23:49 +0100
Subject: [PATCH v2 1/3] media: imx-csi: move media_pipeline to video device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-media-imx-cleanup-v2-1-9e3e3c269f7f@pengutronix.de>
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
In-Reply-To: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-staging@lists.linux.dev, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_012405_932644_F962F3F1 
X-CRM114-Status: GOOD (  15.75  )
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

The imx-media driver has a single imx_media_device. Attaching the
media_pipeline to the imx_media_device prevents the execution of
multiple media pipelines on the device. This should be possible as long
as the media_pipelines don't use the same pads or pads that be
configured while the other media pipeline is streaming.

Move the media_pipeline to the imx_media_video_dev to be able to
construct media pipelines per imx capture device.

If different media pipelines in the media device conflict, the
validation will fail. Thus, the pipeline will fail to start and signal
an error to user space.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- none
---
 drivers/staging/media/imx/imx-media-capture.c | 8 ++++----
 drivers/staging/media/imx/imx-media-utils.c   | 3 ++-
 drivers/staging/media/imx/imx-media.h         | 7 ++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index e9cef7af000a..bfd71d25facc 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -722,8 +722,8 @@ static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto return_bufs;
 	}
 
-	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
-					    true);
+	ret = imx_media_pipeline_set_stream(priv->md, &priv->vdev,
+					    &priv->src_sd->entity, true);
 	if (ret) {
 		dev_err(priv->dev, "pipeline start failed with %d\n", ret);
 		goto return_bufs;
@@ -749,8 +749,8 @@ static void capture_stop_streaming(struct vb2_queue *vq)
 	unsigned long flags;
 	int ret;
 
-	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
-					    false);
+	ret = imx_media_pipeline_set_stream(priv->md, &priv->vdev,
+					    &priv->src_sd->entity, false);
 	if (ret)
 		dev_warn(priv->dev, "pipeline stop failed with %d\n", ret);
 
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 1b5af8945e6b..f520529a7cfe 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -749,6 +749,7 @@ EXPORT_SYMBOL_GPL(imx_media_pipeline_subdev);
  * Turn current pipeline streaming on/off starting from entity.
  */
 int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
+				  struct imx_media_video_dev *vdev,
 				  struct media_entity *entity,
 				  bool on)
 {
@@ -762,7 +763,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 	mutex_lock(&imxmd->md.graph_mutex);
 
 	if (on) {
-		ret = __media_pipeline_start(entity->pads, &imxmd->pipe);
+		ret = __media_pipeline_start(entity->pads, &vdev->pipe);
 		if (ret)
 			goto out;
 		ret = v4l2_subdev_call(sd, video, s_stream, 1);
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index f095d9134fee..8b65f79b125f 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -104,6 +104,9 @@ struct imx_media_buffer {
 struct imx_media_video_dev {
 	struct video_device *vfd;
 
+	/* the pipeline object */
+	struct media_pipeline pipe;
+
 	/* the user format */
 	struct v4l2_pix_format fmt;
 	/* the compose rectangle */
@@ -145,9 +148,6 @@ struct imx_media_dev {
 	struct media_device md;
 	struct v4l2_device  v4l2_dev;
 
-	/* the pipeline object */
-	struct media_pipeline pipe;
-
 	struct mutex mutex; /* protect elements below */
 
 	/* master video device list */
@@ -223,6 +223,7 @@ int imx_media_alloc_dma_buf(struct device *dev,
 			    int size);
 
 int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
+				  struct imx_media_video_dev *vdev,
 				  struct media_entity *entity,
 				  bool on);
 

-- 
2.47.3


