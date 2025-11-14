Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AF9CE8D40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Zo0wqdJY+ScSIlzBR4O8yuxNiqj6xUhwLDvxRVLdrw=; b=2r5Fj3mG1D2D1AK0XEj05q72eU
	cjKSZZ4Tt3936vfPuvE9bA9OXZcMvnp60xda28DCbxruN125zFqD4Eg2cbjydnUggyqqwSqYrt9X6
	hkexRrERl/mrCros07buo5NnX0243mJtnJOUi+HxQ2Ub2SoA0/iCBeIHhct7yaQ9VQcg6+iKB+iqU
	fsAfdyhwY7dTIg7ATnBp1+qo6gU8BO5aBMa3jxs+Z0qbTjcbSwAkFrqlR5ENI3MKH4Fll5JFkfp1i
	+c3kk3Sq9QSoTWNMGLJQjKUG5Ek+rQblfLaSovz9XIndd30MQnVIRWpZQ+9d4M3xQ+Lv0O2VZOZz9
	x+9YuIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjI-0000000CYl2-1tre;
	Fri, 14 Nov 2025 15:28:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjG-0000000CYjW-0hYp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=3Zo0wqdJY+ScSIlzBR4O8yuxNiqj6xUhwLDvxRVLdrw=; b=MN4qC+D0EP1ihKR14CmIOFHcQJ
	tbOA96bh7xdL+bj+AgoPHp4SzmiyfByu4ctf1tEXND9CLRLTkNF7+cEDJ+C8C79qM0Zaa2saujdu9
	vSNcCR+LqT7pzJKE/iRJ31TPN1kAjza2UUFcrX3b16Ox7ReVmZ6Vp0Wa8JkSMcApC223f7bjcSFWD
	XVaP35lOIummgDGOXR5xsHzJLIFKYKm9fZk3a1DFt0tv0U9R2A3ii0LTEsqR0ORUDMnp6wyxbXUY0
	Ov31VI8KlTK69qeWzIPke+S2ERKaZbFAOFr25vu1zn+gHe9Hdg7R9LeUwh9mh2cZ30AwQXIBXkQoH
	IhOFTLKg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJurY-00000002pAm-2a1L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3Zo0wqdJY+ScSIlzBR4O8yuxNiqj6xUhwLDvxRVLdrw=; b=u2yNHz/qzn4LhQd8rJ6TAvhvYO
	C3xkFHyhsr0YIkRgxv2zhseETImIIQXSrekl7UQzTt3p94dWp+gkeIFTjSwAAiLOSuQgYfSSXtpuS
	rHNSo00AsJYWs6kcQVGtb1jx5hZqoguM9l1ZUfTH65CHoEmU/fGAjOiaEk10koWrFCdo9Z2TgcF2F
	bSyOxaTRxUqikMvOuSmQrWmMbQ3ct6/XLr1Uh8208tIdos1ifjWOpWavxUVcS2KcnBzVmN1mtjQyy
	Em8uwtFHoWLB7fz1BmAwqAaMv2o6cxMpSpnU2W7nq9UBze5BRPWBaRdVHW5pZahICNUVhOwDqjMDQ
	4vBAB2SA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53644 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vJvj7-0000000076v-0LYC;
	Fri, 14 Nov 2025 15:28:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vJvj5-0000000EVji-2EYA;
	Fri, 14 Nov 2025 15:28:39 +0000
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
Subject: [PATCH net-next 04/11] net: stmmac: move initialisation of maxmtu to
 stmmac_plat_dat_alloc()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vJvj5-0000000EVji-2EYA@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:28:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_143320_792264_D71C0B87 
X-CRM114-Status: GOOD (  14.07  )
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

Move the default initialisation of plat_dat->maxmtu to JUMBO_LEN to
stmmac_plat_dat_alloc().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 6 ------
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  | 3 ---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c      | 6 ------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 -----
 5 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 7e56fbc3e141..cf69e659c415 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -576,9 +576,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
-	/* Set the maxmtu to a default of JUMBO_LEN */
-	plat->maxmtu = JUMBO_LEN;
-
 	/* Set default number of RX and TX queues to use */
 	plat->tx_queues_to_use = 1;
 	plat->rx_queues_to_use = 1;
@@ -712,9 +709,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
-	/* Set the maxmtu to a default of JUMBO_LEN */
-	plat->maxmtu = JUMBO_LEN;
-
 	plat->flags |= STMMAC_FLAG_VLAN_FAIL_Q_EN;
 
 	/* Use the last Rx queue */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 8593411844bc..89232c788c61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -101,9 +101,6 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
-	/* Set the maxmtu to a default of JUMBO_LEN */
-	plat->maxmtu = JUMBO_LEN;
-
 	/* Disable Priority config by default */
 	plat->tx_queues_cfg[0].use_prio = false;
 	plat->rx_queues_cfg[0].use_prio = false;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a36e8a90fcaa..0763ed06715e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7566,9 +7566,11 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 	/* Set the defaults:
 	 * - phy autodetection
 	 * - determine GMII_Address CR field from CSR clock
+	 * - allow MTU up to JUMBO_LEN
 	 */
 	plat_dat->phy_addr = -1;
 	plat_dat->clk_csr = -1;
+	plat_dat->maxmtu = JUMBO_LEN;
 
 	return plat_dat;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index b981a9dd511d..b0b4358e0adf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -34,9 +34,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
-	/* Set the maxmtu to a default of JUMBO_LEN */
-	plat->maxmtu = JUMBO_LEN;
-
 	/* Set default number of RX and TX queues to use */
 	plat->tx_queues_to_use = 1;
 	plat->rx_queues_to_use = 1;
@@ -87,9 +84,6 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
-	/* Set the maxmtu to a default of JUMBO_LEN */
-	plat->maxmtu = JUMBO_LEN;
-
 	/* Set default number of RX and TX queues to use */
 	plat->tx_queues_to_use = 4;
 	plat->rx_queues_to_use = 4;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index fe3d95274fd6..81a599475577 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -508,11 +508,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->flags |= STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
 	}
 
-	/* Set the maxmtu to a default of JUMBO_LEN in case the
-	 * parameter is not present in the device tree.
-	 */
-	plat->maxmtu = JUMBO_LEN;
-
 	/* Set default value for multicast hash bins */
 	plat->multicast_filter_bins = HASH_TABLE_SIZE;
 
-- 
2.47.3


