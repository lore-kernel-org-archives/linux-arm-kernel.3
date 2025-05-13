Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB59AC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDPkxDKXO2MogELdnm4E8rJtNT5xhxpxWl8dSkk2Nho=; b=FmR9UBVa7n3hAzHs4ngkqO8uEo
	iBYfGVWyvDyaCka2z6KeqCHO56LNyvYa9SqLPpPSUGil4yM46II6+YkQ3LH4Eun11wyexHeIrdMCD
	16OdrmM39Wv80xZZPPU8ebQpXBqlRqzmVNvn1Ls06DifDbgQHOpDcLTzWRfKCNHUacUdE5GGh2mMa
	u8b+vx+5F10/TFqaenXu4870tY8CW+qEeuR/bd9ykjJBpn371zz6jopspJuLPO0XM2QRfhvlmuA6I
	rMat+ikDnD1LIFt0Cior2z9nTR/+bcJkqq1PFX6iHIf1ZF8ibWcYR4Zsa97OFKobohuewYuAI/7B+
	vQA6I3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtgX-0000000D8U1-0bp3;
	Tue, 13 May 2025 17:44:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtQd-0000000D5cE-2YCG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C302E4ADD6;
	Tue, 13 May 2025 17:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08FCC4CEF3;
	Tue, 13 May 2025 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747157310;
	bh=3pi3K+153jZ2kXdt+nyEuufOhRW3Pxm1XQ7dRPfM1vw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ErTw/W3ywaBJ3jtS4Pqj74LRXBO+OPQetOWMzPbJW14568am0KQcrJI83itDEuyG5
	 y/ca7qLq3nsXlBpuQx2j19H2WI15sH4iSiIQthLoU3TROIqLpkUEkQa1yu+uhwBhku
	 pzEDuQK42K9bOLThyXEp7VsX8nYr/b4sv4R6roqQQrwRsDkQXwrIP8wMqlTt1NoZEG
	 CbQElVfwjfll+7JDVb8gV9qv1USw1eRX6ia+/+WwvIObNdBEEM4XGWqVStPBkI9bM1
	 Eqdzmt3CGraC+3lBAkzHpoKLyE3Go7P4JcBMPD1h4//Q8EnXCQOg93+rNMIQtzLGtg
	 s1rFCwdwLEEGw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEtQa-00EbRz-OZ;
	Tue, 13 May 2025 18:28:28 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 4/9] irqchip/mvebu: Convert to msi_create_parent_irq_domain() helper
Date: Tue, 13 May 2025 18:28:14 +0100
Message-Id: <20250513172819.2216709-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513172819.2216709-1-maz@kernel.org>
References: <20250513172819.2216709-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, tglx@linutronix.de, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io, thierry.reding@gmail.com, jonathanh@nvidia.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_102831_701107_C933F145 
X-CRM114-Status: GOOD (  13.37  )
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

Now that we have a concise helper to create an MSI parent domain,
switch the mvebu family of interrupt controllers over to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-mvebu-gicp.c | 14 +++++++-------
 drivers/irqchip/irq-mvebu-odmi.c | 14 ++++++--------
 drivers/irqchip/irq-mvebu-sei.c  | 16 +++++++---------
 3 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index 0b2a857b49018..c7c83f8923fcd 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -230,16 +230,16 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	inner_domain = irq_domain_create_hierarchy(parent_domain, 0,
-						   gicp->spi_cnt,
-						   of_node_to_fwnode(node),
-						   &gicp_domain_ops, gicp);
+	inner_domain = msi_create_parent_irq_domain(&(struct irq_domain_info){
+			.fwnode		= of_node_to_fwnode(node),
+			.ops		= &gicp_domain_ops,
+			.size		= gicp->spi_cnt,
+			.host_data	= gicp,
+			.parent		= parent_domain,
+		}, &gicp_msi_parent_ops);
 	if (!inner_domain)
 		return -ENOMEM;
 
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_GENERIC_MSI);
-	inner_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	inner_domain->msi_parent_ops = &gicp_msi_parent_ops;
 	return 0;
 }
 
diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-mvebu-odmi.c
index 306a7754e44f8..e6049f647a017 100644
--- a/drivers/irqchip/irq-mvebu-odmi.c
+++ b/drivers/irqchip/irq-mvebu-odmi.c
@@ -205,19 +205,17 @@ static int __init mvebu_odmi_init(struct device_node *node,
 
 	parent_domain = irq_find_host(parent);
 
-	inner_domain = irq_domain_create_hierarchy(parent_domain, 0,
-						   odmis_count * NODMIS_PER_FRAME,
-						   of_node_to_fwnode(node),
-						   &odmi_domain_ops, NULL);
+	inner_domain = msi_create_parent_irq_domain(&(struct irq_domain_info){
+			.fwnode		= of_node_to_fwnode(node),
+			.ops		= &odmi_domain_ops,
+			.size		= odmis_count * NODMIS_PER_FRAME,
+			.parent		= parent_domain,
+		}, &odmi_msi_parent_ops);
 	if (!inner_domain) {
 		ret = -ENOMEM;
 		goto err_unmap;
 	}
 
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_GENERIC_MSI);
-	inner_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	inner_domain->msi_parent_ops = &odmi_msi_parent_ops;
-
 	return 0;
 
 err_unmap:
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index a962ef4977169..cacf88530e444 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -430,21 +430,19 @@ static int mvebu_sei_probe(struct platform_device *pdev)
 	irq_domain_update_bus_token(sei->ap_domain, DOMAIN_BUS_WIRED);
 
 	/* Create the 'MSI' domain */
-	sei->cp_domain = irq_domain_create_hierarchy(sei->sei_domain, 0,
-						     sei->caps->cp_range.size,
-						     of_node_to_fwnode(node),
-						     &mvebu_sei_cp_domain_ops,
-						     sei);
+	sei->cp_domain = msi_create_parent_irq_domain(&(struct irq_domain_info){
+			.fwnode		= of_node_to_fwnode(node),
+			.ops		= &mvebu_sei_cp_domain_ops,
+			.size		= sei->caps->cp_range.size,
+			.host_data	= sei,
+			.parent		= sei->sei_domain,
+		}, &sei_msi_parent_ops);
 	if (!sei->cp_domain) {
 		pr_err("Failed to create CPs IRQ domain\n");
 		ret = -ENOMEM;
 		goto remove_ap_domain;
 	}
 
-	irq_domain_update_bus_token(sei->cp_domain, DOMAIN_BUS_GENERIC_MSI);
-	sei->cp_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	sei->cp_domain->msi_parent_ops = &sei_msi_parent_ops;
-
 	mvebu_sei_reset(sei);
 
 	irq_set_chained_handler_and_data(parent_irq, mvebu_sei_handle_cascade_irq, sei);
-- 
2.39.2


