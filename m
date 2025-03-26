Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEB4C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G18idKpVY/fIOAUgXWUK6v6L65fz3MwdTfvcsaiSAJ4=; b=YWTc0+0k53TQmn/gun5Uuo5r9H
	SlDtXChpT/wbvwW+XABkP6JdCGW8jCmJYjUW2tO55bO+ICpojCpgnhQGjEP6pfN1SvNwuFkJW0TL+
	YKFnlgY29IPShtJjrGfsqwXKrSSO6qS9vFlJsPYvvZ+auMwoulnlRX2819+V2rxIX8u3NCT+A5eZP
	Fk8mWLpl/NhlFC1fetIc6VFRBsW4qtGZwhzBFTk21bpquGJIFQeUKHxYJ/gn7eiMIMwsx3znxXz7x
	9spDzAh5kN1Ma5ftQodkICGwgYPT4U1bdlVZMT73l7eJCTeVKuTHpTAyXl4IO7+3ejCtw+Y1yaKUR
	dqUF9BwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txR0C-00000008ag9-3u0R;
	Wed, 26 Mar 2025 13:41:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQj8-00000008YC5-1KWH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:23:27 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D37401955;
	Wed, 26 Mar 2025 14:21:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742995297;
	bh=PFxBeKEc/4sg8CWi+sylqvNLnUJoQ0zkdqZzj2YAfIU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nl15Xetz7GxmJI+bohIu0UUtr6O3IoWSG91nlGHoyAw6xKr392CsaZbPl/DC4z7wJ
	 7NgDeP7hxn221WyB9d+x10eRQE/aCfgJiT9aiy435rABKYJZsJVWWWCxV3gYmU0mH5
	 +5Ep/i+vHNK1jW7nAOifngY6sTwNStljh/d6jnOo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:52 +0200
Subject: [PATCH v4 09/11] drm: xlnx: zynqmp: Add support for Y8 and Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-9-322a300c6d72@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=PFxBeKEc/4sg8CWi+sylqvNLnUJoQ0zkdqZzj2YAfIU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//DfmM4XpWvRWHABTxHtXEpM64vCUNTjpOi2
 4+zk9HJkyuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wwAKCRD6PaqMvJYe
 9dRnEACl9IJT48S7m8oF/ytsE3AEHkSOSUimNseOUncLFVgqeOllQMMWSoYf4E+Q/U3a/bTlEWb
 IeRhXE1WQkUEmE2nw2e9n4O5VZwoPCMgiVpwL342pluX2JOLO2B4KLWF1KulAqwuBp2Pllog15X
 b7932U9CY4/dtoFb/hVy9KG0Z110qcKBqVh4MKfgD8v6OuGdrnbFiOLXVBVza7Fon/fejSH9Iza
 AxsqzRhV89Z1hkX+vaf/EeyGg0WjDeOEgtBcoFWuyYciijbxx6oPSNsuVqRitGChd6Fn8DG3xuK
 UMmuud35aqN+/kvXJYXqu77BDGfne5Xa6w0v7NS/UTsP2BFmFeHqVRATFgGTsREvGOn3w/Pehv5
 HAcHBeSlceKjwvP/RKAtjXVCGWTgnVyq+H0ne0Vkvjv4h6v1Fnl2lx7supkApD+DQfbBTlJgs3V
 X2+V1Ini0YQnPYKOR3OF7h+vgsTiyn34l7MubrBc/Hb7t/YUo3DZqlT/5rCaUJs4ulLpMfAoopJ
 smJJjaXogoyrPndu2louYpkaK0uAqvmOPlBOJJ982PPDXeRTFJl9zYBvSkKc2Yd5TSlK6tOBLcs
 fLQN2i21ApvB0xXT+6Es9pJFCW8mKfLvuJjW5+G8YJeG2OjuRPm2xzl8D7K66STezmaYISrrym2
 k2DZvQCie1V841Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062326_497828_01F642B8 
X-CRM114-Status: GOOD (  12.55  )
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 1dc77f2e4262..ae8b4073edf6 100644
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


