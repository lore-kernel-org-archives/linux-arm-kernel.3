Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B96BC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KNNknBC5KibHqJcCrAXoU9Gma/wFXnXxJsKwRfmCzs=; b=vsrb8huCXElxni6pxIb2jwodEK
	tBgqP40nBW2sjYerdiksDeC7kr7dDkSNGFq6sj2dCOA5jApFYIT3BIz2Iia7yFebGXS6qVQDNB+9I
	TGgBXzoxMEpoOp755gbHBjGtByUvotHGFq5fa/JkbXJHajFAtBI2XhW7KFRSUbxGirq4CfCO6kJfQ
	tZhA6b3m0HdXJvi7lms7tvWWUP483K3g7qrUNkeIrKanKoAoOGE01KLaS7bvzuw3sVCUuB9CYzkAM
	FZ60+6tijQE3jC0T8/vK0uK+RSHXU13FOdSJxfpii2ZXM76vDFJL0dY5J9ljGIhGNZmViM/3Hu+NB
	N4DTcx2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VvD-00000007MoG-2G6e;
	Wed, 09 Apr 2025 13:56:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VFZ-00000007FSp-2E3f;
	Wed, 09 Apr 2025 13:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204432;
	bh=SlDROGe6exFigpwAfSIEv4Jg5WPYMv1AVZFCsehToL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bo8K55/uoI3Iotk1ncyxvBUEmTvgFTfyGz11LEXD8BnIQSbc3LCfFKETh1ub2iUfS
	 2ZERwjhNU27Q0egoZUA8MluijtO7JZMVhJbuXwybqOM/NcppapZ7Td+Pz1rZnyp2ww
	 E/oLs7k2KmbTmlaFvIdlcVUbQhAWJOEFbOYdxB8zBQX/ho1bXDqh9QiLs7dF0IkOHn
	 a/HeWPjAA9GVFPFdv4ByAk2LfXigI6POkUmCFITahdxNT1ZX7JwOyyBRrXLwyCzfYF
	 o2gyJgINfoh7VsYxYcG6+dNXWwBFRSoD4HjbGZkX3SBMfqcSTnvXL9VyrbaGOS5NET
	 5YpXa0HoOZb5A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BAB8D17E10F7;
	Wed,  9 Apr 2025 15:13:50 +0200 (CEST)
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
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v8 18/23] drm/mediatek: mtk_hdmi_common: Assign DDC adapter pointer to bridge
Date: Wed,  9 Apr 2025 15:13:13 +0200
Message-ID: <20250409131318.108690-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061353_718216_E0A9A107 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

In preparation for adding the new HDMI TX v2 IP driver, assign the
pointer to the DDC adapter to struct drm_bridge during probe.

This commit brings no functional changes.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 5ea45608921c..2c91f65f26fa 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -411,6 +411,7 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";
 	hdmi->bridge.product = "On-Chip HDMI";
 
-- 
2.49.0


