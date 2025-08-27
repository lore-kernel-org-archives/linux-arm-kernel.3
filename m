Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A507CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bVD8KDKEsQ4zdVl4LrGJ70ulwhHWfhhuvgyYMvpeM10=; b=Qz4NmNG6Sqoun11pgpA8KhifOn
	ehHQGzyHLPcRKldLYrb1TsB28ShYV7L/778DCKJ/BXCFl7DVcnZOMNeijStXQ6GbldPH+zG/qYHz0
	RPUB4uI5OgGatdXGg/W71c+7VXWHR36ysDDLo3qZ1L2FJQWdFWbDAsZwBtkWVy2q7QPQyZvgdjGVi
	f46VLyzWHus5i0TZIXzyyPDOv4jmnhBPHyJYR79avJoJkOjXlgDH0ZsXlBc0TeTjlIQkZOVlcUIeh
	pG0QylWvDX4g/Ba1WAv5UUuz16600IGnh7fG8kftuMhi4GaZn3mLDWfYgxwk8mJWOrHfeYOo/ASey
	33YlODzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urITy-0000000G4Ju-2Cp7;
	Wed, 27 Aug 2025 15:54:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGBv-0000000FaQZ-1kTy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 13:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bVD8KDKEsQ4zdVl4LrGJ70ulwhHWfhhuvgyYMvpeM10=; b=GSh6z4TW7Nt+CEY/rDh0GgW8B9
	cuauYVIjct/VP6WLiQXy/LQz7rDa1rvTtSPQd3/PRJYMAkajyZtNs7zUGpy4VsWDeHsa1K75pWQ3l
	iPU41l3yVDMqMOMaXduRI8l8g5lha+rttrhGoVfTe+NwmsY0aZzYVFkjcNLpR4saAUQHSlTBvG/Ii
	TlYTIXzwDXLiAdkKi/CXx5D/LApZGu6DXylip/0gaBzJ8or5bItcjnQB6/LrExoQkVEEKGcVxHS1a
	oaN//f3aH1NEGUDCne7iKaXAhrluuznMazMa9c9ZBW0jQZ0ydDmg9HEFfPw+QhselGQTv1EEmzgl6
	DMed0ASA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54398 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1urGBo-000000000UR-2jbe;
	Wed, 27 Aug 2025 14:27:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1urGBn-00000000DCH-3swS;
	Wed, 27 Aug 2025 14:27:47 +0100
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
Subject: [PATCH net-next] net: stmmac: mdio: clean up c22/c45 accessor split
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1urGBn-00000000DCH-3swS@rmk-PC.armlinux.org.uk>
Date: Wed, 27 Aug 2025 14:27:47 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_062755_734455_57C7B670 
X-CRM114-Status: UNSURE (   9.60  )
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

The C45 accessors were setting the GR (register number) field twice,
once with the 16-bit register address truncated to five bits, and
then overwritten with the C45 devad. This is harmless since the field
was being cleared prior to being updated with the C45 devad, except
for the extra work.

Remove the redundant code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Untested, as I don't have my Jetson Xavier NX platform with me (and
probably won't do for a few weeks.)

While this patch has been prepared on top of "net: stmmac: mdio: use
netdev_priv() directly" it shouldn't conflict if that patch is not
applied before this one.

 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 86021e6b67b2..da4542be756a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -311,12 +311,10 @@ static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
 
 	value |= (phyaddr << priv->hw->mii.addr_shift)
 		& priv->hw->mii.addr_mask;
-	value |= (phyreg << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
 		& priv->hw->mii.clk_csr_mask;
 	value |= MII_GMAC4_READ;
 	value |= MII_GMAC4_C45E;
-	value &= ~priv->hw->mii.reg_mask;
 	value |= (devad << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 
 	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
@@ -409,14 +407,12 @@ static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 
 	value |= (phyaddr << priv->hw->mii.addr_shift)
 		& priv->hw->mii.addr_mask;
-	value |= (phyreg << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 
 	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
 		& priv->hw->mii.clk_csr_mask;
 
 	value |= MII_GMAC4_WRITE;
 	value |= MII_GMAC4_C45E;
-	value &= ~priv->hw->mii.reg_mask;
 	value |= (devad << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 
 	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
-- 
2.47.2


