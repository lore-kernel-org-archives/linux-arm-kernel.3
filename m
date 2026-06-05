Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF616CD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4c88WQRQMMOgL63DvuWuEq69h2P5ObpjanZcKRk3p4=; b=ZNMMdODptmxjapW4V31ikE/CrK
	EtxEB2PxAY84+Rtho2I+j8YjPWihm/wLWrc5xWKW+w5XNj6RMf/KVATL7ucZYnITpU3IYVqlDDZCu
	TKq3NDejCWgy4vxhbOoakRmFAEIR9reRcdKe8bILZB2IbHjhOzN7kX7wBkFwocQcRLzuesHrGKK2f
	40bQ23zK8iDMNT9Q47WVpO/vFfR8QfFQ2yxZGqS3L26xFLthaz3qpR4wUeJUlRN7QCp5fEfLeQJod
	l3qmprmIbV8qaiBcH5Ii6BrMiod3knBp+zh3xxpr7Df1NA5hBkqKJiJ0UTopDJIJm6kcn3OXwljTL
	7dgF7u5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciE-00000001EAg-19XR;
	Fri, 05 Jun 2026 22:08:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciB-00000001E82-37DE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:20 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci2-0000LW-0f; Sat, 06 Jun 2026 00:08:10 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:49 +0200
Subject: [PATCH 03/17] media: rockchip: rga: move early return into if
 condition in vidioc_enum_fmt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-3-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_150819_789998_7F14FFF8 
X-CRM114-Status: GOOD (  13.23  )
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
2.54.0


