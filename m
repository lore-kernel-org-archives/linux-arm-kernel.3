Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BE8C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEyCFaL45TxXY4zYPJLNwlazSO6MkQ+RjvLgoUEO6hI=; b=qnRchfMOnzXgQeMBzIsW0lC6qP
	03HVux7j8CfqvUMS1rHmxCO0miavzwquIMb0cuEP5mhW2pr3gtbbZyTmX10pad1oMGSaky06OETqS
	mugsbTLZS0orroErbfW0OSM9Ch7W1ozDY9lfz3FhgAkHaJuVLEen8dXsEo8FvZjlYQet9Xe2PIE1Z
	KkyIFCRSJbiFC5Cd+23PxrB+fnKZPVdWaq6I2tm9fNLhBam2jqS2FOY7YLUBuIJ5GIDCCaovlVGP4
	gaS0QaO52BrLOjRfbLnMW6u9CMeQkPYq7cHXCsagMxMg/Sxjs+AXiuLA8gM7bJdPqWztiByd8Hgc4
	r0RMjpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgp3d-0000000DRNt-43x2;
	Mon, 06 Jul 2026 19:32:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgp3X-0000000DREn-3YBg;
	Mon, 06 Jul 2026 19:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783366356;
	bh=kMCGGS6kz/DiDvHsBSJSsbUWHK6mdQmi8qiyJCkMFcY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TubqFcPTsUBFCgRivHrU2fz82lPzvG5GqvcBUELgi1KNi/QDBiUaHu+w85KPmpDuq
	 cUy0u1aWWos1q/x1842F9jBiK0PF9eVR5PlR8vNRQmOUBQ9c45Q0iUbbijOs+op+Cc
	 PjWM4lviCLqsMAAglQp74/lKXQ7Jg1vaIFqifjI2ZGReLnlke0ro4v26qQ0cD0EqZL
	 35+wFk20fg4lyZhmfPQ2V2XayWj8RmBV0kzTNUiusrV5S+xe5SpUe3ca6VCA7wLP/P
	 ybXa+ZZFPgkCVDevsj50zGJl+fW/EwPoptg9DyGoQ/rFFmawmWraS9wJuAFYp1QkvU
	 fj2x5Nr5DkFcw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C37B17E0E95;
	Mon, 06 Jul 2026 21:32:36 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 06 Jul 2026 22:32:16 +0300
Subject: [PATCH v2 04/13] drm/rockchip: vop2: Avoid division by zero when
 computing max_dclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dw-hdmi-qp-yuv-v2-4-b91beb33dedf@collabora.com>
References: <20260706-dw-hdmi-qp-yuv-v2-0-b91beb33dedf@collabora.com>
In-Reply-To: <20260706-dw-hdmi-qp-yuv-v2-0-b91beb33dedf@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_123240_082040_AC02FBC7 
X-CRM114-Status: GOOD (  13.20  )
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

The DCLK reparenting logic in vop2_crtc_atomic_enable() is gated only on
the presence of an HDMI PHY PLL on the SoC.

This condition is true on any board that wires up an HDMI PHY, even when
the CRTC is currently driving a non-HDMI output such as DSI or LVDS.
Those encoders do not set vcstate->output_bpc, so it stays 0, hence the
subsequent DIV_ROUND_CLOSEST_ULL() then divides by zero.

Note this division happens before the drm_for_each_encoder_mask() loop
that would establish whether the pipe is actually driven by HDMI, so the
loop provides no protection.

Default bpc to 8 when it would otherwise be 0.  The resulting max_dclk
value is a don't-care on the non-HDMI paths that trigger this, since the
encoder loop will not select the PHY PLL as the DCLK source there.

Fixes: b0362c45c401 ("drm/rockchip: vop2: Check bpc before switching DCLK source")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260623203310.9F8C81F000E9@smtp.kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index c2328b35466d..e966c0a0266e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1920,8 +1920,9 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
 	 */
 	if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
-		unsigned long max_dclk = DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * 8,
-							       vcstate->output_bpc);
+		unsigned int bpc = vcstate->output_bpc ?: 8;
+		unsigned long max_dclk = DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * 8, bpc);
+
 		if (clock <= max_dclk) {
 			drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
 				struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);

-- 
2.54.0


