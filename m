Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C639C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jZHOEHgkS+65tx+pugPpU1P213T97QrFaLFWRzC6V4=; b=4wxMrdBxSIm9XGo7H1JqiaDa03
	g1P7t2bWTGbysTu3NNGvT3vZtOcr1rmqKnSStsUh55POqSeIOEb1ea//MDhQcNvBfuSPARvem00jn
	jTWpL1bgFZCQIO2b49rvh4/LD8FG0eRZ00Wa50dQW4MuqewohSOHFnmL8SAQAIOo9GaCbtpWtAZaG
	YseqCoHQLkgdVGEed+5+9rh57NGiJhftP62bKBTIjOCMNiuIf+Et7SrYG0NyCZva3BUSdw/okUITy
	mwTjGe29O75PVwC88Fvm1Hww7lceVwjYysnQ8+4BBAspmjCiReVMAZYC1L24eq0WX31t3AGPun3nQ
	8UNJHwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1eg-00000005T2q-2add;
	Tue, 25 Mar 2025 10:37:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1US-00000005Qnj-0gJV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 836145C5CA8;
	Tue, 25 Mar 2025 10:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24742C4CEF1;
	Tue, 25 Mar 2025 10:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742898395;
	bh=zGUc2WvnYPIRzvCp5NMj+Y73rWIsopTAR6HTlwhIfgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pVgKAnP6STdlwjgThZhygZXsyT5DOz0Gr7M3/npeDViBtaDUBKT0w//YXjwD39gO0
	 NEj3SW0aPwZn0shn8AsigfGE4My7dHT8SRNq/Fa4SmLfSJhMj4eMSvDM+BGBqOFz+W
	 MmUqCUvFOfBlyEpHrAczdgUxX/bwOWft2OA9+ciCUAOE+6A/lpxzYVUCjamvF+Z1sH
	 9W5cuC27Pv/GQCPxjUS470qsHb86ymmHUyLj7ttvAQyiT9JUP9QxT86746FvjOi593
	 Ag0+MN9AMnrkcjd4PfYzikV/cbVgKOM5TS9SBzP8OGoMue6rKRr0mWaa506AvDnPPt
	 IcRpMaJCAwlnQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tx1UP-00GsRS-32;
	Tue, 25 Mar 2025 10:26:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v2 04/13] PCI: apple: Move over to standalone probing
Date: Tue, 25 Mar 2025 10:26:01 +0000
Message-Id: <20250325102610.2073863-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250325102610.2073863-1-maz@kernel.org>
References: <20250325102610.2073863-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_032636_319434_B0AEFB44 
X-CRM114-Status: GOOD (  17.97  )
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

Now that we have the required infrastructure, split the Apple PCIe
setup into two categories:

- stuff that has to do with PCI setup stays in the .init() callback

- stuff that is just driver gunk (such as MSI setup) goes into a
  probe routine, which will eventually call into the host-common
  code

The result is a far more logical setup process.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pcie-apple.c | 54 ++++++++++++++++-------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index a7e51bc1c2fe8..9c3103d0d1174 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -730,35 +730,15 @@ static void apple_pcie_disable_device(struct pci_host_bridge *bridge, struct pci
 
 static int apple_pcie_init(struct pci_config_window *cfg)
 {
+	struct apple_pcie *pcie = cfg->priv;
 	struct device *dev = cfg->parent;
-	struct platform_device *platform = to_platform_device(dev);
 	struct device_node *of_port;
-	struct apple_pcie *pcie;
 	int ret;
 
-	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
-	if (!pcie)
-		return -ENOMEM;
-
-	pcie->dev = dev;
-
-	mutex_init(&pcie->lock);
-
-	pcie->base = devm_platform_ioremap_resource(platform, 1);
-	if (IS_ERR(pcie->base))
-		return PTR_ERR(pcie->base);
-
-	cfg->priv = pcie;
-	INIT_LIST_HEAD(&pcie->ports);
-
-	ret = apple_msi_init(pcie);
-	if (ret)
-		return ret;
-
 	for_each_child_of_node(dev->of_node, of_port) {
 		ret = apple_pcie_setup_port(pcie, of_port);
 		if (ret) {
-			dev_err(pcie->dev, "Port %pOF setup fail: %d\n", of_port, ret);
+			dev_err(dev, "Port %pOF setup fail: %d\n", of_port, ret);
 			of_node_put(of_port);
 			return ret;
 		}
@@ -778,14 +758,40 @@ static const struct pci_ecam_ops apple_pcie_cfg_ecam_ops = {
 	}
 };
 
+static int apple_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct apple_pcie *pcie;
+	int ret;
+
+	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
+	if (!pcie)
+		return -ENOMEM;
+
+	pcie->dev = dev;
+	pcie->base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(pcie->base))
+		return PTR_ERR(pcie->base);
+
+	mutex_init(&pcie->lock);
+	INIT_LIST_HEAD(&pcie->ports);
+	dev_set_drvdata(dev, pcie);
+
+	ret = apple_msi_init(pcie);
+	if (ret)
+		return ret;
+
+	return pci_host_common_init(pdev, &apple_pcie_cfg_ecam_ops);
+}
+
 static const struct of_device_id apple_pcie_of_match[] = {
-	{ .compatible = "apple,pcie", .data = &apple_pcie_cfg_ecam_ops },
+	{ .compatible = "apple,pcie" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, apple_pcie_of_match);
 
 static struct platform_driver apple_pcie_driver = {
-	.probe	= pci_host_common_probe,
+	.probe	= apple_pcie_probe,
 	.driver	= {
 		.name			= "pcie-apple",
 		.of_match_table		= apple_pcie_of_match,
-- 
2.39.2


