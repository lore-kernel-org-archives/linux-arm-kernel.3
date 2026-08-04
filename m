Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9E8C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYTa3ZE9dRcwXkxbRMPTGVFyhxJPiPFKrBnC2eG24oU=; b=AES2w7/eOCzybytf/XOuafboWG
	F75N+B7+RIJs6uiherkGxqdqV+riBzfe7bbHCAhI15m8kfAD/1r43pNlRuRUvW3s7uEPKd6wScM/2
	MUl17l2DwOIRxuCXwmEDZEY07AjAqnWEYqVRFwmEwZ6pABih8YlwDLNCOJ+iRJCqBRCYOmzDpiowb
	koTaVVZSuTjGScntkxv3fKRgOyrbzL6sf416XutWcO30Clx4Z6W8Bfa8BGbcmltev0l/MCyhrpNQ3
	lXyFmPKMsgaqlZGMgtD1u5CbUF3+lQrbXYywcGrvmWM3/vrgPIbwQXwP+AmzpoMRM2zYVAEXHZqNx
	fvFPFMUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5YP-00000000tcJ-13QS;
	Tue, 04 Aug 2026 03:10:57 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5YN-00000000tZg-2E4P;
	Tue, 04 Aug 2026 03:10:56 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wr5YH-0000000045u-3fjr;
	Tue, 04 Aug 2026 03:10:49 +0000
Date: Tue, 4 Aug 2026 04:10:46 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2 4/6] net: dsa: mt7530: check CORE_PLL_GROUP4 access in
 mt7531_setup()
Message-ID: <a7dfe3b66ea6ac1ae7915034de0527060e6ddcd4.1785811140.git.daniel@makrotopia.org>
References: <cover.1785811140.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1785811140.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_201055_572180_D4C7385F 
X-CRM114-Status: GOOD (  13.33  )
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

mt7531_setup() reads CORE_PLL_GROUP4 through the MT7531 indirect c45
PHY access, modifies it and writes it back to enable the PHY core
PLL, but checks neither the read nor the write. Now that the indirect
access functions propagate command-write failures, a failed read
returns a negative errno that would be bit-modified and written back
into the PLL register, and a failed write-back would go unnoticed.
Check both and bail out. The adjacent EEE advertisement writes push a
constant value and cannot corrupt state, so they are left as is.

Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: new patch

 drivers/net/dsa/mt7530.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2a17696e6a45..69cee61564cb 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2781,14 +2781,20 @@ mt7531_setup(struct dsa_switch *ds)
 	 * phy_[read,write]_mmd_indirect is called, we provide our own
 	 * mt7531_ind_mmd_phy_[read,write] to complete this function.
 	 */
-	val = mt7531_ind_c45_phy_read(priv,
+	ret = mt7531_ind_c45_phy_read(priv,
 				      MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
 				      MDIO_MMD_VEND2, CORE_PLL_GROUP4);
+	if (ret < 0)
+		return ret;
+
+	val = ret;
 	val |= MT7531_RG_SYSPLL_DMY2 | MT7531_PHY_PLL_BYPASS_MODE;
 	val &= ~MT7531_PHY_PLL_OFF;
-	mt7531_ind_c45_phy_write(priv,
-				 MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
-				 MDIO_MMD_VEND2, CORE_PLL_GROUP4, val);
+	ret = mt7531_ind_c45_phy_write(priv,
+				       MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
+				       MDIO_MMD_VEND2, CORE_PLL_GROUP4, val);
+	if (ret < 0)
+		return ret;
 
 	/* Disable EEE advertisement on the switch PHYs. */
 	for (i = MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr);
-- 
2.55.0

