Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC1ECCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmYNimSi0IXorRNv3N6IHxveVYTJs8JBEAmsZjAEVh8=; b=2egD9TfPl12NYXzL/prTfYvcZk
	LU97Gl3Zk/r/mNjAbfBYctoviVDQ1/ojwRNW8hFTrrc3GtDduAgGlhVS5Nl3TGFo9TYNTg3B7gXdq
	Zei359338seQx5LxmaLccHSMH13SzCaH/sHH2s02SLQ9CN+qMIhN2qOG1M6E2DUAegJJCsxXaaNaQ
	LEvranFGaKVoSe3XnoSEPDsz0wXloq2biANwlkkjurGHshQAGdF4gYuExCXr8or3GKM72UxB2ko2p
	wSKNOyqAzoTQYGEKCxTqPBiETp2jd4T3qrGpGdXDQ/ZyFJZvFzJgaFRJ5KSji9KJg0Q/gdFDKmhCo
	XGRjCO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCR-0000000A5Nv-2deE;
	Mon, 03 Nov 2025 15:10:27 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCP-0000000A5Lt-2Z7z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:10:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762182623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmYNimSi0IXorRNv3N6IHxveVYTJs8JBEAmsZjAEVh8=;
	b=R3DP039AVaZ59uqt9zaFi7jc8iKhsMmzOXxsRay50L7VB7Z4Nsrn9EOC09HnTJtjeKkoIV
	ux4oT+8p+XWUN1bqVrMXfHUf4XFOgm/B28CK64mr5YIoH1kRl99MY6OMQ0i6tqIuD7RxhH
	kICRkd3NqdtywknZf+Z5iZAIWxczi1c=
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
Subject: [PATCH net-next v2 2/7] net: liquidio: convert to use ndo_hwtstamp callbacks
Date: Mon,  3 Nov 2025 15:09:47 +0000
Message-ID: <20251103150952.3538205-3-vadim.fedorenko@linux.dev>
In-Reply-To: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071025_789397_0C5F177C 
X-CRM114-Status: GOOD (  12.93  )
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

The driver implemented SIOCSHWTSTAMP ioctl command only, but there is a
way to get configured status. Implement both ndo_hwtstamp_set and
ndo_hwtstamp_get callbacks.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 .../net/ethernet/cavium/liquidio/lio_main.c   | 50 ++++++++-----------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_main.c b/drivers/net/ethernet/cavium/liquidio/lio_main.c
index 8e2fcec26ea1..0732440eeacd 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_main.c
@@ -2107,20 +2107,16 @@ liquidio_get_stats64(struct net_device *netdev,
 		lstats->tx_fifo_errors;
 }
 
-/**
- * hwtstamp_ioctl - Handler for SIOCSHWTSTAMP ioctl
- * @netdev: network device
- * @ifr: interface request
- */
-static int hwtstamp_ioctl(struct net_device *netdev, struct ifreq *ifr)
+static int liquidio_hwtstamp_set(struct net_device *netdev,
+				 struct kernel_hwtstamp_config *conf,
+				 struct netlink_ext_ack *extack)
 {
-	struct hwtstamp_config conf;
 	struct lio *lio = GET_LIO(netdev);
 
-	if (copy_from_user(&conf, ifr->ifr_data, sizeof(conf)))
-		return -EFAULT;
+	if (!lio->oct_dev->ptp_enable)
+		return -EOPNOTSUPP;
 
-	switch (conf.tx_type) {
+	switch (conf->tx_type) {
 	case HWTSTAMP_TX_ON:
 	case HWTSTAMP_TX_OFF:
 		break;
@@ -2128,7 +2124,7 @@ static int hwtstamp_ioctl(struct net_device *netdev, struct ifreq *ifr)
 		return -ERANGE;
 	}
 
-	switch (conf.rx_filter) {
+	switch (conf->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		break;
 	case HWTSTAMP_FILTER_ALL:
@@ -2146,39 +2142,32 @@ static int hwtstamp_ioctl(struct net_device *netdev, struct ifreq *ifr)
 	case HWTSTAMP_FILTER_PTP_V2_SYNC:
 	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
 	case HWTSTAMP_FILTER_NTP_ALL:
-		conf.rx_filter = HWTSTAMP_FILTER_ALL;
+		conf->rx_filter = HWTSTAMP_FILTER_ALL;
 		break;
 	default:
 		return -ERANGE;
 	}
 
-	if (conf.rx_filter == HWTSTAMP_FILTER_ALL)
+	if (conf->rx_filter == HWTSTAMP_FILTER_ALL)
 		ifstate_set(lio, LIO_IFSTATE_RX_TIMESTAMP_ENABLED);
 
 	else
 		ifstate_reset(lio, LIO_IFSTATE_RX_TIMESTAMP_ENABLED);
 
-	return copy_to_user(ifr->ifr_data, &conf, sizeof(conf)) ? -EFAULT : 0;
+	return 0;
 }
 
-/**
- * liquidio_ioctl - ioctl handler
- * @netdev: network device
- * @ifr: interface request
- * @cmd: command
- */
-static int liquidio_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
+static int liquidio_hwtstamp_get(struct net_device *netdev,
+				 struct kernel_hwtstamp_config *conf)
 {
 	struct lio *lio = GET_LIO(netdev);
 
-	switch (cmd) {
-	case SIOCSHWTSTAMP:
-		if (lio->oct_dev->ptp_enable)
-			return hwtstamp_ioctl(netdev, ifr);
-		fallthrough;
-	default:
-		return -EOPNOTSUPP;
-	}
+	/* TX timestamping is technically always on */
+	conf->tx_type = HWTSTAMP_TX_ON;
+	conf->rx_filter = ifstate_check(lio, LIO_IFSTATE_RX_TIMESTAMP_ENABLED) ?
+			  HWTSTAMP_FILTER_ALL : HWTSTAMP_FILTER_NONE;
+
+	return 0;
 }
 
 /**
@@ -3227,7 +3216,6 @@ static const struct net_device_ops lionetdevops = {
 	.ndo_vlan_rx_add_vid    = liquidio_vlan_rx_add_vid,
 	.ndo_vlan_rx_kill_vid   = liquidio_vlan_rx_kill_vid,
 	.ndo_change_mtu		= liquidio_change_mtu,
-	.ndo_eth_ioctl		= liquidio_ioctl,
 	.ndo_fix_features	= liquidio_fix_features,
 	.ndo_set_features	= liquidio_set_features,
 	.ndo_set_vf_mac		= liquidio_set_vf_mac,
@@ -3238,6 +3226,8 @@ static const struct net_device_ops lionetdevops = {
 	.ndo_set_vf_link_state  = liquidio_set_vf_link_state,
 	.ndo_get_vf_stats	= liquidio_get_vf_stats,
 	.ndo_get_port_parent_id	= liquidio_get_port_parent_id,
+	.ndo_hwtstamp_get	= liquidio_hwtstamp_get,
+	.ndo_hwtstamp_set	= liquidio_hwtstamp_set,
 };
 
 /**
-- 
2.47.3


