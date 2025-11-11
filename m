Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82219CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 22:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a80VaGAr/6U4Nhrn8Gt+tgnl4GQ4nOVqFBvaq/YvadA=; b=T8yJomKW58xx/FKUE/B2gcHZ9y
	EpOZwHAgzA2MDrODS01Run8zXAdsQr54IN1pMBOlmzKRTJCiXkCF4Zh6oQIoMSXWBEqsqBhIGEjLZ
	oybpAobRJpajXQbEy8CWgNdhgfOuy31SPQytKqkRS4o9b6g8osERBk3yrK4dhO9WcmSSr5ygh6OQm
	3XvIuE8Ao5iSOjIVSdnw7TUwBTKG8g82TuMpGJzgFwifqqHOjnL8FOxPSZuQc43XIj75WgFm8tYBX
	4DuayjYQbmRD4j+s0MQlijdFwN2OGtWLFQLi9rWmUKzspLWTqgKiC0C1vnWpNpAVfyWn26jXlegu9
	5h9dmHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIwfI-00000007ppM-24G2;
	Tue, 11 Nov 2025 22:16:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIwfE-00000007pme-2mBN;
	Tue, 11 Nov 2025 22:16:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EABD943998;
	Tue, 11 Nov 2025 22:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862D8C16AAE;
	Tue, 11 Nov 2025 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762899395;
	bh=tWgtFDVczwJGDGIoy+OuLVGscnJT3/fUkwwYZbHhyNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lihuqsIQ6lvYr+A5OEmUsIVIOt1oRZ57SAYptaA2Tyn8sLN2VpGGeo7KV7CZW3eFZ
	 Q9F+diyamYV2ozlV5h4/z8+h8tLs526kYd0pqEkNW828INbciF1ROW9sqczxTkfz9u
	 U6OA67BwczHfvaBKmK7Tl/t/mwuQQJkT3D1OvoyQDZoBND06UAp1i/eEi0Z4DE84NO
	 uZn3nAfFEfAQsPy0SRMqu2M4Wy9g8Myb0CV/P+NDF5EJUds9oKs6yZHFkY2b2xL4z2
	 4S96Nt2rxGsFJxmqo3aAWjVjBPYOFOfZ8f0DHbCOouzKLobgPhe5eAZeV3SuMCQwbL
	 e+/pyjb+tlywQ==
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
Subject: [PATCH 2/4] PCI: tegra194: Remove unnecessary L1SS disable code
Date: Tue, 11 Nov 2025 16:16:09 -0600
Message-ID: <20251111221621.2208606-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111221621.2208606-1-helgaas@kernel.org>
References: <20251111221621.2208606-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_141636_745082_236B265C 
X-CRM114-Status: GOOD (  11.57  )
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
 drivers/pci/controller/dwc/pcie-tegra194.c | 32 ----------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 3934757baa30..d5545bf37f81 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -608,24 +608,6 @@ static struct pci_ops tegra_pci_ops = {
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
@@ -729,8 +711,6 @@ static void init_debugfs(struct tegra_pcie_dw *pcie)
 				    aspm_state_cnt);
 }
 #else
-static inline void disable_aspm_l12(struct tegra_pcie_dw *pcie) { return; }
-static inline void disable_aspm_l11(struct tegra_pcie_dw *pcie) { return; }
 static inline void init_host_aspm(struct tegra_pcie_dw *pcie) { return; }
 static inline void init_debugfs(struct tegra_pcie_dw *pcie) { return; }
 #endif
@@ -934,12 +914,6 @@ static int tegra_pcie_dw_host_init(struct dw_pcie_rp *pp)
 
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
@@ -1874,12 +1848,6 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 
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


