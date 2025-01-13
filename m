Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13469E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2KOzFqn83lW4a3mHaCjytJhPLElKdN8kLiBUf4B0I4=; b=f5fDnzaiHMwL2BSZeRSaSGQpOj
	VjgnC+vvnwN3rM0cdP+TPMjmqtJ1VWEv+29vfXw5ChpjpLd1b748ri6p04rmxNFHQrxHvlTpgfM6T
	bUehq9FXsu0yx9sRgSyFh7yvmCDU4P++PzH3cG5V3O6ji+mj922jEhFPsEArf0u7FlTCrle8/JQnd
	TVai4vcbLRq9roX6W+GYfIOmwDV3bQ7E2Tuh21tGjqXKXeJxF2G7IbnWO6V0a6DHBNiCgOYl6SrI7
	8IT3l2MXHI6F7st51dwFwy70DJEOmC3XeBa7RW4sRowRoY3SXVYHX5IGkD6jNKg/vlUzJems4A9rd
	GpLYHBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIw0-00000004z8e-0VGl;
	Mon, 13 Jan 2025 11:48:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXItR-00000004ycR-3SJb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j2KOzFqn83lW4a3mHaCjytJhPLElKdN8kLiBUf4B0I4=; b=RUHTTJZqJrk0CCmh22e+l3R+5s
	NB+oPZZlDpOwO2PqT6nUFUg1NP0YzZ2Vrjh8N6KUOHjsPSKdcOoGwpTP5uSunlZg6bEGCDJqtqGft
	KT0MgaOFNyUMAyhk2qOyYN+ZqDGpmWVBXNrxDKFUqZjhfJ0/EBTdMf6GNv/rN1HPLGZWUgUYyhwUv
	Ngel/p0VnzpRTFjNSPzaqFdBG13RXBoHjgwLD3m26mWFm8/tkC91FkeFbhAbOc1n7ecihxMEan0c4
	sADt6THDOuO9LJIecu3RpTRcqt8B5f5sA3e0Pn9HbWbq9oN9OQkusUdbmqmIQOmK6U0GiUJWUGw1f
	i7PjfzjA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49190 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXItK-0006Uw-2a;
	Mon, 13 Jan 2025 11:45:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXIt1-000MAu-TE; Mon, 13 Jan 2025 11:45:39 +0000
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 1/9] net: stmmac: rename stmmac_disable_sw_eee_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXIt1-000MAu-TE@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:45:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034605_859866_51C81BE7 
X-CRM114-Status: GOOD (  11.87  )
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

stmmac_disable_sw_eee_mode() was not a good choice for this functions
purpose - which is to stop transmitting LPI because we want to send a
packet. Rename it to stmmac_stop_sw_lpi().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 58b013528dea..8130b0f614d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -427,12 +427,11 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
 }
 
 /**
- * stmmac_disable_sw_eee_mode - disable and exit from LPI mode
+ * stmmac_stop_sw_lpi - stop transmitting LPI
  * @priv: driver private structure
- * Description: this function is to exit and disable EEE in case of
- * LPI state is true. This is called by the xmit.
+ * Description: When using software-controlled LPI, stop transmitting LPI state.
  */
-static void stmmac_disable_sw_eee_mode(struct stmmac_priv *priv)
+static void stmmac_stop_sw_lpi(struct stmmac_priv *priv)
 {
 	stmmac_reset_eee_mode(priv, priv->hw);
 	del_timer_sync(&priv->eee_ctrl_timer);
@@ -4497,7 +4496,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	first_tx = tx_q->cur_tx;
 
 	if (priv->tx_path_in_lpi_mode && priv->eee_sw_timer_en)
-		stmmac_disable_sw_eee_mode(priv);
+		stmmac_stop_sw_lpi(priv);
 
 	/* Manage oversized TCP frames for GMAC4 device */
 	if (skb_is_gso(skb) && priv->tso) {
-- 
2.30.2


