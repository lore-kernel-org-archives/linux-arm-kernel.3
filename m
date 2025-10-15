Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE6CCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bJRtd0oYRH0tVaVbQlYyGjA1NP5uPPEwnum4BM0+7BU=; b=BpNGO8A701sbmcBpgm1KV8D99t
	RleI+Ci3pXUShu0NRt2n1WGrtFKC8Q62pwAljqBrtnQMlKuUBnw3mKa4h5VjRwjfgB6J6yVPLWfSK
	FNbxhcu581wdMmEqMFdAPRYda598237N+PdemokrbIt1eBhvSEl3CpyQbktUZsrtHllwMUJ9fxJSg
	SdDcp029d8WyMqeDi4HeviMHBNaqdAVZn5JWWELUcxlpdcep12WdAqKTB1GJuBECcjgnmv8TtHCPZ
	0I7jhRGgnIeTV2nWQEADgL60ERq/gEJpB12pw52Moo9o+wgTFt8YAaOxK2Fvs8NqFEPemgUFzgn/z
	yfLFh3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90fn-00000001Ylj-2LrU;
	Wed, 15 Oct 2025 12:32:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90fk-00000001Yk4-3Bww;
	Wed, 15 Oct 2025 12:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B04644953;
	Wed, 15 Oct 2025 12:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8DCC4CEFE;
	Wed, 15 Oct 2025 12:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760531524;
	bh=5N9ifJNPMX7iGbLSPciaEtZ0geP6Y6nlRMPr+SPHcMk=;
	h=From:To:Cc:Subject:Date:From;
	b=WTr4QbiR2+wAU+XA9RLxcQ4d16cjQypyoDxU5uyMdPFCK6WNGpcd+MwYgGBSUkoCb
	 Vqf9U1nraCPY04gRPKM1Odeu53nIyMM60pIbFE3tmczScsSRF566VFp3k4aT/umnRO
	 q6D+cjZfWyYHMm7J6BVldqrAHKHAprIPGrHee+A7Z0C+emMQgdnBQgZyypjXrfZfIi
	 zFy9oTgYfJvpyQFmoVV/5nPsYFs9lKC5sbQRr0pwM1Rv6+Baim/zTs3Ysl8Du1B6c4
	 eh/rw2kI8rTpkPgAfkMLtMwx4BXUWhcvJWOFibc2wyVYVDUluLYo9tRnI6eu0roudF
	 rZT7wH5wNbUkA==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Simon Xue <xxm@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Niklas Cassel <cassel@kernel.org>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] PCI: dw-rockchip: Disable L1 substates
Date: Wed, 15 Oct 2025 14:31:43 +0200
Message-ID: <20251015123142.392274-2-cassel@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2706; i=cassel@kernel.org; h=from:subject; bh=5N9ifJNPMX7iGbLSPciaEtZ0geP6Y6nlRMPr+SPHcMk=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDLeT9GzOtnxsDYucorBuZ8fdh/pt2E6/G1T2nKLZ7/Xn PBbpHh1d0cpC4MYF4OsmCKL7w+X/cXd7lOOK96xgZnDygQyhIGLUwAmsi+A4Z92EsPaku4Jt68r zn31bZWOZ5ltv32w86yfjl/+zt/W3fiNkWFf25zmBqmGX4d/16+KChXyn3925fmz9YIlv2uMqlg OWPMAAA==
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_053204_836644_E8D3F1AF 
X-CRM114-Status: GOOD (  11.94  )
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
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 3e2752c7dd09..28e0fffe2542 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -200,6 +200,26 @@ static bool rockchip_pcie_link_up(struct dw_pcie *pci)
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
+		l1subcap = dw_pcie_readl_dbi(pci, cap + PCI_L1SS_CAP);
+	}
+}
+
 static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
 {
 	u32 cap, lnkcap;
@@ -264,6 +284,7 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 	irq_set_chained_handler_and_data(irq, rockchip_pcie_intx_handler,
 					 rockchip);
 
+	rockchip_pcie_disable_l1sub(pci);
 	rockchip_pcie_enable_l0s(pci);
 
 	return 0;
@@ -301,6 +322,7 @@ static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	enum pci_barno bar;
 
+	rockchip_pcie_disable_l1sub(pci);
 	rockchip_pcie_enable_l0s(pci);
 	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
 
-- 
2.51.0


