Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CB810D1489
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BW1hhmXXWTLU0JxQeAvbat9bJsdPkpNBSt+Ets8c1vc=; b=3fkba3jIMbfVLhhJvUTtqGESSQ
	ilN8+ZebZYtoGJ+iN9trMOC2DwpKu7/X1+DuJSCBz0jRSmnOS3v3nDiPqxUiWW8GvSzjbGRcVRlor
	EZVMGR2CsvOJjDZIuY9gsTiSl8r1w5Daq64ojlexem8G4EfKI8qr1vqtBgAaG8oYFXHrBdbHDa1fp
	/RF/BHwHA/WSVtQThiVzif9yy88gGuYCGny6YpOCO1VpTQ9/8Xyj7r6Y30JhD2xXEBzStpPQMbz8d
	/R302XxNO4K7+IzjuMYWsrI3rffXpGrEOKfZsec4vFIq9/d7TVKyDRInTVuQx6tjhkxPIKTg67d9p
	nRmAFGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bL9-00000009Jhs-0tXS;
	Sat, 28 Mar 2026 21:37:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bL1-00000009JeY-15ei
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 21:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BW1hhmXXWTLU0JxQeAvbat9bJsdPkpNBSt+Ets8c1vc=; b=MWTCshwQGA7nyqyfIrzSr69yBp
	PGajwaeP3i/NgsVO5jck8ZWH547IBneEu64GYq0VNux0ysnLIbsCxDj90eDn8nildZbHEZx+d/qBA
	yTHJu0sawC1x1SlytqfWkbfUDo1crg9kYf5pZ3esN/na69lufoIXA3NT568DNcGhPFzPY5CoD7+22
	usFqn1jdBKNrT9uhAt8V+L42WaUeRb8n3+qgT9UDZADVaciFfUjbvTYYGp80+p+FnwKqTvwl+wOi6
	ffZpgowJtPz8L7aqB8DncGRXBO6/hZp17BxQnIWTggxOZNTxaJAZOGBQTyGq1pkVAxvv8OHnjZxhr
	ndIVN20Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33086 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w6bKu-000000007S5-3odc;
	Sat, 28 Mar 2026 21:36:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w6bKu-0000000ELtr-0U6v;
	Sat, 28 Mar 2026 21:36:52 +0000
In-Reply-To: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 03/10] net: stmmac: move TSO VLAN tag insertion to
 core code
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w6bKu-0000000ELtr-0U6v@rmk-PC.armlinux.org.uk>
Date: Sat, 28 Mar 2026 21:36:52 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_143659_300346_7BF39CF7 
X-CRM114-Status: GOOD (  12.02  )
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
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e21ca1c70c6d..ed3e9515cf25 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4419,19 +4419,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
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
 
@@ -4932,6 +4919,14 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
 	features = vlan_features_check(skb, features);
 
 	if (skb_is_gso(skb)) {
+		/* Always insert VLAN tag to SKB payload for TSO frames.
+		 *
+		 * Never insert VLAN tag by HW, since segments split by
+		 * TSO engine will be un-tagged by mistake.
+		 */
+		features &= ~(NETIF_F_HW_VLAN_STAG_TX |
+			      NETIF_F_HW_VLAN_CTAG_TX);
+
 		/* STM32MP25xx (dwmac v5.3) states "Do not enable time-based
 		 * scheduling for channels on which the TSO feature is
 		 * enabled." If we have a skb for a channel which has TBS
-- 
2.47.3


