Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E781CE8D40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+QC+EYDY+L5i93+N9MqrB+wbSBfnqqFhJme+PoyS54=; b=L5PJIxsQPaTSH+bO+AVkRyuyB+
	cCifEef20ulpeKLTOQiOI0Vz9oRMsFVJLCvCZH/9xCix/98LSlkWpmSo94Sp657ZimMM4lX10fPEf
	BxFFJ/XWequV38/+2RMqDPnOEeFg0crkTC2hcyMNcVtppH9om2PqpEYHEnUsWJRnJkHBXjksk/gPb
	keWfxjUyNQ+ak9Ki2uuS8hp/BakfoM5v5fFYhfx778P0dQi4KZTp1rGfivSXg8w+oZtk3lhoVkpFY
	1EcbaonSJbIPpwajEDWvPDigFN6JDNnNc62+oDcZ42wOhnEORUbRJmOra4geQR+VJN/0Ki43682Hz
	Va+pqdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjR-0000000CYq9-0EvN;
	Fri, 14 Nov 2025 15:29:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjP-0000000CYou-1ZdB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=B+QC+EYDY+L5i93+N9MqrB+wbSBfnqqFhJme+PoyS54=; b=IDQbE+vgruHwswbtST9DSP6h2z
	zNq2L5vZ4u6LI2ZTJ0nhLuGO4wltK9eyikpW0J3+U6MEhiW8CMjeJoKJBobNCiCKqyddeAaErQ4OT
	ImjVD0E/+wLax/ILR0tAybptYgyknCejrRU983iTUM6Wp7MkNl5tFkIkWB9hw5ocUgJQccFJsp9Z+
	jCOv2KspbXsrHO47vdMSFiCLT1RvhT7F7st5bDTxL7f3fMtGd5E/jLZdZ38zMi3igKZMs4yv5DA3Z
	JQdGueraOhbde20SAOHgvicrcr5zWIM4z+8hv9BdLGXHakek7T1VTxiK1UjwhTijl3N2iXVUBcxei
	YmD+gecQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJure-00000002pCD-04RS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B+QC+EYDY+L5i93+N9MqrB+wbSBfnqqFhJme+PoyS54=; b=TVzOHbaltwteVhc8t/q4YerACL
	M4gTxnVwG0y4EUFmosGwFT220v3JI/mJ5um/IQYqmnox282+3TdB0FNcSJFz905TlzmbxhLldZ25V
	0cF5yLAnZJoQMrf8NbBY6MfGtNYlWQAFAQvPoa79fAdSkMYuaoa5cdeBBSkvrS2Ju69Q0CieM8rRF
	F7i7OteKHP9gP2L5FPmwqdZUDgcwdyK/sNuUMO04jkTO3DMXXslsdn/P7zE8v7AOSN/JCPrn7JY5M
	s6LMzeFm0Tzn7IHTtbffba7c4aMfOSKERgem+5eL/Q12+NeR7tBCRjY9tKzMrRtAwr22nBv+sfvpT
	Xqzmk7cw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53654 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vJvjB-0000000077L-3OLm;
	Fri, 14 Nov 2025 15:28:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vJvjA-0000000EVjo-2qVn;
	Fri, 14 Nov 2025 15:28:44 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen Wang <unicorn_wang@outlook.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	sophgo@lists.linux.dev
Subject: [PATCH net-next 05/11] net: stmmac: move initialisation of
 multicast_filter_bins to stmmac_plat_dat_alloc()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vJvjA-0000000EVjo-2qVn@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:28:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_143326_188093_29D19BC2 
X-CRM114-Status: GOOD (  12.47  )
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

Move the default initialisation of plat_dat->multicast_filter_bins to
HASH_TABLE_SIZE to stmmac_plat_dat_alloc(). This means platform glue
only needs to override this if different.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 6 ------
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c      | 6 ------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ---
 5 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index cf69e659c415..a4ef3ec070e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -570,9 +570,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 
 	plat->mdio_bus_data->needs_reset = true;
 
-	/* Set default value for multicast hash bins */
-	plat->multicast_filter_bins = HASH_TABLE_SIZE;
-
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
@@ -703,9 +700,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 	plat->ptp_clk_freq_config = intel_mgbe_ptp_clk_freq_config;
 
-	/* Set default value for multicast hash bins */
-	plat->multicast_filter_bins = HASH_TABLE_SIZE;
-
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 89232c788c61..cfdda9e82a19 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -95,7 +95,7 @@ static void loongson_default_data(struct pci_dev *pdev,
 	plat->core_type = DWMAC_CORE_GMAC;
 	plat->force_sf_dma_mode = 1;
 
-	/* Set default value for multicast hash bins */
+	/* Increase the default value for multicast hash bins */
 	plat->multicast_filter_bins = 256;
 
 	/* Set default value for unicast filter entries */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0763ed06715e..a7393a3e792f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7567,10 +7567,12 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 	 * - phy autodetection
 	 * - determine GMII_Address CR field from CSR clock
 	 * - allow MTU up to JUMBO_LEN
+	 * - hash table size
 	 */
 	plat_dat->phy_addr = -1;
 	plat_dat->clk_csr = -1;
 	plat_dat->maxmtu = JUMBO_LEN;
+	plat_dat->multicast_filter_bins = HASH_TABLE_SIZE;
 
 	return plat_dat;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index b0b4358e0adf..0c65b24480ae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -28,9 +28,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 
 	plat->mdio_bus_data->needs_reset = true;
 
-	/* Set default value for multicast hash bins */
-	plat->multicast_filter_bins = HASH_TABLE_SIZE;
-
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
@@ -78,9 +75,6 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 	plat->flags |= STMMAC_FLAG_TSO_EN;
 	plat->pmt = 1;
 
-	/* Set default value for multicast hash bins */
-	plat->multicast_filter_bins = HASH_TABLE_SIZE;
-
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 81a599475577..9982aaa19519 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -508,9 +508,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->flags |= STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
 	}
 
-	/* Set default value for multicast hash bins */
-	plat->multicast_filter_bins = HASH_TABLE_SIZE;
-
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
-- 
2.47.3


