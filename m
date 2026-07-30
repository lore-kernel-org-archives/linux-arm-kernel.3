Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77C0C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hi0SnNTThZVNSOG1XQSgLigEn72j1h3XIP+dXjCFjSk=; b=gDhIs91sshaN5ap/PLS1HW/Xve
	xKNBOaIPQMWhoHqGzRvy1vzzJtQAM0GlfSpheqv9JIfkMWkVGF5Cdj/by+I/ugsYAqNjCxh+dahmv
	U05cgytH1BQ0VKvf+5tut0pTnKeqJ0Ijf5ZegPNgh2AAVuTI6sKvcvUIL1vCruggtv3EAgg/4FXv/
	DzyNYJ4JAZfEskVmkMIH2geN53T9J6HSdPPOvgVRFFgIpTitTsARpIIgqGUTX4Pf3FMw8l4WaoPgd
	KlxBHRh3XKBXEVmkmYE7FPWlIej9+alp8s2FUm2woow62GETWDoIky+rBo8icCfwOe3oXohivWtp/
	/uMM3hsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTEP-0000000Avfm-3CmF;
	Thu, 30 Jul 2026 16:03:37 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTEG-0000000AvZe-2G91;
	Thu, 30 Jul 2026 16:03:29 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wpTE9-000000007WV-09gR;
	Thu, 30 Jul 2026 16:03:21 +0000
Date: Thu, 30 Jul 2026 17:03:17 +0100
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
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 2/4] net: dsa: mt7530: check bus->read() error in
 core_rmw()
Message-ID: <fe3926ab260b94d88d97ee5f417dab7dcf55f8fc.1785427248.git.daniel@makrotopia.org>
References: <cover.1785427248.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1785427248.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090328_576684_CAB43EE5 
X-CRM114-Status: GOOD (  12.23  )
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
---
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

