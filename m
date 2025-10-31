Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7AECCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 00:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjrw0MCTJkLHYnxNcLUiTkG0NWdJr6MqqqnbhuwbLiY=; b=dnve0IiTEEG7e32tBOLOSXgYTY
	EUqdCPbRdqd3zBpxq5xYDmyTFPX1UnfoX4AjLtdkkx0TeEDEP9aveM+tUqUkQZGq6BBTaWfw2ixJX
	QTFOTVhXZA5Xk3CJq4tI6EewVmBL6WDqjml1OvOd4IujP5mvaOxx0gN4YPBAwBlyL/ZJqs9W/DdEY
	a7hXa7VXhCqjXzyhm/RU9/uHXhG3zJHW4jviWCwcEwoW2/4GS5EJAaSDSaOZMZ8yUrpSfUWCwL+PX
	kZ5+Ek1DrztAQ2lhyvQnHz0w6siGXfe3MWHHCJONvAWuTTC9fwmxniwA6glMD2C9U7VCVQrJeil+Q
	BDEO+UZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdI7-00000005C14-3lOl;
	Fri, 31 Oct 2025 00:46:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdHu-00000005Bvu-3jeb
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 31 Oct 2025 00:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rjrw0MCTJkLHYnxNcLUiTkG0NWdJr6MqqqnbhuwbLiY=; b=EmLYmnNgeDsCEUO05rXWYU1kX6
	VPwfyQ0C57NJazGgtTloMrLJ06yYVpeAYkdbmvbZHHO8hk2z8NNbigdiQPI4MSb1THsjV9smZxfRR
	0g77WisMeBGVktbM4iHsPkqtMZaTxEVYykM3kp0E3lnDyL9iEC9amlc+XmcwvqlYubzvhnycUn+TP
	efKzMcr6R7Fwoct5AlxBjN+quvYYZ6qsyMKnhD6qpKWq+X9VBJO4TSw1WyLwForZMrWEe2ciYyZ9e
	IhBnOB61Cdj+4g+KSvibJ57URRw0Pl+oiKa9lYRKLRuOGO2mhAFcoTdqP2ACD7ek78KVKWUlOe/yy
	gF2B3Idg==;
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEcQ8-0000000AHPO-3tZx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 23:51:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761871590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rjrw0MCTJkLHYnxNcLUiTkG0NWdJr6MqqqnbhuwbLiY=;
	b=UErJtRWlGGMrWhDmXDV5rG9sqeu614lBDvdPjAQQItXd+APHBaIUWUqipM49qeKQ5jM5yg
	7rJbf1siydcm46WUPBs/NS5YjR5SkeqpWpdERCBYLDaV+2H+OXlF+sFwsNf8BudYkkH84r
	jTzG7Ur4BQUAddSggiLybdlvJj2lY3k=
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
To: Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
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
Subject: [PATCH net-next 4/7] net: octeon: mgmt: convert to use ndo_hwtstamp callbacks
Date: Fri, 31 Oct 2025 00:46:04 +0000
Message-ID: <20251031004607.1983544-5-vadim.fedorenko@linux.dev>
In-Reply-To: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
References: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_235109_175585_7126A04A 
X-CRM114-Status: GOOD (  16.05  )
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

The driver implemented SIOCSHWTSTAMP ioctl command only. But it stores
timestamping configuration, so it is possible to report it to users.
Implement both ndo_hwtstamp_set and ndo_hwtstamp_get callbacks. After
this the ndo_eth_ioctl effectively becomes phy_do_ioctl - adjust
callback accrodingly.

Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 .../net/ethernet/cavium/octeon/octeon_mgmt.c  | 62 ++++++++++---------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c b/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
index 393b9951490a..c190fc6538d4 100644
--- a/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
+++ b/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
@@ -690,19 +690,16 @@ static irqreturn_t octeon_mgmt_interrupt(int cpl, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int octeon_mgmt_ioctl_hwtstamp(struct net_device *netdev,
-				      struct ifreq *rq, int cmd)
+static int octeon_mgmt_hwtstamp_set(struct net_device *netdev,
+				    struct kernel_hwtstamp_config *config,
+				    struct netlink_ext_ack *extack)
 {
 	struct octeon_mgmt *p = netdev_priv(netdev);
-	struct hwtstamp_config config;
-	union cvmx_mio_ptp_clock_cfg ptp;
 	union cvmx_agl_gmx_rxx_frm_ctl rxx_frm_ctl;
+	union cvmx_mio_ptp_clock_cfg ptp;
 	bool have_hw_timestamps = false;
 
-	if (copy_from_user(&config, rq->ifr_data, sizeof(config)))
-		return -EFAULT;
-
-	/* Check the status of hardware for tiemstamps */
+	/* Check the status of hardware for timestamps */
 	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
 		/* Get the current state of the PTP clock */
 		ptp.u64 = cvmx_read_csr(CVMX_MIO_PTP_CLOCK_CFG);
@@ -733,10 +730,12 @@ static int octeon_mgmt_ioctl_hwtstamp(struct net_device *netdev,
 		have_hw_timestamps = true;
 	}
 
-	if (!have_hw_timestamps)
+	if (!have_hw_timestamps) {
+		NL_SET_ERR_MSG_MOD(extack, "HW doesn't support timestamping");
 		return -EINVAL;
+	}
 
-	switch (config.tx_type) {
+	switch (config->tx_type) {
 	case HWTSTAMP_TX_OFF:
 	case HWTSTAMP_TX_ON:
 		break;
@@ -744,7 +743,7 @@ static int octeon_mgmt_ioctl_hwtstamp(struct net_device *netdev,
 		return -ERANGE;
 	}
 
-	switch (config.rx_filter) {
+	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		p->has_rx_tstamp = false;
 		rxx_frm_ctl.u64 = cvmx_read_csr(p->agl + AGL_GMX_RX_FRM_CTL);
@@ -766,33 +765,34 @@ static int octeon_mgmt_ioctl_hwtstamp(struct net_device *netdev,
 	case HWTSTAMP_FILTER_PTP_V2_SYNC:
 	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
 	case HWTSTAMP_FILTER_NTP_ALL:
-		p->has_rx_tstamp = have_hw_timestamps;
-		config.rx_filter = HWTSTAMP_FILTER_ALL;
-		if (p->has_rx_tstamp) {
-			rxx_frm_ctl.u64 = cvmx_read_csr(p->agl + AGL_GMX_RX_FRM_CTL);
-			rxx_frm_ctl.s.ptp_mode = 1;
-			cvmx_write_csr(p->agl + AGL_GMX_RX_FRM_CTL, rxx_frm_ctl.u64);
-		}
+		p->has_rx_tstamp = true;
+		config->rx_filter = HWTSTAMP_FILTER_ALL;
+		rxx_frm_ctl.u64 = cvmx_read_csr(p->agl + AGL_GMX_RX_FRM_CTL);
+		rxx_frm_ctl.s.ptp_mode = 1;
+		cvmx_write_csr(p->agl + AGL_GMX_RX_FRM_CTL, rxx_frm_ctl.u64);
 		break;
 	default:
 		return -ERANGE;
 	}
 
-	if (copy_to_user(rq->ifr_data, &config, sizeof(config)))
-		return -EFAULT;
-
 	return 0;
 }
 
-static int octeon_mgmt_ioctl(struct net_device *netdev,
-			     struct ifreq *rq, int cmd)
+static int octeon_mgmt_hwtstamp_get(struct net_device *netdev,
+				    struct kernel_hwtstamp_config *config)
 {
-	switch (cmd) {
-	case SIOCSHWTSTAMP:
-		return octeon_mgmt_ioctl_hwtstamp(netdev, rq, cmd);
-	default:
-		return phy_do_ioctl(netdev, rq, cmd);
-	}
+	struct octeon_mgmt *p = netdev_priv(netdev);
+
+	/* Check the status of hardware for timestamps */
+	if (!OCTEON_IS_MODEL(OCTEON_CN6XXX))
+		return -EINVAL;
+
+	config->tx_type = HWTSTAMP_TX_ON;
+	config->rx_filter = p->has_rx_tstamp ?
+			    HWTSTAMP_FILTER_ALL :
+			    HWTSTAMP_FILTER_NONE;
+
+	return 0;
 }
 
 static void octeon_mgmt_disable_link(struct octeon_mgmt *p)
@@ -1370,11 +1370,13 @@ static const struct net_device_ops octeon_mgmt_ops = {
 	.ndo_start_xmit =		octeon_mgmt_xmit,
 	.ndo_set_rx_mode =		octeon_mgmt_set_rx_filtering,
 	.ndo_set_mac_address =		octeon_mgmt_set_mac_address,
-	.ndo_eth_ioctl =			octeon_mgmt_ioctl,
+	.ndo_eth_ioctl =		phy_do_ioctl,
 	.ndo_change_mtu =		octeon_mgmt_change_mtu,
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_poll_controller =		octeon_mgmt_poll_controller,
 #endif
+	.ndo_hwtstamp_get =		octeon_mgmt_hwtstamp_get,
+	.ndo_hwtstamp_set =		octeon_mgmt_hwtstamp_set,
 };
 
 static int octeon_mgmt_probe(struct platform_device *pdev)
-- 
2.47.3


