Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB2CCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 03:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkeZWL/aC0QqQsmb6lMOmPRcVdbGQcpa7vlMcE32JQQ=; b=H7hj4Ho4Nm2QWEFOn8brdJl8kB
	0xqOec3+aCodOm2oQeq5ymSI7e6RQe49xEEi5AAy/LD4ROW6Uj2Tddlpz1+9Jiu9Bd24iiBptwJd/
	xQS6KCeXrLFZpNzT7eWcbWNFZUNDke39AX7EwMrkaB+7zarodCwn8MqfbExRePJePeRFyJgu6pPHm
	pf8UddNR78fQFqhpwKEiu++zCLATJTStu9eeLSOs36D4G+m5B63oajkx5fa6f8P1fCqXmvk39O22g
	TSwpMkRXhshZt93eukrj/W6x74BYaEeZh+PU0ZdiznFzcbNDkMyAgbB9doAah/IHng5pYOllCjavp
	31X1nyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8s9d-00000000Kle-0stX;
	Wed, 15 Oct 2025 03:26:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8s9a-00000000Kjk-2Wan;
	Wed, 15 Oct 2025 03:26:20 +0000
X-UUID: b36ba47aa97611f09f706fa2197c6ceb-20251014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bkeZWL/aC0QqQsmb6lMOmPRcVdbGQcpa7vlMcE32JQQ=;
	b=mPV9ayf6F80ZOe5FKEUKSzvywPoRT1aWdfZCExSX7I60A6w7ORzyy12ZOa3FVXsSxMOF+SWVInaocJEQeevw1Npt0pQjPDqy1A3M8YokfzwSvaQMWIhINYp4sG7NPk3OQgdRpqxkjfxKKlD42faew7Tv8N7lgN6AL0dkgorm93Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f12fc501-1097-4d05-8382-1b6d43fc4689,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:56d42db9-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b36ba47aa97611f09f706fa2197c6ceb-20251014
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <zhengnan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 138662838; Tue, 14 Oct 2025 20:26:12 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 15 Oct 2025 11:26:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 15 Oct 2025 11:26:08 +0800
From: Zhengnan Chen <zhengnan.chen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Zhengnan Chen
	<zhengnan.chen@mediatek.com>
Subject: [PATCH v2 2/5] iommu/mediatek: Add a flag DL_WITH_MULTI_LARB
Date: Wed, 15 Oct 2025 11:24:18 +0800
Message-ID: <20251015032509.5057-3-zhengnan.chen@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251015032509.5057-1-zhengnan.chen@mediatek.com>
References: <20251015032509.5057-1-zhengnan.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_202618_648254_C7B27FE3 
X-CRM114-Status: GOOD (  19.83  )
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

Add DL_WITH_MULTI_LARB flag to support the HW which connect with
multiple larbs. Prepare for mt8189. In mt8189, the display connect
with larb1 and larb2 at the same time. Thus, we should add link
between disp-dev with these two larbs.

Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 56 ++++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0e0285348d2b..7af47c59b10b 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -147,6 +147,7 @@
 #define TF_PORT_TO_ADDR_MT8173		BIT(18)
 #define INT_ID_PORT_WIDTH_6		BIT(19)
 #define CFG_IFA_MASTER_IN_ATF		BIT(20)
+#define DL_WITH_MULTI_LARB		BIT(21)
 
 #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
 				((((pdata)->flags) & (mask)) == (_x))
@@ -865,6 +866,7 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
 	struct device_link *link;
 	struct device *larbdev;
+	unsigned long larbid_msk = 0;
 	unsigned int larbid, larbidx, i;
 
 	if (!MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM))
@@ -872,30 +874,50 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 
 	/*
 	 * Link the consumer device with the smi-larb device(supplier).
-	 * The device that connects with each a larb is a independent HW.
-	 * All the ports in each a device should be in the same larbs.
+	 * w/DL_WITH_MULTI_LARB: the master may connect with multi larbs,
+	 * we should create device link with each larb.
+	 * w/o DL_WITH_MULTI_LARB: the master must connect with one larb,
+	 * otherwise fail.
 	 */
 	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
 	if (larbid >= MTK_LARB_NR_MAX)
 		return ERR_PTR(-EINVAL);
 
+	larbid_msk |= BIT(larbid);
+
 	for (i = 1; i < fwspec->num_ids; i++) {
 		larbidx = MTK_M4U_TO_LARB(fwspec->ids[i]);
-		if (larbid != larbidx) {
+		if (MTK_IOMMU_HAS_FLAG(data->plat_data, DL_WITH_MULTI_LARB)) {
+			larbid_msk |= BIT(larbidx);
+		} else if (larbid != larbidx) {
 			dev_err(dev, "Can only use one larb. Fail@larb%d-%d.\n",
 				larbid, larbidx);
 			return ERR_PTR(-EINVAL);
 		}
 	}
-	larbdev = data->larb_imu[larbid].dev;
-	if (!larbdev)
-		return ERR_PTR(-EINVAL);
 
-	link = device_link_add(dev, larbdev,
-			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
-	if (!link)
-		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
+	for_each_set_bit(larbid, &larbid_msk, 32) {
+		larbdev = data->larb_imu[larbid].dev;
+		if (!larbdev)
+			return ERR_PTR(-EINVAL);
+
+		link = device_link_add(dev, larbdev,
+				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+		if (!link) {
+			dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
+			goto link_remove;
+		}
+	}
+
 	return &data->iommu;
+
+link_remove:
+	for_each_set_bit(i, &larbid_msk, larbid) {
+		larbdev = data->larb_imu[i].dev;
+		device_link_remove(dev, larbdev);
+	}
+
+	return ERR_PTR(-ENODEV);
 }
 
 static void mtk_iommu_release_device(struct device *dev)
@@ -903,11 +925,19 @@ static void mtk_iommu_release_device(struct device *dev)
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct mtk_iommu_data *data;
 	struct device *larbdev;
-	unsigned int larbid;
+	unsigned int larbid, i;
+	unsigned long larbid_msk = 0;
 
 	data = dev_iommu_priv_get(dev);
-	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
-		larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
+	if (!MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM))
+		return;
+
+	for (i = 0; i < fwspec->num_ids; i++) {
+		larbid = MTK_M4U_TO_LARB(fwspec->ids[i]);
+		larbid_msk |= BIT(larbid);
+	}
+
+	for_each_set_bit(larbid, &larbid_msk, 32) {
 		larbdev = data->larb_imu[larbid].dev;
 		device_link_remove(dev, larbdev);
 	}
-- 
2.46.0


