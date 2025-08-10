Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E969C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 02:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSTo0resEXsycCW8VleQ1OlBsTvO+vCdjbc3y3AQ9DE=; b=dSd4MdN9qxbf54GAu4cbIsQTPh
	ZyU7bHTTSbnk/WfNSVsZWgYbTl+skkEAndSBt9f1aPJOXV/Mm2uoK0IdiTouswTL08ALJV+XkMtje
	PFxUvG9N/wkSJR9RO/aVFKIjiAPL6XzFcVIZOWG6/nEzgu/UM/os9OLyE5SCOK/Mc4gWt4c4pYQjc
	aFp+rD5cHPtD0M96y01ylY2hPGyruDMwH8N1PzpfL545oTsZ7NU2F9v3YTOLirfQ/th+FYNEWQzVz
	w4NwNhtlUO32yFmt0oBfrjNn0aHgjgZAo61xy0EZumkjUdVGcmLVok4j67fvxfs+9VjwJ1g2yiBUw
	SKFoAS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukvky-00000005Beo-3Zce;
	Sun, 10 Aug 2025 02:25:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukuwB-000000057uq-43k5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 01:33:29 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DC22F99F;
	Sun, 10 Aug 2025 03:32:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789556;
	bh=ssl4Me/gPXuBeRmfPMzWwlJur2QUqpzxwRsQZwiB9TQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z8Pp+cUvabxHafYAOUM4rb1+OCQgjSMhFI3IJfimbvEiOZ3ASwly2zKDA26vUb6Zn
	 o4ZKADA/q2vdJgb486cmhHifmhtPs58aoVofUyHRkGNbKd/XbFDsVRkB4MdMSPZquL
	 7dOCoIhU3D397z95W99LMRW5iDBGCnndnHmwELw8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 76/76] media: staging: Rename second ioctl handlers argument to 'void *priv'
Date: Sun, 10 Aug 2025 04:30:58 +0300
Message-ID: <20250810013100.29776-77-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_183328_175121_FE72E8F9 
X-CRM114-Status: GOOD (  13.42  )
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

The second argument to the ioctl handlers is not a file handle any more.
The standard practice is to name it 'void *priv' in drivers. Many
drivers still name it 'void *fh', and a few use more exotic names.
Replace those more exotic names with 'void *priv' in all media staging
drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c    | 16 ++++++++--------
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c     |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 24899f41dc1c..e7b99cee63d6 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -419,7 +419,7 @@ static void sun6i_isp_capture_format_prepare(struct v4l2_format *format)
 	pix_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int sun6i_isp_capture_querycap(struct file *file, void *private,
+static int sun6i_isp_capture_querycap(struct file *file, void *priv,
 				      struct v4l2_capability *capability)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -433,7 +433,7 @@ static int sun6i_isp_capture_querycap(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_enum_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
@@ -446,7 +446,7 @@ static int sun6i_isp_capture_enum_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_g_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -456,7 +456,7 @@ static int sun6i_isp_capture_g_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_s_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_s_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -471,7 +471,7 @@ static int sun6i_isp_capture_s_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_try_fmt(struct file *file, void *private,
+static int sun6i_isp_capture_try_fmt(struct file *file, void *priv,
 				     struct v4l2_format *format)
 {
 	sun6i_isp_capture_format_prepare(format);
@@ -479,7 +479,7 @@ static int sun6i_isp_capture_try_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_enum_input(struct file *file, void *private,
+static int sun6i_isp_capture_enum_input(struct file *file, void *priv,
 					struct v4l2_input *input)
 {
 	if (input->index != 0)
@@ -491,7 +491,7 @@ static int sun6i_isp_capture_enum_input(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_g_input(struct file *file, void *private,
+static int sun6i_isp_capture_g_input(struct file *file, void *priv,
 				     unsigned int *index)
 {
 	*index = 0;
@@ -499,7 +499,7 @@ static int sun6i_isp_capture_g_input(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_capture_s_input(struct file *file, void *private,
+static int sun6i_isp_capture_s_input(struct file *file, void *priv,
 				     unsigned int index)
 {
 	if (index != 0)
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 3d95ed0b023e..77c2d06c0436 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -383,7 +383,7 @@ static const struct vb2_ops sun6i_isp_params_queue_ops = {
 
 /* Video Device */
 
-static int sun6i_isp_params_querycap(struct file *file, void *private,
+static int sun6i_isp_params_querycap(struct file *file, void *priv,
 				     struct v4l2_capability *capability)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -397,7 +397,7 @@ static int sun6i_isp_params_querycap(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_params_enum_fmt(struct file *file, void *private,
+static int sun6i_isp_params_enum_fmt(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *fmtdesc)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -412,7 +412,7 @@ static int sun6i_isp_params_enum_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_isp_params_g_fmt(struct file *file, void *private,
+static int sun6i_isp_params_g_fmt(struct file *file, void *priv,
 				  struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
-- 
Regards,

Laurent Pinchart


