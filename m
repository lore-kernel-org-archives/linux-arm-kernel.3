Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF4CFCB611
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJLp8YBkGvKp8/JnvM955cz2XdlMFg0G7oZa34dX7UE=; b=cqgjiLnjs5ZYWB3eD+pAxZ/rwg
	fceOFd5NKBq4RjloE2RlzecXE1GE/fMKxwc4oo6HDhQ71y8CHfWCpMynhWNqSOs558sw5NvVr0NMv
	oclJaRgAeaG19X8bxynDfLm9Ddril3aY1aIy6ajiW3+L89pxAQL9iDDrbo2qfh5NwOQw8ewWzA6i6
	RoQ4wIG94JoGNdNnomMo9FO9QlGQjpSd1JqQq9dFwVkiR5BvT/8YqzYJd3NxNy+Ft8XmeI5Ym5fxV
	rx5TxnBPzZOTC3NJgHnLIv9TXXDKFgfmjmwJVkqQykhay5rru5w2/0eFFqxr3+9+5BEr/uM1Ni6sv
	l/a+SxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWoV-00000003zYI-2C6V;
	Fri, 06 Mar 2026 15:10:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWoT-00000003zXr-3ktv;
	Fri, 06 Mar 2026 15:10:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84B0E44097;
	Fri,  6 Mar 2026 15:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE34BC4CEF7;
	Fri,  6 Mar 2026 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772809799;
	bh=GgoUw+SaJyllGA06GAIgRiDqdGje3nKOsdp/CsOdWJ8=;
	h=From:Date:Subject:To:Cc:From;
	b=DhzpAi3CoQh5QBzl/i/d0ZlPOmhmHdma6wDPKGaWVNqfKRIVkL/nQpuZXxFM7DYju
	 B6k33hBk3hwbOZiriTqAyAHNCWdvSyPrFH69MWcRZXxAkYWhaipgPU/1ysgvTlTeST
	 rWBcrdQAWyY4FVuzdWzoPbxqj3Pmr9QnLMbnnPEgNBZFMJ7abAx/1B4AGj/hMYLA3K
	 IxSt4T0GX6guNElx5WFN5Y9i6ojmdOR234wh7H7/LzsqANrd8NUxa+CmOyD27OAVw5
	 holmPDga0xVcX92eMoPbZL4DEh08kbdDbiZSK90a5zcxdSwTkN0cIu3m3wU1JwYFk/
	 4weKS5/UeLGYg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 06 Mar 2026 16:09:47 +0100
Subject: [PATCH net-next] net: airoha: Move GDM forward port configuration
 in ndo_open/ndo_stop callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-airoha-gdm-forward-ndo-open-stop-v1-1-7b7a20dd9ef0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NwQqDMAyA4VeRnBdoLbixVxkegomaw5qSDieI7
 27x+F3+/4AqrlLh3R3gsmlVyw3x0cG0Ul4ElZuhD/0QUhiQ1G0lXPiLs/mfnDGzoRXJWH9WMKY
 UJ4r8TPyClikus+734jOe5wVqSMRUcgAAAA==
X-Change-ID: 20260306-airoha-gdm-forward-ndo-open-stop-1331ca1d73d8
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_071001_995312_7743089E 
X-CRM114-Status: GOOD (  12.44  )
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

This change allows to set GDM forward port configuration to
FE_PSE_PORT_DROP stopping the network device. Hw design requires to stop
packet forwarding putting the interface down.  Moreover, PPE firmware
requires to use PPE1 for GDM3 or GDM4.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 09acbe6695368132ddd92c3501f8711476db73f6..dc36b5b669108cc32c4fd5a5479d9024978ceeba 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1611,6 +1611,7 @@ static int airoha_dev_open(struct net_device *dev)
 	int err, len = ETH_HLEN + dev->mtu + ETH_FCS_LEN;
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_qdma *qdma = port->qdma;
+	u32 pse_port = FE_PSE_PORT_PPE1;
 
 	netif_tx_start_all_queues(dev);
 	err = airoha_set_vip_for_gdm_port(port, true);
@@ -1634,6 +1635,14 @@ static int airoha_dev_open(struct net_device *dev)
 			GLOBAL_CFG_RX_DMA_EN_MASK);
 	atomic_inc(&qdma->users);
 
+	if (port->id == AIROHA_GDM2_IDX &&
+	    airoha_ppe_is_enabled(qdma->eth, 1)) {
+		/* For PPE2 always use secondary cpu port. */
+		pse_port = FE_PSE_PORT_PPE2;
+	}
+	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
+				    pse_port);
+
 	return 0;
 }
 
@@ -1651,6 +1660,9 @@ static int airoha_dev_stop(struct net_device *dev)
 	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++)
 		netdev_tx_reset_subqueue(dev, i);
 
+	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
+				    FE_PSE_PORT_DROP);
+
 	if (atomic_dec_and_test(&qdma->users)) {
 		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
 				  GLOBAL_CFG_TX_DMA_EN_MASK |
@@ -1742,7 +1754,7 @@ static int airoha_dev_init(struct net_device *dev)
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_qdma *qdma = port->qdma;
 	struct airoha_eth *eth = qdma->eth;
-	u32 pse_port, fe_cpu_port;
+	u32 fe_cpu_port;
 	u8 ppe_id;
 
 	airoha_set_macaddr(port, dev->dev_addr);
@@ -1763,7 +1775,7 @@ static int airoha_dev_init(struct net_device *dev)
 		if (airoha_ppe_is_enabled(eth, 1)) {
 			/* For PPE2 always use secondary cpu port. */
 			fe_cpu_port = FE_PSE_PORT_CDM2;
-			pse_port = FE_PSE_PORT_PPE2;
+			ppe_id = 1;
 			break;
 		}
 		fallthrough;
@@ -1772,13 +1784,11 @@ static int airoha_dev_init(struct net_device *dev)
 
 		/* For PPE1 select cpu port according to the running QDMA. */
 		fe_cpu_port = qdma_id ? FE_PSE_PORT_CDM2 : FE_PSE_PORT_CDM1;
-		pse_port = FE_PSE_PORT_PPE1;
+		ppe_id = 0;
 		break;
 	}
 	}
 
-	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(port->id), pse_port);
-	ppe_id = pse_port == FE_PSE_PORT_PPE2 ? 1 : 0;
 	airoha_fe_rmw(eth, REG_PPE_DFT_CPORT0(ppe_id),
 		      DFT_CPORT_MASK(port->id),
 		      __field_prep(DFT_CPORT_MASK(port->id), fe_cpu_port));

---
base-commit: e5e09233e8a9179b260460fdb28df5c24bcfbed6
change-id: 20260306-airoha-gdm-forward-ndo-open-stop-1331ca1d73d8

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


