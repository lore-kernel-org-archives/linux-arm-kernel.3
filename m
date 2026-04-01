Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1B8D3514A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obyR8ec27qCSiO/J/J/rtAZWsF0bTjTDR8UxLRlkwlA=; b=a3oy625fUQnu2OVcHFdN5P7Aik
	XrYeVk2fCbGT+9QGkQ5rIQY4CymX+j/nAm1T0tsYN9RWxvBYTEyoltognCqF/N5A+/T7ty5j3M3Vc
	bZ2vyhWojHJS0YtZZJCYan9YQp2+Pc6QrM7Xs2GCubOZaajZSe9ml6WSDfhlivTT6pC27aX8rgLxO
	zmgrFE9LXy0dcoE7K7FX8mWJFL37XfZ3K6aMogryDVyBCOqTGEGF/6rvBQx02L0AQl8BPWOZdag0j
	rEvGrde9jtSQBqk8xzmniERfYHfTiI5tUCAZ4cRrvcQkm9m1whJrOU4vq/HWFrrj5vGOqRCP71JVp
	s+UBqmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptk-0000000ECPr-3i8A;
	Wed, 01 Apr 2026 07:21:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pti-0000000ECMJ-15V5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:21:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=obyR8ec27qCSiO/J/J/rtAZWsF0bTjTDR8UxLRlkwlA=; b=GD+4iJgY3j7MqFWwgm6hsHb8Qt
	PdOzNsVoknKOQmaXD0WUEv8yJgSs5KRx/O1MIe3MKVotRreYEm9ZVQb9sdnu6idoal9aMPnrEv3Qh
	gsdi8Fi/Zx+wJ/DQ6E2G2PyxuTt1CXLHmwC37K9PSoRdJ5eUkMyRutQejVHtJ8Iv7QSp3mvssw7d5
	vS24aVM3Ii9FCX+u2/AlJwfBPBTlyORwHOalb5NP336oGUP6giO0Af2/+Ye/yTOAMVLshS5/owoQx
	BvVeqhJqHmpGbY0YXxyDnDO7bcA+OhejEYl0RVdz/5hTOk791FMun9ZWgx8dcYzktqzQrTR5KzFVm
	GZvQIgOQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41322 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7pta-000000002hD-49Kw;
	Wed, 01 Apr 2026 08:21:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7ptY-0000000EatO-42Qv;
	Wed, 01 Apr 2026 08:21:44 +0100
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 07/14] net: stmmac: move TSO VLAN tag insertion to
 core code
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7ptY-0000000EatO-42Qv@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:21:44 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002154_299633_083EA57C 
X-CRM114-Status: GOOD (  12.96  )
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

stmmac_tso_xmit() checks whether the skbuff is trying to offload
vlan tag insertion to hardware, which from the comment in the code
appears to be buggy when the TSO feature is used.

Rather than stmmac_tso_xmit() inserting the VLAN tag, handle this
in stmmac_features_check() which will then use core net code to
handle this. See net/core/dev.c::validate_xmit_skb()

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b4cc34dd0d76..c67f042a90af 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4456,19 +4456,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	u8 proto_hdr_len, hdr;
 	dma_addr_t des;
 
-	/* Always insert VLAN tag to SKB payload for TSO frames.
-	 *
-	 * Never insert VLAN tag by HW, since segments split by
-	 * TSO engine will be un-tagged by mistake.
-	 */
-	if (skb_vlan_tag_present(skb)) {
-		skb = __vlan_hwaccel_push_inside(skb);
-		if (unlikely(!skb)) {
-			priv->xstats.tx_dropped++;
-			return NETDEV_TX_OK;
-		}
-	}
-
 	nfrags = skb_shinfo(skb)->nr_frags;
 	queue = skb_get_queue_mapping(skb);
 
@@ -4969,6 +4956,16 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
 		if (!stmmac_tso_channel_permitted(netdev_priv(dev), queue) ||
 		    !stmmac_tso_valid_packet(skb))
 			features &= ~NETIF_F_GSO_MASK;
+
+		/* If we are going to be using hardware TSO, always insert
+		 * VLAN tag to SKB payload for TSO frames.
+		 *
+		 * Never insert VLAN tag by HW, since segments split by
+		 * TSO engine will be un-tagged by mistake.
+		 */
+		if (features & NETIF_F_GSO_MASK)
+			features &= ~(NETIF_F_HW_VLAN_STAG_TX |
+				      NETIF_F_HW_VLAN_CTAG_TX);
 	}
 
 	return vlan_features_check(skb, features);
-- 
2.47.3


