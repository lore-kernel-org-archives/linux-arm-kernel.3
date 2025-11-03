Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF251CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBEtnoTWD5xcBVyYsCQCiVFcJ3GOpBPip758nD1g4so=; b=H0TVeEK5i/tLP6K3kkOKTSlqQ8
	n0880q0XQZhUevlHBZlm/CXC/jJz/7F+rb7iurSiLOKYh2lUp9vYPsQ3pWt4ZJRYJ0xt4qXQ5Dbv3
	JKxfS9P6MqyFMyG/XbEKngp/IBDAtYgN8AKupjhegz/wyWMXoRWFxwIthc3EVYv50d9UabYvlIKAt
	bAfq3nJrvtjBSd8mwlP/9CJ+Q1YZjQEDJblhIamuTle65clVVUjtb2OEPhr3tLj3Z4IQSwumI3DoH
	/FcEwjhbp2YGcQLNfPG+6MQ43pkYGMzrERsTH17mZpkn4RA6clfgn48X7tePysRxBLPtjIMugJ0+3
	pNmpG7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCw-0000000A5gn-2yNR;
	Mon, 03 Nov 2025 15:10:59 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCu-0000000A5dw-0M9X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:10:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762182653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wBEtnoTWD5xcBVyYsCQCiVFcJ3GOpBPip758nD1g4so=;
	b=cfI7Pp13uB6NIc3XGu81hpBFidQRhb+IuOQSWtzcQ89ynU3DTgHE+cEddiBHK3HSgAXUP0
	THV5qIe+J3NJZStOp+D3AyEEUClpcKhYv3PwBxYAV2WGxarGe1V8+i0U3FmXoM/c5JOY7i
	CSSAu6xQnWT3oF0jTgeTsNHb37m4AdA=
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
Subject: [PATCH net-next v2 7/7] qede: convert to use ndo_hwtstamp callbacks
Date: Mon,  3 Nov 2025 15:09:52 +0000
Message-ID: <20251103150952.3538205-8-vadim.fedorenko@linux.dev>
In-Reply-To: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071056_413998_3C058007 
X-CRM114-Status: GOOD (  13.06  )
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

The driver implemented SIOCSHWTSTAMP ioctl cmd only, but it stores
configuration in private structure, so it can be reported back to users.
Implement both ndo_hwtstamp_set and ndo_hwtstamp_set callbacks.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 drivers/net/ethernet/qlogic/qede/qede_main.c | 22 +--------
 drivers/net/ethernet/qlogic/qede/qede_ptp.c  | 47 ++++++++++++++------
 drivers/net/ethernet/qlogic/qede/qede_ptp.h  |  6 ++-
 3 files changed, 40 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qede/qede_main.c b/drivers/net/ethernet/qlogic/qede/qede_main.c
index b5d744d2586f..66ab1b9d65a1 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_main.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_main.c
@@ -506,25 +506,6 @@ static int qede_set_vf_trust(struct net_device *dev, int vfidx, bool setting)
 }
 #endif
 
-static int qede_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
-{
-	struct qede_dev *edev = netdev_priv(dev);
-
-	if (!netif_running(dev))
-		return -EAGAIN;
-
-	switch (cmd) {
-	case SIOCSHWTSTAMP:
-		return qede_ptp_hw_ts(edev, ifr);
-	default:
-		DP_VERBOSE(edev, QED_MSG_DEBUG,
-			   "default IOCTL cmd 0x%x\n", cmd);
-		return -EOPNOTSUPP;
-	}
-
-	return 0;
-}
-
 static void qede_fp_sb_dump(struct qede_dev *edev, struct qede_fastpath *fp)
 {
 	char *p_sb = (char *)fp->sb_info->sb_virt;
@@ -717,7 +698,6 @@ static const struct net_device_ops qede_netdev_ops = {
 	.ndo_set_mac_address	= qede_set_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= qede_change_mtu,
-	.ndo_eth_ioctl		= qede_ioctl,
 	.ndo_tx_timeout		= qede_tx_timeout,
 #ifdef CONFIG_QED_SRIOV
 	.ndo_set_vf_mac		= qede_set_vf_mac,
@@ -742,6 +722,8 @@ static const struct net_device_ops qede_netdev_ops = {
 #endif
 	.ndo_xdp_xmit		= qede_xdp_transmit,
 	.ndo_setup_tc		= qede_setup_tc_offload,
+	.ndo_hwtstamp_get	= qede_hwtstamp_get,
+	.ndo_hwtstamp_set	= qede_hwtstamp_set,
 };
 
 static const struct net_device_ops qede_netdev_vf_ops = {
diff --git a/drivers/net/ethernet/qlogic/qede/qede_ptp.c b/drivers/net/ethernet/qlogic/qede/qede_ptp.c
index a38f1e72c62b..b65e9f46ac52 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_ptp.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_ptp.c
@@ -290,35 +290,54 @@ static int qede_ptp_cfg_filters(struct qede_dev *edev)
 	return 0;
 }
 
-int qede_ptp_hw_ts(struct qede_dev *edev, struct ifreq *ifr)
+int qede_hwtstamp_set(struct net_device *netdev,
+		      struct kernel_hwtstamp_config *config,
+		      struct netlink_ext_ack *extack)
 {
-	struct hwtstamp_config config;
+	struct qede_dev *edev = netdev_priv(netdev);
 	struct qede_ptp *ptp;
 	int rc;
 
 	ptp = edev->ptp;
-	if (!ptp)
+	if (!ptp) {
+		NL_SET_ERR_MSG_MOD(extack, "HW timestamping is not supported");
 		return -EIO;
-
-	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
-		return -EFAULT;
+	}
 
 	DP_VERBOSE(edev, QED_MSG_DEBUG,
-		   "HWTSTAMP IOCTL: Requested tx_type = %d, requested rx_filters = %d\n",
-		   config.tx_type, config.rx_filter);
+		   "HWTSTAMP SET: Requested tx_type = %d, requested rx_filters = %d\n",
+		   config->tx_type, config->rx_filter);
 
 	ptp->hw_ts_ioctl_called = 1;
-	ptp->tx_type = config.tx_type;
-	ptp->rx_filter = config.rx_filter;
+	ptp->tx_type = config->tx_type;
+	ptp->rx_filter = config->rx_filter;
 
 	rc = qede_ptp_cfg_filters(edev);
-	if (rc)
+	if (rc) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "One-step timestamping is not supported");
 		return rc;
+	}
+
+	config->rx_filter = ptp->rx_filter;
 
-	config.rx_filter = ptp->rx_filter;
+	return 0;
+}
 
-	return copy_to_user(ifr->ifr_data, &config,
-			    sizeof(config)) ? -EFAULT : 0;
+int qede_hwtstamp_get(struct net_device *netdev,
+		      struct kernel_hwtstamp_config *config)
+{
+	struct qede_dev *edev = netdev_priv(netdev);
+	struct qede_ptp *ptp;
+
+	ptp = edev->ptp;
+	if (!ptp)
+		return -EIO;
+
+	config->tx_type = ptp->tx_type;
+	config->rx_filter = ptp->rx_filter;
+
+	return 0;
 }
 
 int qede_ptp_get_ts_info(struct qede_dev *edev, struct kernel_ethtool_ts_info *info)
diff --git a/drivers/net/ethernet/qlogic/qede/qede_ptp.h b/drivers/net/ethernet/qlogic/qede/qede_ptp.h
index adafc894797e..88f168395812 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_ptp.h
+++ b/drivers/net/ethernet/qlogic/qede/qede_ptp.h
@@ -14,7 +14,11 @@
 
 void qede_ptp_rx_ts(struct qede_dev *edev, struct sk_buff *skb);
 void qede_ptp_tx_ts(struct qede_dev *edev, struct sk_buff *skb);
-int qede_ptp_hw_ts(struct qede_dev *edev, struct ifreq *req);
+int qede_hwtstamp_get(struct net_device *netdev,
+		      struct kernel_hwtstamp_config *config);
+int qede_hwtstamp_set(struct net_device *netdev,
+		      struct kernel_hwtstamp_config *config,
+		      struct netlink_ext_ack *extack);
 void qede_ptp_disable(struct qede_dev *edev);
 int qede_ptp_enable(struct qede_dev *edev);
 int qede_ptp_get_ts_info(struct qede_dev *edev, struct kernel_ethtool_ts_info *ts);
-- 
2.47.3


