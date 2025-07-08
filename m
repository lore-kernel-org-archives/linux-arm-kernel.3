Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F1FC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7EoCCbUDhGrLmJ5eoHCMH/xzeDnar/8Q1vLtA6txuw=; b=TdY5chT9fkycjFv+603rdaukxp
	KV8qD7NAi48JGZ3KdRzLh6qAKS9ShgoAslh2Pnmh2japAr0CuP+osPU/Co9mM0+u2GaYWZAO5Lv2t
	xMNiDw7xrp/99n5j4xvEkRAde/vscyGLXtxdB1VxWbtTRW6iEbiZ+3w5ESjBnwZtDaBPuLy/1969E
	/mpR3F50TSQ4NLhMaIQj7mgOlYmjFgbRlb/uOl+7+5h53IExN5zz5BFvVXoboMEZfDKvPrUz7An6O
	+UA3HNfOgRKgi1m1sQLEZT75YvSuKT0jabFFvL6e7eTpM9iaXdp26XDaFfh70LBaAVjKxPH3MNHLd
	z3iH4wDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA3-00000006Mcb-2xUh;
	Tue, 08 Jul 2025 19:39:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCq-000000067mi-1Cxq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38E5946263;
	Tue,  8 Jul 2025 17:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B6DC4CEFA;
	Tue,  8 Jul 2025 17:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996051;
	bh=XyHVZgTEEU9jeG0R0aHxp6hZU2S5LzzIaxTXL9QhFBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KZEa4lmr/XbpSiQfqy9xVJlRrLxqSoRb3TAE4WOf6rxiPDcBTlnNnN2iPqVPYdIgx
	 LxHD93E78a9QAQkE6f13GM83mP3T7mCyGtUwmDAztFgFWVcls4LfUMsJjQKvw9LOe9
	 S/0z/mp3EjrLkCaN/KNt9Uxsf2IOz5lxRpn/k1N862bCadwfdyv7zqCti1h+sy6Of0
	 81c9jVULtaOrKRJ0YejX3n2bRkO7EsfZUCXyPoM760hSwaBv56rVOucwjcLO7hPH9V
	 huv2Gff272VBr8LbUwKy3BKnkk/5mbDwQxHDt1Zi7Fh6bbGVAaYg4sGM4kfYlsNY90
	 BtMnq0bMi0zoQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCn-00Dqhw-6d;
	Tue, 08 Jul 2025 18:34:09 +0100
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
Subject: [PATCH v2 03/13] PCI: xgene: Drop useless conditional compilation
Date: Tue,  8 Jul 2025 18:33:54 +0100
Message-Id: <20250708173404.1278635-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250708173404.1278635-1-maz@kernel.org>
References: <20250708173404.1278635-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_103412_350145_FB564C24 
X-CRM114-Status: GOOD (  14.13  )
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

pci-xgene.c only gets compiled if CONFIG_PCI_XGENE is selected.
It is therefore pointless to check for CONFIG_PCI_XGENE inside
the driver.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index f26cb58f814ec..a848f98203ae4 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -58,7 +58,6 @@
 #define XGENE_PCIE_IP_VER_1		1
 #define XGENE_PCIE_IP_VER_2		2
 
-#if defined(CONFIG_PCI_XGENE) || (defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS))
 struct xgene_pcie {
 	struct device_node	*node;
 	struct device		*dev;
@@ -189,7 +188,6 @@ static int xgene_pcie_config_read32(struct pci_bus *bus, unsigned int devfn,
 
 	return PCIBIOS_SUCCESSFUL;
 }
-#endif
 
 #if defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS)
 static int xgene_get_csr_resource(struct acpi_device *adev,
@@ -280,7 +278,6 @@ const struct pci_ecam_ops xgene_v2_pcie_ecam_ops = {
 };
 #endif
 
-#if defined(CONFIG_PCI_XGENE)
 static u64 xgene_pcie_set_ib_mask(struct xgene_pcie *port, u32 addr,
 				  u32 flags, u64 size)
 {
@@ -670,4 +667,3 @@ static struct platform_driver xgene_pcie_driver = {
 	.probe = xgene_pcie_probe,
 };
 builtin_platform_driver(xgene_pcie_driver);
-#endif
-- 
2.39.2


