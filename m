Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD41CF8844
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZkvAUGq0FyIS/gO1w2XfWBYjV3DPw0PAbHxjlCLMgSc=; b=a2OhCE07WuQpGIo2oBvRCx5g0y
	iLuj8L2Gh1po9ZMp+MfuGptSTOKQFIH0qKz9ARuA0YupuSb/8wU4O0SIscme5hrKybUDTXJTU3yKM
	mv4ITfniIPryVDsbiaL+z8D1kwnxiZ0fc1XxPSn+2fxW11VSgxTUbE+xN0sYIK2i2C6l0HRaGRszV
	+b3KDTLv6XpQkmXYM0zZuTF5cpXD2qFjwEM5sG0snp+B2+KGSZqSeAfDA2a1VWC2WCIPkStl/IaEL
	u8KnyxaHEwupa0kfQo4s5RhaZCcTOsHdO11BS+L2M8r4xxvgU0iHbL3+0SumzMLGGNMWl8PrJidKL
	3qTba55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2yU-00000006b5I-3efY;
	Thu, 20 Nov 2025 11:37:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2yU-00000006b57-0qqJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5298B60149;
	Thu, 20 Nov 2025 11:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19D4C4CEF1;
	Thu, 20 Nov 2025 11:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763638637;
	bh=RrpUxwlBxKhJ94bRnqangTKZ1qMlkCMgwAyjW/+afBM=;
	h=From:To:Cc:Subject:Date:From;
	b=WZXRD80aP88NiIaZ79MOFF2VCZePCpW+tdSqFzcVIWdpzUH6lTMI50kHoomCs5PG+
	 a0rvejtM4w3iIfB00Cakw52U7Po8fO9j8KxXn3YWBOU/8CeafQQEy6fd3iAFs4mbXZ
	 VAkX05CMtQuUPLXUXfsmDuCw9Ga73Lim4j+ghC0q2o36N9JHXRA5WbHxEwqVp3yDpF
	 fTyzh/SZdJEVTHCiTQNHPh4bI4RQ23KQxo05iCjla3bqJo0WGAddcQT4RoTR0cMAWW
	 8TylQ7rlvi2BjgpV42WPBN8blvu9G+Z4lKefiNnGFyPBMllk99dxLEvzTd+lTEcVaq
	 t24EPhRww7G3w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM2yQ-00000006rX7-35N8;
	Thu, 20 Nov 2025 11:37:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Radu Rendec <rrendec@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH] PCI: host-generic: Move bridge allocation outside of pci_host_common_init()
Date: Thu, 20 Nov 2025 11:36:30 +0000
Message-ID: <20251120113630.2036078-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, rrendec@redhat.com, bhelgaas@google.com, mani@kernel.org, robh@kernel.org, kwilczynski@kernel.org, lpieralisi@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Having the host bridge allocation inside pci_host_common_init() results
in a lot of complexity in the pcie-apple driver (the only direct user
of this function outside of code PCI code).

It forces the allocation of driver-specific tracking structures outside
of the bridge allocation, which in turns requires it to use inneficient
data structures to match the bridge and the private structre as needed.

Instead, let the bridge structure be passed to pci_host_common_init(),
allowing the driver to allocate it together with the private data,
as it is usually intended. The driver can then retrieve the bridge
via the owning device attached to the PCI config window structure.
This allows the pcie-apple driver to be significantly simplified.

Both core and driver code are changed in one go to avoid going via
a transitional interface.

Link: https://lore.kernel.org/r/86jyzms036.wl-maz@kernel.org
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Radu Rendec <rrendec@redhat.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Wilczyński <kwilczynski@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/pci/controller/pci-host-common.c | 13 ++++----
 drivers/pci/controller/pci-host-common.h |  1 +
 drivers/pci/controller/pcie-apple.c      | 42 ++++--------------------
 3 files changed, 14 insertions(+), 42 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index 810d1c8de24e9..c473e7c03baca 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -53,16 +53,12 @@ struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 EXPORT_SYMBOL_GPL(pci_host_common_ecam_create);
 
 int pci_host_common_init(struct platform_device *pdev,
+			 struct pci_host_bridge *bridge,
 			 const struct pci_ecam_ops *ops)
 {
 	struct device *dev = &pdev->dev;
-	struct pci_host_bridge *bridge;
 	struct pci_config_window *cfg;
 
-	bridge = devm_pci_alloc_host_bridge(dev, 0);
-	if (!bridge)
-		return -ENOMEM;
-
 	of_pci_check_probe_only();
 
 	platform_set_drvdata(pdev, bridge);
@@ -85,12 +81,17 @@ EXPORT_SYMBOL_GPL(pci_host_common_init);
 int pci_host_common_probe(struct platform_device *pdev)
 {
 	const struct pci_ecam_ops *ops;
+	struct pci_host_bridge *bridge;
 
 	ops = of_device_get_match_data(&pdev->dev);
 	if (!ops)
 		return -ENODEV;
 
-	return pci_host_common_init(pdev, ops);
+	bridge = devm_pci_alloc_host_bridge(&pdev->dev, 0);
+	if (!bridge)
+		return -ENOMEM;
+
+	return pci_host_common_init(pdev, bridge, ops);
 }
 EXPORT_SYMBOL_GPL(pci_host_common_probe);
 
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index 51c35ec0cf37d..b5075d4bd7eb3 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -14,6 +14,7 @@ struct pci_ecam_ops;
 
 int pci_host_common_probe(struct platform_device *pdev);
 int pci_host_common_init(struct platform_device *pdev,
+			 struct pci_host_bridge *bridge,
 			 const struct pci_ecam_ops *ops);
 void pci_host_common_remove(struct platform_device *pdev);
 
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 0380d300adca6..a902aa81a497e 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -206,9 +206,6 @@ struct apple_pcie_port {
 	int			idx;
 };
 
-static LIST_HEAD(pcie_list);
-static DEFINE_MUTEX(pcie_list_lock);
-
 static void rmw_set(u32 set, void __iomem *addr)
 {
 	writel_relaxed(readl_relaxed(addr) | set, addr);
@@ -724,32 +721,9 @@ static int apple_msi_init(struct apple_pcie *pcie)
 	return 0;
 }
 
-static void apple_pcie_register(struct apple_pcie *pcie)
-{
-	guard(mutex)(&pcie_list_lock);
-
-	list_add_tail(&pcie->entry, &pcie_list);
-}
-
-static void apple_pcie_unregister(struct apple_pcie *pcie)
-{
-	guard(mutex)(&pcie_list_lock);
-
-	list_del(&pcie->entry);
-}
-
 static struct apple_pcie *apple_pcie_lookup(struct device *dev)
 {
-	struct apple_pcie *pcie;
-
-	guard(mutex)(&pcie_list_lock);
-
-	list_for_each_entry(pcie, &pcie_list, entry) {
-		if (pcie->dev == dev)
-			return pcie;
-	}
-
-	return NULL;
+	return pci_host_bridge_priv(dev_get_drvdata(dev));
 }
 
 static struct apple_pcie_port *apple_pcie_get_port(struct pci_dev *pdev)
@@ -875,13 +849,15 @@ static const struct pci_ecam_ops apple_pcie_cfg_ecam_ops = {
 static int apple_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct pci_host_bridge *bridge;
 	struct apple_pcie *pcie;
 	int ret;
 
-	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
-	if (!pcie)
+	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
+	if (!bridge)
 		return -ENOMEM;
 
+	pcie = pci_host_bridge_priv(bridge);
 	pcie->dev = dev;
 	pcie->hw = of_device_get_match_data(dev);
 	if (!pcie->hw)
@@ -897,13 +873,7 @@ static int apple_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	apple_pcie_register(pcie);
-
-	ret = pci_host_common_init(pdev, &apple_pcie_cfg_ecam_ops);
-	if (ret)
-		apple_pcie_unregister(pcie);
-
-	return ret;
+	return pci_host_common_init(pdev, bridge, &apple_pcie_cfg_ecam_ops);
 }
 
 static const struct of_device_id apple_pcie_of_match[] = {
-- 
2.47.3


