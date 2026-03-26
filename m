Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE99510A3D80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWDMfJdDB8Wh50z+MZN0l59Mti9VtkwYLC4j+E2Sgd0=; b=f/X9ib/ZgyXL2KqndlecFCvwjq
	vqLykkLhpw6jxPxLijyCBRswn6rzT8qGAqf4t2R3lDDlkf0Lio5u49S0gRj+m55m/vRCZ5Cwjq/L2
	jkgPa7h2TrwfRSILBsURIlPvPUGAbCk5qhz/8ej/yV42Exp9lFYrZd7Pr4UpiCGB4iwg29iabHxwy
	+CnDO11RO9BV8e0mPRbDmZhlrXAbqjbUfnuGctvJiDnBt5dhHsauzRlstB2tip5WyGuYLrf6HJmMy
	547yKOk+qmoJ72PwfBOfTldO3LKeNgR4EjssMhi/6fIgRdGtrHWu7Gv9f3tKJXvCCGwRrOxj4NCOZ
	BdqGfwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jTG-00000005P7M-34D5;
	Thu, 26 Mar 2026 12:05:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jSy-00000005Ovw-00Vo;
	Thu, 26 Mar 2026 12:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774526733;
	bh=yoTbL7Lk5kFWSSwVOfmBihcqssZrWTTbS3RQVaXEF9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eTweHEKY81VrQKGjekC2kt4ULWrzTSZOiZiL5ALS++CuKmfThoDfarITrzsLR2qmc
	 u0it9XRxiljH7N3KoBOQO0dkP1ZepEGnQ5giJcQHDEenOfV1zJM3Mj+PMQHJNd21Q8
	 YA+qPSLORhYPSn+2RkuARgkcU4kXsE7vgB/dUC0Zr3QUIyULdDdt5a+Qf/6F4vGWZX
	 fN53Ooolh6GlwXNATiO3hal/gT96pVG6fSZyRoYeRjHrcZOAuaYLY5EFs/nrj08Ewp
	 VmLX4uMcYwtVYw1E3zmODtczOWfYCzqwje01xRr6hLoquadR8tnKAk57rp5cVwFe+g
	 N4q7XhYYPilHQ==
Received: from yukiji.home (lfbn-idf1-1-2269-27.w92-151.abo.wanadoo.fr [92.151.67.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D06C117E60C6;
	Thu, 26 Mar 2026 13:05:32 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 26 Mar 2026 13:04:14 +0100
Subject: [PATCH net-next v2 3/4] net: phy: air_phy_lib: Factorize BuckPBus
 register accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-add-airoha-an8801-support-v2-3-1a42d6b6050f@collabora.com>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
In-Reply-To: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774526729; l=22764;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=yoTbL7Lk5kFWSSwVOfmBihcqssZrWTTbS3RQVaXEF9w=;
 b=gL5ij06YyPZvu6hv8zHXZbZ/48SqYkqzfXeWmBdBeNp+kR8XWMz58XMmgc7+e07BtuZAF+9pK
 ij+WnOgqQKpBUditHsP0MvCHG1+aVTRDdmeV0vNoKZdqEpUSiLx5S9T
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_050536_340510_F10CB436 
X-CRM114-Status: GOOD (  17.23  )
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

In preparation of Airoha AN8801R PHY support, move the BuckPBus
register accessors and definitions, present in air_en8811h driver,
into the Airoha PHY shared code (air_phy_lib), so they will be usable
by the new driver without duplicating them.
Also, update air_en8811h driver to use the new function names.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/net/phy/air_en8811h.c | 303 ++++++++----------------------------------
 drivers/net/phy/air_phy_lib.c | 180 +++++++++++++++++++++++++
 drivers/net/phy/air_phy_lib.h |  23 ++++
 3 files changed, 259 insertions(+), 247 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index be7c3426182a26fe3799b875827750e7772caadd..a42898ae41358fe86072a55528a0ecff0eb5ec19 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -42,22 +42,6 @@
 #define   AIR_AUX_CTRL_STATUS_SPEED_1000	0x8
 #define   AIR_AUX_CTRL_STATUS_SPEED_2500	0xc
 
-#define   AIR_PHY_PAGE_STANDARD			0x0000
-#define   AIR_PHY_PAGE_EXTENDED_4		0x0004
-
-/* MII Registers Page 4*/
-#define AIR_BPBUS_MODE			0x10
-#define   AIR_BPBUS_MODE_ADDR_FIXED		0x0000
-#define   AIR_BPBUS_MODE_ADDR_INCR		BIT(15)
-#define AIR_BPBUS_WR_ADDR_HIGH		0x11
-#define AIR_BPBUS_WR_ADDR_LOW		0x12
-#define AIR_BPBUS_WR_DATA_HIGH		0x13
-#define AIR_BPBUS_WR_DATA_LOW		0x14
-#define AIR_BPBUS_RD_ADDR_HIGH		0x15
-#define AIR_BPBUS_RD_ADDR_LOW		0x16
-#define AIR_BPBUS_RD_DATA_HIGH		0x17
-#define AIR_BPBUS_RD_DATA_LOW		0x18
-
 /* Registers on MDIO_MMD_VEND1 */
 #define EN8811H_PHY_FW_STATUS		0x8009
 #define   EN8811H_PHY_READY			0x02
@@ -245,183 +229,6 @@ static const unsigned long en8811h_led_trig = BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
 					      BIT(TRIGGER_NETDEV_RX)          |
 					      BIT(TRIGGER_NETDEV_TX);
 
-static int __air_buckpbus_reg_write(struct phy_device *phydev,
-				    u32 pbus_address, u32 pbus_data)
-{
-	int ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data));
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static int air_buckpbus_reg_write(struct phy_device *phydev,
-				  u32 pbus_address, u32 pbus_data)
-{
-	int saved_page;
-	int ret = 0;
-
-	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
-
-	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_write(phydev, pbus_address,
-					       pbus_data);
-		if (ret < 0)
-			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
-				   pbus_address, ret);
-	}
-
-	return phy_restore_page(phydev, saved_page, ret);
-}
-
-static int __air_buckpbus_reg_read(struct phy_device *phydev,
-				   u32 pbus_address, u32 *pbus_data)
-{
-	int pbus_data_low, pbus_data_high;
-	int ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
-	if (pbus_data_high < 0)
-		return pbus_data_high;
-
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
-	if (pbus_data_low < 0)
-		return pbus_data_low;
-
-	*pbus_data = pbus_data_low | (pbus_data_high << 16);
-	return 0;
-}
-
-static int air_buckpbus_reg_read(struct phy_device *phydev,
-				 u32 pbus_address, u32 *pbus_data)
-{
-	int saved_page;
-	int ret = 0;
-
-	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
-
-	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_read(phydev, pbus_address, pbus_data);
-		if (ret < 0)
-			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
-				   pbus_address, ret);
-	}
-
-	return phy_restore_page(phydev, saved_page, ret);
-}
-
-static int __air_buckpbus_reg_modify(struct phy_device *phydev,
-				     u32 pbus_address, u32 mask, u32 set)
-{
-	int pbus_data_low, pbus_data_high;
-	u32 pbus_data_old, pbus_data_new;
-	int ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
-	if (pbus_data_high < 0)
-		return pbus_data_high;
-
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
-	if (pbus_data_low < 0)
-		return pbus_data_low;
-
-	pbus_data_old = pbus_data_low | (pbus_data_high << 16);
-	pbus_data_new = (pbus_data_old & ~mask) | set;
-	if (pbus_data_new == pbus_data_old)
-		return 0;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data_new));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data_new));
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static int air_buckpbus_reg_modify(struct phy_device *phydev,
-				   u32 pbus_address, u32 mask, u32 set)
-{
-	int saved_page;
-	int ret = 0;
-
-	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
-
-	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_modify(phydev, pbus_address, mask,
-						set);
-		if (ret < 0)
-			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
-				   pbus_address, ret);
-	}
-
-	return phy_restore_page(phydev, saved_page, ret);
-}
-
 static int __air_write_buf(struct phy_device *phydev, u32 address,
 			   const struct firmware *fw)
 {
@@ -480,8 +287,8 @@ static int en8811h_wait_mcu_ready(struct phy_device *phydev)
 {
 	int ret, reg_value;
 
-	ret = air_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
-				     EN8811H_FW_CTRL_1_FINISH);
+	ret = air_phy_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
+					 EN8811H_FW_CTRL_1_FINISH);
 	if (ret)
 		return ret;
 
@@ -506,28 +313,29 @@ static int an8811hb_check_crc(struct phy_device *phydev, u32 set1,
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
 
@@ -539,8 +347,8 @@ static void en8811h_print_fw_version(struct phy_device *phydev)
 {
 	struct en8811h_priv *priv = phydev->priv;
 
-	air_buckpbus_reg_read(phydev, EN8811H_FW_VERSION,
-			      &priv->firmware_version);
+	air_phy_buckpbus_reg_read(phydev, EN8811H_FW_VERSION,
+				  &priv->firmware_version);
 	phydev_info(phydev, "MD32 firmware version: %08x\n",
 		    priv->firmware_version);
 }
@@ -565,8 +373,8 @@ static int an8811hb_load_firmware(struct phy_device *phydev)
 {
 	int ret;
 
-	ret = air_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
-				     EN8811H_FW_CTRL_1_START);
+	ret = air_phy_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
+					 EN8811H_FW_CTRL_1_START);
 	if (ret < 0)
 		return ret;
 
@@ -607,14 +415,14 @@ static int en8811h_load_firmware(struct phy_device *phydev)
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
 
@@ -626,8 +434,8 @@ static int en8811h_load_firmware(struct phy_device *phydev)
 	if (ret < 0)
 		goto en8811h_load_firmware_out;
 
-	ret = air_buckpbus_reg_modify(phydev, EN8811H_FW_CTRL_2,
-				      EN8811H_FW_CTRL_2_LOADING, 0);
+	ret = air_phy_buckpbus_reg_modify(phydev, EN8811H_FW_CTRL_2,
+					  EN8811H_FW_CTRL_2_LOADING, 0);
 	if (ret < 0)
 		goto en8811h_load_firmware_out;
 
@@ -653,8 +461,8 @@ static int en8811h_restart_mcu(struct phy_device *phydev)
 {
 	int ret;
 
-	ret = air_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
-				     EN8811H_FW_CTRL_1_START);
+	ret = air_phy_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
+					 EN8811H_FW_CTRL_1_START);
 	if (ret < 0)
 		return ret;
 
@@ -948,7 +756,7 @@ static unsigned long an8811hb_clk_recalc_rate(struct clk_hw *hw,
 	u32 pbus_value;
 	int ret;
 
-	ret = air_buckpbus_reg_read(phydev, AN8811HB_HWTRAP2, &pbus_value);
+	ret = air_phy_buckpbus_reg_read(phydev, AN8811HB_HWTRAP2, &pbus_value);
 	if (ret < 0)
 		return ret;
 
@@ -960,9 +768,9 @@ static int an8811hb_clk_enable(struct clk_hw *hw)
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
@@ -970,8 +778,8 @@ static void an8811hb_clk_disable(struct clk_hw *hw)
 	struct en8811h_priv *priv = clk_hw_to_en8811h_priv(hw);
 	struct phy_device *phydev = priv->phydev;
 
-	air_buckpbus_reg_modify(phydev, AN8811HB_CLK_DRV,
-				AN8811HB_CLK_DRV_CKO_MASK, 0);
+	air_phy_buckpbus_reg_modify(phydev, AN8811HB_CLK_DRV,
+				    AN8811HB_CLK_DRV_CKO_MASK, 0);
 }
 
 static int an8811hb_clk_is_enabled(struct clk_hw *hw)
@@ -981,7 +789,7 @@ static int an8811hb_clk_is_enabled(struct clk_hw *hw)
 	u32 pbus_value;
 	int ret;
 
-	ret = air_buckpbus_reg_read(phydev, AN8811HB_CLK_DRV, &pbus_value);
+	ret = air_phy_buckpbus_reg_read(phydev, AN8811HB_CLK_DRV, &pbus_value);
 	if (ret < 0)
 		return ret;
 
@@ -1047,7 +855,7 @@ static unsigned long en8811h_clk_recalc_rate(struct clk_hw *hw,
 	u32 pbus_value;
 	int ret;
 
-	ret = air_buckpbus_reg_read(phydev, EN8811H_HWTRAP1, &pbus_value);
+	ret = air_phy_buckpbus_reg_read(phydev, EN8811H_HWTRAP1, &pbus_value);
 	if (ret < 0)
 		return ret;
 
@@ -1059,9 +867,9 @@ static int en8811h_clk_enable(struct clk_hw *hw)
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
@@ -1069,8 +877,8 @@ static void en8811h_clk_disable(struct clk_hw *hw)
 	struct en8811h_priv *priv = clk_hw_to_en8811h_priv(hw);
 	struct phy_device *phydev = priv->phydev;
 
-	air_buckpbus_reg_modify(phydev, EN8811H_CLK_CGM,
-				EN8811H_CLK_CGM_CKO, 0);
+	air_phy_buckpbus_reg_modify(phydev, EN8811H_CLK_CGM,
+				    EN8811H_CLK_CGM_CKO, 0);
 }
 
 static int en8811h_clk_is_enabled(struct clk_hw *hw)
@@ -1080,7 +888,7 @@ static int en8811h_clk_is_enabled(struct clk_hw *hw)
 	u32 pbus_value;
 	int ret;
 
-	ret = air_buckpbus_reg_read(phydev, EN8811H_CLK_CGM, &pbus_value);
+	ret = air_phy_buckpbus_reg_read(phydev, EN8811H_CLK_CGM, &pbus_value);
 	if (ret < 0)
 		return ret;
 
@@ -1191,9 +999,9 @@ static int an8811hb_probe(struct phy_device *phydev)
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
 
@@ -1232,9 +1040,9 @@ static int en8811h_probe(struct phy_device *phydev)
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
 
@@ -1254,9 +1062,9 @@ static int an8811hb_config_serdes_polarity(struct phy_device *phydev)
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
 
@@ -1267,9 +1075,9 @@ static int an8811hb_config_serdes_polarity(struct phy_device *phydev)
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
@@ -1303,9 +1111,10 @@ static int en8811h_config_serdes_polarity(struct phy_device *phydev)
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
@@ -1457,8 +1266,8 @@ static int en8811h_read_status(struct phy_device *phydev)
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
index 04c4719a073f98ef75eabd54c4851f6a16391350..780ce2a17d3a58d5e3105534e9fea71bf3097b36 100644
--- a/drivers/net/phy/air_phy_lib.c
+++ b/drivers/net/phy/air_phy_lib.c
@@ -13,6 +13,186 @@
 
 #define AIR_EXT_PAGE_ACCESS		0x1f
 
+static int __air_buckpbus_reg_read(struct phy_device *phydev,
+				   u32 pbus_address, u32 *pbus_data)
+{
+	int pbus_data_low, pbus_data_high;
+	int ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
+			  upper_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
+			  lower_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	if (pbus_data_high < 0)
+		return pbus_data_high;
+
+	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	if (pbus_data_low < 0)
+		return pbus_data_low;
+
+	*pbus_data = pbus_data_low | (pbus_data_high << 16);
+	return 0;
+}
+
+static int __air_buckpbus_reg_write(struct phy_device *phydev,
+				    u32 pbus_address, u32 pbus_data)
+{
+	int ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
+			  upper_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
+			  lower_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
+			  upper_16_bits(pbus_data));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
+			  lower_16_bits(pbus_data));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int __air_buckpbus_reg_modify(struct phy_device *phydev,
+				     u32 pbus_address, u32 mask, u32 set)
+{
+	int pbus_data_low, pbus_data_high;
+	u32 pbus_data_old, pbus_data_new;
+	int ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
+			  upper_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
+			  lower_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	if (pbus_data_high < 0)
+		return pbus_data_high;
+
+	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	if (pbus_data_low < 0)
+		return pbus_data_low;
+
+	pbus_data_old = pbus_data_low | (pbus_data_high << 16);
+	pbus_data_new = (pbus_data_old & ~mask) | set;
+	if (pbus_data_new == pbus_data_old)
+		return 0;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
+			  upper_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
+			  lower_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
+			  upper_16_bits(pbus_data_new));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
+			  lower_16_bits(pbus_data_new));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+int air_phy_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
+			      u32 *pbus_data)
+{
+	int saved_page;
+	int ret = 0;
+
+	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
+
+	if (saved_page >= 0) {
+		ret = __air_buckpbus_reg_read(phydev, pbus_address, pbus_data);
+		if (ret < 0)
+			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
+				   pbus_address, ret);
+	}
+
+	return phy_restore_page(phydev, saved_page, ret);
+}
+EXPORT_SYMBOL_GPL(air_phy_buckpbus_reg_read);
+
+int air_phy_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
+			       u32 pbus_data)
+{
+	int saved_page;
+	int ret = 0;
+
+	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
+
+	if (saved_page >= 0) {
+		ret = __air_buckpbus_reg_write(phydev, pbus_address,
+					       pbus_data);
+		if (ret < 0)
+			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
+				   pbus_address, ret);
+	}
+
+	return phy_restore_page(phydev, saved_page, ret);
+}
+EXPORT_SYMBOL_GPL(air_phy_buckpbus_reg_write);
+
+int air_phy_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
+				u32 mask, u32 set)
+{
+	int saved_page;
+	int ret = 0;
+
+	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
+
+	if (saved_page >= 0) {
+		ret = __air_buckpbus_reg_modify(phydev, pbus_address, mask,
+						set);
+		if (ret < 0)
+			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
+				   pbus_address, ret);
+	}
+
+	return phy_restore_page(phydev, saved_page, ret);
+}
+EXPORT_SYMBOL_GPL(air_phy_buckpbus_reg_modify);
+
 int air_phy_read_page(struct phy_device *phydev)
 {
 	return __phy_read(phydev, AIR_EXT_PAGE_ACCESS);
diff --git a/drivers/net/phy/air_phy_lib.h b/drivers/net/phy/air_phy_lib.h
index dd501b175a3a38e57744f79571eb1bc4ef46fdf5..23d8e3e318398958f2bba297619f35a86f9871a9 100644
--- a/drivers/net/phy/air_phy_lib.h
+++ b/drivers/net/phy/air_phy_lib.h
@@ -8,6 +8,29 @@
 #ifndef __AIR_PHY_LIB_H
 #define __AIR_PHY_LIB_H
 
+#define AIR_PHY_PAGE_STANDARD		0x0000
+#define AIR_PHY_PAGE_EXTENDED_1		0x0001
+#define AIR_PHY_PAGE_EXTENDED_4		0x0004
+
+/* MII Registers Page 4*/
+#define AIR_BPBUS_MODE			0x10
+#define   AIR_BPBUS_MODE_ADDR_FIXED		0x0000
+#define   AIR_BPBUS_MODE_ADDR_INCR		BIT(15)
+#define AIR_BPBUS_WR_ADDR_HIGH		0x11
+#define AIR_BPBUS_WR_ADDR_LOW		0x12
+#define AIR_BPBUS_WR_DATA_HIGH		0x13
+#define AIR_BPBUS_WR_DATA_LOW		0x14
+#define AIR_BPBUS_RD_ADDR_HIGH		0x15
+#define AIR_BPBUS_RD_ADDR_LOW		0x16
+#define AIR_BPBUS_RD_DATA_HIGH		0x17
+#define AIR_BPBUS_RD_DATA_LOW		0x18
+
+int air_phy_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
+				u32 mask, u32 set);
+int air_phy_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
+			      u32 *pbus_data);
+int air_phy_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
+			       u32 pbus_data);
 int air_phy_read_page(struct phy_device *phydev);
 int air_phy_write_page(struct phy_device *phydev, int page);
 

-- 
2.53.0


