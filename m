Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F013CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teF+KOtkZYo/wkZDuBpN5Zu/YgKSEJW0ToMr/y7CuHg=; b=FBsz4jCy30zXoNrt73ohzAORw6
	fNcM6oqC/hbKFKgO011TZb0aIMAbYbfwHmPVnRIAR0YzgbxcqvNK1n4EknsyxCW/2H5jewBKvIUZu
	C8Hua/cgc2xJlEpeowAR54MabpCeqVv6x35w+jU/vOl6avar5qciAISqm7hfl2qHLvcA0iCcZfCzY
	vAxuk1JLIfcOLC7r03Qvrl/HOiMUlie7AfPWCWhFxByOOj2C+LZwkeRhabs42O6d6kKtgcrGSK+BI
	yFRWgVc1a5/Jxwd8T2kQ5i0xoSXBHr1LujiqkTcixc7qLYKtLDdAijavNhCN8XSdwNbr6733hbA0U
	wZ07J6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utp80-00000006qZW-48Uo;
	Wed, 03 Sep 2025 15:10:28 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmsI-00000006RQz-14EI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:46:07 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583Cjrwc3263852;
	Wed, 3 Sep 2025 07:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756903553;
	bh=teF+KOtkZYo/wkZDuBpN5Zu/YgKSEJW0ToMr/y7CuHg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WDntU0TJ4Jrll9dgYmiZorQkVuUyVwE8R8rvP4Wc2V+U2eOftLCC8F2UdneMV3+kt
	 VMs+snVuWp70TrU0cJThnIqp/has5oPxEc3WemxwVKNwWTBrn6nOc7qD9ORxiYRd7j
	 co/6okDFR8hbMZU1lo9meA7KjOqiCgCJKcSe94b0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583Cjrxv3601814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 07:45:53 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 07:45:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 07:45:52 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583Cj5wX1576150;
	Wed, 3 Sep 2025 07:45:46 -0500
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
Subject: [PATCH 06/11] PCI: keystone: Add ks_pcie_free_intx_irq() helper for cleanup
Date: Wed, 3 Sep 2025 18:14:47 +0530
Message-ID: <20250903124505.365913-7-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903124505.365913-1-s-vadapalli@ti.com>
References: <20250903124505.365913-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054606_380836_9FB61D40 
X-CRM114-Status: GOOD (  14.14  )
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
 drivers/pci/controller/dwc/pci-keystone.c | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 6cedb6dc4650..3afa298e89d1 100644
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


