Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADACBCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KKtj+0CgMqVuSmmu+PS5Ze/uA0PpZDbYgbZOwroC5M=; b=roY1e3tVgz+sNwiRYgvq5IvAEh
	dwsAgq6aMPaV/5PDx8GhrIyswqUwoWa+PPvKzSniFD0dkc2LiJP3q2GlMOEOKlgGZjdhl5AddUuI+
	OWDlkLoDsYQ0YJaQjpfDmlPExG5khvfIDrnez/yKBGNWbrTmOyca2MYni5OkodKA6wa+NqG0/FSbf
	edhlfr0TMLKAqrZ3lQQzO0paZ211QPfjgAhGwo3VkAfH1Wlyvr4RsMmn9vBJI4WqyaPxuaU9ZjUyJ
	cHFO5aN5Du0rYYzonWUZ0RhdjN+pUevvKA3+KfvbdwQkltFt7nFP8SdxZoRayBtAWprB6EQ7kvf57
	OyWkhfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrlD-00000005jsL-3lXI;
	Thu, 23 Oct 2025 09:37:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrlB-00000005jrK-2gSR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 09:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3KKtj+0CgMqVuSmmu+PS5Ze/uA0PpZDbYgbZOwroC5M=; b=ArqrOhfyKGRmq50HHOhEtRllT9
	qklyJizOBteOMp9lwCKiqc52eL/tDvj4Fr7QXdZQK0ugLtFY+0lCCKiY7mXoX8AGaGQ7tRivtMknh
	ZABAu7RWpAfqWb1T2pfqq+Zqsxwt34bGHVNTAMjFo5b3YL7jGqvmuKFZTsm5IhdDB6XITSVtMZXro
	rIOyTo12rVvxZMj3Sp0jGTs2283Do3v0i8NbAba9EI1lyrJFnDriYNAMFtyunLRmLgnR/F9UdPc4p
	dcTt2SOLoHPKJ3VmYbyifHh61dHK/FXHbdvjxUUa1TJoNi/itSpaMLFfoMn5xFanZeECrnl7UuIA4
	CHxISXFg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41824 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vBrl7-0000000064i-05Kz;
	Thu, 23 Oct 2025 10:37:25 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vBrl6-0000000BMPl-18ag;
	Thu, 23 Oct 2025 10:37:24 +0100
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
Subject: [PATCH net-next 1/8] net: stmmac: move version handling into own
 function
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vBrl6-0000000BMPl-18ag@rmk-PC.armlinux.org.uk>
Date: Thu, 23 Oct 2025 10:37:24 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_023729_676334_2ACAD1C3 
X-CRM114-Status: GOOD (  14.13  )
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

Move the version handling out of stmmac_hwif_init() and into its own
function, returning the version information through a structure.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 42 +++++++++++++++-------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 00083ce52549..44e34b6ab90a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -13,6 +13,11 @@
 #include "dwmac4_descs.h"
 #include "dwxgmac2.h"
 
+struct stmmac_version {
+	u8 snpsver;
+	u8 dev_id;
+};
+
 static u32 stmmac_get_id(struct stmmac_priv *priv, u32 id_reg)
 {
 	u32 reg = readl(priv->ioaddr + id_reg);
@@ -40,6 +45,24 @@ static u32 stmmac_get_dev_id(struct stmmac_priv *priv, u32 id_reg)
 	return (reg & GENMASK(15, 8)) >> 8;
 }
 
+static void stmmac_get_version(struct stmmac_priv *priv,
+			       struct stmmac_version *ver)
+{
+	enum dwmac_core_type core_type = priv->plat->core_type;
+
+	ver->dev_id = 0;
+
+	if (core_type == DWMAC_CORE_GMAC) {
+		ver->snpsver = stmmac_get_id(priv, GMAC_VERSION);
+	} else if (dwmac_is_xmac(core_type)) {
+		ver->snpsver = stmmac_get_id(priv, GMAC4_VERSION);
+		if (core_type == DWMAC_CORE_XGMAC)
+			ver->dev_id = stmmac_get_dev_id(priv, GMAC4_VERSION);
+	} else {
+		ver->snpsver = 0;
+	}
+}
+
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
 {
 	struct mac_device_info *mac = priv->hw;
@@ -292,23 +315,15 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 {
 	enum dwmac_core_type core_type = priv->plat->core_type;
 	const struct stmmac_hwif_entry *entry;
+	struct stmmac_version version;
 	struct mac_device_info *mac;
 	bool needs_setup = true;
-	u32 id, dev_id = 0;
 	int i, ret;
 
-	if (core_type == DWMAC_CORE_GMAC) {
-		id = stmmac_get_id(priv, GMAC_VERSION);
-	} else if (dwmac_is_xmac(core_type)) {
-		id = stmmac_get_id(priv, GMAC4_VERSION);
-		if (core_type == DWMAC_CORE_XGMAC)
-			dev_id = stmmac_get_dev_id(priv, GMAC4_VERSION);
-	} else {
-		id = 0;
-	}
+	stmmac_get_version(priv, &version);
 
 	/* Save ID for later use */
-	priv->synopsys_id = id;
+	priv->synopsys_id = version.snpsver;
 
 	/* Lets assume some safe values first */
 	if (core_type == DWMAC_CORE_GMAC4) {
@@ -342,7 +357,8 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 		/* Use synopsys_id var because some setups can override this */
 		if (priv->synopsys_id < entry->min_id)
 			continue;
-		if (core_type == DWMAC_CORE_XGMAC && (dev_id ^ entry->dev_id))
+		if (core_type == DWMAC_CORE_XGMAC &&
+		    (version.dev_id ^ entry->dev_id))
 			continue;
 
 		/* Only use generic HW helpers if needed */
@@ -378,7 +394,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	}
 
 	dev_err(priv->device, "Failed to find HW IF (id=0x%x, gmac=%d/%d)\n",
-		id, core_type == DWMAC_CORE_GMAC,
+		version.snpsver, core_type == DWMAC_CORE_GMAC,
 		core_type == DWMAC_CORE_GMAC4);
 	return -EINVAL;
 }
-- 
2.47.3


