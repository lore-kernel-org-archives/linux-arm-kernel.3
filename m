Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2981DCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qE/XbFhhUmB6Mu4jPLzIwNb/8iLA9wJOqEhZur9FT3Q=; b=bt9gqP7S2T1PAZYGRW0QbvSXJq
	jiPxy3aulezzq3OWWXhoWp9Bb/hJvoH8vjfmeZiOxGVPFr0GaN2fPN+HaQnhaLdGDzJaSOoM76HD9
	h7WRV59WngAvJLpv6k3dgRaaTgixA0fEPqrM5oS3F0oHAM2Zp3GIu4bSYgcMrNu7pVSHCbNfomqLO
	hbje2u3+ysdqkhlBqL/CMDeKFA8T9/3T+bRZAWwLCkDze9tUQpDCQhGsrjFazkhI1LrmCy9bLaUEI
	rqCVDxNAwphFM3EBEysqNyHRJ23ibZ2nmPTEsgSgV63J9NXoD28t4atSmneCGR8nTZZptCyMZZ2fr
	UzR72Nzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlol-00000005T3d-08lu;
	Wed, 20 May 2026 18:38:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPloV-00000005Sjm-23Wy;
	Wed, 20 May 2026 18:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779302316;
	bh=Vinl3H8Sv0aiM6aJ68yze1Wzhzorcj3ktQ602i1XvWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UTUpNffRRth/UkSEmZ/7D9lYEtMHkbsy2yZQPKxqjUR53PPmf569XB8J+D8Pzddw7
	 UWA7cmRSUeLQPi+nkJe1mXxZaL3j7Zp4/SCz9yINQvAn5NP7fFi+WO6arwyQbjM5/K
	 /7r3etbd3hfzIm8lAF2NCFclMks+MtA1V5+8gZQoOJ2hABDIHwu1YRGjBgu/AbMRDi
	 fmI9NEfKUTLunkFipC5NzvF/FvfYyOl7ct1rhm7IheDUmRhg0U7zPGnEJCALex53Ga
	 1NRc/sidb+/Fmnyals0eWxYR3F/Jxebp5JPd7zb6Ij67QfDo81I0QMbAf97cKR1W+j
	 t6EDEjdZUTpYw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F6A017E0566;
	Wed, 20 May 2026 20:38:36 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 20 May 2026 21:38:18 +0300
Subject: [PATCH v6 07/22] drm/bridge: Add HDMI 2.0 scrambler bridge
 operation and callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-dw-hdmi-qp-scramb-v6-7-24b74603b782@collabora.com>
References: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
In-Reply-To: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_113839_689826_ECDD0AA5 
X-CRM114-Status: GOOD (  10.97  )
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

Add DRM_BRIDGE_OP_HDMI_SCRAMBLER bridge operation flag and the
corresponding .hdmi_scrambler_{enable|disable}() bridge funcs callbacks.

Bridge drivers set DRM_BRIDGE_OP_HDMI_SCRAMBLER to advertise that they
implement source-side scrambling control, which the bridge connector
layer uses to wire up the connector's scrambler callbacks.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/drm/drm_bridge.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4ba3a5deef9a..a0fcbbc7086e 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -667,6 +667,26 @@ struct drm_bridge_funcs {
 				     const struct drm_display_mode *mode,
 				     unsigned long long tmds_rate);
 
+	/**
+	 * @hdmi_scrambler_enable:
+	 *
+	 * Enable HDMI 2.0 SCDC scrambling and high TMDS clock ratio.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_SCRAMBLER flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_scrambler_enable)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_scrambler_disable:
+	 *
+	 * Disable HDMI 2.0 SCDC scrambling and high TMDS clock ratio.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_SCRAMBLER flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_scrambler_disable)(struct drm_bridge *bridge);
+
 	/**
 	 * @hdmi_clear_avi_infoframe:
 	 *
@@ -1092,6 +1112,12 @@ enum drm_bridge_ops {
 	 * &drm_bridge_funcs->hdmi_clear_spd_infoframe callbacks.
 	 */
 	DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME = BIT(10),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_SCRAMBLER: The bridge supports
+	 * &drm_bridge_funcs->hdmi_scrambler_enable and
+	 * &drm_bridge_funcs->hdmi_scrambler_disable callbacks.
+	 */
+	DRM_BRIDGE_OP_HDMI_SCRAMBLER = BIT(11),
 };
 
 /**

-- 
2.53.0


