Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD008C44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyuwS38PfYwJJi1QJOBh4vgrGD72hR8pS22EH++wjHw=; b=i6qdI0CqC0eDb9aUBuAdOZNeUY
	iR9IoqKB9iwE1nrPrXLmXhFzufE65fOfGtj9b9HWX4OAaN847p8x+iRbPTzqocxhplqWY6TmRNqDA
	dSwxivdS/jrGPwoY9NVnK7PO3k82+PQ0myUBXmOENOnJ52yGm8n0uhk5e7+yL+JQ3SF4KdpLzFtFG
	D/2SAZ8Bh9PoAczvkqhqh2XZb0J7bwpbVnNnDfyNbBgdvJb5JZdB9oozfrOM+DS6sVDggLowJSpWz
	cdfcxX+i39T5DRvIYUBXDluPpjwv55Wr4lLCKbXWhyUC7DHp6AdXHtdR/cj0TlGjwPXuQnQbCfFvn
	IfdrM6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRq-0000000GtDa-08Zk;
	Wed, 08 Jul 2026 10:24:10 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRg-0000000Gt1R-0ShZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:24:02 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47df440fcd5so2865f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 03:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506238; x=1784111038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MyuwS38PfYwJJi1QJOBh4vgrGD72hR8pS22EH++wjHw=;
        b=s7znVFw7oTBP5yHrXawuPkMmX1rLPfUcvSo+VEcZocNw1Hz3O8+JQXmGuJTd7O2tRb
         UwnQBH69Zkv0cNnzCvGEzfcWvGMQ32vWvUNKq1shDl9aJKM7eNCmqrtZEUbhtC7VnpuD
         I+Jm2ZqaNjgw1W42aD+66gjs7+IO4UcejEJMsqJjHGhW4D/DFDapY1sRyTj7I6Amsv4k
         8JwNqocU2ZC/kTPcLCNXD3JP5R5lgfg1MKgLoxcBxAUNbSz4Qv2afwl6kYh7g0aBZ5VD
         Bk3RUZWsmMkSeltqCSIhok265DeH3mHahGJKn2OlsePO/xx1TDH3BGu3kJC9j+x+fJQt
         OStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506238; x=1784111038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MyuwS38PfYwJJi1QJOBh4vgrGD72hR8pS22EH++wjHw=;
        b=paVuDxr9KSRCiJLK8jnVgysfjJoEzgI2jEAA1Mhi7VOGIFt20oFaj3IyXlO/Rqxa1P
         Uhb7alXc1vrgnZo5GOAnpObpn59BYAVSsiZY2ul2v4tv4kj9Lh0k+/m4dhGaeULFoCiR
         TLbYHYtm7C/wDhzSVafrU3qxaeGlWDef+odujj0sY09bc1x4CVwz8ZF98WdO7x6rox06
         DQKgViSPRfBKU9qHegpmn7g0gPy/iJ5a82ZvxdwXKOEUzmVfSrYwnGYlhfLiu9TbfEnb
         lLWN8S4ZLTi6P8g0ZGwc0or6V86aWEvbkytmqW2zsMPx5KXPX584CUGaXlnlCEUL/biM
         DFgA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7xGnuhebflVkeyf4qYzPMgsuWsJA3D9FXoRyS8GD8cyQ7V4NMmobBqpDzb3eJUbANi5VW7wTsnUDEh0Mgg/T9@lists.infradead.org
X-Gm-Message-State: AOJu0YwBgLkGO5sIYzuXzniJlwTiLcq97WgWW0hU9P4DIA83uIL6s7F2
	mOtrAF2IJOfaoQ2dUDjUnrkmC+vIWqFqlu5v10v4+GDzomsUoaxKQPz7
X-Gm-Gg: AfdE7cn7FlhqsMEh25Kh7TIb0j/3frDUtAyi/ULaLKzh0ffDUTDi7EU+JzERWX+4VIf
	IxlOU+VX0HbUVXEQf3/hE82/U58om4Ckm0jJ5Eg1RrunWSKqkL+nVPIraeOApH+bLfkMQkahsrE
	B8BSf94ZTj4n+G1lsPGtKDlgFHGkvH5ReuZKAEeS76Q4apc6tov1lDyslVQ43niRU3pWdV8n5En
	NmGfOxSPATJ9uFPU743oy78foIY8RW/6CcpZ/OIGn2uact1MDTNwjJ88AE5guIbfldCyA/kDAHx
	G2oleAqUjPjS68w0ER9i89XbWY5SExh12Rrb7C4Th/X+tZJjDhHE3V/O/3SgCDkNTpcNKez7ygB
	rTV9oaBBgipBzoXTMhxGQKrGb/FlORTjV3ymJBynLWny6M3lZ0ESVFVasF8Uoxjdcnz0C2D23sx
	SpgKjcgWHJ3gIbguHd2oFQaGA6RoIZ7uJbQ4yG5RLV4SfzqKuslSsWfE8VWsnwJJGd9gLzkFUc/
	5MU+tOH
X-Received: by 2002:a05:6000:200b:b0:474:cd60:115a with SMTP id ffacd0b85a97d-47df07b5bedmr1889851f8f.18.1783506237895;
        Wed, 08 Jul 2026 03:23:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm40660248f8f.36.2026.07.08.03.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:23:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 5/5] net: phy: mediatek: add calibration logic for AN7583
Date: Wed,  8 Jul 2026 12:23:31 +0200
Message-ID: <20260708102341.53919-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708102341.53919-1-ansuelsmth@gmail.com>
References: <20260708102341.53919-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_032400_734115_62BA10D3 
X-CRM114-Status: GOOD (  19.94  )
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

Similar to Airoha AN7581 Switch PHY also the Airoha AN7583 SoC
requires dedicated calibration and tuneup to make EEE correctly work.

Airoha AN7583 differ from AN7581 by having a dedicated table for
calibration and additional EEE logic tuneup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/airoha-ge-soc.c | 227 ++++++++++++++++++++++-
 drivers/net/phy/mediatek/mtk.h           |   1 +
 2 files changed, 225 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mediatek/airoha-ge-soc.c b/drivers/net/phy/mediatek/airoha-ge-soc.c
index bc487b093cfa..601a64d83365 100644
--- a/drivers/net/phy/mediatek/airoha-ge-soc.c
+++ b/drivers/net/phy/mediatek/airoha-ge-soc.c
@@ -159,6 +159,106 @@ static u8 an7581_zcal_to_r45ohm[64] = {
 	 52,  50,  48,  46,  44,  42,  40,  39,  36,  35,  32,  32,  30,  28,  27,  25
 };
 
+/*
+ * 2 chip revision
+ * TXMR or discrete
+ * 2 MDI type
+ * TX AMP test/TX AMP 1G/TX AMP 100M/TX AMP 10M/R50
+ * 4 PHY
+ */
+static int an7583_tx_amp_compensation_tbl[TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX][CALIB_CONST_TYPE_MAX][4] = {
+	[TXMR] = {
+		[MDI_0R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { 4, 4, 0, 0 },
+			[R50_B] = { 4, 4, 0, 0 },
+			[R50_C] = { 5, 5, 3, 4 },
+			[R50_D] = { 4, 4, 4, 0 },
+		},
+		[MDI_5R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { -4, -4, -4, -4 },
+			[R50_B] = { -4, -4, -4, -4 },
+			[R50_C] = { -2, -2, -2, -2 },
+			[R50_D] = { -3, -3, -2, -2 },
+		},
+	},
+	[DISCRETE] = {
+		[MDI_0R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { 4, 4, 4, 4 },
+			[R50_B] = { 4, 4, 4, 4 },
+			[R50_C] = { 6, 6, 6, 6 },
+			[R50_D] = { 4, 4, 4, 4 },
+		},
+		[MDI_5R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { 0, 0, 0, 0 },
+			[R50_B] = { 0, 0, 0, 0 },
+			[R50_C] = { 0, 0, 0, 0 },
+			[R50_D] = { 0, 0, 0, 0 },
+		},
+	},
+};
+
+static u8 an7583_zcal_to_r50ohm_0R[64] = {
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
+	127, 127, 127, 122, 118, 114, 110, 106, 102,  98,  96,  92,  88,  85,  82,  80,
+	 76,  72,  70,  68,  64,  62,  60,  57,  55,  52,  50,  48,  46,  44,  41,  40,
+	 38,  36,  33,  32,  30,  28,  26,  24,  24,  22,  20,  18,  16,  16,  14,  12,
+};
+
+static u8 an7583_zcal_to_r50ohm_5R[64] = {
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 124, 120, 116, 112, 110, 106, 102,
+	 99,  96,  93,  90,  88,  84,  81,  79,  76,  73,  71,  68,  66,  64,  61,  59,
+	 56,  54,  52,  50,  48,  46,  44,  42,  40,  39,  37,  36,  33,  32,  31,  29,
+};
+
 static int airoha_cal_cycle(struct phy_device *phydev, int devad,
 			    u32 regnum, u16 mask, u16 cal_val)
 {
@@ -766,8 +866,9 @@ static int airoha_rx_offset_cal_sw(struct phy_device *phydev)
 	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, 0x171,
 			   BIT(8) | BIT(7));
 
-	phy_write_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_ANA_CAL_RG6,
-		      0x1);
+	if (phydev->drv->phy_id == AIROHA_GPHY_ID_AN7581)
+		phy_write_mmd(phydev, MDIO_MMD_VEND1,
+			      MTK_PHY_RG_ANA_CAL_RG6, 0x1);
 
 	return 0;
 }
@@ -1540,8 +1641,126 @@ static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
 
 static int an7583_phy_config_init(struct phy_device *phydev)
 {
+	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
+	struct phy_device *phydev_p0;
+	u8 phy_offset;
+	int ret;
+
 	/* BMCR_PDOWN is enabled by default */
-	return phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+	phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+
+	phydev_p0 = shared->phydev_p0;
+	phy_offset = phydev->mdio.addr - phydev_p0->mdio.addr;
+
+	/* FIXME: Read SoC MDI Resister Type if available or default to 5R */
+	shared->mdi_resister_type = MDI_5R;
+
+	shared->mdi_resister_type = MDI_5R;
+	if (shared->mdi_resister_type == MDI_0R)
+		shared->r50_cal_tbl = an7583_zcal_to_r50ohm_0R;
+	if (shared->mdi_resister_type == MDI_5R)
+		shared->r50_cal_tbl = an7583_zcal_to_r50ohm_5R;
+	shared->tx_amp_compensation_tbl = &an7583_tx_amp_compensation_tbl;
+
+	ret = airoha_phy_calib(phydev);
+	if (ret)
+		return ret;
+
+	ret = airoha_phy_auto_select_transformer(phydev);
+	if (ret)
+		return ret;
+
+	ret = airoha_phy_tx_amp_compensation(phydev);
+	if (ret)
+		return ret;
+
+	/* Enable Idle Mode Power Setting */
+	if (phy_offset == 0) {
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x268, 0x07F1);
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x703, 0x3111);
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x271, 0x3C24);
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x701, 0x1023);
+	}
+
+	if (shared->transformer_type[phy_offset] == TXMR) {
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x23, 0x0881);
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x24, 0x0881);
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x25, 0x0881);
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x26, 0x0881);
+
+		if (shared->mdi_resister_type == MDI_0R)
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0205);
+		else
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0200);
+	} else {
+		if (shared->mdi_resister_type == MDI_0R) {
+			/* RX setting for 5R_TXMR before AN setting */
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xe7, 0x6666);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xe9, 0x0003);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xfe, 0x0006);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xe6, 0x1111);
+			/* 100M sharp */
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x23, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x24, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x25, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x26, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x01, 0x01cb);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x02, 0x01c2);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x03, 0x0108);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x04, 0x0211);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0205);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x06, 0x0387);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x07, 0x03ce);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x08, 0x03c8);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x0b, 0x0005);
+		} else {
+			/* 100M sharp */
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x23, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x24, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x25, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x26, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x00, 0x0195);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x01, 0x01cb);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x02, 0x01c2);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x03, 0x0108);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x04, 0x0211);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0205);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x06, 0x0387);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x07, 0x03ce);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x08, 0x03c3);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x0a, 0x0010);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x0b, 0x0005);
+		}
+	}
+
+	/* RX Setting */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x3c, 0xc000);
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x3d, 0x0000);
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x3e, 0xc000);
+
+	/* EEE setting */
+	phy_write_mmd(phydev, MDIO_MMD_AN, 0x3c, 0x0000);
+
+	/* 10M settings */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x1a3, 0x00d2);
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x1a4, 0x010e);
+	phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x27b, 0x1177);
+	phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x27c, 0x0808);
+
+	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_3);
+	__phy_write(phydev, 0x14, 0x190);
+	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
+
+	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_1);
+	__phy_write(phydev, 0x14, 0x3a18);
+	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
+
+	phy_write(phydev, 0x9, 0x0600);
+
+	/* EEE keep only Pair A ON */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x630, 0x006E);
+
+	return 0;
 }
 
 static struct phy_driver mtk_socphy_driver[] = {
@@ -1572,6 +1791,8 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.led_hw_control_set = mt798x_phy_led_hw_control_set,
 		.led_hw_control_get = mt798x_phy_led_hw_control_get,
 		.led_polarity_set = an7581_phy_led_polarity_set,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
 	},
 };
 
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index c690aaf38124..cd9d4c5550c3 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -13,6 +13,7 @@
 
 #define MTK_EXT_PAGE_ACCESS			0x1f
 #define MTK_PHY_PAGE_EXTENDED_1			0x0001
+#define MTK_PHY_PAGE_EXTENDED_3			0x0003
 #define MTK_PHY_PAGE_STANDARD			0x0000
 #define MTK_PHY_PAGE_EXTENDED_52B5		0x52b5
 
-- 
2.53.0


