Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D39BC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeWqo1HnQdE3Xew6TBWIe5frodF2RFwVLBqIU5l9vVU=; b=ZF5REZckB3c2pODMAyyEUQHR3V
	/ipNQFlvmvMXPD5iDLIdJdIPqJtbI5jeEApSZIWSd+ykZhJcHse6uqipkMVd7Huv7etxRkvmB655w
	RebIThPp3DLYOPHm0Llxq8Dyi61CFDsqVSRNGEEaFaIQk6/cmZVApUaJtUy6YNklcvCCOHd9u0xD/
	TJzy3BlPO8iXGJGYgTefks4SeFijbumgMwECbZx1vMdX4GIMGw/ZRKY50lGR3Ea3VNJFBVbTH5nRl
	QMI0gKPdrAvdWxQbWnodoQxppuOxmtxEqFyma6mitwv/Aednr9u8xwwWwHWJr+Eg0DYc0WkKH/sxJ
	fXC4nJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpgA-0000000EbZy-2aDA;
	Wed, 19 Feb 2025 19:24:18 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpUA-0000000EYV1-2qQk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:11:55 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abbb12bea54so36977266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 11:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992313; x=1740597113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeWqo1HnQdE3Xew6TBWIe5frodF2RFwVLBqIU5l9vVU=;
        b=aPS2mtINTjo0uFNb9VgXkslyE+qiJ6zy1FXAsud4/p6u4QqWr8A0rRmLOeXf7lcK/8
         AAjW38G2lgFfSrJfrlWDCjns+gOQfQoqLqG18fMWXXnPB62RxaEXuX0+5D/JKS8hys52
         tdxKYfHiwicPv3sRJeb+paUBIAV+I3m3kKyb3oHWeMwaWRRlMpsOcWlXLzh9R0Biibpf
         /O9uQ9Qeqvpp3RDrKJ+XrBpJMjZ7YENmAoV7ZdKuCw9grCYwdCfm5zFUpLlIhNFSPR7r
         eAgd+55zunBnTFbAJ5FKVS9hmIe1yundZphi6YBRDY5ipOAWQch96OhCnVTpGqIFjxaZ
         zOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992313; x=1740597113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeWqo1HnQdE3Xew6TBWIe5frodF2RFwVLBqIU5l9vVU=;
        b=iy+IFXE2sIbDzf4DQ75eqq+pqRvYH291EQ8Uk9a+a9XTEGmFj7med0rPWxQLOFnmuC
         u9OiS5rzxARCfFvELmeh+B8DHVeBJFSikKF+QUN7fwvd30v9NE7wHnImbO5Z9Ug891Rs
         Ok/6Pcu0OkTHoj9NrIsXm6DNYsOZAoWe+00j/5f3TZTSKiqE6H6qG+oaPoze/ViHnQ7u
         NiiVUi4lx9OudWRXUP/5aurekTcuY3PUw3pXODei1Zz9ljXS0FGEt/54mKs8LiQ0hsnD
         mCa1J5uXa1NkNepcWXbikeouWBvilAs67rqa1LQ7FE2isJwDS8CuoXg4ygLFPX8ZE4aM
         M0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE7vIOlYkDbSe0/BWADwer2DrUyQ4E7u1cuJfjpuSxQcQEpxKFxNgGnNB1pHtEdRKvXFqiW4epjv4WF5R6QHFw@lists.infradead.org
X-Gm-Message-State: AOJu0YxXrkLLKMMygWUkwP+tGfHFdyjpFBrDGBqHnpdHh4Oq2KRlFgcq
	9UhVu3RKRaluvurP0/ZdtILGXQY/hOGVy0Xsrgw+DtnT4dVw9G7p
X-Gm-Gg: ASbGnctWfnJwCWccHHlE3rgbw6vik8bYaLPI+ZhBeFxbPO7fHL7k3HsZdsFVvapevrV
	QYjisDeg83APaw7QrSx6XbdiaT3udLGugvAZZrGlE1DitZoJ1rl+bLYNsddCArfEX1Kb70M8CTb
	/6Kt/bA4eDXxtRuZP5Klgrnlr7CdvW2eEXDuhNLWXWijajjHQs+AlutRgc6F+FawOs0/EqVDavq
	m4fRtg38D5eLtWnTOiWoALxpiQm+UC3md9eODga/pMxT18s4E4I/FuxPzGsW3vHvgKf/q6AlsHj
	zYbHCeSA5N4Cyh3QuOyf/211BZo5
X-Google-Smtp-Source: AGHT+IEIElAhIncM7Zr/Vqckj3vDoXiYUCL9ogHbzv7UIans32TGHh2oeqc5N+BExx1k+LESN0G7ig==
X-Received: by 2002:a17:906:315b:b0:ab7:d179:249a with SMTP id a640c23a62f3a-abb70b1e782mr1529786166b.15.1739992313056;
        Wed, 19 Feb 2025 11:11:53 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:52 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] media: use v4l2_subdev_routing_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:31 +0200
Message-ID: <20250219191136.215151-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219191136.215151-1-demonsingur@gmail.com>
References: <20250219191136.215151-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_111154_737947_9147479A 
X-CRM114-Status: GOOD (  13.99  )
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

Replace current usages of v4l2_subdev_state_xlate_streams() with
v4l2_subdev_routing_xlate_streams() in preperations for the removal of
v4l2_subdev_state_xlate_streams().

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
 drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
 drivers/media/i2c/max96714.c                  | 16 ++++++-------
 drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
 6 files changed, 45 insertions(+), 38 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index fd2d2d5272bfb..b8dfcf730baa2 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -252,9 +252,10 @@ static int ub913_enable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB913_PAD_SOURCE,
-						       UB913_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB913_PAD_SOURCE,
+							 UB913_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
 					 sink_streams);
@@ -274,9 +275,10 @@ static int ub913_disable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB913_PAD_SOURCE,
-						       UB913_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB913_PAD_SOURCE,
+							 UB913_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
 					  sink_streams);
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 46569381b332d..c239ede968423 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -683,9 +683,10 @@ static int ub953_enable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
-						       UB953_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB953_PAD_SOURCE,
+							 UB953_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
 					 sink_streams);
@@ -705,9 +706,10 @@ static int ub953_disable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
-						       UB953_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB953_PAD_SOURCE,
+							 UB953_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
 					  sink_streams);
diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index 159753b13777c..c982bca708ff5 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -272,10 +272,10 @@ static int max96714_enable_streams(struct v4l2_subdev *sd,
 		}
 
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96714_PAD_SOURCE,
-							MAX96714_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96714_PAD_SOURCE,
+							  MAX96714_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_enable_streams(priv->rxport.source.sd,
 						 priv->rxport.source.pad,
@@ -306,10 +306,10 @@ static int max96714_disable_streams(struct v4l2_subdev *sd,
 		int ret;
 
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96714_PAD_SOURCE,
-							MAX96714_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96714_PAD_SOURCE,
+							  MAX96714_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_disable_streams(priv->rxport.source.sd,
 						  priv->rxport.source.pad,
diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 9259d58ba734e..e18b07b3259c1 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -446,9 +446,10 @@ static int max96717_set_fmt(struct v4l2_subdev *sd,
 
 	stream_source_mask = BIT(format->stream);
 
-	return v4l2_subdev_state_xlate_streams(state, MAX96717_PAD_SOURCE,
-					       MAX96717_PAD_SINK,
-					       &stream_source_mask);
+	return v4l2_subdev_routing_xlate_streams(&state->routing,
+						 MAX96717_PAD_SOURCE,
+						 MAX96717_PAD_SINK,
+						 &stream_source_mask);
 }
 
 static int max96717_init_state(struct v4l2_subdev *sd,
@@ -508,10 +509,10 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
 
 	if (!priv->pattern) {
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96717_PAD_SOURCE,
-							MAX96717_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96717_PAD_SOURCE,
+							  MAX96717_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_enable_streams(priv->source_sd,
 						 priv->source_sd_pad,
@@ -551,10 +552,10 @@ static int max96717_disable_streams(struct v4l2_subdev *sd,
 		int ret;
 
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96717_PAD_SOURCE,
-							MAX96717_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96717_PAD_SOURCE,
+							  MAX96717_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_disable_streams(priv->source_sd,
 						  priv->source_sd_pad,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 051898ce53f43..c39c15709a170 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -360,9 +360,10 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
-						       CSI2_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 CSI2_PAD_SRC,
+							 CSI2_PAD_SINK,
+							 &streams_mask);
 
 	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
 	if (ret)
@@ -390,9 +391,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	struct media_pad *remote_pad;
 	u64 sink_streams;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
-						       CSI2_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 CSI2_PAD_SRC,
+							 CSI2_PAD_SINK,
+							 &streams_mask);
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd173..8f61145435e32 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -141,7 +141,7 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
 	 * routing table are guaranteed to have the same sink pad.
 	 *
 	 * TODO: This is likely worth a helper function, it could perhaps be
-	 * supported by v4l2_subdev_state_xlate_streams() with pad1 set to -1.
+	 * supported by v4l2_subdev_routing_xlate_streams() with pad1 set to -1.
 	 */
 	for_each_active_route(&state->routing, route) {
 		if (route->source_pad != source_pad ||
-- 
2.48.1


