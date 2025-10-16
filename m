Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9659DCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xArQicCnsHJJIvghS6L65lZYuqwmGL3Evcr92jb0ycI=; b=A8ATn9MiL46OZ/v3XvjXB8/I4T
	MbH+hFIifKxLeed+unewTXLEoYko2M76RKQFIP5ZkGpS4g3iWUrgGAVu7HB1df+OMld3meWlrK3nw
	/c4JivfM+Fgcq1bkqCxtlcsP2lh+X95icMyiZd8JQSYcPBADmJRpgxBOz4zA4E3rXJSr/qc2Tz3xI
	r4m8KxwzzshWxEOn71zLkAvdWoBlnF72WTl5TNsDa24BPm0YEAQGwZe/mOKwKLKO5LekWC0xMLzF9
	IuhIwZ2QpUqcYJZvOgLiXC0bg3hEZiQw9HhDkV6vVGhyWvdnVb+scehbihp6bDXc/bQhhelhHfU+t
	8XZ5AoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JuY-000000046T9-20HR;
	Thu, 16 Oct 2025 09:04:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JuV-000000046S9-3knC;
	Thu, 16 Oct 2025 09:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E0C443F7E;
	Thu, 16 Oct 2025 09:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1058C4CEF1;
	Thu, 16 Oct 2025 09:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760605475;
	bh=+lWpPiGYgIsj4CL7weoN8PdEGbyE8TzjYmObhr7nNbA=;
	h=From:To:Cc:Subject:Date:From;
	b=Pj9TzT0AlasKWSmm2NeAMCofrPObdVRGipvxqqyYgXfize+/9whtSJT8M2u/uN8wF
	 7a9m72xg9WK3i6EO6qxlcYG5Qjy2JTAEOlGAhm3EeeERq4Z7LTPETVW/RqrPfT9pQM
	 LM1THAyUbLCe3blKMosls3+L4BldpdSqCymlT2FRGQ81AP4QnBhGFYtd0y+973F0U8
	 diIUY7uTDVJOOLr7+l01jKkD0POvizO5VRXU0FkObwwQQzyssH2a7Zqe05YTieJamS
	 OM4dMuhfdrlXLsQwFJRj/D3WamMk1chivdzaV/icwaeUYeCQeZ1Pm+GOXa/5eHs6fs
	 Ze07tGQo3IRFg==
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
Subject: [PATCH v2] PCI: dw-rockchip: Disable L1 substates
Date: Thu, 16 Oct 2025 11:04:22 +0200
Message-ID: <20251016090422.451982-2-cassel@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2709; i=cassel@kernel.org; h=from:subject; bh=+lWpPiGYgIsj4CL7weoN8PdEGbyE8TzjYmObhr7nNbA=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDI+bBW7H2mmu/iL+dml7il6tU1XA8/cu7Owb+miRqVpl gVXciX7O0pZGMS4GGTFFFl8f7jsL+52n3Jc8Y4NzBxWJpAhDFycAjCRzQaMDHcveHt4earZVtgZ n9lx5IC4svs+4S91u5jqZM0uBFw0cGD471LT/GSVf+zB5d9qDE+9uvN6S3TU3kVRzK9lFbe+CzU uZwQA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_020435_970586_2C447D5F 
X-CRM114-Status: GOOD (  11.34  )
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

The L1 substates support requires additional steps to work, see e.g.
section '11.6.6.4 L1 Substate' in the RK3588 TRM V1.0.

These steps are currently missing from the driver.

While this has always been a problem when using e.g.
CONFIG_PCIEASPM_POWER_SUPERSAVE=y, the problem became more apparent after
commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for
devicetree platforms"), which enabled ASPM also for
CONFIG_PCIEASPM_DEFAULT=y.

Disable L1 substates until proper support is added.

Cc: stable@vger.kernel.org
Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Changes since v1:
-Remove superfluous dw_pcie_readl_dbi()

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


