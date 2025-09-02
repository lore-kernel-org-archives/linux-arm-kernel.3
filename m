Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E2CCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tq1NRKi34cA0e6Ep6vk7B9+kUXvmNAQEESfZcvg/Ffc=; b=N4VZA7YvU3eIvoI4cxjnMQfK7A
	+YXTSVsYtWu0rj1TZyw/lzEMo++B/y0ziylvxsqqciywzRWAGjoSMmMem2DC32SnWca2QotkwKkn2
	BmKmZsIHhEnQMBq0jIajptkFciNNsGj+uflkL2S/Vcwy/N01GYZB/tlV+lgj9V2ceDvm/LvOd6lfy
	X5do6YiQ+J2RRk04Mh2ZOsqXFbnYdQ4QFZyQ9LLokpc8bvkY8QKB8XXjmCinL+sgWRmwa1B+pFikW
	HXQenGh4wK4FEn5RiA9+C7QPOYhmL6mnK2me2LibUC6sd3XnixdHbeqif7gkmp4VNNzj8JE+mvEqC
	3Q1AWsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ6h-0000000HDzX-0lC7;
	Tue, 02 Sep 2025 12:27:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utN0F-0000000GGpp-1qco
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 02 Sep 2025 09:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tq1NRKi34cA0e6Ep6vk7B9+kUXvmNAQEESfZcvg/Ffc=; b=U28LfCZ6HIgiK62KPFgbvHYni3
	WmH6355xrDti8ovM5EgqHDSxep/Cz/h9JO6s1pR8gmIeCaolizxo6DZP4IUmTwncj18Ofi44+L6xX
	HPG5p49Wx56xz4Z2uEMUezHqcziXAybpAkF0fF4aofQBrIsy+6BEERWtPw5187Hpzceq8yp5aO6mI
	SxRNnvHRRmL4Rkh7cGT6F+Z4LueQgluSd+dCb2K0cuXwq4b+r4uPmTfa9OdcAn6PhnhhaQIxoenJf
	FqFd/Zrrh4j9UHbJMLOXAPhZtnP86iVVblztkOHAxO+qg9wgBMjRiOcBzp7RTUVEe0HdKgfiakupv
	iYpUwVYg==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utN0B-00000003yWN-39yJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:08:34 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 582988s62494770;
	Tue, 2 Sep 2025 04:08:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756804088;
	bh=tq1NRKi34cA0e6Ep6vk7B9+kUXvmNAQEESfZcvg/Ffc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BeTwCjg8ENHYkfjJ3yfKyKAzTFgO2wyPzcCYCaLDv9AAjDrNibth1FNz6Z/GEhpcr
	 ePKKUJrwYfgvK5eTJFsfQP+jJKEAGSjATnkKLM2DNHYhHZZiIpHCDc9shHQdyHQNII
	 mMPPozCsaiO15HIWPuxsRhLJcG28kmVoMG0m/cNU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 582987AV3375343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 04:08:08 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 04:08:06 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 04:08:06 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 582986cE1061793;
	Tue, 2 Sep 2025 04:08:06 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 582985Z8020892;
	Tue, 2 Sep 2025 04:08:06 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu
 Poirier <mathieu.poirier@linaro.org>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
        Mengyuan Lou <mengyuanlou@net-swift.com>,
        MD
 Danish Anwar <danishanwar@ti.com>, Xin Guo <guoxin09@huawei.com>,
        Lei Wei
	<quic_leiwei@quicinc.com>, Lee Trager <lee@trager.us>,
        Michael Ellerman
	<mpe@ellerman.id.au>, Fan Gong <gongfan1@huawei.com>,
        Lorenzo Bianconi
	<lorenzo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lukas
 Bulwahn <lukas.bulwahn@redhat.com>,
        Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>,
        Suman Anna <s-anna@ti.com>
CC: Tero Kristo <kristo@kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>
Subject: [PATCH net-next v2 7/8] net: rpmsg-eth: Add support for multicast filtering
Date: Tue, 2 Sep 2025 14:37:45 +0530
Message-ID: <20250902090746.3221225-8-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902090746.3221225-1-danishanwar@ti.com>
References: <20250902090746.3221225-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_100832_266580_F177630B 
X-CRM114-Status: GOOD (  17.42  )
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

Add support for multicast filtering for RPMSG ETH driver. Implement the
ndo_set_rx_mode callback as icve_set_rx_mode() API. rx_mode_workqueue is
initialized in rpmsg_eth_probe() and queued in rpmsg_eth_set_rx_mode().

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/rpmsg_eth.c | 63 ++++++++++++++++++++++++++++++++
 drivers/net/ethernet/rpmsg_eth.h | 12 ++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/net/ethernet/rpmsg_eth.c b/drivers/net/ethernet/rpmsg_eth.c
index a2248e21cf22..e26b1d8f1752 100644
--- a/drivers/net/ethernet/rpmsg_eth.c
+++ b/drivers/net/ethernet/rpmsg_eth.c
@@ -67,6 +67,11 @@ static int create_request(struct rpmsg_eth_common *common,
 		ether_addr_copy(msg->req_msg.mac_addr.addr,
 				common->port->ndev->dev_addr);
 		break;
+	case RPMSG_ETH_REQ_ADD_MC_ADDR:
+	case RPMSG_ETH_REQ_DEL_MC_ADDR:
+		ether_addr_copy(msg->req_msg.mac_addr.addr,
+				common->mcast_addr);
+		break;
 	case RPMSG_ETH_NOTIFY_PORT_UP:
 	case RPMSG_ETH_NOTIFY_PORT_DOWN:
 		msg->msg_hdr.msg_type = RPMSG_ETH_NOTIFY_MSG;
@@ -118,6 +123,22 @@ static int rpmsg_eth_create_send_request(struct rpmsg_eth_common *common,
 	return ret;
 }
 
+static int rpmsg_eth_add_mc_addr(struct net_device *ndev, const u8 *addr)
+{
+	struct rpmsg_eth_common *common = rpmsg_eth_ndev_to_common(ndev);
+
+	ether_addr_copy(common->mcast_addr, addr);
+	return rpmsg_eth_create_send_request(common, RPMSG_ETH_REQ_ADD_MC_ADDR, true);
+}
+
+static int rpmsg_eth_del_mc_addr(struct net_device *ndev, const u8 *addr)
+{
+	struct rpmsg_eth_common *common = rpmsg_eth_ndev_to_common(ndev);
+
+	ether_addr_copy(common->mcast_addr, addr);
+	return rpmsg_eth_create_send_request(common, RPMSG_ETH_REQ_DEL_MC_ADDR, true);
+}
+
 static void rpmsg_eth_state_machine(struct work_struct *work)
 {
 	struct delayed_work *dwork = to_delayed_work(work);
@@ -200,6 +221,10 @@ static int rpmsg_eth_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 			break;
 		case RPMSG_ETH_RESP_SET_MAC_ADDR:
 			break;
+		case RPMSG_ETH_RESP_ADD_MC_ADDR:
+		case RPMSG_ETH_RESP_DEL_MC_ADDR:
+			complete(&common->sync_msg);
+			break;
 		}
 		break;
 	case RPMSG_ETH_NOTIFY_MSG:
@@ -399,10 +424,15 @@ static int rpmsg_eth_ndo_stop(struct net_device *ndev)
 
 	netif_carrier_off(port->ndev);
 
+	__dev_mc_unsync(ndev, rpmsg_eth_del_mc_addr);
+	__hw_addr_init(&common->mc_list);
+
 	cancel_delayed_work_sync(&common->state_work);
 	timer_delete_sync(&port->rx_timer);
 	napi_disable(&port->rx_napi);
 
+	cancel_work_sync(&common->rx_mode_work);
+
 	return 0;
 }
 
@@ -459,10 +489,35 @@ static int rpmsg_eth_set_mac_address(struct net_device *ndev, void *addr)
 	return ret;
 }
 
+static void rpmsg_eth_ndo_set_rx_mode_work(struct work_struct *work)
+{
+	struct rpmsg_eth_common *common;
+	struct net_device *ndev;
+
+	common = container_of(work, struct rpmsg_eth_common, rx_mode_work);
+	ndev = common->port->ndev;
+
+	/* make a mc list copy */
+	netif_addr_lock_bh(ndev);
+	__hw_addr_sync(&common->mc_list, &ndev->mc, ndev->addr_len);
+	netif_addr_unlock_bh(ndev);
+
+	__hw_addr_sync_dev(&common->mc_list, ndev, rpmsg_eth_add_mc_addr,
+			   rpmsg_eth_del_mc_addr);
+}
+
+static void rpmsg_eth_set_rx_mode(struct net_device *ndev)
+{
+	struct rpmsg_eth_common *common = rpmsg_eth_ndev_to_common(ndev);
+
+	queue_work(common->cmd_wq, &common->rx_mode_work);
+}
+
 static const struct net_device_ops rpmsg_eth_netdev_ops = {
 	.ndo_open = rpmsg_eth_ndo_open,
 	.ndo_stop = rpmsg_eth_ndo_stop,
 	.ndo_start_xmit = rpmsg_eth_start_xmit,
+	.ndo_set_rx_mode = rpmsg_eth_set_rx_mode,
 	.ndo_set_mac_address = rpmsg_eth_set_mac_address,
 };
 
@@ -537,6 +592,13 @@ static int rpmsg_eth_probe(struct rpmsg_device *rpdev)
 	INIT_DELAYED_WORK(&common->state_work, rpmsg_eth_state_machine);
 	init_completion(&common->sync_msg);
 
+	__hw_addr_init(&common->mc_list);
+	INIT_WORK(&common->rx_mode_work, rpmsg_eth_ndo_set_rx_mode_work);
+	common->cmd_wq = create_singlethread_workqueue("rpmsg_eth_rx_work");
+	if (!common->cmd_wq) {
+		dev_err(dev, "Failure requesting workqueue\n");
+		return -ENOMEM;
+	}
 	/* Register the network device */
 	ret = rpmsg_eth_init_ndev(common);
 	if (ret)
@@ -552,6 +614,7 @@ static void rpmsg_eth_remove(struct rpmsg_device *rpdev)
 
 	netif_napi_del(&port->rx_napi);
 	timer_delete_sync(&port->rx_timer);
+	destroy_workqueue(common->cmd_wq);
 
 	dev_dbg(&rpdev->dev, "rpmsg-eth client driver is removed\n");
 }
diff --git a/drivers/net/ethernet/rpmsg_eth.h b/drivers/net/ethernet/rpmsg_eth.h
index 992d05bd9386..995c5a9c1034 100644
--- a/drivers/net/ethernet/rpmsg_eth.h
+++ b/drivers/net/ethernet/rpmsg_eth.h
@@ -57,10 +57,14 @@ enum rpmsg_eth_rpmsg_type {
 	/* Request types */
 	RPMSG_ETH_REQ_SHM_INFO = 0,
 	RPMSG_ETH_REQ_SET_MAC_ADDR,
+	RPMSG_ETH_REQ_ADD_MC_ADDR,
+	RPMSG_ETH_REQ_DEL_MC_ADDR,
 
 	/* Response types */
 	RPMSG_ETH_RESP_SHM_INFO,
 	RPMSG_ETH_RESP_SET_MAC_ADDR,
+	RPMSG_ETH_RESP_ADD_MC_ADDR,
+	RPMSG_ETH_RESP_DEL_MC_ADDR,
 
 	/* Notification types */
 	RPMSG_ETH_NOTIFY_PORT_UP,
@@ -210,6 +214,10 @@ enum rpmsg_eth_state {
  * @state: Interface state
  * @state_work: Delayed work for state machine
  * @sync_msg: Completion for synchronous message
+ * @rx_mode_work: Work structure for rx mode
+ * @cmd_wq: Workqueue for commands
+ * @mc_list: List of multicast addresses
+ * @mcast_addr: Multicast address filter
  */
 struct rpmsg_eth_common {
 	struct rpmsg_device *rpdev;
@@ -226,6 +234,10 @@ struct rpmsg_eth_common {
 	struct mutex state_lock;
 	struct delayed_work state_work;
 	struct completion sync_msg;
+	struct work_struct rx_mode_work;
+	struct workqueue_struct *cmd_wq;
+	struct netdev_hw_addr_list mc_list;
+	u8 mcast_addr[ETH_ALEN];
 };
 
 /**
-- 
2.34.1


