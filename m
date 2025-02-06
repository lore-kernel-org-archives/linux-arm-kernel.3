Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986BAC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6RSHWNBlbGUoA2+VrPfKSlyxhym0VjDGfDYWad7Gag=; b=Cyv/xyZ8Pbe7tm8VH11gBGcRUi
	skCvyEhPeA/zJwDMfXZ+turFlkRh9rVZ/pxqSb5EfK7SkMqBSDxGtbpyM2dLW2COCZSHq1OWFxdLM
	7qp4S01sVYK7owTWoW3YAafSOFEDoQ4AWkjBUo89LrYGrB8Cyd6iqMYGG08Vtd2/Ikhyal3SDwvSr
	j30BvfHB5zFqOanbJRkp4+PYHR/ZvvRWp4jABPxyyUlKonH9casVlE+ZY/qYjcNxPOPlZsPEh1iKK
	pT9B3kqSRFrVp6L+mPUSb12yyAwCtQH6D8+zXljU9q7BcRy8utalBqrhQiCeQjdZ0rlfVZzd+Ngnk
	qKkFpIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg392-00000006dOk-12cr;
	Thu, 06 Feb 2025 14:46:20 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1oP-00000006Omz-2SFD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738848057; x=1770384057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hT7NSA/l3aMroGSu2cyNt3ynK/yQYq7ZddlADf7SbYA=;
  b=PG6WFubLbHGjHdOs6pO7KLwrNnIbFVEzp/HTgBKk1ubFD6yJo3QKWkdb
   /nG5+BFXB0uZ6t/VLyC2Egkaa+6D/C7np7pB+Eqyx7yQjCGmvK+klW5ND
   y8v+kBtDzl1pu0OkEhpz6+v7WK7K7MQMKc+lBA0uih3noAvAEDaUXpMB6
   CSUDphMkCCNoRYQaW5/a1XNPCmSNajdFuCdeLc6wVkXt//x6h09/Z0QC4
   6nVRm2wHBv16Yxa+OwZprWv/0DZLoJi75S1fuxXCHlAf9a/9J6hvbnL6G
   pP4U+XSYgDZPEfjIVcxPZ16zPjiEZCaf4weGX9F/+UyxG7hlHuTiWw0I1
   Q==;
X-CSE-ConnectionGUID: UBV8+4sSRQiNvrwBdKOk7g==
X-CSE-MsgGUID: J5KAWIOCTP+rMdBDJ3vqVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43203843"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43203843"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 05:20:56 -0800
X-CSE-ConnectionGUID: T5NWu9vAQ0KYrL99V3+rdQ==
X-CSE-MsgGUID: xtK+/EDIRn2oxDpWwSO5YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116397387"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 05:20:49 -0800
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
Subject: [PATCH net-next v7 7/7] stmmac: intel: interface switching support for ADL-N platform
Date: Thu,  6 Feb 2025 21:18:59 +0800
Message-Id: <20250206131859.2960543-8-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_052057_678057_C61E30D7 
X-CRM114-Status: GOOD (  13.21  )
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
index e7f5d023eaf2..4958b9a32879 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -87,6 +87,7 @@ static const struct pmc_serdes_regs pid_modphy1_2p5g_regs[] = {
 };
 
 static const int ehl_tsn_lane_regs[] = {7, 8, 9, 10, 11};
+static const int adln_tsn_lane_regs[] = {6};
 
 static int stmmac_pci_find_phy_addr(struct pci_dev *pdev,
 				    const struct dmi_system_id *dmi_list)
@@ -1006,6 +1007,55 @@ static int adls_sgmii_phy1_data(struct pci_dev *pdev,
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
@@ -1388,7 +1438,7 @@ static const struct pci_device_id intel_eth_pci_id_table[] = {
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


