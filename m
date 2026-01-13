Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7893DD29DC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 03:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=045EkAASI/mKzK5SIAJvk1GCcho1g4V28O3azTzPzCI=; b=05Dn85NgPPhtLLWIs1vaxlAmhd
	+OkeH3AzCXousv2VYokYenOxJK08r+v9NnAFeNCDtUQw6uJGwJ0MkF4CmI22lGlUtj38pPjTtCcxV
	ISpw/RxKtpoGKr/5aVTutFQqJnRBp0/wP8CODViF/29uGXamAnuLmgj6Q/8jx2sJIXUpKzrIdeyyj
	Arq2V63NnCcN4X1hHAN2SxcLdwgtgCd1by0kal3LopO7qahlgpLEJT+hdXTgZ7RioAge4DubjuHt8
	HB1UI5Uyevc8tMDbJKeksIQA+fBXZY6ltjA3UabN8Ls+YH4k0kZL6j4l5YDSflchbmXAJBBfUJXqJ
	dlvXSVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUpO-00000006TBS-12WT;
	Tue, 13 Jan 2026 03:12:19 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUpK-00000006TB4-2xRY;
	Tue, 13 Jan 2026 03:12:16 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1vfUp4-000000001Go-14dU;
	Tue, 13 Jan 2026 03:11:58 +0000
Date: Tue, 13 Jan 2026 03:11:54 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bc-bocun Chen <bc-bocun.chen@mediatek.com>,
	Rex Lu <rex.lu@mediatek.com>,
	Mason-cw Chang <Mason-cw.Chang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next RFC] net: ethernet: mtk_eth_soc: support using
 non-MediaTek DSA switches
Message-ID: <34647edacab660b4cabed9733d2d3ef22bc041ac.1768273593.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_191214_753274_E6CF23F3 
X-CRM114-Status: GOOD (  11.19  )
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

MediaTek's Ethernet Frame Engine is tailored for use with their
switches. This broke checksum and VLAN offloading when attaching a
DSA switch which does not use MediaTek special tag format.

As a work-around, make sure checksum offloading is disabled and
make sure bits instructing the FE to parse or modify MTK special
tags aren't set if the attached DSA switch isn't using the
MediaTek special tag format.

Note that this currently also disables checksum and VLAN offloading
when using DSA switches using 802.1Q-based tags, though that those
do work fine and can benefit from the offloading features of the
Ethernet Frame Engine. This is why more feedback from DSA maintainers
regarding this issue would be very welcome.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 44 +++++++++++++++------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e68997a29191b..654b707ee27a1 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1459,6 +1459,26 @@ static void setup_tx_buf(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
 	}
 }
 
+static bool mtk_uses_dsa(struct net_device *dev)
+{
+#if IS_ENABLED(CONFIG_NET_DSA)
+	return netdev_uses_dsa(dev) &&
+	       dev->dsa_ptr->tag_ops->proto == DSA_TAG_PROTO_MTK;
+#else
+	return false;
+#endif
+}
+
+static bool non_mtk_uses_dsa(struct net_device *dev)
+{
+#if IS_ENABLED(CONFIG_NET_DSA)
+	return netdev_uses_dsa(dev) &&
+	       dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK;
+#else
+	return false;
+#endif
+}
+
 static void mtk_tx_set_dma_desc_v1(struct net_device *dev, void *txd,
 				   struct mtk_tx_dma_desc_info *info)
 {
@@ -1531,7 +1551,7 @@ static void mtk_tx_set_dma_desc_v2(struct net_device *dev, void *txd,
 		/* tx checksum offload */
 		if (info->csum)
 			data |= TX_DMA_CHKSUM_V2;
-		if (mtk_is_netsys_v3_or_greater(eth) && netdev_uses_dsa(dev))
+		if (mtk_is_netsys_v3_or_greater(eth) && mtk_uses_dsa(dev))
 			data |= TX_DMA_SPTAG_V3;
 	}
 	WRITE_ONCE(desc->txd5, data);
@@ -2350,7 +2370,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		 * hardware treats the MTK special tag as a VLAN and untags it.
 		 */
 		if (mtk_is_netsys_v1(eth) && (trxd.rxd2 & RX_DMA_VTAG) &&
-		    netdev_uses_dsa(netdev)) {
+		    mtk_uses_dsa(netdev)) {
 			unsigned int port = RX_DMA_VPID(trxd.rxd3) & GENMASK(2, 0);
 
 			if (port < ARRAY_SIZE(eth->dsa_meta) &&
@@ -3192,6 +3212,14 @@ static netdev_features_t mtk_fix_features(struct net_device *dev,
 		}
 	}
 
+	if ((features & NETIF_F_IP_CSUM) &&
+	    non_mtk_uses_dsa(dev))
+		features &= ~NETIF_F_IP_CSUM;
+
+	if ((features & NETIF_F_IPV6_CSUM) &&
+	    non_mtk_uses_dsa(dev))
+		features &= ~NETIF_F_IPV6_CSUM;
+
 	return features;
 }
 
@@ -3508,23 +3536,13 @@ static void mtk_gdm_config(struct mtk_eth *eth, u32 id, u32 config)
 
 	val |= config;
 
-	if (eth->netdev[id] && netdev_uses_dsa(eth->netdev[id]))
+	if (eth->netdev[id] && mtk_uses_dsa(eth->netdev[id]))
 		val |= MTK_GDMA_SPECIAL_TAG;
 
 	mtk_w32(eth, val, MTK_GDMA_FWD_CFG(id));
 }
 
 
-static bool mtk_uses_dsa(struct net_device *dev)
-{
-#if IS_ENABLED(CONFIG_NET_DSA)
-	return netdev_uses_dsa(dev) &&
-	       dev->dsa_ptr->tag_ops->proto == DSA_TAG_PROTO_MTK;
-#else
-	return false;
-#endif
-}
-
 static int mtk_device_event(struct notifier_block *n, unsigned long event, void *ptr)
 {
 	struct mtk_mac *mac = container_of(n, struct mtk_mac, device_notifier);
-- 
2.52.0

