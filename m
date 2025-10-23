Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52963CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WPLcGCpHD14kAbOPD2pmp9jPQbVOa9qLI6kE6kqGFc=; b=0a66y0v70PxSnsvsSHcVidqdvY
	zKMGtet0ZhskZXnCUEHKFQ8VsO8vbRf+vJD5UPmCoVC88ykeKDWFXFxqdnfZ3iqEcmZroicqFCkHM
	QdN9NeRw/LLRNFRNEomKJRMi2rB9yT0GyqwyaF0v/Qm0gMbR3uTHiFHDgg8o1vxMb+TvM4AMPrn8f
	MmYR/rvWtL/5ks2h0WVSAuneKfZxDnHhXZ1Y3KfFXNvtE+8LaPYCjUYcIFJlRKGHjs20WsaotmgCj
	tCuYavdfeiPvF4qd7jvAP2NtwUwIvsnx1dmpaoQFw73mSWo4VQsLYq+pW6FIlcC/5mBu4JCg8Huem
	o+i7BUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrlO-00000005jxm-25cf;
	Thu, 23 Oct 2025 09:37:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrlM-00000005jvc-2b89
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 09:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+WPLcGCpHD14kAbOPD2pmp9jPQbVOa9qLI6kE6kqGFc=; b=a/JObqvEYiZrsEIdqN1k/tNCRf
	pbfF/jZ0DynBUZTZcs0hO5nlLDojPAw2IjNFHPW3yrQgdJlfhWZcTe4woHmHkaaAhE3LywtYsZfjL
	VUI0GWgowVkzQHXOn5xpgX5ZlU9lYKMoIX5edutKiKd/mVcOuPsi6LFU1A32PMgvqgdfnhFyBlOFN
	rAj2KnBakDLsbRla+on6a1GrdtFEGqnpVYgGyysV5Fnngj6IBsPRgDTkYvJV3kWeym37GzMZvvEVI
	pNzo2XNAhrue8EKtsYyXERhyrpLtgc6KxN4BtEqLQTPKAvPdrMSllF0zQFfMpQZDGn5A8a6n0m8OD
	/+vyNt9g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37992 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vBrlH-0000000065C-1DoV;
	Thu, 23 Oct 2025 10:37:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vBrlG-0000000BMPy-29xx;
	Thu, 23 Oct 2025 10:37:34 +0100
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
Subject: [PATCH net-next 3/8] net: stmmac: consolidate version reading and
 validation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vBrlG-0000000BMPy-29xx@rmk-PC.armlinux.org.uk>
Date: Thu, 23 Oct 2025 10:37:34 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_023740_656391_43BB86D1 
X-CRM114-Status: GOOD (  13.25  )
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

There is no need to read the version register twice, once in
stmmac_get_id() and then again in stmmac_get_dev_id(). Consolidate
this into stmmac_get_version() and pass each of these this value.

As both functions unnecessarily issue the same warning for a zero
register value, also move this into stmmac_get_version().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 29 ++++++++--------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 7ee304e3599a..c446fafdd804 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -18,30 +18,16 @@ struct stmmac_version {
 	u8 dev_id;
 };
 
-static u32 stmmac_get_id(struct stmmac_priv *priv, u32 id_reg)
+static u32 stmmac_get_id(struct stmmac_priv *priv, u32 reg)
 {
-	u32 reg = readl(priv->ioaddr + id_reg);
-
-	if (!reg) {
-		dev_info(priv->device, "Version ID not available\n");
-		return 0x0;
-	}
-
 	dev_info(priv->device, "User ID: 0x%x, Synopsys ID: 0x%x\n",
 			(unsigned int)(reg & GENMASK(15, 8)) >> 8,
 			(unsigned int)(reg & GENMASK(7, 0)));
 	return reg & GENMASK(7, 0);
 }
 
-static u32 stmmac_get_dev_id(struct stmmac_priv *priv, u32 id_reg)
+static u32 stmmac_get_dev_id(struct stmmac_priv *priv, u32 reg)
 {
-	u32 reg = readl(priv->ioaddr + id_reg);
-
-	if (!reg) {
-		dev_info(priv->device, "Version ID not available\n");
-		return 0x0;
-	}
-
 	return (reg & GENMASK(15, 8)) >> 8;
 }
 
@@ -50,6 +36,7 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 {
 	enum dwmac_core_type core_type = priv->plat->core_type;
 	unsigned int version_offset;
+	u32 version;
 
 	ver->snpsver = 0;
 	ver->dev_id = 0;
@@ -62,9 +49,15 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 	else
 		version_offset = GMAC4_VERSION;
 
-	ver->snpsver = stmmac_get_id(priv, version_offset);
+	version = readl(priv->ioaddr + version_offset);
+	if (version == 0) {
+		dev_info(priv->device, "Version ID not available\n");
+		return;
+	}
+
+	ver->snpsver = stmmac_get_id(priv, version);
 	if (core_type == DWMAC_CORE_XGMAC)
-		ver->dev_id = stmmac_get_dev_id(priv, verison_offset);
+		ver->dev_id = stmmac_get_dev_id(priv, verison);
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
-- 
2.47.3


