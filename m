Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C073FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZJk9iIuV2ZtYqSNu6/IHDZogtwF6sWyClO8J6khSNsA=; b=hrWVQpSqcNwdEGCj7LF7htK2hM
	cwy3yjA4FuaDdmkyeyl9AzwtxLaaXbWvlhqvhWADASBBvHlrquYrQiiEz2ser1TQ8yAn7LDcMrvm1
	e5u0//W9strpg1JIltQhjPPK/6iQxia79A1xcjO+gfs0qZuVOhTFoEIvgw4ijhYvbczddbLm8lcKZ
	xufnNiaJngODGGHkl/jOK2PO5dUXpS1HnCq+nikXW8NjqkXSBnwdJ+pRgecek/XWUeNqFjAduzncC
	8KwFlZop5vg7YhwrFB3XhG4Y6qCir7Srfnu7kLAt1vFjvQRb7P1YrU7P7FowrV1316u8DDjBUHSPs
	PJ3BxAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDoMx-00000006EPN-0IlE;
	Sat, 10 May 2025 17:52:15 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDoKt-00000006EMH-1NCu;
	Sat, 10 May 2025 17:50:08 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout4.routing.net (Postfix) with ESMTP id 0FB381003BB;
	Sat, 10 May 2025 17:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1746899400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZJk9iIuV2ZtYqSNu6/IHDZogtwF6sWyClO8J6khSNsA=;
	b=N6baxT28joV5PobXemFEQf3aHy//NBRJu5h1FppZg7CUlO5K2vaKkykWWLWuFN3Z5Qi+m/
	4aUx9ZMqr3ub0pMZqD8QDhU6T6lONQ+lChXAVa/DTw7j+e/isAzXlf5pL4el4CuZJcjGcw
	fu+v8GDpfkTETMeyTdQWmeuRmmtKR5k=
Received: from frank-u24.. (fttx-pool-157.180.226.129.bambit.de [157.180.226.129])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id C0A5980236;
	Sat, 10 May 2025 17:49:58 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next, PATCH v2] net: phy: mediatek: do not require syscon compatible for pio property
Date: Sat, 10 May 2025 19:49:32 +0200
Message-ID: <20250510174933.154589-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: c1fe3543-f69b-41e4-8960-f64da6740af7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_105007_542287_0EDBFAAD 
X-CRM114-Status: GOOD (  12.16  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Current implementation requires syscon compatible for pio property
which is used for driving the switch leds on mt7988.

Replace syscon_regmap_lookup_by_phandle with of_parse_phandle and
device_node_to_regmap to get the regmap already assigned by pinctrl
driver.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---

v2:
- out of RFC

---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 175cf5239bba..21975ef946d5 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -7,6 +7,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/phy.h>
 #include <linux/regmap.h>
+#include <linux/of.h>
 
 #include "../phylib.h"
 #include "mtk.h"
@@ -1319,6 +1320,7 @@ static int mt7988_phy_probe_shared(struct phy_device *phydev)
 {
 	struct device_node *np = dev_of_node(&phydev->mdio.bus->dev);
 	struct mtk_socphy_shared *shared = phy_package_get_priv(phydev);
+	struct device_node *pio_np;
 	struct regmap *regmap;
 	u32 reg;
 	int ret;
@@ -1336,7 +1338,13 @@ static int mt7988_phy_probe_shared(struct phy_device *phydev)
 	 * The 4 bits in TPBANK0 are kept as package shared data and are used to
 	 * set LED polarity for each of the LED0.
 	 */
-	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,pio");
+	pio_np = of_parse_phandle(np, "mediatek,pio", 0);
+	if (!pio_np)
+		return -ENODEV;
+
+	regmap = device_node_to_regmap(pio_np);
+	of_node_put(pio_np);
+
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-- 
2.43.0


