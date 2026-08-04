Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F882C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Stl1hrCmVqySbg5XepHwspIwGKPJAVnDz0Q2cLH8Tlo=; b=xKRsGvmoMASORA16a9kx/rPj0i
	UzQhnEkkygCEajf8EKzXWHbWUeTSg6PKDYeaeZ0yNqYEetG06e8T8ibxHV4uq6NYa55iu0ilWD+uG
	ZOWqqEp/AjslqZsyaiMiRQPeT/yMW7my0tl5wx1Ztkpsm2tiSskLXWoZ2qT0atgq/V8f6PL900S3H
	9bw9pHCHgV8s7chS8H2qBqWf6/JMIoyIdNZWwk5+82jv2q0K+oosVBZ2DbxTIygPlMNf0Hs0OMgIl
	XKyqk1TBPuBzwepUFGmgy6LMHrrEWCVma8YBcQq+95/t4GaV7P4m5ygiL64ObbRaN5jbgtjvZ6eip
	MmKorUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9ZA-00000001Eha-36DS;
	Tue, 04 Aug 2026 07:28:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Z8-00000001Eev-0VkI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:27:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso13358875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785828476; x=1786433276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Stl1hrCmVqySbg5XepHwspIwGKPJAVnDz0Q2cLH8Tlo=;
        b=JAo1rFGWBXVTx27sxv7anRoBmu7veisid6RrsfzMDnyJG0qIkk4DlbjCg+fyh8pjZy
         u6GsdQfQiaIiXrRMPeyu+1TcysK64LUUgw9nWYijgbfGzhNFCY0iAdxigsTbRyAhMlXK
         dNo+tPLPH8wKyJBF87+9vO+zE8yW8sex4VbrPVA5WMVpbFUF2HZQLR+TeyfNLoPV2R9a
         smUn9Wm9HwA35xt3U73HYcXcttIedlR7l+cnjDCK43QEyDSbXe1tVZzv0b8sRlBg3xLs
         6FbLqXfG15MtzSYE3wo4Eir6lFxk2v8ZBqQ/dj/E2GFkTNS486kHTSbycykshXfgGWJN
         kFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785828476; x=1786433276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Stl1hrCmVqySbg5XepHwspIwGKPJAVnDz0Q2cLH8Tlo=;
        b=XHfrSjq+lXNqVA9YdE6kekQTlPQ+GYdBZ7faJkAwzm8IyM0M/zS5GGns/MmaclPzM6
         GAfIxVDPGEhSF2Zpgjz1xxtslC1qk8k9Zvty523/V6fSifSy4e1AWAGYJ3soE4Y4rrfF
         JZb8g2ahrvHgIwd/6hzNkx5o/BHAwgDo+pC4kQ82xIQIrCsikAFdH8ineTR736Q1lqWg
         G8c3YrQPzrjde7Q9my4D0Ic1AjA4RT7eHCfkZJJqQmuUn5an/r9pyMMK8G8VViK8rqHb
         08RbGxFnOL7cZOOVC0aRYtUqk3Dk/eotjnZ+KM0sLN7nHZ2WUqcTgfSI7y6RKgtiuggR
         g7hw==
X-Forwarded-Encrypted: i=1; AHgh+RqxmbvSwYkkm+3RKa9ipynkD8sG3ez8gmda+/mm8qBLgq+iktlpkj/4nFT/+o3N8pWwW+AIQeVU/ypAokssuo2I@lists.infradead.org
X-Gm-Message-State: AOJu0YxDSDdQY7221f55AFW7BC7i6v0Ioyeyrfo55NVZjvdHxCITLf3M
	docHksDNdxHjXTJBLA9cvueuMBcImrfGGhSstrRmrpqYnB5kM6LZmi+9
X-Gm-Gg: AR+sD10fnu4nVLaR5YTmCSKY6o8x6lPHN3IdZDhH5XG7rrKy2nf0ycQB/r/oMiggU8R
	Qo8fja7YxPM1kyaG17+6Kj4CR3ptjUvjPo725jbdwHaYNiOuASBeYCttJdy3MP8IgZ5N+5oMY31
	Rq7x7Rg2LKiFmo55wm65AwPBx6jAZLMVuNfc7ujGB2tVLcBr6kAzgQuZL9hgFlhqGkFFQdZuRid
	t2zKqqVrN+6F1mZnI8ZheKxyo038oGZZIlpl2brkK5uYep3Z398myr+lGri4WiOO28C2D6u8FcP
	m537kmfjZy6UY+zOm7TkmM77U/vxVRbUflSvF06A8iyTxtoAeOLmaRgj19u+a6yi3Xg7yo4T/6D
	SamqK3eZ1DBerkgqx4PdXDTiwIhM4P+4ExdE0bEjxbk/7xLYOI74tEXy9MHhqXwcWVGNFsi2TQg
	hZT65Vk+KHxowaTuXUDMww9iWFIuvCxpp+HQJ2nwsaVN5lhNjfXYXqBTjfZBkY0m9EfhucieooA
	BifSZy9vWPb4WiW2LPCQY0EsVqouKxGvHCYivpdduqM2w==
X-Received: by 2002:a05:600d:640f:20b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-4980c672adbmr235613335e9.9.1785828476387;
        Tue, 04 Aug 2026 00:27:56 -0700 (PDT)
Received: from thinkpad ([2.176.232.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm69483575e9.3.2026.08.04.00.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:27:55 -0700 (PDT)
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
Subject: [PATCH v5 3/3] media: sun6i-csi: bridge: Use V4L2 subdev active state
Date: Tue,  4 Aug 2026 10:56:30 +0330
Message-Id: <20260804072630.28745-4-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804072630.28745-1-arash.golgol@gmail.com>
References: <20260804072630.28745-1-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_002758_308705_F27FDAEE 
X-CRM114-Status: GOOD (  24.40  )
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

Previously, capture accessed bridge private state directly. After
moving to framework-managed state, resolve the format through the
subdev pad API.

The sun6i-csi-bridge hardware does not perform any format conversion.
Enforce identical formats on the sink and source pads in the set_fmt()
and init_state() callbacks.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
No changes in v4 and v5, just resend
    - Link to v5: https://patchwork.linuxtv.org/project/linux-media/patch/20260719112714.72802-2-arash.golgol@gmail.com/
    - Link to v5: https://lore.kernel.org/linux-media/20260719112714.72802-2-arash.golgol@gmail.com/
    - Link to v3: https://patchwork.linuxtv.org/project/linux-media/patch/20260509050921.22158-2-arash.golgol@gmail.com/
 
Changes in v3:
 - Fix Media CI robot warnings about open parenthesis
 - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99380724/artifacts/report.htm
 - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/20260508161721.94285-2-arash.golgol@gmail.com/

Changes in v2:
 - Fix indentation in link validation path
 - link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-2-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
 3 files changed, 86 insertions(+), 105 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index d006d9dd0170..43a85bcc2ba2 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -13,26 +13,6 @@
 #include "sun6i_csi_bridge.h"
 #include "sun6i_csi_reg.h"
 
-/* Helpers */
-
-void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
-				 unsigned int *width, unsigned int *height)
-{
-	if (width)
-		*width = csi_dev->bridge.mbus_format.width;
-	if (height)
-		*height = csi_dev->bridge.mbus_format.height;
-}
-
-void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
-			     u32 *mbus_code, u32 *field)
-{
-	if (mbus_code)
-		*mbus_code = csi_dev->bridge.mbus_format.code;
-	if (field)
-		*field = csi_dev->bridge.mbus_format.field;
-}
-
 /* Format */
 
 static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
@@ -226,7 +206,8 @@ static void sun6i_csi_bridge_disable(struct sun6i_csi_device *csi_dev)
 }
 
 static void
-sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
+sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev,
+				    const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct device *dev = csi_dev->dev;
 	struct regmap *regmap = csi_dev->regmap;
@@ -234,11 +215,9 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
 		&csi_dev->bridge.source_parallel.endpoint;
 	unsigned char bus_width = endpoint->bus.parallel.bus_width;
 	unsigned int flags = endpoint->bus.parallel.flags;
-	u32 field;
+	u32 field = mbus_format->field;
 	u32 value = SUN6I_CSI_IF_CFG_IF_CSI;
 
-	sun6i_csi_bridge_format(csi_dev, NULL, &field);
-
 	if (field == V4L2_FIELD_INTERLACED ||
 	    field == V4L2_FIELD_INTERLACED_TB ||
 	    field == V4L2_FIELD_INTERLACED_BT)
@@ -317,13 +296,12 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
 }
 
 static void
-sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
+sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev,
+				     const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi_dev->regmap;
 	u32 value = SUN6I_CSI_IF_CFG_IF_MIPI;
-	u32 field;
-
-	sun6i_csi_bridge_format(csi_dev, NULL, &field);
+	u32 field = mbus_format->field;
 
 	if (field == V4L2_FIELD_INTERLACED ||
 	    field == V4L2_FIELD_INTERLACED_TB ||
@@ -335,19 +313,20 @@ sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
 	regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
 }
 
-static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
+static void
+sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev,
+				  const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi_dev->regmap;
 	bool capture_streaming = csi_dev->capture.state.streaming;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	const struct sun6i_csi_capture_format *capture_format;
-	u32 mbus_code, field, pixelformat;
+	u32 pixelformat;
+	u32 field = mbus_format->field;
 	u8 input_format, input_yuv_seq, output_format;
 	u32 value = 0;
 
-	sun6i_csi_bridge_format(csi_dev, &mbus_code, &field);
-
-	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	bridge_format = sun6i_csi_bridge_format_find(mbus_format->code);
 	if (WARN_ON(!bridge_format))
 		return;
 
@@ -391,16 +370,17 @@ static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
 }
 
 static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_dev,
-				       struct sun6i_csi_bridge_source *source)
+				       struct sun6i_csi_bridge_source *source,
+				       const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
 
 	if (source == &bridge->source_parallel)
-		sun6i_csi_bridge_configure_parallel(csi_dev);
+		sun6i_csi_bridge_configure_parallel(csi_dev, mbus_format);
 	else
-		sun6i_csi_bridge_configure_mipi_csi2(csi_dev);
+		sun6i_csi_bridge_configure_mipi_csi2(csi_dev, mbus_format);
 
-	sun6i_csi_bridge_configure_format(csi_dev);
+	sun6i_csi_bridge_configure_format(csi_dev, mbus_format);
 }
 
 /* V4L2 Subdev */
@@ -415,6 +395,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	struct sun6i_csi_bridge_source *source;
 	struct v4l2_subdev *source_subdev;
 	struct media_pad *remote_pad;
+	struct v4l2_subdev_state *state;
+	const struct v4l2_mbus_framefmt *mbus_format;
 	int ret;
 
 	/* Source */
@@ -433,6 +415,10 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	else
 		source = &bridge->source_mipi_csi2;
 
+	/* Active State */
+
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+
 	if (!on) {
 		v4l2_subdev_call(source_subdev, video, s_stream, 0);
 		ret = 0;
@@ -443,7 +429,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	/* Clear */
 
@@ -451,7 +437,9 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 
 	/* Configure */
 
-	sun6i_csi_bridge_configure(csi_dev, source);
+	mbus_format = v4l2_subdev_state_get_format(state,
+						   SUN6I_CSI_BRIDGE_PAD_SINK);
+	sun6i_csi_bridge_configure(csi_dev, source, mbus_format);
 
 	if (capture_streaming)
 		sun6i_csi_capture_configure(csi_dev);
@@ -472,7 +460,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	if (ret && ret != -ENOIOCTLCMD)
 		goto disable;
 
-	return 0;
+	ret = 0;
+	goto unlock;
 
 disable:
 	if (capture_streaming)
@@ -482,6 +471,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 
 	pm_runtime_put(dev);
 
+unlock:
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -504,21 +495,23 @@ sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 static int sun6i_csi_bridge_init_state(struct v4l2_subdev *subdev,
 				       struct v4l2_subdev_state *state)
 {
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	unsigned int pad = SUN6I_CSI_BRIDGE_PAD_SINK;
-	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_state_get_format(state, pad);
-	struct mutex *lock = &csi_dev->bridge.lock;
+	unsigned int pad;
 
-	mutex_lock(lock);
+	/*
+	 * This subdev does not perform format conversion,
+	 * initialize both pads identically.
+	 */
+	for (pad = 0; pad < subdev->entity.num_pads; pad++) {
+		struct v4l2_mbus_framefmt *mbus_format;
 
-	mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
-	mbus_format->width = 1280;
-	mbus_format->height = 720;
+		mbus_format = v4l2_subdev_state_get_format(state, pad);
 
-	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+		mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
+		mbus_format->width = 1280;
+		mbus_format->height = 720;
 
-	mutex_unlock(lock);
+		sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+	}
 
 	return 0;
 }
@@ -536,53 +529,32 @@ sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
-				    struct v4l2_subdev_state *state,
-				    struct v4l2_subdev_format *format)
-{
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi_dev->bridge.lock;
-
-	mutex_lock(lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_state_get_format(state,
-							     format->pad);
-	else
-		*mbus_format = csi_dev->bridge.mbus_format;
-
-	mutex_unlock(lock);
-
-	return 0;
-}
-
 static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *format)
 {
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi_dev->bridge.lock;
+	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(lock);
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad != SUN6I_CSI_BRIDGE_PAD_SINK)
+		return v4l2_subdev_get_fmt(subdev, state, format);
 
-	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+	sun6i_csi_bridge_mbus_format_prepare(&format->format);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_state_get_format(state, format->pad) =
-			*mbus_format;
-	else
-		csi_dev->bridge.mbus_format = *mbus_format;
+	/* Set the format on the sink pad. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad);
+	*fmt = format->format;
 
-	mutex_unlock(lock);
+	/* Propagate the format to the source pad. */
+	fmt = v4l2_subdev_state_get_format(state, SUN6I_CSI_BRIDGE_PAD_SOURCE);
+	*fmt = format->format;
 
 	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops = {
 	.enum_mbus_code	= sun6i_csi_bridge_enum_mbus_code,
-	.get_fmt	= sun6i_csi_bridge_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= sun6i_csi_bridge_set_fmt,
 };
 
@@ -780,8 +752,6 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	};
 	int ret;
 
-	mutex_init(&bridge->lock);
-
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
@@ -809,6 +779,12 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	if (ret < 0)
 		return ret;
 
+	/* V4L2 Subdev finalize */
+
+	ret = v4l2_subdev_init_finalize(subdev);
+	if (ret < 0)
+		goto error_media_entity;
+
 	/* V4L2 Subdev */
 
 	if (csi_dev->isp_available)
@@ -818,7 +794,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 
 	if (ret) {
 		dev_err(dev, "failed to register v4l2 subdev: %d\n", ret);
-		goto error_media_entity;
+		goto error_subdev_finalize;
 	}
 
 	/* V4L2 Async */
@@ -852,6 +828,9 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	else
 		v4l2_device_unregister_subdev(subdev);
 
+error_subdev_finalize:
+	v4l2_subdev_cleanup(subdev);
+
 error_media_entity:
 	media_entity_cleanup(&subdev->entity);
 
@@ -868,5 +847,7 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_device *csi_dev)
 
 	v4l2_device_unregister_subdev(subdev);
 
+	v4l2_subdev_cleanup(subdev);
+
 	media_entity_cleanup(&subdev->entity);
 }
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
index 44653b38f722..a5b0a6f064dd 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
@@ -42,20 +42,11 @@ struct sun6i_csi_bridge {
 	struct v4l2_subdev		subdev;
 	struct v4l2_async_notifier	notifier;
 	struct media_pad		pads[2];
-	struct v4l2_mbus_framefmt	mbus_format;
-	struct mutex			lock; /* Mbus format lock. */
 
 	struct sun6i_csi_bridge_source	source_parallel;
 	struct sun6i_csi_bridge_source	source_mipi_csi2;
 };
 
-/* Helpers */
-
-void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
-				 unsigned int *width, unsigned int *height);
-void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
-			     u32 *mbus_code, u32 *field);
-
 /* Format */
 
 const struct sun6i_csi_bridge_format *
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 65879f4802c0..d90abba21309 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -888,14 +888,19 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 		media_entity_to_video_device(link->sink->entity);
 	struct sun6i_csi_device *csi_dev = video_get_drvdata(video_dev);
 	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
+	struct v4l2_subdev *src_subdev =
+		media_entity_to_v4l2_subdev(link->source->entity);
 	const struct sun6i_csi_capture_format *capture_format;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	unsigned int capture_width, capture_height;
-	unsigned int bridge_width, bridge_height;
 	const struct v4l2_format_info *format_info;
+	struct v4l2_subdev_format src_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = link->source->index
+	};
 	u32 pixelformat, capture_field;
-	u32 mbus_code, bridge_field;
 	bool match;
+	int ret;
 
 	sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_height);
 
@@ -904,19 +909,22 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	if (WARN_ON(!capture_format))
 		return -EINVAL;
 
-	sun6i_csi_bridge_dimensions(csi_dev, &bridge_width, &bridge_height);
+	/* Resolve csi bridge format. */
+	ret = v4l2_subdev_call(src_subdev, pad, get_fmt, NULL, &src_fmt);
+	if (ret)
+		return ret;
 
-	sun6i_csi_bridge_format(csi_dev, &mbus_code, &bridge_field);
-	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	bridge_format = sun6i_csi_bridge_format_find(src_fmt.format.code);
 	if (WARN_ON(!bridge_format))
 		return -EINVAL;
 
 	/* No cropping/scaling is supported. */
-	if (capture_width != bridge_width || capture_height != bridge_height) {
+	if (capture_width != src_fmt.format.width ||
+	    capture_height != src_fmt.format.height) {
 		v4l2_err(v4l2_dev,
 			 "invalid input/output dimensions: %ux%u/%ux%u\n",
-			 bridge_width, bridge_height, capture_width,
-			 capture_height);
+			 src_fmt.format.width, src_fmt.format.height,
+			 capture_width, capture_height);
 		return -EINVAL;
 	}
 
@@ -947,7 +955,8 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	/* With raw input mode, we need a 1:1 match between input and output. */
 	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
 	    capture_format->input_format_raw) {
-		match = sun6i_csi_capture_format_match(pixelformat, mbus_code);
+		match = sun6i_csi_capture_format_match(pixelformat,
+						       src_fmt.format.code);
 		if (!match)
 			goto invalid;
 	}
-- 
2.34.1


