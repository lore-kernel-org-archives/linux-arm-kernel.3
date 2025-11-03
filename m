Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F160CCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx/KcmsxnkeJdah6VzbpslQn+yn8sGVTxrIik7Svxh8=; b=iWTcrTpG5RsmYZb3eY8eMoroaM
	fWOkpbKofC+eiGFmVvK/ZpZ4ZanSs7Ezh3INk/KpzHO193CI9FnxboDYQGmgyRBq9UG09VPCBxfJJ
	r+F02g3lD0Ny5oK8ramZtK6znyLAvrdFBWPxdtMlQdNuFRWqeEJ881GlLR0ZP0Sw7aC5fCwMvQeW7
	A7EGgDY+ESSVOU/1Qv+qCBF9/q2jGaIXcdKu+udpmfMImZfmHQGoMXlov0Bmg+1eV8Ui7kRFGJG0/
	GY6IfBAwPlNT8Ak7cOlG0WBJCbjTFXE2L3+1+Vj5vCVDg9/j4DPcL1L8uOae6+G9H78kWoZvFVvb/
	qez3/GiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCu-0000000A5fG-1j9M;
	Mon, 03 Nov 2025 15:10:56 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCs-0000000A5d1-1VRR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:10:55 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762182651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dx/KcmsxnkeJdah6VzbpslQn+yn8sGVTxrIik7Svxh8=;
	b=KvjPemyTeFZ8KsGw3ZC+R+Z78OPcNZTK5lIexGgGLgGG+VbzE4zoAipebCEpP5zU1bypc6
	IwixgZ6smWehGWrypRp06JPQ+VJGqMO9JVPS1M6qQM0R1g5JVxuWR8Iz01PSIZgEx57j5/
	HDHuV9B5T1sNBKbjntNIkdJq5o0MOws=
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
Subject: [PATCH net-next v2 6/7] net: pch_gbe: convert to use ndo_hwtstamp callbacks
Date: Mon,  3 Nov 2025 15:09:51 +0000
Message-ID: <20251103150952.3538205-7-vadim.fedorenko@linux.dev>
In-Reply-To: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071054_695442_49AF0766 
X-CRM114-Status: GOOD (  13.57  )
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

The driver implemented SIOCSHWTSTAMP ioctl command only, but it stores
configuration in the private data, so it is possible to report it back
to users. Implement both ndo_hwtstamp_set and ndo_hwtstamp_get
callbacks. To properly report RX filter type, store it in hwts_rx_en
instead of using this field as a simple flag. The logic didn't change
because receive path used this field as boolean flag.

Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 .../ethernet/oki-semi/pch_gbe/pch_gbe_main.c  | 38 +++++++++++--------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index e5a6f59af0b6..62f05f4569b1 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -198,23 +198,21 @@ pch_tx_timestamp(struct pch_gbe_adapter *adapter, struct sk_buff *skb)
 	pch_ch_event_write(pdev, TX_SNAPSHOT_LOCKED);
 }
 
-static int hwtstamp_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
+static int pch_gbe_hwtstamp_set(struct net_device *netdev,
+				struct kernel_hwtstamp_config *cfg,
+				struct netlink_ext_ack *extack)
 {
-	struct hwtstamp_config cfg;
 	struct pch_gbe_adapter *adapter = netdev_priv(netdev);
 	struct pci_dev *pdev;
 	u8 station[20];
 
-	if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
-		return -EFAULT;
-
 	/* Get ieee1588's dev information */
 	pdev = adapter->ptp_pdev;
 
-	if (cfg.tx_type != HWTSTAMP_TX_OFF && cfg.tx_type != HWTSTAMP_TX_ON)
+	if (cfg->tx_type != HWTSTAMP_TX_OFF && cfg->tx_type != HWTSTAMP_TX_ON)
 		return -ERANGE;
 
-	switch (cfg.rx_filter) {
+	switch (cfg->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		adapter->hwts_rx_en = 0;
 		break;
@@ -223,17 +221,17 @@ static int hwtstamp_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
 		pch_ch_control_write(pdev, SLAVE_MODE | CAP_MODE0);
 		break;
 	case HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ:
-		adapter->hwts_rx_en = 1;
+		adapter->hwts_rx_en = cfg->rx_filter;
 		pch_ch_control_write(pdev, MASTER_MODE | CAP_MODE0);
 		break;
 	case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
-		adapter->hwts_rx_en = 1;
+		adapter->hwts_rx_en = cfg->rx_filter;
 		pch_ch_control_write(pdev, V2_MODE | CAP_MODE2);
 		strcpy(station, PTP_L4_MULTICAST_SA);
 		pch_set_station_address(station, pdev);
 		break;
 	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
-		adapter->hwts_rx_en = 1;
+		adapter->hwts_rx_en = cfg->rx_filter;
 		pch_ch_control_write(pdev, V2_MODE | CAP_MODE2);
 		strcpy(station, PTP_L2_MULTICAST_SA);
 		pch_set_station_address(station, pdev);
@@ -242,12 +240,23 @@ static int hwtstamp_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
 		return -ERANGE;
 	}
 
-	adapter->hwts_tx_en = cfg.tx_type == HWTSTAMP_TX_ON;
+	adapter->hwts_tx_en = cfg->tx_type == HWTSTAMP_TX_ON;
 
 	/* Clear out any old time stamps. */
 	pch_ch_event_write(pdev, TX_SNAPSHOT_LOCKED | RX_SNAPSHOT_LOCKED);
 
-	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+	return 0;
+}
+
+static int pch_gbe_hwtstamp_get(struct net_device *netdev,
+				struct kernel_hwtstamp_config *cfg)
+{
+	struct pch_gbe_adapter *adapter = netdev_priv(netdev);
+
+	cfg->tx_type = adapter->hwts_tx_en ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
+	cfg->rx_filter = adapter->hwts_rx_en;
+
+	return 0;
 }
 
 static inline void pch_gbe_mac_load_mac_addr(struct pch_gbe_hw *hw)
@@ -2234,9 +2243,6 @@ static int pch_gbe_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
 
 	netdev_dbg(netdev, "cmd : 0x%04x\n", cmd);
 
-	if (cmd == SIOCSHWTSTAMP)
-		return hwtstamp_ioctl(netdev, ifr, cmd);
-
 	return generic_mii_ioctl(&adapter->mii, if_mii(ifr), cmd, NULL);
 }
 
@@ -2328,6 +2334,8 @@ static const struct net_device_ops pch_gbe_netdev_ops = {
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_poll_controller = pch_gbe_netpoll,
 #endif
+	.ndo_hwtstamp_get = pch_gbe_hwtstamp_get,
+	.ndo_hwtstamp_set = pch_gbe_hwtstamp_set,
 };
 
 static pci_ers_result_t pch_gbe_io_error_detected(struct pci_dev *pdev,
-- 
2.47.3


