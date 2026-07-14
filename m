Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8108C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkgG58QNdnXRYypEeckfkoXGLz4TTS1jHXjmK5inXfM=; b=srny1mWW7pNsaCUzQ2W2b+eOcz
	lYrN86D66Z9ynLhz14tWLpmJ9kRIwkV5ZOVK26GSNWuWpUQMa1DIS0Pwv70PuUuVB1lvBkDDJN+3m
	F6nHINzWS1AcBugpUeKBmxRtqnKVpOvVPP7fUtfNNVp3AFCT+1DHt8kFo17Ja1gCkl7NQdxFBLslV
	b6xTAh/BkyO76BK+iQCIPeyaIJCfJL6mewxDCm7+PqljVl8P4OuVKd1nQ82vG0LaaghM3Vxz+QXcn
	0TNRnjzl//myuIBNFqWE8bznAv2gAYxlyFbjIBGI5lBuWpXjmZpNBXFW0KaAlo/UpSQq46jIKdqrn
	xnmMROog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZA-0000000BiXn-3TYF;
	Tue, 14 Jul 2026 11:44:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZ3-0000000BiFZ-07qE;
	Tue, 14 Jul 2026 11:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029479;
	bh=a3Zk9VtwjzQZ0fQ39QCCtxiwLry/La2QPCCPr/aNPEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mgwGgJXCRzEOdwC7wAnqJJ7sLRdNLOHiObE/1iZpQOdcG6n4pJfi6iEKexkOQjxq+
	 i8e8psG6eMH5lVecw5Nr8KhpUq+f2zjRf1A+3Wm1JJ5BHocNWmkmf60VpO22yjdQRX
	 I6lNxyVTEpEPx1Lk27kOJaFJsRgDKF4DxaGY6LYzJR8BjBqc5UCajlkcTfaKRuPP8p
	 2GwzFEb26cMPTcQke3Gqlib1mMClMDhGlx19H3ygr+NHOlhnCn9ZDgdXMMqtKJwcIv
	 3+M64jqq7dw9yhabTlAb3/U5PfJftdueXyGJPePhQQW8U16GPB7Iis6Vu2D+cf8Bp6
	 NsTfA0h0uYY2Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54F1317E010F;
	Tue, 14 Jul 2026 13:44:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v2 08/46] drm/mediatek: ddp_comp: Move internal component register in function
Date: Tue, 14 Jul 2026 13:43:36 +0200
Message-ID: <20260714114414.184512-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044441_218462_EA7FF50E 
X-CRM114-Status: GOOD (  11.45  )
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

In preparation for adding an helper serving the purpose of finally
removing duplicated code to check for internal/simple components,
and for improving human readability in the up coming refactoring,
move the internal/simple component registration logic to its own
mtk_ddp_comp_init_internal_comp() function.

This brings no functional changes.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 55 +++++++++++++++----------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index d716fd9f8a70..2ba2123238b3 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -629,6 +629,38 @@ static void mtk_ddp_comp_clk_put(void *_clk)
 	clk_put(clk);
 }
 
+static int mtk_ddp_comp_init_internal_comp(struct device *dev, struct device *comp_dev)
+{
+	struct device_node *comp_node = comp_dev->of_node;
+	struct mtk_ddp_comp_dev *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regs = devm_of_iomap(dev, comp_node, 0, NULL);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	priv->clk = of_clk_get(comp_node, 0);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
+	ret = devm_add_action_or_reset(dev, mtk_ddp_comp_clk_put, priv->clk);
+	if (ret)
+		return ret;
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(comp_dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(comp_dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+	dev_set_drvdata(comp_dev, priv);
+
+	return 0;
+};
+
 int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 		      struct mtk_drm_comp_list *hlist,
 		      unsigned int comp_id)
@@ -636,7 +668,6 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	struct platform_device *comp_pdev;
 	struct mtk_ddp_comp *comp;
 	enum mtk_ddp_comp_type type;
-	struct mtk_ddp_comp_dev *priv;
 	int ret;
 
 	if (comp_id >= DDP_COMPONENT_DRM_ID_MAX)
@@ -686,29 +717,9 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	    type == MTK_DISP_DSI)
 		goto end;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->regs = devm_of_iomap(dev, node, 0, NULL);
-	if (IS_ERR(priv->regs))
-		return PTR_ERR(priv->regs);
-
-	priv->clk = of_clk_get(node, 0);
-	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
-
-	ret = devm_add_action_or_reset(dev, mtk_ddp_comp_clk_put, priv->clk);
+	ret = mtk_ddp_comp_init_internal_comp(dev, comp->dev);
 	if (ret)
 		return ret;
-
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	ret = cmdq_dev_get_client_reg(comp->dev, &priv->cmdq_reg, 0);
-	if (ret)
-		dev_dbg(comp->dev, "get mediatek,gce-client-reg fail!\n");
-#endif
-
-	platform_set_drvdata(comp_pdev, priv);
 end:
 	hash_add(hlist->ddp_list, &comp->lnode, comp->id);
 
-- 
2.54.0


