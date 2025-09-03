Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B06CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOJd8niW0aLqEJaIsbx3UOkA/f/bi/oRRBZYE6rFVXk=; b=BwS/VPdm+mm0kk/z6DC9zDAUOX
	nYHrZk06HADp2eP1DsaPKemWs9YS8Dr8ivE/wELJ8O3rFvtFoKT6qdv4XqbnFqEOxASFd+eqmgpcc
	Of+ABKXiO9Yo06AgiJMX90tK6FggLXSjAFFFJql0enjy0/JStLFmA3BTRsmqNGqhqmAKbrCzX8tUT
	sdrJB4yf+TdzOVoN9mT4L2nQdAAovQr2Tx0i/XmxqpWu0HHAgPQkXO7Ey/mtIcrri4b7xmlIf4jEA
	/rA9k/WrBEDfmITWWC1nDVjh8SHE8WWCtchmR9Y42SctOEj6BtJrsIaYxpdGvZjFpQAgCiK6T5t1Y
	LBTOGDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utp5J-00000006q2Z-0IqM;
	Wed, 03 Sep 2025 15:07:41 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmsA-00000006ROO-0Z5c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:45:59 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583CjlAm2831316;
	Wed, 3 Sep 2025 07:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756903547;
	bh=IOJd8niW0aLqEJaIsbx3UOkA/f/bi/oRRBZYE6rFVXk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ILACtSZjqUdPHfO/CKnE5REYy9/xAYra7/30YxqqurZLlCjCb7EXmVz+tEweELlq2
	 GtxE5MxnObAPC05pnN425IuO1J2v3Tkb8vKnqYnwxptHq2l1jRVAS5jIoR23E+JvBk
	 D0sXlxczGtn8AtoAtGepFirZ8fVs7xWj3mLkyBQE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583CjlZ33522784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 07:45:47 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 07:45:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 07:45:46 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583Cj5wW1576150;
	Wed, 3 Sep 2025 07:45:40 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <fan.ni@samsung.com>, <quic_wenbyao@quicinc.com>,
        <namcao@linutronix.de>, <mayank.rana@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <quic_schintav@quicinc.com>,
        <shradha.t@samsung.com>, <inochiama@gmail.com>, <cassel@kernel.org>,
        <kishon@kernel.org>, <18255117159@163.com>, <rongqianfeng@vivo.com>,
        <jirislaby@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 05/11] PCI: keystone: Add ks_pcie_free_msi_irq() helper for cleanup
Date: Wed, 3 Sep 2025 18:14:46 +0530
Message-ID: <20250903124505.365913-6-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903124505.365913-1-s-vadapalli@ti.com>
References: <20250903124505.365913-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054558_262821_3E8A297F 
X-CRM114-Status: GOOD (  15.01  )
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

Introduce the helper function ks_pcie_free_msi_irq() which will undo the
configuration performed by the ks_pcie_config_msi_irq() function. This will
be required for implementing a future helper function to undo the
configuration performed by the ks_pcie_host_init() function.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 3d10e1112131..6cedb6dc4650 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -666,6 +666,31 @@ static void ks_pcie_intx_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static void ks_pcie_free_msi_irq(struct keystone_pcie *ks_pcie)
+{
+	struct device_node *np = ks_pcie->np;
+	struct device_node *intc_np;
+	int irq_count, irq, i;
+
+	if (!IS_ENABLED(CONFIG_PCI_MSI))
+		return;
+
+	/* Nothing to do if MSI Interrupt Controller does not exist */
+	intc_np = of_get_child_by_name(np, "msi-interrupt-controller");
+	if (!intc_np)
+		return;
+
+	/* irq_count should be non-zero. Else, ks_pcie_host_init would have failed. */
+	irq_count = of_irq_count(intc_np);
+
+	for (i = 0; i < irq_count; i++) {
+		/* We expect to get an irq since it succeeded during 'config'. */
+		irq = irq_of_parse_and_map(intc_np, i);
+		irq_set_chained_handler(irq, NULL);
+	}
+	of_node_put(intc_np);
+}
+
 static int ks_pcie_config_msi_irq(struct keystone_pcie *ks_pcie)
 {
 	struct device *dev = ks_pcie->pci->dev;
-- 
2.43.0


