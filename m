Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5DBCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DBVmkORiObKi/mtbHrI6pyrFSaGIBlKIWc0uf+aGHI=; b=mG7fdbQBD4zC4gPjESfJ/Vg31S
	3rzqS2CM0m1MEhADnv7QRq+85dPmIyj3HH97IaLql/SppOYkaBZal2l20wer+91IkwEc1z+vJEL0g
	sNMHA2PCapN2p9ukzZ56GfJdgnHiVFhe2P3crAUpFljDa6HybJnRqovPGAaL+KXOrAnSI6VIZ85Dt
	JGAhwDiqHZTMHziSPNvpeHQfID/LvTQHqfooj5MlA+ahRcn+cDNbSKRBDvUBpbvhVZcXGNTJivsSF
	wSaozWpk8O26CnhkTfhpZwkQYiDq/aLdCfEpPHZLQ1d+ITiDNtjQ0fLVT/XzCtIdmA/rSsGuHN+X0
	Lh2RK/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHEO-00000009PTU-0yIS;
	Fri, 24 Oct 2025 12:49:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHEJ-00000009PRj-2KpN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1DBVmkORiObKi/mtbHrI6pyrFSaGIBlKIWc0uf+aGHI=; b=I2ygWatt8YcqRGUlS+/BI4KZbj
	ccP9fCaqRn44FKDb3Za9yM62VoOU/b1u9JebulZZXMztRD/YWrIgzkYNnsi8Gt/GQjIce8EAhXwvD
	Vp/CsxEM5tmVwQ4kNnTyX9bq26D+OF614EOEAgk545kr2QIWrWphWf3HzpML0I7n++oMtjTPP0xS+
	6LEMOFK9Q4Xcck92TmKok8B7IIhiBwOfBqXIH5EMWMO1hfJDXbVKpyn6uMF3R7uVI/x5b7fPvbrgC
	CYc6sQUSiRNDLC9PR1KJiK+5m6dnPvz/9ErlfCWVLlu/Dj/p9uJxYrSY35szxIuTFeZWNt3MS8Fkb
	H+jpYxMg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51294 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vCHEF-000000007Zz-0Ck9;
	Fri, 24 Oct 2025 13:49:11 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vCHEE-0000000BPTm-1CTA;
	Fri, 24 Oct 2025 13:49:10 +0100
In-Reply-To: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 2/8] net: stmmac: simplify stmmac_get_version()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vCHEE-0000000BPTm-1CTA@rmk-PC.armlinux.org.uk>
Date: Fri, 24 Oct 2025 13:49:10 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_054915_595481_963ED0DF 
X-CRM114-Status: GOOD (  11.28  )
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
--
v2: fix "verison" -> "version" typo (and subsequent patches)
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 44e34b6ab90a..6b001d3f57c6 100644
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
+		ver->dev_id = stmmac_get_dev_id(priv, version_offset);
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
-- 
2.47.3


