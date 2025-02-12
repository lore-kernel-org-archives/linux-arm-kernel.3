Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B3BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCeNBH1cY/Cr92VlXoMfdCZESon/Q29E+VOpbiTxq/Y=; b=lkpXMcibmSHy/Eauuo/Va0aREy
	PXCg9BIFtFWlVJ1qF6sOk3wT/9U9VCasaNn08Jxz/vjXRtyXKILuC4BjfoSn26JC8vc+arKZoypti
	Ut5oEJqdrTrZrkzLUglS3avTvDlDvXAJKIXhBruVwCXBQu6Y1IctGjnSc/2itjPtHmWGeB1doQu4+
	WjzHo58xh4bKJiZaQA38TVAhp/msNPSgZTXXTU847nu98lI1VaFEkxIdTD/3VISZJPs6v7B2uGJGM
	Dul04fKGIuFUrF0JRGPFgIpMfBB44e4J9PRv84jG3uGpHw8xsHJQUwBm9+nj7ZRO/5MMm4ypDSPe/
	xxYa8EVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEOS-00000007oAW-27Bm;
	Wed, 12 Feb 2025 15:11:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEAb-00000007lfT-0iER
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 14:56:58 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85FF51AB3;
	Wed, 12 Feb 2025 15:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739372136;
	bh=rZ+iMADIBNdMO0mVy7oobeXfg2lKZKrn5V9QH3VTLRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wUVJvYpbm6RHZwXxY71g3mkHaZjgji+traGy6PPKiXGJy6WS3OOHJiEV/k+HgMqaU
	 tcIlrhq5Bnluij+M470c45N5oeU2cpINx+9M5Yi7RGq/OTBarJh0QeOx0fPFMNjrRO
	 RNtEZmwbmE0M2D/1gFrAPQOML+guI24FkCMPnBIo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:13 +0200
Subject: [PATCH v3 09/11] drm: xlnx: zynqmp: Add support for Y8 and
 Y10_LE32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-9-90d0fe106995@ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
In-Reply-To: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=rZ+iMADIBNdMO0mVy7oobeXfg2lKZKrn5V9QH3VTLRw=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGestquh7IET5CXQqVbouRNgLjXdlQkfpTxWV+ns75w+6eyML
 YkCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJnrLarAAoJEPo9qoy8lh71948P/1bF
 ay+8vlWNZUKEsEZRBwwWgcYhW/6Qj81AdLt3rWChxCZmVxY2ZEfXbd515YFUfJtopKBd0jEp4Kw
 xEMLhxn1H29FJdQhO9IK8oZG7BrhQcGBKKi413L4Q2/Qzluorr6JmpeRtI7on66m5GvM9icsTJ+
 C7B27jAGblyP4SaFeDcU4ReURcozb6p5V1PVI/UaeBGT18+hJnSO5ebaoijo2cp7LjhTKc5l2Lf
 5wi9Ae2Pr1Z4Rp05ByT8MrHGT3rcG2CtNwhLW/77KNSY1EoQmpzJ5YFPCPRuQQ9Z9o/CD3sAGO6
 NFMUJBiD6PnNDEyc5adOSD7VzKxwnmufrfte956JU1SQazRTc8ams5i97b10AafOoI/yX8JxMgx
 78QmLl0sqj4SGJSybyEyI6wu78xrNyUug+oMV3f68SHTuH0Oe//C43l5vRoSi1xmWkIcpzXJD2A
 vHLsf5fF/5Y10CmW2x4W9fXgoYhJiv/GCO+x7DRo8u0nE7UxrM55vv+TvsYnVNXJ/Kb0lR4ZoOe
 jj3dl/T4DUgrYDnse8yPwjnmARvLZ/frLtnOkPN1eBdERLdgZDOJgtKnY49QjnlUQDehegb27jl
 i74s19z84qRUg/H11OT54FlngyeXLlgp8ZJ0MKawezEy+29S09w3zXCb2dTN6wJkMl0p7nFRQtJ
 szJRi
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_065657_350969_5AD8D6D1 
X-CRM114-Status: GOOD (  12.66  )
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

Add support for Y8 and Y10_LE32 formats. We also need to add new csc
matrices for the y-only formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 32031f52e114..c820df97aa28 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -307,6 +307,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y8,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MONO,
+		.swap		= false,
+		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y10_P32,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 
@@ -697,6 +707,16 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
 	0x0, 0x1800, 0x1800
 };
 
+static const u16 csc_sdtv_to_rgb_yonly_matrix[] = {
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+};
+
+static const u32 csc_sdtv_to_rgb_yonly_offsets[] = {
+	0x1800, 0x1800, 0x0
+};
+
 /**
  * zynqmp_disp_blend_set_output_format - Set the output format of the blender
  * @disp: Display controller
@@ -846,7 +866,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
 				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
 				val);
 
-	if (layer->drm_fmt->is_yuv) {
+	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
+	    layer->drm_fmt->format == DRM_FORMAT_Y10_P32) {
+		coeffs = csc_sdtv_to_rgb_yonly_matrix;
+		offsets = csc_sdtv_to_rgb_yonly_offsets;
+	} else if (layer->drm_fmt->is_yuv) {
 		coeffs = csc_sdtv_to_rgb_matrix;
 		offsets = csc_sdtv_to_rgb_offsets;
 	} else {

-- 
2.43.0


