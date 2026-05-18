Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7929FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giKDEDP8ENzZiyUV9+CNCQo4WMy+DEDYcBxzTbDw2mU=; b=fAJ81QWWBADtVNw4Hixkk/hTjl
	miPZPq4rV4K+/X3LkY1aUWkun6z866D4iy65VOvpsFsRIhQaEGp5Mh6goJGVO4O5zykYcPsL/ngRQ
	G+cX9Ck+cY3HuOYH+HBik2C9GEw18CJEoJ3M2Bjx+IbrWAgcEt0MKvHaFkAmvBRXcPIZsenlmnA8p
	wplRxiniEkWbSkK4yNMyMNE1O6AnL3DaP+UABbnGkVWvt9hBolNtFUb2MwPsKtenb7P2JhWwZH55q
	GchR4iTGqCxt93braSEbMYTwmadhrb4S7hBlj/Y//xqDJgZmxwxoDS+Rb1kR45QrWUVJJFcfEK/gB
	kNHEUKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvEM-0000000FENc-1o3G;
	Mon, 18 May 2026 10:29:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvEK-0000000FEMc-2bHB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 10:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=giKDEDP8ENzZiyUV9+CNCQo4WMy+DEDYcBxzTbDw2mU=; b=UDOvy0C4wKTYJ8Rn9opBxmOlWD
	pDigLBYxiv1M6FgabSaFmk7rdxvY41PFP+UQGA7dsY47DuIgXaYGj6pab5VthEYALomJo8/5jGs9a
	JEja14kmU002rKNTdKT4wn+4rkXzFA4aH6sKgC5xT/Bf0bQlgcv9YnOBxI2L3jYwH/IXeM1Zyr5+O
	INSbtJN6Ry9j7/480FCxJ+yVIF/TbrzHeTr27uwIatqY4k8C2sIvFOnlgFYD8xabqqa6ZOK+NhRD+
	Xhdrq5vRzAIp/VmbNuyGjM9wZs6kNKDGv0zxlsy+lMK/oVHwJqoXftBzS23+Ntu6SSKVYjzFTDSiW
	p7dfwd1Q==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvEH-0000000AlYv-1Wlm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:29:47 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9A6561F8004A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:29:44 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 1F849B4081A; Mon, 18 May 2026 10:29:43 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 0C8EBB407F6;
	Mon, 18 May 2026 10:24:56 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 09/16] media: sun6i-csi: Split format validation to a dedicated helper
Date: Mon, 18 May 2026 12:24:44 +0200
Message-ID: <20260518102451.417971-10-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_112946_092302_FC8BD799 
X-CRM114-Status: GOOD (  18.49  )
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

Introduce a new sun6i_csi_capture_format_check helper based on the
link_validate code, which will be reused to implement MC-style
pixelformat enumeration.

Formats not listed in v4l2_format_info are now checked via
sun6i_csi_capture_format_check (which only concerns raw formats)
instead of blindly allowing them.

Also fix a comment in the raw format table.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 87 +++++++++++--------
 1 file changed, 49 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index f788b4234673..a836fa7f081a 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -213,7 +213,7 @@ struct sun6i_csi_capture_format *sun6i_csi_capture_format_find(u32 pixelformat)
 /* RAW formats need an exact match between pixel and mbus formats. */
 static const
 struct sun6i_csi_capture_format_match sun6i_csi_capture_format_matches[] = {
-	/* YUV420 */
+	/* YUV422 */
 	{
 		.pixelformat	= V4L2_PIX_FMT_YUYV,
 		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
@@ -327,6 +327,51 @@ static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
 	return false;
 }
 
+static bool
+sun6i_csi_capture_format_check(const struct sun6i_csi_capture_format *capture_format,
+			       const struct sun6i_csi_bridge_format *bridge_format)
+{
+	const struct v4l2_format_info *format_info;
+	u32 pixelformat = capture_format->pixelformat;
+	u32 mbus_code = bridge_format->mbus_code;
+	bool match;
+
+	format_info = v4l2_format_info(pixelformat);
+
+	/* Some raw formats like JPEG are not listed: try a direct match. */
+	if (!format_info)
+		return sun6i_csi_capture_format_match(pixelformat, mbus_code);
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
+	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
+		return false;
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_RGB &&
+	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
+		return false;
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+		if (bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV420 &&
+		    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV422)
+			return false;
+
+		/* YUV420 input can't produce YUV422 output. */
+		if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_YUV420 &&
+		    format_info->vdiv == 1)
+			return false;
+	}
+
+	/* With raw input mode, we need a 1:1 match between input and output. */
+	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
+	    capture_format->input_format_raw) {
+		match = sun6i_csi_capture_format_match(pixelformat, mbus_code);
+		if (!match)
+			return false;
+	}
+
+	return true;
+}
+
 /* Capture */
 
 static void
@@ -915,13 +960,11 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	const struct sun6i_csi_capture_format *capture_format;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	unsigned int capture_width, capture_height;
-	const struct v4l2_format_info *format_info;
 	struct v4l2_subdev_format src_fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad = link->source->index
 	};
 	u32 pixelformat, capture_field;
-	bool match;
 	int ret;
 
 	sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_height);
@@ -950,44 +993,12 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 		return -EINVAL;
 	}
 
-	format_info = v4l2_format_info(pixelformat);
-	/* Some formats are not listed. */
-	if (!format_info)
-		return 0;
-
-	if (format_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
-	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
-		goto invalid;
-
-	if (format_info->pixel_enc == V4L2_PIXEL_ENC_RGB &&
-	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
-		goto invalid;
-
-	if (format_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
-		if (bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV420 &&
-		    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV422)
-			goto invalid;
-
-		/* YUV420 input can't produce YUV422 output. */
-		if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_YUV420 &&
-		    format_info->vdiv == 1)
-			goto invalid;
-	}
-
-	/* With raw input mode, we need a 1:1 match between input and output. */
-	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
-	    capture_format->input_format_raw) {
-		match = sun6i_csi_capture_format_match(pixelformat,
-						       src_fmt.format.code);
-		if (!match)
-			goto invalid;
+	if (!sun6i_csi_capture_format_check(capture_format, bridge_format)) {
+		v4l2_err(v4l2_dev, "invalid input/output format combination\n");
+		return -EINVAL;
 	}
 
 	return 0;
-
-invalid:
-	v4l2_err(v4l2_dev, "invalid input/output format combination\n");
-	return -EINVAL;
 }
 
 static const struct media_entity_operations sun6i_csi_capture_media_ops = {
-- 
2.54.0


