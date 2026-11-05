Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E420E606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 01:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gK5zrCVa;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=igTkkW+e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O50/RPW38+N8i5gjSk+TqiFc1u8BMhD1yRooJzVaNj4=; b=gK5zrCVaIDWxoC
	gxoO1txItqvm+KMU4B9NVd75WliYoeyN+j7O0ngF0+u73RMACh5bQQj9HirSGyhoD6hs8oeHZrfEo
	eQ2KDrAKsQEr0aWAHUz8rGAA+64CP+Zjqp/KqFtA7VgaqnH7zyyFwHAaI3pR7ZwTAYzLaZaAiSoJG
	U85LI6se3ewliBPDZr4bXAvjUkgv0YPzMsrCJMkCM9btOdFmgTX6D4T6z8u31WqxeSjK0OCOillyj
	WlGGvrFLc9dgsssqRklsO4K/VOQON7cI6+BYKHOa68e30IU2ez2DGqKevqG3e49boFYZ16TZxJWyb
	C/l8ut+cT0EAXXmrk5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlr2-00000007OoR-0FUh;
	Thu, 05 Nov 2026 01:01:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlqu-00000007OWr-2D6J;
	Thu, 05 Nov 2026 01:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793840474;
	bh=fK5c5ENnVBF9Cbe0Gx7/q+sFZIPn1Kn5+5RFTv/gG2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=igTkkW+ew6DQUksmViomveI/6C6QialiidTjFeRoCM0AFXDpNyBRYvf2Z2HNkHXVF
	 r6sHOtQbwXg1Ca2khWSgPRDh3bzZPGFNvh6r5lww1fZavswx9rUepwmRALn8INUs/u
	 /CMQKlHBSaiOvfvHXz3+W8NuHb8gWPQoivLsTGDlnSok1Y1OHSW1WLEJDpZ9lyXQcb
	 Zo9HhS19w7WaQfV5QCEOwHfHmrd5jjWMc9oq4F42yqjuwB+a1yr+yTgjLHplWDZ60V
	 EELvYEtW9gqk5m9GcpC9bakGGDtQaA9lX3hWDPmg5ugzOgWnieyAIKomOdJUuHwKjV
	 eXSy1tXVu7P+A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4103417E02F2;
	Thu, 05 Nov 2026 02:01:14 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 05 Nov 2026 03:00:45 +0200
Subject: [PATCH v6 11/15] drm/bridge: dw-hdmi-qp: Log resolution and
 refresh rate in atomic_enable()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dw-hdmi-qp-yuv-v6-11-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_170117_082973_CC9AFF5F 
X-CRM114-Status: GOOD (  12.76  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The debug entry in the HDMI branch of dw_hdmi_qp_bridge_atomic_enable()
previously printed the literal string 'HDMI' as the mode field, giving
no information about the actual display timing being configured.

Extend it to include the active resolution and refresh rate by
retrieving the CRTC mode from the incoming atomic state:

  dw_hdmi_qp_bridge_atomic_enable mode=HDMI:1920x1080@50Hz fmt=RGB rate=185625000 bpc=10

This makes the log line self-contained and directly useful when
debugging mode-setting issues, format negotiation, or TMDS rate
mismatches without having to cross-reference a separate mode dump.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index b268c9376087..c6551f4cbf93 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -539,6 +539,8 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 	struct drm_connector_state *conn_state;
+	const struct drm_display_mode *mode;
+	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	unsigned int op_mode;
 	int ret;
@@ -552,6 +554,9 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 
 	if (connector->display_info.is_hdmi) {
+		crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+		mode = &crtc_state->mode;
+
 		op_mode = 0;
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 
@@ -559,7 +564,10 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 		if (ret)
 			dev_warn(hdmi->dev, "Failed to enable scrambling: %d\n", ret);
 
-		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u scramb=%d\n", __func__,
+		dev_dbg(hdmi->dev,
+			"%s mode=HDMI:%ux%u@%uHz fmt=%s rate=%llu bpc=%u scramb=%d\n",
+			__func__, mode->hdisplay, mode->vdisplay,
+			drm_mode_vrefresh(mode),
 			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
 			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc,
 			connector->hdmi.scrambler_enabled);

-- 
2.55.0


