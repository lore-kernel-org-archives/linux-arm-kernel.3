Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EC4C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rf+jWFhF/xHAJ0Q9DHTYubDb8C8kzdpy+oWonX0R20Y=; b=m298z5w0IiUeE6CbjvLguSnEW7
	7ygzCJvsM+ycUOavNFNWpfTUvl6U74cb4P7Ncu3i69rkb5xMsedqkBVmKlxM41jb3ouGrGGHE5cre
	dT9f05GVta5+x44Vp2+VGQyaBRm41SI/yumdaRMnEBoTsSxhBctXFqr7CcXLVD6Id/TT1sVfndk8b
	A+X5Rqihdl4u9N1quMLdN/orWJePN68MJf94NdrBa8AB1phudDrckwN0zEzLVHd8G2d0DnDXkS9Ra
	ym04qSiwwlWHwh/Lg66Ce9XUV8XOt9q12VNGOd3jWybmiPWwMODjIa1Z1fTw9/ykLPwbEggz8sm9G
	2FwhLCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eWt-0000000BUCH-1MIL;
	Wed, 23 Apr 2025 18:09:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cuf-0000000B7UF-3pVb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 16:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1294FA4BD16;
	Wed, 23 Apr 2025 16:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4D2C4CEE2;
	Wed, 23 Apr 2025 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745425528;
	bh=03WXX9bI80F4RuR2COjFJcSHqoLClrUtwLqycde4R5o=;
	h=From:To:Cc:Subject:Date:From;
	b=KdtHlFVG+C2C3wnnQCGlOHOAd1wKtHZPuDrQpRmQqsuVUHE72k4FzU5qWE1J5rgR/
	 /ZsIDe6BB+Yiufu3qFAbjC6/+P6tEHWQWsgwekIt5GO4tVg9gLMElRV8Xc4N1NV8BJ
	 PTCC2Sq9JC+byFkU3fcrcOgH6m+0ahty6Ty/OfhIBWSUGTHu1Fx0TDWzk1zA4JfU+G
	 F3QMd7ijPr1RMiQ2XZoqhHkEGsF3cNdjR4lQEDhevqQL1e+7dRHrNYzUWWgV/BLJ9D
	 2fRRm/Sp9fBSmYrKrModt5KlcNdqrhkfiIoKCqgxu0ssRpjpOAwtffqvY0tDdrBhII
	 XCdfSjKgyS1Pw==
From: Arnd Bergmann <arnd@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pci: j721e: fix host/endpoint dependencies
Date: Wed, 23 Apr 2025 18:25:16 +0200
Message-Id: <20250423162523.2060405-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_092530_084152_53BB43F8 
X-CRM114-Status: GOOD (  15.97  )
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

From: Arnd Bergmann <arnd@arndb.de>

The j721e driver has a single platform driver that can be built-in or
a loadable module, but it calls two separate backend drivers depending
on whether it is a host or endpoint.

If the two modes are not the same, we can end up with a situation where
the built-in pci-j721e driver tries to call the modular host or endpoint
driver, which causes a link failure:

ld.lld-21: error: undefined symbol: cdns_pcie_ep_setup
>>> referenced by pci-j721e.c
>>>               drivers/pci/controller/cadence/pci-j721e.o:(j721e_pcie_probe) in archive vmlinux.a

ld.lld-21: error: undefined symbol: cdns_pcie_host_setup
>>> referenced by pci-j721e.c
>>>               drivers/pci/controller/cadence/pci-j721e.o:(j721e_pcie_probe) in archive vmlinux.a

Rework the dependencies so that the 'select' is done by the common
Kconfig symbol, based on which of the two are enabled. Effectively
this means that having one built-in makes the other either built-in
or disabled, but all configurations will now build.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pci/controller/cadence/Kconfig     | 4 ++--
 drivers/pci/controller/cadence/pci-j721e.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
index 72d7d264d6c3..666e16b6367f 100644
--- a/drivers/pci/controller/cadence/Kconfig
+++ b/drivers/pci/controller/cadence/Kconfig
@@ -44,12 +44,13 @@ config PCIE_CADENCE_PLAT_EP
 
 config PCI_J721E
 	tristate
+	select PCIE_CADENCE_HOST if PCI_J721E_HOST != n
+	select PCIE_CADENCE_EP if PCI_J721E_EP != n
 
 config PCI_J721E_HOST
 	tristate "TI J721E PCIe controller (host mode)"
 	depends on ARCH_K3 || COMPILE_TEST
 	depends on OF
-	select PCIE_CADENCE_HOST
 	select PCI_J721E
 	help
 	  Say Y here if you want to support the TI J721E PCIe platform
@@ -61,7 +62,6 @@ config PCI_J721E_EP
 	depends on ARCH_K3 || COMPILE_TEST
 	depends on OF
 	depends on PCI_ENDPOINT
-	select PCIE_CADENCE_EP
 	select PCI_J721E
 	help
 	  Say Y here if you want to support the TI J721E PCIe platform
diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index b87bc26bbf06..f0051805f9e9 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -475,7 +475,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 	switch (mode) {
 	case PCI_MODE_RC:
-		if (!IS_ENABLED(CONFIG_PCIE_CADENCE_HOST))
+		if (!IS_ENABLED(CONFIG_PCI_J721E_HOST))
 			return -ENODEV;
 
 		bridge = devm_pci_alloc_host_bridge(dev, sizeof(*rc));
@@ -494,7 +494,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 		pcie->cdns_pcie = cdns_pcie;
 		break;
 	case PCI_MODE_EP:
-		if (!IS_ENABLED(CONFIG_PCIE_CADENCE_EP))
+		if (!IS_ENABLED(CONFIG_PCI_J721E_EP))
 			return -ENODEV;
 
 		ep = devm_kzalloc(dev, sizeof(*ep), GFP_KERNEL);
-- 
2.39.5


