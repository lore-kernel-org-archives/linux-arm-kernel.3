Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B3CC55171
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8cZLZ/OCsYUJxVNJFLWYh11+uZeY0MeQOMwNBRLy84=; b=weEtDEU5Q36N/5cIkO28/7GONs
	EfVmCS32cySulub3atmynu3EnetXI2JkI5SPgkBfIRIyKk6p97XrDiw7zxAvan2AXMcY3ytT0Ze6y
	bvOMKMveDjER5bSdfhkIVA/Eimmhbse9O3gBaxL51T3xaVM6rYBUK7WmRarklturokFzTR6V5RCNP
	ZpLscTyeOIB2oN1phfvHo8zVSj4ujCLqmOAmYpeOsq2H21byNqCeALnQHtZYudRdMKYS+1uMRP8eN
	jitG6TE25pP2oOpVSAe2gDoe5iZeo9LyG1L519gKUuBC1l9y5i2UOlab8tjYnglvHipl6VsEO9HK+
	JFnix0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq2e-0000000D5Rf-1i23;
	Fri, 31 Jul 2026 16:25:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxR-0000000Cz8R-2iDN;
	Fri, 31 Jul 2026 16:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514775;
	bh=8nvSV+nWPFUZXqT08BM59NFazu9V0O6/Yz51yOFt+3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qpc0N2qY9F96XlP1jiuBu23w9d7ybxKu1jufE0iVbV4zbVzIY2sN4E2fkMZ1E7Jvj
	 +Cd4fHq/Sh2k7ZM3aD3QF3dgNNnMesOrVP2DItVCEPHUsEmS9ZaDfFF/1Rklm7JzLp
	 ajrm1Dbcoh8fabQEyoISX0GNotZqhPQ6SrIPDWzsKeJ78QuPgOi7A/Txl9h+RIGczh
	 3YnaxaroHLPuXq9ELek0WqPJ2SrYK8AKJmXYKiqALJ2c65bjupWIkJOZ6lUWhSVxBI
	 +RqkAKltUhj0I8Dk5mp9eC349bG69lpkUZb/6MBNPMYfxmaA2b/d0RclpEdimrAfbX
	 +1a2BF+psXVSw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3C1817E095F;
	Fri, 31 Jul 2026 18:19:35 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:36 +0300
Subject: [PATCH v10 29/69] drm/rockchip: dw_hdmi_qp: Fix invalid drvdata
 access in PM ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-29-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091937_875179_8D2BCB42 
X-CRM114-Status: GOOD (  13.44  )
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

The system-sleep PM callbacks fetch the driver state via
dev_get_drvdata() and dereference it unconditionally.  However, the
platform device is bound by ->probe(), which merely registers a
component, hence the callbacks may well run when no valid state is
available:

- Before the aggregate driver calls ->bind(), e.g. when the system
  suspends while probing is still deferred waiting for the VOP,
  dev_get_drvdata() returns NULL.

- After ->unbind(), or when ->bind() fails past platform_set_drvdata(),
  drvdata is left pointing to memory obtained via drmm_kzalloc(), which
  is released together with the DRM device, while this platform device
  remains bound and PM-capable.

Publish the driver data only after ->bind() completes successfully, and
clear it in ->unbind().  This ensures that a non-NULL drvdata always
represents live state, allowing each PM callback to rely on a single
NULL check.

Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260702151550.8E14D1F000E9@smtp.kernel.org/
Closes: https://lore.kernel.org/all/20260723014811.1F9F01F000E9@smtp.kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 9c4cf68d79d5..646a4cb96830 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -683,8 +683,6 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (ret)
 		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder");
 
-	platform_set_drvdata(pdev, hdmi);
-
 	hdmi->hdmi = dw_hdmi_qp_bind(pdev, encoder, &plat_data);
 	if (IS_ERR(hdmi->hdmi))
 		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
@@ -695,6 +693,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
 				     "Failed to init bridge connector\n");
 
+	platform_set_drvdata(pdev, hdmi);
+
 	return 0;
 }
 
@@ -704,6 +704,8 @@ static void dw_hdmi_qp_rockchip_unbind(struct device *dev,
 {
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
 
+	dev_set_drvdata(dev, NULL);
+
 	cancel_delayed_work_sync(&hdmi->hpd_work);
 }
 
@@ -726,7 +728,8 @@ static int __maybe_unused dw_hdmi_qp_rockchip_suspend(struct device *dev)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
 
-	dw_hdmi_qp_suspend(dev, hdmi->hdmi);
+	if (hdmi)
+		dw_hdmi_qp_suspend(dev, hdmi->hdmi);
 
 	return 0;
 }
@@ -735,6 +738,9 @@ static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
 
+	if (!hdmi)
+		return 0;
+
 	hdmi->ctrl_ops->io_init(hdmi);
 
 	dw_hdmi_qp_resume(dev, hdmi->hdmi);

-- 
2.55.0


