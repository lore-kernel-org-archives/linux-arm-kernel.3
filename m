Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B0DC44532
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pl4EBTBrEengc0g1bXrIex85PhmPhM7X7VBexTsTzXU=; b=1qabcOj8E3edxF4hIlQnQXWaD7
	xDVJxRMkatQe3w06XLSTGgSVrJEFngFXR8ShWL/vlq9wkFlg/w6JrkSzL10/hppBn6IY842AAj7r0
	4ogw7eViEfjU3f7o8n7MYQqJDgEZsRCsypM23kGaAOMvBhywk8ANQvqepmxBjIhLOwykPKESovazR
	uCBpY9IfPOL+Wii8ul9D8kPtIwGKQaQoLDPnKHea7HBHLSLBmYDaebRP78SYaVcOo4Ui5eEByaPbB
	e6hmsOn3VO/jevdPnqZW6E18QfE/lyJtyQh/Nm3SI1Kvlv4m9yiNXVSK9C147Nyxr2fBh1GPFFiSY
	EkMT/nZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiOS-0000000D75r-0zUv;
	Thu, 23 Jul 2026 01:38:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLV-0000000D3GZ-0qDF;
	Thu, 23 Jul 2026 01:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770531;
	bh=+N+HPoympXucVGJN5bjlB23qkyWt7dTNEg/NHxiAtyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MOA1mJiApFe/v247aw6/PnM7W10VTQEjp4TkeH2w98s1tRAydI9POIRYSnn9autYV
	 4PIEg+HJX3eyu+SqnQYWlzW6XwxLxPkzmZZCUlg9tjbRfEG8NxELzIzqT/x6E24GBU
	 pSjGjT8Ctj/JQPlsZbAgR1wUO5ufPHmjQ5Osf3YfVq5cYcVWSrggTDgRviaDzV19eZ
	 kakUUKxP+2/j/xcLU2YyV4Zy6WXLB57HJT7schXy1GU+8U8S8XLhQDifxg6gp9XKTP
	 0njsw0t39tO5wdOi7rkZuB2RzSkTMl7DBI/lPxKgNRgZZ9ytseIP2VLNKWbjnMoBJk
	 lRdOC8dIu6cZQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 56B2217E36D7;
	Thu, 23 Jul 2026 03:35:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:31 +0300
Subject: [PATCH v9 42/61] drm/bridge: ite-it6263: Drop redundant
 .mode_valid hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-42-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183533_417301_1F1F07CA 
X-CRM114-Status: GOOD (  10.63  )
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

Bridges using DRM_BRIDGE_OP_HDMI expect connectors to be created through
drm_bridge_connector_init(), thereby relying on the bridge connector's
.mode_valid hook to invoke drm_hdmi_connector_mode_valid().

The generic helper computes the mode's TMDS character rate and forwards
it to the bridge's .hdmi_tmds_char_rate_valid callback through the
connector HDMI funcs.  This covers exactly what
it6263_bridge_mode_valid() does for 8 bpc RGB444, but due to being
output-format aware, it also handles the validation more thoroughly.

Both the connector and bridge .mode_valid hooks are invoked during
mode validation through drm_mode_validate_pipeline(), so the custom
bridge hook is redundant.  Drop it.

While at it, remove the now-unused drm_hdmi_helper.h include.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 4c0b670806cc..f166bb38998c 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -15,7 +15,6 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
-#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -669,20 +668,6 @@ static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
 	regmap_write(regmap, HDMI_REG_PKT_GENERAL_CTRL, ENABLE_PKT | REPEAT_PKT);
 }
 
-static enum drm_mode_status
-it6263_bridge_mode_valid(struct drm_bridge *bridge,
-			 const struct drm_display_info *info,
-			 const struct drm_display_mode *mode)
-{
-	unsigned long long rate;
-
-	rate = drm_hdmi_compute_mode_clock(mode, 8, DRM_OUTPUT_COLOR_FORMAT_RGB444);
-	if (rate == 0)
-		return MODE_NOCLOCK;
-
-	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
-}
-
 static int it6263_bridge_attach(struct drm_bridge *bridge,
 				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
@@ -831,7 +816,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.attach = it6263_bridge_attach,
-	.mode_valid = it6263_bridge_mode_valid,
 	.atomic_disable = it6263_bridge_atomic_disable,
 	.atomic_enable = it6263_bridge_atomic_enable,
 	.detect = it6263_bridge_detect,

-- 
2.55.0


