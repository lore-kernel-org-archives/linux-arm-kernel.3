Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E62C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKCI0reJ/oj5oo+Sf+pqq/RsIYaaPsik8KxaeLgd3HA=; b=nYIdS3Bx6FsiejeZNM5o0JY2h6
	7pvOMQZkLitj5U0Bxvnw9SCb9Xnfh33uM2QfHlLzpFTk6zJVM/pC2BZVsDnzwp3Urpuw6PnCK4Ikm
	tnHBqDVJTXBlxiox1V6EuWz1Pn+VjS1wtabx6tMc0j0XcmE4hUnzG0Fl5KWSB//41OU4BCi3/ZVVk
	+qlzsxADmd41sJP9d6T1ml3CiP9RECH76fse11sCaiH7kGkk8LvvrQfz9EFS+Y4vViJKYYNuGKLCs
	wutGvKKkeQfaKpECQJd0YDF2DFXLtCAvIpgLr6mW14MO+zQ0vpqqMy2mXUoVW4dLCrecf2Wnpes/1
	znUUDWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztj4-00000005Zro-3rDs;
	Wed, 02 Apr 2025 08:45:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztaS-00000005YGQ-3RXZ;
	Wed, 02 Apr 2025 08:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743582999;
	bh=KnBImJ26dd2JIQc1OYOTDcsJmgwUHBRPF7KKs/JDYx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OutjvLgqV0uIZbn9dZeP66M82vmIXgkeITEHcHFMVHzcoU+K+GsrmljPnGyt4ambM
	 V6KyyPipgske00fNUjrqYTM7wVlwtXBxdv9toPFxViEQc0tXe+C3+fyJHJ8rBGB4A1
	 2r2GbLJlPkMZOgOtdgLdzjkFiyKXW4vybdvf7pST/gmDalYU7mvcu+mIHHe9YOSQwC
	 AjgEMrMMat9YOaLKH1aMQkgROY+/N0EciBDmXl5vuNxbC+2N4VfAsR9m16rxwBqdSq
	 mt+7z8AxCzUGKXRACXfCjFWVuhHOtOlBNzlfggS8XG/zKpedxL7SR09FF9Fi+KikeG
	 MoUpOea0yyVyA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FE8617E0809;
	Wed,  2 Apr 2025 10:36:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nancy.lin@mediatek.com,
	ck.hu@mediatek.com,
	djkurtz@chromium.org,
	littlecvr@chromium.org,
	bibby.hsieh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH v1 4/5] drm/mediatek: mtk_disp_ovl: Enable/disable interrupt on bind/unbind
Date: Wed,  2 Apr 2025 10:36:27 +0200
Message-ID: <20250402083628.20111-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_013641_050629_850642A8 
X-CRM114-Status: GOOD (  17.79  )
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

The OVL driver is installing an ISR in the probe function but, if
the component is not bound yet, the interrupt handler may call the
vblank_cb ahead of time (while probing other drivers) or too late
(while removing other drivers), possibly accessing memory that it
should not try to access by reusing stale pointers.

In order to fix this, add a new `irq` member to struct mtk_disp_ovl
and then set the NOAUTOEN flag to the irq before installing the ISR
to manually call enable_irq() and disable_irq() in the bind and
unbind callbacks respectively.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index df82cea4bb79..1bff3a1273f6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -161,6 +161,7 @@ struct mtk_disp_ovl {
 	struct drm_crtc			*crtc;
 	struct clk			*clk;
 	void __iomem			*regs;
+	int				irq;
 	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_ovl_data	*data;
 	void				(*vblank_cb)(void *data);
@@ -587,12 +588,18 @@ void mtk_ovl_bgclr_in_off(struct device *dev)
 static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
 			     void *data)
 {
+	struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
+
+	enable_irq(priv->irq);
 	return 0;
 }
 
 static void mtk_disp_ovl_unbind(struct device *dev, struct device *master,
 				void *data)
 {
+	struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
+
+	disable_irq(priv->irq);
 }
 
 static const struct component_ops mtk_disp_ovl_component_ops = {
@@ -605,16 +612,15 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_ovl *priv;
 	struct resource *res;
-	int irq;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return priv->irq;
 
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk))
@@ -635,10 +641,11 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	priv->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, priv);
 
-	ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
+	irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(dev, priv->irq, mtk_disp_ovl_irq_handler,
 			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
+		return dev_err_probe(dev, ret, "Failed to request irq %d\n", priv->irq);
 
 	pm_runtime_enable(dev);
 
-- 
2.48.1


