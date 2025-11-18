Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F681CEE35F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 21:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaPSUP3SJ9G8REbAzCDVPRpkeZvmYJrKaIu1LrJduLg=; b=drjDt0GVW/K1fEis/I9iimXP9+
	/4oHRSIUyCDjOkXLnDp84mkf3FCm3ut4p22b8IA3zbsrRVkhzs4wBfcQReqUqUe/aUXOwYt1ehwVO
	v33gWJ2+GVUu7emEpZGdlVVMf0/6Y/4t/j7hUaZvVtF+SpdKw0antM5qzmXcmsVxBut57myI1mp7/
	vJj1RC7eistjL82kPpCvsHjKwdp1grDwyp1L6Ji75GdjJw4Qz6fSvxax6/v97KS+0PfbRZesaR+sa
	h8eZiHuk8NLDJt1+jMFi0iu4MyCP2QZrnEq129DMIaIVrqKRYNNLJbYeyZAFt5t049L/jPnYuD1J3
	59xzX+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTTv-000000018O1-4Bb9;
	Tue, 18 Nov 2025 21:43:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTTv-000000018NO-0Vq8;
	Tue, 18 Nov 2025 21:43:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D4BD2601DE;
	Tue, 18 Nov 2025 21:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EFAC4AF0D;
	Tue, 18 Nov 2025 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763502200;
	bh=lAnQCrSiM3uixg2a7WEWN3009GHh2tQrWsx3N4gBtcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=haVaC/s/JZOhkHQI72Lcu18JKJ/MHz01UjYRxBF3i5UKPVmqofXy8DZsr8hoyCTst
	 BJ0+mm2Ipp8FUsWT8S63gsOqsUGPoV1tjZ0JgGkv42BU6XwJ2L0wuc6bGG6tDr36Ef
	 ktOvLsay7YWfLqsmwQFNGxmjUYWhxcLG3i8er2yDHKHQva+Zb2IrDO+pZwbYsgMjQQ
	 dsv2j5J0HOA/89jT7GgeFgDo4LzFVGSAmKA07ALuoABKDu6F6/glCX7jRj4XyT38Px
	 yXjDsNLJ1idZY1EguY/CKMB4eJSKzDUOOFUsMwveEJaghCUU1d63K/P7Dm255knTUE
	 Fg8cXlPHmSwEw==
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
Subject: [PATCH v2 1/4] PCI: dwc: Advertise L1 PM Substates only if driver requests it
Date: Tue, 18 Nov 2025 15:42:15 -0600
Message-ID: <20251118214312.2598220-2-helgaas@kernel.org>
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

From: Bjorn Helgaas <bhelgaas@google.com>

L1 PM Substates require the CLKREQ# signal and may also require
device-specific support.  If CLKREQ# is not supported or driver support is
lacking, enabling L1.1 or L1.2 may cause errors when accessing devices,
e.g.,

  nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10

If the kernel is built with CONFIG_PCIEASPM_POWER_SUPERSAVE=y or users
enable L1.x via sysfs, users may trip over these errors even if L1
Substates haven't been enabled by firmware or the driver.

To prevent such errors, disable advertising the L1 PM Substates unless the
driver sets "dw_pcie.l1ss_support" to indicate that it knows CLKREQ# is
present and any device-specific configuration has been done.

Set "dw_pcie.l1ss_support" in tegra194 (if DT includes the
"supports-clkreq' property) and qcom (for cfg_2_7_0, cfg_1_9_0, cfg_1_34_0,
and cfg_sc8280xp controllers) so they can continue to use L1 Substates.

Based on Niklas's patch:
https://patch.msgid.link/20251017163252.598812-2-cassel@kernel.org

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 .../pci/controller/dwc/pcie-designware-ep.c   |  2 ++
 .../pci/controller/dwc/pcie-designware-host.c |  2 ++
 drivers/pci/controller/dwc/pcie-designware.c  | 24 +++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h  |  2 ++
 drivers/pci/controller/dwc/pcie-qcom.c        |  2 ++
 drivers/pci/controller/dwc/pcie-tegra194.c    |  3 +++
 6 files changed, 35 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 7f2112c2fb21..ad6c0fd67a65 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -966,6 +966,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 	if (ep->ops->init)
 		ep->ops->init(ep);
 
+	dw_pcie_hide_unsupported_l1ss(pci);
+
 	ptm_cap_base = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
 
 	/*
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 20c9333bcb1c..7abeb771e32d 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1060,6 +1060,8 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
 	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
 
+	dw_pcie_hide_unsupported_l1ss(pci);
+
 	dw_pcie_config_presets(pp);
 	/*
 	 * If the platform provides its own child bus config accesses, it means
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index c644216995f6..6e6a0dac5b53 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -1081,6 +1081,30 @@ void dw_pcie_edma_remove(struct dw_pcie *pci)
 	dw_edma_remove(&pci->edma);
 }
 
+void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci)
+{
+	u16 l1ss;
+	u32 l1ss_cap;
+
+	if (pci->l1ss_support)
+		return;
+
+	l1ss = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
+	if (!l1ss)
+		return;
+
+	/*
+	 * Unless the driver claims "l1ss_support", don't advertise L1 PM
+	 * Substates because they require CLKREQ# and possibly other
+	 * device-specific configuration.
+	 */
+	l1ss_cap = dw_pcie_readl_dbi(pci, l1ss + PCI_L1SS_CAP);
+	l1ss_cap &= ~(PCI_L1SS_CAP_PCIPM_L1_1 | PCI_L1SS_CAP_ASPM_L1_1 |
+		      PCI_L1SS_CAP_PCIPM_L1_2 | PCI_L1SS_CAP_ASPM_L1_2 |
+		      PCI_L1SS_CAP_L1_PM_SS);
+	dw_pcie_writel_dbi(pci, l1ss + PCI_L1SS_CAP, l1ss_cap);
+}
+
 void dw_pcie_setup(struct dw_pcie *pci)
 {
 	u32 val;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index e995f692a1ec..a68eea47d451 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -516,6 +516,7 @@ struct dw_pcie {
 	int			max_link_speed;
 	u8			n_fts[2];
 	struct dw_edma_chip	edma;
+	bool			l1ss_support;	/* L1 PM Substates support */
 	struct clk_bulk_data	app_clks[DW_PCIE_NUM_APP_CLKS];
 	struct clk_bulk_data	core_clks[DW_PCIE_NUM_CORE_CLKS];
 	struct reset_control_bulk_data	app_rsts[DW_PCIE_NUM_APP_RSTS];
@@ -573,6 +574,7 @@ int dw_pcie_prog_ep_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
 				int type, u64 parent_bus_addr,
 				u8 bar, size_t size);
 void dw_pcie_disable_atu(struct dw_pcie *pci, u32 dir, int index);
+void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci);
 void dw_pcie_setup(struct dw_pcie *pci);
 void dw_pcie_iatu_detect(struct dw_pcie *pci);
 int dw_pcie_edma_detect(struct dw_pcie *pci);
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 805edbbfe7eb..61c2f4e2f74d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1067,6 +1067,8 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	val &= ~REQ_NOT_ENTR_L1;
 	writel(val, pcie->parf + PARF_PM_CTRL);
 
+	pci->l1ss_support = true;
+
 	val = readl(pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
 	val |= EN;
 	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 10e74458e667..3934757baa30 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -703,6 +703,9 @@ static void init_host_aspm(struct tegra_pcie_dw *pcie)
 	val |= (pcie->aspm_pwr_on_t << 19);
 	dw_pcie_writel_dbi(pci, pcie->cfg_link_cap_l1sub, val);
 
+	if (pcie->supports_clkreq)
+		pci->l1ss_support = true;
+
 	/* Program L0s and L1 entrance latencies */
 	val = dw_pcie_readl_dbi(pci, PCIE_PORT_AFR);
 	val &= ~PORT_AFR_L0S_ENTRANCE_LAT_MASK;
-- 
2.43.0


