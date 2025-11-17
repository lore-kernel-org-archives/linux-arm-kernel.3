Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CFECE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 19:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d0k/LuL/udDSP5MXsPj+vrCjkqFJCvyb8zuefLEfUs=; b=kev7pBn1BmnRq/Uoit2vUaC468
	CsQo9wVK9Fz8CEt3dCaQbsIsVdOLh4dgEMieBcsprV8O6SDKQC7BoU/8LDPvNFk48qhXnX1tE4qc4
	RL6/56E6ZrYBK7osyT3EWl1J61ETJzxXifJ5vWcBBalLIA+bxw3j1dioAlqgaHS8vhXSNICW1Jcxl
	ySlKNY+4Fxhq4swXuaeuIjZc4XWo/qd8KDtz9YrlHk2P4Ryh23zj87K+0T7LGxtOvI6J7c8bi1rk5
	PCEW47QjGexTEXx8NAy9PI3rRWLad7rYa88381mLZTohz6yZy3qhGbC7RfxNXLcZl/+/8Afr/y1iv
	FbO1M1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4fW-0000000GiTD-0Sz7;
	Mon, 17 Nov 2025 19:13:42 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4fQ-0000000GiM4-0FLy;
	Mon, 17 Nov 2025 19:13:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763406786; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S4S4oot7NqAPseBWv4WoV/K5QiqXh+jRX8TXcWeIhlAMrth6kW3bk4loT6h6Q1Xt1VxMu+DkhvhJO4r8wcP11y014oztNkCIdgeGw6bedHyNSiDJpTLl6aNuazVaJyEMBYsP/YtyAONSBL1TPRehilAlnvzoFREIjWX8QGyehMA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763406786; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2d0k/LuL/udDSP5MXsPj+vrCjkqFJCvyb8zuefLEfUs=; 
	b=Gyg8YOwSeedwYsb7XmKV6ZYD4uxUuj/MR+l0KFGlD/XXBesT6B4jlyJ1p9A//wau7tt2rXGG5fSHeKqtIUgGTkkM5ji/NLoOU/QHI2O7DaUVXmtglBxNYrgiZkFCzTOy0srTX01a/BLiZjdW/j9OytYPg8f8fUpeLNkTMSt/Jgs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763406786;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2d0k/LuL/udDSP5MXsPj+vrCjkqFJCvyb8zuefLEfUs=;
	b=Z5Y4toe4Tj8bWAkFBjnelsdI9Le4bXBiFc57eIPMBcaGAeErDWwdjg1N1YwrGLFQ
	aAAdIMgs/zrgiKq+6i4Ehm5J67lMAG1ChgyStNdj/sNRfPfXGkP2LFbMO5OGuNyw6w3
	5Y4c7X4qx3J+tlCWfv05EkV1zs8I+WQtuQ/J6rwA=
Received: by mx.zohomail.com with SMTPS id 1763406784495196.5777941542043;
	Mon, 17 Nov 2025 11:13:04 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 17 Nov 2025 20:11:51 +0100
Subject: [PATCH v4 07/10] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-color-format-v4-7-0ded72bd1b00@collabora.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
In-Reply-To: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
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
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_111336_216266_99A78F85 
X-CRM114-Status: GOOD (  11.60  )
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

Implement it by checking whether the property is set and set to
something other than auto. If so, pass the requested color format, and
otherwise set RGB.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99..add0d51fce33 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -650,9 +650,15 @@ hdmi_compute_config(const struct drm_connector *connector,
 				       conn_state->max_bpc,
 				       8, connector->max_bpc);
 	int ret;
+	enum hdmi_colorspace hdmi_colorspace;
+
+	if (conn_state->color_format && conn_state->color_format != DRM_COLOR_FORMAT_AUTO)
+		hdmi_colorspace = color_format_to_hdmi_colorspace(conn_state->color_format);
+	else
+		hdmi_colorspace = HDMI_COLORSPACE_RGB;
 
 	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
-				      HDMI_COLORSPACE_RGB);
+				      hdmi_colorspace);
 	if (ret) {
 		if (connector->ycbcr_420_allowed) {
 			ret = hdmi_compute_format_bpc(connector, conn_state,

-- 
2.51.2


