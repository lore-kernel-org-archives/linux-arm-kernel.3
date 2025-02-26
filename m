Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA43EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJc/4lpDdjdzt4vnCII5ZxhVCUBOXuCUR/VWVGFhL5Y=; b=Y5YMsYu2HSx+9fBaSS8AzRosIg
	fTNSzYikIbpuFExC3cy0XM93jiWRu9Uee5Cl+8WxJ0UVXLD4k4LXZAXqsk95tCrHNLmjvlL24J24o
	DsujOpkmG2pc2VVPSC37Rv7bv327wrlwttPKlCgVULJCG0Ld00pg6tIrcr03kOJEspJ4YRNlQvhSf
	ppdpZUJeGpAlr0mNiOsZCGx1V9jznDGt51eD/2LyaHaEoK2yrai7iWEVrO7BjxkObSXltAlMNMLs4
	9NQd/+XmVDCOuvgb4a8ueqz4zlFQJaTgl53MoLQQYw/BE6oYCao/7qLV3Q52Dg7nX+TQGWWlJ6PcP
	jYJQgFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCOX-00000002nq1-0yoe;
	Wed, 26 Feb 2025 08:03:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCBv-00000002kGK-2qLq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Feb 2025 07:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rJc/4lpDdjdzt4vnCII5ZxhVCUBOXuCUR/VWVGFhL5Y=; b=PI2XU2YTe96gZyG9IinVU+ic/I
	2lqoDX3CGgLPLaHgvgZLE2YDhQFPAhBwZjd7iXQnF2IeSPUCPkIGqtMPb3ziuAoShDfyNod7dKcQD
	K4R3fCRVhRQCYphPRPxZZe+HPZDTKKN+2gaGa0Gm+R0Kd24YEd2YyGHom92rpNhoHnuEhYluWP7q4
	I/p37UcvhApnNGvS5kErYNGol6L7e7HkPV+al2ELJW3hxUSoxHPXuNCQkoNEzUcs1b20WIIIxlILH
	Vm1D8rUtQdERz3gL7EeQKTLCHuBQB87f7MUquB1Gozof6idi1oozHJE6G1LOJkTebA6+RvXBBe4Ul
	AswAOqNQ==;
Received: from mgamail.intel.com ([192.198.163.12])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCBs-00000003Y5F-1WF3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 07:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740556248; x=1772092248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cmKtuwnc2KIDaRI+wvWtnzBRpft8byHlKWXn0enjH2M=;
  b=XE8HVoksAJbQzfh1P9UTAXe+8GwAoidBD0PGJgarvoDzPLQ0+jdPA6hd
   iD9zQ2fC6jxvWSV39vOvw6IWxIQUQSMBblg9V2uxCSEjSRvjXVmLjGeRy
   hAZlALYGWHx8ym/Eo4iokIojYjGfWL/Umm6P5jls66brZOqRUYDuYibfa
   dDfKcsSNUvYKc/XBtxxddOIhVcVzl7oDYg5KPvZcBnMnBnRDvHoiTu4fZ
   /L53K9+/oCurTMZUPsiBCOdclxZVhKy2ErmCYGy7z5yTlz5bgWxlA56I/
   QIwdRZcRqD7E3mVVPxVbSsFR8Tmw/Dy7wIbirOUZtY9DSR7Riun9At9aJ
   Q==;
X-CSE-ConnectionGUID: psHYzGUHSWe59jtGoKcPGw==
X-CSE-MsgGUID: F5dNUDspQFGN7Xej5jjlvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45305242"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="45305242"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:50:46 -0800
X-CSE-ConnectionGUID: fM5vSBR0ToyfuZ21hlmvgA==
X-CSE-MsgGUID: 7VkCjDaiTceTPs/wK8065A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120743067"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2025 23:50:39 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Simon Horman <horms@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	David E Box <david.e.box@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v8 6/6] stmmac: intel: interface switching support for ADL-N platform
Date: Wed, 26 Feb 2025 15:48:37 +0800
Message-Id: <20250226074837.1679988-7-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_075049_102241_3D1294B2 
X-CRM114-Status: GOOD (  13.29  )
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

The intel_config_serdes function was provided to handle interface mode
changes for the ADL-N platform.

The Modphy register lane was provided to configure the serdes when
changing interface modes.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 52 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index f73a48f98581..9c8de47ee149 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -87,6 +87,7 @@ static const struct pmc_serdes_regs pid_modphy1_2p5g_regs[] = {
 };
 
 static const int ehl_tsn_lane_regs[] = {7, 8, 9, 10, 11};
+static const int adln_tsn_lane_regs[] = {6};
 
 static int stmmac_pci_find_phy_addr(struct pci_dev *pdev,
 				    const struct dmi_system_id *dmi_list)
@@ -1004,6 +1005,55 @@ static int adls_sgmii_phy1_data(struct pci_dev *pdev,
 static struct stmmac_pci_info adls_sgmii1g_phy1_info = {
 	.setup = adls_sgmii_phy1_data,
 };
+
+static int adln_common_data(struct pci_dev *pdev,
+			    struct plat_stmmacenet_data *plat)
+{
+	struct intel_priv_data *intel_priv = plat->bsp_priv;
+
+	plat->rx_queues_to_use = 6;
+	plat->tx_queues_to_use = 4;
+	plat->clk_ptp_rate = 204800000;
+
+	plat->safety_feat_cfg->tsoee = 1;
+	plat->safety_feat_cfg->mrxpee = 0;
+	plat->safety_feat_cfg->mestee = 1;
+	plat->safety_feat_cfg->mrxee = 1;
+	plat->safety_feat_cfg->mtxee = 1;
+	plat->safety_feat_cfg->epsi = 0;
+	plat->safety_feat_cfg->edpp = 0;
+	plat->safety_feat_cfg->prtyen = 0;
+	plat->safety_feat_cfg->tmouten = 0;
+
+	intel_priv->tsn_lane_regs = adln_tsn_lane_regs;
+	intel_priv->max_tsn_lane_regs = ARRAY_SIZE(adln_tsn_lane_regs);
+
+	return intel_mgbe_common_data(pdev, plat);
+}
+
+static int adln_sgmii_phy0_data(struct pci_dev *pdev,
+				struct plat_stmmacenet_data *plat)
+{
+	struct intel_priv_data *intel_priv = plat->bsp_priv;
+
+	plat->bus_id = 1;
+	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
+	plat->serdes_powerup = intel_serdes_powerup;
+	plat->serdes_powerdown = intel_serdes_powerdown;
+	plat->mac_finish = intel_mac_finish;
+
+	intel_priv->pid_1g.regs = pid_modphy1_1g_regs;
+	intel_priv->pid_1g.num_regs = ARRAY_SIZE(pid_modphy1_1g_regs);
+	intel_priv->pid_2p5g.regs = pid_modphy1_2p5g_regs;
+	intel_priv->pid_2p5g.num_regs = ARRAY_SIZE(pid_modphy1_2p5g_regs);
+
+	return adln_common_data(pdev, plat);
+}
+
+static struct stmmac_pci_info adln_sgmii1g_phy0_info = {
+	.setup = adln_sgmii_phy0_data,
+};
+
 static const struct stmmac_pci_func_data galileo_stmmac_func_data[] = {
 	{
 		.func = 6,
@@ -1386,7 +1436,7 @@ static const struct pci_device_id intel_eth_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, TGLH_SGMII1G_1, &tgl_sgmii1g_phy1_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_0, &adls_sgmii1g_phy0_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_1, &adls_sgmii1g_phy1_info) },
-	{ PCI_DEVICE_DATA(INTEL, ADLN_SGMII1G, &tgl_sgmii1g_phy0_info) },
+	{ PCI_DEVICE_DATA(INTEL, ADLN_SGMII1G, &adln_sgmii1g_phy0_info) },
 	{ PCI_DEVICE_DATA(INTEL, RPLP_SGMII1G, &tgl_sgmii1g_phy0_info) },
 	{}
 };
-- 
2.34.1


