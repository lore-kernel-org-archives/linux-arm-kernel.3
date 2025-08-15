Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E50CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r57K7fI/6hd/8/DWGPUEw3UErVzL98S6GiksmsGJenw=; b=f6AYadOqy4IbT2ai7nsdNPUSpl
	T2rQZs//gLkKMFz6MIjhjoIiy0jvLakVCRMNbdiEfl2ABeV9jDCEalnNZq9yAUZvjkMg+ejuLbnl+
	9Ft1R9lwkrnj1GqA8iYpz2ypPVw8fGVZpuxlFJ5RJ1lvmznb8pcWvclexcqszADJPeTjOUX6bkrNe
	CoUP+G0zq2WGoBaKNcjGYkfBoUZr5nYZARUP1REcBgIgQMOFwv/ic5QjkPj4/LrYiE+rVAYIHluPg
	b7Caci5veQ1rxhbwFYDR1i5x0ErmARaAIm7XiAz+/9kAAEGxTCVebgrqtSigX1mOL7lo8su0WU5mF
	SxAwZGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvWX-00000002jXY-1HjB;
	Fri, 15 Aug 2025 14:35:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsgJ-00000002LIW-3sJy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r57K7fI/6hd/8/DWGPUEw3UErVzL98S6GiksmsGJenw=; b=wNe4uxYMTL9+wEnSz8LQJNZqR4
	n7uVBy4Wr8EQKQ/r3yyUu49dKLtuR5jqED3sfrSzQ65T+G/X3fSxICgWeOaTyNSVaMWZOnTY+afT0
	9atmWCgTBCUvn6tWbn7Zt2E9SavecBrEsxoQChPNoKXd46YIVO8bmGz70J7wNjDGbbgNvOf3BWDFJ
	nBkwxsQrdLze9NbnpMLMm9cdfi3nM21ihlp4HZNldPSBO9J9HeFNunK5kk7I+MROOk4067rugcmNa
	1DLiSYUrIQIYXALATUL/X+sEa1njlIShghs3KevBYwF1Ui6WLFfYz5I2x0nLQUWi77ZJ48EuSanvT
	EO5zVKGQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34540 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1umsgD-00012n-31;
	Fri, 15 Aug 2025 12:33:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1umsfV-008vKv-1O; Fri, 15 Aug 2025 12:32:21 +0100
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
Subject: [PATCH net-next 7/7] net: stmmac: explain the phylink_speed_down()
 call in stmmac_release()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1umsfV-008vKv-1O@rmk-PC.armlinux.org.uk>
Date: Fri, 15 Aug 2025 12:32:21 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_043311_964820_5872F204 
X-CRM114-Status: GOOD (  11.35  )
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

The call to phylink_speed_down() looks odd on the face of it. Add a
comment to explain why this call is there. phylink_speed_up() is
always called in __stmmac_open(), and already has a comment.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 78113e2602ee..b5f1fb8b2b30 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4138,8 +4138,13 @@ static int stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
+	/* If the PHY or MAC has WoL enabled, then the PHY will not be
+	 * suspended when phylink_stop() is called below. Set the PHY
+	 * to its slowest speed to save power.
+	 */
 	if (device_may_wakeup(priv->device))
 		phylink_speed_down(priv->phylink, false);
+
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 	phylink_disconnect_phy(priv->phylink);
-- 
2.30.2


