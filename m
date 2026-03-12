Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AF0105A597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH81gtykJXIOVXe5s+MGyFet0dHU8Xr2AXw313xYU8g=; b=ksOuGwOAGmHdfT9r1jTyQ3ZFwq
	xnQdIlkW3zBPpM9YNhM1cR5IAgDoa8dcbELT8itlYoV+FEJ5wI07Ww+eSwi9cXJ/Hz/nOS9jpgeiR
	tpYN6aamz2NhvwAdXMDiAhyvaWmTXGoQYdGII2W74Bm7MNlAy0fajFQiyl0SomD0w5ialOVjgX+gK
	QNJOydCsLxdd6F7hEF+Y8HkQ4byZsAT+O3HqGr5B+X0T7Jtmk07GZ4SbpHSZ5fSWUhnje5mnFqLdL
	FK1TRSAY+jWV+O/AdoxGiGhIoLdGSZfFDK0zx9frh0617D3paarkmoGrJvVJ8GMYS6gV6g5PaT+Fq
	LrO7zHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fhD-0000000E6Rr-42KA;
	Thu, 12 Mar 2026 13:03:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fhC-0000000E6R4-3hIq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 13:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DE4D460054;
	Thu, 12 Mar 2026 13:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D7BC19424;
	Thu, 12 Mar 2026 13:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320600;
	bh=ZCBIIybt8lnKr9jRT9qv66H2m2IVQcwITj/TT5M7ZNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LDK5iwKlRpMIOYZ0y+o2WLWgp+ECjtiMmcBuzAIjaKk0fjTohdSVojkjoda4Ui/86
	 LxQidBOU8LzykSXol0HwnhX/Va89agPjPkgB8zF2CqoLpcGkIXfkHh3NiTLEllwpVO
	 UiAXwzfDleuVI6KsJeNwrniuVnrR7eNOWUBjOs1mP5GOzXW7vct2YJNEjyv3QOA7w6
	 g3CGHfcNt1yirF4Yu0i/Kee6BhigIUO9pJpeBwEnXv0m6E9IJQLA5AqImPkFLfu0qR
	 3/mxRAIw4sFoL3upuhf0Dzv3brLPoqU0nKokCWs2PV8KEB74vtGqgBViJ9ZD8zMSdT
	 fQI4mE0NCU6QA==
From: Niklas Cassel <cassel@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 06/10] PCI: dwc: Replace certain BAR_RESERVED with BAR_DISABLED in glue drivers
Date: Thu, 12 Mar 2026 14:02:34 +0100
Message-ID: <20260312130229.2282001-18-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312130229.2282001-12-cassel@kernel.org>
References: <20260312130229.2282001-12-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5965; i=cassel@kernel.org; h=from:subject; bh=ZCBIIybt8lnKr9jRT9qv66H2m2IVQcwITj/TT5M7ZNc=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDI37cwNYfVWmmjHdJpv/n7J/0rRj5I36d8+cMrx1N55M uGfNne2dpSyMIhxMciKKbL4/nDZX9ztPuW44h0bmDmsTCBDGLg4BWAilz0ZGVYKnlVeX1lfPF1y y5Oo1liZNvPIrO1TzUX0emboCRnOfcXwm+W95FKXhKdb567Ya/tWc2W+ZHVwVaZZZ0a/W8aJ5E2 nGQA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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

Most DWC based EPC glue drivers that have BARs marked as BAR_RESERVED in
epc_features also call dw_pcie_ep_reset_bar() for these reserved BARs in
ep->ops->init(). (The only exception is pci-keystone.c.)

An EPF driver will be able to get/enable BARs that have been disabled/reset
using dw_pcie_ep_reset_bar(), except if the BAR is marked as BAR_RESERVED
(see pci_epc_get_next_free_bar()).

Thus, all EPC drivers that have BARs marked as BAR_RESERVED in epc_features
and call dw_pcie_ep_reset_bar(), should really have these BARs marked as
BAR_DISABLED. If dw_pcie_ep_reset_bar() is not called by the glue driver,
the BARs are kept as BAR_RESERVED.

No EPC drivers outside drivers/pci/controllers/dwc mark their BARs as
BAR_RESERVED, so there is nothing to do in non-DWC based EPC drivers.

Tested-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pci-imx6.c         | 12 ++++++------
 drivers/pci/controller/dwc/pci-keystone.c     | 12 ++++++++++++
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  6 +++---
 drivers/pci/controller/dwc/pcie-tegra194.c    |  8 ++++----
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |  4 ++--
 5 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index a5b8d0b71677..ec1e3557ca53 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1433,19 +1433,19 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 static const struct pci_epc_features imx8m_pcie_epc_features = {
 	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_DISABLED, },
+	.bar[BAR_3] = { .type = BAR_DISABLED, },
 	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = SZ_256, },
-	.bar[BAR_5] = { .type = BAR_RESERVED, },
+	.bar[BAR_5] = { .type = BAR_DISABLED, },
 	.align = SZ_64K,
 };
 
 static const struct pci_epc_features imx8q_pcie_epc_features = {
 	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
-	.bar[BAR_5] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_DISABLED, },
+	.bar[BAR_3] = { .type = BAR_DISABLED, },
+	.bar[BAR_5] = { .type = BAR_DISABLED, },
 	.align = SZ_64K,
 };
 
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 20fa4dadb82a..278d2dba1db0 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -933,6 +933,18 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
 	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.msix_capable = true,
+	/*
+	 * TODO: This driver is the only DWC glue driver that had BAR_RESERVED
+	 * BARs, but did not call dw_pcie_ep_reset_bar() for the reserved BARs.
+	 *
+	 * To not change the existing behavior, these BARs were not migrated to
+	 * BAR_DISABLED. If this driver wants the BAR_RESERVED BARs to be
+	 * disabled, it should migrate them to BAR_DISABLED.
+	 *
+	 * If they actually should be enabled, then the driver must also define
+	 * what is behind these reserved BARs, see the definition of struct
+	 * pci_epc_bar_rsvd_region.
+	 */
 	.bar[BAR_0] = { .type = BAR_RESERVED, },
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index a6912e85e4dd..9dd05bac22b9 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -422,10 +422,10 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
 	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_DISABLED, },
+	.bar[BAR_3] = { .type = BAR_DISABLED, },
 	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
-	.bar[BAR_5] = { .type = BAR_RESERVED, },
+	.bar[BAR_5] = { .type = BAR_DISABLED, },
 	.align = SZ_1M,
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index f1f70fb824b2..61b9771004da 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1993,10 +1993,10 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
 			.only_64bit = true, },
-	.bar[BAR_2] = { .type = BAR_RESERVED, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
-	.bar[BAR_4] = { .type = BAR_RESERVED, },
-	.bar[BAR_5] = { .type = BAR_RESERVED, },
+	.bar[BAR_2] = { .type = BAR_DISABLED, },
+	.bar[BAR_3] = { .type = BAR_DISABLED, },
+	.bar[BAR_4] = { .type = BAR_DISABLED, },
+	.bar[BAR_5] = { .type = BAR_DISABLED, },
 	.align = SZ_64K,
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index b7020131f626..d6ec6823e180 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -427,8 +427,8 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
 		.align = 1 << 16,
 		.bar[BAR_0] = { .only_64bit = true, },
 		.bar[BAR_2] = { .only_64bit = true, },
-		.bar[BAR_4] = { .type = BAR_RESERVED, },
-		.bar[BAR_5] = { .type = BAR_RESERVED, },
+		.bar[BAR_4] = { .type = BAR_DISABLED, },
+		.bar[BAR_5] = { .type = BAR_DISABLED, },
 	},
 };
 
-- 
2.53.0


