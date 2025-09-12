Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14434CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akHgpV0QofSJh7+9oJVQtZLcV4mul4y96HgMakofh04=; b=acMd9P4MgWV+k7XjU+/cBo1Rir
	InZOJJAAVlufKcpdUiN7XWwDlbo0HdjQpgamUeenJe3XpY75q8Zf/Ty8ECQZexx/XncGpApgQcfAK
	fGFDjvC0SDMP8lxTGih1s2WEDi19Yts/CD2FGR2pB27vA64lYp3Se1CZHkjnIR/gZdfYXHtKDhN+8
	WqaxjxcgKVdp4f+0LFY+Gdrq2/a13FDVXHNpX35YZpAUOkp1aWR5Tm/DNFT4Twa6dFLwFK8w6T7W+
	lk2FWwgLjv9UpY4KAySVQlGq2Y7V1Gq9oWgomBOBlkeboKKO6vNwc9HBPegogOfspBrvPuoAL4sgA
	/tT6ueMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2pt-00000009DqV-06dC;
	Fri, 12 Sep 2025 12:25:05 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2pq-00000009DoS-3Sri
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:25:04 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CCOkQ11030270;
	Fri, 12 Sep 2025 07:24:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757679886;
	bh=akHgpV0QofSJh7+9oJVQtZLcV4mul4y96HgMakofh04=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SFDYyMZuL/p17Zovwj5vhVROb6DWXPCjna7kNgtW0JhBYEpUY8imhcRAi4wjd3NQO
	 BcOW0sKgZkiKeddP6JVN25nNmyR5UTtdR1QBOILm8zCpSi38Sh/iw8BnlUt8k0m1Q3
	 J8LwDK1c/ZiK7MmPEMEihl/1SrhItHkqlrnBnzxM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CCOk9a1291380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 07:24:46 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 07:24:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 07:24:46 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CCNuLY3589278;
	Fri, 12 Sep 2025 07:24:39 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <christian.bruel@foss.st.com>, <qiang.yu@oss.qualcomm.com>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
        <inochiama@gmail.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>
CC: <jirislaby@kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 06/10] PCI: keystone: Add ks_pcie_free_intx_irq() helper for cleanup
Date: Fri, 12 Sep 2025 17:46:17 +0530
Message-ID: <20250912122356.3326888-7-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912122356.3326888-1-s-vadapalli@ti.com>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_052502_959956_3D8BCB05 
X-CRM114-Status: GOOD (  13.56  )
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

Introduce the helper function ks_pcie_free_intx_irq() which will undo the
configuration performed by the ks_pcie_config_intx_irq() function. This
will be required for implementing a future helper function to undo the
configuration performed by the ks_pcie_host_init() function.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1: https://lore.kernel.org/r/20250903124505.365913-7-s-vadapalli@ti.com/
No changes since v1.

 drivers/pci/controller/dwc/pci-keystone.c | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 81c3686688c0..074566fb1d74 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -745,6 +745,35 @@ static int ks_pcie_config_msi_irq(struct keystone_pcie *ks_pcie)
 	return ret;
 }
 
+static void ks_pcie_free_intx_irq(struct keystone_pcie *ks_pcie)
+{
+	struct device_node *np = ks_pcie->np;
+	struct device_node *intc_np;
+	int irq_count, i;
+	u32 val;
+
+	/* Nothing to do if INTx Interrupt Controller does not exist */
+	intc_np = of_get_child_by_name(np, "legacy-interrupt-controller");
+	if (!intc_np)
+		return;
+
+	/* irq_count should be non-zero. Else, ks_pcie_host_init would have failed. */
+	irq_count = of_irq_count(intc_np);
+
+	/* Disable all legacy interrupts */
+	for (i = 0; i < PCI_NUM_INTX; i++) {
+		val = ks_pcie_app_readl(ks_pcie, IRQ_ENABLE_SET(i));
+		val &= ~INTx_EN;
+		ks_pcie_app_writel(ks_pcie, IRQ_ENABLE_SET(i), val);
+	}
+
+	irq_domain_remove(ks_pcie->intx_irq_domain);
+	for (i = 0; i < irq_count; i++)
+		irq_set_chained_handler(ks_pcie->intx_host_irqs[i], NULL);
+
+	of_node_put(intc_np);
+}
+
 static int ks_pcie_config_intx_irq(struct keystone_pcie *ks_pcie)
 {
 	struct device *dev = ks_pcie->pci->dev;
-- 
2.43.0


