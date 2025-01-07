Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0740DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 05:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KZz8IJT3Behlj/SYm2zXDzCba/a/DTK3QmgKi1MNypk=; b=Wr3mKvnmZ2lXCwOWLZ8Jb7/ET/
	bPOfeS+IjzOcFXnHJz117o9RTHxclVobXTKxttx7F4ynGVFF2Q5mvVz7Yde4XhzG93tsUWMyeFDZQ
	eTsFWZF6Z6ojt+jNzVN7c5MTZNQrSnoIK4IpOZCyLlkMmznMJ0je61Oht5XwtNA2FuSjorB2sR366
	nBqdk9o63nZ1Mt59Q1Pii7wqO0lhT6qzaaz2WKhRvB/krszWT4gruAJ/+TudGrBX+sYiqIvAHgBKJ
	O6W5JwuNfNoCiqh/Ljhz36cC/GYN3+wfQlGuamcTPWg3nhX9ziFHYX+walv9k/GTmWyivHGtmiq9P
	kv74T+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV23z-00000003Xju-1XXK;
	Tue, 07 Jan 2025 05:23:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV21n-00000003XMs-0KH6;
	Tue, 07 Jan 2025 05:21:22 +0000
X-UUID: 369460c8ccb711ef9048ed6ed365623b-20250106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KZz8IJT3Behlj/SYm2zXDzCba/a/DTK3QmgKi1MNypk=;
	b=HSIbbIbLCKTZHvv2kVivfN9fGbBoJhNl3DtTJ6uuU6Ui+HX2PtMfrfOMHFYjos51HdF59R3h02h/qHJmb5MfZ81dmeGdsjR9ZhXmUTV/934v7+mE4ccLQzPEfKDrFiKnz8CDDngYlMrnW8N/GxpOVnO7uwiQfYJ1EnGFzGwFjn4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:2c340a18-34dc-4849-8232-9e0ae8098e17,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:60aa074,CLOUDID:9aa87a37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:1,IP:nil
	,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 369460c8ccb711ef9048ed6ed365623b-20250106
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 826735803; Mon, 06 Jan 2025 22:21:13 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 7 Jan 2025 13:21:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 7 Jan 2025 13:21:10 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] PCI: mediatek: Remove the usage of virt_to_phys
Date: Tue, 7 Jan 2025 13:20:58 +0800
Message-ID: <20250107052108.8643-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_212119_123482_BF68CB23 
X-CRM114-Status: GOOD (  14.33  )
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

Remove the usage of virt_to_phys, as it will cause sparse warnings when
building on some platforms.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 3bcfc4e58ba2..dc1e5fd6c7aa 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -178,6 +178,7 @@ struct mtk_pcie_soc {
  * @phy: pointer to PHY control block
  * @slot: port slot
  * @irq: GIC irq
+ * @msg_addr: MSI message address
  * @irq_domain: legacy INTx IRQ domain
  * @inner_domain: inner IRQ domain
  * @msi_domain: MSI IRQ domain
@@ -198,6 +199,7 @@ struct mtk_pcie_port {
 	struct phy *phy;
 	u32 slot;
 	int irq;
+	phys_addr_t msg_addr;
 	struct irq_domain *irq_domain;
 	struct irq_domain *inner_domain;
 	struct irq_domain *msi_domain;
@@ -393,12 +395,10 @@ static struct pci_ops mtk_pcie_ops_v2 = {
 static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 {
 	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
-	phys_addr_t addr;
 
 	/* MT2712/MT7622 only support 32-bit MSI addresses */
-	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
 	msg->address_hi = 0;
-	msg->address_lo = lower_32_bits(addr);
+	msg->address_lo = lower_32_bits(port->msg_addr);
 
 	msg->data = data->hwirq;
 
@@ -510,10 +510,8 @@ static int mtk_pcie_allocate_msi_domains(struct mtk_pcie_port *port)
 static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
 {
 	u32 val;
-	phys_addr_t msg_addr;
 
-	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
-	val = lower_32_bits(msg_addr);
+	val = lower_32_bits(port->msg_addr);
 	writel(val, port->base + PCIE_IMSI_ADDR);
 
 	val = readl(port->base + PCIE_INT_MASK);
@@ -913,6 +911,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
 	struct mtk_pcie_port *port;
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
+	struct resource *regs;
 	char name[10];
 	int err;
 
@@ -921,12 +920,18 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
 		return -ENOMEM;
 
 	snprintf(name, sizeof(name), "port%d", slot);
-	port->base = devm_platform_ioremap_resource_byname(pdev, name);
+	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (!regs)
+		return -EINVAL;
+
+	port->base = devm_ioremap_resource(dev, regs);
 	if (IS_ERR(port->base)) {
 		dev_err(dev, "failed to map port%d base\n", slot);
 		return PTR_ERR(port->base);
 	}
 
+	port->msg_addr = regs->start + PCIE_MSI_VECTOR;
+
 	snprintf(name, sizeof(name), "sys_ck%d", slot);
 	port->sys_ck = devm_clk_get(dev, name);
 	if (IS_ERR(port->sys_ck)) {
-- 
2.46.0


