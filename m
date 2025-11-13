Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AADCD4F5F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hu479yPj8wbBYx+WzD14ywVL3ZHRcGR0GXGR0sSeAEc=; b=Vme0x/SIEV+qcl5nfx3vfpbqiZ
	/oajjlJc9jmaAznWpTT3ABf6cUZqcWoizAqJTqyECLrZ4hhYTLSE2hl16ZhJoJsOar23F2GNQECMP
	U5le4TNVxV2UlcTeCNyBkVwRCC1kX5r/uiYqMXsYI1Oo0785e2cmwula+DfEE4U9v4jYWY+ThmneA
	HpduDj4ZUcIKfu0WDjig/vXkZFM42kDyEFWupFwr4GcWFrVTCFznAJI8GwnnCVYtsgkYNkoUchRRL
	C7hpsE/gVdvyw4L3ob4kc5n5cPkwJHgkKKigRHjgmHLAVD3EoWK76fLUYsDzKPmUGvyhaQtxxrkz5
	o2HLRa2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSxR-0000000A7pb-1gUm;
	Thu, 13 Nov 2025 08:45:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSxO-0000000A7p3-1rfq;
	Thu, 13 Nov 2025 08:45:31 +0000
X-UUID: 17300f16c06d11f0a52f393f94899d25-20251113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hu479yPj8wbBYx+WzD14ywVL3ZHRcGR0GXGR0sSeAEc=;
	b=no1+SRZjdc/QUFWioe22TRkQGQhriQgNN9Jl5sYCj/hq5s4ssmuqhewIVi2UZPLTO5LNlZmgZgxupT6MfArZQDiZMOyylon755lX9/DwrcuePbOAlH7p5HyRDttdxVI7BlBajI5GAfjXlWIV+aLJ68PVDW5ap3U87mKcxoyVXZo=;
X-CID-CACHE: Type:Local,Time:202511130145-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:55943e08-07dc-4e4a-937a-665cf39013b0,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:28dd6492-7fd3-4c6a-836a-51b0a70fa8fb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 17300f16c06d11f0a52f393f94899d25-20251113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnny-cc.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1820826874; Thu, 13 Nov 2025 01:45:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 13 Nov 2025 16:45:19 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 13 Nov 2025 16:45:19 +0800
From: Johnny Chang <Johnny-CC.Chang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Digits_Upstream_Group@mediatek.com>, Johnny-CC Chang
	<Johnny-CC.Chang@mediatek.com>
Subject: [PATCH] PCI: Mark Nvidia GB10 to avoid bus reset
Date: Thu, 13 Nov 2025 16:44:06 +0800
Message-ID: <20251113084441.2124737-1-Johnny-CC.Chang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_004530_514259_2B2811F7 
X-CRM114-Status: UNSURE (   8.74  )
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

From: Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>

Nvidia GB10 PCIe hosts will encounter problem occasionally
after SBR(secondary bus reset) is applied.
Enable NO_BUS_RESET quirk for Nvidia GB10 PCIe hosts.

Signed-off-by: Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>
---
 drivers/pci/quirks.c    | 11 +++++++++++
 include/linux/pci_ids.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index b94264cd3833..12a10fa84c8a 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3746,6 +3746,17 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
 	dev->dev_flags |= PCI_DEV_FLAGS_NO_BUS_RESET;
 }
 
+/*
+ * Nvidia GB10 PCIe hosts will encounter problem occasionally
+ * after SBR (secondary bus reset) is applied.
+ * SBR needs to be prevented for these PCIe hosts.
+ */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_GB10_GEN5_X4,
+			 quirk_no_bus_reset);
+
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_GB10_GEN4_X1,
+			 quirk_no_bus_reset);
+
 /*
  * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
  * prevented for those affected devices.
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 92ffc4373f6d..661dc1594213 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -1382,6 +1382,8 @@
 #define PCI_DEVICE_ID_NVIDIA_GEFORCE_320M           0x08A0
 #define PCI_DEVICE_ID_NVIDIA_NFORCE_MCP79_SMBUS     0x0AA2
 #define PCI_DEVICE_ID_NVIDIA_NFORCE_MCP89_SATA	    0x0D85
+#define PCI_DEVICE_ID_NVIDIA_GB10_GEN5_X4           0x22CE
+#define PCI_DEVICE_ID_NVIDIA_GB10_GEN4_X1           0x22D0
 
 #define PCI_VENDOR_ID_IMS		0x10e0
 #define PCI_DEVICE_ID_IMS_TT128		0x9128
-- 
2.45.2


