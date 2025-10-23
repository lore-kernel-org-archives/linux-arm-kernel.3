Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57118CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IR15YmOi30IOFo+C5GF3Vg22Y2q6B0Iun6RgdkPXEg=; b=jIaQdu7YpW31cVMfEJoZAmdXvX
	k/JSALe/z11HWNPNqWm+Z/CTxaXA4OMojm2hRU/OEAIKF+9Az1+QJ1BRL3CqI7uk86vKnB8//f8bt
	j1+/Yx+9dx46+PFvdhlimlHk8tBJ6Xg2oAMxiHwXuCQkIDTcU+1nrD7LAdTBbkUZ/1PtgTW92LUZm
	yaXgG3LjAXz6mrN5v7zkM1uiqBME4pBZoyhQhRg+nSsMT5GzEMEGmQ5EeLmvL4DdzmRp/D0qFqtxc
	sQnFAwVkQ18qT7KmHgrw2tyq237QaiwEqZhIkgsFVWD+ocEi2ayoT5AN2zyyKhmk70ZlWucTGDd5g
	esW0VQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrlJ-00000005juX-0qL5;
	Thu, 23 Oct 2025 09:37:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrlG-00000005jtF-3dhK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 09:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4IR15YmOi30IOFo+C5GF3Vg22Y2q6B0Iun6RgdkPXEg=; b=CdN6Ceka+/zjQIEZ8kYbkAcKqA
	REh4YekMIC8ImXyLWn0Es2/GWoS6q2jsC49Y0B06JerTuFKvhxrJjlED/URWgtNUPqMVjXBmKXOUM
	QJyuCJelnd3IKKXy3ubjQnwhPgGkQwCCwj1nvOKu7LPX08iTAwVXuuItWPsG4yhTXLOaH0wqwNoTb
	0ciV4iAHofBCXhoH591b8E0pyxxT0wDfOZq7q8fXVoZhc9mTsC0m2xYruUdrETBbn4XwhcUq6eKnY
	i+hO/8Iljq98bLJQA4fCxxcElvxlGELI3sn2LQb8urgAadM0kNIMSyphn4pxypsD/TsgYIbeRGQSO
	7czPVxMA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37978 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vBrlC-0000000064v-0l63;
	Thu, 23 Oct 2025 10:37:30 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vBrlB-0000000BMPs-1eS9;
	Thu, 23 Oct 2025 10:37:29 +0100
In-Reply-To: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH net-next 2/8] net: stmmac: simplify stmmac_get_version()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vBrlB-0000000BMPs-1eS9@rmk-PC.armlinux.org.uk>
Date: Thu, 23 Oct 2025 10:37:29 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_023734_908397_D30D80EE 
X-CRM114-Status: GOOD (  11.15  )
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

We can simplify stmmac_get_version() by pre-initialising the version
members to zero, detecting the MAC100 core and returning, otherwise
determining the version register offset separately from calling
stmmac_get_id() and stmmac_get_dev_id(). Do this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 44e34b6ab90a..7ee304e3599a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -49,18 +49,22 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 			       struct stmmac_version *ver)
 {
 	enum dwmac_core_type core_type = priv->plat->core_type;
+	unsigned int version_offset;
 
+	ver->snpsver = 0;
 	ver->dev_id = 0;
 
-	if (core_type == DWMAC_CORE_GMAC) {
-		ver->snpsver = stmmac_get_id(priv, GMAC_VERSION);
-	} else if (dwmac_is_xmac(core_type)) {
-		ver->snpsver = stmmac_get_id(priv, GMAC4_VERSION);
-		if (core_type == DWMAC_CORE_XGMAC)
-			ver->dev_id = stmmac_get_dev_id(priv, GMAC4_VERSION);
-	} else {
-		ver->snpsver = 0;
-	}
+	if (core_type == DWMAC_CORE_MAC100)
+		return;
+
+	if (core_type == DWMAC_CORE_GMAC)
+		version_offset = GMAC_VERSION;
+	else
+		version_offset = GMAC4_VERSION;
+
+	ver->snpsver = stmmac_get_id(priv, version_offset);
+	if (core_type == DWMAC_CORE_XGMAC)
+		ver->dev_id = stmmac_get_dev_id(priv, verison_offset);
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
-- 
2.47.3


