Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C303BFEFB7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 19:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CRAmTFQCtq+1fmVyGcK9BYvQbCYnvTEoio6+jtAKiI=; b=Tb3QT+oCeFPIMTp/WxkHmzc1c+
	ka+3pbJjNV3NOoihVfwb1CObVsqjCHQcBlLxqJ13Xo0b8hEK/waTtV7I1E6ZMn+0+tV5MDEtTHwxn
	c6LuzfGKhoW0fytkkO2tNY2nhoR/AD8h0oKel1HtBeizA2hMwYURjoOv632Km7xrTqndv2Q6F0gON
	8En/jXM9+WlTnAq+TqDq7gxQo51zlS6GA5mpTymFBMM4pgxkixOg5tG5VT0Yn8nobAQtDgls9zU4E
	BUf/WIGbMmfluyQ4aWQDQKCdUBIrJzMvAb9dE2VdiikibO38Eoo/0Fd8a3SVll32CNiO8e4IS4XFy
	9fA1XEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3PM-00000008xQ6-23S2;
	Fri, 27 Feb 2026 19:21:52 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3PA-00000008xFr-1zdi;
	Fri, 27 Feb 2026 19:21:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772220065; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CuDtymhFYBZKAp4fGdd2gpif9YWaDf+JeJJ+ImGvix0qeFNETuBWQYtYhBYgpq2I0cQZWyl8wedtjuDSVmeAtCaPhLCGrr7h+4ymI9tVVoVBKC+Akczk8diUbBb1f9CSCxPDjbWny+3athkkW70ihT6H/b6uF4HzAPhN3vJqVxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772220065; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7CRAmTFQCtq+1fmVyGcK9BYvQbCYnvTEoio6+jtAKiI=; 
	b=mTa+TVkdHMYMHNKMjOktCKWVMRJx9eYj+RS0KdfuRzaCtRC5+/aUNpVr2QCDookul3xyGjfdpg+s/R165cjnw1HCou14Y1KeDawNtHXFahh7Ypwv3swcMpjqz9e+rbh7StYlu0c+CZyPZ8BMqO01MRC2AhceMQ11gjZqjhIuDfA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772220065;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=7CRAmTFQCtq+1fmVyGcK9BYvQbCYnvTEoio6+jtAKiI=;
	b=QMCG0Fg20PpjZuW8trMWkofAxH7FKBIRjKUH4CvoPnIVYAUQK/cOUnYa0YaMcIYM
	fW+uEEikuPV4avBJ+GMz1OsAE64w6citd4HdGmbZpeLn45Jyc+AqTD9jyYVOASm4iUf
	b1bSBQKn6YiHj44iq7zUkCfA7P+z194if/V6TaV8=
Received: by mx.zohomail.com with SMTPS id 1772220064429633.5205645122492;
	Fri, 27 Feb 2026 11:21:04 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 27 Feb 2026 20:20:09 +0100
Subject: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
In-Reply-To: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_112141_621703_EA141E8B 
X-CRM114-Status: GOOD (  13.30  )
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

With the introduction of the "color format" DRM property, which allows
userspace to request a specific color format, the HDMI state helper
should implement this.

Implement it by translating the requested drm_connector_color_format to
a drm_output_color_format enum value as per the logic HDMI should use
for this: Auto is translated to RGB, and a fallback to YUV420 is only
performed if the original color format was auto.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 9f3b696aceeb..31c6d55fa995 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -669,10 +669,34 @@ hdmi_compute_config(const struct drm_connector *connector,
 	unsigned int max_bpc = clamp_t(unsigned int,
 				       conn_state->max_bpc,
 				       8, connector->max_bpc);
+	enum drm_output_color_format fmt;
 	int ret;
 
-	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
-				      DRM_OUTPUT_COLOR_FORMAT_RGB444);
+	switch (conn_state->color_format) {
+	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
+	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_RGB444;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR444;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR422;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
+		break;
+	default:
+		drm_dbg_kms(connector->dev, "HDMI does not support color format '%d'.\n",
+			    conn_state->color_format);
+		return -EINVAL;
+	}
+
+	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, fmt);
+
+	if (conn_state->color_format != DRM_CONNECTOR_COLOR_FORMAT_AUTO)
+		return ret;
+
 	if (ret) {
 		if (connector->ycbcr_420_allowed) {
 			ret = hdmi_compute_format_bpc(connector, conn_state,

-- 
2.53.0


