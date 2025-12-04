Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77C5D1D897
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYdgkbrSGCYR6JsKWeFn9V5kUu21r+mZ9KYTbVMGXh4=; b=WV3ri8L9RASNoDeUtF/odtohv5
	Qw9VHlXfj6MN3mD+gLiK1ZbPmvdeBX2wk3CKRGvxoboduqyB/goLrkA7HY0+bnmGKiC0d4aIsxTCA
	MSox5BLAIWE+zz3NJqiR4FyltOgHHihq2wKp4TFyDkHGLhisBQGh6rf67B28p/pObWgCKbz7iQ+C5
	+ZaS3su3gKBCDUCg7NvEukdX7KWLE9FndEOEMqlew1vAPR8Ph6CBrIrddUJLbhJ5fxQt/pnXjCj2D
	iELxyKOAj3zbYeDOUo1WPi918b/+oevlAYLbtX3yJFQRTZ+tbeovBsymyUmajtu+YCZIYgNlfFAv8
	RupqjQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4RB-00000007ekk-48WN;
	Thu, 04 Dec 2025 08:11:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4R9-00000007ehS-3orz;
	Thu, 04 Dec 2025 08:11:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98B1344341;
	Thu,  4 Dec 2025 08:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28836C4CEFB;
	Thu,  4 Dec 2025 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835899;
	bh=OocQtT0h+CyI1Z65tcvGSFoTrkMRGEEFmUqKOabT3iw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j8RyOxUlsBfydZXwZuxZ14U5LvRVLszmVoNI0lS9PdoqqazNxNdY+5mk+NfOmhIt1
	 YidZwli1JdnV2zJ23PTavyyHFiZgLl70azFFMrzJBaDur+Ehc38ROp9O6/IrYEgeeN
	 2wx3j7kcWPt4ek9ehq2kAT94ZFReSwpZ5u/5dqzDdkmjQ722qI95xZ77XjNuHYx6an
	 YkbYoSnywqgDCbCeSInkQdDIZ/qZa7efAUUSRDR9I8i+6akwnnnxwEenePQeqC/Fzo
	 Q/xYrhT0NHY9tQB2KpQbcopRS3kO1DZvcZSaGlzj/J795neRHzyoFiLH0i4eseq3wW
	 Gd5xjEdOlXEJw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Dec 2025 09:10:48 +0100
Subject: [PATCH mt76 06/11] wifi: mt76: mt7996: Add
 mt7992_npu_txrx_offload_init routine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-mt76-npu-eagle-offload-v1-6-7819c52c0893@kernel.org>
References: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
In-Reply-To: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hui Ma <hui.ma@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_001139_997843_A674FA73 
X-CRM114-Status: GOOD (  11.74  )
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

Introduce mt7992_npu_txrx_offload_init utility routine.
This is a preliminary patch to enable NPU offload for MT7996
(7990-Eagle) chipset.

Tested-by: Hui Ma <hui.ma@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 63 +++++++++++++++----------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index 067ef647e404073173833aad3a2800d6591a5188..d79f8dfbd7faa7695ea54b632ac86063fa8ffe3a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -8,34 +8,14 @@
 
 #include "mt7996.h"
 
-static int mt7996_npu_offload_init(struct mt7996_dev *dev,
-				   struct airoha_npu *npu)
+static int mt7992_npu_txrx_offload_init(struct mt7996_dev *dev,
+					struct airoha_npu *npu)
 {
+	u32 hif1_ofs = dev->hif2 ? MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0) : 0;
 	phys_addr_t phy_addr = dev->mt76.mmio.phy_addr;
-	u32 val, hif1_ofs = 0, dma_addr;
+	u32 dma_addr;
 	int i, err;
 
-	err = mt76_npu_get_msg(npu, 0, WLAN_FUNC_GET_WAIT_NPU_VERSION,
-			       &val, GFP_KERNEL);
-	if (err) {
-		dev_warn(dev->mt76.dev, "failed getting NPU fw version\n");
-		return err;
-	}
-
-	dev_info(dev->mt76.dev, "NPU version: %0d.%d\n",
-		 (val >> 16) & 0xffff, val & 0xffff);
-
-	err = mt76_npu_send_msg(npu, 0, WLAN_FUNC_SET_WAIT_PCIE_PORT_TYPE,
-				dev->mt76.mmio.npu_type, GFP_KERNEL);
-	if (err) {
-		dev_warn(dev->mt76.dev,
-			 "failed setting NPU wlan PCIe port type\n");
-		return err;
-	}
-
-	if (dev->hif2)
-		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
-
 	for (i = MT_BAND0; i < MT_BAND2; i++) {
 		dma_addr = phy_addr;
 		if (i)
@@ -56,7 +36,7 @@ static int mt7996_npu_offload_init(struct mt7996_dev *dev,
 					MT7996_RX_RING_SIZE, GFP_KERNEL);
 		if (err) {
 			dev_warn(dev->mt76.dev,
-				 "failed setting NPU wlan PCIe desc size\n");
+				 "failed setting NPU wlan rx desc size\n");
 			return err;
 		}
 
@@ -97,10 +77,41 @@ static int mt7996_npu_offload_init(struct mt7996_dev *dev,
 				phy_addr + MT_RRO_ACK_SN_CTRL, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed setting NPU wlan rro_ack_sn desc addr\n");
+			 "failed setting NPU wlan tx desc addr\n");
 		return err;
 	}
 
+	return 0;
+}
+
+static int mt7996_npu_offload_init(struct mt7996_dev *dev,
+				   struct airoha_npu *npu)
+{
+	u32 val;
+	int err;
+
+	err = mt76_npu_get_msg(npu, 0, WLAN_FUNC_GET_WAIT_NPU_VERSION,
+			       &val, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev, "failed getting NPU fw version\n");
+		return err;
+	}
+
+	dev_info(dev->mt76.dev, "NPU version: %0d.%d\n",
+		 (val >> 16) & 0xffff, val & 0xffff);
+
+	err = mt76_npu_send_msg(npu, 0, WLAN_FUNC_SET_WAIT_PCIE_PORT_TYPE,
+				dev->mt76.mmio.npu_type, GFP_KERNEL);
+	if (err) {
+		dev_warn(dev->mt76.dev,
+			 "failed setting NPU wlan PCIe port type\n");
+		return err;
+	}
+
+	err = mt7992_npu_txrx_offload_init(dev, npu);
+	if (err)
+		return err;
+
 	err = mt76_npu_send_msg(npu, 0, WLAN_FUNC_SET_WAIT_TOKEN_ID_SIZE,
 				MT7996_HW_TOKEN_SIZE, GFP_KERNEL);
 	if (err)

-- 
2.52.0


