Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9092EC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLriN2KjCA0IFbfsQGb7OkB87uKmU7ASl8EB4pFyKGc=; b=UrOFhI8sm4o3vEOYiq8de7dAC3
	iBjAcn7AnuBhFFDvhFJeNNtgznl4xsyqHVpLd9Pjg9VyG1DI88ebP0LKaBYcPOM2i/f1rPSNhClNh
	uT9aVtvorlwLSZsKKnBnQxxrRarycbZYhYrXkKkv+Cn79FoP5aLm//bvmy9OrcOqMANPLtbggEb2N
	s9XdtPvw8hHTGSLQ0Ok8qf7D6p91EYBoMg9/t85/Sqvjud1CyOs7Lk4iihkPlH8J5ihh9Bopnm4M4
	RH6f5wM5mx5fcYO0mWUQ+c9ztmmyuYI9wJ419x+oqraNQtfTtaz4ao1Lx2M93BvNkK/FXfb7AzpNk
	ueKp3CEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0Kf-00000003Ea7-1gg8;
	Mon, 16 Jun 2025 03:16:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR01o-00000003Cpe-3WSg;
	Mon, 16 Jun 2025 02:56:57 +0000
X-UUID: 8d898c684a5d11f09f706fa2197c6ceb-20250615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xLriN2KjCA0IFbfsQGb7OkB87uKmU7ASl8EB4pFyKGc=;
	b=mlOkSmuHemCwuWY2vTG+OekAg/8Ev7CLLpkl2BwLuRBsZ9oBxWO8WIuJH2PV+9QQd8ZlPvhDwkKifASYXfXmMlzT05LRq5mdSL5ZE/kmIwMNO11uUd4rL6kv1PhoW0ydN9mKmMDC71ehEYXs6YPkDvM1BgvRh90+oqtQJhDsrUE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:290e6ff9-5e56-417b-9d49-0866014d5766,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:09905cf,CLOUDID:c63d7d28-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8d898c684a5d11f09f706fa2197c6ceb-20250615
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1566361503; Sun, 15 Jun 2025 19:56:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 16 Jun 2025 10:56:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 16 Jun 2025 10:56:47 +0800
From: Xueqi Zhang <xueqi.zhang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>, Ning li
	<ning.li@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <iommu@lists.linux.dev>, Xueqi Zhang
	<xueqi.zhang@mediatek.com>
Subject: [RFC PATCH 8/8] iommu/arm-smmu-v3: mediatek: Implement rpm get/put function
Date: Mon, 16 Jun 2025 10:56:14 +0800
Message-ID: <20250616025628.25454-9-xueqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_195656_885770_EFE8D8DC 
X-CRM114-Status: GOOD (  12.25  )
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

In some projects, we also have EL2 driver, so we put the pm operation
in TFA(EL3), then all the kernel and EL2 could control the pm.
Implement rpm get/put function which send smc call to ATF to get/put
SMMU power.

Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-mediatek.c    | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
index 448166c1ca64..38c995e90469 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
@@ -397,9 +397,87 @@ static int mtk_smmu_v3_smmuwp_irq_handler(int irq, struct arm_smmu_device *smmu)
 	return 0;
 }
 
+/*
+ * SMMU TF-A SMC cmd format:
+ * sec[11:11] + smmu_type[10:8] + cmd_id[7:0]
+ */
+#define SMMU_ATF_SET_CMD(smmu_type, sec, cmd_id) \
+	((cmd_id) | ((smmu_type) << 8) | ((sec) << 11))
+
+enum smmu_atf_cmd {
+	SMMU_SECURE_PM_GET,
+	SMMU_SECURE_PM_PUT,
+	SMMU_CMD_NUM
+};
+
+/*
+ * a0/in0 = MTK_IOMMU_SECURE_CONTROL(IOMMU SMC ID)
+ * a1/in1 = SMMU TF-A SMC cmd (sec + smmu_type + cmd_id)
+ * a2/in2 ~ a7/in7: user defined
+ */
+static int mtk_smmu_atf_call(u32 smmu_type, unsigned long cmd,
+			     unsigned long in2, unsigned long in3, unsigned long in4,
+			     unsigned long in5, unsigned long in6, unsigned long in7)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONTROL, cmd, in2, in3, in4, in5, in6, in7, &res);
+
+	return res.a0;
+}
+
+static int mtk_smmu_atf_call_common(u32 smmu_type, unsigned long cmd_id)
+{
+	unsigned long cmd = SMMU_ATF_SET_CMD(smmu_type, 1, cmd_id);
+
+	return mtk_smmu_atf_call(smmu_type, cmd, 0, 0, 0, 0, 0, 0);
+}
+
+static int mtk_smmu_pm_get(struct device *dev, uint32_t smmu_type)
+{
+	int ret;
+
+	ret = mtk_smmu_atf_call_common(smmu_type, SMMU_SECURE_PM_GET);
+	if (ret) {
+		dev_dbg(dev, "%s, smc call fail. ret:%d, type:%u\n", __func__, ret, smmu_type);
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static int mtk_smmu_pm_put(struct device *dev, uint32_t smmu_type)
+{
+	int ret;
+
+	ret = mtk_smmu_atf_call_common(smmu_type, SMMU_SECURE_PM_PUT);
+	if (ret) {
+		dev_dbg(dev, "%s, smc call fail:%d, type:%u\n", __func__, ret, smmu_type);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int mtk_smmu_power_get(struct arm_smmu_device *smmu)
+{
+	struct mtk_smmu_v3 *mtk_smmuv3 = to_mtk_smmu_v3(smmu);
+	const struct mtk_smmu_v3_plat *plat_data = mtk_smmuv3->plat_data;
+
+	return mtk_smmu_pm_get(smmu->dev, plat_data->smmu_type);
+}
+
+static int mtk_smmu_power_put(struct arm_smmu_device *smmu)
+{
+	struct mtk_smmu_v3 *mtk_smmuv3 = to_mtk_smmu_v3(smmu);
+	const struct mtk_smmu_v3_plat *plat_data = mtk_smmuv3->plat_data;
+
+	return mtk_smmu_pm_put(smmu->dev, plat_data->smmu_type);
+}
+
 static const struct arm_smmu_v3_impl mtk_smmu_v3_impl = {
 	.combined_irq_handle = mtk_smmu_v3_smmuwp_irq_handler,
 	.smmu_evt_handler = mtk_smmu_evt_handler,
+	.smmu_power_get = mtk_smmu_power_get,
+	.smmu_power_put = mtk_smmu_power_put,
 };
 
 struct arm_smmu_device *arm_smmu_v3_impl_mtk_init(struct arm_smmu_device *smmu)
-- 
2.46.0


