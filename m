Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA94CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gh5i9So2lAdGUeCywQW4dY/E5qo43fnZ9yTmzUbH8a8=; b=odvVEhhK2WsfE1KV8222R+6DR8
	C/KRplTlQS/DdaPNHu1ZO2FfJokcORub0XaNfHJhYZptzElrtze32eNC181c3IciKTYxlaGYprw4N
	rhh7pM0LGyD+hd7BOwIo2Tw46WNM5mNC1WUWg0GShNWkZ5cZjD4zTb1q2P8M2ke+N8mVQxuKrhUTh
	+lOyeKJ8333c9244A5Mx3nJjUFYBLhzbfXF48lpfPJqPgODzCxFU1I5SL+etG7qnlansHEK/6/d28
	s8SJVX5Nr5BYmayQQWPufh9oUnz1YP4qhAoxgKgE2cTqA8/UsCYcjt8YSEM+cONV8Eh4kgJ0w6QTL
	bwOBHEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy96R-00000004HmY-32RS;
	Mon, 15 Sep 2025 13:18:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy96P-00000004HlA-3LzD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:18:42 +0000
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8963622CF;
	Mon, 15 Sep 2025 15:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757942241;
	bh=ywZiur11oipxoYMdutVTBFOmdw+ZWTNq9HDTBsGjna4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WCst6joHxuo6OuFbOVtgQGlFY7TFD2OcvpXnXchENNDM61YbWoLSOMCUtF546i3w1
	 BtLs+Nvk7NT6DDzXFd2ssoMtP2idDAI/HqDl8cZe31h8xQKEdjbrUNFquezDXdmRSg
	 DLx0fhc2jJemL4cEVOzQUkMzSDXnvLmJIyAW5NUU=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Date: Mon, 15 Sep 2025 14:18:33 +0100
Subject: [PATCH v3 1/3] media: v4l: Add helper to get number of active
 lanes via a pad
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-mbus-config-active-lanes-v3-1-97a1282a410b@ideasonboard.com>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
In-Reply-To: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>, Isaac Scott <isaac.scott@ideasonboard.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_061841_981824_99E2D561 
X-CRM114-Status: GOOD (  19.54  )
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

Sometimes, users will not use all of the MIPI CSI 2 lanes available when
connecting to the MIPI CSI receiver of their device. Add a helper
function that checks the mbus_config for the device driver to allow
users to define the number of active data lanes through the
get_mbus_config op.

If the driver does not implement this op, fall back to using the number
of data lanes specified in device tree.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 32 ++++++++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 21 +++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 6e585bc76367..2ce8407f1397 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -571,6 +571,38 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
 	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
 }
 EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
+
+unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
+					unsigned int max_data_lanes)
+{
+	struct v4l2_mbus_config mbus_config = {};
+	struct v4l2_subdev *sd;
+	unsigned int lanes;
+	int ret;
+
+	sd = media_entity_to_v4l2_subdev(pad->entity);
+	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
+			       &mbus_config);
+	if (ret < 0 && ret != -ENOIOCTLCMD)
+		return ret;
+
+	/*
+	 * This relies on the mbus_config being zeroed at init time.
+	 */
+	if (!mbus_config.bus.mipi_csi2.num_data_lanes)
+		return max_data_lanes;
+
+	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
+
+	if (lanes > max_data_lanes) {
+		dev_dbg(sd->dev, "Active data lanes (%u) exceeds max (%u)\n",
+			lanes, max_data_lanes);
+		return -EINVAL;
+	}
+
+	return lanes;
+}
+EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /*
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 0a43f56578bc..6af0695460ab 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -584,6 +584,27 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 	(pad, mul, div)
 s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
 			     unsigned int div);
+
+/**
+ * v4l2_get_active_data_lanes - Get number of active data lanes from driver
+ *
+ * @pad: The transmitter's media pad.
+ * @max_data_lanes: The maximum number of active data lanes supported by
+ * 		    the MIPI CSI link in hardware. This can be configured
+ * 		    in device tree.
+ *
+ * This function is intended for obtaining the number of data lanes that are
+ * actively being used by the driver for a MIPI CSI-2 device on a given media pad.
+ * This information is derived from a mbus_config fetched from a device driver
+ * using the get_mbus_config v4l2_subdev pad op.
+ *
+ * Return:
+ * * >0: Number of active data lanes
+ * * %-EINVAL: Number of active data lanes is invalid, as it exceeds the maximum
+ *	       supported data lanes listed in device tree.
+ */
+unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
+					unsigned int max_data_lanes);
 #else
 #define v4l2_get_link_freq(handler, mul, div)		\
 	__v4l2_get_link_freq_ctrl(handler, mul, div)

-- 
2.43.0


