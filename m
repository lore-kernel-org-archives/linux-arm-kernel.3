Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD9FC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9t5ETeu0PXD9T03gr3t0rpnaMSHCppSAmRkHp3tbNs=; b=KtYazX5yr19bFS3MvVIYKFLV0y
	G7hpELuyH5vNHuk5sCv1YKKEOcqoefuj/AYmPbXrvEhNI12ZgYcBmLyKacD6zFlQlZBj7jrV4QBHA
	3j8Pq517GJV8vnzlIwY6xtYIT+0CgBTwsg+8n8d7tsc1p2fI8kKA5kC0jmuSxg18mD8JoBue/tJlt
	UScM+jDLtxuEU0Be02a8AhyaxZjK+iVgR5x3dURGZoWEeYyOU5TVQ7W7ybU9jAqfPltUSOPSxEBmt
	yRirOS9gesroTMaDjMAwitnsKrvHFZha2nlxFDj79IxxB4/p6Zh8e8jXzHx0XvY5dj5gCMhonOwZt
	UDH9afsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2o1-000000000Qf-1sXC;
	Thu, 20 Feb 2025 09:25:17 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2jg-0000000HaAk-0v4f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 09:20:49 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abbdf897503so261450366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 01:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043246; x=1740648046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9t5ETeu0PXD9T03gr3t0rpnaMSHCppSAmRkHp3tbNs=;
        b=dy/gYmLcFTI10tednxz6nXWGtG9k5AVV5EByfxJ8ZtGSGIlvGmEOrQTOp5ma/ayqcI
         4pIBmJGFwT6GwCozBOTdrnEMcmY0gk6IMaD+/caD3wi4CrmytltkxmezW+UOosvDKTYq
         PHOrSfynK3rtMoud2cNz2Fu9ImVjmjm8BEIoaSji7N/VVmDou8bJvouH44+COUW++17x
         Krpc192HWHtbx+DZGaw8zeWGdnDi3ITypaYr6yOiyoXjUKkrYu8HUskLdQU9EyfFi4JC
         uPmC0yv6/siwLHmdws1VyR5h3LtQ5O4Jflz/3s2v6aXpugU0c3Ap/Ppgj4qR+Rs4lUqR
         J79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043246; x=1740648046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9t5ETeu0PXD9T03gr3t0rpnaMSHCppSAmRkHp3tbNs=;
        b=asCkRRrzW6jNh7u1c0ZV4EVrfRQdSH5/6x1bH7rJXAknHBuSEp1z/yG8Qaxjd1DyB1
         Jw43UeB9LSJp3djgPxs+KxCHVeUDJm+bzPqAvnh11wGF2VxioowLDTaLHlC2NT3qAy0e
         ZL0/BCBQAHo0Eo5LFihauENoKD8qoCLY6L2dOCmoW9wb9DstQrMuEeZRJS96FjVP+7Qk
         QogVpY/cwj2p2/G7+7MjovFrxrohtEen/AXU6eDX86CsUNHlMyCeJTZuuTD8K6rwovww
         3s2GtJwhXIIRwtAhwOLQkfeMFOqPJgMk/wyyZudDy/CyDFKoa/qUNnQRPHMkO3aIFe+w
         0wQA==
X-Forwarded-Encrypted: i=1; AJvYcCV9oivCIAzRCVoEFqCk9IWSkhIOiAt/FCedxNLtN9ParvPU0IspJ1JUHJ9l+u4dWRtamaPN6+FCiUeX1oT6ut+O@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr7jaJ3cHDet5zy8UmVWKRAZWlftUgJOn4S7738wHylcWjb3MN
	LQTcnE0JYGYH3bLGwgmTd643LUbVkp1zI3szTqWPCP3ZGib6OzpI
X-Gm-Gg: ASbGncuiBhfQfhMq4UDYaDF/gFzHGI1wKzQCEQclUuCEA9qMDYSrmBjIJ+mqXZUj0BC
	xPctCnjnLFpKSW04F5+URRdXIORrk0eon5CjpLJXJiM96cptgYLzBOVr6rpje64mjuJLDIygqjs
	zf41DSWopDIf6FLI/lBYyTRfT2fVgt2N/vyfiOo3jEUzJGftIRyYuDjWIxI9k1RGOX7d4Rh6GIR
	qNhnYvHRkvJV//yvPrLjqG6bme0wcZ0upCAVWkHQcOifm6XD/GEnMzzwNqMqOddXlUlVBtuGm71
	J7n1w7Gax55EPkin9AGrQtLr31cR
X-Google-Smtp-Source: AGHT+IEE28wc+KTqMadXPz0HUq5xegTrNkJUOB+B0TPRfEXrPgPkWCab8fU38OLa/faZdXdJ85ieJg==
X-Received: by 2002:a17:907:c48f:b0:ab7:b9b5:60ff with SMTP id a640c23a62f3a-abbedd31efbmr244293866b.2.1740043245586;
        Thu, 20 Feb 2025 01:20:45 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm665574866b.35.2025.02.20.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:45 -0800 (PST)
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
Subject: [PATCH v2 2/3] media: use v4l2_subdev_routing_xlate_streams()
Date: Thu, 20 Feb 2025 11:20:34 +0200
Message-ID: <20250220092036.6757-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220092036.6757-1-demonsingur@gmail.com>
References: <20250220092036.6757-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_012048_258145_78F3B8BF 
X-CRM114-Status: GOOD (  13.68  )
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
index da8581a37e220..31fcf1695cb7c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -354,9 +354,10 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
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
@@ -384,9 +385,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
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


