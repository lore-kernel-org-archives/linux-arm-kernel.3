Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F75C10D1489
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 21:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmtvPeRClGsN+/hlvuBTyHk3INo2YZVmRU3ck+rUhCs=; b=VOFFHRgSHkEtHGGf8tfFsB6hQ7
	/98wzyBhpHNnMml39/0PBePbycuYJIi25vEJeU/wkjfKggXf3dYxB1KwXr6iP+GpA5eNX5T0d0Ih6
	Pc+zPRqKmW9brp+MWv6KZMq56vyOllB5yhWW/X9sMyFJ1HCo9jIOvPY7t36Ar1N/5EU42yds9dVfm
	tbwK5YR7h5nUZfI28xKxL44jSSbTHi6DTrH1hebPr7hAA52ToZEUg5pAv/+l2xGw1iK1Ca9bxx7UW
	SmkX3yPihL4KjCLPEgvfow89c0OcGldAccZJXpCIVOhAP3DJw+w1sQNjC9jCo6dfnCC5GlfzJ7k3N
	M3mnejWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bL9-00000009JiE-2BqM;
	Sat, 28 Mar 2026 21:37:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bL6-00000009Jgh-1pwC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 21:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rmtvPeRClGsN+/hlvuBTyHk3INo2YZVmRU3ck+rUhCs=; b=tlTxbXa0QYHZ1gRYH1n8rWFkla
	8FOMQMbZPMJKiefnidsY+JnRN4bRYh/8VlBq90q6rjd1kN0PxgwiY4AAgHBJK9Cw42qy/Nggabzmo
	JqJSzLhTvE7iUA6ijyryeNg+iSpFgfu2xTfVw+rD5rA5BVK+B1i1IVFa87PcPI67YjZUMvxVPw4CK
	n9Exc8lvm/xJWGnF+glcd7eaJYknBl/Lbo7lxhKPFwyCuf/m//kaUM4FMvt5+3+gd/CxtBEBweB2a
	V3HCJAoeKgcJbDn3qqIajwlYvT2rWxtqGZQWM6N+F6VDXbl63OhnISKzwUqR1DJKee951eMzWhqf/
	mftjyjyw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33096 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w6bL0-000000007SS-1u9s;
	Sat, 28 Mar 2026 21:36:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w6bKz-0000000ELtx-0rYr;
	Sat, 28 Mar 2026 21:36:57 +0000
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
Subject: [PATCH net-next 04/10] net: stmmac: always enable channel TSO when
 supported
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w6bKz-0000000ELtx-0rYr@rmk-PC.armlinux.org.uk>
Date: Sat, 28 Mar 2026 21:36:57 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_143704_482053_21A502D2 
X-CRM114-Status: GOOD (  12.92  )
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

Rather than configuring the channels depending on whether GSO/TSO is
currently enabled by the user, always enable if the hardware has
TSO support and the platform wants TSO to be enabled.

This avoids TSO being disabled on a channel over a suspend/resume
when the user has disabled TSO features, and then the hardware
misbehaves when TSO is re-enabled.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ed3e9515cf25..f500fcc17ce5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3712,7 +3712,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	stmmac_set_rings_length(priv);
 
 	/* Enable TSO */
-	if (priv->tso) {
+	if (priv->dma_cap.tsoen && priv->plat->flags & STMMAC_FLAG_TSO_EN) {
 		for (chan = 0; chan < tx_cnt; chan++) {
 			if (!stmmac_channel_tso_permitted(priv, chan))
 				continue;
-- 
2.47.3


