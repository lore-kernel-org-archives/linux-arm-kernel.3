Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA291E7BDB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6/IL9T9r6JCufl0RYsNc7jJmCuMbPJaKhaRNoo53fQ=; b=UfboD+FAE0/roCiW8sLqvZdMTR
	iIin77ChVZ/pOQup1ZmBtCsedhOSnlq+uPcrrxtxX2VVzfapLv/K87WUdhGDKYaSgVvLl4BXUh1yI
	f/Ao5BG4kSGGiGaJrXNMfHK7kItpMa/q1IJ5Rwe9iisVh6ZLz577vCR2+m+YSSR6ehfSAtjqQ6VkK
	Zto4nfKUal4OwGRBGAslzloOlKMJ+4Bg92vWictNl+/DQTtnrjZfet/Ig05binF3c2ry2oQNct6Eu
	eV0ZUBQBzxgi6UZtcAjZKz5hLIVDevG+yRN8CAinceCRlvOSwfs72An8RDs8qOJLYRsTPBbwBQ7i1
	ll9t27mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vryFK-00000006ZOI-17v7;
	Mon, 16 Feb 2026 13:02:38 +0000
Received: from sender4-pp-e104.zoho.com ([136.143.188.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vryFH-00000006ZNB-0wU5;
	Mon, 16 Feb 2026 13:02:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771246923; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eZVJThR2gA+t6hkkAUI5SiueBkenMCTQGNboTDOT65PQZMu3+zq00/VhZBiglKzBsk1jA2N07djIqRDFnII5j26Eu8F9DhZmFII2ZesM8ylBZJQFSb1iaYzRXJ9JnSUXARypRiFxyyc05s4RH8+nJYSuDOxeuaiNR+x0MZxyxcs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771246923; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E6/IL9T9r6JCufl0RYsNc7jJmCuMbPJaKhaRNoo53fQ=; 
	b=KRAM4C9X2fTMr9MLZ2xbdRCP7NvnMxvBcYwYIrRrMnO1tuVg+DRiwOsRO1nUZ/z9d7GIFTl5aTm/ZMlA6caww4W/QcW6DK/JGiGJlN8bP7qjNM4MsMJXW4DbdcOoNjfpqLJqx7qLBjMFrVLNR61kz57mPiieoLytaA4mRXUtrK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771246923;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=E6/IL9T9r6JCufl0RYsNc7jJmCuMbPJaKhaRNoo53fQ=;
	b=FpBVMtkJwvPluuKs/sxzKjDlt1CbhDZFt4WkGb9BSe4LMlPQW1yoSMu69gTAt74y
	HpVAFcu5AdSRH1ubBHV+nepgFnJpdvIBDjRHU5DX4mp8uaN9D1PdaLLIxQ3qdSCjuJe
	7weY5+F2NQaz25CVMfZb17kXtAL7ShwL1ChjauVc=
Received: by mx.zohomail.com with SMTPS id 1771246921436134.4296104447676;
	Mon, 16 Feb 2026 05:02:01 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 16 Feb 2026 14:01:17 +0100
Subject: [PATCH v8 03/20] drm: Add enum conversions for
 drm_color_format_enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-color-format-v8-3-5722ce175dd5@collabora.com>
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
In-Reply-To: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_050235_314459_205D6B11 
X-CRM114-Status: GOOD (  10.70  )
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

While the drm_color_format_enum enum and the hdmi_colorspace enum have
similar values, they're not identical, and HDMI's enum is defined as per
the HDMI standard.

Meanwhile, each DRM_COLOR_FORMAT_* define has a corresponding
drm_color_format_enum, which allows conversion from the bitshifted
defines to the enum values.

Implement conversion functions from DRM_COLOR_FORMAT bitshifted defines
to drm_color_format_enum, and from hdmi_colorspace enum values to
drm_color_format_enum enum values.

In both conversions, an unexpected input results in a
DRM_COLOR_FORMAT_ENUM_INVALID result. The functions are kept inline
__pure to give the compiler maximum freedom to do as it pleases.

Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 include/drm/drm_connector.h | 53 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 18bd875b6918..886defdd069b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2694,6 +2694,59 @@ int drm_connector_attach_color_format_property(struct drm_connector *connector);
 
 const char *drm_get_color_format_name(enum drm_color_format_enum color_fmt);
 
+/**
+ * drm_color_format_to_enum - convert a single DRM_COLOR_FORMAT\_ to enum
+ * @fmt: One of the possible DRM_COLOR_FORMAT\_ values
+ *
+ * Converts a single DRM_COLOR_FORMAT\_ value to a corresponding
+ * &enum drm_color_format_enum value. Bitmasks of multiple DRM_COLOR_FORMAT\_
+ * values are not supported, as they would not map to a single enum value.
+ *
+ * Returns converted enum value on success, or %DRM_COLOR_FORMAT_ENUM_INVALID on
+ * failure.
+ */
+static inline enum drm_color_format_enum __pure
+drm_color_format_to_enum(u32 fmt)
+{
+	switch (fmt) {
+	case DRM_COLOR_FORMAT_RGB444:
+		return DRM_COLOR_FORMAT_ENUM_RGB444;
+	case DRM_COLOR_FORMAT_YCBCR444:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR444;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR422;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR420;
+	default:
+		return DRM_COLOR_FORMAT_ENUM_INVALID;
+	}
+}
+
+/**
+ * drm_color_format_enum_from_hdmi_colorspace - convert hdmi_colorspace enum to
+ *                                              drm_color_format_enum
+ * @fmt: The &enum hdmi_colorspace to convert
+ *
+ * Returns the converted result on success, or %DRM_COLOR_FORMAT_ENUM_INVALID on
+ * failure.
+ */
+static inline enum drm_color_format_enum __pure
+drm_color_format_enum_from_hdmi_colorspace(enum hdmi_colorspace fmt)
+{
+	switch (fmt) {
+	case HDMI_COLORSPACE_RGB:
+		return DRM_COLOR_FORMAT_ENUM_RGB444;
+	case HDMI_COLORSPACE_YUV444:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR444;
+	case HDMI_COLORSPACE_YUV422:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR422;
+	case HDMI_COLORSPACE_YUV420:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR420;
+	default:
+		return DRM_COLOR_FORMAT_ENUM_INVALID;
+	}
+}
+
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
  * @connector: &struct drm_connector pointer used as cursor

-- 
2.53.0


