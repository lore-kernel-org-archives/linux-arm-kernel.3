Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1827C02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tu4HFQPiOFgWVQtJahlkLdDjJBgDhw1KdMjfjbpq30=; b=zbkPy4bz46zJnDBLw9GpfP8mo2
	O1glR5+oThyDv7mOMS2w7VFtC5BIU44iv4v//7WIpmPNMRrqtT3uGvSd4mWWTKNblC+b+VpOD5khC
	Etaft+ydxGwRRDXQKuXwq/HIcJZn+BbHyKgKA2DDyyzz/ZPkoWkuHb3rZC9IS89cEYy/eCHyEIeoJ
	rkdFfS315ctrFRq+QOBFclbYJzgBJFEV6Rf45SBk+8iRR+RNlT2/hR7ekQFQh6rTZioPj6qUl0jkS
	gLRgcEHflbOCz1jN1pn0u/gh6/wnC9ORHaAi6KDuLk17ZJzdFO5vqubvrZAXXjmT86ofDzXoEGSqU
	B8K3EVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfJFY-00000000ZEL-0WVR;
	Tue, 04 Feb 2025 13:46:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIDy-00000000RgE-2g7B;
	Tue, 04 Feb 2025 12:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738672816;
	bh=E2DH134eg3qKxsbKhKobxdsTu3LZxl7lb6JGqVi8yCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bn8Z63OXMcU+BHS3oATHsShK7+1fYGiTmEWhw0sIyFXu3tG5BsDMsTL765PwM0UID
	 M+3PVgTimXE5xtyKwx2CxyX4MsfB12Oj5T/5elvfSwF4QYgXZraEEDrbDZvGAYeuCL
	 lA8DN+PG/Z6rBaN3e4zdlEj0jPh6l11ETEI9lrFY1/PxePllTiyl6O3g3VLjfRT+Lz
	 SLqnV82FC7Pib/z2M19OVUiF1l75m2svv6mF4aaVzrz8pbPYL7KUjeR9QdZyTfJxQp
	 4lN6LLiyjd/tRs5TfF0Wg72dExS4JnO9TOY3nP+S3xkNxvQvCFUVIcjhmrvj9LbvN0
	 j3LkGMkxgjT/Q==
Received: from localhost (unknown [188.27.43.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id A514F17E1519;
	Tue,  4 Feb 2025 13:40:16 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 04 Feb 2025 14:40:06 +0200
Subject: [PATCH v3 3/5] drm/rockchip: vop2: Improve display modes handling
 on RK3588 HDMI0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-vop2-hdmi0-disp-modes-v3-3-d71c6a196e58@collabora.com>
References: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
In-Reply-To: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 FUKAUMI Naoki <naoki@radxa.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_044018_863872_9267B972 
X-CRM114-Status: GOOD (  15.71  )
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

Make use of HDMI0 PHY PLL as a more accurate DCLK source to handle
all display modes up to 4K@60Hz.

Tested-by: FUKAUMI Naoki <naoki@radxa.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 2455d4a55abd6751d54b7c6ecad3dda8a614bd36..afc946ead87091373605e59dbca281a9e91bea57 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -159,6 +159,7 @@ struct vop2_video_port {
 	struct drm_crtc crtc;
 	struct vop2 *vop2;
 	struct clk *dclk;
+	struct clk *dclk_src;
 	unsigned int id;
 	const struct vop2_video_port_data *data;
 
@@ -214,6 +215,7 @@ struct vop2 {
 	struct clk *hclk;
 	struct clk *aclk;
 	struct clk *pclk;
+	struct clk *pll_hdmiphy0;
 
 	/* optional internal rgb encoder */
 	struct rockchip_rgb *rgb;
@@ -222,6 +224,8 @@ struct vop2 {
 	struct vop2_win win[];
 };
 
+#define VOP2_MAX_DCLK_RATE		600000000
+
 #define vop2_output_if_is_hdmi(x)	((x) == ROCKCHIP_VOP2_EP_HDMI0 || \
 					 (x) == ROCKCHIP_VOP2_EP_HDMI1)
 
@@ -1155,6 +1159,9 @@ static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	vop2_crtc_disable_irq(vp, VP_INT_DSP_HOLD_VALID);
 
+	if (vp->dclk_src)
+		clk_set_parent(vp->dclk, vp->dclk_src);
+
 	clk_disable_unprepare(vp->dclk);
 
 	vop2->enable_count--;
@@ -2259,6 +2266,27 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	vop2_vp_write(vp, RK3568_VP_MIPI_CTRL, 0);
 
+	/*
+	 * Switch to HDMI PHY PLL as DCLK source for display modes up
+	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
+	 */
+	if (vop2->pll_hdmiphy0 && clock <= VOP2_MAX_DCLK_RATE) {
+		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
+			struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
+
+			if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI0) {
+				if (!vp->dclk_src)
+					vp->dclk_src = clk_get_parent(vp->dclk);
+
+				ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
+				if (ret < 0)
+					drm_warn(vop2->drm,
+						 "Could not switch to HDMI0 PHY PLL: %d\n", ret);
+				break;
+			}
+		}
+	}
+
 	clk_set_rate(vp->dclk, clock);
 
 	vop2_post_config(crtc);
@@ -3699,6 +3727,12 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(vop2->pclk);
 	}
 
+	vop2->pll_hdmiphy0 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy0");
+	if (IS_ERR(vop2->pll_hdmiphy0)) {
+		drm_err(vop2->drm, "failed to get pll_hdmiphy0\n");
+		return PTR_ERR(vop2->pll_hdmiphy0);
+	}
+
 	vop2->irq = platform_get_irq(pdev, 0);
 	if (vop2->irq < 0) {
 		drm_err(vop2->drm, "cannot find irq for vop2\n");

-- 
2.48.1


