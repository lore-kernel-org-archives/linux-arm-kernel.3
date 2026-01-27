Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38786D2F036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTGEBCnjEvyTWCuS5HLFCS9UiIG3IOyNGmhb0kC2Oio=; b=B8UipYib8csuDeIHzwgdhY2v4v
	Kkpw/9+y28RjIAWbC5JPNEsmd46PJ9KSkoOhkxun7s5H8WKQTYfvcIZTlH2FUrhWL0I1pn1/K8HWF
	J9UfUBOW8Mv0Gu4exQjNU3ZSte48p4PjKwsRS4jCMXOnJj5TDqzXxy0NSvOfFhc1pRA1XZIONenJG
	SPjaENAl2Xocq5oWQLFS94manMfTe+Vi/6V0euwvYLiAh83VN+CR9d4HmVbr5vo1yuZ2KkNqCIfmL
	bYwslL+uHPb7eAcMDLv08T8066OVrrfF1arhbFANsPTW7Gle6W5qf+xC8lL5tvkRdnCSpUKCdIL0i
	S5D9RGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkF0-0000000EQ2u-3Oyb;
	Tue, 27 Jan 2026 14:40:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkEv-0000000EPuX-20nm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:40:22 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vkkEe-0007YT-6Z; Tue, 27 Jan 2026 15:40:04 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 27 Jan 2026 15:39:14 +0100
Subject: [PATCH v3 05/27] media: v4l2-common: add
 v4l2_fill_pixfmt_mp_aligned helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-spu-rga3-v3-5-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
In-Reply-To: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_064021_518104_E415BDF7 
X-CRM114-Status: GOOD (  17.08  )
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

Add a v4l2_fill_pixfmt_mp_aligned helper which allows the user to
specify a custom stride alignment in bytes. This is necessary for
hardware like the Rockchip RGA3, which requires the stride value to be
aligned to a 16 bytes boundary.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/v4l2-core/v4l2-common.c | 45 +++++++++++++++++++++++++----------
 include/media/v4l2-common.h           |  4 ++++
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 2b5ccedeb6841..e61506ead9150 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -431,14 +431,15 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
 }
 
 static inline unsigned int v4l2_format_plane_stride(const struct v4l2_format_info *info, int plane,
-						    unsigned int width)
+						    unsigned int width, u8 byte_alignment)
 {
 	unsigned int hdiv = plane ? info->hdiv : 1;
 	unsigned int aligned_width =
 		ALIGN(width, v4l2_format_block_width(info, plane));
 
-	return DIV_ROUND_UP(aligned_width, hdiv) *
-	       info->bpp[plane] / info->bpp_div[plane];
+	return ALIGN(DIV_ROUND_UP(aligned_width, hdiv) * info->bpp[plane] /
+			     info->bpp_div[plane],
+		     byte_alignment);
 }
 
 static inline unsigned int v4l2_format_plane_height(const struct v4l2_format_info *info, int plane,
@@ -452,9 +453,10 @@ static inline unsigned int v4l2_format_plane_height(const struct v4l2_format_inf
 }
 
 static inline unsigned int v4l2_format_plane_size(const struct v4l2_format_info *info, int plane,
-						  unsigned int width, unsigned int height)
+						  unsigned int width, unsigned int height,
+						  u8 stride_alignment)
 {
-	return v4l2_format_plane_stride(info, plane, width) *
+	return v4l2_format_plane_stride(info, plane, width, stride_alignment) *
 	       v4l2_format_plane_height(info, plane, height);
 }
 
@@ -475,8 +477,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 }
 EXPORT_SYMBOL_GPL(v4l2_apply_frmsize_constraints);
 
-int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
-			u32 pixelformat, u32 width, u32 height)
+int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
+				u32 pixelformat, u32 width, u32 height,
+				u8 stride_alignment)
 {
 	const struct v4l2_format_info *info;
 	struct v4l2_plane_pix_format *plane;
@@ -493,23 +496,41 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 
 	if (info->mem_planes == 1) {
 		plane = &pixfmt->plane_fmt[0];
-		plane->bytesperline = v4l2_format_plane_stride(info, 0, width);
+		/*
+		 * In case of multiple planes the stride of the other planes
+		 * is derived from the y stride. To avoid breaking the stride
+		 * alignment for the non y plane, multiply it by 2.
+		 */
+		if (info->comp_planes > 1)
+			stride_alignment *= 2;
+		plane->bytesperline = v4l2_format_plane_stride(info, 0, width,
+							       stride_alignment);
 		plane->sizeimage = 0;
 
 		for (i = 0; i < info->comp_planes; i++)
 			plane->sizeimage +=
-				v4l2_format_plane_size(info, i, width, height);
+				v4l2_format_plane_size(info, i, width, height,
+						       stride_alignment);
 	} else {
 		for (i = 0; i < info->comp_planes; i++) {
 			plane = &pixfmt->plane_fmt[i];
 			plane->bytesperline =
-				v4l2_format_plane_stride(info, i, width);
+				v4l2_format_plane_stride(info, i, width,
+							 stride_alignment);
 			plane->sizeimage = plane->bytesperline *
 				v4l2_format_plane_height(info, i, height);
 		}
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
+
+int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
+			u32 pixelformat, u32 width, u32 height)
+{
+	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
+					   width, height, 1);
+}
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
 
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
@@ -529,12 +550,12 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 	pixfmt->width = width;
 	pixfmt->height = height;
 	pixfmt->pixelformat = pixelformat;
-	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width);
+	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width, 1);
 	pixfmt->sizeimage = 0;
 
 	for (i = 0; i < info->comp_planes; i++)
 		pixfmt->sizeimage +=
-			v4l2_format_plane_size(info, i, width, height);
+			v4l2_format_plane_size(info, i, width, height, 1);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 401d8506c24b5..edd416178c333 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -558,6 +558,10 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height);
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 			u32 width, u32 height);
+/* @stride_alignment is a power of 2 value in bytes */
+int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
+				u32 pixelformat, u32 width, u32 height,
+				u8 stride_alignment);
 
 /**
  * v4l2_get_link_freq - Get link rate from transmitter

-- 
2.52.0


