Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED97CFF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaSVM94UcTeVIIa2WBovwhvU3pFuGyS0HuXcyrOxL74=; b=YHI39v+jO5jSl75SUYy81Rn2zE
	Gmen80HqjTlVQqbTKuntvilvbd62/5zP9Jt321vtSc5ZgldKPFuIbU3WERTN2Jmoq54rdlfLhSEH0
	8R4SS0zru7O+VgGc+QtuEjcd9SN7gRNzQ1mFQ78RiAAUzf/MjzDQFpDj5nbyldAud3HFj1e9pqOS9
	39ydoWq3JY4XWP1FnnfF/WbXwWmUA2ng7pmu0slOS9TWmjJumzl7yTNGBWezLr8mUDgoJumb9zVmX
	innHE+b9oMtQyqqKWy5ealazgTRWvCgjx8lWpJrwRIVU2oNvhLlzjXOZRIYZWOd3QBLGwiv2iATm1
	QIhRM2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeL5-00000000zFA-1y6W;
	Tue, 28 Apr 2026 09:02:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeKA-00000000y8z-0yDO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 09:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FaSVM94UcTeVIIa2WBovwhvU3pFuGyS0HuXcyrOxL74=; b=IvoDcijjMkHVrR4n3bo3YqwBzV
	+bYviK6166RoVMxFP9iOKG1klSv6K2fsX7kJIFDnjAw6+mHrr01ruxMFxOyiGjbB2ehtY/cCodK9P
	hXBGJ3KPfgQjGFnebw1ccrgIoMHcxnoxEby4Iprr7MzQJq8O52gUJaMIGpFRrbVKrEmq+rMniam/x
	vgwwiP64Lu/CAt1o8Lz6s8lw2dR8g1AzFOysJTvSPaFfahsW7k3JxUKZPP4AkDm0f5Oq/w0aFscLS
	sptrfUNzNCOxRtVpOqje/GeMWDDrb31XNkg5Bei8AxkEyT7f9jRKTUTVut3UYnqrsZTto5/5S5PZA
	6rCaj4PQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeJx-00000002VW4-25dj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:01:44 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHeJ9-0004Lz-Um; Tue, 28 Apr 2026 11:00:43 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 28 Apr 2026 11:00:40 +0200
Subject: [PATCH v5 05/29] media: v4l2-common: add
 v4l2_fill_pixfmt_mp_aligned helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-spu-rga3-v5-5-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
In-Reply-To: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_100133_732263_249D2059 
X-CRM114-Status: GOOD (  17.95  )
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

The code makes some assumptions about the v4l2 format to simplify the
calculation. They currently hold for all known v4l2 formats.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/v4l2-core/v4l2-common.c | 51 ++++++++++++++++++++++++++---------
 include/media/v4l2-common.h           |  4 +++
 2 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 2b5ccedeb6841..d64d7e76c834d 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -431,14 +431,28 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
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
+	/*
+	 * Formats with a single memory plane derive the stride of the
+	 * other planes from the y stride. Due to chroma subsampling this
+	 * may cause the other plane strides to break the byte_alignment.
+	 * Increase the alignment if necessary to prevent this.
+	 *
+	 * It assumes the following format properties:
+	 * - bpp_div[0] == bpp_div[1]
+	 * - The multiplication factor doesn't differ between the non y planes
+	 */
+	if (info->mem_planes == 1 && info->comp_planes > 1 && plane == 0)
+		byte_alignment *= info->hdiv * info->bpp[0] / info->bpp[1];
+
+	return ALIGN(DIV_ROUND_UP(aligned_width, hdiv) * info->bpp[plane] /
+			     info->bpp_div[plane],
+		     byte_alignment);
 }
 
 static inline unsigned int v4l2_format_plane_height(const struct v4l2_format_info *info, int plane,
@@ -452,9 +466,10 @@ static inline unsigned int v4l2_format_plane_height(const struct v4l2_format_inf
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
 
@@ -475,8 +490,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
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
@@ -493,23 +509,34 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 
 	if (info->mem_planes == 1) {
 		plane = &pixfmt->plane_fmt[0];
-		plane->bytesperline = v4l2_format_plane_stride(info, 0, width);
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
@@ -529,12 +556,12 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
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
2.54.0


