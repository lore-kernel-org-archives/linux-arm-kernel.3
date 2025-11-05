Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DD6CCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+LBPJdHDUVGD44kDBk8PRElfmiTn5z89gRTN/5hRI4=; b=s22BMIjGAH7oyOIes7S/5n7Q8j
	SQEb9XR/RGDkmSMPzTyfjr4SBddMaq9lIlojs3OujCdzBvtDPuk+pEo9RMXGg+SrHyhPbf7cnRflH
	u8dtfd2b9RwF3xvmfZERmcxxDX5F6yMAvxXpmoFRSHMbwXs7qeFQG9Z+0EihAL9HGBCDNYam8JE2D
	JtbG3PKAt31RBhyp7tKXrBXLZoeIra+WZbipi3thjCseF7TYJVFSfsbQybX0Ur0ewkaYIm1OBqVG2
	O7eLQW+GUs9UUIl3iK47fWUolcUsoNGhdS4Gv7VTyiHwC1W41vIG8lg4FBy1+cV9o/BogEqpZQcR+
	UPTN83AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfI7-0000000DuXw-3jP5;
	Wed, 05 Nov 2025 15:19:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfI4-0000000DuVj-2LWJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:19:18 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vGfHy-0002IK-4f; Wed, 05 Nov 2025 16:19:10 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Wed, 05 Nov 2025 16:18:50 +0100
Subject: [PATCH 2/2] media: staging: imx: configure src_mux in csi_start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-media-imx-fixes-v1-2-99e48b4f5cbc@pengutronix.de>
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
X-CRM114-CacheID: sfid-20251105_071916_608152_A20A6A39 
X-CRM114-Status: GOOD (  18.69  )
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

After media_pipeline_start() was called, the media graph is assumed to
be validated. It won't be validated again if a second stream starts.

The imx-media-csi driver, however, changes hardware configuration in the
link_validate() callback. This can result in started streams with
misconfigured hardware.

In the concrete example, the ipu2_csi1_mux is driven by a parallel video
input. After the media pipeline has been started with this
configuration, a second stream is configured to use ipu1_csi0 with
MIPI-CSI input from imx6-mipi-csi2. This may require the reconfiguration
of ipu1_csi0 with ipu_set_csi_src_mux(). Since the media pipeline is
already running, link_validate won't be called, and the ipu1_csi0 won't
be reconfigured. The resulting video is broken, because the
ipu1_csi0_mux is misconfigured, but no error is reported.

Move ipu_set_csi_src_mux from csi_link_validate to csi_start to ensure
that input to ipu1_csi0 is configured correctly when starting the
stream. This is a local reconfiguration in ipu1_csi0 and is possible
while the media pipeline is running.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Fixes: 4a34ec8e470c ("[media] media: imx: Add CSI subdev driver")
Cc: stable@vger.kernel.org
---
 drivers/staging/media/imx/imx-media-csi.c | 44 +++++++++++++++++--------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 55a7d8f38465..1bc644f73a9d 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -744,6 +744,28 @@ static int csi_setup(struct csi_priv *priv,
 	return 0;
 }
 
+static void csi_set_src(struct csi_priv *priv,
+			struct v4l2_mbus_config *mbus_cfg)
+{
+	bool is_csi2;
+
+	is_csi2 = !is_parallel_bus(mbus_cfg);
+	if (is_csi2) {
+		/*
+		 * NOTE! It seems the virtual channels from the mipi csi-2
+		 * receiver are used only for routing by the video mux's,
+		 * or for hard-wired routing to the CSI's. Once the stream
+		 * enters the CSI's however, they are treated internally
+		 * in the IPU as virtual channel 0.
+		 */
+		ipu_csi_set_mipi_datatype(priv->csi, 0,
+					  &priv->format_mbus[CSI_SINK_PAD]);
+	}
+
+	/* select either parallel or MIPI-CSI2 as input to CSI */
+	ipu_set_csi_src_mux(priv->ipu, priv->csi_id, is_csi2);
+}
+
 static int csi_start(struct csi_priv *priv)
 {
 	struct v4l2_mbus_config mbus_cfg = { .type = 0 };
@@ -760,6 +782,8 @@ static int csi_start(struct csi_priv *priv)
 	input_fi = &priv->frame_interval[CSI_SINK_PAD];
 	output_fi = &priv->frame_interval[priv->active_output_pad];
 
+	csi_set_src(priv, &mbus_cfg);
+
 	/* start upstream */
 	ret = v4l2_subdev_call(priv->src_sd, video, s_stream, 1);
 	ret = (ret && ret != -ENOIOCTLCMD) ? ret : 0;
@@ -1130,7 +1154,6 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_config mbus_cfg = { .type = 0 };
-	bool is_csi2;
 	int ret;
 
 	ret = v4l2_subdev_link_validate_default(sd, link,
@@ -1145,25 +1168,6 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 		return ret;
 	}
 
-	mutex_lock(&priv->lock);
-
-	is_csi2 = !is_parallel_bus(&mbus_cfg);
-	if (is_csi2) {
-		/*
-		 * NOTE! It seems the virtual channels from the mipi csi-2
-		 * receiver are used only for routing by the video mux's,
-		 * or for hard-wired routing to the CSI's. Once the stream
-		 * enters the CSI's however, they are treated internally
-		 * in the IPU as virtual channel 0.
-		 */
-		ipu_csi_set_mipi_datatype(priv->csi, 0,
-					  &priv->format_mbus[CSI_SINK_PAD]);
-	}
-
-	/* select either parallel or MIPI-CSI2 as input to CSI */
-	ipu_set_csi_src_mux(priv->ipu, priv->csi_id, is_csi2);
-
-	mutex_unlock(&priv->lock);
 	return ret;
 }
 

-- 
2.47.3


