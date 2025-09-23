Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8302ECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/sL1akuJrg4iNrvVUR+awIMYW/qJqR/aoboLYD9gKw=; b=TBtfFtbF8jL3WuCKBuTo9FeJUj
	05tutWPmx3oPiYANKA6CxL5unN4N6PX03eMd0A67yxvqsog9BGNC7nyyn24qCtP+nnq9f7+gvEFsb
	rPKuMoOSx27dxLhg2LNKajVCmo5TyT39DPRa1WXlLjHJkuw0HgjECLXycBT3lkcAoLYLFH2IOu/BH
	Um7QAktxxb067bwi5iSGwdpzwO1AZ3KQmAx+IM2aUJWSIROGE6Klgs6d3GGEl2VxLxlEsZn78MQah
	HGwmerGeNpK4Z3zXaXau45Sl3nl11xUY3ITEK1yo2SIbW6Bj+0NuwegsxD/cdqloE4j85FQtl4pp8
	KP7Z7Mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11As-0000000DApn-1luz;
	Tue, 23 Sep 2025 11:27:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11Ap-0000000DAma-2SDQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:27:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5E0D44895;
	Tue, 23 Sep 2025 11:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC9DC4CEF5;
	Tue, 23 Sep 2025 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758626825;
	bh=QK89HfzaIRfYko6DvW1egCZ032E8BKz9tQqphqpwaUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a/Q8EXrAEidQspdMqpGC8PqYv/m5aea0jlJN6rx1o5k5g+TP+5bSX/gkJ/3qQCz7U
	 icoXWuPsIe4/cTL9z5vn7x9Y8wFZRjaLvI5wkEaK/IO5/iuzpiWHSLTOst+ph6hH0y
	 nOsWXb/FkYXwai+5oF4Q2zywDJhoIDCNSq8MA7Hm5hi5ZD7UF2OOkFdBKBAueDhQe6
	 22/3dCHLv10zX9rlShxUPwWW21pVtyLiwGVpJQKjcgKURZlESxCe5ox5awjYw967mC
	 buHRFFJpMc/KXkEtXd80VHgXnWdcL3GSULzZmGDhIEk2FSaBoHWLbsqdcmAhU8V6e6
	 m+WLmeR8Y41JQ==
From: Manivannan Sadhasivam <mani@kernel.org>
Date: Tue, 23 Sep 2025 16:56:51 +0530
Subject: [PATCH v10 1/4] PCI: dwc: Add support for ELBI resource mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-controller-dwc-ecam-v10-1-e84390ba75fa@kernel.org>
References: <20250923-controller-dwc-ecam-v10-0-e84390ba75fa@kernel.org>
In-Reply-To: <20250923-controller-dwc-ecam-v10-0-e84390ba75fa@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Jonathan Chocron <jonnyc@amazon.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12565; i=mani@kernel.org;
 h=from:subject:message-id; bh=DKhRz+a4KIXGMj2kY1iE857MbisCPu8GCsn4LJxBkdg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBo0oP+5tpKs3wwbzXBA8VwzTE25IfQPF/iFCtoz
 wTUZIxePF+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaNKD/gAKCRBVnxHm/pHO
 9bNUB/4vLdWiyCS28E0FrCmaSzsDtiSMPpdlNmdrGGis3/vNZEnv5cXH7m+2cywa4Zcv32uCArY
 sytJFwa+YdtlRt8w+nUcn64OIHilRHkLFeH8KJDnBnZY1qQ3HUuAns46dTUbDeYwhuIomiwWl/d
 F6n8LRvXzKmbWIH5U0ayAv8NpsCXQbJvA0sxAmw6giWLuapDGoh9Bva5oLQZAMimq0omqrnUNIy
 Kn7Ehj+KYCDoPowwH/JsqwnJKU43wK2aci3WrETTkSeuJAq9JFsde2JnUATT9UV0MsCYBkfFmYN
 QX6TD/XAxDsWNkG1zEvZ/5yiU+Dy6TN3FG5w67oKOBrWdv/q
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_042707_688880_57CB23D2 
X-CRM114-Status: GOOD (  21.27  )
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

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

External Local Bus Interface (ELBI) is an optional register space for all
DWC IPs containing the vendor specific registers. There is no need for the
vendor glue drivers to fetch and map the ELBI region separately.

Hence, optionally fetch and map the resource from DT in the DWC core. This
also warrants dropping the corresponding code from glue drivers. Hence,
drop the ELBI resource fetch and map logic from glue drivers and convert
them to use 'dw_pci::elbi_base'.

Note that the pcie-qcom-ep driver used devm_pci_remap_cfg_resource() to map
the ELBI resource previously. But it was a mistake since
devm_pci_remap_cfg_resource() should only be used for mapping the PCIe
config space region as it maps the region as Non-Posted. As ELBI is used to
hold vendor specific registers, there is no need to map the region as
Non-Posted. With this conversion, the region will get mapped as normal MMIO
memory.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
[mani: removed elbi override, converted glue drivers and reworded description]
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/pci/controller/dwc/pci-exynos.c      | 62 ++++++++++++++--------------
 drivers/pci/controller/dwc/pcie-designware.c |  8 ++++
 drivers/pci/controller/dwc/pcie-designware.h |  1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c    | 15 ++-----
 drivers/pci/controller/dwc/pcie-qcom.c       | 16 ++++---
 5 files changed, 50 insertions(+), 52 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 1f0e98d07109353e7321667e98ead2695151184c..0bb7d4f5d7840eaed75b2ba0884f045e4d1c6d2f 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -53,7 +53,6 @@
 
 struct exynos_pcie {
 	struct dw_pcie			pci;
-	void __iomem			*elbi_base;
 	struct clk_bulk_data		*clks;
 	struct phy			*phy;
 	struct regulator_bulk_data	supplies[2];
@@ -71,73 +70,78 @@ static u32 exynos_pcie_readl(void __iomem *base, u32 reg)
 
 static void exynos_pcie_sideband_dbi_w_mode(struct exynos_pcie *ep, bool on)
 {
+	struct dw_pcie *pci = &ep->pci;
 	u32 val;
 
-	val = exynos_pcie_readl(ep->elbi_base, PCIE_ELBI_SLV_AWMISC);
+	val = exynos_pcie_readl(pci->elbi_base, PCIE_ELBI_SLV_AWMISC);
 	if (on)
 		val |= PCIE_ELBI_SLV_DBI_ENABLE;
 	else
 		val &= ~PCIE_ELBI_SLV_DBI_ENABLE;
-	exynos_pcie_writel(ep->elbi_base, val, PCIE_ELBI_SLV_AWMISC);
+	exynos_pcie_writel(pci->elbi_base, val, PCIE_ELBI_SLV_AWMISC);
 }
 
 static void exynos_pcie_sideband_dbi_r_mode(struct exynos_pcie *ep, bool on)
 {
+	struct dw_pcie *pci = &ep->pci;
 	u32 val;
 
-	val = exynos_pcie_readl(ep->elbi_base, PCIE_ELBI_SLV_ARMISC);
+	val = exynos_pcie_readl(pci->elbi_base, PCIE_ELBI_SLV_ARMISC);
 	if (on)
 		val |= PCIE_ELBI_SLV_DBI_ENABLE;
 	else
 		val &= ~PCIE_ELBI_SLV_DBI_ENABLE;
-	exynos_pcie_writel(ep->elbi_base, val, PCIE_ELBI_SLV_ARMISC);
+	exynos_pcie_writel(pci->elbi_base, val, PCIE_ELBI_SLV_ARMISC);
 }
 
 static void exynos_pcie_assert_core_reset(struct exynos_pcie *ep)
 {
+	struct dw_pcie *pci = &ep->pci;
 	u32 val;
 
-	val = exynos_pcie_readl(ep->elbi_base, PCIE_CORE_RESET);
+	val = exynos_pcie_readl(pci->elbi_base, PCIE_CORE_RESET);
 	val &= ~PCIE_CORE_RESET_ENABLE;
-	exynos_pcie_writel(ep->elbi_base, val, PCIE_CORE_RESET);
-	exynos_pcie_writel(ep->elbi_base, 0, PCIE_STICKY_RESET);
-	exynos_pcie_writel(ep->elbi_base, 0, PCIE_NONSTICKY_RESET);
+	exynos_pcie_writel(pci->elbi_base, val, PCIE_CORE_RESET);
+	exynos_pcie_writel(pci->elbi_base, 0, PCIE_STICKY_RESET);
+	exynos_pcie_writel(pci->elbi_base, 0, PCIE_NONSTICKY_RESET);
 }
 
 static void exynos_pcie_deassert_core_reset(struct exynos_pcie *ep)
 {
+	struct dw_pcie *pci = &ep->pci;
 	u32 val;
 
-	val = exynos_pcie_readl(ep->elbi_base, PCIE_CORE_RESET);
+	val = exynos_pcie_readl(pci->elbi_base, PCIE_CORE_RESET);
 	val |= PCIE_CORE_RESET_ENABLE;
 
-	exynos_pcie_writel(ep->elbi_base, val, PCIE_CORE_RESET);
-	exynos_pcie_writel(ep->elbi_base, 1, PCIE_STICKY_RESET);
-	exynos_pcie_writel(ep->elbi_base, 1, PCIE_NONSTICKY_RESET);
-	exynos_pcie_writel(ep->elbi_base, 1, PCIE_APP_INIT_RESET);
-	exynos_pcie_writel(ep->elbi_base, 0, PCIE_APP_INIT_RESET);
+	exynos_pcie_writel(pci->elbi_base, val, PCIE_CORE_RESET);
+	exynos_pcie_writel(pci->elbi_base, 1, PCIE_STICKY_RESET);
+	exynos_pcie_writel(pci->elbi_base, 1, PCIE_NONSTICKY_RESET);
+	exynos_pcie_writel(pci->elbi_base, 1, PCIE_APP_INIT_RESET);
+	exynos_pcie_writel(pci->elbi_base, 0, PCIE_APP_INIT_RESET);
 }
 
 static int exynos_pcie_start_link(struct dw_pcie *pci)
 {
-	struct exynos_pcie *ep = to_exynos_pcie(pci);
 	u32 val;
 
-	val = exynos_pcie_readl(ep->elbi_base, PCIE_SW_WAKE);
+	val = exynos_pcie_readl(pci->elbi_base, PCIE_SW_WAKE);
 	val &= ~PCIE_BUS_EN;
-	exynos_pcie_writel(ep->elbi_base, val, PCIE_SW_WAKE);
+	exynos_pcie_writel(pci->elbi_base, val, PCIE_SW_WAKE);
 
 	/* assert LTSSM enable */
-	exynos_pcie_writel(ep->elbi_base, PCIE_ELBI_LTSSM_ENABLE,
+	exynos_pcie_writel(pci->elbi_base, PCIE_ELBI_LTSSM_ENABLE,
 			  PCIE_APP_LTSSM_ENABLE);
 	return 0;
 }
 
 static void exynos_pcie_clear_irq_pulse(struct exynos_pcie *ep)
 {
-	u32 val = exynos_pcie_readl(ep->elbi_base, PCIE_IRQ_PULSE);
+	struct dw_pcie *pci = &ep->pci;
 
-	exynos_pcie_writel(ep->elbi_base, val, PCIE_IRQ_PULSE);
+	u32 val = exynos_pcie_readl(pci->elbi_base, PCIE_IRQ_PULSE);
+
+	exynos_pcie_writel(pci->elbi_base, val, PCIE_IRQ_PULSE);
 }
 
 static irqreturn_t exynos_pcie_irq_handler(int irq, void *arg)
@@ -150,12 +154,14 @@ static irqreturn_t exynos_pcie_irq_handler(int irq, void *arg)
 
 static void exynos_pcie_enable_irq_pulse(struct exynos_pcie *ep)
 {
+	struct dw_pcie *pci = &ep->pci;
+
 	u32 val = IRQ_INTA_ASSERT | IRQ_INTB_ASSERT |
 		  IRQ_INTC_ASSERT | IRQ_INTD_ASSERT;
 
-	exynos_pcie_writel(ep->elbi_base, val, PCIE_IRQ_EN_PULSE);
-	exynos_pcie_writel(ep->elbi_base, 0, PCIE_IRQ_EN_LEVEL);
-	exynos_pcie_writel(ep->elbi_base, 0, PCIE_IRQ_EN_SPECIAL);
+	exynos_pcie_writel(pci->elbi_base, val, PCIE_IRQ_EN_PULSE);
+	exynos_pcie_writel(pci->elbi_base, 0, PCIE_IRQ_EN_LEVEL);
+	exynos_pcie_writel(pci->elbi_base, 0, PCIE_IRQ_EN_SPECIAL);
 }
 
 static u32 exynos_pcie_read_dbi(struct dw_pcie *pci, void __iomem *base,
@@ -211,8 +217,7 @@ static struct pci_ops exynos_pci_ops = {
 
 static bool exynos_pcie_link_up(struct dw_pcie *pci)
 {
-	struct exynos_pcie *ep = to_exynos_pcie(pci);
-	u32 val = exynos_pcie_readl(ep->elbi_base, PCIE_ELBI_RDLH_LINKUP);
+	u32 val = exynos_pcie_readl(pci->elbi_base, PCIE_ELBI_RDLH_LINKUP);
 
 	return val & PCIE_ELBI_XMLH_LINKUP;
 }
@@ -295,11 +300,6 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (IS_ERR(ep->phy))
 		return PTR_ERR(ep->phy);
 
-	/* External Local Bus interface (ELBI) registers */
-	ep->elbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
-	if (IS_ERR(ep->elbi_base))
-		return PTR_ERR(ep->elbi_base);
-
 	ret = devm_clk_bulk_get_all_enabled(dev, &ep->clks);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 89aad5a08928cc29870ab258d33bee9ff8f83143..93da8a26c9313dfdd6b269a90bbfb017aab2abe7 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -167,6 +167,14 @@ int dw_pcie_get_resources(struct dw_pcie *pci)
 		}
 	}
 
+	/* ELBI is an optional resource */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
+	if (res) {
+		pci->elbi_base = devm_ioremap_resource(pci->dev, res);
+		if (IS_ERR(pci->elbi_base))
+			return PTR_ERR(pci->elbi_base);
+	}
+
 	/* LLDD is supposed to manually switch the clocks and resets state */
 	if (dw_pcie_cap_is(pci, REQ_RES)) {
 		ret = dw_pcie_get_clocks(pci);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 2418214730e4a2d065651f177bb64530b5d4f88b..9eb3c4c762ddca7d6faff3a98a54b37d7cd9f11b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -491,6 +491,7 @@ struct dw_pcie {
 	resource_size_t		dbi_phys_addr;
 	void __iomem		*dbi_base2;
 	void __iomem		*atu_base;
+	void __iomem		*elbi_base;
 	resource_size_t		atu_phys_addr;
 	size_t			atu_size;
 	resource_size_t		parent_bus_offset;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index aaf060bf39d40b6927e190b0aba5a86dcd320d0d..d7a7e278f6821dc7976f96982607564fb2f42169 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -179,7 +179,6 @@ struct qcom_pcie_ep_cfg {
  * struct qcom_pcie_ep - Qualcomm PCIe Endpoint Controller
  * @pci: Designware PCIe controller struct
  * @parf: Qualcomm PCIe specific PARF register base
- * @elbi: Designware PCIe specific ELBI register base
  * @mmio: MMIO register base
  * @perst_map: PERST regmap
  * @mmio_res: MMIO region resource
@@ -202,7 +201,6 @@ struct qcom_pcie_ep {
 	struct dw_pcie pci;
 
 	void __iomem *parf;
-	void __iomem *elbi;
 	void __iomem *mmio;
 	struct regmap *perst_map;
 	struct resource *mmio_res;
@@ -267,10 +265,9 @@ static void qcom_pcie_ep_configure_tcsr(struct qcom_pcie_ep *pcie_ep)
 
 static bool qcom_pcie_dw_link_up(struct dw_pcie *pci)
 {
-	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
 	u32 reg;
 
-	reg = readl_relaxed(pcie_ep->elbi + ELBI_SYS_STTS);
+	reg = readl_relaxed(pci->elbi_base + ELBI_SYS_STTS);
 
 	return reg & XMLH_LINK_UP;
 }
@@ -294,16 +291,15 @@ static void qcom_pcie_dw_stop_link(struct dw_pcie *pci)
 static void qcom_pcie_dw_write_dbi2(struct dw_pcie *pci, void __iomem *base,
 				    u32 reg, size_t size, u32 val)
 {
-	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
 	int ret;
 
-	writel(1, pcie_ep->elbi + ELBI_CS2_ENABLE);
+	writel(1, pci->elbi_base + ELBI_CS2_ENABLE);
 
 	ret = dw_pcie_write(pci->dbi_base2 + reg, size, val);
 	if (ret)
 		dev_err(pci->dev, "Failed to write DBI2 register (0x%x): %d\n", reg, ret);
 
-	writel(0, pcie_ep->elbi + ELBI_CS2_ENABLE);
+	writel(0, pci->elbi_base + ELBI_CS2_ENABLE);
 }
 
 static void qcom_pcie_ep_icc_update(struct qcom_pcie_ep *pcie_ep)
@@ -583,11 +579,6 @@ static int qcom_pcie_ep_get_io_resources(struct platform_device *pdev,
 		return PTR_ERR(pci->dbi_base);
 	pci->dbi_base2 = pci->dbi_base;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
-	pcie_ep->elbi = devm_pci_remap_cfg_resource(dev, res);
-	if (IS_ERR(pcie_ep->elbi))
-		return PTR_ERR(pcie_ep->elbi);
-
 	pcie_ep->mmio_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 							 "mmio");
 	if (!pcie_ep->mmio_res) {
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 15d71109a2f7d45ea2184728360d1f3db8e8f3c6..c48a20602d7fa4c50056ccf6502d3b5bf0a8287f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -276,7 +276,6 @@ struct qcom_pcie_port {
 struct qcom_pcie {
 	struct dw_pcie *pci;
 	void __iomem *parf;			/* DT parf */
-	void __iomem *elbi;			/* DT elbi */
 	void __iomem *mhi;
 	union qcom_pcie_resources res;
 	struct icc_path *icc_mem;
@@ -409,12 +408,17 @@ static void qcom_pcie_configure_dbi_atu_base(struct qcom_pcie *pcie)
 
 static void qcom_pcie_2_1_0_ltssm_enable(struct qcom_pcie *pcie)
 {
+	struct dw_pcie *pci = pcie->pci;
 	u32 val;
 
+	if (!pci->elbi_base) {
+		dev_err(pci->dev, "ELBI is not present\n");
+		return;
+	}
 	/* enable link training */
-	val = readl(pcie->elbi + ELBI_SYS_CTRL);
+	val = readl(pci->elbi_base + ELBI_SYS_CTRL);
 	val |= ELBI_SYS_CTRL_LT_ENABLE;
-	writel(val, pcie->elbi + ELBI_SYS_CTRL);
+	writel(val, pci->elbi_base + ELBI_SYS_CTRL);
 }
 
 static int qcom_pcie_get_resources_2_1_0(struct qcom_pcie *pcie)
@@ -1847,12 +1851,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		goto err_pm_runtime_put;
 	}
 
-	pcie->elbi = devm_platform_ioremap_resource_byname(pdev, "elbi");
-	if (IS_ERR(pcie->elbi)) {
-		ret = PTR_ERR(pcie->elbi);
-		goto err_pm_runtime_put;
-	}
-
 	/* MHI region is optional */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mhi");
 	if (res) {

-- 
2.48.1


