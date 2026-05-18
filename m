Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFACCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNEUUTKoqIakUKpDGYVAeYqpQcc+tG6BOxGlJB1KVxQ=; b=olIM5sttIj+Tva9+vr7HSWeCua
	8YnHWIx0XVx6xmUWy7KTKgMJBr264MpxAIY/8UBlKT5RD7d9UZ828rrbthIdTYA/3ur8LVnibuKI7
	nrBAt/Nl/mAzDOCRo5C76Re/PxyzgEFEmPQFxOandTCAaa5mYmkorO0OrkEN/MSp4DX6NOz+s4q8X
	kiTsj5eH3ed5+hkax27uahUhFVa6a+YK4QR3Jn2bGX40If0aMTOAX/SggW92NG6KM055xByJxqr/x
	aAHXitNsstlVBwH6LjVxybManBzM82Ljpw+kgfVD0/I9SbLQAKfT56ccQjxthA4xjHIlt/qDHS0qT
	JNq6D3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvH6-0000000FFdi-33Ff;
	Mon, 18 May 2026 10:32:40 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvH4-0000000FFbP-433I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:32:40 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 0D6DB1F80041
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:32:37 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 8EDB4B407FD; Mon, 18 May 2026 10:32:36 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 0912DB407FE;
	Mon, 18 May 2026 10:25:02 +0000 (UTC)
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
Subject: [PATCH 15/16] media: sun6i-isp: Add support for MC-centric format enumeration
Date: Mon, 18 May 2026 12:24:50 +0200
Message-ID: <20260518102451.417971-16-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_033239_168824_62A63F29 
X-CRM114-Status: GOOD (  15.08  )
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

Just make sure the provided mbus code is supported and carry on with the
existing implementation since the pixelformat is independent from the
mbus code.

The params video node only supports a single format and does not care
about the mbus format, but we can still report MC-centric support.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c    | 9 ++++++++-
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c | 3 ++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 24e731bcabe9..372b9331bd6d 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -436,8 +436,14 @@ static int sun6i_isp_capture_querycap(struct file *file, void *priv,
 static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
+	u32 mbus_code = fmtdesc->mbus_code;
 	u32 index = fmtdesc->index;
 
+	if (mbus_code && !sun6i_isp_proc_format_find(mbus_code))
+		return -EINVAL;
+
+	/* Capture format is independent from proc format. */
+
 	if (index >= ARRAY_SIZE(sun6i_isp_capture_formats))
 		return -EINVAL;
 
@@ -697,7 +703,8 @@ int sun6i_isp_capture_setup(struct sun6i_isp_device *isp_dev)
 
 	strscpy(video_dev->name, SUN6I_ISP_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_isp_capture_fops;
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 0cc48e2bc8c6..2622e5a07817 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -531,7 +531,8 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
 
 	strscpy(video_dev->name, SUN6I_ISP_PARAMS_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_TX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_isp_params_fops;
-- 
2.54.0


