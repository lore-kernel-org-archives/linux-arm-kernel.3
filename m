Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE12ACAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCpqzQGO7r4Lt40+0awVktocqJSSgzZ+p7YBEBNue2k=; b=Y9i+PiNz2Kf2ljFbYXOWRxhL62
	2+m3SXjUb6bf49KRUHg5jLFCBeDnsLxoK7YPjA/UtWYrmDq3jF1PPo+pU7DmR9AUIC8PBTdBvqnGh
	C1rRkd5koD9R0meVqrzR3mCdpPIEkCPDkx5U5wfROvOfhDsDP1u9Pu6JEezynsXOxPQ8/sCdoR3Sj
	it7DOxPVVKa6/z8qc4dq2MLklefepop3GLOv6y8d+ajiTXvzswfm+BeZnbkdWmMQOm+fY4hZ0l3HI
	q0f3JlamDt4jdxdvpk2CH+4X1BArC8Ua/YXY0auhDduBMxL0MXogJ/3VV+BbzM8O0SbKccwz/KbFZ
	Jq2BvQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11A1-0000000DADw-3DiL;
	Tue, 23 Sep 2025 11:26:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v119z-0000000DABU-0IRw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tCpqzQGO7r4Lt40+0awVktocqJSSgzZ+p7YBEBNue2k=; b=G+O7iS2VT85kDkAUX1as4e5m7i
	d99dOb2XqMAFeVLNnb953OUhwGUKqpQpZVYgZrxnPOqFArY0+SzcWsEDc3DvphL9ODbP8tQcOCJ7O
	TK54Uh7jaryGQHOZM3U5AJZEM4SpSOK9kVs1XsLPmyV/8I8fBxnxXUaLDUOZ5qo2R1FsaYiwUyH9s
	B37iafufFT5GBhid+8H8cMr9cmAezoIwfONPDSx8WCNAndF923VMzuUL5xlM37E39isJcur/h0rID
	qdh8IWAOkuSJQJliCSWVp4ncaXhEKcdLJkqheMdLBqBSJfwesiV7ewZ61w+fTjsYATsIr32tS+cQZ
	6P7hVYHg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50756 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v119u-0000000078c-2Zi7;
	Tue, 23 Sep 2025 12:26:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v119t-00000007744-2SxG;
	Tue, 23 Sep 2025 12:26:09 +0100
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 3/6] net: stmmac: move PHY attachment error message
 into stmmac_init_phy()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v119t-00000007744-2SxG@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Sep 2025 12:26:09 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_042615_109412_B5EFD2AB 
X-CRM114-Status: GOOD (  13.45  )
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

Move the "cannot attach to PHY" error message into stmmac_init_phy()
so we don't end up with multiple error messages printed when things
go wrong. Drop the function name from the message, and use %pe to
print the error code description rather than just a number.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3b47d4ca24ca..8831bbda964c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1157,7 +1157,10 @@ static int stmmac_init_phy(struct net_device *dev)
 		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
 	}
 
-	if (ret == 0) {
+	if (ret) {
+		netdev_err(priv->dev, "cannot attach to PHY (error: %pe)\n",
+			   ERR_PTR(ret));
+	} else {
 		struct ethtool_keee eee;
 
 		/* Configure phylib's copy of the LPI timer. Normally,
@@ -3939,12 +3942,8 @@ static int __stmmac_open(struct net_device *dev,
 		priv->tx_lpi_timer = eee_timer * 1000;
 
 	ret = stmmac_init_phy(dev);
-	if (ret) {
-		netdev_err(priv->dev,
-			   "%s: Cannot attach to PHY (error: %d)\n",
-			   __func__, ret);
+	if (ret)
 		return ret;
-	}
 
 	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
 		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
-- 
2.47.3


