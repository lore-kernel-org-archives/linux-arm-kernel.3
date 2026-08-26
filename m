Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D591C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+noM1/lXpgZGKBt7eeuTmKa1QPtazBxdbF1xRLnPiQ=; b=R6VFjckcN2QHFiJLQnAqn+ZygD
	8heOyYsU3XpryO3LPvETU6Mf0D6OIoJAXmt2Y6j8QFu0XtDR+LT/U5av/VboPFY6aEcYyM2P3w8gr
	+Ioeu/cji4Vu7aVmCG+YmreACRszrPrs9LKRRbRUspfQpi/RGPGUWmzw/5PoDD/I3AeUlDpf83Q1V
	BCQe0jUTTKdxq0RHEhSNVLT2RKnJ3DK7NyQNonS2z7jitAym3ca98Rj3h/mcdsfHHIYmzGH2hTqIz
	2gciSgCowplS687+hbUWCNm/Twu3Uu2olZK0UsFbJ5bKrOJeCgiBccTZifKCCSxK26bEEsfL94vVM
	UXEf7TRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK83-00000002zJO-3kUJ;
	Wed, 26 Aug 2026 20:21:47 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK7q-00000002z9z-2X2m;
	Wed, 26 Aug 2026 20:21:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B10561E5FE7;
	Wed, 26 Aug 2026 22:21:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787775691; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=L+noM1/lXpgZGKBt7eeuTmKa1QPtazBxdbF1xRLnPiQ=;
	b=KZxUu3jWcB8Wj04YuIEiD0AAWCmahX7viJ71lqem/xNvtW0AiTWYNlQ//LtOv8JsALeHnD
	jtlKwDSIrZAtVBdibarlqmSJLDy+6cYad3oFGkNs3MZBx1g/+JNkMfb5ULrVPT6txpqXy+
	DyNlQs8QHfxQ6WVBfCqOflhUZDHcjwFEFMz4jGeReJ9lffFMrt7z4OQGfNLXExGBXpGG3l
	48yeuRcCGEZnBS1wN2eGcV1DYCIM/uIpWlSzxuHFgEERgyfB5l8mNswtqJ8+OsPDIflNuz
	tAVufbo6DcscQzrqVJK4WX26QN+PcaLDe02PTTZ66r7wjwi87S2rIodkoCr8vw==
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
Subject: [PATCH v2 net-next 2/3] net: phy: mediatek: bug fixes to airoha-ge-soc.c
Date: Wed, 26 Aug 2026 20:21:02 +0000
Message-Id: <20260826202103.2280645-3-cjd@cjdns.fr>
In-Reply-To: <20260826202103.2280645-1-cjd@cjdns.fr>
References: <20260826202103.2280645-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_132135_146175_BB2D63AB 
X-CRM114-Status: GOOD (  10.78  )
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

Fix crash bug from unconfigured shared, potential namespace collision
in devm_phy_package_join() and typo in Kconfig.
Also make calibration tables const.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/phy/mediatek/Kconfig         |  2 +-
 drivers/net/phy/mediatek/airoha-ge-soc.c | 21 ++++++++++++---------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index fe51f4616c54..b8df1a8016c6 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -9,7 +9,7 @@ config AIROHA_GE_SOC_PHY
 	  Supports Airoha SoC built-in Gigabit Ethernet PHYs.
 
 	  Include support for built-in Ethernet PHYs which are present in
-	  the AN7581 and AN7583 SoCs. These PHYs d will dynamically
+	  the AN7581 and AN7583 SoCs. These PHYs will dynamically
 	  calibrate during startup.
 
 config MEDIATEK_2P5GE_PHY
diff --git a/drivers/net/phy/mediatek/airoha-ge-soc.c b/drivers/net/phy/mediatek/airoha-ge-soc.c
index 601a64d83365..5a8838a47184 100644
--- a/drivers/net/phy/mediatek/airoha-ge-soc.c
+++ b/drivers/net/phy/mediatek/airoha-ge-soc.c
@@ -50,8 +50,8 @@ struct airoha_socphy_shared {
 	enum airoha_transformer_type transformer_type[4];
 	enum airoha_mdi_resister_type mdi_resister_type;
 	bool rext_sw_calib_done;
-	int (*tx_amp_compensation_tbl)[TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX][CALIB_CONST_TYPE_MAX][4];
-	u8 *r50_cal_tbl;
+	const int (*tx_amp_compensation_tbl)[TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX][CALIB_CONST_TYPE_MAX][4];
+	const u8 *r50_cal_tbl;
 };
 
 /*
@@ -61,7 +61,7 @@ struct airoha_socphy_shared {
  * TX AMP test/TX AMP 1G/TX AMP 100M/TX AMP 10M/R50
  * 4 PHY
  */
-static int an7581_tx_amp_compensation_tbl[2][TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX][CALIB_CONST_TYPE_MAX][4] = {
+static const int an7581_tx_amp_compensation_tbl[2][TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX][CALIB_CONST_TYPE_MAX][4] = {
 	{ /* IC version 1 */
 		[TXMR] = {
 			{ },
@@ -152,7 +152,7 @@ static int an7581_tx_amp_compensation_tbl[2][TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX]
 	},
 };
 
-static u8 an7581_zcal_to_r45ohm[64] = {
+static const u8 an7581_zcal_to_r45ohm[64] = {
 	127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
 	127, 127, 127, 127, 127, 127, 127, 127, 123, 119, 115, 112, 108, 104, 100,  96,
 	 94,  92,  88,  85,  82,  80,  76,  74,  72,  68,  66,  64,  62,  60,  56,  55,
@@ -166,7 +166,7 @@ static u8 an7581_zcal_to_r45ohm[64] = {
  * TX AMP test/TX AMP 1G/TX AMP 100M/TX AMP 10M/R50
  * 4 PHY
  */
-static int an7583_tx_amp_compensation_tbl[TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX][CALIB_CONST_TYPE_MAX][4] = {
+static const int an7583_tx_amp_compensation_tbl[TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX][CALIB_CONST_TYPE_MAX][4] = {
 	[TXMR] = {
 		[MDI_0R] = {
 			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
@@ -245,14 +245,14 @@ static int an7583_tx_amp_compensation_tbl[TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX][CA
 	},
 };
 
-static u8 an7583_zcal_to_r50ohm_0R[64] = {
+static const u8 an7583_zcal_to_r50ohm_0R[64] = {
 	127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
 	127, 127, 127, 122, 118, 114, 110, 106, 102,  98,  96,  92,  88,  85,  82,  80,
 	 76,  72,  70,  68,  64,  62,  60,  57,  55,  52,  50,  48,  46,  44,  41,  40,
 	 38,  36,  33,  32,  30,  28,  26,  24,  24,  22,  20,  18,  16,  16,  14,  12,
 };
 
-static u8 an7583_zcal_to_r50ohm_5R[64] = {
+static const u8 an7583_zcal_to_r50ohm_5R[64] = {
 	127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
 	127, 127, 127, 127, 127, 127, 127, 127, 127, 124, 120, 116, 112, 110, 106, 102,
 	 99,  96,  93,  90,  88,  84,  81,  79,  76,  73,  71,  68,  66,  64,  61,  59,
@@ -1142,7 +1142,7 @@ static int airoha_phy_tx_amp_compensation(struct phy_device *phydev)
 	int r50_high_limit = 0x88;
 
 	bool overflow;
-	int (*tx_amp_table)[CALIB_CONST_TYPE_MAX][4];
+	const int (*tx_amp_table)[CALIB_CONST_TYPE_MAX][4];
 	int transformer_type, mdi_resister_type;
 
 	phydev_p0 = shared->phydev_p0;
@@ -1596,11 +1596,14 @@ static int an7581_phy_probe(struct phy_device *phydev)
 		dev_err(&phydev->mdio.bus->dev,
 			"Failed to setup PHY LED pinctrl\n");
 
-	ret = devm_phy_package_join(&phydev->mdio.dev, phydev, 0,
+	ret = devm_phy_package_join(&phydev->mdio.dev, phydev,
+				    AIROHA_DEFAULT_PORT0_ADDR,
 				    sizeof(struct airoha_socphy_shared));
 	if (ret)
 		return ret;
 
+	shared = phy_package_get_priv(phydev);
+
 	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.39.5


