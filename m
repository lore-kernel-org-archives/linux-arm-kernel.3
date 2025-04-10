Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBCFC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 14:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeGguunmfq8EdQv0skYPozseDoxQy0Tda0iQYCd/YcY=; b=tMPY+xEbFNmJhqoOzvzO7U1wDz
	AlRqR96nPI1x3DMrt/M/8dL9A518q/9gicj37y68v77s+dx0ZlfwMirzlqyKUXNL0aRv8Xlk1bl+K
	Mzhewfs0RteekC8crMILuWEaxVEK5d1e+wHTbZ8E25wJAmv9fB+4o59+QMCRbhoqTw6ATYJzgzU+q
	FDFMB7r1lyNr+FrUpuka4RrMtXOpjlLYmc4pzv1ZNllD4fPJmg5oYbp0UrTBtd9PMjpmulnOXXw1s
	+NvxGdKY4zrf9y3kVPah3CdFkS1uPlbfidyhq3eZOPbNYytk7lVXuI+EWtV/2Zy12jXf1gFKCsRHJ
	bdpemGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tJg-0000000AvCS-3zut;
	Thu, 10 Apr 2025 14:55:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4k-0000000AsQe-3aFW;
	Thu, 10 Apr 2025 14:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296017;
	bh=jSRPeeUZbUFnm5JrrBKlIB+n5RJQ2oyK+3O1pN6pJEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k/gO+SYu3J9DkVlez6NwJPIYIZ8meW6VHagV0LOHYwrPbtD2H2w6xoYAwUahzh0c/
	 9p7uYPwPT65ZNb1IqP7FQ2SLLg0O/rMz9mDMFxbMRQsUmAWDPgmtDua79TL0TGArv8
	 vds+WpELTbRpJwE8CjPyFwcGa7PxZUCQQ/YCvfktymiJuo0sy+H23f/6HzLrXoQYUN
	 2kHhFnfLFkvEPMjMpBTpO7evGt7PRArwGXC1N06tRz5QpAlQthqzC5Z7mMwS4YwWGi
	 34H0MDBhzlOPXzUeRdW1MSu7f3HiXXpIeUjuuLSmDbwzguWOsTYhGd3yvehcWHRZdL
	 +8dsoZqRwlC7Q==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 00F9D17E0EB8;
	Thu, 10 Apr 2025 16:40:14 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/2] iommu/mediatek: Add support for Dimensity 1200 MT6893 MM IOMMU
Date: Thu, 10 Apr 2025 16:40:08 +0200
Message-ID: <20250410144008.475888-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>
References: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074019_099753_4C59D211 
X-CRM114-Status: GOOD (  12.79  )
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

Add support for the two MM IOMMUs found in the MediaTek Dimensity
1200 (MT6893) SoC, used for display, camera, imgsys and vpu.

Since the MT6893 SoC is almost fully compatible with MT8192, also
move the mt8192_larb_region_msk before the newly introduced mt6893
platform data, as the larb regions from mt8192 are fully reused.

Note that the only difference with MT8192 is that MT6893 needs the
SHARE_PGTABLE flag.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index df98d0c65f54..0a54c6521bf5 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1550,6 +1550,31 @@ static const struct mtk_iommu_plat_data mt6795_data = {
 	.larbid_remap = {{0}, {1}, {2}, {3}, {4}}, /* Linear mapping. */
 };
 
+static const unsigned int mt8192_larb_region_msk[MT8192_MULTI_REGION_NR_MAX][MTK_LARB_NR_MAX] = {
+	[0] = {~0, ~0},				/* Region0: larb0/1 */
+	[1] = {0, 0, 0, 0, ~0, ~0, 0, ~0},	/* Region1: larb4/5/7 */
+	[2] = {0, 0, ~0, 0, 0, 0, 0, 0,		/* Region2: larb2/9/11/13/14/16/17/18/19/20 */
+	       0, ~0, 0, ~0, 0, ~(u32)(BIT(9) | BIT(10)), ~(u32)(BIT(4) | BIT(5)), 0,
+	       ~0, ~0, ~0, ~0, ~0},
+	[3] = {0},
+	[4] = {[13] = BIT(9) | BIT(10)},	/* larb13 port9/10 */
+	[5] = {[14] = BIT(4) | BIT(5)},		/* larb14 port4/5 */
+};
+
+static const struct mtk_iommu_plat_data mt6893_data = {
+	.m4u_plat     = M4U_MT8192,
+	.flags        = HAS_BCLK | OUT_ORDER_WR_EN | HAS_SUB_COMM_2BITS |
+			WR_THROT_EN | IOVA_34_EN | SHARE_PGTABLE | MTK_IOMMU_TYPE_MM,
+	.inv_sel_reg  = REG_MMU_INV_SEL_GEN2,
+	.banks_num    = 1,
+	.banks_enable = {true},
+	.iova_region  = mt8192_multi_dom,
+	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
+	.iova_region_larb_msk = mt8192_larb_region_msk,
+	.larbid_remap    = {{0}, {1}, {4, 5}, {7}, {2}, {9, 11, 19, 20},
+			    {0, 14, 16}, {0, 13, 18, 17}},
+};
+
 static const struct mtk_iommu_plat_data mt8167_data = {
 	.m4u_plat     = M4U_MT8167,
 	.flags        = RESET_AXI | HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM,
@@ -1673,17 +1698,6 @@ static const struct mtk_iommu_plat_data mt8188_data_vpp = {
 			   27, 28 /* ccu0 */, MTK_INVALID_LARBID}, {4, 6}},
 };
 
-static const unsigned int mt8192_larb_region_msk[MT8192_MULTI_REGION_NR_MAX][MTK_LARB_NR_MAX] = {
-	[0] = {~0, ~0},				/* Region0: larb0/1 */
-	[1] = {0, 0, 0, 0, ~0, ~0, 0, ~0},	/* Region1: larb4/5/7 */
-	[2] = {0, 0, ~0, 0, 0, 0, 0, 0,		/* Region2: larb2/9/11/13/14/16/17/18/19/20 */
-	       0, ~0, 0, ~0, 0, ~(u32)(BIT(9) | BIT(10)), ~(u32)(BIT(4) | BIT(5)), 0,
-	       ~0, ~0, ~0, ~0, ~0},
-	[3] = {0},
-	[4] = {[13] = BIT(9) | BIT(10)},	/* larb13 port9/10 */
-	[5] = {[14] = BIT(4) | BIT(5)},		/* larb14 port4/5 */
-};
-
 static const struct mtk_iommu_plat_data mt8192_data = {
 	.m4u_plat       = M4U_MT8192,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
@@ -1777,6 +1791,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
 	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
 	{ .compatible = "mediatek,mt6795-m4u", .data = &mt6795_data},
+	{ .compatible = "mediatek.mt6893-iommu-mm", .data = &mt6893_data},
 	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
-- 
2.49.0


