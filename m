Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA08C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 00:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dra8FZbVQU/agiPNstbzAA8SoAxGpG06x1h85y8SBBo=; b=AbqqYYEoEQTTXHvgWZZegH+j7O
	hhmsgQM8h6BbnjQJIMQ6nR/T/w0nTvE4KejSwEU/SEDa/HxpP4gId3J+F4Cl6cDvF1npsdBvrNPq7
	rh/+nlcpIIUNskdoFWOdUyty2MYebcuYX9g9AizymkLhZcfhsAa6qTTCbRNgpUcg2Im6ryOU45x3w
	9hQz/P1f2YCydkJmhNh6FJwo6vGRQMFJ6GHL0E7KELkEmODGJ1bwFSVTEILVKyS+mTQu6ZWWqRJ7V
	2oChj8iLDex02vC7l+ki5wiNQdtTNKePnmjOODv3e0lHlfVbwBgh8Bk7FCLsB91+HSDd99+r0G8rN
	s52qVt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6WE-0000000Gfq0-4ALE;
	Sat, 15 Feb 2025 00:58:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6TM-0000000Gf1v-3syB;
	Sat, 15 Feb 2025 00:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739580955;
	bh=g4ZiNjBB56+mnqDk9Mu4uIOUw/V5PSViIE9EHg+P5Ss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pjmbm3Wg1oS7pYIFqz84AP0iP/Y3H9SiuKck4O7M+cykW0FWNskBKIlbXeSKER3MP
	 cLDu5/Ujwfub5TR9NVnxISKz3jzh7/GbLmCQCEqycPR9r3QIqM2WDDg9Xk1GhCNJxa
	 VRRWQi8cPmMMjz7fIMtEUc6a5gmKQ7R+XEbKYd4a9v7HVZafF00FwMcL0r2iLLxojg
	 lf1RCv+55HHXjOCQfX48N8H4jYqccOV1xJFDv851ZalDN20ueVfQPG1QHZdDnwP0Gv
	 EvvL64pqURZVMLbfcnK9nCpIPciz0gCHtu0qVI4pV8lBuAaMdy5so2lObCo13JG05c
	 xDq86Gt4yNfJg==
Received: from localhost (144.232.221.87.dynamic.jazztel.es [87.221.232.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C4D1D17E0E95;
	Sat, 15 Feb 2025 01:55:54 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 15 Feb 2025 02:55:37 +0200
Subject: [PATCH 1/4] drm/rockchip: vop2: Improve display modes handling on
 RK3588 HDMI1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-vop2-hdmi1-disp-modes-v1-1-81962a7151d6@collabora.com>
References: <20250215-vop2-hdmi1-disp-modes-v1-0-81962a7151d6@collabora.com>
In-Reply-To: <20250215-vop2-hdmi1-disp-modes-v1-0-81962a7151d6@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_165557_115580_2CE04488 
X-CRM114-Status: GOOD (  16.19  )
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

The RK3588 specific implementation is currently quite limited in terms
of handling the full range of display modes supported by the connected
screens, e.g. 2560x1440@75Hz, 2048x1152@60Hz, 1024x768@60Hz are just a
few of them.

Additionally, it doesn't cope well with non-integer refresh rates like
59.94, 29.97, 23.98, etc.

Make use of HDMI1 PHY PLL as a more accurate DCLK source to handle
all display modes up to 4K@60Hz.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index afc946ead87091373605e59dbca281a9e91bea57..f1700b2fabf0b0d000cf3c9cf5f06ca791b87499 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -216,6 +216,7 @@ struct vop2 {
 	struct clk *aclk;
 	struct clk *pclk;
 	struct clk *pll_hdmiphy0;
+	struct clk *pll_hdmiphy1;
 
 	/* optional internal rgb encoder */
 	struct rockchip_rgb *rgb;
@@ -2270,11 +2271,14 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * Switch to HDMI PHY PLL as DCLK source for display modes up
 	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
 	 */
-	if (vop2->pll_hdmiphy0 && clock <= VOP2_MAX_DCLK_RATE) {
+	if ((vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) && clock <= VOP2_MAX_DCLK_RATE) {
 		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
 			struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
 
 			if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI0) {
+				if (!vop2->pll_hdmiphy0)
+					break;
+
 				if (!vp->dclk_src)
 					vp->dclk_src = clk_get_parent(vp->dclk);
 
@@ -2284,6 +2288,20 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 						 "Could not switch to HDMI0 PHY PLL: %d\n", ret);
 				break;
 			}
+
+			if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI1) {
+				if (!vop2->pll_hdmiphy1)
+					break;
+
+				if (!vp->dclk_src)
+					vp->dclk_src = clk_get_parent(vp->dclk);
+
+				ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy1);
+				if (ret < 0)
+					drm_warn(vop2->drm,
+						 "Could not switch to HDMI1 PHY PLL: %d\n", ret);
+				break;
+			}
 		}
 	}
 
@@ -3733,6 +3751,12 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(vop2->pll_hdmiphy0);
 	}
 
+	vop2->pll_hdmiphy1 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");
+	if (IS_ERR(vop2->pll_hdmiphy1)) {
+		drm_err(vop2->drm, "failed to get pll_hdmiphy1\n");
+		return PTR_ERR(vop2->pll_hdmiphy1);
+	}
+
 	vop2->irq = platform_get_irq(pdev, 0);
 	if (vop2->irq < 0) {
 		drm_err(vop2->drm, "cannot find irq for vop2\n");

-- 
2.48.1


