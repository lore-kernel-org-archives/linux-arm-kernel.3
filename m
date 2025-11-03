Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F11FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiubSvXMtiQhfQK0rj9voqINAZifbWobVnopOc2D7Vk=; b=DPAFrPGHpUgTBgvqma543hnQ56
	g9vZG5F86OFHTQvJsu6eMUBvCNCIS0SOyQ/EmqTpwbn4LSAR6fa03wDzAocay2S5KfUA0xBSCN5sW
	OlK+UK/PNetthGf6eHHQzWzGPD6mMtPbGX1OE+oJ0j3ORtBjYKxoU1hCaTSxg0zszJbVwOu3Mb4xP
	Y1g/IKcMQscMzhc8vocBS58RFSeVn5RZQRhJEA3ETXoOWD/vy1/RyulWtFrkzbTWRqucfgnsAKSAq
	8vtQr+3VN8gU+n6pB/QjvPd5OS0+0ASCyuu95tOsz7CT2Mp8bS6KcpmnBezzZ3wfrwX/vLroVNTey
	MKOACrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCu-0000000A5es-0VgU;
	Mon, 03 Nov 2025 15:10:56 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCq-0000000A5bq-3N3D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:10:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762182650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AiubSvXMtiQhfQK0rj9voqINAZifbWobVnopOc2D7Vk=;
	b=ltRyfC6l3hSoMVI0at0Znk7863ntJ3zeSo+8umLFsbHWux+IXCGmJuKLj5IjyhP4UJgS1G
	aLbhFHecKwLjNPydkIwqw5ZIOIOse19ThAPLEdAPx5UVSi4fuAC8pZyncRiJPmiSdQrVNq
	+eZgLU3I5Z+zBFpg3J3paAdv7o7EC3Q=
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
Subject: [PATCH net-next v2 5/7] net: thunderx: convert to use ndo_hwtstamp callbacks
Date: Mon,  3 Nov 2025 15:09:50 +0000
Message-ID: <20251103150952.3538205-6-vadim.fedorenko@linux.dev>
In-Reply-To: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071052_984227_775C7872 
X-CRM114-Status: GOOD (  12.32  )
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

The driver implemented SIOCSHWTSTAMP ioctl command only, but it also
stores configuration in private data, so it's possible to report it back
to users. Implement both ndo_hwtstamp_set and ndo_hwtstamp_get
callbacks.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 .../net/ethernet/cavium/thunder/nicvf_main.c  | 45 ++++++++++---------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_main.c b/drivers/net/ethernet/cavium/thunder/nicvf_main.c
index 1be2dc40a1a6..0b6e30a8feb0 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_main.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_main.c
@@ -1899,18 +1899,18 @@ static int nicvf_xdp(struct net_device *netdev, struct netdev_bpf *xdp)
 	}
 }
 
-static int nicvf_config_hwtstamp(struct net_device *netdev, struct ifreq *ifr)
+static int nicvf_hwtstamp_set(struct net_device *netdev,
+			      struct kernel_hwtstamp_config *config,
+			      struct netlink_ext_ack *extack)
 {
-	struct hwtstamp_config config;
 	struct nicvf *nic = netdev_priv(netdev);
 
-	if (!nic->ptp_clock)
+	if (!nic->ptp_clock) {
+		NL_SET_ERR_MSG_MOD(extack, "HW timestamping is not supported");
 		return -ENODEV;
+	}
 
-	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
-		return -EFAULT;
-
-	switch (config.tx_type) {
+	switch (config->tx_type) {
 	case HWTSTAMP_TX_OFF:
 	case HWTSTAMP_TX_ON:
 		break;
@@ -1918,7 +1918,7 @@ static int nicvf_config_hwtstamp(struct net_device *netdev, struct ifreq *ifr)
 		return -ERANGE;
 	}
 
-	switch (config.rx_filter) {
+	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		nic->hw_rx_tstamp = false;
 		break;
@@ -1937,7 +1937,7 @@ static int nicvf_config_hwtstamp(struct net_device *netdev, struct ifreq *ifr)
 	case HWTSTAMP_FILTER_PTP_V2_SYNC:
 	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
 		nic->hw_rx_tstamp = true;
-		config.rx_filter = HWTSTAMP_FILTER_ALL;
+		config->rx_filter = HWTSTAMP_FILTER_ALL;
 		break;
 	default:
 		return -ERANGE;
@@ -1946,20 +1946,24 @@ static int nicvf_config_hwtstamp(struct net_device *netdev, struct ifreq *ifr)
 	if (netif_running(netdev))
 		nicvf_config_hw_rx_tstamp(nic, nic->hw_rx_tstamp);
 
-	if (copy_to_user(ifr->ifr_data, &config, sizeof(config)))
-		return -EFAULT;
-
 	return 0;
 }
 
-static int nicvf_ioctl(struct net_device *netdev, struct ifreq *req, int cmd)
+static int nicvf_hwtstamp_get(struct net_device *netdev,
+			      struct kernel_hwtstamp_config *config)
 {
-	switch (cmd) {
-	case SIOCSHWTSTAMP:
-		return nicvf_config_hwtstamp(netdev, req);
-	default:
-		return -EOPNOTSUPP;
-	}
+	struct nicvf *nic = netdev_priv(netdev);
+
+	if (!nic->ptp_clock)
+		return -ENODEV;
+
+	/* TX timestamping is technically always on */
+	config->tx_type = HWTSTAMP_TX_ON;
+	config->rx_filter = nic->hw_rx_tstamp ?
+			    HWTSTAMP_FILTER_ALL :
+			    HWTSTAMP_FILTER_NONE;
+
+	return 0;
 }
 
 static void __nicvf_set_rx_mode_task(u8 mode, struct xcast_addr_list *mc_addrs,
@@ -2081,8 +2085,9 @@ static const struct net_device_ops nicvf_netdev_ops = {
 	.ndo_fix_features       = nicvf_fix_features,
 	.ndo_set_features       = nicvf_set_features,
 	.ndo_bpf		= nicvf_xdp,
-	.ndo_eth_ioctl           = nicvf_ioctl,
 	.ndo_set_rx_mode        = nicvf_set_rx_mode,
+	.ndo_hwtstamp_get	= nicvf_hwtstamp_get,
+	.ndo_hwtstamp_set	= nicvf_hwtstamp_set,
 };
 
 static int nicvf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
-- 
2.47.3


