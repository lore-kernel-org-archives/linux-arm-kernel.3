Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AE6E9B342
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHtnwtpBsH6V3lbxzRxNNKExZxVsTqngoBCNd5o8Pe8=; b=xYT3amMr73jTU67SxDvXS3HW0E
	dGQtJ6FMJM5hJV4jVYf7X+4tif+QM1ae6RuByz2sMMc60dv1MqaZSRafVIvoe3sinOwWJts8zq94B
	oAZ90xVNZsRUKnE8ZOL+Af7+C8yEiV2o33y3M+zntEivXIrF5zwZlQUSEt3Uvm6vFjMa4wRWj0dWL
	4FzoMzdZr77j9PQaILURpKDeIeCqvIlczCnJGV5FdIF/gKZya7fdGEic3c6BUpeL60Uc0s20zPw6O
	Y3QwxCRj0KtwjJODeyaPGr2ef90xjUZmfBPFwQUg/XHaZZeaCoAEnGaRxMINoVYGze/7q+s2josGn
	d0L75OvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx04h-0000000Cdes-31iw;
	Mon, 02 Mar 2026 10:00:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx04f-0000000Cddd-2owv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 124F5600C4;
	Mon,  2 Mar 2026 10:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE3FC2BCAF;
	Mon,  2 Mar 2026 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772445624;
	bh=L92sc8LqGRDGG9halTHwK0lihmNBrH3kULlpIwzP2D8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r21L6eksQeIJFz4sZX1mRGNuqIZlj64sVF06fry3kdEkblaHvm6grbkDg22F4QvHR
	 +XMAlITzYYc0l9GTpaanXspXvoChlXUmmrlZboP2uwzUncElBZQc6s0i3A5kHkerP4
	 kUCT2Uxweg1cZ1jYynAaYVw/c/N4JrUOk40Omyhf7IrFuwm17lGPXsqysAntKAzIWp
	 2ia1/qN/zKoBXkIZEoYBomLSz6Wd/RTtzlj5TxM4+s6i53fR1mtfwURRzyaujJ8K8g
	 LEHzWd1aBPQZiIfQOMrlzO4l62et0dmtANqbF6goPgiQImIeW8CabQG8MzjUAG6utM
	 GPcx53y24QrrA==
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
Subject: [PATCH v3 5/9] PCI: dwc: Replace certain BAR_RESERVED with BAR_DISABLED in glue drivers
Date: Mon,  2 Mar 2026 10:59:17 +0100
Message-ID: <20260302095913.48155-16-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302095913.48155-11-cassel@kernel.org>
References: <20260302095913.48155-11-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6019; i=cassel@kernel.org; h=from:subject; bh=L92sc8LqGRDGG9halTHwK0lihmNBrH3kULlpIwzP2D8=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKXxleWrHkt/NK2aG+t1q8OQUa7aJtV8y7N5+7vZi+b+ 4vNt/5wRykLgxgXg6yYIovvD5f9xd3uU44r3rGBmcPKBDKEgYtTACYyV5nhN5sXc093vebvr4Ly 6Y+urZh6XF70q9u525J3FbvXVlyx6mf4Z26yu+jhrrt7zYI2H5msK86cFP6w/cX6CSJxz6cKnLO 4ygAA
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
index 31aa9a494dbc..9f9453e8cd23 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1994,10 +1994,10 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
 			.only_64bit = true, },
 	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
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
index f873a1659592..5bde3ee682b5 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -429,8 +429,8 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
 		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 		.bar[BAR_2] = { .only_64bit = true, },
 		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
-		.bar[BAR_4] = { .type = BAR_RESERVED, },
-		.bar[BAR_5] = { .type = BAR_RESERVED, },
+		.bar[BAR_4] = { .type = BAR_DISABLED, },
+		.bar[BAR_5] = { .type = BAR_DISABLED, },
 	},
 };
 
-- 
2.53.0


