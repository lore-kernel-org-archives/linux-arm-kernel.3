Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8061FD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 21:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBxMWqX4+1NiMuBr6BGqM8VA6p9l+VBzuvI2JeWQJUk=; b=dqfDTwPZwYhelBzlMuuJJ5n8WG
	xQ/gAQEsy9O0zgN0VjUNHXRS/Z/ClNPS9QG12gJNRm825U+CCCDSei+bE8c735P9q+1V24QnwIREf
	5/1+WdeAo549AkSPngqXWANVaAcQul7ZceIS9ia71fXUWc0k7Verp1WnFjmEg6ZSz7c5va88Jvxqt
	0fnv4aRAPMsLkMNw1gtK5DiROfeWtDzjWA35ibw7Muv862DWzGfJ/2XIRADu2U8GVNsKDcXTm5+AS
	Pg8NF2tYwd58Nw/9he1EkGemMFdO+zLv/WKgHWEluTKuIa0QD5CV0wYeyNH8T27nQwUkqahTjv7kH
	LMSBpi9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5gL-00000000vMv-064D;
	Fri, 28 Nov 2025 21:07:09 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5g6-00000000vDp-0D9A;
	Fri, 28 Nov 2025 21:06:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764363981; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KPDVuo9+EnGDLsuZweploJDFMSPxA3EwOZPw9aPHHhMz2DXUoWwiV7E4+0Iu/sGAn7NN1eYQDqoxdLuU/8cHLIKv0+/91JJqALSv8wTeWcUvbCWzKSKn1uyyUTX1dBoFx6mPE8NX2t6Z7KperR/W/6eMdu9mbtZ13QqW5iGa/2c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764363981; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IBxMWqX4+1NiMuBr6BGqM8VA6p9l+VBzuvI2JeWQJUk=; 
	b=WX4+Q0p3B+Hc18XO9I7Zq5vEASk3TR/6sx4qIF/XSxXD38ioGMnk6rXUzQrVWiY7yhRgghHBEzt7bgMkvr2pKJ8hU9e9ouTecxHnKY41dseHzikuzWeSTfMSv3G0DI7VxHTCen7B4aIzcI/ZEM5NWr422qJHj9RcgNWHQC1MI6g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764363981;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=IBxMWqX4+1NiMuBr6BGqM8VA6p9l+VBzuvI2JeWQJUk=;
	b=KDKeBn+2oZerSX3QOpV37D79KcKpgD5NU/avAqmIfHn26P43sELtFMjA3PIbGItM
	oIF7jte8lXsA25VmsfvHpV2uKlWgnD1atDLKO+YR51bkC9N1NHmIRUclkz08CqWLEft
	8DuabFfqAjcDNl6/1TXR7Sa1Yqtf1AFsv+/UCJJ8=
Received: by mx.zohomail.com with SMTPS id 1764363979976684.7501352747894;
	Fri, 28 Nov 2025 13:06:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 28 Nov 2025 22:05:39 +0100
Subject: [PATCH v5 03/17] drm: Add enum conversion from DRM_COLOR_FORMAT to
 HDMI_COLORSPACE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-color-format-v5-3-63e82f1db1e1@collabora.com>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
In-Reply-To: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
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
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_130654_187087_245DAA9F 
X-CRM114-Status: GOOD (  10.01  )
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

From: Marius Vlad <marius.vlad@collabora.com>

While the two enums have similar values, they're not identical, and
HDMI's enum is defined as per the HDMI standard.

Add a simple conversion function. Unexpected inputs aren't handled in
any clever way, DRM_COLOR_FORMAT_AUTO and any other value that doesn't
cleanly map to HDMI just gets returned as HDMI_COLORSPACE_RGB.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 include/drm/drm_connector.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 38968a557b82..cf556f0e5731 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2567,6 +2567,33 @@ int drm_connector_attach_color_format_property(struct drm_connector *connector);
 
 const char *drm_get_color_format_name(enum drm_color_format color_fmt);
 
+/**
+ * drm_color_format_to_hdmi_colorspace - convert DRM color format to HDMI
+ * @fmt: the &enum drm_color_format to convert
+ *
+ * Convert a given &enum drm_color_format to an equivalent
+ * &enum hdmi_colorspace. For non-representable values and
+ * %DRM_COLOR_FORMAT_AUTO, the value %HDMI_COLORSPACE_RGB is returned.
+ *
+ * Returns: the corresponding &enum hdmi_colorspace value
+ */
+static inline enum hdmi_colorspace __pure
+drm_color_format_to_hdmi_colorspace(enum drm_color_format fmt)
+{
+	switch (fmt) {
+	default:
+	case DRM_COLOR_FORMAT_AUTO:
+	case DRM_COLOR_FORMAT_RGB444:
+		return HDMI_COLORSPACE_RGB;
+	case DRM_COLOR_FORMAT_YCBCR444:
+		return HDMI_COLORSPACE_YUV444;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		return HDMI_COLORSPACE_YUV422;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		return HDMI_COLORSPACE_YUV420;
+	}
+}
+
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
  * @connector: &struct drm_connector pointer used as cursor

-- 
2.52.0


