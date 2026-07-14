Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1359BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MdkFnX4rXXqMwLbq/os+68TDmL9VR+C89C2lOqXE0I=; b=a0flKNYjWz7od7sHkG8DRtYZDr
	VN1u+SH5yp/hUijOIv57gu3NvW4bm/1hwzG79MUGshrCSO0+CGlvQLFkw4UHPU1fy9gLqMXWO14Ec
	IuKrEW0PIE6ZZwHgMTX2fBHCKFo6Cc2n3F075eFdPJwmzytINDxrI8aFg9qBlb7+i/yy6xi3I2gXC
	ayNpbJaTZLK8e++52oTJhQ632WvLJoJ4y+5ZoyqjfuSp4P+/J0DOOtvBJ9gKIyHA88AUduYf32NzF
	ZKsVNFXK41o30EaNZDhGO1mYQ9FDgzfBZYser/iqjkUA4L6C3wgHO5KjFUSTaLoBa4Uzu3MzF/qOX
	ewkY9Skg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbaj-0000000BlCX-0D9g;
	Tue, 14 Jul 2026 11:46:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZi-0000000BjMs-02vQ;
	Tue, 14 Jul 2026 11:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2MdkFnX4rXXqMwLbq/os+68TDmL9VR+C89C2lOqXE0I=; b=YaRX0wso2eR0bu1QF589wpK9G7
	ua7LwDHv4DrWVIoUuPP/1BgHF1++p4xxk+TDivzi8iTfs23TNy/y4OCZYCydkXiPYxyJn1r7GOPwI
	0u9R+CACQPGP5mg+cFe13rxLmKZcmGgg19AvBHN6MJ2kIDVGy3gt/hZlV6+tXLKtOgl8Hjk4UgL6f
	Sq2zviWPb1woOyqwrZsMEJsjLE8RvbOBm0+qc33TtbdOsHo6MIGmm/1UvRLlhTpYI7g4HYoD7ac2a
	m3xihspoRDgW+pO/i8kDxXXPuGLUw5SODYpW2t6zn6uKKRJVRpVvgtFl2Lsy6ZL8aHJof2tbIWoYX
	ZgyRY4rw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjbZf-0000000CQpR-07v2;
	Tue, 14 Jul 2026 11:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029517;
	bh=EgR1iXxVkGF7W6gjrep5XaQEFBsxQtSA3zzD1LWLtHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QqPu+Z7UYxi3JJoxSnEqQraq5WJ2rEcQ4iQdk1RJG7CbxXJPwYIyRfyt/U9NJOB28
	 A9GggvTV1DSwf1tfbDxDxVSU+0THNwnQ4GiLbnPco4aqXhKoT6ZRId+u1/Srb+RD7L
	 kV1lHs2vt1+LFIW5MkxIKFnKfLnq/FZji2EDbLYNl10LxzdzaqdLn6ZFji+8bpt4rx
	 gZzMlxMQkQbtYlaaFdwestXDWG5HVAbHxyi10Zx+3gdQAVDanJ8Xf2/2YZbUo+aoxd
	 raBAUz3HgeEiPeMQn5C8wxKV9SMT4AwiZ+JXu7okHkG5AKaOi7NINdKKuqU+0daKl1
	 hP8YkTYgxLlAw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C658917E0FD0;
	Tue, 14 Jul 2026 13:45:16 +0200 (CEST)
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
	kernel@collabora.com
Subject: [PATCH v2 36/46] drm/mediatek: mtk_crtc: Dynamically find suitable CRTC DMA device
Date: Tue, 14 Jul 2026 13:44:04 +0200
Message-ID: <20260714114414.184512-37-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_124519_195135_B69F44E0 
X-CRM114-Status: GOOD (  23.26  )
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

Now that the vblank and config components are being dynamically
selected, the only hardcoded strategy that is left is selecting
a DMA device for a CRTC that is being created.

In order to support pipelines including an embedded multimedia
controller (like MDP3) chained with the display controller and
pipelines chaining multiple display controllers together, stop
assuming that the first component in the pipeline is suited to
do DMA operations and implement support to dynamically find not
only a suitable DMA device, but also the best one.

This finds the first device that provides DMA and the first one
that is also behind an IOMMU.

The criteria for selecting the best device is to prefer a DMA
device behind an IOMMU; if not found, the first DMA capable
one is selected instead.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 68 ++++++++++++++++++++++++-----
 1 file changed, 56 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 3cb2d1a28987..16c9ff2cfe32 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -1132,6 +1132,60 @@ struct device *mtk_crtc_dma_dev_get(struct drm_crtc *crtc)
 	return mtk_crtc->dma_dev;
 }
 
+static int mtk_crtc_find_suitable_dma_dev(struct mtk_drm_private *priv,
+					  struct mtk_crtc *mtk_crtc,
+					  const struct mtk_drm_path_definition *path)
+{
+	struct mtk_ddp_comp *dma_comp = NULL, *dma_comp_mmu = NULL;
+	int i;
+
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		const struct mtk_drm_comp_definition *cdef = path[i].comp;
+		struct mtk_ddp_comp *comp;
+
+		comp = mtk_ddp_comp_find_by_id(&priv->hlist,
+					       cdef->type, cdef->inst_id);
+		if (!comp)
+			continue;
+
+		/*
+		 * Check if this is a legacy OVL_ADAPTOR component and, if so, this
+		 * has to forcefully be the DMA device for this CRTC: assign it to
+		 * dma_comp_mmu to force that.
+		 */
+		if (comp->type == MTK_DISP_OVL_ADAPTOR) {
+			dma_comp_mmu = comp;
+			break;
+		}
+
+		if (!comp->dev || !comp->dev->of_node)
+			continue;
+
+		/* Find the first device provides DMA... */
+		if (!dma_comp) {
+			if (of_property_present(comp->dev->of_node, "#dma-cells"))
+				dma_comp = comp;
+		}
+
+		/* ...and check if that device is also behind an IOMMU */
+		if (!of_property_present(comp->dev->of_node, "iommus"))
+			continue;
+
+		/* If a device behind IOMMU is found, this is the best outcome */
+		dma_comp_mmu = comp;
+		break;
+	}
+
+	if (dma_comp_mmu)
+		mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(dma_comp_mmu);
+	else if (dma_comp)
+		mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(dma_comp);
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
 int mtk_crtc_create(struct drm_device *drm_dev,
 		    enum mtk_crtc_path path_sel, int priv_data_index,
 		    const struct mtk_drm_route *conn_routes,
@@ -1140,7 +1194,6 @@ int mtk_crtc_create(struct drm_device *drm_dev,
 	struct mtk_drm_private *priv = drm_dev->dev_private;
 	const struct mtk_drm_path_definition *output_path;
 	struct device *dev = drm_dev->dev;
-	struct mtk_ddp_comp *dma_comp;
 	struct mtk_crtc *mtk_crtc;
 	unsigned int num_comp_planes = 0;
 	unsigned int max_comp_stages = 0;
@@ -1307,20 +1360,11 @@ int mtk_crtc_create(struct drm_device *drm_dev,
 	dev_dbg(dev, "Found %u layers composed by maximum of %u stage(s) each.\n",
 		mtk_crtc->hwlayer_nr, max_comp_stages);
 
-	/*
-	 * Default to use the first component as the dma dev.
-	 * In the case of ovl_adaptor sub driver, it needs to use the
-	 * dma_dev_get function to get representative dma dev.
-	 */
-	dma_comp = mtk_ddp_comp_find_by_id(&priv->hlist,
-					   output_path->comp[0].type,
-					   output_path->comp[0].inst_id);
-	if (dma_comp == NULL) {
+	ret = mtk_crtc_find_suitable_dma_dev(priv, mtk_crtc, output_path);
+	if (ret) {
 		dev_err(dev, "Could not find appropriate DMA device!\n");
 		return -EINVAL;
 	}
-
-	mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(dma_comp);
 	dev_dbg(dev, "Using DMA device %pOF\n", mtk_crtc->dma_dev->of_node);
 
 	ret = mtk_crtc_init(drm_dev, mtk_crtc, crtc_i);
-- 
2.54.0


