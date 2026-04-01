Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3F4D3514A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRM4MS7lMXrkCnlS5Wb2LjAcWP2fmJloN6RcG6v0ddU=; b=EBugpJ1Q5J9luOotJIInvUQLUs
	1ys1DxCI2TNfkfqMcAb2XR4rsKIv+jLgYucgZN6DbQanLB8BXTqOKZtnAyuhMjA6KBMKvBo3CPPfF
	r8ih8BN2IHvGcwOgDDrXCSFhhI17ucDaCj/YpwBgXen3Jj/Z22a5gjOLBMOXz7ieGHbXqrYeTq2YD
	IJnrGWrtT3c0DUcceqgPoG4kU9LdTKPijRvmdBmXXCfdrZdti0/YiOcpOu10kRRH1Nj9/pFiUdZNh
	INttsS5kmP1IcNeqoKxnwHDU9rcl6qChVhT3a0vD9Q54l6yDXMeZ8mFJvA1mcrsig1amz9/aIChjn
	I4kpEosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pta-0000000ECJM-34DG;
	Wed, 01 Apr 2026 07:21:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptY-0000000ECH1-34I8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yRM4MS7lMXrkCnlS5Wb2LjAcWP2fmJloN6RcG6v0ddU=; b=R41ryk/50ww9uiCE+0QbzGMg3w
	pf0RroFFHdyxgyDsoIHxiKoRxaK03owUMqaMcxoAmqmip9RUvA6FvgMy7rIWTL+bL9DKttO/qQvW0
	jpkpBw7pqiGLk5qQqnTHiq0kh4YxA9hKSxzl/UO6VV9dD+rMidgvhTDmvQ6pOTbHhKlWZP+FCVgkm
	W2C6Y6/HdiRoAikzD1VWw5tO/izSj9yLk+xLiCQfHxrZhZXX4rrQaRjZ2GaTbgfNToj55Q2of8c7k
	TS1O9MkuwGwEASKs1Ywlrzx8+7KMXOe9BXpLtT8V2QwC9uHdDdAUMobVDrpTldk8zoiGDLNq1b11s
	3IBCHWGQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35434 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7ptR-000000002ge-09rs;
	Wed, 01 Apr 2026 08:21:37 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7ptO-0000000EatC-39il;
	Wed, 01 Apr 2026 08:21:34 +0100
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
Subject: [PATCH net-next v2 05/14] net: stmmac: add TSO check for header
 length
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7ptO-0000000EatC-39il@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:21:34 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002144_774714_79B2C9D0 
X-CRM114-Status: GOOD (  13.18  )
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

According to the STM32MP151 documentation which covers dwmac v4.2, the
hardware TSO feature can handle header lengths up to a maximum of 1023
bytes.

Add a .ndo_features_check() method implementation to check the header
length meets these requirements, otherwise fall back to software GSO.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2b5bccc727a5..031ffb78f40d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4385,6 +4385,20 @@ static size_t stmmac_tso_header_size(struct sk_buff *skb)
 	return size;
 }
 
+/* STM32MP151 (dwmac v4.2) and STM32MP25xx (dwmac v5.3) states for TDES2 normal
+ * (read format) descriptor that the maximum header length supported for the
+ * TSO feature is 1023 bytes.
+ *
+ * While IPv4 is limited to MAC+VLAN+IPv4+ext+TCP+ext = 138 bytes, the IPv6
+ * extension headers aren't similarly limited.
+ */
+static bool stmmac_tso_valid_packet(struct sk_buff *skb)
+{
+	size_t header_len = stmmac_tso_header_size(skb);
+
+	return header_len <= 1023;
+}
+
 /**
  *  stmmac_tso_xmit - Tx entry point of the driver for oversized frames (TSO)
  *  @skb : the socket buffer
@@ -4945,7 +4959,8 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
 
 	if (skb_is_gso(skb)) {
 		queue = skb_get_queue_mapping(skb);
-		if (!stmmac_tso_channel_permitted(netdev_priv(dev), queue))
+		if (!stmmac_tso_channel_permitted(netdev_priv(dev), queue) ||
+		    !stmmac_tso_valid_packet(skb))
 			features &= ~NETIF_F_GSO_MASK;
 	}
 
-- 
2.47.3


