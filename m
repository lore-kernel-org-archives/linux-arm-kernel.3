Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C431CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bW1GUfwkTTOiZ4VYC59WQXvld7KrjevOkEZb6bQuBzk=; b=zuLAey9Bg2hRByvByI1n097pHy
	xte11NGwvvDXVcIXhCGd/9SL58czru4G2Az2kNBzNzmniC/kn+i9O8GKbrlxQQxBX1h70EHzw3iJD
	W6PunkE+ajko8Rh4CoRzrDo+C417X03lS0U3EapDzxvhBcwMzN1KltoK4Nn5FQvGn6DX5X112SjQL
	XCv/TALM8yXQsO83nijvS42wHjetC25QlSBnwwO0yInm2UHAOmHc0zzls6VdWV+D73gHgYBYQV1XB
	d4edbwMIcDpAVx4zc8Yf10Z2HRvD9V9SPAxR3baPtvq3zK55xklaWUn2Uv598GT7i/PLppXf0NEfU
	OHPzVKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQP5F-0000000Anbi-1R0U;
	Fri, 22 May 2026 12:34:33 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQP5B-0000000AnY7-1Goh;
	Fri, 22 May 2026 12:34:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779453234; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WvVOut90+9wP35gBboNsV6WVHyP245fqrbox5S6KaHwZTryqa6w89V/rebVUolY9LgnWsQcNwJQPiW6HbGHKtVs8jICmeXUGAGP3NW/6Hv7crTl1hoal0Pznl4w1YTyuUnjYsCY//NxA5KQK110GZ5on9oDavkmrP5dc0TyxMss=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779453234; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bW1GUfwkTTOiZ4VYC59WQXvld7KrjevOkEZb6bQuBzk=; 
	b=Sd9lHNd4CNoLf8VXdJMDPVX5V+7jCk8TkTgHXSrA9j9WkT3bARzF2Mf9xX0oHKcjREEswoStEe6sIKejPOQvtKZ1x7HveyGUa/MP8xTdyzOXy+eXZLEntYpYOSxgFYcxJ8lrIDPM9QhKfNVIgf/4QqE8iDRWaanvZTPti7bhWJs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779453234;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=bW1GUfwkTTOiZ4VYC59WQXvld7KrjevOkEZb6bQuBzk=;
	b=LJ/wSzQXe1NQsYp50W7bdSNvSx/BhPd7xAVgX4u1nJTkYZNL9JYXYfXUi0ierpA4
	4VJUWjXIu3CW3/i0LNvIqNlwwhHCiWEQdxMWJ6r1c6NpAhpxEv9B5sUkZYr7r4UL6lv
	Ny+P8q0LxyZX/gVFdliQ/HtmSUijrbvG3KUejq+A=
Received: by mx.zohomail.com with SMTPS id 1779453233594812.4820877097096;
	Fri, 22 May 2026 05:33:53 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 22 May 2026 14:32:00 +0200
Subject: [PATCH v15 09/28] drm/display: hdmi-state-helper: Try subsampling
 in mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-color-format-v15-9-21fb136c9df2@collabora.com>
References: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
In-Reply-To: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Stone <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_053429_408739_D10615EE 
X-CRM114-Status: GOOD (  13.18  )
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

drm_hdmi_connector_mode_valid assumes modes are only valid if they work
with RGB. The reality is more complex however: YCbCr 4:2:0
chroma-subsampled modes only require half the pixel clock that the same
mode would require in RGB.

This leads to drm_hdmi_connector_mode_valid rejecting perfectly valid
420-only or 420-also modes.

Fix this by checking whether the mode is 420-capable first. If so, then
proceed by checking it with DRM_OUTPUT_COLOR_FORMAT_YCBCR420 so long as
the connector has legalized 420, otherwise error out. If the mode is not
420-capable, check with RGB as was previously always the case.

Fixes: 47368ab437fd ("drm/display: hdmi: add generic mode_valid helper")
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 1c54e6feac61..acb9b4ada47e 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -942,8 +942,21 @@ drm_hdmi_connector_mode_valid(struct drm_connector *connector,
 			      const struct drm_display_mode *mode)
 {
 	unsigned long long clock;
+	enum drm_output_color_format fmt;
+
+	if (drm_mode_is_420_only(&connector->display_info, mode)) {
+		if (connector->ycbcr_420_allowed)
+			fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
+		else
+			return MODE_NO_420;
+	} else if (drm_mode_is_420_also(&connector->display_info, mode) &&
+		   connector->ycbcr_420_allowed) {
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
+	} else {
+		fmt = DRM_OUTPUT_COLOR_FORMAT_RGB444;
+	}
 
-	clock = drm_hdmi_compute_mode_clock(mode, 8, DRM_OUTPUT_COLOR_FORMAT_RGB444);
+	clock = drm_hdmi_compute_mode_clock(mode, 8, fmt);
 	if (!clock)
 		return MODE_ERROR;
 

-- 
2.54.0


