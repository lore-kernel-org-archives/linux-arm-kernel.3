Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1865BCEE334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 21:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeUkTDE2XCWdTE9mPzGTi/VznDGbXeWWn4JEcdoD+8U=; b=hS7cSPTpvY8BEOTkxd875SCMCj
	iCuLsFIPTrOpj0IN6fYfOQlhjzXubOX4Fnnwd8eo8f+Jdg13E7jr1hQYy3DA5iGAqxhDm7bF6qDVv
	KgypuC3JMMVKZratleQug4lHuzKGwtqiekcjTmMIY0mwTEkK6Hsb4Axr8kz4U7+UJ8nnDmI4Sg8hZ
	4f3dvA3+4QLVjUKKzIs/3pHCc+CnoitpW5WYvlZxWVYPBFwiIjGyjyRfIyZNdiHtVw9CtSbLICpzK
	fJh6jCQ06xIEDf0zHcKvPstZ/I6ZID1fGbZBuyIqHaWa0P/hUg5IVB9vPD8zSr/QalI/A901NMicR
	h4tfXPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTU5-000000018UR-0cG2;
	Tue, 18 Nov 2025 21:43:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTTy-000000018Pj-0gms;
	Tue, 18 Nov 2025 21:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FFF5601DE;
	Tue, 18 Nov 2025 21:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1842C2BC86;
	Tue, 18 Nov 2025 21:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763502205;
	bh=SuvClo8RiSU3x1wbrfjROlN5cIxIlnveUrYmq9+g6QI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EJACl60d2E4PwNBxdK5Kjl5uK7Nek+3HVy3C393Fr+9JK/CrowSSzl9D6Btz7M28p
	 AgPto+yFv9378+8W3u6zhj/YO3Mm+Nn6flrg46zZPgatrWVC9xXVNkOwIfd+FVmu6E
	 yyp10Q7UhVHwzqu4kC25bTFGenEUjVQ8cVnGQdMdl4Ed0Jj6f26wYgQICgkV1+HJX3
	 NtYp3Xan5JPiz/RMYP5FgD5etuVKs+w6BTrhLEtAe/QFWT28/X/kAs6ExEWxrD/tI2
	 BxUBZqZvlEZ2dKOni8SS3E9I3iHXgvPDGVaxzzcBkNoLcFs9+ZiQLlVMSbDfzJCITw
	 hZ50fdN3/aZCQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hans Zhang <hans.zhang@cixtech.com>,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@pengutronix.de,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 3/4] PCI: dw-rockchip: Configure L1SS support
Date: Tue, 18 Nov 2025 15:42:17 -0600
Message-ID: <20251118214312.2598220-4-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118214312.2598220-1-helgaas@kernel.org>
References: <20251118214312.2598220-1-helgaas@kernel.org>
MIME-Version: 1.0
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

From: Shawn Lin <shawn.lin@rock-chips.com>

L1 PM Substates for RC mode require support in the dw-rockchip driver
including proper handling of the CLKREQ# sideband signal. It is mostly
handled by hardware, but software still needs to set the clkreq fields
in the PCIE_CLIENT_POWER_CON register to match the hardware implementation.

For more details, see section '18.6.6.4 L1 Substate' in the RK3568 TRM 1.1
Part 2, or section '11.6.6.4 L1 Substate' in the RK3588 TRM 1.0 Part2.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
[bhelgaas: set pci->l1ss_support so DWC core preserves L1SS Capability bits;
drop corresponding code here, include updates from
https://lore.kernel.org/r/aRRG8wv13HxOCqgA@ryzen]
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Link: https://patch.msgid.link/1761187883-150120-1-git-send-email-shawn.lin@rock-chips.com
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 3e2752c7dd09..bcd3a28da650 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -62,6 +62,12 @@
 /* Interrupt Mask Register Related to Miscellaneous Operation */
 #define PCIE_CLIENT_INTR_MASK_MISC	0x24
 
+/* Power Management Control Register */
+#define PCIE_CLIENT_POWER_CON		0x2c
+#define  PCIE_CLKREQ_READY		FIELD_PREP_WM16(BIT(0), 1)
+#define  PCIE_CLKREQ_NOT_READY		FIELD_PREP_WM16(BIT(0), 0)
+#define  PCIE_CLKREQ_PULL_DOWN		FIELD_PREP_WM16(GENMASK(13, 12), 1)
+
 /* Hot Reset Control Register */
 #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
 #define  PCIE_LTSSM_APP_DLY2_EN		BIT(1)
@@ -85,6 +91,7 @@ struct rockchip_pcie {
 	struct regulator *vpcie3v3;
 	struct irq_domain *irq_domain;
 	const struct rockchip_pcie_of_data *data;
+	bool supports_clkreq;
 };
 
 struct rockchip_pcie_of_data {
@@ -200,6 +207,35 @@ static bool rockchip_pcie_link_up(struct dw_pcie *pci)
 	return FIELD_GET(PCIE_LINKUP_MASK, val) == PCIE_LINKUP;
 }
 
+/*
+ * See e.g. section '11.6.6.4 L1 Substate' in the RK3588 TRM V1.0 for the steps
+ * needed to support L1 substates. Currently, just enable L1 substates for RC
+ * mode if CLKREQ# is properly connected and supports-clkreq is present in DT.
+ * For EP mode, there are more things should be done to actually save power in
+ * L1 substates, so disable L1 substates until there is proper support.
+ */
+static void rockchip_pcie_configure_l1ss(struct dw_pcie *pci)
+{
+	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
+
+	/* Enable L1 substates if CLKREQ# is properly connected */
+	if (rockchip->supports_clkreq) {
+		rockchip_pcie_writel_apb(rockchip, PCIE_CLKREQ_READY,
+					 PCIE_CLIENT_POWER_CON);
+		pci->l1ss_support = true;
+		return;
+	}
+
+	/*
+	 * Otherwise, assert CLKREQ# unconditionally.  Since
+	 * pci->l1ss_support is not set, the DWC core will prevent L1
+	 * Substates support from being advertised.
+	 */
+	rockchip_pcie_writel_apb(rockchip,
+				 PCIE_CLKREQ_PULL_DOWN | PCIE_CLKREQ_NOT_READY,
+				 PCIE_CLIENT_POWER_CON);
+}
+
 static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
 {
 	u32 cap, lnkcap;
@@ -264,6 +300,7 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 	irq_set_chained_handler_and_data(irq, rockchip_pcie_intx_handler,
 					 rockchip);
 
+	rockchip_pcie_configure_l1ss(pci);
 	rockchip_pcie_enable_l0s(pci);
 
 	return 0;
@@ -412,6 +449,9 @@ static int rockchip_pcie_resource_get(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, PTR_ERR(rockchip->rst),
 				     "failed to get reset lines\n");
 
+	rockchip->supports_clkreq = of_property_read_bool(pdev->dev.of_node,
+							  "supports-clkreq");
+
 	return 0;
 }
 
-- 
2.43.0


