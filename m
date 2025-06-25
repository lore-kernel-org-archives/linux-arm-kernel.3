Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CDEC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dd9VUWqlNFiOTbi2lCG5u3fbwVqcN3vkTNG2bkOAolI=; b=pLd3EP+LVo9JLcqYOck44YzCr8
	y9WBEBYhNQfJIzpQ3ccou9Ot8YVqt1CQ6S7PN57tf/C3oNb9451xC5Q+bnSqxY+iqvfnhh/VYzREt
	8+mG5a97K3aCKDKGzX4K/h5pE5lZ0+ffY+nME9dT0TBZN/pz3gdYWY7xBvZNVXZv01z6ZRE4hzacr
	OzFteE7yZt2mQdF2QNsH/bJeCuWRCjQuoN9ubSssEEhywHUWz57XXjERYTFQYGHpTvXc23tyCsZer
	T/YnnkciXbeDWU2SkwImIZF2RRtXpI4xy1uVOwBNnnAX37OE3VhvnRduCPrZ7QQTsaV4nXBIdYZGn
	rHu1gvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURRq-000000091Vh-24ly;
	Wed, 25 Jun 2025 14:50:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUO8s-00000008Rm9-2By0;
	Wed, 25 Jun 2025 11:18:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A88EB61787;
	Wed, 25 Jun 2025 11:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED69C4CEF7;
	Wed, 25 Jun 2025 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850293;
	bh=gLYaNgAZuxDXE2XrENbyIyyl/VKE48uI7zW50LW8qC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TLqOBvfB6N8p+vlU3KWt7GkA1uZ/xntkHNvXFi1CcNfZbGlt3QyP2K8GtBpq7CJQs
	 K+McshF92vdpZpsGfqOP4/yijvY1yYrannvex/UVQrfN78IEgQ5vJeItz5RK2z7ISp
	 Cg35w/yDANBYSFYgCK5iw1Dx7dttT3M83D+FudDcz8Pw423ZmJcRzsMLvAJ9TaWD3+
	 Nt4G5/vyXahOzmmWKA+9AahEnAVDtNrrQ17Q1BpBFM0Jy0Qp/pMNToLU9MrYQP3Ytu
	 5TfGiRWnjC9CefbmRntnzbuwmr5bkV9wkh0+2UVeBZi+/KYe/LJ5DSAz3dizGpJv36
	 /NcNHB92reeCQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uUO8p-009qM2-64;
	Wed, 25 Jun 2025 12:18:11 +0100
From: Marc Zyngier <maz@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] PCI: apple: Add tracking of probed root ports
Date: Wed, 25 Jun 2025 12:18:05 +0100
Message-Id: <20250625111806.4153773-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250625111806.4153773-1-maz@kernel.org>
References: <20250625111806.4153773-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: bhelgaas@google.com, alyssa@rosenzweig.io, robh@kernel.org, mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org, j@jannau.net, geert+renesas@glider.be, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

The apple driver relies on being able to directly find the matching
root port structure from the platform device that represents this
port.

A previous hack stashed a pointer to the root port structure in
the config window private pointer, but that ended up relying on
assumptions that break other drivers.

Instead, bite the bullet and track the association as part of the
driver itself as a list of probed root ports.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pcie-apple.c | 53 ++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 77fe739766548..0380d300adca6 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -187,6 +187,7 @@ struct apple_pcie {
 	const struct hw_info	*hw;
 	unsigned long		*bitmap;
 	struct list_head	ports;
+	struct list_head	entry;
 	struct completion	event;
 	struct irq_fwspec	fwspec;
 	u32			nvecs;
@@ -205,6 +206,9 @@ struct apple_pcie_port {
 	int			idx;
 };
 
+static LIST_HEAD(pcie_list);
+static DEFINE_MUTEX(pcie_list_lock);
+
 static void rmw_set(u32 set, void __iomem *addr)
 {
 	writel_relaxed(readl_relaxed(addr) | set, addr);
@@ -720,13 +724,45 @@ static int apple_msi_init(struct apple_pcie *pcie)
 	return 0;
 }
 
+static void apple_pcie_register(struct apple_pcie *pcie)
+{
+	guard(mutex)(&pcie_list_lock);
+
+	list_add_tail(&pcie->entry, &pcie_list);
+}
+
+static void apple_pcie_unregister(struct apple_pcie *pcie)
+{
+	guard(mutex)(&pcie_list_lock);
+
+	list_del(&pcie->entry);
+}
+
+static struct apple_pcie *apple_pcie_lookup(struct device *dev)
+{
+	struct apple_pcie *pcie;
+
+	guard(mutex)(&pcie_list_lock);
+
+	list_for_each_entry(pcie, &pcie_list, entry) {
+		if (pcie->dev == dev)
+			return pcie;
+	}
+
+	return NULL;
+}
+
 static struct apple_pcie_port *apple_pcie_get_port(struct pci_dev *pdev)
 {
 	struct pci_config_window *cfg = pdev->sysdata;
-	struct apple_pcie *pcie = cfg->priv;
+	struct apple_pcie *pcie;
 	struct pci_dev *port_pdev;
 	struct apple_pcie_port *port;
 
+	pcie = apple_pcie_lookup(cfg->parent);
+	if (WARN_ON(!pcie))
+		return NULL;
+
 	/* Find the root port this device is on */
 	port_pdev = pcie_find_root_port(pdev);
 
@@ -806,10 +842,14 @@ static void apple_pcie_disable_device(struct pci_host_bridge *bridge, struct pci
 
 static int apple_pcie_init(struct pci_config_window *cfg)
 {
-	struct apple_pcie *pcie = cfg->priv;
 	struct device *dev = cfg->parent;
+	struct apple_pcie *pcie;
 	int ret;
 
+	pcie = apple_pcie_lookup(dev);
+	if (WARN_ON(!pcie))
+		return -ENOENT;
+
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
 		ret = apple_pcie_setup_port(pcie, of_port);
 		if (ret) {
@@ -852,13 +892,18 @@ static int apple_pcie_probe(struct platform_device *pdev)
 
 	mutex_init(&pcie->lock);
 	INIT_LIST_HEAD(&pcie->ports);
-	dev_set_drvdata(dev, pcie);
 
 	ret = apple_msi_init(pcie);
 	if (ret)
 		return ret;
 
-	return pci_host_common_init(pdev, &apple_pcie_cfg_ecam_ops);
+	apple_pcie_register(pcie);
+
+	ret = pci_host_common_init(pdev, &apple_pcie_cfg_ecam_ops);
+	if (ret)
+		apple_pcie_unregister(pcie);
+
+	return ret;
 }
 
 static const struct of_device_id apple_pcie_of_match[] = {
-- 
2.39.2


