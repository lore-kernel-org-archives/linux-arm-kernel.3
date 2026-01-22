Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6FDC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdQHqzPRgfGiw5MFcnRRMZVW55672PpLpBC7mDJC0W8=; b=oeWHzvSOJh8jMyfBdYBuRilaol
	VX02Rcm097FIey8gMhQWN6FdmiLz04VjBPNnigJ5ZhA6jqWHVN/BeVzhCIl/9aH+pA/MTXk1oXNO8
	+hj7HdPS2OnD4qDu7pK44VWHmCy2cxlPra/BGwXUgnnJcW1gO/clzroQR6wGstN2mEYa7NdXbhX2Q
	f5orr9+U48k6wE1YsnUhCOUeX6kC7YmDKOPSyXZsAvyUZ86KifD6ZoLcz7cIPujJBDsBGC8R+feny
	5QvFrXrYLUjCphB6oVQOeCBP9iXiHPeW4ju/5wjJoPXTHqkIRFkikNmMjAHhAKhl6OxeV6KtwjHey
	ZPQDorDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7C-00000006rmC-0YjS;
	Thu, 22 Jan 2026 10:40:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis70-00000006raM-0OLT;
	Thu, 22 Jan 2026 10:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TdQHqzPRgfGiw5MFcnRRMZVW55672PpLpBC7mDJC0W8=; b=ZauWB0JfyCQmaRkVUTM5cQE5gy
	6KupwlNTL+1b3Ad4oWdm97pPEwPwKjXySIDBt0CB3efXw55x9rmwHlDE5qWNZ58cLFsKH1Y2BO8LM
	RnPF2vNKtbscLg/uss6m1fh+jRnGPx6Io9CLww/LmofJaHv+cIfVOlzRiDEuhT4lsxUFHS/UtDCPb
	hxSDHNkBIYbvFGfjFADyaeF1IGhTYemNXackY+f1Hcazq7h+twsBghnNnKVeYI1Ike1sJhqT2/gII
	JeotLhC18T51YZxZ62CygaXKJ8mnICTH0qnfbtRUcIOkiyO9UFsWAlTEX3tyHsSrAGMbuTojreoo0
	Sn83FwbQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6w-00000000AL0-33cR;
	Thu, 22 Jan 2026 10:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CB12408AC;
	Thu, 22 Jan 2026 10:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD123C116C6;
	Thu, 22 Jan 2026 10:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078421;
	bh=k4O3be26AQ8exg3XD7X+0VLeqF5x3XTiSMtPXrw/nsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=amwd4FPgMP2QsKhCn65wTKCfk3Z2WC/o1L/aVIL6ovJF1q0ETqiswZVZ0MCX43Pa1
	 6e5WK2Ic6PX73oyLaoNbAu6qRBJnVZunMlcwbmSUY693zSaTtmixpwWjLPnuTEANUn
	 E5Hi7OwM/HrNTsxvSrPi/tBS3Dey3y1G5pPE9W4p6vdWXiAIdCuUpBUquJ/3ihTXnu
	 KcQgnZHIRkFYLxSviUnR+U+BzgxaT8Xlh13g2y8VCOajZYeMwQ2vOrcNMdRhOqH9dS
	 yyq3noHClzzYWbjUNy/rHbDnVPcalHtPLYM7nD14t7/QLc0cHb31Ry1fQDNAWALnKU
	 JfjxQoixZoYTQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:50 +0100
Subject: [PATCH mt76 v2 06/17] wifi: mt76: mt7996: Add
 mt7992_npu_txrx_offload_init routine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-6-2374614c0de6@kernel.org>
References: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
In-Reply-To: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Kang Yang <kang.yang@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104023_316799_BC4FED04 
X-CRM114-Status: GOOD (  11.78  )
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
This is a preliminary patch to enable NPU offload for MT7996 (Eagle)
chipset.

Tested-by: Kang Yang <kang.yang@airoha.com>
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


