Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD9DD2E9D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pzWR0nHPZgzau1jAACgTjvlIxFgfU4Rcx0RnFygIbRA=; b=A04cFGduX62QB0fvE11k8NwBxU
	tAqDWg56RoobfBptMSfl+8SSPBmAE0PTl1sDq1KnzvcQoMug1IszM0YpbdAShlP6zqPcdFheB8z/m
	BcDPQocEFrAuV1Krg/GQwBnxNs31pbtVZ98L7wnuXgAVxHdrhHRlWrVZexFRa2TBUOvkm5jVJR3+o
	ZeVHCoPJJe+QS6mhTubQDg9TPBo6xBz+AGd5rGIKuL0eyCJRbWm77I/v+qg+myirzHEUniMJXrZOS
	YGsiVWDAw5wbYzvKRBTA+ZriWRnNgjFpac3hHyKTT7xfXvzIne7tNK4L4aTmbgbyM98w+wuvGrmkO
	fGkAQlUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARp8-0000000HJaQ-0jlm;
	Mon, 11 Nov 2024 10:39:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARnL-0000000HJG8-31pI;
	Mon, 11 Nov 2024 10:37:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75965A41462;
	Mon, 11 Nov 2024 10:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86C0C4CED5;
	Mon, 11 Nov 2024 10:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731321438;
	bh=jNP3EEmQCRYGu8RVX1ba7R/suetM+TihlMSotd59zHY=;
	h=From:To:Cc:Subject:Date:From;
	b=jKHBPUQefIWzQGovAC+9QQCjuqX7+leHBXJqOsNjgQVSuF6OiCpOvaHlnDumrDreH
	 l2Sk+t9JTwk7SoJJPguosMtJAkKG6CDeAekLy7lKKSH2wryDDqNbimLwO//CQB4Idx
	 a77AcUqMxzLlJSEA78CqGMWrwmOnNSo2qQXNOpky4nQnB1cKdvGWtidhTnv/2C8ocF
	 f8Rh98ltcCqJBU8Xgvj74dIudRl4SRHRVdVGkf0eW34ixl/xgPLdeqpFll9FUIxJwK
	 dZICPzDmfB4A46avMMOYb0Li9M5siGskf591O0h/7RUw/2jPKHmj9YjdUcjhENPNE1
	 C5GEMWT8gvBKw==
From: Arnd Bergmann <arnd@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Yang Li <yang.lee@linux.alibaba.com>,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: stm32: work around constant-value overflow assertion
Date: Mon, 11 Nov 2024 11:37:02 +0100
Message-Id: <20241111103712.3520611-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_023719_917285_82FF27BF 
X-CRM114-Status: GOOD (  13.44  )
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

From: Arnd Bergmann <arnd@arndb.de>

FIELD_PREP() checks that a constant fits into the available bitfield,
but if one of the two lookup tables in stm32_impedance_tune() does
not find a matching entry, the index is out of range, which gcc
correctly complains about:

In file included from <command-line>:
In function 'stm32_impedance_tune',
    inlined from 'stm32_combophy_pll_init' at drivers/phy/st/phy-stm32-combophy.c:247:9:
include/linux/compiler_types.h:517:38: error: call to '__compiletime_assert_447' declared with attribute error: FIELD_PREP: value too large for the field
  517 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                      ^
include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   68 |   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
  115 |   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      |   ^~~~~~~~~~~~~~~~
drivers/phy/st/phy-stm32-combophy.c:162:8: note: in expansion of macro 'FIELD_PREP'
  162 |        FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
      |        ^~~~~~~~~~

Rework this so the field value gets set inside of the loop and otherwise
set to zero.

Fixes: 47e1bb6b4ba0 ("phy: stm32: Add support for STM32MP25 COMBOPHY.")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/phy/st/phy-stm32-combophy.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/st/phy-stm32-combophy.c b/drivers/phy/st/phy-stm32-combophy.c
index 765bb34fe358..49e9fa90a681 100644
--- a/drivers/phy/st/phy-stm32-combophy.c
+++ b/drivers/phy/st/phy-stm32-combophy.c
@@ -122,6 +122,7 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 	u32 max_vswing = imp_lookup[imp_size - 1].vswing[vswing_size - 1];
 	u32 min_vswing = imp_lookup[0].vswing[0];
 	u32 val;
+	u32 regval;
 
 	if (!of_property_read_u32(combophy->dev->of_node, "st,output-micro-ohms", &val)) {
 		if (val < min_imp || val > max_imp) {
@@ -129,16 +130,20 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 			return -EINVAL;
 		}
 
-		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++)
-			if (imp_lookup[imp_of].microohm <= val)
+		regval = 0;
+		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
+			if (imp_lookup[imp_of].microohm <= val) {
+				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
 				break;
+			}
+		}
 
 		dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
 			imp_lookup[imp_of].microohm);
 
 		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
 				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
-				   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of));
+				   regval);
 	} else {
 		regmap_read(combophy->regmap, SYSCFG_PCIEPRGCR, &val);
 		imp_of = FIELD_GET(STM32MP25_PCIEPRG_IMPCTRL_OHM, val);
@@ -150,16 +155,20 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 			return -EINVAL;
 		}
 
-		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++)
-			if (imp_lookup[imp_of].vswing[vswing_of] >= val)
+		regval = 0;
+		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
+			if (imp_lookup[imp_of].vswing[vswing_of] >= val) {
+				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
 				break;
+			}
+		}
 
 		dev_dbg(combophy->dev, "Set %u microvolt swing\n",
 			 imp_lookup[imp_of].vswing[vswing_of]);
 
 		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
 				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
-				   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
+				   regval);
 	}
 
 	return 0;
-- 
2.39.5


