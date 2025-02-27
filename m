Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD04C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwqVamQlIMiTRup9spj3AiZP8ueBDS1xeBFA9CjA03A=; b=4vb5m7oq+EsfwvYpjEHIlP3+9c
	C5KW8UDm47oou/i5C5COyWuJInPrFOktWjEFVHHsFL+0FXk00/S19K69gxd9fEys3dREydkQEo1CT
	QlOyihuiKSsKQSI2CI01YUYGT4BkqRv1p5X5Ni62wFGaae4AYRWcDdatLf1TW9WKU0/qbSjGfGoiD
	LRHi9Cqe03+2vuRDH8OyLZZZHN8l+MeTqhX7YCj4iGMm/sbeNWwngUaarRFcyyeL37GXY2bARTrVu
	xqdCWJi6gT8spCdSoofNlHceOFDRKkvWNcG7Ke+xzpnJy4Xw+obRszrJQOjdavX81cz/Mmuw3gqXV
	XsYADw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhO-00000008UDK-1nfz;
	Thu, 27 Feb 2025 19:37:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfSE-00000007rHz-0NO1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bwqVamQlIMiTRup9spj3AiZP8ueBDS1xeBFA9CjA03A=; b=jHmJGwUiTU2byERl8udaqgXIw/
	LycRO5CT/8fkTYHA6seibmf/jbl2UJC4EZpvlX1/2uPVrh88Ey7FlTEtA9gPpd+ljjqtqUPHmhuYn
	SyJNbO8h720+HFSBrkZ5+pxLUZpt/skR6WYEOkCn+7oswQmiHiPlX8Yj4nZ6GuKCSJ5CtHlU8zvMp
	vLSmxbhWV54sSdrS5CI68Sg7uI/gsF7wQlCS4KSclymE4ieBWxp8lONc48qlpJIEwQL+5rCFhPSLk
	Y1I2D2D0Z52mT/Sv9m9A3fMrZfYM1ZvDjNq5yZu+QOu+F0WDyelpWI516wB03y2myPCdMNIaGf/g9
	rrcTXojQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35196 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tnfS8-0007X9-1m;
	Thu, 27 Feb 2025 15:05:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tnfRo-0057SL-Dz; Thu, 27 Feb 2025 15:05:12 +0000
In-Reply-To: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH RFC net-next 3/5] net: stmmac: remove unnecessary
 stmmac_mac_set() in stmmac_release()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tnfRo-0057SL-Dz@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 15:05:12 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_070538_125415_FD67B8AF 
X-CRM114-Status: UNSURE (   8.09  )
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

stmmac_release() calls phylink_stop() and then goes on to call
stmmac_mac_set(, false). However, phylink_stop() will call
stmmac_mac_link_down() before returning, which will do this work.
Remove this unnecessary call.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9462d05c40c8..e47b702fb9f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4120,9 +4120,6 @@ static int stmmac_release(struct net_device *dev)
 	/* Release and free the Rx/Tx resources */
 	free_dma_desc_resources(priv, &priv->dma_conf);
 
-	/* Disable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, false);
-
 	/* Powerdown Serdes if there is */
 	if (priv->plat->serdes_powerdown)
 		priv->plat->serdes_powerdown(dev, priv->plat->bsp_priv);
-- 
2.30.2


