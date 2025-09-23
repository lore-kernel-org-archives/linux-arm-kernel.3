Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E017CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYEjz++G5/cXKTF/bymuRT79xSFx8FdTgAMO+/ffl/Y=; b=fEN2HbhcJyxhCElNlhKOeBSJo4
	RRGoJ/n313ZeNrPS1CPhkon/9VMKanmffkMSVBBXRzBnlGWJTLDb9WNoKahnFZ5DwVn4/91sPXuE6
	Ya2YXAgfUqU3s1LytSMoUOHVX6TtzOOhUxDAtCW808IAe5jgCjzWFZKAUm8VHqaiZ8PBtrLj3O3+m
	tmDA1LjEl0ATovV0TjPwnQwk5yAsTfE36GV4aZVbdNcv3cPNyUnwAEX1L9iPNQkQ/A6K21kjY3H19
	u4XM0XHiZ50kUJr4ASBdDdlvpNW8mEAmFqSr8or0YNc3ILEICFwW2hFRbn3OptwsopVz4adFuTGw5
	NvYrC2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11AB-0000000DAJL-0O07;
	Tue, 23 Sep 2025 11:26:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11A6-0000000DAFz-1u6q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uYEjz++G5/cXKTF/bymuRT79xSFx8FdTgAMO+/ffl/Y=; b=L0r8APsqmz+z9q7xkmussplrMc
	mXOOlpPVZggHS1aSgD084Z4e//32EoCM34aipprAJVS2to827lHGkWYAd36pDzuNezF/keFcNhVIw
	dlo8gIoTsJXu3HV9eZrXTeeK+1bPtElTjmNqUPbTND1EWS0KGQ+ri0bRuHxLFKT14QXtDCHyDSb/b
	EjQD4PIk6QbtJla108LPypVD5gbvajV+zUJdEearCvZbmLNF2WlJQapLMIRWynGlq8L3jtNfglw0b
	hRP0gtvCFJqkE5KME0GLHXhrck+gKR7vi3sJ0Cerh2M6Tlnze2vmDgWQ6zbF5Bzhu9T/qfoKMRgQm
	nXa/SASw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50760 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v119z-0000000078v-2J1Z;
	Tue, 23 Sep 2025 12:26:15 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v119y-0000000774A-2vvl;
	Tue, 23 Sep 2025 12:26:14 +0100
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
Subject: [PATCH net-next 4/6] net: stmmac: move initialisation of
 priv->tx_lpi_timer to stmmac_open()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v119y-0000000774A-2vvl@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Sep 2025 12:26:14 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_042622_500347_C886E022 
X-CRM114-Status: GOOD (  10.85  )
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

The initialisation of priv->tx_lpi_timer only happens once during the
lifetime of the driver, which is during the initial administrative
open of the device. Move this initialisation out of __stmmac_open()
into stmmac_open().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8831bbda964c..4acd180d2da8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3937,10 +3937,6 @@ static int __stmmac_open(struct net_device *dev,
 	u32 chan;
 	int ret;
 
-	/* Initialise the tx lpi timer, converting from msec to usec */
-	if (!priv->tx_lpi_timer)
-		priv->tx_lpi_timer = eee_timer * 1000;
-
 	ret = stmmac_init_phy(dev);
 	if (ret)
 		return ret;
@@ -4004,6 +4000,10 @@ static int stmmac_open(struct net_device *dev)
 	struct stmmac_dma_conf *dma_conf;
 	int ret;
 
+	/* Initialise the tx lpi timer, converting from msec to usec */
+	if (!priv->tx_lpi_timer)
+		priv->tx_lpi_timer = eee_timer * 1000;
+
 	dma_conf = stmmac_setup_dma_desc(priv, dev->mtu);
 	if (IS_ERR(dma_conf))
 		return PTR_ERR(dma_conf);
-- 
2.47.3


