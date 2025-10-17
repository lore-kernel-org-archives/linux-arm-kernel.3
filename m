Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCC5CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mfXNPb5m1PGAd5Gjz7HBNNJd5UjEK4Pbi9/7hMzVUkg=; b=swOJvRMqSEdIXAa4HD4MjAi60l
	wHieiT2Ukr/YqKPuBJSbmirI7AK7Jue5SBJ1UKn1CV2Ozk+644s3TOOshV55VkQcXPGdB9G9cgP4+
	vatPnXqJM+Y0HEzGQxbTwK09XKCpaTUahlCPKYSYnn++vCbW/Bwn+xCXcmKiCfvfbZb4JJilj3OEy
	gRtD2mTOIYFa8oebf7aHOTpChPNqkEodq+9iK+HmTKVqUAh7HYS53lxjtwZ/0hVVGHhiDsc1SHyxR
	F2mhw4ywnhBpI3XDtpWEcKBcZ7J4crATuJvFgtBdT+jC4jgokpDWK61VS4OWi16GyMi/nRY7R/dEP
	X4zHUBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nOC-00000008SOc-45Yj;
	Fri, 17 Oct 2025 16:33:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nOB-00000008SOF-2fpw;
	Fri, 17 Oct 2025 16:33:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A1AE647C3;
	Fri, 17 Oct 2025 16:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983EFC4CEE7;
	Fri, 17 Oct 2025 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760718790;
	bh=YalfQ6bnC/Qus6A8HLxzTaKEuSJ9wI8LHGYjVnhv5QY=;
	h=From:To:Cc:Subject:Date:From;
	b=lG+baq3Dhz6Vmz1jp1JEXs4NSNsOPrZQl4adCq/xOwej2OtKACrWjm2vtoSkscOTz
	 JHk2Jcvbyko4jQtIL+vAGClTCydcexn3cDTasb/04va+Z0D27cpapYvgF70hwdNME6
	 JOkse1kC1FuejGA6QQcNUQwPHOsgneiaefX9+ZNoVjWv9jS0WSjxHhwf0LFt0g47ln
	 sYk602lE3Y39bvxrLOJPYZ79xd4P5TtBjJGXaY1yCkxIfv+/fkUrkP249FB/aWdf1P
	 /c+PxS2fH326e0o0PicmBbnTvhlaCtHncnobVAXOVlWs57zk7CRVAzMmKEGDTiZKdj
	 At7MZI4ADdBTg==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Niklas Cassel <cassel@kernel.org>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3] PCI: dw-rockchip: Prevent advertising L1 Substates support
Date: Fri, 17 Oct 2025 18:32:53 +0200
Message-ID: <20251017163252.598812-2-cassel@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3710; i=cassel@kernel.org; h=from:subject; bh=YalfQ6bnC/Qus6A8HLxzTaKEuSJ9wI8LHGYjVnhv5QY=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDI+5W/xOBN/P0R3RcevsyZpLgsXOp3iCX6cu3VCu82TB f9XeUzo7ChlYRDjYpAVU2Tx/eGyv7jbfcpxxTs2MHNYmUCGMHBxCsBE5AwZ/hkw2S1jiMru+Mi0 v2bqOia+TaIvWTxV2sX9XsT2rt99YTIjwzr26enqLPI8nnf2WFwJm/Tz7F6mq72yE7pWaISoHbX 5wg0A
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

The L1 substates support requires additional steps to work, namely:
-Proper handling of the CLKREQ# sideband signal. (It is mostly handled by
 hardware, but software still needs to set the clkreq fields in the
 PCIE_CLIENT_POWER_CON register to match the hardware implementation.)
-Program the frequency of the aux clock into the
 DSP_PCIE_PL_AUX_CLK_FREQ_OFF register. (During L1 substates the core_clk
 is turned off and the aux_clk is used instead.)

These steps are currently missing from the driver.

For more details, see section '18.6.6.4 L1 Substate' in the RK3658 TRM 1.1
Part 2, or section '11.6.6.4 L1 Substate' in the RK3588 TRM 1.0 Part2.

While this has always been a problem when using e.g.
CONFIG_PCIEASPM_POWER_SUPERSAVE=y, or when modifying
/sys/bus/pci/devices/.../link/l1_2_aspm, the lacking driver support for L1
substates became more apparent after commit f3ac2ff14834 ("PCI/ASPM:
Enable all ClockPM and ASPM states for devicetree platforms"), which
enabled ASPM also for CONFIG_PCIEASPM_DEFAULT=y.

When using e.g. an NVMe drive connected to the PCIe controller, the
problem will be seen as:
nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
nvme nvme0: Does your device have a faulty power saving mode enabled?
nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off" and report a bug

Thus, prevent advertising L1 Substates support until proper driver support
is added.

Cc: stable@vger.kernel.org
Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
Acked-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Changes since v2:
-Improve commit message (Bjorn)

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 3e2752c7dd09..84f882abbca5 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -200,6 +200,25 @@ static bool rockchip_pcie_link_up(struct dw_pcie *pci)
 	return FIELD_GET(PCIE_LINKUP_MASK, val) == PCIE_LINKUP;
 }
 
+/*
+ * See e.g. section '11.6.6.4 L1 Substate' in the RK3588 TRM V1.0 for the steps
+ * needed to support L1 substates. Currently, not a single rockchip platform
+ * performs these steps, so disable L1 substates until there is proper support.
+ */
+static void rockchip_pcie_disable_l1sub(struct dw_pcie *pci)
+{
+	u32 cap, l1subcap;
+
+	cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
+	if (cap) {
+		l1subcap = dw_pcie_readl_dbi(pci, cap + PCI_L1SS_CAP);
+		l1subcap &= ~(PCI_L1SS_CAP_L1_PM_SS | PCI_L1SS_CAP_ASPM_L1_1 |
+			      PCI_L1SS_CAP_ASPM_L1_2 | PCI_L1SS_CAP_PCIPM_L1_1 |
+			      PCI_L1SS_CAP_PCIPM_L1_2);
+		dw_pcie_writel_dbi(pci, cap + PCI_L1SS_CAP, l1subcap);
+	}
+}
+
 static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
 {
 	u32 cap, lnkcap;
@@ -264,6 +283,7 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 	irq_set_chained_handler_and_data(irq, rockchip_pcie_intx_handler,
 					 rockchip);
 
+	rockchip_pcie_disable_l1sub(pci);
 	rockchip_pcie_enable_l0s(pci);
 
 	return 0;
@@ -301,6 +321,7 @@ static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	enum pci_barno bar;
 
+	rockchip_pcie_disable_l1sub(pci);
 	rockchip_pcie_enable_l0s(pci);
 	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
 
-- 
2.51.0


