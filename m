Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36664C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 01:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gnxWLFy4fnE0jN24eOCIKGzD4OoRh5h5ohMsvYqjVU=; b=pd3Snu+Rbkl5fQcrKGCFRSk1b5
	6fDB8lTM1U0ULw8QMqfya+VzLMIftGnBvFLTlo7GjyhPi2kzvOs7uUlazQQc4OG205XBZ2eMjWAym
	RuFfuDpC/3JZ4Djn14hnpKbyF0ww0PKDLYCMK0KWrz7aTq+5cUIO5CgN+PzCYqtLgQuoaLcsUjy3W
	uePMjdYLVNBeW3bCAZr7D++axad7vWtn1Tk+Do6r+vwLC6+JFsdYBiXyT2aaa0I5hPky402ptA3/U
	llzEW1P4MN957tqqOZWX/D7djXLVyYLFjv0f49cYd+WiQAQzuvc2g+homqstEVScNkw+tiokJLPtg
	Jr53A7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcgq-0000000C9ys-3SvL;
	Wed, 04 Jun 2025 01:13:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcMD-0000000C6QR-3Ju3;
	Wed, 04 Jun 2025 00:51:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8586B43A48;
	Wed,  4 Jun 2025 00:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D886AC4CEF1;
	Wed,  4 Jun 2025 00:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998313;
	bh=KQRPWiVIirFM5HlqIdlbktPx3zZ+EkbTpPF8djX4G4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F1+zSFVBNfUIC9vLfCMo8uqHv2WsFrb2wvRUwcgKSUsIEvZ+/Y4xEIJQ1kjnVslUc
	 4R4CoRqEG6uOf6njrxf9YkJfBui2tp/hf766naypq1FwskHmawSOAjShiz1cn4mvOW
	 W7QqP8MHyjVW6p+HqpFNBIEjN31PjhfFUxUXslop0J3yAIbuigQ9wJdw90a9NkbVev
	 hD0hHNe3GrgAEgszqIUCAgA2X1toNI0F1XZOBxqiY/YnoBX5PHbhVxLogMrpTEiarg
	 ob5RbAyQFQi+mf6d8Z/jofMUXS/RBHOc+mtJoQzbiikBk9Rt5NbtxCpBQR4LaKqGGU
	 gCHe61RIZXTQA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	daniel@makrotopia.org,
	dqfext@gmail.com,
	SkyLake.Huang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 029/118] net: phy: mediatek: do not require syscon compatible for pio property
Date: Tue,  3 Jun 2025 20:49:20 -0400
Message-Id: <20250604005049.4147522-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005049.4147522-1-sashal@kernel.org>
References: <20250604005049.4147522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_175153_871738_D3FE55FA 
X-CRM114-Status: GOOD (  18.52  )
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

[ Upstream commit 15d7b3dfafa98270eade6c77d2336790dde0a40d ]

Current implementation requires syscon compatible for pio property
which is used for driving the switch leds on mt7988.

Replace syscon_regmap_lookup_by_phandle with of_parse_phandle and
device_node_to_regmap to get the regmap already assigned by pinctrl
driver.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Link: https://patch.msgid.link/20250510174933.154589-1-linux@fw-web.de
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. ##
Analysis ### Core Issue Being Fixed The commit addresses a **device tree
compatibility problem** in the MediaTek MT7988 PHY driver. The original
code used `syscon_regmap_lookup_by_phandle()` which **requires** the
target device node to have a "syscon" compatible string. This created an
artificial requirement that forced users to modify their device trees
even when the pinctrl driver already provided the necessary regmap. ###
Code Changes Analysis The change is minimal but significant: ```c //
OLD: Forces syscon compatible requirement regmap =
syscon_regmap_lookup_by_phandle(np, "mediatek,pio"); // NEW: Works with
any regmap provider pio_np = of_parse_phandle(np, "mediatek,pio", 0);
regmap = device_node_to_regmap(pio_np); of_node_put(pio_np); ``` **Key
differences:** - `syscon_regmap_lookup_by_phandle()` requires "syscon"
compatible - `device_node_to_regmap()` works with any device that has
registered a regmap - Proper error handling maintained with
`of_node_put()` ### Why This Should Be Backported **1. Fixes Real User
Issues:** - MT7988 hardware is actively deployed (BananaPi R4,
networking devices) - Users cannot use PHY LED functionality without
modifying device trees - This affects real hardware in production, not
just development boards **2. Low Risk Change:** - Only 9 insertions, 1
deletion - No functional behavior change - same register access, same
error paths - Uses well-established kernel APIs - **Backward
compatible:** Still works with DTs that have syscon compatible -
**Forward compatible:** Also works with DTs that don't have syscon
compatible **3. High Impact Fix:** - Removes artificial device tree
constraints - Enables legitimate hardware configurations without DT
hacks - Prevents fragmentation of MT7988 ecosystem across kernel
versions - LED functionality is important for networking hardware
visibility **4. Fits Stable Criteria:** - Fixes important functionality
for users - Does not introduce new features - No architectural changes -
Confined to one driver/subsystem - Minimal regression risk ###
Comparison to Similar Commits Looking at the historical examples
provided, this commit is similar to "clk: mediatek: Get regmap without
syscon compatible check" which also moved from `syscon_node_to_regmap()`
to `device_node_to_regmap()` for the same compatibility reasons. The
pattern of removing unnecessary syscon requirements is well-established
and safe. ### Real-World Impact Without this fix, users with legitimate
device trees (where pinctrl doesn't have syscon compatible) cannot use
MT7988 PHY LED functionality. This forces them to either: 1. Patch their
device trees (not always possible in production) 2. Use older kernel
versions 3. Lose LED functionality entirely The commit solves a
**compatibility regression** rather than adding new functionality,
making it an ideal stable backport candidate.

 drivers/net/phy/mediatek/mtk-ge-soc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 175cf5239bba8..21975ef946d5b 100644
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
2.39.5


