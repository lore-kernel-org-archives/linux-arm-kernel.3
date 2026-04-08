Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CCF105D995
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/uumbg2htkDWqchC9pV2fd0IznYJi1xURkP8jIplg8=; b=wtRkrkXjHEROQinnimO5w82Y8n
	qSxLDfu/7VEwv7AfXCpKVn34LwmSA1Pf+GqfcGcEO3LQ4AeeWnPEAddBo9uG0MCacwHjiIXJu+69J
	kalfj5ZbTU31Sp6Ah7DKSU49eSNOmDHbeMFx0jih0RGYOMscTWKeUvObv9eEmnL3iGTg/g6jnIpO2
	yqH3rfvYuR1MiL91z/KrIBsPCGddfjXKsZj26XYoH4ak0OxplemjZm+ecxicdcVCHe5s7FcOdf5XC
	FaKgQDaRVQsdJxi66LtclbHK1i6y0ilQ3Tykh7wV0swXJJfWC+uCf6WOZq3slj0IlrOJb5ts61KPE
	XYjbntqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPCJ-00000008bkX-2tef;
	Wed, 08 Apr 2026 09:27:43 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPCG-00000008bhp-3y4T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l/uumbg2htkDWqchC9pV2fd0IznYJi1xURkP8jIplg8=; b=jkT/iqKfYIAcIwAFGl/L7H7e6J
	Atf5/PlrZ4RMNWrgxaX55XnQWRSxSXCT8qBn5QJ4rZxCgNItXhv99FcCqP9m+JmJehLxCurQEP9Sz
	CqPwq4nD9s5T82umqqPCpwQqEiPyM542xxg2CoaeTEDSGIIWr9nOKsK8GFgLzRWDwJ+ikwkNTPr0t
	fq5GaLj4BpKC7CDpuc4SJL+LFUc/pjSMkrTtGbCwUlWiXt1574bSCaQYEmJ94xjQI8MwKOOH3yT5v
	luj8YljJ1ihZMOBNcEaVZkKAKHxafFNqc7e5MOwVVNQxEV4Wk1O+dyAwwsQcj8JBQz42nFTS6jab3
	hMDQng9Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33376 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1wAPBn-0000000023T-42Wy;
	Wed, 08 Apr 2026 10:27:12 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1wAPBg-0000000F7kA-3HFF;
	Wed, 08 Apr 2026 10:27:04 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH RFC net-next 05/10] net: stmmac: rename confusing synopsys_id
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1wAPBg-0000000F7kA-3HFF@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:27:04 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_022741_199711_8AAD9CAD 
X-CRM114-Status: GOOD (  21.62  )
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

priv->synopsys_id is the Synopsys IP version, defined by snpsver in
the databook. This is made up of the major version in bits 7:4 and
the first digit of the minor version in bits 3:0. Change the type
for synopsys_id to be a u8 and rename to snpsver.

For reference, the values for snpsver:

GMAC100 cores do not have a readable snpsver number.

GMAC cores generally have a snpsver number less than 0x40.

GMAC4 cores may have a version number that overlaps GMAC cores
(see first entry for DWMAC_CORE_GMAC4).

XGMAC and XLGMAC cores each have an entirely separate IP version
number space from GMAC and GMAC4, which are distinguished by their
respective userver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c           | 10 +++++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac.h         |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 12 ++++++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c    |  8 ++++----
 8 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index eb14c197d6ae..789b384a2838 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -326,7 +326,7 @@ static int loongson_dwmac_setup(void *apriv, struct mac_device_info *mac)
 	 * original value so the correct HW-interface would be selected.
 	 */
 	if (ld->multichan) {
-		priv->synopsys_id = DWMAC_CORE_3_70;
+		priv->snpsver = DWMAC_CORE_3_70;
 		*dma = dwmac1000_dma_ops;
 		dma->init_chan = loongson_dwmac_dma_init_channel;
 		dma->dma_interrupt = loongson_dwmac_dma_interrupt;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..4bff7592c652 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1069,7 +1069,7 @@ static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 	mac->unicast_filter_entries = 8;
 
 	/* Synopsys Id is not available */
-	priv->synopsys_id = 0;
+	priv->snpsver = 0;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 03437f1cf3df..635d711a554e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -380,7 +380,7 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->vlhash = (hw_cap & XGMAC_HWFEAT_VLHASH) >> 4;
 	dma_cap->half_duplex = (hw_cap & XGMAC_HWFEAT_HDSEL) >> 3;
 	dma_cap->mbps_1000 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;
-	if (dma_cap->mbps_1000 && priv->synopsys_id >= DWXGMAC_CORE_2_20)
+	if (dma_cap->mbps_1000 && priv->snpsver >= DWXGMAC_CORE_2_20)
 		dma_cap->mbps_10_100 = 1;
 
 	/* MAC HW feature 1 */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 7f95a2a5be4c..e5629afc391f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -72,7 +72,7 @@ static int stmmac_dwmac1_quirks(struct stmmac_priv *priv)
 		dev_info(priv->device, "Enhanced/Alternate descriptors\n");
 
 		/* GMAC older than 3.50 has no extended descriptors */
-		if (priv->synopsys_id >= DWMAC_CORE_3_50) {
+		if (priv->snpsver >= DWMAC_CORE_3_50) {
 			dev_info(priv->device, "Enabled extended descriptors\n");
 			priv->extend_desc = true;
 		} else {
@@ -299,7 +299,7 @@ stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 userver)
 
 		if (core_type != entry->core_type)
 			continue;
-		/* Use synopsys_id var because some setups can override this */
+		/* Use snpsver var because some setups can override this */
 		if (snpsver < entry->min_snpsver)
 			continue;
 		if (core_type == DWMAC_CORE_XGMAC &&
@@ -324,7 +324,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	stmmac_get_version(priv, &version);
 
 	/* Save ID for later use */
-	priv->synopsys_id = version.snpsver;
+	priv->snpsver = version.snpsver;
 
 	/* Lets assume some safe values first */
 	if (core_type == DWMAC_CORE_GMAC4) {
@@ -355,8 +355,8 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 
 	/* Fallback to generic HW */
 
-	/* Use synopsys_id var because some setups can override this */
-	entry = stmmac_hwif_find(core_type, priv->synopsys_id, version.userver);
+	/* Use snpsver var because some setups can override this */
+	entry = stmmac_hwif_find(core_type, priv->snpsver, version.userver);
 	if (!entry) {
 		dev_err(priv->device,
 			"Failed to find HW IF (id=0x%x, gmac=%d/%d)\n",
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 8ba8f03e1ce0..9a5d9c404e4f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -304,7 +304,7 @@ struct stmmac_priv {
 	struct dma_features dma_cap;
 	struct stmmac_counters mmc;
 	int hw_cap_support;
-	int synopsys_id;
+	u8 snpsver;
 	u32 msg_enable;
 	/* Our MAC Wake-on-Lan options */
 	int wolopts;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 92585d27ab88..343cf903c0bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -553,7 +553,7 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 				priv->xstats.phy_eee_wakeup_error_n = val;
 		}
 
-		if (priv->synopsys_id >= DWMAC_CORE_3_50)
+		if (priv->snpsver >= DWMAC_CORE_3_50)
 			stmmac_mac_debug(priv, priv->ioaddr,
 					(void *)&priv->xstats,
 					rx_queues_count, tx_queues_count);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 01a983001ab4..295d31d7b28b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -755,7 +755,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 			config->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
 			ptp_v2 = PTP_TCR_TSVER2ENA;
 			snap_type_sel = PTP_TCR_SNAPTYPSEL_1;
-			if (priv->synopsys_id < DWMAC_CORE_4_10)
+			if (priv->snpsver < DWMAC_CORE_4_10)
 				ts_event_en = PTP_TCR_TSEVNTENA;
 			ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
 			ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;
@@ -6624,7 +6624,7 @@ static int stmmac_dma_cap_show(struct seq_file *seq, void *v)
 	seq_printf(seq, "\tAV features: %s\n", (priv->dma_cap.av) ? "Y" : "N");
 	seq_printf(seq, "\tChecksum Offload in TX: %s\n",
 		   (priv->dma_cap.tx_coe) ? "Y" : "N");
-	if (priv->synopsys_id >= DWMAC_CORE_4_00 ||
+	if (priv->snpsver >= DWMAC_CORE_4_00 ||
 	    priv->plat->core_type == DWMAC_CORE_XGMAC) {
 		seq_printf(seq, "\tIP Checksum Offload in RX: %s\n",
 			   (priv->dma_cap.rx_coe) ? "Y" : "N");
@@ -7454,7 +7454,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (priv->plat->rx_coe) {
 		priv->hw->rx_csum = priv->plat->rx_coe;
 		dev_info(priv->device, "RX Checksum Offload Engine supported\n");
-		if (priv->synopsys_id < DWMAC_CORE_4_00)
+		if (priv->snpsver < DWMAC_CORE_4_00)
 			dev_info(priv->device, "COE Type %d\n", priv->hw->rx_csum);
 	}
 	if (priv->plat->tx_coe)
@@ -7520,7 +7520,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	 * has to be disable and this can be done by passing the
 	 * riwt_off field from the platform.
 	 */
-	if ((priv->synopsys_id >= DWMAC_CORE_3_50 ||
+	if ((priv->snpsver >= DWMAC_CORE_3_50 ||
 	     priv->plat->core_type == DWMAC_CORE_XGMAC) &&
 	    !priv->plat->riwt_off) {
 		priv->use_riwt = 1;
@@ -7897,7 +7897,7 @@ static int __stmmac_dvr_probe(struct device *device,
 
 	/* Only DWMAC core version 5.20 onwards supports HW descriptor prefetch.
 	 */
-	if (priv->synopsys_id < DWMAC_CORE_5_20)
+	if (priv->snpsver < DWMAC_CORE_5_20)
 		priv->plat->dma_cfg->dche = false;
 
 	stmmac_check_ether_addr(priv);
@@ -7997,7 +7997,7 @@ static int __stmmac_dvr_probe(struct device *device,
 
 	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
 		ndev->max_mtu = XGMAC_JUMBO_LEN;
-	else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
+	else if (priv->plat->enh_desc || priv->snpsver >= DWMAC_CORE_4_00)
 		ndev->max_mtu = JUMBO_LEN;
 	else
 		ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index afe98ff5bdcb..0107119f68d2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -74,7 +74,7 @@ static void stmmac_xgmac2_c22_format(struct stmmac_priv *priv, int phyaddr,
 {
 	u32 tmp = 0;
 
-	if (priv->synopsys_id < DWXGMAC_CORE_2_20) {
+	if (priv->snpsver < DWXGMAC_CORE_2_20) {
 		/* Until ver 2.20 XGMAC does not support C22 addr >= 4. Those
 		 * bits above bit 3 of XGMAC_MDIO_C22P register are reserved.
 		 */
@@ -136,7 +136,7 @@ static int stmmac_xgmac2_mdio_read_c22(struct mii_bus *bus, int phyaddr,
 	u32 addr;
 
 	/* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
-	if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
+	if (priv->snpsver < DWXGMAC_CORE_2_20 &&
 	    phyaddr > MII_XGMAC_MAX_C22ADDR)
 		return -ENODEV;
 
@@ -199,7 +199,7 @@ static int stmmac_xgmac2_mdio_write_c22(struct mii_bus *bus, int phyaddr,
 	u32 addr;
 
 	/* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
-	if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
+	if (priv->snpsver < DWXGMAC_CORE_2_20 &&
 	    phyaddr > MII_XGMAC_MAX_C22ADDR)
 		return -ENODEV;
 
@@ -625,7 +625,7 @@ int stmmac_mdio_register(struct net_device *ndev)
 		new_bus->read_c45 = &stmmac_xgmac2_mdio_read_c45;
 		new_bus->write_c45 = &stmmac_xgmac2_mdio_write_c45;
 
-		if (priv->synopsys_id < DWXGMAC_CORE_2_20) {
+		if (priv->snpsver < DWXGMAC_CORE_2_20) {
 			/* Right now only C22 phys are supported */
 			max_addr = MII_XGMAC_MAX_C22ADDR;
 
-- 
2.47.3


