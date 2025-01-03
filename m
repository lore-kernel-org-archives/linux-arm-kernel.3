Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DE5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 06:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fd/q59gvByZH+NptJiVBXQPQ56n4yqQJajHMESFfjw=; b=xiPvzefNpWSWEbafUJ6PKL3Z7t
	xjC5RuRyGJuwPeHN1KeOpPc/Y2qkTyfEVAZccKcN99j9Ds2FOiOnXaRemkUMnamh0j8RP/vKaUbHj
	rH2mnqMnMFi75n2md69ce3t98xa8wnM/wTmMmDfvR7fRcMjlnKAccud4fe7f/66xKOgf28QbLtQun
	nAvHDBlCnhHUMM3B7AoAD/aRmzP/lsKnmozHWA4602wwEmCSom2YcOY4yj2ZzyJCejizAQ2t2BbAf
	q93Y+wSlk0CiXzd7lB216bEqy1M7khrEFR6AOzhsLpZ8Gbc6JVM3G8A4aScmqoEYVcDxRsYbd3lL7
	NiF/7yRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTar6-0000000CBLl-4AE5;
	Fri, 03 Jan 2025 06:08:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTajw-0000000CA1x-1ahA;
	Fri, 03 Jan 2025 06:00:57 +0000
X-UUID: 15b2669cc99811ef82ff63e91e7eb18c-20250102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5fd/q59gvByZH+NptJiVBXQPQ56n4yqQJajHMESFfjw=;
	b=V7g8Q3CznUgwxThh1EL3yMgF3UjCr0UUsKLHLoQ/0uhJPBG+lMUdfS+IHWPiyZmVzIy0j1yEg+PPkcM84+n3iYUkGy5K5igomns9dWaJbj0TF/A+2HhY/Xc1HegdApnU9IReoo+UnWwRzNEd/mH7fOAUVKxPapbW4NLXLH6zIRI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:9fc907d8-3102-40eb-9963-c6ef77e317b3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:6ec34419-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 15b2669cc99811ef82ff63e91e7eb18c-20250102
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 6181237; Thu, 02 Jan 2025 23:00:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 14:00:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 14:00:48 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: [PATCH 5/5] PCI: mediatek-gen3: Keep PCIe power and clocks if suspend-to-idle
Date: Fri, 3 Jan 2025 14:00:15 +0800
Message-ID: <20250103060035.30688-6-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250103060035.30688-1-jianjun.wang@mediatek.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_220056_442978_6F36BEC8 
X-CRM114-Status: GOOD (  14.54  )
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

If the target system sleep state is suspend-to-idle, the bridge is
supposed to stay in D0, and the framework will not help to restore its
configuration space, so keep its power and clocks during suspend.

It's recommended to enable L1ss support, so the link can be changed to
L1.2 state during suspend.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 48f83c2d91f7..11da68910502 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1291,6 +1291,19 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
 	int err;
 	u32 val;
 
+	/*
+	 * If the target system sleep state is suspend-to-idle, the bridge is supposed to stay in
+	 * D0, and the framework will not help to restore its configuration space, so keep it's
+	 * power and clocks during suspend.
+	 *
+	 * It's recommended to enable L1ss support, so the link can be changed to L1.2 state during
+	 * suspend.
+	 */
+	if (pm_suspend_default_s2idle()) {
+		dev_info(dev, "System enter s2idle state, keep PCIe power and clocks\n");
+		return 0;
+	}
+
 	/* Trigger link to L2 state */
 	err = mtk_pcie_turn_off_link(pcie);
 	if (err) {
@@ -1316,6 +1329,11 @@ static int mtk_pcie_resume_noirq(struct device *dev)
 	struct mtk_gen3_pcie *pcie = dev_get_drvdata(dev);
 	int err;
 
+	if (pm_suspend_default_s2idle()) {
+		dev_info(dev, "System enter s2idle state, no need to reinitialization\n");
+		return 0;
+	}
+
 	err = pcie->soc->power_up(pcie);
 	if (err)
 		return err;
-- 
2.46.0


