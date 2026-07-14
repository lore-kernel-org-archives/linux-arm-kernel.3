Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0A2C4450D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiF9YYW1bQFINH2mgKeQ/xNHVfEtSNAdHUTfi7427yQ=; b=Yi/M8yjcjLeqpLirUyW+q38rFp
	n58StqmsjgJ40xoNv4cdkT2BElOrUg1fbStKaexjJy+/Cs9ZYEitPPewitDsXFQZ9kV6BFTTn+cIr
	0et2EoIWYP5BpQjDd6GQtsLxuHDha1146z6tYnt0XQSckHZMm9vvt7NS8jlmUaw5G9WpygastSjaj
	k2JZK1+W1/5Y4KB87IVa9GKqisG3MxNSt/kOoDfpX1kenrDKAOKaSLEft3aBwdys33Cy1Qn+8NMF5
	pxmKg5FC/3Pz0w8lmW8psN+fGxKm8K3xAhwHHzeo4cECWa1jlOzCpjA12VTzPSOOdFMLxJ8UplYZe
	MzwGiSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZ5-0000000BiJI-0Fu7;
	Tue, 14 Jul 2026 11:44:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbYy-0000000BiBk-2MeR;
	Tue, 14 Jul 2026 11:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029474;
	bh=Ip0z0Dqm9bUaaMp/etGb29cMeapZRLGllSD+m34VwVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j16Uz93hCM00fKmLqkfKyUHd+O3FtxoL9CNdPoleCVNsfb5em7W+NNiIxnt/KmX8i
	 0KRQozPXAnTxiMkZbEnryV0X79Ulqgw71OhzZObmUpsHDGTHebWzQhJzie0s9cBM5l
	 HO7391y4q3uIo7xqtB8q/WbzBYUF4A4U8/wn1ZR2o+RyXC8hLd/3VoMp3ub8vW5OBv
	 DavFbTLvSjtv9LmMFyZm2VNaFR1/Agy6PynLQaEAQtFH2MJKH1Eviuqe5hHKN6ZMj9
	 GvlZm7wcwmlQPYz4DJ7GAx91lWnHdGrnLjDVof4kqQtLQIANdx4irbEjNt9/A7HG4R
	 s1bM3pLnpfIrg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E777517E0DE9;
	Tue, 14 Jul 2026 13:44:33 +0200 (CEST)
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
Subject: [PATCH v2 04/46] drm/mediatek: Move mtk_ddp_comp_type enumeration to mtk-mmsys.h
Date: Tue, 14 Jul 2026 13:43:32 +0200
Message-ID: <20260714114414.184512-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044437_170634_1E5CA701 
X-CRM114-Status: UNSURE (   9.80  )
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

In preparation for a major refactoring of MMSYS, MUTEX and of
mediatek-drm, move the mtk_ddp_comp_type enumeration to the
mtk-mmsys.h header, as this will be shared between multiple
MediaTek multimedia related drivers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h | 25 ---------------------
 include/linux/soc/mediatek/mtk-mmsys.h  | 29 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 99bf1e1015da..bbc66072fe6b 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -22,31 +22,6 @@ struct mtk_plane_state;
 struct drm_crtc_state;
 struct drm_dsc_config;
 
-enum mtk_ddp_comp_type {
-	MTK_DISP_AAL,
-	MTK_DISP_BLS,
-	MTK_DISP_CCORR,
-	MTK_DISP_COLOR,
-	MTK_DISP_DITHER,
-	MTK_DISP_DSC,
-	MTK_DISP_GAMMA,
-	MTK_DISP_MERGE,
-	MTK_DISP_MUTEX,
-	MTK_DISP_OD,
-	MTK_DISP_OVL,
-	MTK_DISP_OVL_2L,
-	MTK_DISP_OVL_ADAPTOR,
-	MTK_DISP_POSTMASK,
-	MTK_DISP_PWM,
-	MTK_DISP_RDMA,
-	MTK_DISP_UFOE,
-	MTK_DISP_WDMA,
-	MTK_DPI,
-	MTK_DP_INTF,
-	MTK_DSI,
-	MTK_DDP_COMP_TYPE_MAX,
-};
-
 struct mtk_ddp_comp;
 struct cmdq_pkt;
 struct mtk_ddp_comp_funcs {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 4885b065b849..fb88202d100a 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -84,6 +84,35 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_ID_MAX,
 };
 
+enum mtk_ddp_comp_type {
+	/* DISP Components */
+	MTK_DISP_AAL,
+	MTK_DISP_BLS,
+	MTK_DISP_CCORR,
+	MTK_DISP_COLOR,
+	MTK_DISP_DITHER,
+	MTK_DISP_DSC,
+	MTK_DISP_GAMMA,
+	MTK_DISP_MERGE,
+	MTK_DISP_MUTEX,
+	MTK_DISP_OD,
+	MTK_DISP_OVL,
+	MTK_DISP_OVL_2L,
+	MTK_DISP_OVL_ADAPTOR,
+	MTK_DISP_POSTMASK,
+	MTK_DISP_PWM,
+	MTK_DISP_RDMA,
+	MTK_DISP_UFOE,
+	MTK_DISP_WDMA,
+
+	/* Keep Display outputs at the end for readability */
+	MTK_DPI,
+	MTK_DP_INTF,
+	MTK_DSI,
+
+	MTK_DDP_COMP_TYPE_MAX
+};
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next);
-- 
2.54.0


