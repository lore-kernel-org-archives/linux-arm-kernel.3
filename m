Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB2EFEFB52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGq8rqAQ+iNk8xJxMmHn/kQRItiktlpJqhtHtVqk4mY=; b=HEIDJZ7VqpPkPnThL9BZ6rXslw
	xwEkryO4WENykOLr0Zpxt2aRuMnbBVbDM89WOWegkP9L55+HB5PADeVkzOOg1DBu4bfWsirq/QW6L
	IxR9pyZjEzwm8DR1tnruh3Iifl8hFHzBviYVDFrVw4QdFPZWRPRz4OmNop2al7ZNcgvmRAkOTMaVo
	RNQhomcHIuP162jIFV+lJcpuE90gSA4lNOiLhwJnwah6GyO5H8KqDaV/0I9Yy0eyHFBDZZhdoQsqH
	SwShS4F4PmMYRgo7hQrcA29dDAp6UkyF28YaxgFamesnDIUmE5ZM6xlYwMZaZkDpHj5IrUs1xDnvp
	c2qjvwsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyO0-00000008QWj-1Llj;
	Fri, 27 Feb 2026 14:00:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyNu-00000008QRf-3HGd;
	Fri, 27 Feb 2026 14:00:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3305B4397F;
	Fri, 27 Feb 2026 14:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B44C116C6;
	Fri, 27 Feb 2026 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200802;
	bh=Ll7vX0iwBqlcAulvUYDlg1AF0/cayK4xOYfyyHaI++E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LkFRLbJUE/h2L82EhoDps7GICbdVeNGeo3Jj98LMhga8sR8eHV3pw0Lyqm1/3eAPQ
	 Fy5qUbWEXt3AE2qNDaiRer3hfJtzVmL8OBSvP/bbAbTMCaO8VOR4MtCJO6Q1aX3orc
	 R+73EwnBYSfvmPlHSvLVN2OAodIu/PeLrAwPtnPJx21r1+Gsc/7t8l1xKOwavVq6zo
	 I2l8hEBwPfq+ot7iZwu1lQMmpZ+uwfdpdxNvGQqQeysL1jYhM7fwf3jkTO+SzNw5GN
	 mNRMc/Zm6PUUXQMp4bm2KIr3cikTizq5thWItC7hYshT/V2lpyrd7pc+SO6JitkmGw
	 IWIagwXl0uyLg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 27 Feb 2026 14:59:46 +0100
Subject: [PATCH v2 02/14] drm/edid: Convert to drm_output_color_format enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drm-rework-color-formats-v2-2-8bd278e2af9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4310; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Ll7vX0iwBqlcAulvUYDlg1AF0/cayK4xOYfyyHaI++E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLFwffWvT9vs2B82l8GvLtHY4yy7fIPd9TlGCvmBm+x
 fdE4Y/WjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRpArGhq9BBVs9/djnJbgs
 Dp5zaoXTuuexgXOaMsMq4nVqGbkD/fV2z03+dWlCqoqHg00Tx4vVjLWCx/2LnvGaC9558t4mKdV
 lpWTXetVFhy97349nlyqf1X6TcZrUD6bmrbkuz5fZ3i0I5AEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_060002_875682_F7CD707B 
X-CRM114-Status: GOOD (  13.58  )
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

Now that we introduced a new drm_output_color_format enum to represent
what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
enum.

The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ff432ac6b5692d9178f4bfab039d2e52af68e952..5f9fcd7d9ce45d5b892077b7e7e78fed4aa88499 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5314,11 +5314,11 @@ static void parse_cta_y420cmdb(struct drm_connector *connector,
 	for (i = 0; i < map_len; i++)
 		map |= (u64)data[i] << (8 * i);
 
 out:
 	if (map)
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
+		info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 
 	*y420cmdb_map = map;
 }
 
 static int add_cea_modes(struct drm_connector *connector,
@@ -6090,11 +6090,11 @@ static void parse_cta_y420vdb(struct drm_connector *connector,
 
 		if (!drm_valid_cea_vic(vic))
 			continue;
 
 		bitmap_set(hdmi->y420_vdb_modes, vic, 1);
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
+		info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 	}
 }
 
 static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 {
@@ -6424,15 +6424,15 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 				    "[CONNECTOR:%d:%s] CEA extension version mismatch %u != %u\n",
 				    connector->base.id, connector->name,
 				    info->cea_rev, edid_ext[1]);
 
 		/* The existence of a CTA extension should imply RGB support */
-		info->color_formats = DRM_COLOR_FORMAT_RGB444;
+		info->color_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
 		if (edid_ext[3] & EDID_CEA_YCRCB444)
-			info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
+			info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444);
 		if (edid_ext[3] & EDID_CEA_YCRCB422)
-			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
+			info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
 		if (edid_ext[3] & EDID_BASIC_AUDIO)
 			info->has_audio = true;
 
 	}
 	drm_edid_iter_end(&edid_iter);
@@ -6696,11 +6696,11 @@ static void update_display_info(struct drm_connector *connector,
 		goto out;
 
 	if (!drm_edid_is_digital(drm_edid))
 		goto out;
 
-	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
+	info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
 	drm_parse_cea_ext(connector, drm_edid);
 
 	update_displayid_info(connector, drm_edid);
 
 	/*
@@ -6750,13 +6750,13 @@ static void update_display_info(struct drm_connector *connector,
 	drm_dbg_kms(connector->dev,
 		    "[CONNECTOR:%d:%s] Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
 		    connector->base.id, connector->name, info->bpc);
 
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB444)
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
+		info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444);
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
+		info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
 
 	drm_update_mso(connector, drm_edid);
 
 out:
 	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_NON_DESKTOP)) {
@@ -7227,11 +7227,11 @@ static bool is_hdmi2_sink(const struct drm_connector *connector)
 	 */
 	if (!connector)
 		return true;
 
 	return connector->display_info.hdmi.scdc.supported ||
-		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
+		connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 }
 
 static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
 			    const struct drm_display_mode *mode)
 {

-- 
2.53.0


