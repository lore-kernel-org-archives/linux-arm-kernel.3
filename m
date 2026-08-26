Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36936C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZU8WCosT2iwViMPwgQE9ZFQQYyK49GXxTstdTLYAqs=; b=uVQnNrcF9Kc8NQTTqOqV6wntC9
	o1NHtTxWziOZB3m0jix5npe4LQ/i6MKP97gDjGOKbG2SYBTcOIC82EXwAFKyxmaPjC+BauE4lsH0u
	bPBUYBVXanC7iD+xzghicO5PXiBVuLsDoEpxjhY0x8VgGjEGl/ZrH29yc2jQH/45tbzEd9tG7H2hf
	rh4hhX2sSSCYZFxECwIwMgA83XsnwJyAFmgOSA2Ynqiyqt0oCYMKdYWZC2Z+M/8TDT4gyACL176lQ
	b1N2CDunoQJMr/dBF0Yk/6TTgeoG8IwTQmGVtOSV/vM+HdkMNA0PeMG6k3XMTtAPS3pH5WcsW2c+n
	J/oh8Jjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK7u-00000002zDe-2xiL;
	Wed, 26 Aug 2026 20:21:38 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK7n-00000002z6t-3qz7;
	Wed, 26 Aug 2026 20:21:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 721E81E61AB;
	Wed, 26 Aug 2026 22:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787775685; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=TZU8WCosT2iwViMPwgQE9ZFQQYyK49GXxTstdTLYAqs=;
	b=Fn8w0joDiDH2KVpPN9KCUzwsBfU6XnB4LQVYOb2yFyPjsLy2QKd8Zj+haCpLdmLurBaFa1
	+azFeEdVPqzNoBMkrDlrDQ+FjXoshgwpQyg6mlI0SZwf77KEFuZj+OeWthXs2pFC5Z/dHc
	5kuAnyMyRxi57S8YsQhRFk/R6DSiiupQYWtxXoWPD9UzQiAHu2ZGNVpVwyznkViGDViqbW
	Nuxyn9y70+WQq2mt6+y9X+5h72NmI4dqkbSUdgc/IZgto9FFwwF+jk5wuQj1dMJbjxyxte
	yizGwV6jKAhPyzLGWEAVZlgJltyniw9x3cvw7dNhbWA8TYXKN5xDozckN19B4Q==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org,
	ansuelsmth@gmail.com
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	dqfext@gmail.com,
	SkyLake.Huang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	cjd@cjdns.fr,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 net-next 1/3] net: phy: mediatek: move mtk_cal_cycle_wait to mtk-phy-lib
Date: Wed, 26 Aug 2026 20:21:01 +0000
Message-Id: <20260826202103.2280645-2-cjd@cjdns.fr>
In-Reply-To: <20260826202103.2280645-1-cjd@cjdns.fr>
References: <20260826202103.2280645-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_132132_469032_BEC6D222 
X-CRM114-Status: GOOD (  11.26  )
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

mtk_cal_cycle_wait() is shared between mtk-ge-soc.c and airoha-ge-soc.c
making airoha-ge-soc fail to build unless mtk-ge-soc is built too.

Move it to mtk-phy-lib.c which is for this purpose.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c  | 27 ------------------------
 drivers/net/phy/mediatek/mtk-ge-soc.h  |  3 ---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 29 ++++++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk.h         |  2 ++
 4 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 868ae089013d..614901a8b7f7 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -39,33 +39,6 @@ struct mtk_socphy_shared {
 	struct mtk_socphy_priv	priv[4];
 };
 
-int mtk_cal_cycle_wait(struct phy_device *phydev)
-{
-	int reg_val;
-	int ret;
-
-	phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CALIN,
-			 MTK_PHY_DA_CALIN_FLAG);
-
-	ret = phy_read_mmd_poll_timeout(phydev, MDIO_MMD_VEND1,
-					MTK_PHY_RG_AD_CAL_CLK, reg_val,
-					reg_val & MTK_PHY_DA_CAL_CLK, 500,
-					ANALOG_INTERNAL_OPERATION_MAX_US,
-					false);
-	if (ret) {
-		phydev_err(phydev, "Calibration cycle timeout\n");
-		return ret;
-	}
-
-	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CALIN,
-			   MTK_PHY_DA_CALIN_FLAG);
-	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP);
-	if (ret < 0)
-		return ret;
-
-	return FIELD_GET(MTK_PHY_AD_CAL_COMP_OUT_MASK, ret);
-}
-
 /* One calibration cycle consists of:
  * 1.Set DA_CALIN_FLAG high to start calibration. Keep it high
  *   until AD_CAL_COMP is ready to output calibration result.
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.h b/drivers/net/phy/mediatek/mtk-ge-soc.h
index 5e9d24a9833c..834b61dbc690 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.h
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.h
@@ -358,7 +358,4 @@ enum CAL_MODE {
 	SW_M
 };
 
-/* MTK GE SoC common functions */
-int mtk_cal_cycle_wait(struct phy_device *phydev);
-
 #endif /* _MTK_GE_SOC_H_ */
diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 8c2b26f9b840..e78dcc15f4e8 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -5,6 +5,7 @@
 #include <linux/netdevice.h>
 
 #include "mtk.h"
+#include "mtk-ge-soc.h"
 
 /* Difference between functions with mtk_tr* and __mtk_tr* prefixes is
  * mtk_tr* functions: wrapped by page switching operations
@@ -414,6 +415,34 @@ int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 };
 EXPORT_SYMBOL_GPL(mt798x_phy_led_hw_control_set);
 
+int mtk_cal_cycle_wait(struct phy_device *phydev)
+{
+	int reg_val;
+	int ret;
+
+	phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CALIN,
+			 MTK_PHY_DA_CALIN_FLAG);
+
+	ret = phy_read_mmd_poll_timeout(phydev, MDIO_MMD_VEND1,
+					MTK_PHY_RG_AD_CAL_CLK, reg_val,
+					reg_val & MTK_PHY_DA_CAL_CLK, 500,
+					ANALOG_INTERNAL_OPERATION_MAX_US,
+					false);
+	if (ret) {
+		phydev_err(phydev, "Calibration cycle timeout\n");
+		return ret;
+	}
+
+	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CALIN,
+			   MTK_PHY_DA_CALIN_FLAG);
+	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP);
+	if (ret < 0)
+		return ret;
+
+	return FIELD_GET(MTK_PHY_AD_CAL_COMP_OUT_MASK, ret);
+}
+EXPORT_SYMBOL_GPL(mtk_cal_cycle_wait);
+
 MODULE_DESCRIPTION("MediaTek Ethernet PHY driver common");
 MODULE_AUTHOR("Sky Huang <SkyLake.Huang@mediatek.com>");
 MODULE_AUTHOR("Daniel Golle <daniel@makrotopia.org>");
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index cd9d4c5550c3..950bc89d3c74 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -87,6 +87,8 @@ void __mtk_tr_clr_bits(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 int mtk_phy_read_page(struct phy_device *phydev);
 int mtk_phy_write_page(struct phy_device *phydev, int page);
 
+int mtk_cal_cycle_wait(struct phy_device *phydev);
+
 int mtk_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 				unsigned long rules,
 				unsigned long supported_triggers);
-- 
2.39.5


