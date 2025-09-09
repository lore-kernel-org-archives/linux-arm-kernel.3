Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB02CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NXee8P+QH99ONakAIeQv/akJQ94Do77hMf7GxQrR4I=; b=JFs0+fGyWDKLa6Gme+TLeyuvP5
	OKpcI6A8Ti+rpNz2amecs5uPCEAC4R//VKr3wfTMY/FnaKdxZcZL+cmsmlUKQOnSRnzigiZfjdjg2
	IOxVjPJMsowZldTIZ7sdReL4PGHB6VTPe4rMWsjqZKjIFfmDeZhxwFrVnXgmYkcDfEmlywO+I/223
	NgNm2JQGzV02KTQQFDZzUm0c8oCxYTKqCrDtD4ftXSvFRaBIoNxk5h4+DU6yvc4zcpiulEpAKEFIU
	VgnRSN+PMRh5bLn/TI5qeAEGKc48AXSSi4rhEUI9S3vvG5XuHkox7gH3nuXmoQIGQNwlv8Qfv7GxK
	jBZ9kkNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtcE-00000005XZ6-2mLM;
	Tue, 09 Sep 2025 08:22:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsSW-000000053VA-15t4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:08:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0536144736;
	Tue,  9 Sep 2025 07:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B02C4CEF4;
	Tue,  9 Sep 2025 07:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757401687;
	bh=AOZhfL7LQG7gbwuDeq4H6rsK9XGMx1zSuzHFBR0wfz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OA568jfaVv4OFvyjUUh8x7PIQVrd/6HXo+qhUK+4T1nLIFkvyY8Q9ww3aMPSNVLWN
	 P10+d7A6nNzoIaeNZtwfX8FO6VBn9Gpznelr2Y3TEgL3inOmh1kEs35W4OSM5nzQz+
	 c+PMC6s5e9cWQSnlUo6fYl2uHpdzJCzpppDzkWRzVTBEHIaLX3U4bu+7BQ6YIGhPwl
	 J/8xzpPbHXwBsXOBhO/TN+9LtU9fIj1yrVpr89MB/moOcmRaF1LVT65+4GmL29PU5q
	 +R2rLK9FychfwlnGp2UV3VBNCc8jJxLkkK+l+NNCyII+IBcYFyMolfWcS0rtj2n52l
	 WIQrNEMH80NUA==
From: Manivannan Sadhasivam <mani@kernel.org>
Date: Tue, 09 Sep 2025 12:37:50 +0530
Subject: [PATCH v9 1/4] PCI: dwc: Add support for ELBI resource mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-controller-dwc-ecam-v9-1-7d5b651840dd@kernel.org>
References: <20250909-controller-dwc-ecam-v9-0-7d5b651840dd@kernel.org>
In-Reply-To: <20250909-controller-dwc-ecam-v9-0-7d5b651840dd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12556; i=mani@kernel.org;
 h=from:subject:message-id; bh=84q9lSeLR8Hku0wkoSApy6tQObBKGyjDWoJcluwFeQI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBov9JNTsPPmf0X7vEO1VPdaknrcGw14IdU58R58
 ovyIjh8gCmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaL/STQAKCRBVnxHm/pHO
 9c0EB/9XC6+2PT8moon7EXk7jbzpikzBkywK2Jgr8twV9EJ3K8K4bLyJG4a5xQaiVfJ3CMV5EVO
 dKtneIS8ezWT1rq3YF9TR6qoZtBg/L8+tLNTxSYHqVWEx9qvIyCX2qDAYKAL7MNAotXL2QWHy1h
 E632X0HOBHlwJTFdEAPEwPI74ae5LZOuWGJBkshz8is6d6r8QKxBp4WF/xVa7LvFAqNM4/gQcL9
 OD1JBNRsBGDhU5NJJovhPY2v3fayOJzIWVeOn1KnGpjGL6l2kdNFzOAmPe5aYjeifCLhggvOD8N
 gk9qKZG4yXWMnT7CzdADy3D8Rfc9Iv5kYwSrEIqEMEYcXSjf
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000808_682525_3381B69E 
X-CRM114-Status: GOOD (  21.18  )
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
index 00f52d472dcdd794013a865ad6c4c7cc251edb48..ceb022506c3191cd8fe580411526e20cc3758fed 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -492,6 +492,7 @@ struct dw_pcie {
 	resource_size_t		dbi_phys_addr;
 	void __iomem		*dbi_base2;
 	void __iomem		*atu_base;
+	void __iomem		*elbi_base;
 	resource_size_t		atu_phys_addr;
 	size_t			atu_size;
 	resource_size_t		parent_bus_offset;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index bf7c6ac0f3e3962de8346ab6e75dfff1d9642aad..2030f3b0f7f98f30b625740cc05cda694fe64125 100644
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
index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..5092752de23866ef95036bb3f8fae9bb06e8ea1e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -276,7 +276,6 @@ struct qcom_pcie_port {
 struct qcom_pcie {
 	struct dw_pcie *pci;
 	void __iomem *parf;			/* DT parf */
-	void __iomem *elbi;			/* DT elbi */
 	void __iomem *mhi;
 	union qcom_pcie_resources res;
 	struct phy *phy;
@@ -414,12 +413,17 @@ static void qcom_pcie_configure_dbi_atu_base(struct qcom_pcie *pcie)
 
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
@@ -1861,12 +1865,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
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
2.45.2


