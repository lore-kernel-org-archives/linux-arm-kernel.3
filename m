Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E262E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEgZ/SvmKDS++MiOXpGxNiPvw6lP1RjmRHXTj59mUno=; b=c9gRykUvwXo2Q6kbw9mo3bAW3H
	nJnuyInxJ0oCg+02wzNB08x0mitv+aJz06Zf5IZhXE/9jINEYGiMr8bzSE5jek1LBr8b1FkO2Y5in
	ixdn9HVyj9FDcR9PUWlyn2tG14gMsj5VGaikIdEEDwTnJWzVCxToSu4vWhDY3CChfObmAYVqFg7nb
	pVOf07/Lz3KwIF7xNeLU8W86M97sNRxsE7y2pHlX2OC47vbrdim8gDGwKmwLM/uFUya4T6yvTxUX1
	F/KOGxhcedKj6Fb5Ff/SD2iclr8VpuzykTqF+9FeSUN5zJrdphfDWVJq4qeKljE0ZYU2rJSomRr2V
	eDRdrtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJ4P-000000050oE-2yzg;
	Mon, 13 Jan 2025 11:57:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIu1-00000004yoP-1GIx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GEgZ/SvmKDS++MiOXpGxNiPvw6lP1RjmRHXTj59mUno=; b=UzuOxMvTAtG53wSYLB9oUkGFls
	0rdlR3mVUqQ5GeDjecci/PdH1Oe6/DtNZDKkXASsZRzNygPm42/To8o7qYkgSfdbtcx08lY25/ZrN
	hjfhQZJBLUGfRUelbeL5NL+bGjX6pmNXrUKU/9G6PJi4dMVgXdU8CPlnz/ImrwGVp04rZmxPafuw8
	9SehgNL4lnFstOOuELO1LBX5s/1fbFyhTER+/1Ue7/7VB5if5o9Gvls1vCWu74/nh9yWsxk6QZtbb
	mLcvTRhxWgXXslab5EJObH47SZHpUGpI6lrKF2WQyGc5fyfTeDz16l56JG8ibY7LrB1lRKg8eKVq6
	Csr5FThA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38262 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXItu-0006Wn-2f;
	Mon, 13 Jan 2025 11:46:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXItb-000MBa-OU; Mon, 13 Jan 2025 11:46:15 +0000
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
Subject: [PATCH net-next 8/9] net: stmmac: combine stmmac_enable_eee_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXItb-000MBa-OU@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:46:15 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034641_338637_ACB71A02 
X-CRM114-Status: GOOD (  16.35  )
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

Combine stmmac_enable_eee_mode() with stmmac_try_to_start_sw_lpi()
which makes the code easier to read and the flow more logical. We
can now trivially see that if the transmit queues are busy, we
(re-)start the eee_ctrl_timer. Otherwise, if the transmit path is
not already in LPI mode, we ask the hardware to enter LPI mode.

I believe that now we can see better what is going on here, this
shows that there is a bug with the software LPI timer implementation.

The LPI timer is supposed to define how long after the last
transmittion completed before we start signalling LPI. However,
this code structure shows that if all transmit queues are empty,
and stmmac_try_to_start_sw_lpi() is called immediately after cleaning
the transmit queue, we will instruct the hardware to start signalling
LPI immediately.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 677a2172a85f..72f270013086 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -422,27 +422,22 @@ static void stmmac_restart_sw_lpi_timer(struct stmmac_priv *priv)
 }
 
 /**
- * stmmac_enable_eee_mode - check and enter in LPI mode
+ * stmmac_try_to_start_sw_lpi - check and enter in LPI mode
  * @priv: driver private structure
  * Description: this function is to verify and enter in LPI mode in case of
  * EEE.
  */
-static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
+static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
 {
-	if (stmmac_eee_tx_busy(priv))
-		return -EBUSY; /* still unfinished work */
+	if (stmmac_eee_tx_busy(priv)) {
+		stmmac_restart_sw_lpi_timer(priv);
+		return;
+	}
 
 	/* Check and enter in LPI mode */
 	if (!priv->tx_path_in_lpi_mode)
 		stmmac_set_eee_mode(priv, priv->hw,
 			priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGATING);
-	return 0;
-}
-
-static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
-{
-	if (stmmac_enable_eee_mode(priv))
-		stmmac_restart_sw_lpi_timer(priv);
 }
 
 /**
-- 
2.30.2


