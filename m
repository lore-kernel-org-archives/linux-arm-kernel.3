Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EB1C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 09:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qskhooki802SEg5SPMAHFjsKcAqNb0jah4o5ngCL/N8=; b=KnaVh54cTy5pOjc78i3ZGc5wVB
	qaHswc82oY7ej9WyfRvVSD8ldk8Epi/xM644Kvoz7KFlgOxOwqYxYJbqnq1843YxpK81UMoCoge0h
	flEUkkaWQ8IcSu4KiOQFuCfIJBXMio8cXgv7c1MloGbgHmvtttDNgqMeOO7ZckGa0TnKVDKEouQzK
	z/jPkHFF//8jIzEUdq/pY+Zu6vTiUkS3IcFo5r5Guo5qlwWClD2skE32DRDb817zUttCFsCxeDKu+
	p0DFgWfVFFCHc5S6G04tSAnYo6YPrDsotz92cqbxHzlwJLCHiSeNR+KQHPk8MXgdsCILuxKv4WY0b
	q/6Hh2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm8Rv-0000000An0f-1AP8;
	Sun, 23 Feb 2025 09:38:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm8Lm-0000000Alhl-2Co0;
	Sun, 23 Feb 2025 09:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740303155;
	bh=PEU6ikhVTWTxbi9wgL9WnhXL5oGGC62yON8INrvf3aM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FnlslSkNQOU8Cce7Q5/1VCuW0wNh42pLw4bcbsiiBOCfhlruauhv1fVOIjCWcYEfE
	 wLgYR7jOmQZ1EUzTGTaXFxT8jqLpjcAwPVKBXE7wnAplFlxBBKB9fouqruTPRbBOJa
	 I7Wlg3uOPNMXPMv+3ujzFY5cy53sVPvdrwUTQ39BehSDqumRCExLI5YaUlMpVpOzov
	 /rdNkU4dwTUVWdZtm83BwIWLCd7LZPM0woTihwRRFQPAtKEG9TAwRHymN5pgK7gfeK
	 dpescf6Ky3S1aMl55ZIr9rQtnTQ8oEQZtMfL9wWw7OJHfKjOAL2HZ59UV+K0+ZDbLb
	 ZHpCxcW8ViYBA==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 9455317E087E;
	Sun, 23 Feb 2025 10:32:35 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 23 Feb 2025 11:31:38 +0200
Subject: [PATCH v2 2/5] drm/rockchip: vop2: Consistently use
 dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-vop2-hdmi1-disp-modes-v2-2-f4cec5e06fbe@collabora.com>
References: <20250223-vop2-hdmi1-disp-modes-v2-0-f4cec5e06fbe@collabora.com>
In-Reply-To: <20250223-vop2-hdmi1-disp-modes-v2-0-f4cec5e06fbe@collabora.com>
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
X-CRM114-CacheID: sfid-20250223_013238_744028_8D97006B 
X-CRM114-Status: GOOD (  11.26  )
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

Replace drm_err() calls in vop2_bind() and vop2_create_crtcs() with
dev_err_probe(), to simplify error handling and improve consistency.

Additionally, ensure the already existing dev_err_probe() invocations
pass drm->dev instead of dev as their first argument, so that we get the
actual reason in case of -EPROBE_DEFER errors:

  platform display-subsystem: deferred probe pending: (reason unknown)
    vs.
  platform display-subsystem: deferred probe pending: rockchip-drm: <actual reason>

While at it, add the missing '\n' to some of the message strings.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 83 +++++++++++++---------------
 1 file changed, 37 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 14e039e9143ab855f32c392c5b097b97bcba70b8..7b893b4447b6015c440790614c1fdeba967e8395 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -3273,10 +3273,9 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 
 		snprintf(dclk_name, sizeof(dclk_name), "dclk_vp%d", vp->id);
 		vp->dclk = devm_clk_get(vop2->dev, dclk_name);
-		if (IS_ERR(vp->dclk)) {
-			drm_err(vop2->drm, "failed to get %s\n", dclk_name);
-			return PTR_ERR(vp->dclk);
-		}
+		if (IS_ERR(vp->dclk))
+			return dev_err_probe(drm->dev, PTR_ERR(vp->dclk),
+					     "failed to get %s\n", dclk_name);
 
 		np = of_graph_get_remote_node(dev->of_node, i, -1);
 		if (!np) {
@@ -3286,11 +3285,9 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 		of_node_put(np);
 
 		port = of_graph_get_port_by_id(dev->of_node, i);
-		if (!port) {
-			drm_err(vop2->drm, "no port node found for video_port%d\n", i);
-			return -ENOENT;
-		}
-
+		if (!port)
+			return dev_err_probe(drm->dev, -ENOENT,
+					     "no port node found for video_port%d\n", i);
 		vp->crtc.port = port;
 		nvps++;
 	}
@@ -3330,11 +3327,9 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 			possible_crtcs = (1 << nvps) - 1;
 
 		ret = vop2_plane_init(vop2, win, possible_crtcs);
-		if (ret) {
-			drm_err(vop2->drm, "failed to init plane %s: %d\n",
-				win->data->name, ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(drm->dev, ret, "failed to init plane %s\n",
+					     win->data->name);
 	}
 
 	for (i = 0; i < vop2_data->nr_vps; i++) {
@@ -3348,10 +3343,9 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 		ret = drm_crtc_init_with_planes(drm, &vp->crtc, plane, NULL,
 						&vop2_crtc_funcs,
 						"video_port%d", vp->id);
-		if (ret) {
-			drm_err(vop2->drm, "crtc init for video_port%d failed\n", i);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(drm->dev, ret,
+					     "crtc init for video_port%d failed\n", i);
 
 		drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
 		if (vop2->lut_regs) {
@@ -3678,10 +3672,9 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	dev_set_drvdata(dev, vop2);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vop");
-	if (!res) {
-		drm_err(vop2->drm, "failed to get vop2 register byname\n");
-		return -EINVAL;
-	}
+	if (!res)
+		return dev_err_probe(drm->dev, -EINVAL,
+				     "failed to get vop2 register byname\n");
 
 	vop2->res = res;
 	vop2->regs = devm_ioremap_resource(dev, res);
@@ -3706,50 +3699,50 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	if (vop2_data->feature & VOP2_FEATURE_HAS_SYS_GRF) {
 		vop2->sys_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
 		if (IS_ERR(vop2->sys_grf))
-			return dev_err_probe(dev, PTR_ERR(vop2->sys_grf), "cannot get sys_grf");
+			return dev_err_probe(drm->dev, PTR_ERR(vop2->sys_grf),
+					     "cannot get sys_grf\n");
 	}
 
 	if (vop2_data->feature & VOP2_FEATURE_HAS_VOP_GRF) {
 		vop2->vop_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,vop-grf");
 		if (IS_ERR(vop2->vop_grf))
-			return dev_err_probe(dev, PTR_ERR(vop2->vop_grf), "cannot get vop_grf");
+			return dev_err_probe(drm->dev, PTR_ERR(vop2->vop_grf),
+					     "cannot get vop_grf\n");
 	}
 
 	if (vop2_data->feature & VOP2_FEATURE_HAS_VO1_GRF) {
 		vop2->vo1_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,vo1-grf");
 		if (IS_ERR(vop2->vo1_grf))
-			return dev_err_probe(dev, PTR_ERR(vop2->vo1_grf), "cannot get vo1_grf");
+			return dev_err_probe(drm->dev, PTR_ERR(vop2->vo1_grf),
+					     "cannot get vo1_grf\n");
 	}
 
 	if (vop2_data->feature & VOP2_FEATURE_HAS_SYS_PMU) {
 		vop2->sys_pmu = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,pmu");
 		if (IS_ERR(vop2->sys_pmu))
-			return dev_err_probe(dev, PTR_ERR(vop2->sys_pmu), "cannot get sys_pmu");
+			return dev_err_probe(drm->dev, PTR_ERR(vop2->sys_pmu),
+					     "cannot get sys_pmu\n");
 	}
 
 	vop2->hclk = devm_clk_get(vop2->dev, "hclk");
-	if (IS_ERR(vop2->hclk)) {
-		drm_err(vop2->drm, "failed to get hclk source\n");
-		return PTR_ERR(vop2->hclk);
-	}
+	if (IS_ERR(vop2->hclk))
+		return dev_err_probe(drm->dev, PTR_ERR(vop2->hclk),
+				     "failed to get hclk source\n");
 
 	vop2->aclk = devm_clk_get(vop2->dev, "aclk");
-	if (IS_ERR(vop2->aclk)) {
-		drm_err(vop2->drm, "failed to get aclk source\n");
-		return PTR_ERR(vop2->aclk);
-	}
+	if (IS_ERR(vop2->aclk))
+		return dev_err_probe(drm->dev, PTR_ERR(vop2->aclk),
+				     "failed to get aclk source\n");
 
 	vop2->pclk = devm_clk_get_optional(vop2->dev, "pclk_vop");
-	if (IS_ERR(vop2->pclk)) {
-		drm_err(vop2->drm, "failed to get pclk source\n");
-		return PTR_ERR(vop2->pclk);
-	}
+	if (IS_ERR(vop2->pclk))
+		return dev_err_probe(drm->dev, PTR_ERR(vop2->pclk),
+				     "failed to get pclk source\n");
 
 	vop2->pll_hdmiphy0 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy0");
-	if (IS_ERR(vop2->pll_hdmiphy0)) {
-		drm_err(vop2->drm, "failed to get pll_hdmiphy0\n");
-		return PTR_ERR(vop2->pll_hdmiphy0);
-	}
+	if (IS_ERR(vop2->pll_hdmiphy0))
+		return dev_err_probe(drm->dev, PTR_ERR(vop2->pll_hdmiphy0),
+				     "failed to get pll_hdmiphy0\n");
 
 	vop2->pll_hdmiphy1 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");
 	if (IS_ERR(vop2->pll_hdmiphy1))
@@ -3757,10 +3750,8 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 				     "failed to get pll_hdmiphy1\n");
 
 	vop2->irq = platform_get_irq(pdev, 0);
-	if (vop2->irq < 0) {
-		drm_err(vop2->drm, "cannot find irq for vop2\n");
-		return vop2->irq;
-	}
+	if (vop2->irq < 0)
+		return dev_err_probe(drm->dev, vop2->irq, "cannot find irq for vop2\n");
 
 	mutex_init(&vop2->vop2_lock);
 

-- 
2.48.1


