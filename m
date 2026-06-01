Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54F4CD6E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUDw1cyvGGYODQq+pblBLPiC4fmbulp7UQNkgPc+R9g=; b=p+4Pz5ssY2u/lgETKtogx3zxl1
	wzWgAT+GtjmPf9EsbSxHCEyQT46Dfep73u3hyBeEUgW2tF8TUMmN/vWxHo2ibuPFVTXDspF04Qs3w
	NBkeDVSw5kgnrUU+dmMk9KzyZXdtyug3Udezc1SZaOIKZsPUJs4AuacQBHt/ctolRPOSUPra70eW3
	MqQFFJ4xTq0ErdsoJHsXbuWc3koDCF2ZWDWi6aqqQ2u+//pNEeN2+7mNyStd/jgw1cM6T/0FSRjZA
	iZcW1Cm9499c6434+AT2JfbgIJJ7kfkVQEuKPOG0tcWkWzaflCXX7nc9B52c7K+2Tqc5348Q2jJEg
	zUlbre4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBNt-0000000ByJR-34FI;
	Mon, 01 Jun 2026 22:45:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBNm-0000000By3Q-2sbF;
	Mon, 01 Jun 2026 22:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780353916;
	bh=rkG/NccXaoj6+7q2G/t0c8xMi4deZ8qzhUuGLVQWl5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d0XnKuj3c+/bq3TfoRP+um/OqXLU/PoIHK9LsHo1lWiAqrmAbTRXXISHQAq1cPggu
	 okXB/g+bPunyACSV9M0gkkNvQuIJGfVKC2kwV8XvBo8UdpNn5rLE0dPyxE0bXvJPIW
	 ScWp/GJK7fgJMYxYe+k3fLfYWMppncVu/K6ALt38ezCRrkKcp8pcEC7wq47LBA2i4K
	 JUCMK1ONHEj71ETy/ZFbcKuKL72/A0uw93L9Lv9gFetNvRTB2HGI4X6HfHNiZ9NS5D
	 F8cVwx2mNoizrzdoreu3BWFhFCzliXoSiN4ipk1aHUTv1oofGdT0BWb2L6Bh/kBwEJ
	 cgzzhbOOA4XjA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 464B017E0C93;
	Tue,  2 Jun 2026 00:45:16 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Jun 2026 01:44:08 +0300
Subject: [PATCH v7 08/30] drm/bridge: Add HDMI 2.0 scrambler bridge
 operation and callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dw-hdmi-qp-scramb-v7-8-445eb54ee1ed@collabora.com>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_154519_020643_4629EC91 
X-CRM114-Status: GOOD (  10.45  )
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

Bridge drivers are expected to set DRM_BRIDGE_OP_HDMI_SCRAMBLER to
advertise that they implement source-side scrambling control, which the
bridge connector layer uses to wire up the connector's scrambler
callbacks.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/drm/drm_bridge.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4ba3a5deef9a..f36e1e71aa86 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -667,6 +667,26 @@ struct drm_bridge_funcs {
 				     const struct drm_display_mode *mode,
 				     unsigned long long tmds_rate);
 
+	/**
+	 * @hdmi_scrambler_enable:
+	 *
+	 * Enable source-side HDMI 2.0 scrambling and high TMDS clock ratio.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_SCRAMBLER flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_scrambler_enable)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_scrambler_disable:
+	 *
+	 * Disable source-side HDMI 2.0 scrambling and high TMDS clock ratio.
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
2.54.0


