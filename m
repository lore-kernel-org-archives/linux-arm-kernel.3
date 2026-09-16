Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA6FC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1SRVsY/0+Guap2KTqKbc4VoQu0cYIfwBRc4uN/UP4E=; b=dhv64jfXBkzfVD+fdWKu0oChux
	5M60TkvPcADi1nCxhYSQfJv82hetk69/UfwRr68TjIIr0xb4vQEFUGWM8T9Rfl6BcU3fxstuHopOj
	CAkiFnr+rp9KohVDclMzNFfkaEj+JGdCtbFN08tEhkqKPhKFlJTknqIEwPpTGBBcd4Kg4RgVsJEtj
	rcW4UVIi06Tft/sOU83/+o59+Zv5tBzqX+uiUlBxcK0PmUF1xZPLT6p2y2a7SmyuBeFnnPvcLY/II
	1y6XT55PnFSlZg5FXlx53JN3uzbD7jxoj4GmDgKZaIYWzXo+UhIvgivcazix4GLXKlbjJYyAaMOvz
	K8xLbvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rGs-00000009VwL-3GVh;
	Wed, 16 Sep 2026 15:10:06 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rGg-00000009VoP-13xp;
	Wed, 16 Sep 2026 15:09:53 +0000
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7EF132059F0;
	Wed, 16 Sep 2026 17:09:48 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGe-001Fsx-1G;
	Wed, 16 Sep 2026 17:09:48 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:44 +0200
Subject: [PATCH v2 03/17] media: rockchip: rga: move early return into if
 condition in vidioc_enum_fmt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-3-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_080950_443553_443DBC79 
X-CRM114-Status: GOOD (  13.36  )
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

Instead of a doing an early return when we don't have a capture device,
merge the condition with the following if condition. This improves
readability, as the condition now explicitly contains a check for a
capture device instead of returning when we don't have a capture device.

Also use the V4L2_TYPE_IS_CAPTURE helper and improve the comment.

The early return if was copied from the vivid drivers
vivid_enum_fmt_vid function.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index efe5541078214..8c03422d669cf 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -372,12 +372,14 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 	if (ret != 0)
 		return ret;
 
-	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
-	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
-		return 0;
-
-	/* allow changing the quantization and xfer func for YUV formats */
-	if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
+	/*
+	 * Allow changing the quantization and ycbcr_enc func for YUV formats
+	 * on the capture side for RGB -> YUV conversions.
+	 *
+	 * These flags are only relevant for capture devices.
+	 */
+	if (V4L2_TYPE_IS_CAPTURE(f->type) &&
+	    v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
 		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION |
 			    V4L2_FMT_FLAG_CSC_YCBCR_ENC;
 

-- 
2.55.0


