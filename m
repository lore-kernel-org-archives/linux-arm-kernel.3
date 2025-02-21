Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5E2C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/V9/R7a9isS+zNiVj1HLAhpc5SCNNFYHIXlJodspTU=; b=T/UQioT7IrLPlmaAmcWJOrUyC5
	JUi7eQ20b5KD2jlvZeSc7PLi+PJ2cRUBmzVa4RpN06B/ozGwpHxR5cPtghh+M+neROPDS3erjXcTT
	A+EWtP9JTtOQhCFTUv3iK+xOOo/JHKLiy0/eJJAN2A6ayqiupmZ1NRpI4xbBN03PX9UAHZgZE0uqI
	HT6rli0CiqSwZrBLoWvg6g5sAhimdx1bGrNrRICMQmoicdyDKe5i9aIHYYHoCzvrfqPzsDFsPJ8Im
	dBF+BLa4YL2Lep+QsdKkSmuFYhSo6LJHJKOA9/vDlzpIahZIJ4dBCZ9EfZ0qqAi5Cnc8IhLFGTvf4
	CvSmG0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlX1m-00000006P8j-0p0G;
	Fri, 21 Feb 2025 17:41:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVj7-000000068N6-1OLA;
	Fri, 21 Feb 2025 16:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5/V9/R7a9isS+zNiVj1HLAhpc5SCNNFYHIXlJodspTU=; b=Hp5wkhUIfKEoHz2gSp5E20vC7x
	4ciX1Chz0KG/fLpPJYwXknq4ivmCWnj5cD5xPqyiTYkbbukSfjwB0HW5l0dlj0DCYoF19ucHtarD/
	6w/FoFfCJ914hFPMAGotz1FwDE4dcq4qtqjAaHmxRIIgwpm3OIJAcVBJ5FaIvY0xydL5aeB76fqZy
	eXaG1qUhHPQESYbIqL0HeILcQ3fWCucD0aZE4z1pQDsf5Kf9FbYZjPF0VZgPfFrtuF6whbHqVoM5o
	gNDIsi1dSu29Yp8Q1OFEuUd2j5QMXJjw2hdoje+sj18ZXuD/eYH1RY1b/6ogO4RuzRuytVo/K/+wt
	H0aw75vA==;
Received: from s2.avantea.pl ([46.242.128.95])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVj4-00000002fzO-1Wwz;
	Fri, 21 Feb 2025 16:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5/V9/R7a9isS+zNiVj1HLAhpc5SCNNFYHIXlJodspTU=; b=HcK5seWlZAZbl0hkdyDFlNS5rh
	zZbbTejohyTCnv9XobrgEqiUzeWFg02A27ueeoZcrmNhZZKVl2qGxpFFjE9ffbW+00X6Jx7F0YRwi
	O00wkrUdGkcVfqQUjiEw6HFhlMvIcRVel6Wf2ZeN2uRYVPokh/iRjKMB0YB3Y2tGXG50AoSqWy1Sg
	RHOYGl52iJ0kDEAvqFsQLkSYEVp2UVgrBYiB1+Hi2PVUj/AAHxxuH8q+zOBC7CqTUkgiZybWb3R7D
	ARmTlh34ETeynSRA7MHUeRj+l8WI3F4wh9fyhev6lEATYAVlqor0dcaUQWYkHb1vqlNwStGf10Czu
	E9ZVLf7w==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96-58-g4e9ed49f8)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1tlViu-00AOLX-1R;
	Fri, 21 Feb 2025 17:17:56 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
Date: Fri, 21 Feb 2025 17:17:47 +0100
Message-Id: <20250221161751.1278049-2-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_161806_637950_E374BCA7 
X-CRM114-Status: GOOD (  16.68  )
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

Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
MIPI DSI D-PHY" which is required when using single-link LVDS0.

In this mode, the DSI peripheral is not used and the PHY is not
configured for DSI. Instead, the COMBO_PHY_REGx registers are set to
enable LVDS operation.

Enable the PHY driver to work in LVDS mode on chips with a combo D-PHY.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c | 65 ++++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
index 36eab9527..f958e34da 100644
--- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
+++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
@@ -166,8 +166,8 @@
 #define SUN50I_COMBO_PHY_REG0_EN_CP		BIT(0)
 
 #define SUN50I_COMBO_PHY_REG1		0x114
-#define SUN50I_COMBO_PHY_REG2_REG_VREF1P6(n)	(((n) & 0x7) << 4)
-#define SUN50I_COMBO_PHY_REG2_REG_VREF0P8(n)	((n) & 0x7)
+#define SUN50I_COMBO_PHY_REG1_REG_VREF1P6(n)	(((n) & 0x7) << 4)
+#define SUN50I_COMBO_PHY_REG1_REG_VREF0P8(n)	((n) & 0x7)
 
 #define SUN50I_COMBO_PHY_REG2		0x118
 #define SUN50I_COMBO_PHY_REG2_HS_STOP_DLY(n)	((n) & 0xff)
@@ -181,7 +181,9 @@ struct sun6i_dphy;
 
 struct sun6i_dphy_variant {
 	void	(*tx_power_on)(struct sun6i_dphy *dphy);
+	void	(*lvds_power_on)(struct sun6i_dphy *dphy);
 	bool	rx_supported;
+	bool	is_combo_dphy;
 };
 
 struct sun6i_dphy {
@@ -222,6 +224,18 @@ static int sun6i_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
 	return 0;
 }
 
+static int sun6i_dphy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct sun6i_dphy *dphy = phy_get_drvdata(phy);
+
+	if (mode == PHY_MODE_LVDS && !dphy->variant->is_combo_dphy) {
+		/* Not a combo D-PHY: LVDS is not supported */
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static void sun6i_a31_mipi_dphy_tx_power_on(struct sun6i_dphy *dphy)
 {
 	u8 lanes_mask = GENMASK(dphy->config.lanes - 1, 0);
@@ -329,6 +343,37 @@ static void sun50i_a100_mipi_dphy_tx_power_on(struct sun6i_dphy *dphy)
 	udelay(1);
 }
 
+static void sun50i_a100_mipi_dphy_lvds_power_on(struct sun6i_dphy *dphy)
+{
+	regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG1,
+		     SUN50I_COMBO_PHY_REG1_REG_VREF1P6(4) |
+		     SUN50I_COMBO_PHY_REG1_REG_VREF0P8(3));
+
+	regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG0,
+		     SUN50I_COMBO_PHY_REG0_EN_CP);
+	udelay(5);
+	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
+			   SUN50I_COMBO_PHY_REG0_EN_LVDS,
+			   SUN50I_COMBO_PHY_REG0_EN_LVDS);
+	udelay(5);
+	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
+			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO,
+			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO);
+	udelay(5);
+	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
+			   SUN50I_COMBO_PHY_REG0_EN_MIPI,
+			   SUN50I_COMBO_PHY_REG0_EN_MIPI);
+
+	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG,
+		     SUN6I_DPHY_ANA4_REG_EN_MIPI |
+		     SUN6I_DPHY_ANA4_REG_IB(2));
+	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG,
+		     SUN6I_DPHY_ANA3_EN_LDOR |
+		     SUN6I_DPHY_ANA3_EN_LDOD);
+	regmap_write(dphy->regs, SUN6I_DPHY_ANA2_REG, 0);
+	regmap_write(dphy->regs, SUN6I_DPHY_ANA1_REG, 0);
+}
+
 static int sun6i_dphy_tx_power_on(struct sun6i_dphy *dphy)
 {
 	u8 lanes_mask = GENMASK(dphy->config.lanes - 1, 0);
@@ -492,6 +537,14 @@ static int sun6i_dphy_power_on(struct phy *phy)
 {
 	struct sun6i_dphy *dphy = phy_get_drvdata(phy);
 
+	if (phy->attrs.mode == PHY_MODE_LVDS && dphy->variant->is_combo_dphy) {
+		if (dphy->variant->lvds_power_on) {
+			dphy->variant->lvds_power_on(dphy);
+			return 0;
+		}
+		return -EINVAL;
+	}
+
 	switch (dphy->direction) {
 	case SUN6I_DPHY_DIRECTION_TX:
 		return sun6i_dphy_tx_power_on(dphy);
@@ -514,6 +567,11 @@ static int sun6i_dphy_power_off(struct phy *phy)
 	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG, 0);
 	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG, 0);
 
+	if (phy->attrs.mode == PHY_MODE_LVDS && dphy->variant->is_combo_dphy) {
+		regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG1, 0);
+		regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG0, 0);
+	}
+
 	return 0;
 }
 
@@ -533,6 +591,7 @@ static const struct phy_ops sun6i_dphy_ops = {
 	.configure	= sun6i_dphy_configure,
 	.power_on	= sun6i_dphy_power_on,
 	.power_off	= sun6i_dphy_power_off,
+	.set_mode	= sun6i_dphy_set_mode,
 	.init		= sun6i_dphy_init,
 	.exit		= sun6i_dphy_exit,
 };
@@ -619,6 +678,8 @@ static const struct sun6i_dphy_variant sun6i_a31_mipi_dphy_variant = {
 
 static const struct sun6i_dphy_variant sun50i_a100_mipi_dphy_variant = {
 	.tx_power_on	= sun50i_a100_mipi_dphy_tx_power_on,
+	.lvds_power_on	= sun50i_a100_mipi_dphy_lvds_power_on,
+	.is_combo_dphy	= true,
 };
 
 static const struct of_device_id sun6i_dphy_of_table[] = {
-- 
2.25.1


