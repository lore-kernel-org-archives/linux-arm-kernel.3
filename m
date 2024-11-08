Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F76BD64078
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 18:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QL/32PC6uaHi9Smimrczu+nmFd3d+CE4gnoyWxD9FOk=; b=tFdFhdmE+rvVMHNYa+9JcLEeas
	2tCoALKNbiFQbcAHdsOV69YmgHAc9uuxrA+QQY2Q0OqNJf2JPfN3MPIjod1gY23bH8GhJYppiKFvF
	RQfH/YI15rBbr+LgkC1RRSjLJCTYWTsvq7QAHrQQfIfMsWugfJkBJldgIscIDnRz8SiZdPkamI++g
	OuAaArJtqEMSMLDH8S2bb/cPLwpShSSfB5rsGm2Md41qFZrBY5WT5lcLjypRR26l4NIpRqI6fHGkz
	pIU4b+Yb0ZYvA3Zew9iHkXkJ9HouMlSMlnJruW0X8jxHkO2gULqCn4XZM7ZvgDpPVVjsAlbWUSG4d
	H0hFqJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9U9R-0000000BfVj-2kNw;
	Fri, 08 Nov 2024 18:56:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9U5w-0000000BeVC-0MMw;
	Fri, 08 Nov 2024 18:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731091950;
	bh=zzcz+Stq2T7s9D0cmgD0YFLHantSHMsqXWl51R2tUCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hV6unLtfPWrM3YOLJ3wA7SThBaEEZQUBcI+28bEdF449hvRESbGdf/cxhSau/LDXj
	 U4PLuKGLJi5AVpr2RzIVKRlSMF68j4cN7NaM+WbdP3aoeW+M3fT51wYXmMJ/oYCCaI
	 OK0XQVfsVTlxDKS9QvhttqVeJTs20de7AdeynuA3pIQW/a1b1JAdSRFXGWT2/0fMUe
	 YjYiQxqZPToVWZwZhkp4BZLmYf4cWVpG8rG4O7yTjvKwQGRvo9mklMhmg2IuSnUYnh
	 VI8Ce4h/bSmBDVLl6xy3wjQ/YaiAks+iw2PzP+ztCv0poNFa02+85OBI84EudGSQQ9
	 aYrqnvPfdSGZg==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1CE817E376C;
	Fri,  8 Nov 2024 19:52:27 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stubner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 1/3] vop2: Add clock resets support
Date: Fri,  8 Nov 2024 13:50:39 -0500
Message-ID: <20241108185212.198603-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108185212.198603-1-detlev.casanova@collabora.com>
References: <20241108185212.198603-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_105232_292377_E3E31723 
X-CRM114-Status: GOOD (  18.06  )
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

At the end of initialization, each VP clock needs to be reset before
they can be used.

Failing to do so can put the VOP in an undefined state where the
generated HDMI signal is either lost or not matching the selected mode.

This issue can be reproduced by switching modes multiple times.
Depending on the setup, after about 10 mode switches, the signal will be
lost and the value in register 0x890 (VSYNCWIDTH + VFRONT) will take the value
`0x0000018c`.
That makes VSYNCWIDTH=0, which is wrong.

Adding the clock resets after the VOP configuration fixes the issue.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 9873172e3fd3..6122eb18e6c9 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/swab.h>
 
 #include <drm/drm.h>
@@ -157,6 +158,7 @@ struct vop2_win {
 struct vop2_video_port {
 	struct drm_crtc crtc;
 	struct vop2 *vop2;
+	struct reset_control *dclk_rst;
 	struct clk *dclk;
 	unsigned int id;
 	const struct vop2_video_port_data *data;
@@ -1917,6 +1919,26 @@ static int us_to_vertical_line(struct drm_display_mode *mode, int us)
 	return us * mode->clock / mode->htotal / 1000;
 }
 
+static int vop2_clk_reset(struct vop2_video_port *vp)
+{
+	struct reset_control *rstc = vp->dclk_rst;
+	struct vop2 *vop2 = vp->vop2;
+	int ret;
+
+	if (!rstc)
+		return 0;
+
+	ret = reset_control_assert(rstc);
+	if (ret < 0)
+		drm_warn(vop2->drm, "failed to assert reset\n");
+	udelay(10);
+	ret = reset_control_deassert(rstc);
+	if (ret < 0)
+		drm_warn(vop2->drm, "failed to deassert reset\n");
+
+	return ret;
+}
+
 static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
@@ -2057,6 +2079,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
 
+	vop2_clk_reset(vp);
+
 	drm_crtc_vblank_on(crtc);
 
 	vop2_unlock(vop2);
@@ -2708,6 +2732,12 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 		vp->data = vp_data;
 
 		snprintf(dclk_name, sizeof(dclk_name), "dclk_vp%d", vp->id);
+		vp->dclk_rst = devm_reset_control_get_optional(vop2->dev, dclk_name);
+		if (IS_ERR(vp->dclk_rst)) {
+		        drm_err(vop2->drm, "failed to get %s reset\n", dclk_name);
+		        return PTR_ERR(vp->dclk_rst);
+		}
+
 		vp->dclk = devm_clk_get(vop2->dev, dclk_name);
 		if (IS_ERR(vp->dclk)) {
 			drm_err(vop2->drm, "failed to get %s\n", dclk_name);
-- 
2.47.0


