Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DE2C982DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwRcmm9NrSCUGFbOU3+7LvNAX32yL65spDGl9sINEr4=; b=EVPz8cAEfQphWAlWBOl2B6o36u
	El1Js5wU9c75DecpkMom0SiSOS7mfBFFMXWpeVJ+D/xTDPurt/k0qJWGMaRUUg4Cv1WfDD0WFaRcI
	eJJsnG7TVE9liVC+FNI/l7KEik2ZSJKFQYHqFaOnm0KmHRa0bTwTUAfoYwcesG/DMuL9zAuZ9+zC1
	mRGoc+mgkwuEs+sfY2b6Q7s5LThcOvgMwSScS8GRGtZ3UmVwkjAKSSrfcwiFqNxCJn94yjhis8AYB
	0KHXXJJSGbt2Oa/8kXT9tjn+Mutr52WxE8EjxkvJAtXWSyB6GzShk4CeWo4Jj+MPWBTorLiD+Ca4r
	y+hOLVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnEZ-0000000EWbT-3v8x;
	Fri, 16 Jan 2026 17:03:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnET-0000000EWRz-0WFy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:03:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6A7521A28DF;
	Fri, 16 Jan 2026 17:03:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32FEC606F9;
	Fri, 16 Jan 2026 17:03:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5566310B68C92;
	Fri, 16 Jan 2026 18:03:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768583009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IwRcmm9NrSCUGFbOU3+7LvNAX32yL65spDGl9sINEr4=;
	b=Bs0LScOI+ZQ+kJZhxCj/2rpwhmT+SqXuvK4PCZ476dOZWBb22GW0zHen8x3ESIYAdGcdZs
	EXSSfQSpVFsbCgIz/dTq9ncWu7fGZ2gfmZDbCh1mYoBaHQIy14OwERE1Fj9fY6lY/MDYgy
	kfjHRNDrg4XC+07AdhfhapKduaBZaBlvKLaqdyNZ2IifAe9UTNQ5pMoHjtS5uLY9Gfveto
	lvQqHMjPtMwS5bp4RDvBZ2iGQGjpf6gMeFzhroQ2PgmG7YfFyubOK+JsgvVufeEDG2qwA4
	TYpFErwzJityUV2Mbr8jRweKVNBYUnh11jP0xe4RjgqtpTTCN3oMqssUWsYC6g==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:16 +0100
Subject: [PATCH v4 16/25] drm/tilcdc: Modernize driver initialization and
 cleanup paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-16-2c1c22143087@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_090333_340608_3CFB187C 
X-CRM114-Status: GOOD (  19.89  )
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

Refactor the driver initialization to use modern DRM managed resource
APIs, simplifying the code.

The tilcdc_init and tilcdc_fini wrapper functions are removed since they
served no purpose after the component framework was eliminated. Their
logic is integrated directly into probe and remove.

Key changes:
- Use devm_drm_dev_alloc() instead of drm_dev_alloc().
- Use drmm_mode_config_init() instead of drm_mode_config_init().
- Align the remove path with the probe error path to ensure consistent
  cleanup ordering in both success and failure cases.
- Adjust platform_set_drvdata() to store the private structure instead
  of the drm_device, matching the new allocation pattern.

These changes reduce error-prone code while maintaining the same
functional behavior.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v3:
- Split the patch between code move and cleanup for better diff
  readibility.
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 100 ++++++++++++------------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h |   2 +
 2 files changed, 35 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index abe432b752dc0..2f35075b663ff 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -259,68 +259,33 @@ static int tilcdc_pm_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tilcdc_pm_ops,
 				tilcdc_pm_suspend, tilcdc_pm_resume);
 
-static void tilcdc_fini(struct drm_device *dev)
-{
-	struct tilcdc_drm_private *priv = dev->dev_private;
-
-#ifdef CONFIG_CPU_FREQ
-	if (priv->freq_transition.notifier_call)
-		cpufreq_unregister_notifier(&priv->freq_transition,
-					    CPUFREQ_TRANSITION_NOTIFIER);
-#endif
-
-	if (priv->crtc)
-		tilcdc_crtc_shutdown(priv->crtc);
-
-	drm_dev_unregister(dev);
-
-	drm_kms_helper_poll_fini(dev);
-	drm_atomic_helper_shutdown(dev);
-	tilcdc_irq_uninstall(dev);
-	drm_mode_config_cleanup(dev);
-
-	if (priv->clk)
-		clk_put(priv->clk);
-
-	if (priv->wq)
-		destroy_workqueue(priv->wq);
-
-	dev->dev_private = NULL;
-
-	pm_runtime_disable(dev->dev);
-
-	drm_dev_put(dev);
-}
-
-static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
+static int tilcdc_pdev_probe(struct platform_device *pdev)
 {
-	struct drm_device *ddev;
-	struct platform_device *pdev = to_platform_device(dev);
-	struct device_node *node = dev->of_node;
+	struct device_node *node = pdev->dev.of_node;
 	struct tilcdc_drm_private *priv;
+	struct device *dev = &pdev->dev;
 	enum tilcdc_variant variant;
+	struct drm_device *ddev;
 	u32 bpp = 0;
 	int ret;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	ddev = drm_dev_alloc(ddrv, dev);
-	if (IS_ERR(ddev))
-		return PTR_ERR(ddev);
+	priv = devm_drm_dev_alloc(dev, &tilcdc_driver,
+				  struct tilcdc_drm_private, ddev);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	variant = (uintptr_t)of_device_get_match_data(dev);
 
 	ddev->dev_private = priv;
-	platform_set_drvdata(pdev, ddev);
-	drm_mode_config_init(ddev);
+	platform_set_drvdata(pdev, priv);
+	ddev = &priv->ddev;
+	ret = drmm_mode_config_init(ddev);
+	if (ret)
+		return ret;
 
 	priv->wq = alloc_ordered_workqueue("tilcdc", 0);
-	if (!priv->wq) {
-		ret = -ENOMEM;
-		goto put_drm;
-	}
+	if (!priv->wq)
+		return -ENOMEM;
 
 	priv->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->mmio)) {
@@ -486,33 +451,34 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	clk_put(priv->clk);
 free_wq:
 	destroy_workqueue(priv->wq);
-put_drm:
-	platform_set_drvdata(pdev, NULL);
-	ddev->dev_private = NULL;
-	drm_dev_put(ddev);
 
 	return ret;
 }
 
-static int tilcdc_pdev_probe(struct platform_device *pdev)
-{
-	/* bail out early if no DT data: */
-	if (!pdev->dev.of_node) {
-		dev_err(&pdev->dev, "device-tree data is missing\n");
-		return -ENXIO;
-	}
-
-	return tilcdc_init(&tilcdc_driver, &pdev->dev);
-}
-
 static void tilcdc_pdev_remove(struct platform_device *pdev)
 {
-	tilcdc_fini(platform_get_drvdata(pdev));
+	struct tilcdc_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = &priv->ddev;
+
+	drm_dev_unregister(ddev);
+	drm_kms_helper_poll_fini(ddev);
+	tilcdc_irq_uninstall(ddev);
+#ifdef CONFIG_CPU_FREQ
+	cpufreq_unregister_notifier(&priv->freq_transition,
+				    CPUFREQ_TRANSITION_NOTIFIER);
+#endif
+	tilcdc_crtc_destroy(priv->crtc);
+	pm_runtime_disable(&pdev->dev);
+	clk_put(priv->clk);
+	destroy_workqueue(priv->wq);
 }
 
 static void tilcdc_pdev_shutdown(struct platform_device *pdev)
 {
-	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+	struct tilcdc_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = &priv->ddev;
+
+	drm_atomic_helper_shutdown(ddev);
 }
 
 static const struct of_device_id tilcdc_of_match[] = {
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 60e85e29b1063..e3d04a3eb25b4 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -48,6 +48,8 @@ struct tilcdc_drm_private {
 
 	unsigned int irq;
 
+	struct drm_device ddev;
+
 	/* don't attempt resolutions w/ higher W * H * Hz: */
 	uint32_t max_bandwidth;
 	/*

-- 
2.43.0


