Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08205CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szs3Fi24AawsCdvDh+JSgiByUZb/uysg/b3saRWp/iE=; b=N8c5VVqKES0Oc7OuHeMIpxDsLy
	1V0ONwDSwHPFNYGQ5iyaXMEHfzRehvUA5wVXKrBL5ZbCg/RFJn6Sx9wjUdvrGpo92s04kHkkSYOZ9
	HjtX1g0VBjFZW7/5x3db0GfjxHk8Gy/aW4QTIk/KK7cLt0ChTLV+ByGgDUej1SrmTtT12zjk+Q3YR
	fJDvLCnJCmPPlVP+CyL/U9RZZfELT/EGX9CQw4szCl7UgLvzmTWM0Fw4Q4KfbD2MkzfoN9xOg5HET
	D5YsSfHmC+EzKOVkOs1SUxqgzVXWQXqNxQnzjLqTmaE89cjQ99MUz74pO3nU6TFj2H1GAlEFil7mO
	nbLCqwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3nU-0000000GiLi-2gO6;
	Mon, 18 May 2026 19:38:40 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3nS-0000000GiI3-0cl3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:38:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779133116; bh=szs3Fi24AawsCdvDh+JSgiByUZb/uysg/b3saRWp/iE=;
 b=hZzjNzKXEyJJ1e/14kA48hMrzmaSkj1Du5miq/xIVEtgtJJVNu9MVOpNmZUb6AC2cs2O9dpbs
 ZeLoZV7ABzMT0jcZ1YDvCN+4B+mZxypMBIazBCBY2EaTYqFRCLb2LthC7eul9++OEspfIzgjsSD
 FJ/c2Tyj/OJOT2rcL6iSaLCZtsC5BCJdPmy7CNRisLxkhetrnwHBdF059UmZ+5TH25eMbNRZKYz
 nj2BAAOifEfP3+nSGRLCY/N7qwKoUMAa7pOYLG/yqBPt5BPOuZE3dDZBQUT/SsAEoDArfQ6+zPw
 lqat8LhABWIg1Z5XflKI1ITJMPUq7o3IGvWdAWv64YNQ==
X-Forward-Email-ID: 6a0b6ab8486b4b38b826fac1
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 10/11] drm/rockchip: dw_hdmi: Propagate bus format to display driver
Date: Mon, 18 May 2026 19:37:44 +0000
Message-ID: <20260518193748.2482823-11-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518193748.2482823-1-jonas@kwiboo.se>
References: <20260518193748.2482823-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_123838_271590_D9CFFAC4 
X-CRM114-Status: GOOD (  15.21  )
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

The HDMI block is currently hardcoded to expect RGB output from the
display controller. However, the VOP in some SoCs are capable of YCbCr
output to the HDMI block.

Read the negotiated bus format from the bridge state and propagate it to
the CRCT state in form of output mode and bus format. Treat the format
MEDIA_BUS_FMT_FIXED as RGB888 and reject any unsupported formats.

This has no inpact until dw-hdmi bridge is fully converted to a HDMI
bridge and also adds support for the "color format" connector property.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: No change
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 44 ++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 4e7fd4b80d76..0133a4b67b3b 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/hw_bitfield.h>
+#include <linux/media-bus-format.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -275,6 +276,26 @@ static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
 	dev_dbg(hdmi->dev, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
 }
 
+static u32 dw_hdmi_rockchip_get_bus_format(struct drm_encoder *encoder,
+					   struct drm_connector_state *conn_state)
+{
+	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
+	struct drm_bridge_state *bridge_state;
+
+	bridge = drm_bridge_chain_get_first_bridge(encoder);
+	if (!bridge)
+		return 0;
+
+	bridge_state = drm_atomic_get_bridge_state(conn_state->state, bridge);
+	if (!bridge_state)
+		return 0;
+
+	if (bridge_state->input_bus_cfg.format != MEDIA_BUS_FMT_FIXED)
+		return bridge_state->input_bus_cfg.format;
+
+	return bridge_state->output_bus_cfg.format;
+}
+
 static int
 dw_hdmi_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 				      struct drm_crtc_state *crtc_state,
@@ -283,9 +304,30 @@ dw_hdmi_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
 	struct rockchip_hdmi *hdmi = to_rockchip_hdmi(encoder);
 	union phy_configure_opts opts = {};
+	u32 bus_format;
+
+	bus_format = dw_hdmi_rockchip_get_bus_format(encoder, conn_state);
+
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_FIXED:
+		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		fallthrough;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
+		break;
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		s->output_mode = ROCKCHIP_OUT_MODE_YUV420;
+		break;
+	default:
+		return -EINVAL;
+	}
 
-	s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
 	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+	s->bus_format = bus_format;
 
 	if (!hdmi->phy || !conn_state->hdmi.tmds_char_rate)
 		return 0;
-- 
2.54.0


