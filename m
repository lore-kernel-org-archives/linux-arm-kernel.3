Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE46CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PDEQQVstFPjRei/ldFIp0/nQrs7re/PB3W4I/9pPKE=; b=Km9V2+MVzsSqRL8x8UHO5qOJsU
	HXITY/B3IEF8IEU2cio7WRbDt5tRCPrhpStHHsCUQsVJBnwMBi8Rawh0Pa6F+M2/d/C5LUSdaa3d1
	qXdAPEylheZK9o3XJCg3Or8Bfk6zlVg6+kFGN4b7o3GSNS8wKRj9x/2v3+sitoA1fKqiVKX3ljmTL
	mMSda8NIWNIZpPwRCQZ8AyHrG2jpWSNIiS+74VZEmYra0c2iVntqbqh+W4n8AIL52XdGXYhdm7Ot2
	ftk0SzCcm8+yNAIjhwXESEb3iTlGQibz7CKzy7s1r0Y+xfwGy3WLFth9gJkDIsfNGOqZ+mFW8mjrR
	3g/3JCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvHM-00000002hVN-2Sys;
	Fri, 15 Aug 2025 14:19:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsfo-00000002L9y-3Xwg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9PDEQQVstFPjRei/ldFIp0/nQrs7re/PB3W4I/9pPKE=; b=VVhPY4iK2GzN2+0hSxy3pLbO9t
	T3iD57j6s50is6c+bB+cgdhEb5LhPrf+gWbT//f07oaHYplyB7ki8TB/RRGWx2xDqEjSTKAsnwG6Y
	g2PhmJAdt5W2T8UYMDptpi3Kz+dET9atTzjrLLQC932UvlaenhP/RexFMxi9cn1YRZEPaezOdm6p4
	7lxJLlcgRGIjl66uX2+2MiVrL4+ElSJJqlPtd6tNGFqLOVNm9NC8264qdsiVOGJjzSZGjY9l++8ya
	14Q/RYy95YI0KPajAsAohU9wEnr8hUrE+5vsZzzzLYL+qFAq+Yh4NTK7Y93HiZ8S2SbRKv8umJS3u
	Aj+zq4kQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60688 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1umsfi-00011I-39;
	Fri, 15 Aug 2025 12:32:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1umsf0-008vKK-A3; Fri, 15 Aug 2025 12:31:50 +0100
In-Reply-To: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
References: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/7] net: stmmac: remove unnecessary checks in
 ethtool eee ops
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1umsf0-008vKK-A3@rmk-PC.armlinux.org.uk>
Date: Fri, 15 Aug 2025 12:31:50 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_043240_885269_EEDF4736 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

Phylink will check whether the MAC supports the LPI methods in
struct phylink_mac_ops, and return -EOPNOTSUPP if the LPI capabilities
are not provided. stmmac doesn't provide LPI capabilities if
priv->dma_cap.eee is not set.

Therefore, checking the state of priv->dma_cap.eee in the ethtool ops
and returning -EOPNOTSUPP is redundant - let phylink handle this.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 77758a7299b4..dda7ba1f524d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -852,9 +852,6 @@ static int stmmac_ethtool_op_get_eee(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!priv->dma_cap.eee)
-		return -EOPNOTSUPP;
-
 	return phylink_ethtool_get_eee(priv->phylink, edata);
 }
 
@@ -863,9 +860,6 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!priv->dma_cap.eee)
-		return -EOPNOTSUPP;
-
 	return phylink_ethtool_set_eee(priv->phylink, edata);
 }
 
-- 
2.30.2


