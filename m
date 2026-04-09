Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4F7F31E50
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nST9fa3CdhEsHfO1fBooiGQR/BaO7Jsw79fU7DtAiIY=; b=2XYNZNgnBwVMIG17gD/P8E12ep
	wb4usU8XHmxZDt38UJXEogD0P0/hy3ZZfi2tTetKN5o39CGjFOyqjTJz0V3I05Ku1g37n75eyKhn5
	zc+9qD1wo/sxBZEZmGJ1mkWFpZxusZAsFpUbZ7YP9PW14BuMHBFIFRIhHMZq+NuqXPMs2aLy2KsID
	1e+lBLL9PXgNcF8cgdpH/P1XbR+azCyT7kDmjjt/hKMpa20IEauix601ptHuLggSzZVlHpspHRoT/
	w6dG0AAtQDBccYyNim8MWA5jl7zSAwfk7yWAPZwKMj9aoeglMeJpwB0M+djfShSTgu8UUq08FBAy4
	4Nj60osw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArcN-0000000Aqtm-08qO;
	Thu, 09 Apr 2026 15:48:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArcG-0000000AqlH-1Xk9;
	Thu, 09 Apr 2026 15:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nST9fa3CdhEsHfO1fBooiGQR/BaO7Jsw79fU7DtAiIY=; b=JQwiGL4FPYA+wpMTTG2FRF1TdZ
	F0luLg3DL50zkI1T9eamWkaiBja4LpAZMteSm4pGcxij/Di+gyiH9ctdJ5VF+nK1d/nToQ/X2SM6b
	IB0NJLFMrwHVop8OF/9NfmaVp+Py3tNCIrYol/4isivIOCPZi8gcUQ2evfJ1LfdpzTZHE9WWa1mGF
	z9kWkDA24x7pKqlcQGfZ0lizzosT1ezbRtiPjZPsot6ed7UI3At6jVpJIQuiZyboq08qyBc/7W8x5
	Fx1GQtCNJyMUMkhKfFlJv0W4Gn5DXNN78XKweqtvxew0KFW+jiplACh+DP6+GDP6Qlzs2Kk7pzycO
	PyVfw6dg==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArcD-0000000C2HH-08Ki;
	Thu, 09 Apr 2026 15:48:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775749664; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N1SjekMAJO+bxwcE6fyvxI3WAdJN42JS+jO2ndpg9XiPztRaCj0wyjmYutd38re5AIFYVWigunhinRwAh+0oCFYa4ruEW2cD4MGeHkcuk6eFH+gB3rFBjzRF6icjJV9p0jF/xNkhen8o+Q4jzKWPoKHwZZlX2Azvpn9B92bmO60=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775749664; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nST9fa3CdhEsHfO1fBooiGQR/BaO7Jsw79fU7DtAiIY=; 
	b=L4hEYTYCl6pU0+gGr0Q+NVbKBwoszNsq5MiMrQdUlecJQu2a6hF7sddhSOcj8DOqSIM/hGtXcu5sUsfivzDwURVjx7F6Cl58owojKkuhOVdHvWFoTAn4nsxGkhmrVZ57jrDOu4QS/gAkQBkKWMpCd7GSJZqPYnO4tArTMCE1wbM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749664;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=nST9fa3CdhEsHfO1fBooiGQR/BaO7Jsw79fU7DtAiIY=;
	b=h8ZjvccR4O8BlmZjpkhlJhlI+CZ89S1pu1/FYejz7KS5+tPWtpow9TAgq0nmLWMv
	lcOLLIR8EXb7qXAVVHgSBdGD0GTI9G6J3y5BcYBJVU4MD+gQsZE8yQ8qfywOPcVyHNM
	Z5uHYocf1rnSeEegzbUSt8x2UDQl5A7ofUVD1Hsc=
Received: by mx.zohomail.com with SMTPS id 1775749663186430.6050268602419;
	Thu, 9 Apr 2026 08:47:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 09 Apr 2026 17:45:09 +0200
Subject: [PATCH v12 19/25] drm/connector: Register color format property on
 HDMI connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-color-format-v12-19-ce84e1817a27@collabora.com>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
In-Reply-To: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
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
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_164821_502899_25F1C34A 
X-CRM114-Status: GOOD (  10.75  )
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
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1c4f3ff7d84f..0da136a93dd6 100644
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


