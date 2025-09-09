Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD690CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zrk21VSoZkBpP3GTLmriJGEIaZ/BKnrwr5qevfp2NzA=; b=uNEWFxzzS5lJc2AMcxOThhmyXN
	ElMRCdb/ia7HntlPl8tFwsy3S8KfhLy4RiPk7vR55aFTYASibGfkaLrc+QU8sHeer2MCzLfa81ZCC
	dyuKp6/63HTkmq7InyB8yS21TCjvaapSMecbXUGXot5aPwuHtMPw6wLbdUpWMgor5lo2HvnH6u1zn
	IbLtWUYtYAwQi88XkCYXJcvsprVvvBis6NpKujcKGr6A7j7HOMuBezCMtSh+vuRzKhEKWwxt1nwEW
	4Nrz89KKzszDMNkHlJTP33lvDBoyty5ELCec6TlDx3fIlFfPmoPDMlB38ladE1s43BzbCrtZA/nyj
	bhMvs+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvthk-00000005ZHZ-2kQa;
	Tue, 09 Sep 2025 08:27:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsSf-000000053Yy-3MVA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:08:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E59D436FE;
	Tue,  9 Sep 2025 07:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2EFC4CEF4;
	Tue,  9 Sep 2025 07:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757401697;
	bh=RZ8tW8iUEXt+riPodRCIZ/rwnZo7JoKB5BjoCIqk0BY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gc0uXzTXO9w3yceN091XK4b2Kt8ZBkMBy4blis6l5wHWusGZDE0vvbCxXLER3s0sE
	 2TdDauTMP4k03pbux4UVAIshMscZzwa//eZDdN1xj5pOv5OiIU9uzWRW0R2CPjn1jf
	 os9omIaYUhz6IG3ngPS6FGO9TsgZPqJjAHH4E/XyRTxQXDtqN/sqckRkuBn0kJwTvA
	 8mG5ZsMHn3ONE93l6ZIBU9SKvdaiFhFSvclmjhZ4ANuggG9jngH8QJRFwda2/6uKox
	 lUiBkErkAs/Dwego+zk8Cld11Bmbqv9GfzEjRM3Qkr87UzlOlytPr7v0aOxtw6Cu/k
	 jOxyMWR4JFDzA==
From: Manivannan Sadhasivam <mani@kernel.org>
Date: Tue, 09 Sep 2025 12:37:52 +0530
Subject: [PATCH v9 3/4] PCI: qcom: Prepare for the DWC ECAM enablement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-controller-dwc-ecam-v9-3-7d5b651840dd@kernel.org>
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
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5855; i=mani@kernel.org;
 h=from:subject:message-id; bh=JTMChg6PVfEBCYWx0M6eUkDGk8ialE1YepnfzE8n/ys=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBov9JO1tq4u+1qA4OufrDqhYD2PkakBUdHiUTbc
 f3gMpsvLqiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaL/STgAKCRBVnxHm/pHO
 9eGdB/9eKcQfDkZPpQWO3BjtTOsVSF5Z9H8QiAIzE8Vj1RKACNY3ivPzSXVingzP4YEl9BWPXpj
 uRui+GjXwPIQBhD+tXDJeROr1GHSQe5HMKcNMBeaDPjw4I12Gg0ARTPhPMBjN5jVm1d1/AhvSO0
 JgPIRLi4L4MobXvIXPiDBP1W6dDcPa7dUlKEQ2Ju7+RLFRjiRM9fk2s0DcL2qBOYAACfbXwBm2w
 xsqUKR0vLTMd+N15ru6wjJ8pLCGQQR9usDi5QpuTZvNPNWjsm0CHgfOL+gwKBRT99SirAb8IbeT
 OG7hyNHv+DFmFu+fO79825BJbZrPQuy1LrT+i5l/rhETdUW4
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000817_888333_C2CD8EBA 
X-CRM114-Status: GOOD (  18.27  )
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

To support the DWC ECAM mechanism, prepare the driver by performing below
configurations:

  1. Since the ELBI region will be covered by the ECAM 'config' space,
     override the 'elbi_base' with the address derived from 'dbi_base' and
     the offset from PARF_SLV_DBI_ELBI register.

  2. Block the transactions from the host bridge to devices other than Root
     Port on the root bus to return all F's. This is required when the 'CFG
     Shift Feature' of iATU is enabled.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
[mani: code split, reworded subject/description and comments]
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 69 ++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 5092752de23866ef95036bb3f8fae9bb06e8ea1e..4324555de72adbdd3dcdf59497f9bd067d9c90ab 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -55,6 +55,7 @@
 #define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
 #define PARF_Q2A_FLUSH				0x1ac
 #define PARF_LTSSM				0x1b0
+#define PARF_SLV_DBI_ELBI			0x1b4
 #define PARF_INT_ALL_STATUS			0x224
 #define PARF_INT_ALL_CLEAR			0x228
 #define PARF_INT_ALL_MASK			0x22c
@@ -64,6 +65,16 @@
 #define PARF_DBI_BASE_ADDR_V2_HI		0x354
 #define PARF_SLV_ADDR_SPACE_SIZE_V2		0x358
 #define PARF_SLV_ADDR_SPACE_SIZE_V2_HI		0x35c
+#define PARF_BLOCK_SLV_AXI_WR_BASE		0x360
+#define PARF_BLOCK_SLV_AXI_WR_BASE_HI		0x364
+#define PARF_BLOCK_SLV_AXI_WR_LIMIT		0x368
+#define PARF_BLOCK_SLV_AXI_WR_LIMIT_HI		0x36c
+#define PARF_BLOCK_SLV_AXI_RD_BASE		0x370
+#define PARF_BLOCK_SLV_AXI_RD_BASE_HI		0x374
+#define PARF_BLOCK_SLV_AXI_RD_LIMIT		0x378
+#define PARF_BLOCK_SLV_AXI_RD_LIMIT_HI		0x37c
+#define PARF_ECAM_BASE				0x380
+#define PARF_ECAM_BASE_HI			0x384
 #define PARF_NO_SNOOP_OVERRIDE			0x3d4
 #define PARF_ATU_BASE_ADDR			0x634
 #define PARF_ATU_BASE_ADDR_HI			0x638
@@ -87,6 +98,7 @@
 
 /* PARF_SYS_CTRL register fields */
 #define MAC_PHY_POWERDOWN_IN_P2_D_MUX_EN	BIT(29)
+#define PCIE_ECAM_BLOCKER_EN			BIT(26)
 #define MST_WAKEUP_EN				BIT(13)
 #define SLV_WAKEUP_EN				BIT(12)
 #define MSTR_ACLK_CGC_DIS			BIT(10)
@@ -134,6 +146,9 @@
 /* PARF_LTSSM register fields */
 #define LTSSM_EN				BIT(8)
 
+/* PARF_SLV_DBI_ELBI */
+#define SLV_DBI_ELBI_ADDR_BASE			GENMASK(11, 0)
+
 /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
 #define PARF_INT_ALL_LINK_UP			BIT(13)
 #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
@@ -317,6 +332,47 @@ static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
 	qcom_perst_assert(pcie, false);
 }
 
+static void qcom_pci_config_ecam(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u64 addr, addr_end;
+	u32 val;
+
+	writel_relaxed(lower_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE);
+	writel_relaxed(upper_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE_HI);
+
+	/*
+	 * The only device on root bus is a single Root Port. So if PCI core
+	 * tries to access any devices other than Device/Function (0.0) in Bus
+	 * 0, the TLP will go outside of the controller to the PCI bus. But with
+	 * CFG Shift Feature (ECAM) enabled in iATU, there is no guarantee that
+	 * the response is going to be all F's. Hence, to make sure that the
+	 * requester gets all F's response for accesses other than the Root
+	 * Port, configure iATU to block the transactions starting from function
+	 * 1 of the root bus to the end of the root bus (i.e from dbi_base + 4kb
+	 * to dbi_base + 1MB).
+	 */
+	addr = pci->dbi_phys_addr + SZ_4K;
+	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE);
+	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE_HI);
+
+	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE);
+	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE_HI);
+
+	addr_end = pci->dbi_phys_addr + SZ_1M - 1;
+
+	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT);
+	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT_HI);
+
+	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT);
+	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT_HI);
+
+	val = readl_relaxed(pcie->parf + PARF_SYS_CTRL);
+	val |= PCIE_ECAM_BLOCKER_EN;
+	writel_relaxed(val, pcie->parf + PARF_SYS_CTRL);
+}
+
 static int qcom_pcie_start_link(struct dw_pcie *pci)
 {
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
@@ -326,6 +382,9 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
 		qcom_pcie_common_set_16gt_lane_margining(pci);
 	}
 
+	if (pci->pp.ecam_enabled)
+		qcom_pci_config_ecam(&pci->pp);
+
 	/* Enable Link Training state machine */
 	if (pcie->cfg->ops->ltssm_enable)
 		pcie->cfg->ops->ltssm_enable(pcie);
@@ -1314,6 +1373,7 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u16 offset;
 	int ret;
 
 	qcom_ep_reset_assert(pcie);
@@ -1322,6 +1382,15 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	if (pp->ecam_enabled) {
+		/*
+		 * Override ELBI when ECAM is enabled, as when ECAM is enabled,
+		 * ELBI moves under the 'config' space.
+		 */
+		offset = FIELD_GET(SLV_DBI_ELBI_ADDR_BASE, readl(pcie->parf + PARF_SLV_DBI_ELBI));
+		pci->elbi_base = pci->dbi_base + offset;
+	}
+
 	ret = qcom_pcie_phy_power_on(pcie);
 	if (ret)
 		goto err_deinit;

-- 
2.45.2


