Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C86FD49223
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2o8RWIwZHcDnCoRZbJ0AgekAHRjrD6szKnoYOlNjHE=; b=4yyQsuQT/5/5HK8XLipggX9SSL
	myM/OR7lEv21HLhdQjdnKYURL18A1ZhqXue6sKB6PGGkawRYZejxpJ/eI2z9N79LBJu3YxpJtwOPu
	j/nP8zwcr0B4lfgqL8LhaZwWkvthpbv2kyndrR324WNupV/hHFjrDz4yXxg7fo1cDO1Q7uhNza3mH
	yVRjZQVqFHjksKN5TuCXZSNhH1AlCz7D9hbWFdZQdbvsyoF11ygi83/tlGO/e2gfWSrCAv+WJUjci
	GRpJJcYnMhuUgxY60qbuMF3YajKE93YDvZ/KzZOi4xTnAK9gTIWogrFLLX+bkLNr7hd5ysojG6wxZ
	Khu2oOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2Ad-00000009faZ-0V5u;
	Mon, 18 Nov 2024 13:52:03 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1z1-00000009csN-1RtO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:40:10 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIBhWMD021684;
	Mon, 18 Nov 2024 14:39:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	K2o8RWIwZHcDnCoRZbJ0AgekAHRjrD6szKnoYOlNjHE=; b=s8rC4xfCBxwrPn82
	T3VMocSMSWD4Zu5iyWVL5wFsLeF/s5ku/Yup4cGOGw50sRaKHd9c9RFbCBSE4mUz
	ijOt2nq6wnbTBAC3WhmYYVIab5DBk1YCZ26yumhbt0LLM41oreh3qPMiDKtn1pJV
	DtrO0w0YTDqWftSGYkyPJNCXnkODNjoIuiNzLdXnVy3zIApKVKc2fK2zba4dEsGy
	zaet3Rt79jDOr12XuMZaFvXZ2QwkblgXqh5VlMF6/W1as2hhjsXSz17wKvNJVATy
	WKu3qpiZhfZhVpaKjqm520YzvejJXsG1EBTdNbGjiriPYeHRUEIzMji66W1eBXUQ
	DrwIOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkq5qhhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 14:39:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 06CE84005D;
	Mon, 18 Nov 2024 14:38:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 555BC2747D8;
	Mon, 18 Nov 2024 14:35:29 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 18 Nov
 2024 14:35:29 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 18 Nov 2024 14:35:28 +0100
Subject: [PATCH v3 05/15] media: stm32: dcmipp: replace s_stream with
 enable/disable_streams
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-csi_dcmipp_mp25-v3-5-c1914afb0a0f@foss.st.com>
References: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
In-Reply-To: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_054003_685508_44710BED 
X-CRM114-Status: GOOD (  20.17  )
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

Replace s_stream ops with enable_streams and disable_streams.
At the same time, use v4l2_subdev_enable_streams and
v4l2_subdev_disable_streams functions instead of
direct s_stream calls.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

---
v2: add missing state argument within dcmipp_par_configure call
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  49 ++++------
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  98 +++++++++++--------
 .../st/stm32/stm32-dcmipp/dcmipp-parallel.c        | 107 ++++++++++++---------
 3 files changed, 139 insertions(+), 115 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 0f6918f4db383f4e0762030218101f759f375e95..48596592bfd517b9d46946d27f154f0d17ebed78 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -112,6 +112,7 @@ struct dcmipp_bytecap_device {
 	u32 sequence;
 	struct media_pipeline pipe;
 	struct v4l2_subdev *s_subdev;
+	u32 s_subdev_pad_nb;
 
 	enum dcmipp_state state;
 
@@ -337,33 +338,6 @@ static const struct v4l2_ioctl_ops dcmipp_bytecap_ioctl_ops = {
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 };
 
-static int dcmipp_pipeline_s_stream(struct dcmipp_bytecap_device *vcap,
-				    int state)
-{
-	struct media_pad *pad;
-	int ret;
-
-	/*
-	 * Get source subdev - since link is IMMUTABLE, pointer is cached
-	 * within the dcmipp_bytecap_device structure
-	 */
-	if (!vcap->s_subdev) {
-		pad = media_pad_remote_pad_first(&vcap->vdev.entity.pads[0]);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			return -EINVAL;
-		vcap->s_subdev = media_entity_to_v4l2_subdev(pad->entity);
-	}
-
-	ret = v4l2_subdev_call(vcap->s_subdev, video, s_stream, state);
-	if (ret < 0) {
-		dev_err(vcap->dev, "failed to %s streaming (%d)\n",
-			state ? "start" : "stop", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static void dcmipp_start_capture(struct dcmipp_bytecap_device *vcap,
 				 struct dcmipp_buf *buf)
 {
@@ -395,11 +369,24 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
 	struct media_entity *entity = &vcap->vdev.entity;
 	struct dcmipp_buf *buf;
+	struct media_pad *pad;
 	int ret;
 
 	vcap->sequence = 0;
 	memset(&vcap->count, 0, sizeof(vcap->count));
 
+	/*
+	 * Get source subdev - since link is IMMUTABLE, pointer is cached
+	 * within the dcmipp_bytecap_device structure
+	 */
+	if (!vcap->s_subdev) {
+		pad = media_pad_remote_pad_first(&vcap->vdev.entity.pads[0]);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			return -EINVAL;
+		vcap->s_subdev = media_entity_to_v4l2_subdev(pad->entity);
+		vcap->s_subdev_pad_nb = pad->index;
+	}
+
 	ret = pm_runtime_resume_and_get(vcap->dev);
 	if (ret < 0) {
 		dev_err(vcap->dev, "%s: Failed to start streaming, cannot get sync (%d)\n",
@@ -414,7 +401,8 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 		goto err_pm_put;
 	}
 
-	ret = dcmipp_pipeline_s_stream(vcap, 1);
+	ret = v4l2_subdev_enable_streams(vcap->s_subdev,
+					 vcap->s_subdev_pad_nb, BIT_ULL(0));
 	if (ret)
 		goto err_media_pipeline_stop;
 
@@ -482,7 +470,10 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	int ret;
 	u32 status;
 
-	dcmipp_pipeline_s_stream(vcap, 0);
+	ret = v4l2_subdev_disable_streams(vcap->s_subdev,
+					  vcap->s_subdev_pad_nb, BIT_ULL(0));
+	if (ret)
+		dev_warn(vcap->dev, "Failed to disable stream\n");
 
 	/* Stop the media pipeline */
 	media_pipeline_stop(vcap->vdev.entity.pads);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 50500112eab9a7b10a0c5e29773e31ded1a66628..a19c8235af565fb5f673ba90b37ebfcadf03d72e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -380,30 +380,19 @@ static int dcmipp_byteproc_set_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static const struct v4l2_subdev_pad_ops dcmipp_byteproc_pad_ops = {
-	.enum_mbus_code		= dcmipp_byteproc_enum_mbus_code,
-	.enum_frame_size	= dcmipp_byteproc_enum_frame_size,
-	.get_fmt		= v4l2_subdev_get_fmt,
-	.set_fmt		= dcmipp_byteproc_set_fmt,
-	.get_selection		= dcmipp_byteproc_get_selection,
-	.set_selection		= dcmipp_byteproc_set_selection,
-};
-
 static int dcmipp_byteproc_configure_scale_crop
-			(struct dcmipp_byteproc_device *byteproc)
+			(struct dcmipp_byteproc_device *byteproc,
+			 struct v4l2_subdev_state *state)
 {
 	const struct dcmipp_byteproc_pix_map *vpix;
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	u32 hprediv, vprediv;
 	struct v4l2_rect *compose, *crop;
 	u32 val = 0;
 
-	state = v4l2_subdev_lock_and_get_active_state(&byteproc->sd);
 	sink_fmt = v4l2_subdev_state_get_format(state, 0);
 	compose = v4l2_subdev_state_get_compose(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 1);
-	v4l2_subdev_unlock_state(state);
 
 	/* find output format bpp */
 	vpix = dcmipp_byteproc_pix_map_by_code(sink_fmt->code);
@@ -458,46 +447,73 @@ static int dcmipp_byteproc_configure_scale_crop
 	return 0;
 }
 
-static int dcmipp_byteproc_s_stream(struct v4l2_subdev *sd, int enable)
+static int dcmipp_byteproc_enable_streams(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  u32 pad, u64 streams_mask)
 {
 	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
 	struct v4l2_subdev *s_subdev;
-	struct media_pad *pad;
-	int ret = 0;
+	struct media_pad *s_pad;
+	int ret;
 
 	/* Get source subdev */
-	pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
-	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
 		return -EINVAL;
-	s_subdev = media_entity_to_v4l2_subdev(pad->entity);
-
-	if (enable) {
-		ret = dcmipp_byteproc_configure_scale_crop(byteproc);
-		if (ret)
-			return ret;
-
-		ret = v4l2_subdev_call(s_subdev, video, s_stream, enable);
-		if (ret < 0) {
-			dev_err(byteproc->dev,
-				"failed to start source subdev streaming (%d)\n",
-				ret);
-			return ret;
-		}
-	} else {
-		ret = v4l2_subdev_call(s_subdev, video, s_stream, enable);
-		if (ret < 0) {
-			dev_err(byteproc->dev,
-				"failed to stop source subdev streaming (%d)\n",
-				ret);
-			return ret;
-		}
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	ret = dcmipp_byteproc_configure_scale_crop(byteproc, state);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(byteproc->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
 	}
 
 	return 0;
 }
 
+static int dcmipp_byteproc_disable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
+{
+	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	ret = v4l2_subdev_disable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(byteproc->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops dcmipp_byteproc_pad_ops = {
+	.enum_mbus_code		= dcmipp_byteproc_enum_mbus_code,
+	.enum_frame_size	= dcmipp_byteproc_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= dcmipp_byteproc_set_fmt,
+	.get_selection		= dcmipp_byteproc_get_selection,
+	.set_selection		= dcmipp_byteproc_set_selection,
+	.enable_streams		= dcmipp_byteproc_enable_streams,
+	.disable_streams	= dcmipp_byteproc_disable_streams,
+};
+
 static const struct v4l2_subdev_video_ops dcmipp_byteproc_video_ops = {
-	.s_stream = dcmipp_byteproc_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_ops dcmipp_byteproc_ops = {
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
index 05e8897ae37a4b6c8e16c066e83ff5b1d1e07635..823c9da336a7fc63dca2aeeb2ac9377821bf6371 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
@@ -260,18 +260,11 @@ static int dcmipp_par_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static const struct v4l2_subdev_pad_ops dcmipp_par_pad_ops = {
-	.enum_mbus_code		= dcmipp_par_enum_mbus_code,
-	.enum_frame_size	= dcmipp_par_enum_frame_size,
-	.get_fmt		= v4l2_subdev_get_fmt,
-	.set_fmt		= dcmipp_par_set_fmt,
-};
-
-static int dcmipp_par_configure(struct dcmipp_par_device *par)
+static int dcmipp_par_configure(struct dcmipp_par_device *par,
+				struct v4l2_subdev_state *state)
 {
 	u32 val = 0;
 	const struct dcmipp_par_pix_map *vpix;
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	struct v4l2_mbus_framefmt *src_fmt;
 
@@ -305,10 +298,8 @@ static int dcmipp_par_configure(struct dcmipp_par_device *par)
 	}
 
 	/* Set format */
-	state = v4l2_subdev_lock_and_get_active_state(&par->sd);
 	sink_fmt = v4l2_subdev_state_get_format(state, 0);
 	src_fmt = v4l2_subdev_state_get_format(state, 1);
-	v4l2_subdev_unlock_state(state);
 
 	vpix = dcmipp_par_pix_map_by_code(sink_fmt->code, src_fmt->code);
 	if (!vpix) {
@@ -327,53 +318,79 @@ static int dcmipp_par_configure(struct dcmipp_par_device *par)
 	return 0;
 }
 
-static int dcmipp_par_s_stream(struct v4l2_subdev *sd, int enable)
+static int dcmipp_par_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     u32 pad, u64 streams_mask)
 {
 	struct dcmipp_par_device *par =
 				container_of(sd, struct dcmipp_par_device, sd);
 	struct v4l2_subdev *s_subdev;
-	struct media_pad *pad;
-	int ret = 0;
+	struct media_pad *s_pad;
+	int ret;
 
 	/* Get source subdev */
-	pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
-	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
 		return -EINVAL;
-	s_subdev = media_entity_to_v4l2_subdev(pad->entity);
-
-	if (enable) {
-		ret = dcmipp_par_configure(par);
-		if (ret)
-			return ret;
-
-		/* Enable parallel interface */
-		reg_set(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
-
-		ret = v4l2_subdev_call(s_subdev, video, s_stream, enable);
-		if (ret < 0) {
-			dev_err(par->dev,
-				"failed to start source subdev streaming (%d)\n",
-				ret);
-			return ret;
-		}
-	} else {
-		ret = v4l2_subdev_call(s_subdev, video, s_stream, enable);
-		if (ret < 0) {
-			dev_err(par->dev,
-				"failed to stop source subdev streaming (%d)\n",
-				ret);
-			return ret;
-		}
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	ret = dcmipp_par_configure(par, state);
+	if (ret)
+		return ret;
+
+	/* Enable parallel interface */
+	reg_set(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
 
-		/* Disable parallel interface */
-		reg_clear(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(par->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
+static int dcmipp_par_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	struct dcmipp_par_device *par =
+				container_of(sd, struct dcmipp_par_device, sd);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	ret = v4l2_subdev_disable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(par->dev,
+			"failed to stop source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	/* Disable parallel interface */
+	reg_clear(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops dcmipp_par_pad_ops = {
+	.enum_mbus_code		= dcmipp_par_enum_mbus_code,
+	.enum_frame_size	= dcmipp_par_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= dcmipp_par_set_fmt,
+	.enable_streams		= dcmipp_par_enable_streams,
+	.disable_streams	= dcmipp_par_disable_streams,
+};
+
 static const struct v4l2_subdev_video_ops dcmipp_par_video_ops = {
-	.s_stream = dcmipp_par_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_ops dcmipp_par_ops = {

-- 
2.25.1


