Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3166CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 21:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stGrY82aKe5uLMnCjPo+ZdhYWEfGQ/pjn9Tt68TrNls=; b=kW5ttl5KPGlG3G+PxNd8APNSIC
	jpfUTrVQaNcV8PTahfpyyPk/oVgYoZ3CRxq4Db+enXsobozCd7uXqzl866s+NByqKH4VYvI1utrZK
	PkP77+nXgIMrIcCsAxzQZOmOTsIdvHwZzxVYj8nQlruf/v7+z8x+qH7MHnRO5PahYuN7LC44Fc7i9
	xxXRXxkd2Mv1WcOPwVhrq/Yubo9/ERK5er5VGTQARtEoNJETE+7hNBiiEoc3xrX7lgFjuQD0vMmpU
	UgBd6Z4oQ1YVe2l8cZW/bvlrlYaCoIKfD4gF/2lJiVvIjdRQrCAtq0BCRE6S2TabA0PJZ9xoJwYTE
	rkdwk71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6BF-00000004uZb-1ywe;
	Thu, 07 May 2026 21:22:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6BD-00000004uUt-0MLX;
	Thu, 07 May 2026 21:22:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81E576024D;
	Thu,  7 May 2026 21:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB5DC2BCF6;
	Thu,  7 May 2026 21:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778188966;
	bh=Os92VRV6wobICRUxFOcie8IXUjdXaXgFHGkvzJXHi/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K2oPdcBqqRqUQxVUYraBRAGjBfZH+lrsqhW/DNBscoYQpMkB6aT5SbX5QTIe8hHhp
	 5XwpUx0PpHMbNWN77AZzgk9MBbtTAvf58MnLic1jWAAFCFnSxgi9UjZhWFEfKEici7
	 d8rrOsCt4BiyJxoFwT0+Sb86WWCs5b0uYnIaEMt13UwRqT+WuM0fpuclHKbPpgVI8A
	 3HRN28GDbDhDSU3KZZ6JHwSCmv2qP++0LI+VSR6iuS+HXz2XkurrmlMmCZwsLdRG16
	 bEVV1USypSFu4HqzBJYr3PGo/uqW43BdIBw8YbDkPZTK4t6dHN0ZE4tDTIhyaChVnk
	 GKDwa4p8nEeWw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 07 May 2026 23:21:51 +0200
Subject: [PATCH net-next v4 08/10] net: airoha: Do not stop GDM port if it
 is shared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-airoha-eth-multi-serdes-v4-8-af613b61ae02@kernel.org>
References: <20260507-airoha-eth-multi-serdes-v4-0-af613b61ae02@kernel.org>
In-Reply-To: <20260507-airoha-eth-multi-serdes-v4-0-af613b61ae02@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
X-Mailer: b4 0.14.3
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

Theoretically, in the current codebase, two independent net_devices can
be connected to the same GDM port so we need to check the GDM port is not
used by any other running net_device before setting the forward
configuration to FE_PSE_PORT_DROP.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 36 +++++++++++++++++++++++++-------
 drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 0253919714e0..1c4927c1aeb0 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1714,8 +1714,8 @@ static int airoha_dev_open(struct net_device *netdev)
 	int err, len = ETH_HLEN + netdev->mtu + ETH_FCS_LEN;
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
+	u32 cur_len, pse_port = FE_PSE_PORT_PPE1;
 	struct airoha_qdma *qdma = dev->qdma;
-	u32 pse_port = FE_PSE_PORT_PPE1;
 
 	netif_tx_start_all_queues(netdev);
 	err = airoha_set_vip_for_gdm_port(dev, true);
@@ -1729,10 +1729,14 @@ static int airoha_dev_open(struct net_device *netdev)
 		airoha_fe_clear(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
 				GDM_STAG_EN_MASK);
 
-	airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
-		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
-		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
-		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
+	cur_len = airoha_fe_get(qdma->eth, REG_GDM_LEN_CFG(port->id),
+				GDM_LONG_LEN_MASK);
+	if (!atomic_read(&port->users) || len > cur_len)
+		airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
+			      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
+			      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
+			      FIELD_PREP(GDM_LONG_LEN_MASK, len));
+	atomic_inc(&port->users);
 
 	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
 			GLOBAL_CFG_TX_DMA_EN_MASK |
@@ -1762,8 +1766,12 @@ static int airoha_dev_stop(struct net_device *netdev)
 	for (i = 0; i < netdev->num_tx_queues; i++)
 		netdev_tx_reset_subqueue(netdev, i);
 
-	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
-				    FE_PSE_PORT_DROP);
+	if (atomic_dec_and_test(&port->users)) {
+		airoha_set_vip_for_gdm_port(dev, false);
+		airoha_set_gdm_port_fwd_cfg(qdma->eth,
+					    REG_GDM_FWD_CFG(port->id),
+					    FE_PSE_PORT_DROP);
+	}
 
 	if (atomic_dec_and_test(&qdma->users)) {
 		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
@@ -1915,10 +1923,22 @@ static void airoha_dev_get_stats64(struct net_device *netdev,
 static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	u32 cur_len, len = ETH_HLEN + mtu + ETH_FCS_LEN;
 	struct airoha_gdm_port *port = dev->port;
-	u32 len = ETH_HLEN + mtu + ETH_FCS_LEN;
 	struct airoha_eth *eth = dev->eth;
 
+	cur_len = airoha_fe_get(eth, REG_GDM_LEN_CFG(port->id),
+				GDM_LONG_LEN_MASK);
+	if (len < cur_len) {
+		u8 port_refcnt = atomic_read(&port->users);
+
+		/* We can decrease the device MTU just if the GDM port is
+		 * not shared or if the other device is not running.
+		 */
+		if (port_refcnt > 1 || (port_refcnt && !netif_running(netdev)))
+			return -EBUSY;
+	}
+
 	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
 		      GDM_LONG_LEN_MASK,
 		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 207c75152fde..3a313ac439e7 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -553,6 +553,8 @@ struct airoha_gdm_port {
 	struct airoha_gdm_dev *devs[AIROHA_MAX_NUM_GDM_DEVS];
 	int id;
 
+	atomic_t users;
+
 	struct airoha_hw_stats stats;
 
 	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];

-- 
2.54.0


