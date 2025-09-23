Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C64CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpvzhkMnnnE0sM1NJ/WROyLxLZYgAg7/HObiYFVb1Yk=; b=P+mFEonQK5ek77Kea4B5iLN6jG
	EewcZ8XHsMZB/ozxtHX43ruHTylIIPetBcCRr4IpTRotNTxR/JqLdgIn1mwkZcm1exvsXJBZ4vmqY
	y07sFD2XY4T4y69OeDYGSdQxqU1j8tDkzBYGaHWsHWsBmASLVR3Vde8mTxz0W9MCNerTYDA8Hv78s
	jwhjbtCyM704LG65bC2gHFQ4aC3B1n4rKc+CjohjQ7iD+bMqqEBwfEN8/tRsDbasvBOZJhkcRKF2n
	fcmB0IrG1hSi+m4NdPDFv+XHP0mqUbHO+KlxRy8qA/0mH7IO36FC3fytd9BIIajWEap6GR+wiSpan
	Gu/Ceqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11B3-0000000DAyj-3i4p;
	Tue, 23 Sep 2025 11:27:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11Ay-0000000DAuF-0MjE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 804986027C;
	Tue, 23 Sep 2025 11:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0099FC4CEF5;
	Tue, 23 Sep 2025 11:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758626835;
	bh=Q2ZPEdzb2gnORGVGeGO0IjeJe1l44gLt8XXnAyUuDs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UxRtRGp0z2xiTUUUBesIglAe4niKZKHngVBoyIw1OLjXZASD0/gfb/9uUh3qYLF+f
	 I+OSFxsO0MM/oKN2Y0M0bJ4CL/duS1RDbQpITlg+xF+IqPDWqAzJ87l7nIcYq9zU4N
	 L6LBN0l5aQ/JGBf22gIflpZsEOat4+1e/YoJdR9v8mUTd4wu02nu4jCOovCQZyjwyO
	 BfnrGSyxliKgtCyfHqCRx7c44rCN1hRg6utdmQMAq7CfL3KeHjQOdnOEono7sG1M1i
	 LhKDYe4SM0SbPg87LBVmfHGn+6k+1RP61sq+giwLdc1SF5LpjUgDrwxkAERN1kbVJ5
	 oDNT6UT7kYyoA==
From: Manivannan Sadhasivam <mani@kernel.org>
Date: Tue, 23 Sep 2025 16:56:53 +0530
Subject: [PATCH v10 3/4] PCI: qcom: Prepare for the DWC ECAM enablement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-controller-dwc-ecam-v10-3-e84390ba75fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5560; i=mani@kernel.org;
 h=from:subject:message-id; bh=ollTmHdc+LRKjxsyHOHDxETPk2GcR9fbJFLU7EjwZyE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBo0oP+ERpPcf1S7vPHdvG9W21uHfJMNRjASUUzA
 ipFx2XcwvOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaNKD/gAKCRBVnxHm/pHO
 9WY5B/9wApen9liIm5MjwGfbgjrWAUdg6N4ans9uzmaEz7ZJDErDwNWt2pzQKs5uIj4REIOoJLV
 K0nmecB67wCHl92/nL2A8Kbdufyj/9sY9C2njmqAAXsiUgLapYZIBYvBuA4tMF/mksJYlnLiDrB
 RpRyZSBHoN04M8YM9k4r3l03XOABh1r+ZnJTt6h7tIox1Flvt80Cq3upYYae94M2OQN/R84xuVX
 ybbU2jFc7D1q5PAIIoANGUXGXQS9k7B0Nr08Q0W2UaErot8KP8cXEDleAPkxWRHATHlYq19J7di
 +8iHLaf5WgBTjiQaoYse59r0XpcJLXuNHzBXvnc7woEDmMDR
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
 drivers/pci/controller/dwc/pcie-qcom.c | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c48a20602d7fa4c50056ccf6502d3b5bf0a8287f..e6d2a6b0c087151781ddaf6bf7612f87e2445d17 100644
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
@@ -312,6 +327,47 @@ static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
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
+	 * The only device on the root bus is a single Root Port. If we try to
+	 * access any devices other than Device/Function 00.0 on Bus 0, the TLP
+	 * will go outside of the controller to the PCI bus. But with CFG Shift
+	 * Feature (ECAM) enabled in iATU, there is no guarantee that the
+	 * response is going to be all F's. Hence, to make sure that the
+	 * requester gets all F's response for accesses other than the Root
+	 * Port, configure iATU to block the transactions starting from
+	 * function 1 of the root bus to the end of the root bus (i.e., from
+	 * dbi_base + 4KB to dbi_base + 1MB).
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
@@ -1284,6 +1340,7 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u16 offset;
 	int ret;
 
 	qcom_ep_reset_assert(pcie);
@@ -1292,6 +1349,17 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	if (pp->ecam_enabled) {
+		/*
+		 * Override ELBI when ECAM is enabled, as when ECAM is enabled,
+		 * ELBI moves under the 'config' space.
+		 */
+		offset = FIELD_GET(SLV_DBI_ELBI_ADDR_BASE, readl(pcie->parf + PARF_SLV_DBI_ELBI));
+		pci->elbi_base = pci->dbi_base + offset;
+
+		qcom_pci_config_ecam(pp);
+	}
+
 	ret = qcom_pcie_phy_power_on(pcie);
 	if (ret)
 		goto err_deinit;

-- 
2.48.1


