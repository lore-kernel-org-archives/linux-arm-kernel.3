Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374C6C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jx3KKCoREZDLk+UBI4QJdQoRi8meTT2x0gBgXr/HC7c=; b=HZgcTRL65dxCDMCR53bCTcMcGh
	++Ui/l9hBzlaxbh2PXpv2iTVHINt5yy2Ee65GRZcf+LkisuFm8Z6dQeHDXuoaToTYJMgXcYz4rzak
	s2xqHYHgYaD434KD8CqhDhRxgoJZkz4ab1HJM1ekJLFHYhpBFs9J/u+l6NstZIvm4FCUvwCgh5r81
	sjfV3/endWMR+wdTH37adR2LUDqZE0IwUXA7x6j8SVXTheY9Zk58ZylT0knCXgsjqax1nkX1YuFuL
	eAgfL6eZ6FccipE5OfAKrdnNo5HiMMg1hOxu6DA2WiK/RPk+ltUaGNk64trZ2iNkHj0Ou/Os/Q90q
	1DjiAdGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Z7-00000001Ef7-2GSP;
	Tue, 04 Aug 2026 07:27:57 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Z4-00000001Ecg-3LdV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:27:56 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-495590dde14so28875645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785828473; x=1786433273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jx3KKCoREZDLk+UBI4QJdQoRi8meTT2x0gBgXr/HC7c=;
        b=sv2vpaQAx1T4DpqUsylDJvIvJ8kFFW2beVh09O7XrwJOyM3GEJqI6qJ42U8D+OI3H4
         CcVxDauOoSsEcBgTaxMa3lo5U2+K2pMZ1+xY6f+xQZWMo9QksYqiXZmbau+x5VjQ6vEI
         GxqC9BDRe5PalWctIWvKizMOSKsQOYLzjUwoNSLxwG9jQ4pd8CMXvJx3IgDW6RI3vEaJ
         XdiGyYlw2+doDiYZlbhCCKuxAhnPvAAr/w6r0sDoQKQ28rP+13E5fIhYJONDkChWjbn6
         AjHsCJFlmfsdSq4C+c+u8ilde9PYD50vjpy35+OD3+cXs/vBp4jmkGly7P9EVsZF2kvo
         tbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785828473; x=1786433273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jx3KKCoREZDLk+UBI4QJdQoRi8meTT2x0gBgXr/HC7c=;
        b=o1qNjKBk25M9hOtBJ0hLjcLhsxJ8neJz4cALvqhqAXyvss7FQbxUm3acc67i2pLeRM
         9MMrE5plmsnO3V4DmHLQOiaZNS9JnC4puj2hVDiUs8MyMf07ogoJqf+qS6uJs5MevhX0
         27vE4fCdfgbmdHRqnfmahr1Q4WLTapIDdRdvY8t+gtudUF4bJYHkCfE/gQAtjitoH0IW
         L1g455Exdk4cwNThFrH/v7Fp6vwyKSwOeqvT0m9vByeMCcTpdona4rOfAX2x8qER9Aq/
         hLCJn+fBLcoaiESiXW+csJrNv0dx9ocF5r23hDgOh8CttI6yaDlXb6EoADijB3EuQ9f+
         Gm5w==
X-Forwarded-Encrypted: i=1; AHgh+RpI6S4+sDP6gC/bGT3x8zenO5WmZzWkctteh2b77PuN4OeHEIMpVmr68t3M8cm2PRdCPJVEG7eZwjAP2vNvhC7t@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1KogVBCy8c+zqnbpe14XXcC94i7w9/4978uvVghRV123kzxZr
	W/F/irk3sDl+Hzh/dxVETuCEkf4DrefpgwHrk3gC4iW4Oyz+VO4EEebD
X-Gm-Gg: AR+sD11qQ0kVQmrlQ4vRey2+F3lcwjWHeOlz3y9Xnj2MMn4pLorg3MInp7+xVp32e0+
	5MQwFrbcLI0Se0I9+EGmrDXz6FOSdf2JlfvCHgvtJVp6gW70exibLV6MQIqXtau3GeRkZzjHy/E
	+2g+naA68lbqOuVLxAbyQKlInIufyux+BgOjwJYAs6nxMPN+FA7/E2q1kidBEDNDOMDZ6MRiJJM
	xzkeRwKvHDMlAWsFNwwLjMyTNtSaPECzxtpmu+9AtikDtV0NOrc/m1tupgu+amSjQGFG/gE4p8w
	uxza0NtHBnW0AUteBIPVfttUv3fGc7SCKf1CwI23xPFhoesZiIco/XlDjlol7o/NxVgwgAnhOuG
	Gb/EQZuowZlR5ACvkLXH/J21Q/+0ooe33DyJSXU7r7rdMqMxHrztzVJhwcKvJr1e0UoY44E8O7w
	cFHT5dEck2Mx9uEfOJtziFB1wIfji4BU5wYUQM+AFQWD4E1ktvhs2cOd6O8PuusvLToDXJTjuEW
	7BhAyfxbhvPNaCUfHy7ULCIIxUO0n7Q+MA+b32ZQ8Ztnom+iYlaQT/E
X-Received: by 2002:a05:600c:4f4a:b0:495:6478:2dbc with SMTP id 5b1f17b1804b1-4980eea02e5mr277299675e9.6.1785828472784;
        Tue, 04 Aug 2026 00:27:52 -0700 (PDT)
Received: from thinkpad ([2.176.232.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm60878615e9.11.2026.08.04.00.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:27:52 -0700 (PDT)
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
Subject: [PATCH v4 2/3] media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
Date: Tue,  4 Aug 2026 10:56:29 +0330
Message-Id: <20260804072630.28745-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804072630.28745-1-arash.golgol@gmail.com>
References: <20260804072630.28745-1-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_002754_885973_9006AB00 
X-CRM114-Status: GOOD (  23.35  )
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

The sun8i-a83t-mipi-csi2 hardware does not perform any format
conversion. Enforce identical formats on the sink and source pads in
the set_fmt() and init_state() callbacks.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
---
No changes in v4, just resend
    - Link to v3: https://patchwork.linuxtv.org/project/linux-media/patch/20260515173101.8978-1-arash.golgol@gmail.com/
    - Link to v3: https://lore.kernel.org/linux-media/20260515173101.8978-1-arash.golgol@gmail.com/

Changes in v3:
 - Fix active state lock leak on runtime PM error path

Changes in v2:
 - Initialize active state before calling v4l2_subdev_state_get_format()
 - Fix line wrapping reported by checkpatch
 - Link to media-ci report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99865145/artifacts/report.htm

 .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++++---------
 .../sun8i_a83t_mipi_csi2.h                    |   2 -
 2 files changed, 55 insertions(+), 59 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index dbc51daa4fe3..38a6ef19f4ff 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -144,12 +144,12 @@ sun8i_a83t_mipi_csi2_disable(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
 }
 
 static void
-sun8i_a83t_mipi_csi2_configure(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
+sun8i_a83t_mipi_csi2_configure(struct sun8i_a83t_mipi_csi2_device *csi2_dev,
+			       const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi2_dev->regmap;
 	unsigned int lanes_count =
 		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
-	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
 	const struct sun8i_a83t_mipi_csi2_format *format;
 	struct device *dev = csi2_dev->dev;
 	u32 version = 0;
@@ -205,7 +205,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	struct v4l2_subdev *source_subdev = csi2_dev->bridge.source_subdev;
 	union phy_configure_opts dphy_opts = { 0 };
 	struct phy_configure_opts_mipi_dphy *dphy_cfg = &dphy_opts.mipi_dphy;
-	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
+	struct v4l2_subdev_state *state;
+	const struct v4l2_mbus_framefmt *mbus_format;
 	const struct sun8i_a83t_mipi_csi2_format *format;
 	struct phy *dphy = csi2_dev->dphy;
 	struct device *dev = csi2_dev->dev;
@@ -215,8 +216,12 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
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
@@ -228,7 +233,7 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	/* Sensor pixel rate */
 
@@ -254,6 +259,9 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 		goto error_pm;
 	}
 
+	mbus_format =
+		v4l2_subdev_state_get_format(state,
+					     SUN8I_A83T_MIPI_CSI2_PAD_SINK);
 	format = sun8i_a83t_mipi_csi2_format_find(mbus_format->code);
 	if (WARN_ON(!format)) {
 		ret = -ENODEV;
@@ -292,7 +300,7 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 
 	/* Controller */
 
-	sun8i_a83t_mipi_csi2_configure(csi2_dev);
+	sun8i_a83t_mipi_csi2_configure(csi2_dev, mbus_format);
 	sun8i_a83t_mipi_csi2_enable(csi2_dev);
 
 	/* D-PHY */
@@ -309,7 +317,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	if (ret && ret != -ENOIOCTLCMD)
 		goto disable;
 
-	return 0;
+	ret = 0;
+	goto unlock;
 
 disable:
 	phy_power_off(dphy);
@@ -318,6 +327,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 error_pm:
 	pm_runtime_put(dev);
 
+unlock:
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -341,22 +352,23 @@ sun8i_a83t_mipi_csi2_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 static int sun8i_a83t_mipi_csi2_init_state(struct v4l2_subdev *subdev,
 					   struct v4l2_subdev_state *state)
 {
-	struct sun8i_a83t_mipi_csi2_device *csi2_dev =
-		v4l2_get_subdevdata(subdev);
-	unsigned int pad = SUN8I_A83T_MIPI_CSI2_PAD_SINK;
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
 
-	mbus_format->code = sun8i_a83t_mipi_csi2_formats[0].mbus_code;
-	mbus_format->width = 640;
-	mbus_format->height = 480;
+		mbus_format = v4l2_subdev_state_get_format(state, pad);
 
-	sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
+		mbus_format->code = sun8i_a83t_mipi_csi2_formats[0].mbus_code;
+		mbus_format->width = 640;
+		mbus_format->height = 480;
 
-	mutex_unlock(lock);
+		sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
+	}
 
 	return 0;
 }
@@ -375,55 +387,33 @@ sun8i_a83t_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int sun8i_a83t_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
-					struct v4l2_subdev_state *state,
-					struct v4l2_subdev_format *format)
-{
-	struct sun8i_a83t_mipi_csi2_device *csi2_dev =
-		v4l2_get_subdevdata(subdev);
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
 static int sun8i_a83t_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_format *format)
 {
-	struct sun8i_a83t_mipi_csi2_device *csi2_dev =
-		v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi2_dev->bridge.lock;
+	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(lock);
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad != SUN8I_A83T_MIPI_CSI2_PAD_SINK)
+		return v4l2_subdev_get_fmt(subdev, state, format);
 
-	sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
+	sun8i_a83t_mipi_csi2_mbus_format_prepare(&format->format);
 
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
+	fmt = v4l2_subdev_state_get_format(state,
+					   SUN8I_A83T_MIPI_CSI2_PAD_SOURCE);
+	*fmt = format->format;
 
 	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops sun8i_a83t_mipi_csi2_pad_ops = {
 	.enum_mbus_code	= sun8i_a83t_mipi_csi2_enum_mbus_code,
-	.get_fmt	= sun8i_a83t_mipi_csi2_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= sun8i_a83t_mipi_csi2_set_fmt,
 };
 
@@ -540,8 +530,6 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
 	bool notifier_registered = false;
 	int ret;
 
-	mutex_init(&bridge->lock);
-
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun8i_a83t_mipi_csi2_subdev_ops);
@@ -570,6 +558,12 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
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
@@ -603,6 +597,9 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
 error_v4l2_notifier_cleanup:
 	v4l2_async_nf_cleanup(notifier);
 
+	v4l2_subdev_cleanup(subdev);
+
+error_media_entity_cleanup:
 	media_entity_cleanup(&subdev->entity);
 
 	return ret;
@@ -617,6 +614,7 @@ sun8i_a83t_mipi_csi2_bridge_cleanup(struct sun8i_a83t_mipi_csi2_device *csi2_dev
 	v4l2_async_unregister_subdev(subdev);
 	v4l2_async_nf_unregister(notifier);
 	v4l2_async_nf_cleanup(notifier);
+	v4l2_subdev_cleanup(subdev);
 	media_entity_cleanup(&subdev->entity);
 }
 
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
index f1e64c53434c..819527bcd64d 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
@@ -33,8 +33,6 @@ struct sun8i_a83t_mipi_csi2_bridge {
 	struct media_pad		pads[SUN8I_A83T_MIPI_CSI2_PAD_COUNT];
 	struct v4l2_fwnode_endpoint	endpoint;
 	struct v4l2_async_notifier	notifier;
-	struct v4l2_mbus_framefmt	mbus_format;
-	struct mutex			lock; /* Mbus format lock. */
 
 	struct v4l2_subdev		*source_subdev;
 };
-- 
2.34.1


