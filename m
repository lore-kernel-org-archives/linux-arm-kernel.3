Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C29BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDOJjloH2trDjnCVarjV86T+ZpZnVfpEtrSMCzlD+kA=; b=NUngwyG/Rnh5RoTit+UV0JetrC
	PvXh8CVANGg+/ZZFg5zi464LjnHkOzrVcUTZ9dXR2oOYe0eVsDEmKOgw6tiVUbnlQXRc3bkXjvDrr
	Cx6avxIgzIRoOD8aKX1HjAPrKs4KtgVpJtXBvQRiGL6wL3cWOPrHrl/ikst8cg2eFx38RIuLHkIXA
	c16oC+rTZ/YXNdxsTX3qpSuXqdE0WjcFcgSQpbmmHDvyznu6BRXJd9ByXVV8DmkIBcR8YsSsEJuhO
	kPuZR2198GBTUU5y9PJRoWwXcsgiaZ5QE9GdIZj4g1bk7f5kvfpOJLrOrQe1y/B3RfzMrRMAs4M/C
	S89cEZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdFz-00000002oH0-2oKb;
	Mon, 10 Mar 2025 13:33:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcIP-00000002dNp-1hri
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UDOJjloH2trDjnCVarjV86T+ZpZnVfpEtrSMCzlD+kA=; b=ctlpD0FdbQi+2oO6KQz05AHAyO
	TtfODzyMM5cnq8kkJVQ8cnyB2rq0SmZJ2Qqa7e02Q2P5xdVLqzyRJEIs7IeEdrGgT125HQGQZQKv6
	I1cOuQw1+4pYYLMOwqLZgq+MoMlEfdAP9DTclyk6OyoDweIsJxdLmLfEvW5vrSSvPuhF//+gHKgHN
	o5bOEiYLts3f3K9MVx7GfPkQYv497OocLwR0Ui7K8+xaXlPbZQD2TbQDkTZNqogfzedO6o3mNtdij
	oGzAZbHNsJSeH/BL3sisRjPTkEus/9Jgjbj6AuK7KVfv//DqQeYZw2pvl48TS0sJax+00Njx3kc9V
	fImZ235Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51236 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trcIL-0002dw-29;
	Mon, 10 Mar 2025 12:31:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trcI1-005rn2-CZ; Mon, 10 Mar 2025 12:31:25 +0000
In-Reply-To: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
References: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 1/2] net: stmmac: remove redundant racy tear-down in
 stmmac_dvr_remove()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trcI1-005rn2-CZ@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:31:25 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_053149_445197_D2E8B598 
X-CRM114-Status: UNSURE (   9.40  )
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

While the network device is registered, it is published to userspace,
and thus userspace can change its state. This means calling
functions such as stmmac_stop_all_dma() and stmmac_mac_set() are
racy.

Moreover, unregister_netdev() will unpublish the network device, and
then if appropriate call the .ndo_stop() method, which is
stmmac_release(). This will first call phylink_stop() which will
synchronously take the link down, resulting in stmmac_mac_link_down()
and stmmac_mac_set(, false) being called.

stmmac_release() will also call stmmac_stop_all_dma().

Consequently, neither of these two functions need to called prior
to unregister_netdev() as that will safely call paths that will
result in this work being done if necessary.

Remove these redundant racy calls.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Furong Xu <0x1207@gmail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fa1d7d3a2f43..c2ee6c0af3fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7768,8 +7768,6 @@ void stmmac_dvr_remove(struct device *dev)
 
 	pm_runtime_get_sync(dev);
 
-	stmmac_stop_all_dma(priv);
-	stmmac_mac_set(priv, priv->ioaddr, false);
 	unregister_netdev(ndev);
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.30.2


