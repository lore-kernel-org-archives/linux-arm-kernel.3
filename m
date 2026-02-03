Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E2AE7FDFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 00:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkxWuhxsJXtIducWkJiHzdf+MwD5gAg0/A9IFcfPPIQ=; b=2fCHWgM7s15afglHcMayWz9v6g
	AlXQN2l+EmqBe79zdJbmUKjzjy2hoSP6jPwLCiNvPRBWfm4zR+4OYZj+qFUWG4LXOjzrsO64ftqzP
	tESeiQGX0ACR+l9q/yRZqhmammpcrPJJFKQyfv0/pEvQhndGesNg6Pt8o11Bhdrs6W/DrvvMbfXPz
	Pe62s/uo2RgJluCGyGecGw7opoGxINWq7c4VMTsyqzWjVJMFMmbmw7bEU36s8OVJUvAPl6UucfbFd
	/w7JbDHZGAv+pH7Pmy3JJg5UI04wkbod9CvvawPuX2UqYEhSm89KDFhLptj0h7Vp0dZZYVJg1zFdb
	NpPd+cLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4BC-00000005mvV-0abw;
	Tue, 03 Feb 2026 00:22:06 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4B9-00000005mqO-2ObP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 00:22:04 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770078121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rkxWuhxsJXtIducWkJiHzdf+MwD5gAg0/A9IFcfPPIQ=;
	b=dDj+rbSY8nc7gWDxAmhfDNZJEmxRncGf5cxaNpHX/cThbWEj7uBjtrfH2zzgkYaQc+bNhP
	PuLWsA7uPU5zDtMD/iA4qSN0LZkBoFSON6TtnJ0GVpdUH3NkIZSGarvY/cNiYeIwZXLrT5
	zxjL1E/75J0fA02Sip7WVVIhiuZuXxM=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-kernel@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 7/8] PCI: xilinx-nwl: Reset the core during probe
Date: Mon,  2 Feb 2026 19:21:27 -0500
Message-Id: <20260203002128.935842-8-sean.anderson@linux.dev>
In-Reply-To: <20260203002128.935842-1-sean.anderson@linux.dev>
References: <20260203002128.935842-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_162203_778976_23614EF9 
X-CRM114-Status: GOOD (  16.68  )
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

The PCIe core must be held in reset when initializing phys.
Assert/deassert the appropriate resets.

Resetting the core also resets the PCIe attributes to their default
values, so initialize those too. For the most part the defaults are
fine, but there are many attributes that default to an endpoint
configuration and must be reprogrammed to function as a root device.
We generally follow the controller programming sequence from UG1085.

Xilinx was extremely imaginative and named all the registers ATTR_1,
ATTR_2 etc. (with the fields organized in alphabetical order) so we
follow the same convention. Only the fields are named, but sometimes a
field is split across multiple registers. All the BARs are unused but
some are repurposed as bridge registers when used as a root port.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/pci/controller/pcie-xilinx-nwl.c | 177 +++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index 7cfdc21e6f40..b78fbad1efa5 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -22,6 +22,7 @@
 #include <linux/pci-ecam.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/irqchip/chained_irq.h>
 
 #include "../pci.h"
@@ -133,6 +134,54 @@
 #define CFG_DMA_REG_BAR			GENMASK(2, 0)
 #define CFG_PCIE_CACHE			GENMASK(7, 0)
 
+#define PCIE_ATTR2_AER_CAP_PERMIT_ROOTERR_UPDATE	BIT(0)
+
+#define PCIE_ATTR25_CPL_TIMEOUT_DISABLE_SUPPORTED	BIT(9)
+#define PCIE_ATTR25_INTX_IMPLEMENTED			BIT(8)
+#define PCIE_ATTR25_CLASS_CODE				GENMASK(7, 0)
+
+#define PCIE_ATTR27_DEV_CAP_ENDPOINT_L1_LATENCY		GENMASK(5, 3)
+
+#define PCIE_ATTR34_HEADER_TYPE				GENMASK(7, 0)
+
+#define PCIE_ATTR35_LINK_CAP_DLL_ACTIVE_REPORTING	BIT(15)
+
+#define PCIE_ATTR37_LINK_CAP_MAX_LINK_SPEED		GENMASK(13, 10)
+#define PCIE_ATTR37_LINK_CAP_MAX_LINK_SPEED_2_5		1
+#define PCIE_ATTR37_LINK_CAP_MAX_LINK_SPEED_5_0		2
+#define PCIE_ATTR37_LINK_CAP_BANDWIDTH_NOTIFICATION	BIT(9)
+
+#define PCIE_ATTR50_CAP_DEVICE_PORT_TYPE		GENMASK(7, 4)
+#define PCIE_ATTR50_CAP_NEXTPTR				GENMASK(15, 8)
+
+#define PCIE_ATTR53_CAP_NEXTPTR				GENMASK(7, 0)
+
+#define PCIE_ATTR93_LL_REPLAY_TIMEOUT_EN		BIT(15)
+
+#define PCIE_ATTR97_LTSSM_MAX_LINK_WIDTH		GENMASK(11, 6)
+#define PCIE_ATTR97_LINK_CAP_MAX_LINK_WIDTH		GENMASK(5, 0)
+
+#define PCIE_ATTR100_UPSTREAM_FACING			BIT(6)
+
+#define PCIE_ATTR101_EN_MSG_ROUTE			GENMASK(15, 5)
+#define PCIE_ATTR101_EN_MSG_ROUTE_PME_TURN_OFF		BIT(15)
+#define PCIE_ATTR101_EN_MSG_ROUTE_UNLOCK		BIT(14)
+#define PCIE_ATTR101_EN_MSG_ROUTE_PME_TO_ACK		BIT(13)
+#define PCIE_ATTR101_EN_MSG_ROUTE_PM_PME		BIT(12)
+#define PCIE_ATTR101_EN_MSG_ROUTE_INTD			BIT(11)
+#define PCIE_ATTR101_EN_MSG_ROUTE_INTC			BIT(10)
+#define PCIE_ATTR101_EN_MSG_ROUTE_INTB			BIT(9)
+#define PCIE_ATTR101_EN_MSG_ROUTE_INTA			BIT(8)
+#define PCIE_ATTR101_EN_MSG_ROUTE_ERR_FATAL		BIT(7)
+#define PCIE_ATTR101_EN_MSG_ROUTE_ERR_NONFATAL		BIT(6)
+#define PCIE_ATTR101_EN_MSG_ROUTE_ERR_COR		BIT(5)
+#define PCIE_ATTR101_DISABLE_BAR_FILTERING		BIT(1)
+
+#define PCIE_ATTR106_VC0_TOTAL_CREDITS_NPH		GENMASK(13, 7)
+#define PCIE_ATTR106_VC0_TOTAL_CREDITS_CH		GENMASK(6, 0)
+
+#define PCIE_ATTR109_VC0_TOTAL_CREDITS_PH		GENMASK(6, 0)
+
 #define INT_PCI_MSI_NR			(2 * 32)
 
 /* Readin the PS_LINKUP */
@@ -159,6 +208,7 @@ struct nwl_pcie {
 	void __iomem *pcireg_base;
 	void __iomem *ecam_base;
 	struct phy *phy[4];
+	struct reset_control *ctrl_reset;
 	phys_addr_t phys_breg_base;	/* Physical Bridge Register Base */
 	phys_addr_t phys_pcie_reg_base;	/* Physical PCIe Controller Base */
 	phys_addr_t phys_ecam_base;	/* Physical Configuration Base */
@@ -173,6 +223,115 @@ struct nwl_pcie {
 	raw_spinlock_t leg_mask_lock;
 };
 
+static void nwl_pcie_write_attr(struct nwl_pcie *pcie, u32 attr, u16 val)
+{
+	writel(val, pcie->pcireg_base + attr * 4);
+}
+
+static void nwl_pcie_modify_attr(struct nwl_pcie *pcie, u32 attr, u16 clear,
+				u16 set)
+{
+	u32 val = readl(pcie->pcireg_base + attr * 4);
+
+	nwl_pcie_write_attr(pcie, attr, (val & ~clear) | set);
+}
+
+static void nwl_pcie_attr_init(struct nwl_pcie *pcie)
+{
+	unsigned int width;
+
+	for (width = ARRAY_SIZE(pcie->phy); width; width--)
+		if (pcie->phy[width - 1])
+			break;
+
+	/* Set TLP header to type-1 */
+	nwl_pcie_modify_attr(pcie, 34, PCIE_ATTR34_HEADER_TYPE, PCI_HEADER_TYPE_BRIDGE);
+	nwl_pcie_modify_attr(pcie, 100, PCIE_ATTR100_UPSTREAM_FACING, 0);
+
+	/* Disable BAR0/1 */
+	nwl_pcie_write_attr(pcie, 7, 0);
+	nwl_pcie_write_attr(pcie, 8, 0);
+	nwl_pcie_write_attr(pcie, 9, 0);
+	nwl_pcie_write_attr(pcie, 10, 0);
+	/* Enable primary/secondary/subordinate busses, disable latency timer */
+	nwl_pcie_write_attr(pcie, 11, 0xffff);
+	nwl_pcie_write_attr(pcie, 12, 0x00ff);
+	nwl_pcie_write_attr(pcie, 13, 0x0000); /* Disable I/O window */
+	nwl_pcie_write_attr(pcie, 14, 0x0000); /* Enable secondary status */
+	/* Enable memory window */
+	nwl_pcie_write_attr(pcie, 15, (u16)PCI_MEMORY_RANGE_MASK);
+	nwl_pcie_write_attr(pcie, 16, (u16)PCI_MEMORY_RANGE_MASK);
+	/* Enable 64-bit prefetchable window */
+	nwl_pcie_write_attr(pcie, 17,
+			    (u16)PCI_PREF_RANGE_MASK | PCI_PREF_RANGE_TYPE_64);
+	nwl_pcie_write_attr(pcie, 18,
+			    (u16)PCI_PREF_RANGE_MASK | PCI_PREF_RANGE_TYPE_64);
+	nwl_pcie_modify_attr(pcie, 101, 0, PCIE_ATTR101_DISABLE_BAR_FILTERING);
+
+	/* Set class code to PCI_CLASS_BRIDGE_PCI_NORMAL */
+	nwl_pcie_write_attr(pcie, 24, PCI_CLASS_BRIDGE_PCI_NORMAL & 0xffff);
+	nwl_pcie_modify_attr(pcie, 25, PCIE_ATTR25_CLASS_CODE,
+			     PCIE_ATTR25_CPL_TIMEOUT_DISABLE_SUPPORTED |
+			     PCI_BASE_CLASS_BRIDGE);
+
+	/* Enable PCIe capability */
+	nwl_pcie_modify_attr(pcie, 53, PCIE_ATTR53_CAP_NEXTPTR, 0x60);
+	nwl_pcie_modify_attr(pcie, 50,
+			     PCIE_ATTR50_CAP_NEXTPTR |
+			     PCIE_ATTR50_CAP_DEVICE_PORT_TYPE,
+			     FIELD_PREP(PCIE_ATTR50_CAP_DEVICE_PORT_TYPE,
+					PCI_EXP_TYPE_ROOT_PORT));
+
+	/* Disable MSI(-X) capability */
+	nwl_pcie_write_attr(pcie, 41, 0);
+	nwl_pcie_write_attr(pcie, 43, 0);
+	nwl_pcie_write_attr(pcie, 44, 0);
+	nwl_pcie_write_attr(pcie, 45, 0);
+	nwl_pcie_write_attr(pcie, 46, 0);
+	nwl_pcie_write_attr(pcie, 48, 0);
+
+	/* Disable DSN capability */
+	nwl_pcie_write_attr(pcie, 31, 0);
+	nwl_pcie_write_attr(pcie, 82, PCI_CFG_SPACE_SIZE);
+
+	/* Enable AER */
+	nwl_pcie_modify_attr(pcie, 2, 0,
+			     PCIE_ATTR2_AER_CAP_PERMIT_ROOTERR_UPDATE);
+
+	/* Disable L1 latency for root port */
+	nwl_pcie_modify_attr(pcie, 27,
+			     PCIE_ATTR27_DEV_CAP_ENDPOINT_L1_LATENCY, 0);
+
+	/* Enable bandwidth notification */
+	nwl_pcie_modify_attr(pcie, 37, 0,
+			     PCIE_ATTR37_LINK_CAP_BANDWIDTH_NOTIFICATION);
+
+	/* Set max link width */
+	nwl_pcie_write_attr(pcie, 97,
+			    FIELD_PREP(PCIE_ATTR97_LTSSM_MAX_LINK_WIDTH, width) |
+			    FIELD_PREP(PCIE_ATTR97_LINK_CAP_MAX_LINK_WIDTH, width));
+
+	/* Route misc. TLPs to controller */
+	nwl_pcie_modify_attr(pcie, 101, PCIE_ATTR101_EN_MSG_ROUTE,
+			     PCIE_ATTR101_EN_MSG_ROUTE_INTA |
+			     PCIE_ATTR101_EN_MSG_ROUTE_INTB |
+			     PCIE_ATTR101_EN_MSG_ROUTE_INTC |
+			     PCIE_ATTR101_EN_MSG_ROUTE_INTD |
+			     PCIE_ATTR101_EN_MSG_ROUTE_PM_PME |
+			     PCIE_ATTR101_EN_MSG_ROUTE_PME_TO_ACK |
+			     PCIE_ATTR101_EN_MSG_ROUTE_UNLOCK |
+			     PCIE_ATTR101_EN_MSG_ROUTE_PME_TURN_OFF);
+
+	/* Initialize completion credits */
+	nwl_pcie_write_attr(pcie, 105, 205); /* CD */
+	nwl_pcie_write_attr(pcie, 106,
+			    FIELD_PREP(PCIE_ATTR106_VC0_TOTAL_CREDITS_NPH, 12) |
+			    FIELD_PREP(PCIE_ATTR106_VC0_TOTAL_CREDITS_CH, 36));
+	nwl_pcie_write_attr(pcie, 107, 24); /* NPD */
+	nwl_pcie_write_attr(pcie, 108, 181); /* PD */
+	nwl_pcie_modify_attr(pcie, 109, PCIE_ATTR109_VC0_TOTAL_CREDITS_PH, 32);
+}
+
 static inline u32 nwl_bridge_readl(struct nwl_pcie *pcie, u32 off)
 {
 	return readl(pcie->breg_base + off);
@@ -806,6 +965,9 @@ static int nwl_pcie_parse_dt(struct nwl_pcie *pcie,
 	irq_set_chained_handler_and_data(pcie->irq_intx,
 					 nwl_pcie_leg_handler, pcie);
 
+	pcie->ctrl_reset = devm_reset_control_get_optional(dev, "ctrl");
+	if (IS_ERR(pcie->ctrl_reset))
+		return PTR_ERR(pcie->ctrl_reset);
 
 	for (i = 0; i < ARRAY_SIZE(pcie->phy); i++) {
 		pcie->phy[i] = devm_of_phy_get_by_index(dev, dev->of_node, i);
@@ -852,6 +1014,12 @@ static int nwl_pcie_probe(struct platform_device *pdev)
 	if (IS_ERR(pcie->clk))
 		return PTR_ERR(pcie->clk);
 
+	err = reset_control_assert(pcie->ctrl_reset);
+	if (err) {
+		dev_err(dev, "could not enter reset\n");
+		return err;
+	}
+
 	err = clk_prepare_enable(pcie->clk);
 	if (err) {
 		dev_err(dev, "can't enable PCIe ref clock\n");
@@ -864,6 +1032,15 @@ static int nwl_pcie_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
+	if (pcie->ctrl_reset)
+		nwl_pcie_attr_init(pcie);
+
+	err = reset_control_deassert(pcie->ctrl_reset);
+	if (err) {
+		dev_err(dev, "could not release from reset\n");
+		goto err_phy_init;
+	}
+
 	err = nwl_pcie_phy_power_on(pcie);
 	if (err) {
 		dev_err(dev, "could not power on PHYs\n");
-- 
2.35.1.1320.gc452695387.dirty


