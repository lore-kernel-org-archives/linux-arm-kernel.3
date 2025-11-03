Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAD4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWuVspmUhSJsExmenHKhxq2bnNciqFsbmxhyM13tHTg=; b=isg823fvcIjt5BDg1hh0LGA2i9
	RLA7iO0tzYsIMc37zxim9pW0S7B8mMPuL4ZiYit+hv4VVUHsRK4o4vz/zzGJHwT/yPETmOfZFmbmo
	M+4Vi6gF5TlhnDIylbg/cnjop8A5Maio3361q0CFq3nty+32HVoE4jmoDOVrd6f+cxscyb5vZoDnk
	YglIp38dtypV4V1LRKFJz1Dxkhl15XjKO5fl9KJvE7sG+JvdWqRMyZyMyZO/7OQ2gKsDauxheY429
	CRh0+/g9DuwZohn208smnkBykxfBpGZP/m+qo6svPJchvCLjqJHhTM3ul9dME95TZlJivo5Ix1HfJ
	NqcCp3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCV-0000000A5Rl-3NVK;
	Mon, 03 Nov 2025 15:10:31 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCS-0000000A5N1-2V7g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:10:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762182626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VWuVspmUhSJsExmenHKhxq2bnNciqFsbmxhyM13tHTg=;
	b=TQE8dIU/ZknqxJkubcDLYx4CCgOVVMkyUI+O+ye0aI5X2Wqnc7Z0SrQVn5nE7VKD/5x+rd
	uX3qmLYVQgUECB2Wf3lG8XaCw/DIZ8GqAnR/2ukz8XwSFNQPPwoge99nIOE2aUobjPvLN/
	s/VPVDc6iiWHOX7H1c4kLwijPd9mtFA=
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
Subject: [PATCH net-next v2 4/7] net: octeon: mgmt: convert to use ndo_hwtstamp callbacks
Date: Mon,  3 Nov 2025 15:09:49 +0000
Message-ID: <20251103150952.3538205-5-vadim.fedorenko@linux.dev>
In-Reply-To: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071028_914763_09523779 
X-CRM114-Status: GOOD (  16.07  )
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
callback accordingly.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
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


