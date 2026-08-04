Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672ACC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7Efmwfr0m2CFr5zdAHyTEa+Y+uGgW5NkkGLGuXrnJE=; b=fqiSOHM2cz4c/I80dRVlrUpqfq
	MJBK05jdvHbMDHCRHDuPz4odCRDWlPeGbFrvz1rUHhcnx3LEIJyUzABG69yv/VJctPBdW0opgL0WB
	tye10wnK2BTKaHe1nTybFiOZMuI0Y2cGpFBAfH03NKn6nP8odxkZ6Jew4z2eCwuywN8S2R3v61SnT
	p9LRf1BKW9lX50V00SMSpJlbSbY1j4vSeUjyCEVtH8/D8cuVUqSqaTvT8iesPnTszSd1lnjC7ngYQ
	uHEccR8MEzsznO6fgxSdy7xWB1oRsAs+aU90d3041Ye1+fax3zij1zlVjappX0s4ShNXJqYSfjqdQ
	NilVlOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Z5-00000001Edg-1Zhp;
	Tue, 04 Aug 2026 07:27:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Z2-00000001Ebu-0yON
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:27:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954d29264cso14806685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785828470; x=1786433270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7Efmwfr0m2CFr5zdAHyTEa+Y+uGgW5NkkGLGuXrnJE=;
        b=HOEKWbw78RW3Mc1uOGlgO0g8V9SF7xVH6xApW7GPsG56ne4V5alSGyCnUtpq9xboj1
         qGEZwtbxxlAmKDcB4ajiwyBf7hu48r2//erbY2Ois4vyNkZ0ETjfnoqbP66zrxPcgS71
         0tyMIy05DzkpXO5m9t/06AoKu+lLWtHS/FZlrMhfL9ZkXrO/LGGcY6ddoejBNS7oXqtY
         ppv08eFcazt0Om/AoIjJd1zHt31ACRJ2EMuCMPckqhcaFqUSKNTErnxjt7pZIz0pukwS
         JeMsxKulklB3/y3Obr+LHGD4wytNqhNFPi7ktXqSM5fIJEkU/I30KPTiFAQpAdcdCdYO
         yS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785828470; x=1786433270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7Efmwfr0m2CFr5zdAHyTEa+Y+uGgW5NkkGLGuXrnJE=;
        b=Dy0MeEVp8S0FDPSvInKK+VmOasUkdaaO2F4awwp6GyF+4KtR/JtENXP6nPKc4hebqI
         ZkootgCop4pkBa5wPpq9rG5HJSIPvus1D+4aFnlq0tduoOm23144g7+LUMgETt8zOZ8S
         31T+dsEPezGIguHDauSL/hxYlLov2dwZe5K+UqrkdqX7UB+uuJyEh1bqpcpSVHpD4pwv
         e8QnlV0sXTcMJSU14wHEq06iP936jK8cPg2GHQMRm47xoVgSR/CeLdRTZnoxcz1HvfjM
         BhFKfsGYRsLX0xc8IASu9pTPkL1PN53ryJQn+FdjbD0b1Uapxx/sEFR4ialuLY3PWW6c
         zQag==
X-Forwarded-Encrypted: i=1; AHgh+Rqn/sUCLddrtFk54kOnB/ddXLaE5v4mxTZQZwECZGfDkEc+pqyMGba4prE/n8Y7ahYqFoLP+OibLrYVkxc8WmEM@lists.infradead.org
X-Gm-Message-State: AOJu0YxEvvzdn5ngOOEdxBUIl5A3or8kElm+KKpYoZ4Gr/1RfoawoVz2
	N8gazcqNSbyjXJGgXgfjbxi3paEyEO5QrMAtCgRsj8QCNNIdMsobOqUr
X-Gm-Gg: AR+sD13Tgg3Icw+2rMrsS5YudYc9btCOEE5mlvIVpTYUDfvXayyJE42dgo8r7fWFNxX
	HW7gaCZjtwpSLLFbCmy7NAJcdv0AcdS2SoEghupDXW2dYZBg+/zBxP+7e3Lg9Dun3ekAbi45SvT
	92MofieY5Tzoa5ZGal7pj82ZYKLlWxEymEtWdY49qUnzChCok/wxRbD4Wu//W7PEuF9XsdCoD+x
	qoHoMvj1/t6qcE3m1bOvvHgV9Ps1RXG6VhNu6gqEH2CVhZXOLGvWMb3k9SsPayl6CzJuJohBRuv
	JaNrPQbbXKGuQmai3vgM9qC4rslJWZ/zhu6F3ojgK1rKASMMz0FvUcEb2fYhbHNd6Xs694sPW/E
	kX4xpVa8NL8D9BcXTNog4AGCg7TDB7ge962tcst7T3CsWIeDZgKSk6G/vTfxHlagUdhrLhN4v0m
	rJFWpN93Hc8qFzaBDOOi9oYLJTEo7vSTvB4H9aD68a5spkOE1sgBgpcPSbAoBqEP5StJULv8/zY
	RRgnkdW/6K+FueJ/cxaskAUsbYwuSBM0tRUCvwJj547rg==
X-Received: by 2002:a05:600c:4f4a:b0:495:6478:2dbc with SMTP id 5b1f17b1804b1-4980eea02e5mr277297385e9.6.1785828470185;
        Tue, 04 Aug 2026 00:27:50 -0700 (PDT)
Received: from thinkpad ([2.176.232.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb46esm73757785e9.5.2026.08.04.00.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:27:49 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v4 1/3] media: sun6i-mipi-csi2: Use V4L2 subdev active state
Date: Tue,  4 Aug 2026 10:56:28 +0330
Message-Id: <20260804072630.28745-2-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804072630.28745-1-arash.golgol@gmail.com>
References: <20260804072630.28745-1-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_002752_317209_FFF51E30 
X-CRM114-Status: GOOD (  23.42  )
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

Use the V4L2 subdev active state API to store the active format.
This simplifies the driver not only by dropping the bridge mbus_format
field, but it also allows dropping the bridge lock, replaced with
the state lock.

The sun6i-mipi-csi2 hardware does not perform any format conversion.
Enforce identical formats on the sink and source pads in the set_fmt()
and init_state() callbacks.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
---
No changes in v4, just resend
    - Link to v3: https://patchwork.linuxtv.org/project/linux-media/patch/20260214050943.6306-1-arash.golgol@gmail.com/
    - Link to v3: https://lore.kernel.org/linux-media/20260214050943.6306-1-arash.golgol@gmail.com/

Changes in v3:
    - link to v2: https://patchwork.kernel.org/project/linux-media/patch/20260209055529.16644-1-arash.golgol@gmail.com/
    - Keep error path jumping to error_v4l2_notifier_cleanup on 
    bridge setup failure

Changes in v2:
    - link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260206123455.46476-1-arash.golgol@gmail.com/
    - Simplify control flow by dropping the else at end of s_stream()
    - Call v4l2_subdev_cleanup() on bridge setup failure before 
    notifier registration
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 +++++++++---------
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
 2 files changed, 53 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index b06cb73015cd..17a9a215a98a 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_mipi_csi2_device *csi2_dev)
 			   SUN6I_MIPI_CSI2_CTL_EN, 0);
 }
 
-static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev)
+static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev,
+				      const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi2_dev->regmap;
 	unsigned int lanes_count =
 		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
-	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
 	const struct sun6i_mipi_csi2_format *format;
 	struct device *dev = csi2_dev->dev;
 	u32 version = 0;
@@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	struct v4l2_subdev *source_subdev = csi2_dev->bridge.source_subdev;
 	union phy_configure_opts dphy_opts = { 0 };
 	struct phy_configure_opts_mipi_dphy *dphy_cfg = &dphy_opts.mipi_dphy;
-	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
+	struct v4l2_subdev_state *state;
+	const struct v4l2_mbus_framefmt *mbus_format;
 	const struct sun6i_mipi_csi2_format *format;
 	struct phy *dphy = csi2_dev->dphy;
 	struct device *dev = csi2_dev->dev;
@@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	unsigned long pixel_rate;
 	int ret;
 
-	if (!source_subdev)
-		return -ENODEV;
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+
+	if (!source_subdev) {
+		ret = -ENODEV;
+		goto unlock;
+	}
 
 	if (!on) {
 		v4l2_subdev_call(source_subdev, video, s_stream, 0);
@@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	/* Sensor Pixel Rate */
 
@@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 		goto error_pm;
 	}
 
+	mbus_format = v4l2_subdev_state_get_format(state,
+						   SUN6I_MIPI_CSI2_PAD_SINK);
 	format = sun6i_mipi_csi2_format_find(mbus_format->code);
 	if (WARN_ON(!format)) {
 		ret = -ENODEV;
@@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 
 	/* Controller */
 
-	sun6i_mipi_csi2_configure(csi2_dev);
+	sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
 	sun6i_mipi_csi2_enable(csi2_dev);
 
 	/* D-PHY */
@@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	if (ret && ret != -ENOIOCTLCMD)
 		goto disable;
 
-	return 0;
+	ret = 0;
+	goto unlock;
 
 disable:
 	phy_power_off(dphy);
@@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 error_pm:
 	pm_runtime_put(dev);
 
+unlock:
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
 				      struct v4l2_subdev_state *state)
 {
-	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
-	unsigned int pad = SUN6I_MIPI_CSI2_PAD_SINK;
-	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_state_get_format(state, pad);
-	struct mutex *lock = &csi2_dev->bridge.lock;
+	unsigned int pad;
 
-	mutex_lock(lock);
+	/*
+	 * This subdev does not perform format conversion,
+	 * initialize both pads identically.
+	 */
+	for (pad = 0; pad < subdev->entity.num_pads; pad++) {
+		struct v4l2_mbus_framefmt *mbus_format;
 
-	mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
-	mbus_format->width = 640;
-	mbus_format->height = 480;
+		mbus_format = v4l2_subdev_state_get_format(state, pad);
 
-	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
+		mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
+		mbus_format->width = 640;
+		mbus_format->height = 480;
 
-	mutex_unlock(lock);
+		sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
+	}
 
 	return 0;
 }
@@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_state *state,
-				   struct v4l2_subdev_format *format)
-{
-	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi2_dev->bridge.lock;
-
-	mutex_lock(lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_state_get_format(state,
-							     format->pad);
-	else
-		*mbus_format = csi2_dev->bridge.mbus_format;
-
-	mutex_unlock(lock);
-
-	return 0;
-}
-
 static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
-	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi2_dev->bridge.lock;
+	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(lock);
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad != SUN6I_MIPI_CSI2_PAD_SINK)
+		return v4l2_subdev_get_fmt(subdev, state, format);
 
-	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
+	sun6i_mipi_csi2_mbus_format_prepare(&format->format);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_state_get_format(state, format->pad) =
-			*mbus_format;
-	else
-		csi2_dev->bridge.mbus_format = *mbus_format;
+	/* Set the format on the sink pad. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad);
+	*fmt = format->format;
 
-	mutex_unlock(lock);
+	/* Propagate the format to the source pad. */
+	fmt = v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_SOURCE);
+	*fmt = format->format;
 
 	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops = {
 	.enum_mbus_code	= sun6i_mipi_csi2_enum_mbus_code,
-	.get_fmt	= sun6i_mipi_csi2_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= sun6i_mipi_csi2_set_fmt,
 };
 
@@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 	bool notifier_registered = false;
 	int ret;
 
-	mutex_init(&bridge->lock);
-
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
@@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 	if (ret)
 		return ret;
 
+	/* V4L2 Subdev finalize */
+
+	ret = v4l2_subdev_init_finalize(subdev);
+	if (ret < 0)
+		goto error_media_entity_cleanup;
+
 	/* V4L2 Async */
 
 	v4l2_async_subdev_nf_init(notifier, subdev);
@@ -565,6 +560,9 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 error_v4l2_notifier_cleanup:
 	v4l2_async_nf_cleanup(notifier);
 
+	v4l2_subdev_cleanup(subdev);
+
+error_media_entity_cleanup:
 	media_entity_cleanup(&subdev->entity);
 
 	return ret;
@@ -579,6 +577,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_csi2_device *csi2_dev)
 	v4l2_async_unregister_subdev(subdev);
 	v4l2_async_nf_unregister(notifier);
 	v4l2_async_nf_cleanup(notifier);
+	v4l2_subdev_cleanup(subdev);
 	media_entity_cleanup(&subdev->entity);
 }
 
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
index 24b15e34b5e8..d72dfbd6a993 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
@@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
 	struct media_pad		pads[SUN6I_MIPI_CSI2_PAD_COUNT];
 	struct v4l2_fwnode_endpoint	endpoint;
 	struct v4l2_async_notifier	notifier;
-	struct v4l2_mbus_framefmt	mbus_format;
-	struct mutex			lock; /* Mbus format lock. */
 
 	struct v4l2_subdev		*source_subdev;
 };
-- 
2.34.1


