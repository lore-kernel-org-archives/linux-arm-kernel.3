Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBACFEFB52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Y1wBlwiUH2fvTmqiMDb+GkeEXWeNmz3D1IXmxMK6Vs=; b=rxgNiFUaisYRJq+hFZukA59D0K
	gNpNY5SODKxjTg/KZ1liHPay5dL+V+eatRI+Xg2keeIw1IY5oAE7AmArkF28HbUhy2gGCdrzEFaUI
	u/hKO3mbNLRws7FMyWq8YxgOvwGhJCw0oNzY9xyLcTr2juZWpd+ek8vxQR2rnzISqBFNJGenDUx9k
	x43AHz1syA8k8c9xJyzP8NAC5X8MAfTieH+fGLn/g8lnVOfZLSCXT5dQWcKMy/T66JRwjlLEZi/xL
	/ehei3AWicYWRucgeQGBmgsN2hbdWyLZYr9bCqrcrEPyr4NgzqlUVl3R0BkgwwXJ0ROla2C+N0mgE
	wI5nZK1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyNv-00000008QSZ-3iKF;
	Fri, 27 Feb 2026 14:00:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyNu-00000008QR7-0gN5;
	Fri, 27 Feb 2026 14:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FE256012A;
	Fri, 27 Feb 2026 13:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692F4C19423;
	Fri, 27 Feb 2026 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200798;
	bh=pALwRFzWIQKTpcLw9NIyZWrgGnwzLJRpPmwmiwUCRco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r0rtRgwK7hc0thW6r5KKfgA/Ffz+6iVy/mi3osKF8lbOnewD7kN4ziqAek6hf5SXM
	 iyBtrxh34JkLNd2FeA6bkfxIe08Q/GJ1D57H4hpFUnzp8jsdiwbYKHiNG5N3vUOHjH
	 FfzQU6xmPS4zhaMkOD3yojiO062DD97cm5/8SUqTSoRr7tKYz4RZ3Fy+vPjPjYUcVW
	 8cuLp2+eq2iq4en5lZcPDJfw5//65u6a9s0Sa8lBEPovHteebZGLk5+KvDFam+SDoE
	 +T6wLILmncNhdNoQnIa5iNKSF6aUogH8MD0Ks/pjsyxLoJd8t86ZurZqQO39CzNlNA
	 rXN+or21bQDtg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 27 Feb 2026 14:59:45 +0100
Subject: [PATCH v2 01/14] drm/connector: Introduce drm_output_color_format
 enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drm-rework-color-formats-v2-1-8bd278e2af9d@kernel.org>
References: <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
In-Reply-To: <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4252; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pALwRFzWIQKTpcLw9NIyZWrgGnwzLJRpPmwmiwUCRco=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLFwfHlSzacXxhFLvW79vKTx9UHJxd2ZyQEym4Q/Dsy
 ieylq+jOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEnF8yNpw51+9Y46fV6NS7
 N2dlcj+r03n/mll7Vrzl7D93z7Lih7hAlq/V42g3p8n33sqvqv3rxtjwtLgg+oCXkfPs13KXFwh
 Pd65zvzO/8Rz/60kndH04/nYd/RvRVrs8V9W3XdVvxe+7D00A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The EDID parsing code initially introduced the DRM_COLOR_FORMAT_*
defines to represent the sink capabilities. Since a given sink could
support multiple formats, it was first defined as a bitmask.

However, the core and drivers have since leveraged those defines to
represent both the supported formats but also the current format being
used.

Considering the latter case, the more natural, and consistent, thing to
do would be to create an enum of all the possible formats, and then list
the supported formats using a bitmask of the individual enum values.

Let's create a new enum following that pattern, drm_output_color_format,
while maintaining the DRM_COLOR_FORMAT_* compatibility to make the
transition easier.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_connector.h | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c18be8c19de0ab1e02e7d7b1fcd9f2ab5ef1dd15..227f6190438679104f5336be088a73f4529c15fa 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -554,10 +554,35 @@ enum drm_colorspace {
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	= 14,
 	DRM_MODE_COLORIMETRY_BT601_YCC		= 15,
 	DRM_MODE_COLORIMETRY_COUNT
 };
 
+/**
+ * enum drm_output_color_format - Output Color Format
+ *
+ * This enum is a consolidated color format list supported by
+ * connectors. It's only ever really been used for HDMI and DP so far,
+ * so it's not exhaustive and can be extended to represent other formats
+ * in the future.
+ *
+ *
+ * @DRM_OUTPUT_COLOR_FORMAT_RGB444:
+ *   RGB output format
+ * @DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
+ *   YCbCr 4:4:4 output format (ie. not subsampled)
+ * @DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
+ *   YCbCr 4:2:2 output format (ie. with horizontal subsampling)
+ * @DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
+ *   YCbCr 4:2:0 output format (ie. with horizontal and vertical subsampling)
+ */
+enum drm_output_color_format {
+	DRM_OUTPUT_COLOR_FORMAT_RGB444 = 0,
+	DRM_OUTPUT_COLOR_FORMAT_YCBCR444,
+	DRM_OUTPUT_COLOR_FORMAT_YCBCR422,
+	DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
+};
+
 /**
  * enum drm_bus_flags - bus_flags info for &drm_display_info
  *
  * This enum defines signal polarities and clock edge information for signals on
  * a bus as bitmask flags.
@@ -697,14 +722,14 @@ struct drm_display_info {
 	/**
 	 * @subpixel_order: Subpixel order of LCD panels.
 	 */
 	enum subpixel_order subpixel_order;
 
-#define DRM_COLOR_FORMAT_RGB444		(1<<0)
-#define DRM_COLOR_FORMAT_YCBCR444	(1<<1)
-#define DRM_COLOR_FORMAT_YCBCR422	(1<<2)
-#define DRM_COLOR_FORMAT_YCBCR420	(1<<3)
+#define DRM_COLOR_FORMAT_RGB444		(1 << DRM_OUTPUT_COLOR_FORMAT_RGB444)
+#define DRM_COLOR_FORMAT_YCBCR444	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR444)
+#define DRM_COLOR_FORMAT_YCBCR422	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR422)
+#define DRM_COLOR_FORMAT_YCBCR420	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
 
 	/**
 	 * @panel_orientation: Read only connector property for built-in panels,
 	 * indicating the orientation of the panel vs the device's casing.
 	 * drm_connector_init() sets this to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
@@ -712,14 +737,15 @@ struct drm_display_info {
 	 * fb to compensate and gets exported as prop to userspace.
 	 */
 	int panel_orientation;
 
 	/**
-	 * @color_formats: HDMI Color formats, selects between RGB and YCrCb
-	 * modes. Used DRM_COLOR_FORMAT\_ defines, which are _not_ the same ones
-	 * as used to describe the pixel format in framebuffers, and also don't
-	 * match the formats in @bus_formats which are shared with v4l.
+	 * @color_formats: HDMI Color formats, selects between RGB and
+	 * YCbCr modes. Uses a bitmask of DRM_OUTPUT_COLOR_FORMAT\_
+	 * defines, which are _not_ the same ones as used to describe
+	 * the pixel format in framebuffers, and also don't match the
+	 * formats in @bus_formats which are shared with v4l.
 	 */
 	u32 color_formats;
 
 	/**
 	 * @bus_formats: Pixel data format on the wire, somewhat redundant with

-- 
2.53.0


