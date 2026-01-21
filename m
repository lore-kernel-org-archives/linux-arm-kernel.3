Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23420C4452E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 13:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmmyhH2kEcgrSrjVTktapZnGINLmFhU3USp0HY1A94I=; b=KMtrqOCgev1paQQLpsBY9eX3SQ
	jQ2ZYXXaLFhhmCMALGZeYC44f/zdLfzfGsEUdctlJEbz99hDeyR7vo5nmCqO3m+bgmt7IxJfFyAUg
	H3iqvPATCKREJgjHDcfT3/K/fbUyz8Z5Z678w5QhD6SLUtMQ+2CqT7xaTi0Ul8p+cpMeDTF4H2yho
	2DUrNzOv+2K0jijkbOIlEJMZMncQdf4cDqQdWWzjXIG7fSDiZuxX2AQeHUt4HlWBmB6Ha8cEkLrI8
	W+OK2vqaUC1RGfhq94/iYfMRZ5U8TpJujqYYX69ExvyyfRBvrIUlpilgqM41N4CNtyf8IiWR4Ew2M
	JmGVdZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYZo-00000005XAs-3ymE;
	Wed, 21 Jan 2026 13:48:52 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYZi-00000005X31-2Y9x;
	Wed, 21 Jan 2026 13:48:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769003291; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kXFxPmW57D30xYmcCtOB/tM4j85LhfYt7Fegl3pFNJ7GZqkI7r+yXk2cwUTfYBIUuUhYyIzmPQi7608Faq7V796H+zlap5iMYvddht20Nn2hSB4H+fO/GlOHo+2ACj2X1lpf+kMwfLRQFVMIqx3rx0AS7oEEzVULaHAMCiCDNAs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769003291; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UmmyhH2kEcgrSrjVTktapZnGINLmFhU3USp0HY1A94I=; 
	b=dQJOatRBQ1M6TzIkmckPu0CpjUb4TJjKhoVMI13Gke6qZY0KfMlrdelBWKLb0YWNxYYuWgKmQxdhITjFaJZ9ykggiqkuNq95lsyipl3kXzSwQZiMW8EUauOOq8FyAwwXGnzH2rROD3gfzYng4YMMhN+JzqbsDdglVw3DpRZunDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769003291;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UmmyhH2kEcgrSrjVTktapZnGINLmFhU3USp0HY1A94I=;
	b=NBSs3q40D0PURX4hKxDpoXPBywuFeitL9dnIQX08v3kRx5bmBasBa+jzZX+PMa2E
	eKZRJDgRV7An5HaeSKpCi5vSIuQd+kMcuVGuN0jYMWfb4kcLTEuy82pZaGqNWf4DrMZ
	Sas/LzmYVlDiYU/20pEVT5Sg30cuQ901JS7Z83s4=
Received: by mx.zohomail.com with SMTPS id 176900328931885.89997046689837;
	Wed, 21 Jan 2026 05:48:09 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 14:45:43 +0100
Subject: [PATCH v6 17/21] drm/connector: Register color format property on
 HDMI connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v6-17-7b81a771cd0b@collabora.com>
References: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
In-Reply-To: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_054846_821851_8FF3CAB9 
X-CRM114-Status: GOOD (  11.62  )
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

The drmm_connector_hdmi_init function can figure out what DRM color
formats are supported by a particular connector based on the supported
HDMI format bitmask that's passed in.

Use it to register the drm color format property.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 507787619b80..1bec7e5c2215 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -578,6 +578,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc)
 {
+	u32 supported_drm_formats = 0;
 	int ret;
 
 	if (!vendor || !product)
@@ -627,6 +628,18 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	if (supported_formats & BIT(HDMI_COLORSPACE_RGB))
+		supported_drm_formats |= DRM_COLOR_FORMAT_RGB444;
+	if (supported_formats & BIT(HDMI_COLORSPACE_YUV444))
+		supported_drm_formats |= DRM_COLOR_FORMAT_YCBCR444;
+	if (supported_formats & BIT(HDMI_COLORSPACE_YUV422))
+		supported_drm_formats |= DRM_COLOR_FORMAT_YCBCR422;
+	if (supported_formats & BIT(HDMI_COLORSPACE_YUV420))
+		supported_drm_formats |= DRM_COLOR_FORMAT_YCBCR420;
+
+	if (!drm_mode_create_color_format_property(connector, supported_drm_formats))
+		drm_connector_attach_color_format_property(connector);
+
 	connector->hdmi.funcs = hdmi_funcs;
 
 	return 0;

-- 
2.52.0


