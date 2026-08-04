Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D467C55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EHrfZCeEKsW5ZobV2bgaaWSU2xyMJTHmh3/uEvE5ZQ=; b=jW0GlnrJeNdhwhfwGCcfv+hpFZ
	zgn8T4l5KFDA4jIpz99dmCueFCL98SgYjdhvLUG0W4VBo/05R0FXE9B3MspEccQor0ddB3jfsloVm
	hSkz1PfnouaW6z9cDHvEiyNBqBaEwBNq573m06pmG0s4mf30uTkqvzq5k0u+MuIoMYqmcxmBZZhR/
	wGYp5N5Wt3j4bb0q0xDRLfphz6YetlYX2MTK9BajiZeoqTjjs8+QWqHtvVEXpQ/jla44BlFgRnSAs
	GzycrxJ3ZbmR9n92Ba7kMSjCjuj5mfh5FoSXD6g2/oXzdcMcF7X8QwB1c/rpiLoEqRiSQyl3fGQ+h
	qjigehOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5YE-00000000tRa-1Ho4;
	Tue, 04 Aug 2026 03:10:46 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5YA-00000000tOa-16sr;
	Tue, 04 Aug 2026 03:10:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wr5Y4-0000000044m-2k4S;
	Tue, 04 Aug 2026 03:10:36 +0000
Date: Tue, 4 Aug 2026 04:10:33 +0100
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
Subject: [PATCH net v2 2/6] net: dsa: mt7530: check bus->read() error in
 core_rmw()
Message-ID: <48bb9f0b311a9efeda2a6b24a7e05d4792393a3b.1785811140.git.daniel@makrotopia.org>
References: <cover.1785811140.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1785811140.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_201042_299226_2B6D74A2 
X-CRM114-Status: GOOD (  12.28  )
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

core_rmw() accesses the MMD core registers directly rather than
through the regmap and has the same unchecked bus->read() as the
one just fixed in the MDIO regmap backend: a negative errno is
consumed as register data, modified and written back to the switch.
Check the read and bail out like the surrounding bus accesses do.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v2: no changes

 drivers/net/dsa/mt7530.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index aa33d94e11b5..9be6fb63c311 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -124,8 +124,12 @@ core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
 		goto err;
 
 	/* Read the content of the MMD's selected register */
-	val = bus->read(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
+	ret = bus->read(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
 			MII_MMD_DATA);
+	if (ret < 0)
+		goto err;
+	val = ret;
+
 	val &= ~mask;
 	val |= set;
 	/* Write the data into MMD's selected register */
-- 
2.55.0

