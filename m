Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9047FC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2WSxz+JMtsXBJVo1fTfILuMem/98S1AIbIxNay4E1s=; b=UfkRseSmOTlEs2isYe3LZXm/Bl
	5tPjGlPNK96AuTvpNdgINB2nzo0rkYEG/z0CmdKY6CeVGULE55Rxje1mdHL0NSsbwhmiNw8G/K0v9
	FAIg6lIKRaAA2xDOIBYyKZrngJl2nQnBWSJRa28TSAsKdbufUFe0oFc6YnO408Gv7lc1VSgIOxVRa
	JB+tR/mTeVm1Wh7pt1nET8Ie+p9uf446XS0Dr6tjNvGO+nfD3PRWvNdTGGxlnfbEuggDS22R3/gKl
	mR8nr19tmOiAXu176zdKjujYipwXRr34mwrI8DcboDzwvlfZgJBFo5yzoZYHaEopyrV65erQRlvN0
	hP/fXerg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZX3-0000000H8n5-0R9J;
	Sat, 28 Jun 2025 17:40:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZNl-0000000H7Tb-11W1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 17:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AC04463E6;
	Sat, 28 Jun 2025 17:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45383C4CEED;
	Sat, 28 Jun 2025 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751131828;
	bh=9TTQFkyY0M8aTj6Iv8cpYI5ilm3sw2M2ZI3G1K0Exkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cFR9aOOrkWMwCpnFCv0RgIjSMofAj1v6SNEV0R8UXHUPufnSFsyiPoF2aI5AIJIgL
	 +vEFn4DUaHD/d87N8hzkxecozlxl2UnWDlpjiJL4jYnSYw1Kq8v7Eyb4h100jEYXdC
	 +53idaD1n9dxEMF8VDTLKUcxccEqE3fccC7oPSadlMFDZtmr3yGp3fHZ0xGSrCxFFR
	 CYweTG4X3QncSk/0PUXtC6kT9FjslaQbIODfMtPVd+fYoNgFclyIBeJzJvnTEAY+7L
	 zikQTLcoQdMhzzqbiJwSdXpAtzRUUDM7AQNg1NW09i3pLMv3ipWUr4Cr1vjzYK4Rxx
	 XQIpwzuJJDhkg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uVZNi-00AqZC-13;
	Sat, 28 Jun 2025 18:30:26 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 02/12] PCI: xgene: Defer probing if the MSI widget driver hasn't probed yet
Date: Sat, 28 Jun 2025 18:29:55 +0100
Message-Id: <20250628173005.445013-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250628173005.445013-1-maz@kernel.org>
References: <20250628173005.445013-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_103029_332157_663049CA 
X-CRM114-Status: GOOD (  14.49  )
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

As a preparatory work to make the XGene MSI driver probe less of
a sorry hack, make the PCI driver check for the availability of
the MSI parent domain, and defer the probing otherwise.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index 1e2ebbfa36d19..f26cb58f814ec 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -12,6 +12,7 @@
 #include <linux/jiffies.h>
 #include <linux/memblock.h>
 #include <linux/init.h>
+#include <linux/irqdomain.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
@@ -594,6 +595,24 @@ static struct pci_ops xgene_pcie_ops = {
 	.write = pci_generic_config_write32,
 };
 
+static bool xgene_check_pcie_msi_ready(void)
+{
+	struct device_node *np;
+	struct irq_domain *d;
+
+	if (!IS_ENABLED(CONFIG_PCI_XGENE_MSI))
+		return true;
+
+	np = of_find_compatible_node(NULL, NULL, "apm,xgene1-msi");
+	if (!np)
+		return true;
+
+	d = irq_find_matching_host(np, DOMAIN_BUS_PCI_MSI);
+	of_node_put(np);
+
+	return d && irq_domain_is_msi_parent(d);
+}
+
 static int xgene_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -602,6 +621,10 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 	struct pci_host_bridge *bridge;
 	int ret;
 
+	if (!xgene_check_pcie_msi_ready())
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+				     "MSI driver not ready\n");
+
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*port));
 	if (!bridge)
 		return -ENOMEM;
-- 
2.39.2


