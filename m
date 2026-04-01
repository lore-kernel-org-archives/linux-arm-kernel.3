Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D62D3514A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUdV/Cp/qxe1fQKowTisXB34L6Mv5w3TPP0xHN1PcWs=; b=DTIat50P8+cDb2rfk4wl69FHCa
	a6b3s2mBlvL4PI4UIvpnDbQwApASYVHvFuqdAK68K+tC10Hvh4q8UtLH3cLeH+h/WNsWeXcSOelDv
	jER0penNJpNXGjhTaU1fqE1Dl9d7CXL3Fp0EzQ4FIHLYcr6hMaH5Mh4kQ9PWz/Qks46y6gg+BNgbM
	BoEFC2SdjmAbzhksk+zkCCRrSSTFGQe27K6kksZCTlfmWxQET3jlU484s6t0f4ncTOqThcTL1e2k1
	/iFcHOcicc9Yg/bNT3Dm0wedF5H/VKta+LeipmcMFS1srhD4dAUTe/sxG/LHNwohpyelA5WfoUt0t
	WYN+HGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptU-0000000ECFr-3zYV;
	Wed, 01 Apr 2026 07:21:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptR-0000000ECEG-2V6b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fUdV/Cp/qxe1fQKowTisXB34L6Mv5w3TPP0xHN1PcWs=; b=K9A/RUO5iQ35wYDtpWxiOnWZc0
	iSgtMaObbdEcvD/LsOV2XELiLf3kVSnblbB3w+FiB2GmTsAw55VomPzFCFc7pSl5hNNOJ7++qAY48
	0A8w9ecRSS+q/17DEX6GHmDAjXVrpaK93xbcfAtaWU7MRHris6bWdHlUz0Mx9Vug+yp2rTUIwg0Tn
	9yKZXsNr+hvmyo7GTVlZdsXwCik6wmL5bQfg1+PynfB5Bw7WNeRYBggcZYAJwRmVd7lNGMDAkzGQA
	sRoXVvw6vCrNFs70tbcWWRpKgJjWNXPjpv2532MCVxmGAR6rtvO8iG8YsTJdi/Uecv5bABzvsEVx9
	3N+vBYbw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35430 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7ptK-000000002gJ-2aWD;
	Wed, 01 Apr 2026 08:21:30 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7ptJ-0000000Eat5-2ZlA;
	Wed, 01 Apr 2026 08:21:29 +0100
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
Subject: [PATCH net-next v2 04/14] net: stmmac: add stmmac_tso_header_size()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7ptJ-0000000Eat5-2ZlA@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:21:29 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002138_682778_7BFB54D6 
X-CRM114-Status: GOOD (  13.77  )
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

We will need to compute the size of the protocol headers in two places,
so move this into a separate function.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 890a1efb8733..2b5bccc727a5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4373,6 +4373,18 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
 	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
 }
 
+static size_t stmmac_tso_header_size(struct sk_buff *skb)
+{
+	size_t size;
+
+	if (skb_shinfo(skb)->gso_type & SKB_GSO_UDP_L4)
+		size = skb_transport_offset(skb) + sizeof(struct udphdr);
+	else
+		size = skb_tcp_all_headers(skb);
+
+	return size;
+}
+
 /**
  *  stmmac_tso_xmit - Tx entry point of the driver for oversized frames (TSO)
  *  @skb : the socket buffer
@@ -4444,13 +4456,11 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	first_tx = tx_q->cur_tx;
 
 	/* Compute header lengths */
-	if (skb_shinfo(skb)->gso_type & SKB_GSO_UDP_L4) {
-		proto_hdr_len = skb_transport_offset(skb) + sizeof(struct udphdr);
+	proto_hdr_len = stmmac_tso_header_size(skb);
+	if (skb_shinfo(skb)->gso_type & SKB_GSO_UDP_L4)
 		hdr = sizeof(struct udphdr);
-	} else {
-		proto_hdr_len = skb_tcp_all_headers(skb);
+	else
 		hdr = tcp_hdrlen(skb);
-	}
 
 	/* Desc availability based on threshold should be enough safe */
 	if (unlikely(stmmac_tx_avail(priv, queue) <
-- 
2.47.3


