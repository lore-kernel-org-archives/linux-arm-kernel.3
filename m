Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F866CCFA08
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBCMZ4BUDDpL3sd2MB4BmbVH43KzHCgZiWv4IjZJMtM=; b=yBFK0CQ5XoDJj3CiKhgZk1YOfl
	vDdbxeghvevz+PiUOBxzjDfl+hr7owmOHrdVQn8A393XEyKYZIbH8yce69zDkSYiFktvgTJOxTK0x
	roEO3G08lOt5Ry101lGlYAiXpACcJ3r50cbDhmCf6qMacNfWcvyx6WvTK0P0if/omq0z6AnhZc8vk
	TGzwND9pwKxzVcHVomz3Q+NXtPjUJ+x32oHD3ijtPFb+WRh32G9G+kelcEEpZWQ9yYvqLLV32FGGN
	bVPweDpclGrcNDTxQqipSl+YDtqVDYnKmrpsl6QTXTjVoNK+VN/rmMMTxpMD8TWWJIouHMGYnr5b1
	sLePXNpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCR-0000000A5NX-1Nq8;
	Mon, 03 Nov 2025 15:10:27 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCO-0000000A5Lm-0en1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:10:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762182621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBCMZ4BUDDpL3sd2MB4BmbVH43KzHCgZiWv4IjZJMtM=;
	b=d2v0JD5rll2csmKUzFG84GFsBBcO0Turmr+J0Te4+Ljgni2YcDL57nmdJ1fJmx72Gmcq9i
	8uMzx5Tbqzc7K3lPEfDyP1astOP3REifW5/wPMEtX01VR0/jeLShWaYmVTGUfmtBaoB9Vq
	yUX/Vt+GMPu0RQbgmEfdK7aA+VAWBw8=
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
To: Manish Chopra <manishc@marvell.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 1/7] bnx2x: convert to use ndo_hwtstamp callbacks
Date: Mon,  3 Nov 2025 15:09:46 +0000
Message-ID: <20251103150952.3538205-2-vadim.fedorenko@linux.dev>
In-Reply-To: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071024_345360_D6600C2C 
X-CRM114-Status: GOOD (  12.02  )
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

The driver implemented SIOCSHWTSTAMP ioctl command only, but at the same
time it has configuration stored in a private structure. Implement both
ndo_hwtstamp_set and ndo_hwtstamp_get callback using stored info.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 .../net/ethernet/broadcom/bnx2x/bnx2x_main.c  | 53 +++++++++++--------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index f0f05d7315ac..289b1f6b42d0 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -308,8 +308,11 @@ static int bnx2x_set_storm_rx_mode(struct bnx2x *bp);
 /****************************************************************************
 * General service functions
 ****************************************************************************/
-
-static int bnx2x_hwtstamp_ioctl(struct bnx2x *bp, struct ifreq *ifr);
+static int bnx2x_hwtstamp_set(struct net_device *dev,
+			      struct kernel_hwtstamp_config *config,
+			      struct netlink_ext_ack *extack);
+static int bnx2x_hwtstamp_get(struct net_device *dev,
+			      struct kernel_hwtstamp_config *config);
 
 static void __storm_memset_dma_mapping(struct bnx2x *bp,
 				       u32 addr, dma_addr_t mapping)
@@ -12813,14 +12816,9 @@ static int bnx2x_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 	if (!netif_running(dev))
 		return -EAGAIN;
 
-	switch (cmd) {
-	case SIOCSHWTSTAMP:
-		return bnx2x_hwtstamp_ioctl(bp, ifr);
-	default:
-		DP(NETIF_MSG_LINK, "ioctl: phy id 0x%x, reg 0x%x, val_in 0x%x\n",
-		   mdio->phy_id, mdio->reg_num, mdio->val_in);
-		return mdio_mii_ioctl(&bp->mdio, mdio, cmd);
-	}
+	DP(NETIF_MSG_LINK, "ioctl: phy id 0x%x, reg 0x%x, val_in 0x%x\n",
+	   mdio->phy_id, mdio->reg_num, mdio->val_in);
+	return mdio_mii_ioctl(&bp->mdio, mdio, cmd);
 }
 
 static int bnx2x_validate_addr(struct net_device *dev)
@@ -13036,6 +13034,8 @@ static const struct net_device_ops bnx2x_netdev_ops = {
 	.ndo_get_phys_port_id	= bnx2x_get_phys_port_id,
 	.ndo_set_vf_link_state	= bnx2x_set_vf_link_state,
 	.ndo_features_check	= bnx2x_features_check,
+	.ndo_hwtstamp_get	= bnx2x_hwtstamp_get,
+	.ndo_hwtstamp_set	= bnx2x_hwtstamp_set,
 };
 
 static int bnx2x_init_dev(struct bnx2x *bp, struct pci_dev *pdev,
@@ -15350,31 +15350,40 @@ int bnx2x_configure_ptp_filters(struct bnx2x *bp)
 	return 0;
 }
 
-static int bnx2x_hwtstamp_ioctl(struct bnx2x *bp, struct ifreq *ifr)
+static int bnx2x_hwtstamp_set(struct net_device *dev,
+			      struct kernel_hwtstamp_config *config,
+			      struct netlink_ext_ack *extack)
 {
-	struct hwtstamp_config config;
+	struct bnx2x *bp = netdev_priv(dev);
 	int rc;
 
-	DP(BNX2X_MSG_PTP, "HWTSTAMP IOCTL called\n");
-
-	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
-		return -EFAULT;
+	DP(BNX2X_MSG_PTP, "HWTSTAMP SET called\n");
 
 	DP(BNX2X_MSG_PTP, "Requested tx_type: %d, requested rx_filters = %d\n",
-	   config.tx_type, config.rx_filter);
+	   config->tx_type, config->rx_filter);
 
 	bp->hwtstamp_ioctl_called = true;
-	bp->tx_type = config.tx_type;
-	bp->rx_filter = config.rx_filter;
+	bp->tx_type = config->tx_type;
+	bp->rx_filter = config->rx_filter;
 
 	rc = bnx2x_configure_ptp_filters(bp);
 	if (rc)
 		return rc;
 
-	config.rx_filter = bp->rx_filter;
+	config->rx_filter = bp->rx_filter;
+
+	return 0;
+}
 
-	return copy_to_user(ifr->ifr_data, &config, sizeof(config)) ?
-		-EFAULT : 0;
+static int bnx2x_hwtstamp_get(struct net_device *dev,
+			      struct kernel_hwtstamp_config *config)
+{
+	struct bnx2x *bp = netdev_priv(dev);
+
+	config->rx_filter = bp->rx_filter;
+	config->tx_type = bp->tx_type;
+
+	return 0;
 }
 
 /* Configures HW for PTP */
-- 
2.47.3


