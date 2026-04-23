Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AC2F589DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtRdFmY9jepOWKHqxdzINt3/iMoFCjFuIyxCbw0FX0g=; b=JZzMXCr78JfbxeVX60+LCN8Nfi
	VDm97BgxJ0zZX3MY5/7zANfEZ7/F2eLWQPuiHwZJ0uPvasYIA4lGeIpsG8Un8VWAK3UGSnO67n6Po
	SWS+EIS7eYfCrTIivBl27qMiqAWUuOeg3TpjWq7EIHIYaX4gmfhzR1TRd9s8j1o0PIYc0vZxg3fZg
	VA+Krdow3aqseAZD7fUL+q15P3GBen6bTt/+QecvOGYQm6+N3AehHGurd7rzIUQTY4Dj8sylXF8w+
	v+v6Agt8aMYg0+JycWsyzr43bhIkdffc9CkbQMBsKJW+AHwgGNErkLJhOlxRTS5YpQyax5umK9BdC
	q1liZ5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuwm-0000000BoWl-1ax8;
	Thu, 23 Apr 2026 14:22:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuwM-0000000BoFz-08Kc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 14:22:06 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 330DA1B9A;
	Thu, 23 Apr 2026 16:20:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776954016;
	bh=/bsXC7i63bCOBHETOe0gMQ4G64j9LJ0wcDbbGOO2nT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V5RcwvF6NpK1mMFTLwli5cQ9laRugC3BIb5jzsStkHn7S+Q5sG5dXYtl66L13qif/
	 HTCaHTFFGn15P+ztrgckOhW4177yLtPeL4DzOEufDjuBp2JVTHwd3Tr4BAbm2WeyCQ
	 DVl2o5j4I9uDXoPnfRm5OSNkygnOaINPrPJyxgOk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 23 Apr 2026 17:21:20 +0300
Subject: [PATCH v10 09/11] drm: xlnx: zynqmp: Add support for Y8 and
 XYYY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-xilinx-formats-v10-9-c690c2b8ea89@ideasonboard.com>
References: <20260423-xilinx-formats-v10-0-c690c2b8ea89@ideasonboard.com>
In-Reply-To: <20260423-xilinx-formats-v10-0-c690c2b8ea89@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/bsXC7i63bCOBHETOe0gMQ4G64j9LJ0wcDbbGOO2nT8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp6ir38yudh4eJpmvDiVV6A1f8S9A67B2TxqxQO
 iBLK6pnydaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeoq9wAKCRD6PaqMvJYe
 9WPDD/94UAoIOrxeTFtzr2INZyk2ZTv5kc2+Fm5ZRAm9XR97kVioBGtJP8UdgEWmOzq/Pwjq7aa
 QAdwxwp3FKkgeg5sdslWTZSIKNtUqtgHhe7usyzCRu5Iaz5BmkMlNUHe2uhjD3399aD/M2PIpfN
 YddL0T8eGnVHq5AhyzHiA9PODKFhgkWkeq4K4DiQ5/JQ+KVu75XXBoB4iz6tU3ZOwcK5+BjjzTf
 IgTv30LyqN+1mbtMAv7BtRZx8ThNtnGT6Aqe4nEw1XMMjPEr71I4hurVZ5UBFCVTN40pyGXKHp+
 6gMUDllcWQzlpUcY2dFieCg94cFNWheKGdLdb2hOVK0LRj+IOYV+t5Q2Uf0DYogKntW+E2LNp+F
 BO/Nic03Al1tn0Gd86HRKdZ8FfSkwnCD1lzBoyiTRfvuYZ/rzxc3k9oyNZ5Bgqm4jMxg4HzzUb7
 nbHjctxy2McL0rPRmwtsx8613kA2U1h1aS0NGLXUKSSI4F1UgYfeP7f2MxiJE54dKACqnovAPSl
 6/yS3XJIggKdvL3JZpxcHAji0XXBgwIGa4UxHO6ERzTsaiMeMt69xYnHxZqP6V5ABj9K2tvOBVp
 lcIsK08JF2Rj0Lps7I0uxSF53zW3x1y3Xl7S9APkVGJ7UBd8N+xuyrmXwRN0OIQKdR8uZATC3lF
 BQFJL/aHDAMmikA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_072202_220598_48B08B96 
X-CRM114-Status: GOOD (  11.33  )
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

Add support for Y8 and XYYY2101010 formats. We also need to add new csc
matrices for these y-only formats.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 46ea70fd37ec..175ae1589018 100644
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
+		.drm_fmt	= DRM_FORMAT_XYYY2101010,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 
@@ -697,6 +707,17 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
 	0x0, 0x1800, 0x1800
 };
 
+/* In Y-only mode the single Y channel is on the third column  */
+static const u16 csc_sdtv_to_rgb_yonly_matrix[] = {
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+};
+
+static const u32 csc_sdtv_to_rgb_yonly_offsets[] = {
+	0x0, 0x0, 0x0
+};
+
 /**
  * zynqmp_disp_blend_set_output_format - Set the output format of the blender
  * @disp: Display controller
@@ -846,7 +867,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
 				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
 				val);
 
-	if (layer->drm_fmt->is_yuv) {
+	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
+	    layer->drm_fmt->format == DRM_FORMAT_XYYY2101010) {
+		coeffs = csc_sdtv_to_rgb_yonly_matrix;
+		offsets = csc_sdtv_to_rgb_yonly_offsets;
+	} else if (layer->drm_fmt->is_yuv) {
 		coeffs = csc_sdtv_to_rgb_matrix;
 		offsets = csc_sdtv_to_rgb_offsets;
 	} else {

-- 
2.43.0


