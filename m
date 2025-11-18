Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985B6CEE35A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 21:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXqLKoMVhuaQ+byTEnfxuxa0pdX+L16zJCj4ttNxmkw=; b=kvOCFDkxLHVEkX/Gx8zflAKoOF
	wSFxpUSI5Uy1+b1rqCLD8xrcppI9q4eZWJFABTF6nZ1i5OW7RlBbrwleUAwHQCdHWSiPAQk5k0U5x
	cPRqXWsvR7BpmUtnJuK3fpUqrdReeGKNP8SUBLXWMlDDxuOJPzLGH2kVJ2v7O/THqycEqUb8Gn3le
	CoIQx3hS4dpwnX8KuDght2hOp333wDdmFtu97oZS1EPwMA6CA9CyR8NrpyH9IDxacAmMqM3mSXxwk
	ECWBu6P/pwsNraCYohrum7MxoOJcpatllr8YfPKLoX79YXYPb0paopmf9syJbpozY6FPRlqMAacix
	7vnBoz1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTU0-000000018R0-0HpN;
	Tue, 18 Nov 2025 21:43:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTTv-000000018Nb-3wWn;
	Tue, 18 Nov 2025 21:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A6C94071A;
	Tue, 18 Nov 2025 21:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECD3C19425;
	Tue, 18 Nov 2025 21:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763502202;
	bh=9jI0JNZsWu/0Sbbp/cTHMbIfakTwsoRC2h7CTkJj1rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mfALpphdiRm5/rpPQldjdacr9/M5TLzGNd8xoMAUSe3gHTSl3A++3aQqTc2dYI4fx
	 2SWs87rXSbH+FoUHgTM/jZGchsvMQCyyhJGU38hJ+MNnHTQOUdpw2rsg5fiVQDcI+Z
	 OV7AsjFFjmNy59M5T2cNHpt9N6jUqfGAn4m/oLer1/C1fSvIhfaPmWjzARaYaTgf61
	 JupB+VPkhRQPorP/cSDXv6/MPSBWHIZSONYpnHb90Hn51s/UUz8wB33v04nb8PyXrd
	 hkDtebmqrmC0+9tq9rIR9lLBvERu0HmkS7qhTG9DedDfesb3HInca/3Yf5MfHG3PpK
	 iKG4bmqI8ZltQ==
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
Subject: [PATCH v2 2/4] PCI: tegra194: Remove unnecessary L1SS disable code
Date: Tue, 18 Nov 2025 15:42:16 -0600
Message-ID: <20251118214312.2598220-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118214312.2598220-1-helgaas@kernel.org>
References: <20251118214312.2598220-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_134324_049499_E2348C83 
X-CRM114-Status: GOOD (  14.94  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

The DWC core clears the L1 Substates Supported bits unless the driver sets
the "dw_pcie.l1ss_support" flag.

The tegra194 init_host_aspm() sets "dw_pcie.l1ss_support" if the platform
has the "supports-clkreq" DT property.  If "supports-clkreq" is absent,
"dw_pcie.l1ss_support" is not set, and the DWC core will clear the L1
Substates Supported bits.

The tegra194 code to clear the L1 Substates Supported bits is unnecessary,
so remove it.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 45 +++-------------------
 1 file changed, 5 insertions(+), 40 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 3934757baa30..0ddeef70726d 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -260,7 +260,6 @@ struct tegra_pcie_dw {
 	u32 msi_ctrl_int;
 	u32 num_lanes;
 	u32 cid;
-	u32 cfg_link_cap_l1sub;
 	u32 ras_des_cap;
 	u32 pcie_cap_base;
 	u32 aspm_cmrt;
@@ -475,8 +474,7 @@ static irqreturn_t tegra_pcie_ep_irq_thread(int irq, void *arg)
 		return IRQ_HANDLED;
 
 	/* If EP doesn't advertise L1SS, just return */
-	val = dw_pcie_readl_dbi(pci, pcie->cfg_link_cap_l1sub);
-	if (!(val & (PCI_L1SS_CAP_ASPM_L1_1 | PCI_L1SS_CAP_ASPM_L1_2)))
+	if (!pci->l1ss_support)
 		return IRQ_HANDLED;
 
 	/* Check if BME is set to '1' */
@@ -608,24 +606,6 @@ static struct pci_ops tegra_pci_ops = {
 };
 
 #if defined(CONFIG_PCIEASPM)
-static void disable_aspm_l11(struct tegra_pcie_dw *pcie)
-{
-	u32 val;
-
-	val = dw_pcie_readl_dbi(&pcie->pci, pcie->cfg_link_cap_l1sub);
-	val &= ~PCI_L1SS_CAP_ASPM_L1_1;
-	dw_pcie_writel_dbi(&pcie->pci, pcie->cfg_link_cap_l1sub, val);
-}
-
-static void disable_aspm_l12(struct tegra_pcie_dw *pcie)
-{
-	u32 val;
-
-	val = dw_pcie_readl_dbi(&pcie->pci, pcie->cfg_link_cap_l1sub);
-	val &= ~PCI_L1SS_CAP_ASPM_L1_2;
-	dw_pcie_writel_dbi(&pcie->pci, pcie->cfg_link_cap_l1sub, val);
-}
-
 static inline u32 event_counter_prog(struct tegra_pcie_dw *pcie, u32 event)
 {
 	u32 val;
@@ -682,10 +662,9 @@ static int aspm_state_cnt(struct seq_file *s, void *data)
 static void init_host_aspm(struct tegra_pcie_dw *pcie)
 {
 	struct dw_pcie *pci = &pcie->pci;
-	u32 val;
+	u32 l1ss, val;
 
-	val = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
-	pcie->cfg_link_cap_l1sub = val + PCI_L1SS_CAP;
+	l1ss = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
 
 	pcie->ras_des_cap = dw_pcie_find_ext_capability(&pcie->pci,
 							PCI_EXT_CAP_ID_VNDR);
@@ -697,11 +676,11 @@ static void init_host_aspm(struct tegra_pcie_dw *pcie)
 			   PCIE_RAS_DES_EVENT_COUNTER_CONTROL, val);
 
 	/* Program T_cmrt and T_pwr_on values */
-	val = dw_pcie_readl_dbi(pci, pcie->cfg_link_cap_l1sub);
+	val = dw_pcie_readl_dbi(pci, l1ss + PCI_L1SS_CAP);
 	val &= ~(PCI_L1SS_CAP_CM_RESTORE_TIME | PCI_L1SS_CAP_P_PWR_ON_VALUE);
 	val |= (pcie->aspm_cmrt << 8);
 	val |= (pcie->aspm_pwr_on_t << 19);
-	dw_pcie_writel_dbi(pci, pcie->cfg_link_cap_l1sub, val);
+	dw_pcie_writel_dbi(pci, l1ss + PCI_L1SS_CAP, val);
 
 	if (pcie->supports_clkreq)
 		pci->l1ss_support = true;
@@ -729,8 +708,6 @@ static void init_debugfs(struct tegra_pcie_dw *pcie)
 				    aspm_state_cnt);
 }
 #else
-static inline void disable_aspm_l12(struct tegra_pcie_dw *pcie) { return; }
-static inline void disable_aspm_l11(struct tegra_pcie_dw *pcie) { return; }
 static inline void init_host_aspm(struct tegra_pcie_dw *pcie) { return; }
 static inline void init_debugfs(struct tegra_pcie_dw *pcie) { return; }
 #endif
@@ -934,12 +911,6 @@ static int tegra_pcie_dw_host_init(struct dw_pcie_rp *pp)
 
 	init_host_aspm(pcie);
 
-	/* Disable ASPM-L1SS advertisement if there is no CLKREQ routing */
-	if (!pcie->supports_clkreq) {
-		disable_aspm_l11(pcie);
-		disable_aspm_l12(pcie);
-	}
-
 	if (!pcie->of_data->has_l1ss_exit_fix) {
 		val = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
 		val &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
@@ -1874,12 +1845,6 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 
 	init_host_aspm(pcie);
 
-	/* Disable ASPM-L1SS advertisement if there is no CLKREQ routing */
-	if (!pcie->supports_clkreq) {
-		disable_aspm_l11(pcie);
-		disable_aspm_l12(pcie);
-	}
-
 	if (!pcie->of_data->has_l1ss_exit_fix) {
 		val = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
 		val &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
-- 
2.43.0


