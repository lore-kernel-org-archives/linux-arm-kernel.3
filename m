Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C810E10FC456
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 23:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4XULHe8enbUXLuiBFqQ5XoeR/9dws/Rh24z9BiTHJN4=; b=ColWUT57Ah/LvC01K46cUGf0RF
	kgbygUWxZioqXK6Ce+wAzZ058bgl16asAdjPwlkQUpQnFEQ25Q0APC8SUgOvqE9LB7+0MHqfoDYRi
	rWklXnf3VtcCfyVseSiOzXD7ORf0p7VqnzRt8XPHvjW0cY21hf9z6+GbXOD9Ks60Dm1Xm27qHaZkP
	Q+nK99myB77ePlTy6S9X4Z6yXiwJXt6K0VEq80Ahi0swUtFDClnOnFBfWEt10Vm8Zi7BeiXR38hDw
	J2SkQcE6vIr7Q/V8+giZTOkpqbu8aU9Zn78IX0i6Dh/JSkXA3omaBUsOp28htR9TLfnWFLlwfr5fF
	dUJ34twA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAcPb-00000009WQZ-0F8Y;
	Wed, 08 Apr 2026 23:34:19 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAcPY-00000009WQB-27Oe;
	Wed, 08 Apr 2026 23:34:17 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wAcPF-000000004lk-2YmF;
	Wed, 08 Apr 2026 23:33:57 +0000
Date: Thu, 9 Apr 2026 00:33:47 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chad Monroe <chad.monroe@adtran.com>, Elad Yifee <eladwf@gmail.com>,
	=?iso-8859-1?Q?Jo=E3o?= Duarte <du@rte.pm>,
	John Crispin <john@phrozen.org>
Subject: [PATCH net] net: ethernet: mtk_eth_soc: initialize PPE per-tag-layer
 MTU registers
Message-ID: <164435c1de5b4ccfd773ee623ad1bc65b5366250.1775690659.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_163416_548201_CA31BDEB 
X-CRM114-Status: GOOD (  18.15  )
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

The PPE enforces output frame size limits via per-tag-layer VLAN_MTU
registers that the driver never initializes. The hardware defaults do
not account for PPPoE overhead, causing the PPE to punt encapsulated
frames back to the CPU instead of forwarding them.

Initialize the registers at PPE start and on MTU changes using the
maximum GMAC MTU. This is a conservative approximation -- the actual
per-PPE requirement depends on egress path, but using the global
maximum ensures the limits are never too small.

Fixes: ba37b7caf1ed2 ("net: ethernet: mtk_eth_soc: add support for initializing the PPE")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 ++++++++++++++-
 drivers/net/ethernet/mediatek/mtk_ppe.c     | 30 +++++++++++++++++++++
 drivers/net/ethernet/mediatek/mtk_ppe.h     |  1 +
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 1767463475de4..06880fa86f0ea 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3922,12 +3922,23 @@ static int mtk_device_event(struct notifier_block *n, unsigned long event, void
 	return NOTIFY_DONE;
 }
 
+static int mtk_max_gmac_mtu(struct mtk_eth *eth)
+{
+	int i, max_mtu = ETH_DATA_LEN;
+
+	for (i = 0; i < ARRAY_SIZE(eth->netdev); i++)
+		if (eth->netdev[i] && eth->netdev[i]->mtu > max_mtu)
+			max_mtu = eth->netdev[i]->mtu;
+
+	return max_mtu;
+}
+
 static int mtk_open(struct net_device *dev)
 {
 	struct mtk_mac *mac = netdev_priv(dev);
 	struct mtk_eth *eth = mac->hw;
 	struct mtk_mac *target_mac;
-	int i, err, ppe_num;
+	int i, err, ppe_num, mtu;
 
 	ppe_num = eth->soc->ppe_num;
 
@@ -3974,6 +3985,10 @@ static int mtk_open(struct net_device *dev)
 			mtk_gdm_config(eth, target_mac->id, gdm_config);
 		}
 
+		mtu = mtk_max_gmac_mtu(eth);
+		for (i = 0; i < ARRAY_SIZE(eth->ppe); i++)
+			mtk_ppe_update_mtu(eth->ppe[i], mtu);
+
 		napi_enable(&eth->tx_napi);
 		napi_enable(&eth->rx_napi[0].napi);
 		mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
@@ -4788,6 +4803,7 @@ static int mtk_change_mtu(struct net_device *dev, int new_mtu)
 	int length = new_mtu + MTK_RX_ETH_HLEN;
 	struct mtk_mac *mac = netdev_priv(dev);
 	struct mtk_eth *eth = mac->hw;
+	int max_mtu, i;
 
 	if (rcu_access_pointer(eth->prog) &&
 	    length > MTK_PP_MAX_BUF_SIZE) {
@@ -4798,6 +4814,10 @@ static int mtk_change_mtu(struct net_device *dev, int new_mtu)
 	mtk_set_mcr_max_rx(mac, length);
 	WRITE_ONCE(dev->mtu, new_mtu);
 
+	max_mtu = mtk_max_gmac_mtu(eth);
+	for (i = 0; i < ARRAY_SIZE(eth->ppe); i++)
+		mtk_ppe_update_mtu(eth->ppe[i], max_mtu);
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 79c11e179d894..9e829a2e4354e 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -973,6 +973,36 @@ static void mtk_ppe_init_foe_table(struct mtk_ppe *ppe)
 	}
 }
 
+void mtk_ppe_update_mtu(struct mtk_ppe *ppe, int mtu)
+{
+	int base;
+	u32 val;
+
+	if (!ppe)
+		return;
+
+	/* The PPE checks output frame size against per-tag-layer MTU limits,
+	 * treating PPPoE and DSA tags just like 802.1Q VLAN tags. The Linux
+	 * device MTU already accounts for PPPoE (PPPOE_SES_HLEN) and DSA tag
+	 * overhead, but 802.1Q VLAN tags are handled transparently without
+	 * being reflected by the lower device MTU being increased by 4.
+	 * Use the maximum MTU across all GMAC interfaces so that PPE output
+	 * frame limits are sufficiently high regardless of which port a flow
+	 * egresses through.
+	 */
+	base = ETH_HLEN + mtu;
+
+	val = FIELD_PREP(MTK_PPE_VLAN_MTU0_NONE, base) |
+	      FIELD_PREP(MTK_PPE_VLAN_MTU0_1TAG, base + VLAN_HLEN);
+	ppe_w32(ppe, MTK_PPE_VLAN_MTU0, val);
+
+	val = FIELD_PREP(MTK_PPE_VLAN_MTU1_2TAG,
+			 base + 2 * VLAN_HLEN) |
+	      FIELD_PREP(MTK_PPE_VLAN_MTU1_3TAG,
+			 base + 3 * VLAN_HLEN);
+	ppe_w32(ppe, MTK_PPE_VLAN_MTU1, val);
+}
+
 void mtk_ppe_start(struct mtk_ppe *ppe)
 {
 	u32 val;
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index 223f709e2704f..ba85e39a155bf 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -346,6 +346,7 @@ struct mtk_ppe {
 struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, void __iomem *base, int index);
 
 void mtk_ppe_deinit(struct mtk_eth *eth);
+void mtk_ppe_update_mtu(struct mtk_ppe *ppe, int mtu);
 void mtk_ppe_start(struct mtk_ppe *ppe);
 int mtk_ppe_stop(struct mtk_ppe *ppe);
 int mtk_ppe_prepare_reset(struct mtk_ppe *ppe);
-- 
2.53.0

