Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791A8D3B98D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rC1mufdNytwrMf+jdU56xanVZH+tbl22qe8k+O92jM=; b=YMezFyYyo7VWqiVfwzKCc7BNp+
	09Zfnsp3YXBvz3BfecXkt0szMTsMKAleUAP2uV06CeH+H1wOlwG0ahcU9DOyjgJ9fqDdKRi0S8lIP
	oQbbj6A9ES9Wp0crxQyisolPcpV2cOCOOx8DRlANGtxvPNrtUNbgGoSENmU8O2rwfE428tJaW72fh
	xdxhDHal8ImntuBb0GCBw6bdV6FHu3pIwav9iYkGltaFf+j5satHpnuL6J2YXhmqcyh4dH7vFth9P
	QWwoza+/jIncqAt7BMn4vs3c7fAERYKV/kuVcd1qSad1v4RyvFkc4NsDJSgfueDvrAzWqr3SMGBwR
	9VISRnrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvPK-0000000Afxu-3igy;
	Tue, 26 Nov 2024 13:15:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv4y-0000000AcRP-1UPs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0rC1mufdNytwrMf+jdU56xanVZH+tbl22qe8k+O92jM=; b=m/9BqHVUfqQ+CSfR9cRWYjOgIm
	Y0yXluFcwfTR7Jg45Zr721q1hlXZRUh8n6pwwOoeTD5TpmpBr1DRwl9KhTte9cgAKiBDlF9K4+WbO
	LHJ1qt1fW4laEoEJ4oyJbP5CeO9GM6cwzdP1E2cTUAr6QAJRob0o6dDNPVLPYuu/qQw18nEYVC23v
	hWhCxAXLFnCkfpFz8PtB2AQHsGy61Xwn7G3t67lWimHtCjq06UoiXNOfXxJIY4ONHX+qKH2+n22A6
	Y1fWi+CEN68o8IE3KJLwAirXCfZOiM0pM4T3uRFDA/kmEbbIq+KCZMgnjZ1CtiGg+y61qkDxtdRaK
	PrIQ6AQQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50154 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv4p-0006yH-2E;
	Tue, 26 Nov 2024 12:54:00 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv4o-005yjQ-F1; Tue, 26 Nov 2024 12:53:58 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH RFC net-next 21/23] net: stmmac: report EEE errors if EEE is
 supported
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv4o-005yjQ-F1@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:58 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045408_403955_8C9F3C94 
X-CRM114-Status: GOOD (  12.61  )
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

Report the number of EEE errors in the xstats even when EEE is not
enabled in hardware, but is supported. The PHY maintains this counter
even when EEE is not enabled.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 3a10788bb210..a33d7db810f0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -654,7 +654,7 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 					     (*(u32 *)p);
 			}
 		}
-		if (priv->eee_enabled) {
+		if (priv->dma_cap.eee) {
 			int val = phylink_get_eee_err(priv->phylink);
 			if (val)
 				priv->xstats.phy_eee_wakeup_error_n = val;
-- 
2.30.2


