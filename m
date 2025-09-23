Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57177CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEcC+5VQVq1X45EApi6E/sxmUyPVr4RaQ9BHiaP0Ia0=; b=rfLetqipjF6Ln0FuurEEWw6iVG
	NDWCC9E13GG7AjYxQr1I96/7n5y4f15Qb0cX4lilxgaUz4murfnUiUEV+J8Wu0v8DbM2w6eKOLaLc
	AASd4aQhwUgNlklRjFrraNTrLLbdH1PGR8Ry03gzwYIVi6AXm2CmeyZ78XCIbb9hdm7BnkRr9QcJB
	WAKiu7JQh2V1pFr9afsbZT6MpiJ0Eamx0t0j71OCPZHGeh6Sz/ESuIjnUkPSIQxXoFLUxVsQYxDXA
	JKm+Q4leT7RtJQ2D0H+qCDOsF7jGc59fnSFYXKY0NXb9xP7Yrdppd3FGP6ZcXtKOaEbfbL7+Y6IZe
	xdFuZ+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11Ay-0000000DAub-2A0v;
	Tue, 23 Sep 2025 11:27:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11At-0000000DAqX-1gg5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B17996027C;
	Tue, 23 Sep 2025 11:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D33FC4CEF5;
	Tue, 23 Sep 2025 11:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758626830;
	bh=q5sDj6WfjMML3tGdURLJIkj+dHzcfgO40GeaR5j+mSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FBbiI+Ct5JJcQuFbaHDEKGQGySIHJw8k6cv3UtchPDiQUEXRn3ZKcuiRO7Kibfuu1
	 m8x4EJRA9qAgVfphQb1liLKnuK8saVg43RlHwCyHgTv/tsY7T13XJNPv4ZwicSoake
	 GdUDVWNzJZcGroLIMcQalKaosBHQEkLRiG/hfnfrUroVVGPK+BcdXNQZwDTDox+Oke
	 H/bMj6+UVfDJSHUJTosI4lFeuLK7zC42W863RnNLkiGlDX0nvGQq2pL9kuUKa6QJ1Z
	 fQDEqqqSAC47h2nkaK333XyYB95Fj8avWLni5X1VwUQFPj87VUWME2ELGg6TtW+qHD
	 +rAIqA9YnmitQ==
From: Manivannan Sadhasivam <mani@kernel.org>
Date: Tue, 23 Sep 2025 16:56:52 +0530
Subject: [PATCH v10 2/4] PCI: dwc: Prepare the driver for enabling ECAM
 mechanism using iATU 'CFG Shift Feature'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-controller-dwc-ecam-v10-2-e84390ba75fa@kernel.org>
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
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8333; i=mani@kernel.org;
 h=from:subject:message-id; bh=okr8gH/4lMmav3d4HKOkzUWJuRe10mFhDVwkfrYA40s=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBo0oP+mQjj8XB1+vYD+iJrcFGa+iNQTaNQTFwYD
 9qmoyo2/rKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaNKD/gAKCRBVnxHm/pHO
 9f0tB/sH3wXbYpE9zXGGxUB77IKW2lCIZF2v+l1xFG2gEBJSy588mSpigP9vu9VveiwM7W3vABY
 zp2PkL0lKGM8vz6U6l7P+NSrflrDyTtweqWRu5Hcf08S8OajP4NHjEeoRwrUOIi8X8i329nNQ6e
 DhB7zax77VYCm0VrG3eudrYXdDQbuWUMxusMh5P1sYa/Hc6wdmxKSA5TT4rYXCNwSd8tTAC3TFw
 YAZ7crt7QIp5YgZ63fYd0hHLX2nu42+QnnsBPc1pKfsV85J1z3NmwH5f+fm8pO1XcMsVnzNAEsZ
 sn7K3h4mSREOddWSQJqTaQmkbwZIuc1Em5KAea9CrP1YFMKv
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

In order to enable PCIe ECAM mechanism in DWC driver as per the 'CFG Shift
Feature' documented in Designware databook r5.20a, sec 3.10.10.3, prepare
the driver to handle the one time iATU setup and creating ECAM window.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
[mani: splitted the preparatory code into a separate commit for bisectability]
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/pci/controller/dwc/Kconfig                |   1 +
 drivers/pci/controller/dwc/pcie-designware-host.c | 116 +++++++++++++++++++---
 drivers/pci/controller/dwc/pcie-designware.c      |   2 +-
 drivers/pci/controller/dwc/pcie-designware.h      |   5 +
 4 files changed, 109 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index deafc512b07928e30e93b814ad325a6be7dbcf75..dc0271203909fbcfa2b47733693d99b7a069426b 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -20,6 +20,7 @@ config PCIE_DW_HOST
 	bool
 	select PCIE_DW
 	select IRQ_MSI_LIB
+	select PCI_HOST_COMMON
 
 config PCIE_DW_EP
 	bool
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 952f8594b501254d2b2de5d5e056e16d2aa8d4b7..94e0fe11a0b062d0f14e09fe586e20bde46a4266 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -413,6 +413,67 @@ static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
 	}
 }
 
+static int dw_pcie_config_ecam_iatu(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct dw_pcie_ob_atu_cfg atu = {0};
+	resource_size_t bus_range_max;
+	struct resource_entry *bus;
+	int ret;
+
+	bus = resource_list_first_type(&pp->bridge->windows, IORESOURCE_BUS);
+
+	/*
+	 * Root bus under the host bridge doesn't require any iATU configuration
+	 * as DBI region will be used to access root bus config space.
+	 * Immediate bus under Root Bus, needs type 0 iATU configuration and
+	 * remaining buses need type 1 iATU configuration.
+	 */
+	atu.index = 0;
+	atu.type = PCIE_ATU_TYPE_CFG0;
+	atu.parent_bus_addr = pp->cfg0_base + SZ_1M;
+	/* 1MiB is to cover 1 (bus) * 32 (devices) * 8 (functions) */
+	atu.size = SZ_1M;
+	atu.ctrl2 = PCIE_ATU_CFG_SHIFT_MODE_ENABLE;
+	ret = dw_pcie_prog_outbound_atu(pci, &atu);
+	if (ret)
+		return ret;
+
+	bus_range_max = resource_size(bus->res);
+
+	if (bus_range_max < 2)
+		return 0;
+
+	/* Configure remaining buses in type 1 iATU configuration */
+	atu.index = 1;
+	atu.type = PCIE_ATU_TYPE_CFG1;
+	atu.parent_bus_addr = pp->cfg0_base + SZ_2M;
+	atu.size = (SZ_1M * bus_range_max) - SZ_2M;
+	atu.ctrl2 = PCIE_ATU_CFG_SHIFT_MODE_ENABLE;
+
+	return dw_pcie_prog_outbound_atu(pci, &atu);
+}
+
+static int dw_pcie_create_ecam_window(struct dw_pcie_rp *pp, struct resource *res)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct device *dev = pci->dev;
+	struct resource_entry *bus;
+
+	bus = resource_list_first_type(&pp->bridge->windows, IORESOURCE_BUS);
+	if (!bus)
+		return -ENODEV;
+
+	pp->cfg = pci_ecam_create(dev, res, bus->res, &pci_generic_ecam_ops);
+	if (IS_ERR(pp->cfg))
+		return PTR_ERR(pp->cfg);
+
+	pci->dbi_base = pp->cfg->win;
+	pci->dbi_phys_addr = res->start;
+
+	return 0;
+}
+
 static int dw_pcie_host_get_resources(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -422,10 +483,6 @@ static int dw_pcie_host_get_resources(struct dw_pcie_rp *pp)
 	struct resource *res;
 	int ret;
 
-	ret = dw_pcie_get_resources(pci);
-	if (ret)
-		return ret;
-
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config");
 	if (!res) {
 		dev_err(dev, "Missing \"config\" reg space\n");
@@ -435,9 +492,31 @@ static int dw_pcie_host_get_resources(struct dw_pcie_rp *pp)
 	pp->cfg0_size = resource_size(res);
 	pp->cfg0_base = res->start;
 
-	pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
-	if (IS_ERR(pp->va_cfg0_base))
-		return PTR_ERR(pp->va_cfg0_base);
+	if (pp->ecam_enabled) {
+		ret = dw_pcie_create_ecam_window(pp, res);
+		if (ret)
+			return ret;
+
+		pp->bridge->ops = (struct pci_ops *)&pci_generic_ecam_ops.pci_ops;
+		pp->bridge->sysdata = pp->cfg;
+		pp->cfg->priv = pp;
+	} else {
+		pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
+		if (IS_ERR(pp->va_cfg0_base))
+			return PTR_ERR(pp->va_cfg0_base);
+
+		/* Set default bus ops */
+		pp->bridge->ops = &dw_pcie_ops;
+		pp->bridge->child_ops = &dw_child_pcie_ops;
+		pp->bridge->sysdata = pp;
+	}
+
+	ret = dw_pcie_get_resources(pci);
+	if (ret) {
+		if (pp->cfg)
+			pci_ecam_free(pp->cfg);
+		return ret;
+	}
 
 	/* Get the I/O range from DT */
 	win = resource_list_first_type(&pp->bridge->windows, IORESOURCE_IO);
@@ -476,14 +555,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
-	/* Set default bus ops */
-	bridge->ops = &dw_pcie_ops;
-	bridge->child_ops = &dw_child_pcie_ops;
-
 	if (pp->ops->init) {
 		ret = pp->ops->init(pp);
 		if (ret)
-			return ret;
+			goto err_free_ecam;
 	}
 
 	if (pci_msi_enabled()) {
@@ -525,6 +600,14 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		goto err_free_msi;
 
+	if (pp->ecam_enabled) {
+		ret = dw_pcie_config_ecam_iatu(pp);
+		if (ret) {
+			dev_err(dev, "Failed to configure iATU in ECAM mode\n");
+			goto err_free_msi;
+		}
+	}
+
 	/*
 	 * Allocate the resource for MSG TLP before programming the iATU
 	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
@@ -560,8 +643,6 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 		/* Ignore errors, the link may come up later */
 		dw_pcie_wait_for_link(pci);
 
-	bridge->sysdata = pp;
-
 	ret = pci_host_probe(bridge);
 	if (ret)
 		goto err_stop_link;
@@ -587,6 +668,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (pp->ops->deinit)
 		pp->ops->deinit(pp);
 
+err_free_ecam:
+	if (pp->cfg)
+		pci_ecam_free(pp->cfg);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_host_init);
@@ -609,6 +694,9 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
 
 	if (pp->ops->deinit)
 		pp->ops->deinit(pp);
+
+	if (pp->cfg)
+		pci_ecam_free(pp->cfg);
 }
 EXPORT_SYMBOL_GPL(dw_pcie_host_deinit);
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 93da8a26c9313dfdd6b269a90bbfb017aab2abe7..ee8caae1edbd44c10e6986430a6932c10f20a9eb 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -575,7 +575,7 @@ int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
 		val = dw_pcie_enable_ecrc(val);
 	dw_pcie_writel_atu_ob(pci, atu->index, PCIE_ATU_REGION_CTRL1, val);
 
-	val = PCIE_ATU_ENABLE;
+	val = PCIE_ATU_ENABLE | atu->ctrl2;
 	if (atu->type == PCIE_ATU_TYPE_MSG) {
 		/* The data-less messages only for now */
 		val |= PCIE_ATU_INHIBIT_PAYLOAD | atu->code;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 9eb3c4c762ddca7d6faff3a98a54b37d7cd9f11b..779868e8fa8fd78e5f35cd0fa2575f52cc07c335 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -20,6 +20,7 @@
 #include <linux/irq.h>
 #include <linux/msi.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/reset.h>
 
 #include <linux/pci-epc.h>
@@ -168,6 +169,7 @@
 #define PCIE_ATU_REGION_CTRL2		0x004
 #define PCIE_ATU_ENABLE			BIT(31)
 #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
+#define PCIE_ATU_CFG_SHIFT_MODE_ENABLE	BIT(28)
 #define PCIE_ATU_INHIBIT_PAYLOAD	BIT(22)
 #define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
 #define PCIE_ATU_LOWER_BASE		0x008
@@ -386,6 +388,7 @@ struct dw_pcie_ob_atu_cfg {
 	u8 func_no;
 	u8 code;
 	u8 routing;
+	u32 ctrl2;
 	u64 parent_bus_addr;
 	u64 pci_addr;
 	u64 size;
@@ -424,6 +427,8 @@ struct dw_pcie_rp {
 	struct resource		*msg_res;
 	bool			use_linkup_irq;
 	struct pci_eq_presets	presets;
+	struct pci_config_window *cfg;
+	bool			ecam_enabled;
 };
 
 struct dw_pcie_ep_ops {

-- 
2.48.1


