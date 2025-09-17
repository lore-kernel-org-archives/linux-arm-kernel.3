Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A94CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rWzUh3OtAgbptX2XM346gfFjl3YVUXZFKF3qDFzE+Y=; b=x0/beQFUMXUYHfI0gAef9m0GQe
	VsMapM/5pixY1THTqhR/LC0UVx3IVATNdef4fwrPCZga0FSOubKwoVL6JQrUMcZkXBBHL4EjBzrMR
	Www8ftdi115bAB3hngPW+UXGDssinjO0lR1CBZCSu1JTMctbOrx3IO180Cj2bzBAnRPguyDuxgI02
	EOmHWbC5wTNV1oEC7vx7cmmos+cLbjUBP1/pLYzsW6LFf099WYzOyRxY2L1s822G5rx45uifOzYJY
	E/+pL7cCAnI0cY0+WIwCy87JIHxUjlCkCI1XGR60lA1hQaQW1l8WdleW3x99A/Pv/FUhRSGIsDwMu
	3MA3L7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqwq-0000000BE8o-0QfD;
	Wed, 17 Sep 2025 12:07:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqwk-0000000BE4o-2VYJ;
	Wed, 17 Sep 2025 12:07:39 +0000
X-UUID: e4397f9693be11f09f706fa2197c6ceb-20250917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4rWzUh3OtAgbptX2XM346gfFjl3YVUXZFKF3qDFzE+Y=;
	b=qM0/0PqLReVY+QIuAvqyeNw9B5gcqKb8QLvbKTyID/D1yaQvULRRHWuEqZmQEwpHED5eKIoONa8Z5wG217NyweCGXLwN3CS3Vc9j2Oz1nY8utdmmlQMOH7WVOBb6T3JDs/sKzMIzbID96KHPkYu0cBCKzDP6k4SkN4OPFUXdQKk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:556af0b8-ed4b-43dd-89e4-cd955ea2b104,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:d49566f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836,TC:-5,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e4397f9693be11f09f706fa2197c6ceb-20250917
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1902482611; Wed, 17 Sep 2025 05:07:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 17 Sep 2025 20:07:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 17 Sep 2025 20:07:29 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: Friday Yang <friday.yang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11 2/2] memory: mtk-smi: mt8188: Add SMI reset and clamp
Date: Wed, 17 Sep 2025 20:07:17 +0800
Message-ID: <20250917120724.8650-3-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250917120724.8650-1-friday.yang@mediatek.com>
References: <20250917120724.8650-1-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_050738_642107_CB591A9C 
X-CRM114-Status: GOOD (  23.64  )
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

To prevent handling glitch signals during MTCMOS on/off transitions,
SMI requires clamp and reset operations. Parse the reset settings for
SMI LARBs and the clamp settings for the SMI Sub-Common. Register
genpd callback for the SMI LARBs located in image, camera and IPE
subsystems, and apply reset and clamp operations within the callback.

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---
 drivers/memory/mtk-smi.c | 151 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 733e22f695ab..117ff528db01 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -10,11 +10,15 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/soc/mediatek/mtk_sip_svc.h>
 #include <soc/mediatek/smi.h>
 #include <dt-bindings/memory/mt2701-larb-port.h>
@@ -34,6 +38,8 @@
 #define SMI_FIFO_TH1			0x238
 #define SMI_FIFO_TH2			0x23c
 #define SMI_DCM				0x300
+#define SMI_COMMON_CLAMP_EN_SET		0x3c4
+#define SMI_COMMON_CLAMP_EN_CLR		0x3c8
 #define SMI_DUMMY			0x444

 /* SMI LARB */
@@ -134,6 +140,7 @@ struct mtk_smi_larb_gen {
 	unsigned int			larb_direct_to_common_mask;
 	unsigned int			flags_general;
 	const u8			(*ostd)[SMI_LARB_PORT_NR_MAX];
+	const u8			*clamp_port;
 };

 struct mtk_smi {
@@ -150,6 +157,7 @@ struct mtk_smi {
 };

 struct mtk_smi_larb { /* larb: local arbiter */
+	struct device			*dev;
 	struct mtk_smi			smi;
 	void __iomem			*base;
 	struct device			*smi_common_dev; /* common or sub-common dev */
@@ -157,6 +165,10 @@ struct mtk_smi_larb { /* larb: local arbiter */
 	int				larbid;
 	u32				*mmu;
 	unsigned char			*bank;
+	struct regmap			*smi_comm_syscon; /* smi-comm or sub-comm */
+	u8				smi_comm_in_port_id; /* smi-comm or sub-comm */
+	struct notifier_block		nb;
+	struct reset_control		*rst_con;
 };

 static int
@@ -478,6 +490,19 @@ static const u8 mtk_smi_larb_mt8195_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[28] = {0x1a, 0x0e, 0x0a, 0x0a, 0x0c, 0x0e, 0x10,},
 };

+static const u8 mtk_smi_larb_clamp_port_mt8188[MTK_LARB_NR_MAX] = {
+	[9]	= BIT(1), /* larb10 */
+	[10]	= BIT(2), /* larb11a */
+	[11]	= BIT(2), /* larb11b */
+	[12]	= BIT(3), /* larb11c */
+	[13]	= BIT(0), /* larb12 */
+	[16]	= BIT(1), /* larb15 */
+	[17]	= BIT(2), /* larb16a */
+	[18]	= BIT(2), /* larb16b */
+	[19]	= BIT(3), /* larb17a */
+	[20]	= BIT(3), /* larb17b */
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt2701 = {
 	.port_in_larb = {
 		LARB0_PORT_OFFSET, LARB1_PORT_OFFSET,
@@ -531,6 +556,7 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
 	.flags_general	            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG |
 				      MTK_SMI_FLAG_SLEEP_CTL | MTK_SMI_FLAG_CFG_PORT_SEC_CTL,
 	.ostd		            = mtk_smi_larb_mt8188_ostd,
+	.clamp_port                 = mtk_smi_larb_clamp_port_mt8188,
 };

 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
@@ -582,6 +608,53 @@ static void mtk_smi_larb_sleep_ctrl_disable(struct mtk_smi_larb *larb)
 	writel_relaxed(0, larb->base + SMI_LARB_SLP_CON);
 }

+static int mtk_smi_larb_clamp_protect_enable(struct device *dev, bool enable)
+{
+	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
+	u32 reg;
+	int ret;
+
+	reg = enable ? SMI_COMMON_CLAMP_EN_SET : SMI_COMMON_CLAMP_EN_CLR;
+	ret = regmap_write(larb->smi_comm_syscon, reg, larb->smi_comm_in_port_id);
+	if (ret)
+		dev_err(dev, "Unable to %s clamp for input port %d: %d\n",
+			enable ? "enable" : "disable",
+			larb->smi_comm_in_port_id, ret);
+
+	return ret;
+}
+
+static int mtk_smi_genpd_callback(struct notifier_block *nb,
+				  unsigned long event, void *data)
+{
+	struct mtk_smi_larb *larb = container_of(nb, struct mtk_smi_larb, nb);
+	struct device *dev = larb->dev;
+	int ret = 0;
+
+	switch (event) {
+	case GENPD_NOTIFY_PRE_ON:
+	case GENPD_NOTIFY_PRE_OFF:
+		/* Clamp this larb to avoid the redundant commands */
+		ret = mtk_smi_larb_clamp_protect_enable(dev, true);
+		break;
+	case GENPD_NOTIFY_ON:
+		ret = reset_control_reset(larb->rst_con);
+		if (ret) {
+			dev_err(dev, "Failed to reset smi larb %d\n", ret);
+			break;
+		}
+
+		ret = mtk_smi_larb_clamp_protect_enable(dev, false);
+		break;
+	default:
+		break;
+	}
+	if (ret)
+		return NOTIFY_BAD;
+
+	return NOTIFY_OK;
+}
+
 static int mtk_smi_device_link_common(struct device *dev, struct device **com_dev)
 {
 	struct platform_device *smi_com_pdev;
@@ -638,6 +711,46 @@ static int mtk_smi_dts_clk_init(struct device *dev, struct mtk_smi *smi,
 	return ret;
 }

+static int mtk_smi_larb_parse_syscon(struct mtk_smi_larb *larb, int larbid)
+{
+	struct device *dev = larb->dev;
+	const struct mtk_smi_larb_gen *larb_gen = larb->larb_gen;
+	int ret;
+
+	larb->smi_comm_in_port_id = larb_gen->clamp_port[larbid];
+	larb->smi_comm_syscon = syscon_regmap_lookup_by_phandle(dev->of_node,
+								"mediatek,smi");
+	if (IS_ERR(larb->smi_comm_syscon)) {
+		ret = PTR_ERR(larb->smi_comm_syscon);
+		larb->smi_comm_syscon = NULL;
+		return dev_err_probe(dev, ret,
+				     "Failed to get smi syscon for larb %d\n", larbid);
+	}
+
+	return 0;
+}
+
+static int mtk_smi_larb_parse_reset(struct mtk_smi_larb *larb)
+{
+	struct device *dev = larb->dev;
+	int ret;
+
+	larb->rst_con = devm_reset_control_get_exclusive(dev, "larb");
+	if (IS_ERR(larb->rst_con))
+		return dev_err_probe(dev, PTR_ERR(larb->rst_con),
+				     "Failed to get reset controller\n");
+
+	larb->nb.notifier_call = mtk_smi_genpd_callback;
+	ret = dev_pm_genpd_add_notifier(dev, &larb->nb);
+	if (ret) {
+		larb->nb.notifier_call = NULL;
+		return dev_err_probe(dev, ret,
+				     "Failed to add genpd callback\n");
+	}
+
+	return 0;
+}
+
 static int mtk_smi_larb_probe(struct platform_device *pdev)
 {
 	struct mtk_smi_larb *larb;
@@ -648,6 +761,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	if (!larb)
 		return -ENOMEM;

+	larb->dev = dev;
 	larb->larb_gen = of_device_get_match_data(dev);
 	larb->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(larb->base))
@@ -664,6 +778,30 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;

+	/* The larbid are sequential for IOMMU if this property is not present */
+	if (!of_property_present(dev->of_node, "mediatek,larb-id"))
+		goto pm_runtime_en;
+	ret = of_property_read_s32(dev->of_node, "mediatek,larb-id", &larb->larbid);
+	if (ret || larb->larbid >= MTK_LARB_NR_MAX) {
+		ret = -EINVAL;
+		goto err_link_remove;
+	}
+
+	/*
+	 * Only SMI LARBs in camera, image and IPE subsys need to
+	 * apply clamp and reset operations, others can be skipped.
+	 */
+	if (larb->larb_gen->clamp_port && larb->larb_gen->clamp_port[larb->larbid]) {
+		ret = mtk_smi_larb_parse_syscon(larb, larb->larbid);
+		if (ret)
+			goto err_link_remove;
+
+		ret = mtk_smi_larb_parse_reset(larb);
+		if (ret)
+			goto err_link_remove;
+	}
+
+pm_runtime_en:
 	pm_runtime_enable(dev);
 	platform_set_drvdata(pdev, larb);
 	ret = component_add(dev, &mtk_smi_larb_component_ops);
@@ -672,7 +810,11 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	return 0;

 err_pm_disable:
+	if (larb->nb.notifier_call)
+		dev_pm_genpd_remove_notifier(&pdev->dev);
+
 	pm_runtime_disable(dev);
+err_link_remove:
 	device_link_remove(dev, larb->smi_common_dev);
 	return ret;
 }
@@ -681,6 +823,9 @@ static void mtk_smi_larb_remove(struct platform_device *pdev)
 {
 	struct mtk_smi_larb *larb = platform_get_drvdata(pdev);

+	if (larb->nb.notifier_call)
+		dev_pm_genpd_remove_notifier(&pdev->dev);
+
 	device_link_remove(&pdev->dev, larb->smi_common_dev);
 	pm_runtime_disable(&pdev->dev);
 	component_del(&pdev->dev, &mtk_smi_larb_component_ops);
@@ -803,6 +948,11 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8188_vpp = {
 	.init     = mtk_smi_common_mt8195_init,
 };

+static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8188 = {
+	.type     = MTK_SMI_GEN2_SUB_COMM,
+	.has_gals = true,
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
 	.type     = MTK_SMI_GEN2,
 	.has_gals = true,
@@ -847,6 +997,7 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8186-smi-common", .data = &mtk_smi_common_mt8186},
 	{.compatible = "mediatek,mt8188-smi-common-vdo", .data = &mtk_smi_common_mt8188_vdo},
 	{.compatible = "mediatek,mt8188-smi-common-vpp", .data = &mtk_smi_common_mt8188_vpp},
+	{.compatible = "mediatek,mt8188-smi-sub-common", .data = &mtk_smi_sub_common_mt8188},
 	{.compatible = "mediatek,mt8192-smi-common", .data = &mtk_smi_common_mt8192},
 	{.compatible = "mediatek,mt8195-smi-common-vdo", .data = &mtk_smi_common_mt8195_vdo},
 	{.compatible = "mediatek,mt8195-smi-common-vpp", .data = &mtk_smi_common_mt8195_vpp},
--
2.46.0


