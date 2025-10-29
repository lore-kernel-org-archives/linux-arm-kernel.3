Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156EFCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 00:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKb3zcptv29O5DmjlyLQJ8+1I6cjWJtKnsSRvomNl/o=; b=ka+3L2egJHsqnj+n+MelwBvpgG
	eDSne/clFBenEIV4mE1HwN3k+Avu+PPUbtG6XeN3Hu+ZKO3e7WzgoWMOH2zZ54tkP3MJ+ftzn5Xy/
	Dhmd83eSKDVOZgfqQY+LuNi0BTddAwI8UjrzYXG04ItkA5SBwMbTjLBI4SwKQGUU+M09tdyr6Fn1f
	5namFWNEP4oU50tylxBX8SlOQ9UA+WMZzJpJEw70nU+w5ZakFYJg3qZ+QWoL7CHLgWjIjKylbLx+6
	l8zmA4gILzkuyI3A1tZnhj/TcrokbXap153Nhh3yN3nl4L/ZNrrAlIp/fcH/7LHeMI/T4HuZb5+3g
	NTdSKFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtf1-0000000GpGg-2TfC;
	Wed, 29 Oct 2025 00:03:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtex-0000000GpFG-2aGS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 00:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YKb3zcptv29O5DmjlyLQJ8+1I6cjWJtKnsSRvomNl/o=; b=J9RSanNMSyln0KRV7qgbPC0Ws9
	Lput0KQVfn5Ofk4SFVg1vzJM3LmScJx/mVbmXOJ4R3IWwh37qRaKIxchOyfWG5l23d+NBjl/Uibm6
	ShIDdrPJ2JmWVjFo5kS248ZbeOC4J2QgxClJJxqXGkbQttcl4mm+1WAJ/4El7aSi0igR4dIBGNW60
	rUs2Xd8/6BMtxlwUJ9nURlv3Zno0gmFe1ztyByF2mTcGU7vWz/wS8URF+s7vImBmubqujS87iGk8b
	X9bpZtWNGXdurc6M+vrXiIesR4JSvIzfHFvUNp5UO+2J871eiRWstl5rWYhkRJpSKL2C7bqiUikIT
	6UCmhQFg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56210 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vDter-000000003gz-3N0n;
	Wed, 29 Oct 2025 00:03:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vDteq-0000000CCC3-3zbJ;
	Wed, 29 Oct 2025 00:03:20 +0000
In-Reply-To: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
References: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v3 3/8] net: stmmac: consolidate version reading and
 validation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vDteq-0000000CCC3-3zbJ@rmk-PC.armlinux.org.uk>
Date: Wed, 29 Oct 2025 00:03:20 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_170327_660170_D7A8E7D5 
X-CRM114-Status: GOOD (  13.48  )
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 29 ++++++++--------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index f6ada5a905fe..ffdc101ce3ce 100644
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
-		ver->dev_id = stmmac_get_dev_id(priv, version_offset);
+		ver->dev_id = stmmac_get_dev_id(priv, version);
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
-- 
2.47.3


