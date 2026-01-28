Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161E1D3F09E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDkhqQ4ayYOASJUt3J2LiQ6VzH3FR30ZAoKcupHSA/A=; b=CZdX+SwErXynr/hc1ezQeFiCMO
	80fmXo1AmSyBkfgZRpC9kwQUjl04D8Fn5OygVErw2oRIxBbcW3IOkaGzRhumvCJJ0g2ierWO2Jbxu
	Wp45wb1hQTHYGo4Y5PtWSeXbwxAJTPnBuLXR+wUOLZnV8MlSRUV+8vXn/lW/zj/hHPFqWpPTaSeMG
	K5ryopPvS/B8mfp2kGBIMvkCVYIwqw6EgDNwawjmeHaIRnBjHFVuJdYdWKK0t/77CCK0Y35Q20THT
	6DSpwrSPJgdytXaLj83cHdidB+R3E7D9SkGnbMBlgYqXNIOJ7YiGYfPVKQKJTpMfOtKB/kW2dti9n
	oMSGoplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9J3-0000000GTR4-3pqW;
	Wed, 28 Jan 2026 17:26:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Iw-0000000GTJN-0buv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:11 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 233972821;
	Wed, 28 Jan 2026 18:25:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621131;
	bh=AYlKWiDpPbO73UzlfaqmMIQSIX1hoio3H6459eEfPvw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S1gXkUyIVy4n3nrZEQkEbWmz+CJSUbuPCU46WncjNZsZNN2dTC8sX7i/ygzb1s62n
	 6/afdC+eUk8oMxvoGwOUDZRLklNsD8WuJJdcBS/tZ1Mj2KqzezQb4z+YbiQyYqeT7t
	 xXFBKbdTpHvNes2xH1sD60m8d7ZWXBy0fNKWo3YY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:34 +0200
Subject: [PATCH v8 09/11] drm: xlnx: zynqmp: Add support for Y8 and Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-9-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
In-Reply-To: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=AYlKWiDpPbO73UzlfaqmMIQSIX1hoio3H6459eEfPvw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekaljaQNA/MLeOCdWogjGdrvn7IfdWtYDIuuu
 ZDgACJXhFyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGpQAKCRD6PaqMvJYe
 9UM+D/9bOXUaigE21y4xhb69TmgQ3Nd2zk/Y2EFmtky/Geh0GhEYw+pVIjCl9vhpH8UHpmTITQt
 HXopMyOIlJhv8qrFu81cC9Y3WAjDsD453vUCYef3G1GUuYKPaZaOdtMWnUj9/gyvaABhKp47jk3
 JOUwvOWaWyJ8QeyB8uCfH+dRrd+yyPQzA9DikjT1uIHICi4GOo81jDqtT2MAlc6I9pmaOqO//Rl
 CxkKyEOxzzIaPmQ2cx7KEa7Sukrk//JhAdqfVwlDSBYTgBZfAlRC19Ojh1rjMLcFaokjDSRpk/x
 C4IUJ7OxXkiKIfL5jrOVGQu6I4foLps+cHUH/uXIXjpu8F1THoP7tzuz6xBeAt5jXSynW33ZGCr
 fm7fR0v1E6c8DvnzEVj3kjSoAezQ2KK3eYp5HhfXHQJ4v0uru/ILbTQ3JWc2Bw1AkCfvFVjgNsr
 XkwhAKgHR7w8Dtv5/n63o8HyOCtkmAh9NMxzyjrfIl1PLXilSpVMMVNt4AbZRuwq7s60/HS5Qmh
 6NvQpOIez4Vuss5QDJvH2tp8sqxIrdt8lxUlsjKn6bsTNeiRBIrjThzqNGegIPzBXmdgdJ3VDSH
 MKn9oFwlg3jZehwzJWEXarA4GhXn5HLq4zo6+SyprFEMfHXg2O9nFDDYUsSvdu3cow5GKWCOhz8
 irYXP7beBuaMVPQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092610_326470_FA2436BB 
X-CRM114-Status: GOOD (  13.33  )
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

Add support for Y8 and Y10_P32 formats. We also need to add new csc
matrices for the y-only formats.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 1dc77f2e4262..57bb6d1dd10a 100644
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
+	    layer->drm_fmt->format == DRM_FORMAT_Y10_P32) {
+		coeffs = csc_sdtv_to_rgb_yonly_matrix;
+		offsets = csc_sdtv_to_rgb_yonly_offsets;
+	} else if (layer->drm_fmt->is_yuv) {
 		coeffs = csc_sdtv_to_rgb_matrix;
 		offsets = csc_sdtv_to_rgb_offsets;
 	} else {

-- 
2.43.0


