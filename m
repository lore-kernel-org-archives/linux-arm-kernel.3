Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2D5FDEE45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 19:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xYZ/VN88MQKainBWxRpganxXiV9Dos9K+S4AIneorA=; b=ZAe9ma1MI2i1qAUD/meV/fxaCC
	m/vkRIoUYV6ACiQFUFSwIQWH/aqoZDDp5DOp7C75fIGirj1u3CohTwANpY2wWnGfiUtpR0rtpwDHq
	3T3SwUq6/JC/wYuCWN8UFY2X0pCXFpnKCV2QBc3BR/sdOl94HaHLijitcnMhx40YI2ljlj+Y/7a1c
	1wPARmeHQSryqfXlxbnDiLg3Z4UVs529njVRGU31wAphjF2wIbTDqDZqFzsis96iKNJustN/G1VbP
	GArdRyZMHRzP6iQZSkthDwcaKQlPQyRoQxHU726TFsKCXnSMCGzXf3m+WDSo44LsEGYV6Ztwadjf4
	6l/BnMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzOc-0000000CByR-16Rf;
	Thu, 23 Apr 2026 19:07:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzOP-0000000CBom-0TCW;
	Thu, 23 Apr 2026 19:07:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776971202; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nzuNAuwMXJ4tbxUll/WiH1VtwYfPXVC/i73jtZ1ruKusWZ+sU2u/zLh1duuXf816DqNUmxt6RTVHm9KZsRuFwdKbwhtVgTysZHWODdRzNqoIxy9FoMWiT7zZKaBlsP/V5Y+ecmLJPz3sXzfMbIFzKqF+2iSH9p+41RxFPQ5pD8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776971202; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0xYZ/VN88MQKainBWxRpganxXiV9Dos9K+S4AIneorA=; 
	b=eKe3lGEKmm7G84DCyXmkFDSdlkLxEqCSbwLJigEb5TTDYfxGMBTEUU7JHFRpvmhLVgbZc1YBHpGdB6bNhiFHeWkWm/u7+LiyCOipdGKInHEqZW4sX5W7HoEp8+oocbsLoV7fSwSLfZYfBBZixFeqcWjoZzOzCdDt9k1UvquPGJI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776971202;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=0xYZ/VN88MQKainBWxRpganxXiV9Dos9K+S4AIneorA=;
	b=co3sw1lQzqYIZcOz0zcb6T9swDYN+vereBbOwAMUC9feh2LK9myOXtStJQZP0OOC
	KOncfvNJNQSufMwdfe9LWJ8YSNJ/CLsmYBIBcZUc0XeMEPV750DlwdoLYtQ/CWv6QP4
	LDiw9AUR1oe67pFoPEih1wcJBUA2QRytWRlvZZcE=
Received: by mx.zohomail.com with SMTPS id 1776971199895620.5506730332631;
	Thu, 23 Apr 2026 12:06:39 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 21:03:45 +0200
Subject: [PATCH v14 22/28] drm/connector: Register color format property on
 HDMI connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-color-format-v14-22-449a419ccbd4@collabora.com>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
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
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_120717_218337_2D896E11 
X-CRM114-Status: GOOD (  10.27  )
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 41a5ab1e563e..b91c1f76355e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -627,6 +627,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	ret = drm_connector_attach_color_format_property(connector, supported_formats);
+	if (ret)
+		return ret;
+
 	connector->hdmi.funcs = hdmi_funcs;
 
 	return 0;

-- 
2.53.0


