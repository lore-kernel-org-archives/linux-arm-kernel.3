Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A728C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 15:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lbrnp32zBlzDoe9yrenmDLqGbdobjnzv1C3nXLatAF0=; b=azgpPwQ5HYBXt3Bdpv6oFRxcpW
	Two0IGwC67WFuc7M4fp/+GSg4r/qonjj5dItAEK3TpIAfwygTB31FNmSyPLYvEoUPxgN9qh7M4tIx
	/rMpbisZqfLYPDS/SQy76h5s3nQNIRJxURr+8HT1BOyPo81RxmaQSu5VmCWdO/dr8NmzgG7iXbC2k
	aLZezZB9GE0HJ3mClFnA+Ph1n81Ab12CUWGyAU3UWcn/p7Xx2NHhY2N+IDl+lwQaqi/r6dSYkkFhF
	ao2lYumExP3DFzNtqQYx93YjOcfRYu4VRPfHN1J/+A77POjjX2HW7+0/wnuPFx5xPKZY8GpY632hu
	tMCJn2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uayNE-00000000IUy-3hMG;
	Sun, 13 Jul 2025 15:12:16 +0000
Received: from smtp-80.smtpout.orange.fr ([80.12.242.80] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uayKk-00000000IJc-20mZ;
	Sun, 13 Jul 2025 15:09:44 +0000
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id ayKXuhGW5bk8wayKYuwJrD; Sun, 13 Jul 2025 17:09:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1752419376;
	bh=lbrnp32zBlzDoe9yrenmDLqGbdobjnzv1C3nXLatAF0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ROma9nT+GTSVOPpxJhSq8uDpwkB+c0AgQ5ppcgoKc4o/MdmPamwRe0tJlAIdQUev1
	 9gph+AiqU4f+NY6DsiBBv9FtPnZslSiFuGuxqgwz/RyLrj6PylHbElYo/a/99xegbS
	 BhK/iKlvWR9Ld06wWFcpDS8Son4OS9XtDIYj9gZw8vEaSPw3oA5s/urh8BJdPVN3xE
	 Y7sOPRiWo347dq52QNyJBPwMgcH6WPktiN+eYtzt0CNN66TDPAg3GLDQDwKidxMWYy
	 HXt+riBxF8S9VCaKyoUW8q/df9zioI/+z8tYUh890Eo2Ma0mDFzpcDES6hD6i15mNM
	 RA/9Z58Td/9uQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 13 Jul 2025 17:09:36 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: dsa: mt7530: Constify struct regmap_config
Date: Sun, 13 Jul 2025 17:09:24 +0200
Message-ID: <1b20b2e717e9ff15aa0d1e73442dde613174cfef.1752419299.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_080942_926548_1F42EE09 
X-CRM114-Status: GOOD (  11.89  )
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

'struct regmap_config' are not modified in these drivers. They be
statically defined instead of allocated and populated at run-time.

The main benefits are:
  - it saves some memory at runtime
  - the structures can be declared as 'const', which is always better for
    structures that hold some function pointers
  - the code is less verbose

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/dsa/mt7530-mdio.c | 21 +++++++++------------
 drivers/net/dsa/mt7530-mmio.c | 21 ++++++++++-----------
 2 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index 51df42ccdbe6..0286a6cecb6f 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -136,10 +136,17 @@ static const struct of_device_id mt7530_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mt7530_of_match);
 
+static const struct regmap_config regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = MT7530_CREV,
+	.disable_locking = true,
+};
+
 static int
 mt7530_probe(struct mdio_device *mdiodev)
 {
-	static struct regmap_config *regmap_config;
 	struct mt7530_priv *priv;
 	struct device_node *dn;
 	int ret;
@@ -193,18 +200,8 @@ mt7530_probe(struct mdio_device *mdiodev)
 			return PTR_ERR(priv->io_pwr);
 	}
 
-	regmap_config = devm_kzalloc(&mdiodev->dev, sizeof(*regmap_config),
-				     GFP_KERNEL);
-	if (!regmap_config)
-		return -ENOMEM;
-
-	regmap_config->reg_bits = 16;
-	regmap_config->val_bits = 32;
-	regmap_config->reg_stride = 4;
-	regmap_config->max_register = MT7530_CREV;
-	regmap_config->disable_locking = true;
 	priv->regmap = devm_regmap_init(priv->dev, &mt7530_regmap_bus, priv,
-					regmap_config);
+					&regmap_config);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
index 842d74268e77..1dc8b93fb51a 100644
--- a/drivers/net/dsa/mt7530-mmio.c
+++ b/drivers/net/dsa/mt7530-mmio.c
@@ -18,10 +18,17 @@ static const struct of_device_id mt7988_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mt7988_of_match);
 
+static const struct regmap_config sw_regmap_config = {
+	.name = "switch",
+	.reg_bits = 16,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = MT7530_CREV,
+};
+
 static int
 mt7988_probe(struct platform_device *pdev)
 {
-	static struct regmap_config *sw_regmap_config;
 	struct mt7530_priv *priv;
 	void __iomem *base_addr;
 	int ret;
@@ -49,16 +56,8 @@ mt7988_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	sw_regmap_config = devm_kzalloc(&pdev->dev, sizeof(*sw_regmap_config), GFP_KERNEL);
-	if (!sw_regmap_config)
-		return -ENOMEM;
-
-	sw_regmap_config->name = "switch";
-	sw_regmap_config->reg_bits = 16;
-	sw_regmap_config->val_bits = 32;
-	sw_regmap_config->reg_stride = 4;
-	sw_regmap_config->max_register = MT7530_CREV;
-	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base_addr, sw_regmap_config);
+	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base_addr,
+					     &sw_regmap_config);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-- 
2.50.1


