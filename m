Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EE5E9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 21:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRLrhvyu0+ALyELe/9B8IQjkS6dLTi9xhP3Vwc5ZmCQ=; b=jhXs+4U7m9BokdK0nTkFmxiY5w
	vNE22Aob3QMRpqVVYZOPxxDofdR2mTD4ir7kZQAeDZs8QHDtcgd4euocTxlTi8SrCtszRYwGntXDo
	7xVoIp5ZD/OkvQXBai9krqGwaKIqp87Rlza+Z8lQ7eHaajufquHtZ6cHrw//9WEC9rnzkRT42WbGH
	suCjAEhWDrob2ztfmswrTD+rV7cpr1o/4ix7Ya+6wLUOHvj0fLBBRB45PFhskL4ieX9DidiupueXH
	O/YavT+hJyF2WbJuYUylMaztxMK/plbeM8kTCXcWLyuTgaIzf1Zr2/B7O07uCTFiNtsSKoDULiNan
	zDqrcvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsSc6-00000008uqa-10TY;
	Tue, 17 Feb 2026 21:28:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsSbx-00000008umF-3mSR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 21:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5729D61850;
	Tue, 17 Feb 2026 21:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5605C4CEF7;
	Tue, 17 Feb 2026 21:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771363681;
	bh=DLNJ6thciQ1FKfVLXLBIkij44la3XwigLb80Cl2oDMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dFAPruJ7oNmB/6OQ2buMqtV2VMS9EVMtiTfMkhszpe1fAfZXUoCT9eLz0e2a4qtd2
	 SmaahcBBn74i2BHuv+RpTlb4Okud8413t0Y1CfJ6g+CUNG7nO1bawQekMUSdSLlAhP
	 BNIZxANMEfkRq+OidscQlDaHXTsGqlN1IjKa0YoePQElNH8pPYRyy1UPID+ud1FC/8
	 9iCHg/2yCGtzLvGDj9RIIAPrZSyHGDw38gAHXMOdd5dsn94JyfO9/LPfr7OeJ+XxMD
	 zTWEt/iw0XvgHJvDC/xi8AE41mPAv5F6USPv04JG6Z6mgLAwzCd2IKkOYPGJ6t/VVU
	 YOOUSmCHFLLpg==
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
Subject: [PATCH 5/9] PCI: dwc: Replace BAR_RESERVED with BAR_DISABLED in glue drivers
Date: Tue, 17 Feb 2026 22:27:11 +0100
Message-ID: <20260217212707.2450423-16-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217212707.2450423-11-cassel@kernel.org>
References: <20260217212707.2450423-11-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4691; i=cassel@kernel.org; h=from:subject; bh=DLNJ6thciQ1FKfVLXLBIkij44la3XwigLb80Cl2oDMM=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKn3NX7eofZL7l0boT87F2/nh3pD4+584evSZ7tm97N1 4Zrf7O+6ChlYRDjYpAVU2Tx/eGyv7jbfcpxxTs2MHNYmUCGMHBxCsBE5G8w/M/7lBqTn/vUik+u 87b5OW2efJFlp5dvk2nZ7cF6INMw/g4jww6Xu419J9mSrokUP75pFvxIVW2FfN0hF9Xnxzk55qV VMgAA
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
ep->ops->init().

An EPF driver will be able to get/enable BARs that have been disabled/reset
unless they are marked as BAR_RESERVED (see pci_epc_get_next_free_bar()).

Thus all EPC drivers that have a BAR marked as BAR_RESERVED in epc_features
AND call dw_pcie_ep_reset_bar() should really be marked as BAR_DISABLED.

BARs that are marked as BAR_RESERVED in epc_features but for which
dw_pcie_ep_reset_bar() is not called in ep->ops->init() are still kept as
BAR_RESERVED.

No EPC drivers outside drivers/pci/controllers/dwc mark their BARs as
BAR_RESERVED, so there is nothing to do in non-DWC based EPC drivers.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pci-imx6.c         | 12 ++++++------
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  6 +++---
 drivers/pci/controller/dwc/pcie-tegra194.c    |  8 ++++----
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |  4 ++--
 4 files changed, 15 insertions(+), 15 deletions(-)

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


