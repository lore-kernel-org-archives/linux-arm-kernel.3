Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C427BCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBWfB5CuIXUB2LKmIvQZVh07iZLvgkPvBfi2zpCdUqw=; b=1YPbuqT1vB5+KZvPPpBGGcZu0S
	Z2eamuU4LtNgEXXuv9HXs+YxeYpGBWcPvpCMxem9V+cyw66VpaJ7eW17zMoxQn/2kYDTndoRH6PQz
	96D0IMz0vYdpxPBbKGyGkmp3LNPgY+vSyNLHah7FV4wxC9Jv2A3dtkHpXoQnBchEhP2nxF9Aoy1Xz
	1ifJd+xBNTT6WpB+Y48Mk0MDMeiIS/9RZLbqUpM5qn131Ft37QfOb6dH3jz0/NfKuhJ+ZHZ1T6JLL
	9PjjsvUwufx+/Fg2WnohpD/70lHFTWcDD2MOQ9rI3DRUcO1B7PTRyuUMQyBMhWGXYJHVDY3HVVtpm
	IIDacS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJWU-0000000H3lV-1pDE;
	Fri, 07 Nov 2025 10:16:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJWQ-0000000H3hV-11QE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 10:16:47 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vHJWH-0003HZ-Md; Fri, 07 Nov 2025 11:16:37 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 07 Nov 2025 11:16:34 +0100
Subject: [PATCH 2/3] media: imx-csi: explicitly start media pipeline on pad
 0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-media-imx-cleanup-v1-2-f82a693c28f4@pengutronix.de>
References: <20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de>
In-Reply-To: <20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_021646_285457_6E3ED8D7 
X-CRM114-Status: GOOD (  12.17  )
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

entity->pads is an array that contains all the pads of an entity.

Calling __media_pipeline_start() or __media_pipeline_stop() on the pads,
implicitly starts the pipeline with the first pad in this array as
origin.

Explicitly use the first pad to start the pipeline to make this more
obvious to the reader.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-utils.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f520529a7cfe..6d69f69c16c1 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -755,6 +755,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 {
 	struct v4l2_subdev *sd;
 	int ret = 0;
+	struct media_pad *pad;
 
 	if (!is_media_entity_v4l2_subdev(entity))
 		return -EINVAL;
@@ -762,17 +763,19 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 
 	mutex_lock(&imxmd->md.graph_mutex);
 
+	pad = &entity->pads[0];
+
 	if (on) {
-		ret = __media_pipeline_start(entity->pads, &vdev->pipe);
+		ret = __media_pipeline_start(pad, &vdev->pipe);
 		if (ret)
 			goto out;
 		ret = v4l2_subdev_call(sd, video, s_stream, 1);
 		if (ret)
-			__media_pipeline_stop(entity->pads);
+			__media_pipeline_stop(pad);
 	} else {
 		v4l2_subdev_call(sd, video, s_stream, 0);
-		if (media_pad_pipeline(entity->pads))
-			__media_pipeline_stop(entity->pads);
+		if (media_pad_pipeline(pad))
+			__media_pipeline_stop(pad);
 	}
 
 out:

-- 
2.47.3


