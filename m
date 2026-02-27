Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5D5FD7F8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKAkTM53E2y1DtK2v4QGCI56px12Jk+xBwE3HDfh0v8=; b=KbNasfyVmPfmcVLq3Nf8x3e5TC
	jLm+xC9iHcy1D9rsnbw3f61fbGvMKJhjAyNLLlMrFBjgfnQ9WfhSB/6bN7rEvdqqzoccasnvYmanv
	jmsltzunkLdF4GeC4lVAkc1Er3BLtIn9z/p6XVpm5+ddvDPdgGIIxNRPV0aViYhFwsK/yhZ/Y23ej
	dAmJZ7VQbLV02v6mJA6u7njpbu8DUNIX4bt1LVIemadKKfwuYZNtVqA7Vn9Ec6nU/5t2CUcwSmKte
	HPHiSRfW62FkYOaNGYvrkZ5RiwkW8BGM55Gm/MO0NGhzML8yJgC6HHq6j/3oNoLZ5/ymk+uuLmGz/
	pUZZPftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuwz-00000008Dty-3aqN;
	Fri, 27 Feb 2026 10:20:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuww-00000008DtG-3skd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 10:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DKAkTM53E2y1DtK2v4QGCI56px12Jk+xBwE3HDfh0v8=; b=NFnXDZqZz/tiXb1LffWyxzF8Ml
	5Da0EB/MMTENnA9KhokZz/3Nyo7yGG+290lApA2aj3UeK1sTZAaQr7JMy4O8v0YKSvLf06xR/Vwrm
	avWRq1leBv/Vy0m2hgsvIcHo5BleKeUL8+dIOVQI0IBR29F91I3daHmtPszGzy6A2vSbsxE9Qphe0
	zuPNxZc2Fk1Q/ukhliPiOl443y26mpRRR94AX3XYVi2CDn+HOBLaHQeI7GaCYt8W8YP5zLLacZwMW
	79yyFzne/eN2QCeijBtW7f3tX2NAwH+WC2yWhTsSa98D9RHFuFH8UvxxidqJD3GntW2g7UwRmaQfo
	5EeSsGJQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43818 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuY2-000000000f7-0ZfH;
	Fri, 27 Feb 2026 09:54:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuXy-0000000Avnk-10Q8;
	Fri, 27 Feb 2026 09:54:10 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 13/14] net: stmmac: simplify atds initialisation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuXy-0000000Avnk-10Q8@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:54:10 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_021958_982961_8E752719 
X-CRM114-Status: GOOD (  11.74  )
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

atds is boolean, and there is only one place that its value is changed.
Simplify this to a boolean assignment.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 38f6b890ec37..a9b26d12a057 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7448,10 +7448,11 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 
 	/* Set alternate descriptor size (which tells the hardware that
 	 * descriptors are 8 32-bit words) when using extended descriptors
-	 * with ring mode. Only applicable for pre-v4.0 cores.
+	 * with ring mode. Only applicable for pre-v4.0 cores. Platform glue
+	 * is not expected to change this.
 	 */
-	if (priv->extend_desc && priv->mode == STMMAC_RING_MODE)
-		priv->plat->dma_cfg->atds = 1;
+	priv->plat->dma_cfg->atds = priv->extend_desc &&
+				    priv->mode == STMMAC_RING_MODE;
 
 	/* Rx Watchdog is available in the COREs newer than the 3.40.
 	 * In some case, for example on bugged HW this feature
-- 
2.47.3


