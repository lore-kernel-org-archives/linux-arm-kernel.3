Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF657CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rhJI7F0zU+E/8xsIkBIN5MZPJE26Grg+5HNG9FQ1W7Q=; b=LYCvZz0hMJIkE/WCpz0zJ1K1bI
	PNSRbmhHz4762TqC0aLV2lLYP45Md39j8g2h5ENGthSnL36J4GPZkuuXmkl3/9bOZGL8QWfHJjU7O
	Sjec1iMU7ILSJzvpQ0o/CGNEZti2LD25LNoo3BQiBa1/Fm9nak/HuCHC4wlkbNerXdXGHL0RGjYEk
	5y8W7IIY6ZjXjavS4dUmjIZQT6MQXAGqKhLIhw8Ii2hcByzKBYvp2D/4damPmpxQhh6kD85T3of2G
	9aK7xzBk+GsCyhBaSN8yH8NaWAExUQ7UY4lHIqgLjEMKwdQuZZBJTcBocP4Sf0NvQXK04DJU+f9sj
	Ueyt04DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfa9-00000002jAc-3DU0;
	Fri, 16 Oct 2026 10:54:37 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfa5-00000002j9E-4BmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rhJI7F0zU+E/8xsIkBIN5MZPJE26Grg+5HNG9FQ1W7Q=; b=2kAsX4y/5GbY0reGuaB8BzWyQE
	As/CswEbTraGIaIcVuHy6YLEFtKTdg2nXf7aHrJdoY0Wg2P6PgMeRtJHmcIE9LKy8mgEJ3ZMSTuDD
	gEaJvL66/pUVTQiBSnr5DfEHYExnLgKdFMp5oJUQB1OUt0u96veNd5zZI2AV1Z4QKb1nhIfa6KRUx
	5imqGV+rS6ZHyg9XovESgdDR9WIdIachTCkzINYniuXMT493bS2wNs9yEsKk11WfNHuzpph9DBVxN
	JbD1bv1tZOwIUerHu2iGfvZF1xpalL0ZVUsPhop0tLT5box48EfWyFJ07nFXHhBRHlF2CC58aDFPo
	FKZBqtSw==;
Received: from [115.246.246.98] (port=28851 helo=bulbasuar.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <saivarun@couthit.com>)
	id 1xHfZP-0000000FERK-27cF;
	Fri, 16 Oct 2026 06:53:51 -0400
From: Sai Varun Mudepally <saivarun@couthit.com>
To: danishanwar@ti.com,
	parvathi@couthit.com,
	rogerq@kernel.org,
	pmohan@couthit.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	afd@ti.com,
	basharath@couthit.com,
	horms@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pratheesh@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	j-rameshbabu@ti.com,
	m-malladi@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	mohan@couthit.com,
	Sai Varun Mudepally <saivarun@couthit.com>
Subject: [PATCH net-next] net: ti: icssm-prueth: use dev_close()/dev_open() in icssm_prueth_change_mode()
Date: Fri, 16 Oct 2026 16:21:35 +0530
Message-ID: <20261016105206.167094-1-saivarun@couthit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: saivarun@couthit.com
X-Authenticated-Sender: server.couthit.com: saivarun@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_035434_121870_E6E357BB 
X-CRM114-Status: GOOD (  14.39  )
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

In icssm_prueth_change_mode(), if ndev->netdev_ops->ndo_open(ndev) fails
and returns an error, the function aborts without restoring the NAPI state.
Later, when the interface is brought down, the kernel naturally invokes
ndo_stop() again. A second napi_disable() call on an already disabled NAPI
might trigger an infinite sleep waiting for NAPI_STATE_SCHED.

Use dev_close()/dev_open() so the core keeps IFF_UP consistent. If
dev_open() fails, close the ports already reopened and fall back to
EMAC mode.

Also undo the br_members update in icssm_prueth_ndev_port_link() when
icssm_prueth_port_offload_fwd_mark_update() fails.

Test Log:
https://gist.github.com/SaiVarun754/688a21038f1b2bd2b89d2db65224edb0

Fixes: eca327ae9aa6 ("net: ti: icssm-prueth: Add support for ICSSM RSTP switch")
Signed-off-by: Sai Varun Mudepally <saivarun@couthit.com>
---
 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 38 ++++++++++++++------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index b42c98e861e0..d50aa0992c33 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -1100,7 +1100,7 @@ static int icssm_prueth_change_mode(struct prueth *prueth,
 	bool portstatus[PRUETH_NUM_MACS];
 	struct prueth_emac *emac;
 	struct net_device *ndev;
-	int i, ret;
+	int i, j, ret;
 
 	for (i = 0; i < PRUETH_NUM_MACS; i++) {
 		if (!prueth->emac[i]) {
@@ -1115,11 +1115,7 @@ static int icssm_prueth_change_mode(struct prueth *prueth,
 		if (!portstatus[i])
 			continue;
 
-		ret = ndev->netdev_ops->ndo_stop(ndev);
-		if (ret < 0) {
-			netdev_err(ndev, "failed to stop: %d", ret);
-			return ret;
-		}
+		dev_close(ndev);
 	}
 
 	if (mode == PRUSS_ETHTYPE_EMAC || mode == PRUSS_ETHTYPE_SWITCH) {
@@ -1141,14 +1137,25 @@ static int icssm_prueth_change_mode(struct prueth *prueth,
 		if (!portstatus[i])
 			continue;
 
-		ret = ndev->netdev_ops->ndo_open(ndev);
+		ret = dev_open(ndev, NULL);
 		if (ret < 0) {
 			netdev_err(ndev, "failed to start: %d", ret);
-			return ret;
+			goto err_dev_open;
 		}
 	}
 
 	return 0;
+
+err_dev_open:
+	for (j = 0; j < i; j++) {
+		if (portstatus[j])
+			dev_close(prueth->emac[j]->ndev);
+	}
+
+	/* Fall back to EMAC mode */
+	prueth->eth_type = PRUSS_ETHTYPE_EMAC;
+
+	return ret;
 }
 
 /* VLAN-tag PCP to priority queue map for EMAC/Switch/HSR/PRP used by driver
@@ -1639,6 +1646,8 @@ bool icssm_prueth_sw_port_dev_check(const struct net_device *ndev)
 
 static int icssm_prueth_port_offload_fwd_mark_update(struct prueth *prueth)
 {
+	struct prueth_emac *emac;
+	unsigned long flags;
 	int set_val = 0;
 	int i, ret = 0;
 	u8 all_slaves;
@@ -1661,11 +1670,20 @@ static int icssm_prueth_port_offload_fwd_mark_update(struct prueth *prueth)
 	 */
 	if (set_val && !PRUETH_IS_SWITCH(prueth)) {
 		ret = icssm_prueth_change_mode(prueth, PRUSS_ETHTYPE_SWITCH);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(prueth->dev, "Failed to enable Switch mode\n");
-		else
+			emac = prueth->emac[0];
+			spin_lock_irqsave(&emac->addr_lock, flags);
+
+			prueth->br_members &= ~BIT(emac->port_id);
+			if (!prueth->br_members)
+				prueth->hw_bridge_dev = NULL;
+
+			spin_unlock_irqrestore(&emac->addr_lock, flags);
+		} else {
 			dev_info(prueth->dev,
 				 "TI PRU ethernet now in Switch mode\n");
+		}
 	}
 
 	/* Bridge is deleted, switch to Dual EMAC mode */
-- 
2.43.0


