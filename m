Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0546AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1osmxLM0JPtN1QjPJqhrKT1uQMk9kT2l9BrM2YTPnUY=; b=kvdiC/6RKMogeQbPMbX9n+yZ4t
	PdIFpD5HFIG4jgeYp7ibaEuqIPkTIhIcuyMJNtPIOt8X0AJST1lOVPHWN1x+YiAeuL7A1xDpNExBa
	RY6MqfCbmmGsoznYu3HcG+XAXCN7X5fuVV3pyBJZHKKBtLs4T6l4q3GdOc5SmkXaIVbjAUOttSIgE
	ftzGt7ncuHGo7tyaxhS9GMJXUNAie/z+V3FIOKS4wwqCfJ8zDBpUhXjXu7cee0niLIt40HFDpRISj
	0uX7NmLTZEi3r5fwSezQREKssPdUraRfkIMYB4m1QQzIszUoxZRNhfzpobrNhH9P5rbFzkYmcmi+X
	k17NNgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpt9t-00000008sdm-14hw;
	Wed, 05 Mar 2025 18:07:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpt3N-00000008rhR-3dQn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1osmxLM0JPtN1QjPJqhrKT1uQMk9kT2l9BrM2YTPnUY=; b=1IjUqJmZ20ZEzPYdnKOvwh17C6
	gWttHMBeDJsebI58cev2xemiQvLC3l3AZe1FzwsBoTkCD8yLGZm7ikGskaUabDvlHN1sXbW3HtlH8
	/8W/MSUESg3OHXJonAk6TuMgVPrb3lMsUW4dE7Jrwvl3ODqEHX+udzQ8gugC5VmgZWHgKwd/mGIjx
	YfCYIvpjymQlwfjjABJKh8v69ujswXaX/x423jEcvdeBI2g9/xIbud9RBnKHrYNWsBp60NFhNdty1
	qtwzU4O4+tqmzNpWcgM8IVwcfprg0JqbiX/zJvMQ+KpIN9Q74IQGCdtzYOM/oX+Hovw6cwxmx7CTZ
	8tipKrsg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42194 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tpt3J-0004h6-0M;
	Wed, 05 Mar 2025 18:01:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tpt2y-005UNH-QS; Wed, 05 Mar 2025 18:00:44 +0000
In-Reply-To: <Z8iRM8Q9Sb-y3fR_@shell.armlinux.org.uk>
References: <Z8iRM8Q9Sb-y3fR_@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>,
	 Thierry Reding <treding@nvidia.com>,
	 "Lad,
	 Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/2] net: stmmac: block PHY rx clock-stop over reset
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tpt2y-005UNH-QS@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Mar 2025 18:00:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_100109_900644_C2C5D41B 
X-CRM114-Status: UNSURE (   9.02  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6924df893e42..037039a9a33b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3096,7 +3096,10 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
 		priv->plat->dma_cfg->atds = 1;
 
+	/* Note that the PHY clock must be running for reset to complete. */
+	phylink_rx_clk_stop_block(priv->phylink);
 	ret = stmmac_reset(priv, priv->ioaddr);
+	phylink_rx_clk_stop_unblock(priv->phylink);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to reset the dma\n");
 		return ret;
-- 
2.30.2


