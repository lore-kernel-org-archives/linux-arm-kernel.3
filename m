Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF7EC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khcOtHMrhR8rbJI9KNhw6HNq4tSj3AnCdZtP9x0gJp4=; b=YYU4dzEeBmSjAw7tYfSxNh7mBV
	rpP8Daytz/Jg9/AP+N7HAxGLCU5HyNZPKeIi6bZJOgHZgcFzabLwYKPs8Qh5Mt5+Ky9I51OHqyXbt
	PF3KGsao4LKKdEUO6FjX9+uM06NwgnyvTDUTtMuqbeFoCYaAwTsbYpCCQEFXbeu8g1xMeRzOpZzqo
	0H6RAa0Tezfb1Bf6rf3UpKs6BD1rB9CINMsgyzHMUB7k/IlvvAMtXU5Ev6S6+4NH8KBrLZM7eZ6Km
	ow/C8k29OkrO7S7SNDYSP5ffP2DklDzF6akUrvxNwvWEMEYHURkX9yW8hsjBNVCtuwJyFSI1Z9fMU
	ZL1LcyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TaI-0000000D20f-2XNn;
	Tue, 01 Sep 2026 18:51:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZR-0000000D0kO-3E20;
	Tue, 01 Sep 2026 18:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288653;
	bh=q5EwAZk5tThfOFfPU3cHVXQvyZ71nTre7ie20f65OJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J2Njq9Vi4JicstBaFOmx64tiCSCfNhZmvrwUjq8IOZnqHv47VAxHqWQZkFzY7rLh8
	 vX1QUhcXIcdWtaHcY4YrYQzVyIu0Yc4tiCw1el/rEM33TmPVaMuPJyZ7EHJzZ3wSl7
	 STYLGxcHUtUidmoGGwMURTfPKLNUcyKU799VoOiuSuA+MrPsqTdpAKQTTtC7TsVR/o
	 WMc1rjvZdcoQZYPd9JuCpp28ILBfkwHekbR6EezLLDmXWr3gqJ+XMORG5nadKxl3fs
	 DAY4fV9OzvpeKRrZLhu0n3ZKgE8l4wCo9b/kRYEYW9fdw/Ape4mkxZH/DW3P8I2LHO
	 S7LzOEenNGkWg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0335A17E36FC;
	Tue, 01 Sep 2026 20:50:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:40 +0300
Subject: [PATCH v11 16/74] drm/bridge: Add bridge ops for source-side HDMI
 2.0 scrambling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-16-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_115058_008531_512AAEAC 
X-CRM114-Status: GOOD (  10.66  )
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

Bridges advertising HDMI 2.0 must be able to enable and disable
source-side scrambling and the high TMDS clock ratio when the configured
mode exceeds 340 MHz.

Add .hdmi_scrambler_{enable|disable}() callbacks covering the
source-side programming only; sink-side SCDC negotiation remains the job
of the HDMI connector helpers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/drm/drm_bridge.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 5a5a25995471..77b3ffe69230 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -561,6 +561,41 @@ struct drm_bridge_funcs {
 				     const struct drm_display_mode *mode,
 				     unsigned long long tmds_rate);
 
+	/**
+	 * @hdmi_scrambler_enable:
+	 *
+	 * Enable source-side scrambling and the high TMDS clock ratio for the
+	 * mode currently being applied.
+	 *
+	 * This only programs the source side. Sink-side SCDC configuration is
+	 * handled by the HDMI connector helpers.
+	 *
+	 * Mandatory for bridges that set the DRM_BRIDGE_OP_HDMI flag in their
+	 * &drm_bridge->ops and advertise HDMI_VERSION_2_0 or later via
+	 * &drm_bridge->supported_hdmi_ver; unused otherwise.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise.
+	 */
+	int (*hdmi_scrambler_enable)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_scrambler_disable:
+	 *
+	 * Disable source-side scrambling and the high TMDS clock ratio.
+	 *
+	 * This only programs the source side. Sink-side SCDC configuration is
+	 * handled by the HDMI connector helpers.
+	 *
+	 * Mandatory for bridges that set the DRM_BRIDGE_OP_HDMI flag in their
+	 * &drm_bridge->ops and advertise HDMI_VERSION_2_0 or later via
+	 * &drm_bridge->supported_hdmi_ver; unused otherwise.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise.
+	 */
+	int (*hdmi_scrambler_disable)(struct drm_bridge *bridge);
+
 	/**
 	 * @hdmi_clear_avi_infoframe:
 	 *

-- 
2.55.0


