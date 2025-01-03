Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1DCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 06:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pw2Eg2CoZnwYLB8feuiTpkmmwpupbCUbpnCYeC/dUI=; b=MYXVxhTJyXgewe2CqLozwmVhmP
	QwD2K9R5QiL/oMaL4g/GKLg9jfEsiMy/Zu4FNCr306Zo0+sr3UtHruwDsfHWIGywCxPsetqEBWagV
	Q70ba3UhdfKwfqAU4sbu1jvPFnEjFnoKLs1rM5bMnMJa2G2Ft72+VEFtjCBP0OHvnh/r73UxXqv6k
	L4K/BmCYOC5PbcUAJxRhzyQ/4e85S8fqe9fKEC148YRfLBmYRup8omU4igM4wWVsx+viT8np0Wom8
	Lupet9mbiDpWJQ6cTzKWICc+LjERJt+YHvZ5IHlf8peeMifEmHo0Q5T8x+nrKvHNZh83lfnK7j7XQ
	DztF27SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTanW-0000000CAj8-0U7L;
	Fri, 03 Jan 2025 06:04:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTajv-0000000CA0c-2YeD;
	Fri, 03 Jan 2025 06:00:57 +0000
X-UUID: 15cdc9dcc99811ef9048ed6ed365623b-20250102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7pw2Eg2CoZnwYLB8feuiTpkmmwpupbCUbpnCYeC/dUI=;
	b=qOIEPzQoODDc5mvJv1HcdOvn7lv93s/30iIyQ2Hl7BD0oJg4iOpSQeZp8hZmsWA+dbh6L6yJ65h2zBvjltfqaoYRq6ziaKP4kXJaifE2KH8qh6ufnDMtcLWL2rgNoLjN1YYQwpMt343Wx9Yu/alEQUa/psdftw+37uaC6/y2m3Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:80db15d9-f434-41d8-bd03-56a1c6fa5766,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:60aa074,CLOUDID:58c34419-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:5,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 15cdc9dcc99811ef9048ed6ed365623b-20250102
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 236518474; Thu, 02 Jan 2025 23:00:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 14:00:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 14:00:47 +0800
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
Subject: [PATCH 4/5] PCI: mediatek-gen3: Don't reply AXI slave error
Date: Fri, 3 Jan 2025 14:00:14 +0800
Message-ID: <20250103060035.30688-5-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250103060035.30688-1-jianjun.wang@mediatek.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_220055_658564_63AB0F8D 
X-CRM114-Status: GOOD (  14.61  )
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

There are some circumstances where the EP device will not respond to
non-posted access from the root port (e.g., MMIO read). In such cases,
the root port will reply with an AXI slave error, which will be treated
as a System Error (SError), causing a kernel panic and preventing us
from obtaining any useful information for further debugging.

We have added a new bit in the PCIE_AXI_IF_CTRL_REG register to prevent
PCIe AXI0 from replying with a slave error. Setting this bit on an older
platform that does not support this feature will have no effect.

By preventing AXI0 from replying with a slave error, we can keep the
kernel alive and debug using the information from AER.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 4bd3b39eebe2..48f83c2d91f7 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -87,6 +87,9 @@
 #define PCIE_LOW_POWER_CTRL_REG		0x194
 #define PCIE_FORCE_DIS_L0S		BIT(8)
 
+#define PCIE_AXI_IF_CTRL_REG		0x1a8
+#define PCIE_AXI0_SLV_RESP_MASK		BIT(12)
+
 #define PCIE_PIPE4_PIE8_REG		0x338
 #define PCIE_K_FINETUNE_MAX		GENMASK(5, 0)
 #define PCIE_K_FINETUNE_ERR		GENMASK(7, 6)
@@ -469,6 +472,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	val |= PCIE_FORCE_DIS_L0S;
 	writel_relaxed(val, pcie->base + PCIE_LOW_POWER_CTRL_REG);
 
+	/*
+	 * Prevent PCIe AXI0 from replying a slave error, as it will cause kernel panic
+	 * and prevent us from getting useful information.
+	 * Keep the kernel alive and debug using the information from AER.
+	 */
+	val = readl_relaxed(pcie->base + PCIE_AXI_IF_CTRL_REG);
+	val |= PCIE_AXI0_SLV_RESP_MASK;
+	writel_relaxed(val, pcie->base + PCIE_AXI_IF_CTRL_REG);
+
 	/* Disable DVFSRC voltage request */
 	val = readl_relaxed(pcie->base + PCIE_MISC_CTRL_REG);
 	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
-- 
2.46.0


