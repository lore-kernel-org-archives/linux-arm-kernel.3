Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D983CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 04:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVYioAhOAeafeuzi9Rf+Km/cEiV/WP+6O37owbjP1nU=; b=LW7ocKAaL52IdSjc9rPMlkra6t
	JD4s4BdEs100atdtuAjZ7PhLz+ixMoCbwPqUv4phbnsKuKrrjT7r5TCWaJG45FVKRlTBWKn/sxY14
	yhorMkPRTGZ8jiQkifs84gr0FM6rr0fTJTZjeQj7I+2YcI9XeVSitdq+ojcoBfLWwDGR+pFopxX/+
	02kyabwbXu6gMIMOvAitQjKigjjQ4fYqum7GeRs1k/BinWnkh/BWe1oa+8/xj48fh6ubWAnkqMLdM
	BHYovwKj1j33QPaSqxXjSrMlq4texjA/e5BWtOtgulwRPv0yaOs8cCp4nNpimi+KFBpBuYtu7dyvB
	rIUnLrkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMeon-0000000FThj-3y8E;
	Tue, 12 May 2026 04:34:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMeog-0000000FTVX-19TN;
	Tue, 12 May 2026 04:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778560431;
	bh=a59kRVQiR8XH63n+a6PWRw2wkz0pqXohRFcy4+WfMmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b/AiPDwz/H8nhUEcZUFOUKdq9VoDHlyM1RJ960APHAJ2wte21R6dqQiK5l8WTNOIx
	 BAGI+zNQGU3A3ox0R7WYmciLud1rxmAYFcHfY++hI8wlDK0FJVMmC5GNEtmfBnxh2X
	 hu/FyNA8HXiwu6pdX7zX2oo0rcmX8YKC/8jbtRNAAYb2ENrzT2oa4oa8NpjVTPPwO4
	 DoCNzQFQUVPSNEq1ssGScUjalVcK3rm7hJHXJvY5kiOoXiOCNvM7nCRiKsiR7QfMxL
	 l8y6jpNUF9u76bQcuGIXlgVEtydX3+fF70InxWiNOhl8098oENr9Wgo0a8oQmFleNu
	 5vGNIca4O2Y0Q==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8857817E15E3;
	Tue, 12 May 2026 06:33:50 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 12 May 2026 06:33:21 +0200
Subject: [PATCH net-next v3 4/6] net: phy: Rename Airoha common BuckPBus
 register accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-add-airoha-an8801-support-v3-4-1edb34e363ae@collabora.com>
References: <20260512-add-airoha-an8801-support-v3-0-1edb34e363ae@collabora.com>
In-Reply-To: <20260512-add-airoha-an8801-support-v3-0-1edb34e363ae@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com, 
 matthias.bgg@gmail.com, kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778560425; l=13313;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=a59kRVQiR8XH63n+a6PWRw2wkz0pqXohRFcy4+WfMmI=;
 b=eHuw3edwJpGLASeuGugjuJjL2mAfLlfZKF/KzuF3jvv/dOEvl9I525KCrFvVkVsPdloAmc1yy
 iZjb1qbL0YeBIwoRdhrQqSFbZTV8Xqz7x1/AetmRVVkH42vNSwdRpvr
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_213401_010576_E893381C 
X-CRM114-Status: GOOD (  15.94  )
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

Rename the BuckPBus register accessors functions present in air_phy_lib
and their calls in air_en8811h driver, so all exported functions start
with the same prefix.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/net/phy/air_en8811h.c | 110 +++++++++++++++++++++---------------------
 drivers/net/phy/air_phy_lib.c |  18 +++----
 drivers/net/phy/air_phy_lib.h |  12 ++---
 3 files changed, 71 insertions(+), 69 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 2498bd3f7993..a42898ae4135 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -287,8 +287,8 @@ static int en8811h_wait_mcu_ready(struct phy_device *phydev)
 {
 	int ret, reg_value;
 
-	ret = air_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
-				     EN8811H_FW_CTRL_1_FINISH);
+	ret = air_phy_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
+					 EN8811H_FW_CTRL_1_FINISH);
 	if (ret)
 		return ret;
 
@@ -313,28 +313,29 @@ static int an8811hb_check_crc(struct phy_device *phydev, u32 set1,
 	int ret;
 
 	/* Configure CRC */
-	ret = air_buckpbus_reg_modify(phydev, set1,
-				      AN8811HB_CRC_RD_EN,
-				      AN8811HB_CRC_RD_EN);
+	ret = air_phy_buckpbus_reg_modify(phydev, set1,
+					  AN8811HB_CRC_RD_EN,
+					  AN8811HB_CRC_RD_EN);
 	if (ret < 0)
 		return ret;
-	air_buckpbus_reg_read(phydev, set1, &pbus_value);
+	air_phy_buckpbus_reg_read(phydev, set1, &pbus_value);
 
 	do {
 		msleep(300);
-		air_buckpbus_reg_read(phydev, mon2, &pbus_value);
+		air_phy_buckpbus_reg_read(phydev, mon2, &pbus_value);
 
 		/* We do not know what errors this check is supposed
 		 * catch or what to do about a failure. So print the
 		 * result and continue like the vendor driver does.
 		 */
 		if (pbus_value & AN8811HB_CRC_ST) {
-			air_buckpbus_reg_read(phydev, mon3, &pbus_value);
+			air_phy_buckpbus_reg_read(phydev, mon3, &pbus_value);
 			phydev_dbg(phydev, "CRC Check %s!\n",
 				   pbus_value & AN8811HB_CRC_CHECK_PASS ?
 					"PASS" : "FAIL");
-			return air_buckpbus_reg_modify(phydev, set1,
-						       AN8811HB_CRC_RD_EN, 0);
+			return air_phy_buckpbus_reg_modify(phydev, set1,
+							   AN8811HB_CRC_RD_EN,
+							   0);
 		}
 	} while (--retry);
 
@@ -346,8 +347,8 @@ static void en8811h_print_fw_version(struct phy_device *phydev)
 {
 	struct en8811h_priv *priv = phydev->priv;
 
-	air_buckpbus_reg_read(phydev, EN8811H_FW_VERSION,
-			      &priv->firmware_version);
+	air_phy_buckpbus_reg_read(phydev, EN8811H_FW_VERSION,
+				  &priv->firmware_version);
 	phydev_info(phydev, "MD32 firmware version: %08x\n",
 		    priv->firmware_version);
 }
@@ -372,8 +373,8 @@ static int an8811hb_load_firmware(struct phy_device *phydev)
 {
 	int ret;
 
-	ret = air_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
-				     EN8811H_FW_CTRL_1_START);
+	ret = air_phy_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
+					 EN8811H_FW_CTRL_1_START);
 	if (ret < 0)
 		return ret;
 
@@ -414,14 +415,14 @@ static int en8811h_load_firmware(struct phy_device *phydev)
 	if (ret < 0)
 		goto en8811h_load_firmware_rel1;
 
-	ret = air_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
-				     EN8811H_FW_CTRL_1_START);
+	ret = air_phy_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
+					 EN8811H_FW_CTRL_1_START);
 	if (ret < 0)
 		goto en8811h_load_firmware_out;
 
-	ret = air_buckpbus_reg_modify(phydev, EN8811H_FW_CTRL_2,
-				      EN8811H_FW_CTRL_2_LOADING,
-				      EN8811H_FW_CTRL_2_LOADING);
+	ret = air_phy_buckpbus_reg_modify(phydev, EN8811H_FW_CTRL_2,
+					  EN8811H_FW_CTRL_2_LOADING,
+					  EN8811H_FW_CTRL_2_LOADING);
 	if (ret < 0)
 		goto en8811h_load_firmware_out;
 
@@ -433,8 +434,8 @@ static int en8811h_load_firmware(struct phy_device *phydev)
 	if (ret < 0)
 		goto en8811h_load_firmware_out;
 
-	ret = air_buckpbus_reg_modify(phydev, EN8811H_FW_CTRL_2,
-				      EN8811H_FW_CTRL_2_LOADING, 0);
+	ret = air_phy_buckpbus_reg_modify(phydev, EN8811H_FW_CTRL_2,
+					  EN8811H_FW_CTRL_2_LOADING, 0);
 	if (ret < 0)
 		goto en8811h_load_firmware_out;
 
@@ -460,8 +461,8 @@ static int en8811h_restart_mcu(struct phy_device *phydev)
 {
 	int ret;
 
-	ret = air_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
-				     EN8811H_FW_CTRL_1_START);
+	ret = air_phy_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
+					 EN8811H_FW_CTRL_1_START);
 	if (ret < 0)
 		return ret;
 
@@ -755,7 +756,7 @@ static unsigned long an8811hb_clk_recalc_rate(struct clk_hw *hw,
 	u32 pbus_value;
 	int ret;
 
-	ret = air_buckpbus_reg_read(phydev, AN8811HB_HWTRAP2, &pbus_value);
+	ret = air_phy_buckpbus_reg_read(phydev, AN8811HB_HWTRAP2, &pbus_value);
 	if (ret < 0)
 		return ret;
 
@@ -767,9 +768,9 @@ static int an8811hb_clk_enable(struct clk_hw *hw)
 	struct en8811h_priv *priv = clk_hw_to_en8811h_priv(hw);
 	struct phy_device *phydev = priv->phydev;
 
-	return air_buckpbus_reg_modify(phydev, AN8811HB_CLK_DRV,
-				       AN8811HB_CLK_DRV_CKO_MASK,
-				       AN8811HB_CLK_DRV_CKO_MASK);
+	return air_phy_buckpbus_reg_modify(phydev, AN8811HB_CLK_DRV,
+					   AN8811HB_CLK_DRV_CKO_MASK,
+					   AN8811HB_CLK_DRV_CKO_MASK);
 }
 
 static void an8811hb_clk_disable(struct clk_hw *hw)
@@ -777,8 +778,8 @@ static void an8811hb_clk_disable(struct clk_hw *hw)
 	struct en8811h_priv *priv = clk_hw_to_en8811h_priv(hw);
 	struct phy_device *phydev = priv->phydev;
 
-	air_buckpbus_reg_modify(phydev, AN8811HB_CLK_DRV,
-				AN8811HB_CLK_DRV_CKO_MASK, 0);
+	air_phy_buckpbus_reg_modify(phydev, AN8811HB_CLK_DRV,
+				    AN8811HB_CLK_DRV_CKO_MASK, 0);
 }
 
 static int an8811hb_clk_is_enabled(struct clk_hw *hw)
@@ -788,7 +789,7 @@ static int an8811hb_clk_is_enabled(struct clk_hw *hw)
 	u32 pbus_value;
 	int ret;
 
-	ret = air_buckpbus_reg_read(phydev, AN8811HB_CLK_DRV, &pbus_value);
+	ret = air_phy_buckpbus_reg_read(phydev, AN8811HB_CLK_DRV, &pbus_value);
 	if (ret < 0)
 		return ret;
 
@@ -854,7 +855,7 @@ static unsigned long en8811h_clk_recalc_rate(struct clk_hw *hw,
 	u32 pbus_value;
 	int ret;
 
-	ret = air_buckpbus_reg_read(phydev, EN8811H_HWTRAP1, &pbus_value);
+	ret = air_phy_buckpbus_reg_read(phydev, EN8811H_HWTRAP1, &pbus_value);
 	if (ret < 0)
 		return ret;
 
@@ -866,9 +867,9 @@ static int en8811h_clk_enable(struct clk_hw *hw)
 	struct en8811h_priv *priv = clk_hw_to_en8811h_priv(hw);
 	struct phy_device *phydev = priv->phydev;
 
-	return air_buckpbus_reg_modify(phydev, EN8811H_CLK_CGM,
-				       EN8811H_CLK_CGM_CKO,
-				       EN8811H_CLK_CGM_CKO);
+	return air_phy_buckpbus_reg_modify(phydev, EN8811H_CLK_CGM,
+					   EN8811H_CLK_CGM_CKO,
+					   EN8811H_CLK_CGM_CKO);
 }
 
 static void en8811h_clk_disable(struct clk_hw *hw)
@@ -876,8 +877,8 @@ static void en8811h_clk_disable(struct clk_hw *hw)
 	struct en8811h_priv *priv = clk_hw_to_en8811h_priv(hw);
 	struct phy_device *phydev = priv->phydev;
 
-	air_buckpbus_reg_modify(phydev, EN8811H_CLK_CGM,
-				EN8811H_CLK_CGM_CKO, 0);
+	air_phy_buckpbus_reg_modify(phydev, EN8811H_CLK_CGM,
+				    EN8811H_CLK_CGM_CKO, 0);
 }
 
 static int en8811h_clk_is_enabled(struct clk_hw *hw)
@@ -887,7 +888,7 @@ static int en8811h_clk_is_enabled(struct clk_hw *hw)
 	u32 pbus_value;
 	int ret;
 
-	ret = air_buckpbus_reg_read(phydev, EN8811H_CLK_CGM, &pbus_value);
+	ret = air_phy_buckpbus_reg_read(phydev, EN8811H_CLK_CGM, &pbus_value);
 	if (ret < 0)
 		return ret;
 
@@ -998,9 +999,9 @@ static int an8811hb_probe(struct phy_device *phydev)
 		return ret;
 
 	/* Configure led gpio pins as output */
-	ret = air_buckpbus_reg_modify(phydev, AN8811HB_GPIO_OUTPUT,
-				      AN8811HB_GPIO_OUTPUT_345,
-				      AN8811HB_GPIO_OUTPUT_345);
+	ret = air_phy_buckpbus_reg_modify(phydev, AN8811HB_GPIO_OUTPUT,
+					  AN8811HB_GPIO_OUTPUT_345,
+					  AN8811HB_GPIO_OUTPUT_345);
 	if (ret < 0)
 		return ret;
 
@@ -1039,9 +1040,9 @@ static int en8811h_probe(struct phy_device *phydev)
 		return ret;
 
 	/* Configure led gpio pins as output */
-	ret = air_buckpbus_reg_modify(phydev, EN8811H_GPIO_OUTPUT,
-				      EN8811H_GPIO_OUTPUT_345,
-				      EN8811H_GPIO_OUTPUT_345);
+	ret = air_phy_buckpbus_reg_modify(phydev, EN8811H_GPIO_OUTPUT,
+					  EN8811H_GPIO_OUTPUT_345,
+					  EN8811H_GPIO_OUTPUT_345);
 	if (ret < 0)
 		return ret;
 
@@ -1061,9 +1062,9 @@ static int an8811hb_config_serdes_polarity(struct phy_device *phydev)
 		return ret;
 	if (pol == PHY_POL_NORMAL)
 		pbus_value |= AN8811HB_RX_POLARITY_NORMAL;
-	ret = air_buckpbus_reg_modify(phydev, AN8811HB_RX_POLARITY,
-				      AN8811HB_RX_POLARITY_NORMAL,
-				      pbus_value);
+	ret = air_phy_buckpbus_reg_modify(phydev, AN8811HB_RX_POLARITY,
+					  AN8811HB_RX_POLARITY_NORMAL,
+					  pbus_value);
 	if (ret < 0)
 		return ret;
 
@@ -1074,9 +1075,9 @@ static int an8811hb_config_serdes_polarity(struct phy_device *phydev)
 	pbus_value = 0;
 	if (pol == PHY_POL_NORMAL)
 		pbus_value |= AN8811HB_TX_POLARITY_NORMAL;
-	return air_buckpbus_reg_modify(phydev, AN8811HB_TX_POLARITY,
-				       AN8811HB_TX_POLARITY_NORMAL,
-				       pbus_value);
+	return air_phy_buckpbus_reg_modify(phydev, AN8811HB_TX_POLARITY,
+					   AN8811HB_TX_POLARITY_NORMAL,
+					   pbus_value);
 }
 
 static int en8811h_config_serdes_polarity(struct phy_device *phydev)
@@ -1110,9 +1111,10 @@ static int en8811h_config_serdes_polarity(struct phy_device *phydev)
 	if (pol == PHY_POL_NORMAL)
 		pbus_value |= EN8811H_POLARITY_TX_NORMAL;
 
-	return air_buckpbus_reg_modify(phydev, EN8811H_POLARITY,
-				       EN8811H_POLARITY_RX_REVERSE |
-				       EN8811H_POLARITY_TX_NORMAL, pbus_value);
+	return air_phy_buckpbus_reg_modify(phydev, EN8811H_POLARITY,
+					   EN8811H_POLARITY_RX_REVERSE |
+					   EN8811H_POLARITY_TX_NORMAL,
+					   pbus_value);
 }
 
 static int an8811hb_config_init(struct phy_device *phydev)
@@ -1264,8 +1266,8 @@ static int en8811h_read_status(struct phy_device *phydev)
 				 val & MDIO_AN_10GBT_STAT_LP2_5G);
 	} else {
 		/* Get link partner 2.5GBASE-T ability from vendor register */
-		ret = air_buckpbus_reg_read(phydev, EN8811H_2P5G_LPA,
-					    &pbus_value);
+		ret = air_phy_buckpbus_reg_read(phydev, EN8811H_2P5G_LPA,
+						&pbus_value);
 		if (ret < 0)
 			return ret;
 		linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
index 687c59197b16..1212dd0a37b7 100644
--- a/drivers/net/phy/air_phy_lib.c
+++ b/drivers/net/phy/air_phy_lib.c
@@ -136,8 +136,8 @@ static int __air_buckpbus_reg_modify(struct phy_device *phydev,
 	return 0;
 }
 
-int air_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
-			  u32 *pbus_data)
+int air_phy_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
+			      u32 *pbus_data)
 {
 	int saved_page;
 	int ret = 0;
@@ -153,10 +153,10 @@ int air_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
 
 	return phy_restore_page(phydev, saved_page, ret);
 }
-EXPORT_SYMBOL_GPL(air_buckpbus_reg_read);
+EXPORT_SYMBOL_GPL(air_phy_buckpbus_reg_read);
 
-int air_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
-			   u32 pbus_data)
+int air_phy_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
+			       u32 pbus_data)
 {
 	int saved_page;
 	int ret = 0;
@@ -173,10 +173,10 @@ int air_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
 
 	return phy_restore_page(phydev, saved_page, ret);
 }
-EXPORT_SYMBOL_GPL(air_buckpbus_reg_write);
+EXPORT_SYMBOL_GPL(air_phy_buckpbus_reg_write);
 
-int air_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
-			    u32 mask, u32 set)
+int air_phy_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
+				u32 mask, u32 set)
 {
 	int saved_page;
 	int ret = 0;
@@ -193,7 +193,7 @@ int air_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
 
 	return phy_restore_page(phydev, saved_page, ret);
 }
-EXPORT_SYMBOL_GPL(air_buckpbus_reg_modify);
+EXPORT_SYMBOL_GPL(air_phy_buckpbus_reg_modify);
 
 int air_phy_read_page(struct phy_device *phydev)
 {
diff --git a/drivers/net/phy/air_phy_lib.h b/drivers/net/phy/air_phy_lib.h
index b637f3e0f2d5..a2f8b3725761 100644
--- a/drivers/net/phy/air_phy_lib.h
+++ b/drivers/net/phy/air_phy_lib.h
@@ -27,12 +27,12 @@
 #define AIR_BPBUS_RD_DATA_HIGH		0x17
 #define AIR_BPBUS_RD_DATA_LOW		0x18
 
-int air_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
-			    u32 mask, u32 set);
-int air_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
-			  u32 *pbus_data);
-int air_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
-			   u32 pbus_data);
+int air_phy_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
+				u32 mask, u32 set);
+int air_phy_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
+			      u32 *pbus_data);
+int air_phy_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
+			       u32 pbus_data);
 int air_phy_read_page(struct phy_device *phydev);
 int air_phy_write_page(struct phy_device *phydev, int page);
 

-- 
2.54.0


