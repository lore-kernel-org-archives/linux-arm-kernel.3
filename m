Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E141C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 02:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/oiy3GhiSWtAVndt7S57VEPB3oDTFIIzIGasDLA5Khk=; b=LfifhUM6iBPMpbkPbiwvqicmHS
	R3pzPgqXVJJhO/obbC3qDOVRnCOSUdoTP212MgDcGL5+CWK8s9DOzaYkcK5D4xh1mTqunX1YppJ32
	xrJGaDtbeXoZH3B2N1w5kYFSiI+BQR5IYZ7q3mdc5ODrbmvXzmD+OrgoVAEhDIt/wTgRkdK31pA+u
	rE7U3BfRMZ/XYRuucNU8wlArt+JPsFCMhpJx9A2F5afaSDxq7YfXq3vE5336FZYS9152uddP9/6O7
	V2Tqigqfwyk/FDeX/I5LdgTsXFfjEAstDYqjP2gyRwKT5HaB820HXzjiZgUjL0fNIfU73NYEjSlQr
	i6BxN/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSRkz-0000000EbGI-1pE5;
	Fri, 20 Jun 2025 02:45:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSRil-0000000Eb7M-1v8h;
	Fri, 20 Jun 2025 02:43:16 +0000
X-UUID: 4e507aa44d8011f09eb0dd999d3936bf-20250619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/oiy3GhiSWtAVndt7S57VEPB3oDTFIIzIGasDLA5Khk=;
	b=IJLRmqXelBxLLiiCphkcjZF8En8vba/bVcyapMo0VV1kb5H2aRsu6oQUWJ+Y+41TnhPd7SrGUEiHE5kwv3r2yW8RAcc6k8WONWcH6GaxXHCsk1X6/9dYUzh2F1FdC/94GEiEyBxgHGdsS5wgHJIVhq0ri6eRRigpbahFJVacvRY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:4533d58a-8d79-46be-acc9-f1065bfe45c2,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:09905cf,CLOUDID:f945e258-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4e507aa44d8011f09eb0dd999d3936bf-20250619
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 989009739; Thu, 19 Jun 2025 19:43:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 20 Jun 2025 10:43:07 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 20 Jun 2025 10:43:07 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>, Zhenxing Qin
	<zhenxing.qin@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Xavier Chang
	<xavier.chang@mediatek.com>, Jarried Lin <jarried.lin@mediatek.com>, Fei Shao
	<fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] soc: mediatek: mtk-mutex: Fix confusing usage of MUTEX_MOD2
Date: Fri, 20 Jun 2025 10:40:23 +0800
Message-ID: <20250620024305.2303935-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_194315_510533_428A50F1 
X-CRM114-Status: GOOD (  17.29  )
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

The usage of MUTEX_MOD1 and MUTEX_MOD2 for calculating mod settings
over 32 has been confusing. To improve consistency and clarity, these
defines need to fit into the same MUTEX_MOD define as possible.

However, MUTEX_MOD1 cannot be directly used for all SoCs because,
for example, the mod1 register (0x34) of MT2712 is not adjacent to
its mod0 register (0x2c). To address this, a `mutex_mod1_reg` field
is introduced in the mutex driver data structure. This allows all
SoCs to use a unified MUTEX_MOD to determine their register offsets.

With this change, the separate usage of MUTEX_MOD1 and MUTEX_MOD2 is
eliminated, simplifying the logic for obtaining offsets and mod IDs.

Fixes: e1e4f7fea375 ("soc / drm: mediatek: Move mtk mutex driver to soc folder")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 109 ++++++++++++++++---------------
 1 file changed, 56 insertions(+), 53 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index aaa965d4b050..38179e8cd98f 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -17,16 +17,35 @@
 
 #define MT2701_MUTEX0_MOD0			0x2c
 #define MT2701_MUTEX0_SOF0			0x30
+#define MT2701_MUTEX0_MOD1			0x34
+
 #define MT8183_MUTEX0_MOD0			0x30
+#define MT8183_MUTEX0_MOD1			0x34
 #define MT8183_MUTEX0_SOF0			0x2c
 
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
 #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
-#define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 * (n))
-#define DISP_REG_MUTEX_MOD1(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n) + 0x4)
+/*
+ * Some SoCs may have multiple MUTEX_MOD registers as more than 32 mods
+ * are present, hence requiring multiple 32-bits registers.
+ *
+ * The mutex_table_mod fully represents that by defining the number of
+ * the mod sequentially, later used as a bit number, which can be more
+ * than 0..31.
+ *
+ * In order to retain compatibility with older SoCs, we perform R/W on
+ * the single 32 bits registers, but this requires us to translate the
+ * mutex ID bit accordingly.
+ */
+#define DISP_REG_MUTEX_MOD(mutex, id, n) ({ \
+	const typeof(mutex) _mutex = (mutex); \
+	u32 _offset = (id) < 32 ? \
+		      _mutex->data->mutex_mod_reg : \
+		      _mutex->data->mutex_mod1_reg; \
+	_offset + 0x20 * (n); \
+})
 #define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg + 0x20 * (n))
-#define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 * (n))
 
 #define INT_MUTEX				BIT(1)
 
@@ -334,6 +353,7 @@ struct mtk_mutex_data {
 	const u8 *mutex_table_mod;
 	const u16 *mutex_sof;
 	const u16 mutex_mod_reg;
+	const u16 mutex_mod1_reg;
 	const u16 mutex_sof_reg;
 	const bool no_clk;
 };
@@ -714,6 +734,7 @@ static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT2701_MUTEX0_MOD1,
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
@@ -721,6 +742,7 @@ static const struct mtk_mutex_data mt2712_mutex_driver_data = {
 	.mutex_mod = mt2712_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT2701_MUTEX0_MOD1,
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
@@ -728,6 +750,7 @@ static const struct mtk_mutex_data mt6795_mutex_driver_data = {
 	.mutex_mod = mt8173_mutex_mod,
 	.mutex_sof = mt6795_mutex_sof,
 	.mutex_mod_reg = MT2701_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT2701_MUTEX0_MOD1,
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
@@ -735,6 +758,7 @@ static const struct mtk_mutex_data mt8167_mutex_driver_data = {
 	.mutex_mod = mt8167_mutex_mod,
 	.mutex_sof = mt8167_mutex_sof,
 	.mutex_mod_reg = MT2701_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT2701_MUTEX0_MOD1,
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 	.no_clk = true,
 };
@@ -743,6 +767,7 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
 	.mutex_mod = mt8173_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT2701_MUTEX0_MOD1,
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
@@ -750,6 +775,7 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.mutex_mod = mt8183_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 	.mutex_table_mod = mt8183_mutex_table_mod,
 	.no_clk = true,
@@ -757,6 +783,7 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 
 static const struct mtk_mutex_data mt8186_mdp_mutex_driver_data = {
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 	.mutex_table_mod = mt8186_mdp_mutex_table_mod,
 };
@@ -765,6 +792,7 @@ static const struct mtk_mutex_data mt8186_mutex_driver_data = {
 	.mutex_mod = mt8186_mutex_mod,
 	.mutex_sof = mt8186_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
@@ -772,12 +800,14 @@ static const struct mtk_mutex_data mt8188_mutex_driver_data = {
 	.mutex_mod = mt8188_mutex_mod,
 	.mutex_sof = mt8188_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
 static const struct mtk_mutex_data mt8188_vpp_mutex_driver_data = {
 	.mutex_sof = mt8188_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 	.mutex_table_mod = mt8188_mdp_mutex_table_mod,
 };
@@ -786,6 +816,7 @@ static const struct mtk_mutex_data mt8192_mutex_driver_data = {
 	.mutex_mod = mt8192_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
@@ -793,12 +824,14 @@ static const struct mtk_mutex_data mt8195_mutex_driver_data = {
 	.mutex_mod = mt8195_mutex_mod,
 	.mutex_sof = mt8195_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
 static const struct mtk_mutex_data mt8195_vpp_mutex_driver_data = {
 	.mutex_sof = mt8195_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 	.mutex_table_mod = mt8195_mutex_table_mod,
 };
@@ -807,6 +840,7 @@ static const struct mtk_mutex_data mt8365_mutex_driver_data = {
 	.mutex_mod = mt8365_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 	.no_clk = true,
 };
@@ -859,7 +893,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	unsigned int reg;
-	unsigned int sof_id;
+	unsigned int sof_id, mod_id;
 	unsigned int offset;
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
@@ -890,18 +924,11 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 		sof_id = MUTEX_SOF_DP_INTF1;
 		break;
 	default:
-		if (mtx->data->mutex_mod[id] < 32) {
-			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
-						    mutex->id);
-			reg = readl_relaxed(mtx->regs + offset);
-			reg |= 1 << mtx->data->mutex_mod[id];
-			writel_relaxed(reg, mtx->regs + offset);
-		} else {
-			offset = DISP_REG_MUTEX_MOD2(mutex->id);
-			reg = readl_relaxed(mtx->regs + offset);
-			reg |= 1 << (mtx->data->mutex_mod[id] - 32);
-			writel_relaxed(reg, mtx->regs + offset);
-		}
+		offset = DISP_REG_MUTEX_MOD(mtx, mtx->data->mutex_mod[id], mutex->id);
+		mod_id = mtx->data->mutex_mod[id] % 32;
+		reg = readl_relaxed(mtx->regs + offset);
+		reg |= BIT(mod_id);
+		writel_relaxed(reg, mtx->regs + offset);
 		return;
 	}
 
@@ -917,6 +944,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	unsigned int reg;
+	unsigned int mod_id;
 	unsigned int offset;
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
@@ -936,18 +964,11 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 						  mutex->id));
 		break;
 	default:
-		if (mtx->data->mutex_mod[id] < 32) {
-			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
-						    mutex->id);
-			reg = readl_relaxed(mtx->regs + offset);
-			reg &= ~(1 << mtx->data->mutex_mod[id]);
-			writel_relaxed(reg, mtx->regs + offset);
-		} else {
-			offset = DISP_REG_MUTEX_MOD2(mutex->id);
-			reg = readl_relaxed(mtx->regs + offset);
-			reg &= ~(1 << (mtx->data->mutex_mod[id] - 32));
-			writel_relaxed(reg, mtx->regs + offset);
-		}
+		offset = DISP_REG_MUTEX_MOD(mtx, mtx->data->mutex_mod[id], mutex->id);
+		mod_id = mtx->data->mutex_mod[id] % 32;
+		reg = readl_relaxed(mtx->regs + offset);
+		reg &= ~BIT(mod_id);
+		writel_relaxed(reg, mtx->regs + offset);
 		break;
 	}
 }
@@ -1023,7 +1044,7 @@ int mtk_mutex_write_mod(struct mtk_mutex *mutex,
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	unsigned int reg;
-	u32 reg_offset, id_offset = 0;
+	u32 offset, mod_id;
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
@@ -1033,34 +1054,16 @@ int mtk_mutex_write_mod(struct mtk_mutex *mutex,
 		return -EINVAL;
 	}
 
-	/*
-	 * Some SoCs may have multiple MUTEX_MOD registers as more than 32 mods
-	 * are present, hence requiring multiple 32-bits registers.
-	 *
-	 * The mutex_table_mod fully represents that by defining the number of
-	 * the mod sequentially, later used as a bit number, which can be more
-	 * than 0..31.
-	 *
-	 * In order to retain compatibility with older SoCs, we perform R/W on
-	 * the single 32 bits registers, but this requires us to translate the
-	 * mutex ID bit accordingly.
-	 */
-	if (mtx->data->mutex_table_mod[idx] < 32) {
-		reg_offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
-						mutex->id);
-	} else {
-		reg_offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
-						 mutex->id);
-		id_offset = 32;
-	}
+	offset = DISP_REG_MUTEX_MOD(mtx, mtx->data->mutex_table_mod[idx], mutex->id);
+	mod_id = mtx->data->mutex_table_mod[idx] % 32;
 
-	reg = readl_relaxed(mtx->regs + reg_offset);
+	reg = readl_relaxed(mtx->regs + offset);
 	if (clear)
-		reg &= ~BIT(mtx->data->mutex_table_mod[idx] - id_offset);
+		reg &= ~BIT(mod_id);
 	else
-		reg |= BIT(mtx->data->mutex_table_mod[idx] - id_offset);
+		reg |= BIT(mod_id);
 
-	writel_relaxed(reg, mtx->regs + reg_offset);
+	writel_relaxed(reg, mtx->regs + offset);
 
 	return 0;
 }
-- 
2.43.0


