Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66EFC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 17:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7EoCCbUDhGrLmJ5eoHCMH/xzeDnar/8Q1vLtA6txuw=; b=KGVp4aj5blKiEb5UoQoy2rt3Ys
	cQ64lRsXxm1mRU3OlVZ02Zt5ktouu2eWEO2JJvhPYBNjA5l0gC+B8H5VM3tSZR6/uWnGmEECQcT5m
	dCvnKshvlmHdvnaUv+dEM6pqnV6bQA3FAIRuJSNSIVj7OSN7NowFDqYFb3+eGx47yFBsUdsZ0bcyF
	V35YSNb8MMhWb3q7TGJGAne874MN4OHLcSuOSL65dpdMz2pgglhKvSo6x55r/rR9afBqGI9Jij8Ys
	ixy6DaZqIiN6lTxVyYA4nL1C9v1VCWe1K1mOFpGPI0zPVJ7y47PaRw3FLAkT7c+6nVpWPcy6FXgAR
	WDi/pR3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZUl-0000000H8bg-1JcF;
	Sat, 28 Jun 2025 17:37:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZNl-0000000H7Tg-0yXK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 17:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FD4A463EC;
	Sat, 28 Jun 2025 17:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8DDC4CEF2;
	Sat, 28 Jun 2025 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751131828;
	bh=XyHVZgTEEU9jeG0R0aHxp6hZU2S5LzzIaxTXL9QhFBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lo7vjY6he4xWIMh1pX/S8sSy8sa2VSOPIMc9V5Ayn8nWMgHmsFhuJ7XMXSxjJ52Ri
	 g1u7MJqMzIS5gAbrvtsirGBRVzU+J+tQDrOtmrWX+FeoveZEOg51x/E2EqwwhX+ToQ
	 vh8AoAK8zs8raM2LEI0Q7yXxgLkG4qXp9OZ0hhdZZDXz38OgGB0bufrYuR5+3ho5Iu
	 L0y0IIkVBue7vuZrkOS7kYJps0fNDG04KEvIlnwF3LMQ4eebPbaMdDqhHHcI6xh8tE
	 1AKc1Qn9Akab5x7+8aEuRWHTRmh7NQxKpFXfFvSPoxMBdeux4CfGwBKaZ6ucUCgH97
	 I1WYQBAnKIa/g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uVZNi-00AqZC-8D;
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
Subject: [PATCH 03/12] PCI: xgene: Drop useless conditional compilation
Date: Sat, 28 Jun 2025 18:29:56 +0100
Message-Id: <20250628173005.445013-4-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250628_103029_295257_AC17F6FD 
X-CRM114-Status: GOOD (  13.08  )
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


