Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0690BC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 01:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lx1Xj7NSky5Sc82la1PPusCZfe0b0Ko/3x7RcMzObLM=; b=e272Y+y9NdmxlhR+B/7200MpVC
	D4O7r3WbNFHuSceAza9LLMFBj3SVCrlExhoK4fDMFWj6ih54E2LpKOI5kfg6xEj5wtLd4cp0KcNPg
	SLca8TADVexhUCOFTjuq+cXhTGk/eQzoA3AngPEygYxpUw7lD2du17YW/kgqDtKwYQyaVzRu5wDTR
	wDaJYU/gQr4j5JB1pY5SxTosFFUpAxH0lVb0x+Mo8gEzI+nsitNKZKoU1ULQGuDhVmS8rKGYdSab9
	Rmoe1RrjAwGEMuO7sGs6AMjbk11/SwY0nxq4llOvT82z2z9Fm+EwQBmjf7qVgRaxzu8wClESgouDD
	xSgIhfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEfL-0000000DXzB-1Ja1;
	Thu, 16 Jan 2025 01:27:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEdz-0000000DXjn-3EIm;
	Thu, 16 Jan 2025 01:26:00 +0000
X-UUID: d40e3160d3a811ef9048ed6ed365623b-20250115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lx1Xj7NSky5Sc82la1PPusCZfe0b0Ko/3x7RcMzObLM=;
	b=nc2hrzkWNXfPmZd4nLqd03sfbj6CqRVmJbzcqG2OBelKj/Xz1yCwQl2oovtrCxSHwZ4LtY9EM34Rlo+pTRu07PCBn3kDV6s33BIotuDrv/dJBy6EAkb+U4pbmcBPbtZZTY3UjggqGH5brkXLa0O9S/eS8QRhXhImeGQJdh0I/TM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1afa2190-5226-45cd-92e9-6d8a0687f51b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:60aa074,CLOUDID:12a0f337-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d40e3160d3a811ef9048ed6ed365623b-20250115
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 697513301; Wed, 15 Jan 2025 18:25:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 Jan 2025 09:25:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 16 Jan 2025 09:25:50 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next 3/3] net: phy: mediatek: add driver for built-in 2.5G ethernet PHY on MT7988
Date: Thu, 16 Jan 2025 09:21:58 +0800
Message-ID: <20250116012159.3816135-4-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
References: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_172559_825699_4050EBA7 
X-CRM114-Status: GOOD (  28.97  )
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

From: Sky Huang <skylake.huang@mediatek.com>

Add support for internal 2.5Gphy on MT7988. This driver will load
necessary firmware and add appropriate time delay to make sure
that firmware works stably. Also, certain control registers will
be set to fix link-up issues.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
 MAINTAINERS                          |   1 +
 drivers/net/phy/mediatek/Kconfig     |  11 +
 drivers/net/phy/mediatek/Makefile    |   1 +
 drivers/net/phy/mediatek/mtk-2p5ge.c | 343 +++++++++++++++++++++++++++
 4 files changed, 356 insertions(+)
 create mode 100644 drivers/net/phy/mediatek/mtk-2p5ge.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e58e05c..fe380f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13793,6 +13793,7 @@ M:	Qingfang Deng <dqfext@gmail.com>
 M:	SkyLake Huang <SkyLake.Huang@mediatek.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	drivers/net/phy/mediatek/mtk-2p5ge.c
 F:	drivers/net/phy/mediatek/mtk-ge-soc.c
 F:	drivers/net/phy/mediatek/mtk-phy-lib.c
 F:	drivers/net/phy/mediatek/mtk-ge.c
diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index 2a8ac5a..02d0c21 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -25,3 +25,14 @@ config MEDIATEK_GE_SOC_PHY
 	  the MT7981 and MT7988 SoCs. These PHYs need calibration data
 	  present in the SoCs efuse and will dynamically calibrate VCM
 	  (common-mode voltage) during startup.
+
+config MEDIATEK_2P5GE_PHY
+	tristate "MediaTek 2.5Gb Ethernet PHYs"
+	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
+	select MTK_NET_PHYLIB
+	help
+	  Supports MediaTek SoC built-in 2.5Gb Ethernet PHYs.
+
+	  This will load necessary firmware and add appropriate time delay.
+	  Accelerate this procedure through internal pbus instead of MDIO
+	  bus. Certain link-up issues will also be fixed here.
diff --git a/drivers/net/phy/mediatek/Makefile b/drivers/net/phy/mediatek/Makefile
index 814879d..c6db8ab 100644
--- a/drivers/net/phy/mediatek/Makefile
+++ b/drivers/net/phy/mediatek/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_MTK_NET_PHYLIB)		+= mtk-phy-lib.o
 obj-$(CONFIG_MEDIATEK_GE_PHY)		+= mtk-ge.o
 obj-$(CONFIG_MEDIATEK_GE_SOC_PHY)	+= mtk-ge-soc.o
+obj-$(CONFIG_MEDIATEK_2P5GE_PHY)	+= mtk-2p5ge.o
diff --git a/drivers/net/phy/mediatek/mtk-2p5ge.c b/drivers/net/phy/mediatek/mtk-2p5ge.c
new file mode 100644
index 0000000..d061dc9
--- /dev/null
+++ b/drivers/net/phy/mediatek/mtk-2p5ge.c
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/bitfield.h>
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/phy.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+#include "mtk.h"
+
+#define MTK_2P5GPHY_ID_MT7988	(0x00339c11)
+
+#define MT7988_2P5GE_PMB_FW		"mediatek/mt7988/i2p5ge-phy-pmb.bin"
+#define MT7988_2P5GE_PMB_FW_SIZE	(0x20000)
+#define MD32_EN_CFG			(0x18)
+#define   MD32_EN			BIT(0)
+
+#define BASE100T_STATUS_EXTEND		(0x10)
+#define BASE1000T_STATUS_EXTEND		(0x11)
+#define EXTEND_CTRL_AND_STATUS		(0x16)
+
+#define PHY_AUX_CTRL_STATUS		(0x1d)
+#define   PHY_AUX_DPX_MASK		GENMASK(5, 5)
+#define   PHY_AUX_SPEED_MASK		GENMASK(4, 2)
+
+#define MTK_PHY_LPI_PCS_DSP_CTRL		(0x121)
+#define   MTK_PHY_LPI_SIG_EN_LO_THRESH100_MASK	GENMASK(12, 8)
+
+/* Registers on Token Ring debug nodes */
+/* ch_addr = 0x0, node_addr = 0xf, data_addr = 0x3c */
+#define AUTO_NP_10XEN				BIT(6)
+
+struct mtk_i2p5ge_phy_priv {
+	bool fw_loaded;
+};
+
+enum {
+	PHY_AUX_SPD_10 = 0,
+	PHY_AUX_SPD_100,
+	PHY_AUX_SPD_1000,
+	PHY_AUX_SPD_2500,
+};
+
+static int mt798x_2p5ge_phy_load_fw(struct phy_device *phydev)
+{
+	struct mtk_i2p5ge_phy_priv *priv = phydev->priv;
+	void __iomem *mcu_csr_base, *pmb_addr;
+	struct device *dev = &phydev->mdio.dev;
+	const struct firmware *fw;
+	struct device_node *np;
+	int ret, i;
+	u32 reg;
+
+	if (priv->fw_loaded)
+		return 0;
+
+	np = of_find_compatible_node(NULL, NULL, "mediatek,2p5gphy-fw");
+	if (!np)
+		return -ENOENT;
+
+	pmb_addr = of_iomap(np, 1);
+	if (!pmb_addr)
+		return -ENOMEM;
+	mcu_csr_base = of_iomap(np, 2);
+	if (!mcu_csr_base) {
+		ret = -ENOMEM;
+		goto free_pmb;
+	}
+
+	ret = request_firmware(&fw, MT7988_2P5GE_PMB_FW, dev);
+	if (ret) {
+		dev_err(dev, "failed to load firmware: %s, ret: %d\n",
+			MT7988_2P5GE_PMB_FW, ret);
+		goto free;
+	}
+
+	if (fw->size != MT7988_2P5GE_PMB_FW_SIZE) {
+		dev_err(dev, "Firmware size 0x%zx != 0x%x\n",
+			fw->size, MT7988_2P5GE_PMB_FW_SIZE);
+		ret = -EINVAL;
+		goto release_fw;
+	}
+
+	reg = readw(mcu_csr_base + MD32_EN_CFG);
+	if (reg & MD32_EN) {
+		phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
+		usleep_range(10000, 11000);
+	}
+	phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN);
+
+	/* Write magic number to safely stall MCU */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x800e, 0x1100);
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x800f, 0x00df);
+
+	for (i = 0; i < MT7988_2P5GE_PMB_FW_SIZE - 1; i += 4)
+		writel(*((uint32_t *)(fw->data + i)), pmb_addr + i);
+	dev_info(dev, "Firmware date code: %x/%x/%x, version: %x.%x\n",
+		 be16_to_cpu(*((__be16 *)(fw->data +
+					  MT7988_2P5GE_PMB_FW_SIZE - 8))),
+		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 6),
+		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 5),
+		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 2),
+		 *(fw->data + MT7988_2P5GE_PMB_FW_SIZE - 1));
+
+	writew(reg & ~MD32_EN, mcu_csr_base + MD32_EN_CFG);
+	writew(reg | MD32_EN, mcu_csr_base + MD32_EN_CFG);
+	phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
+	/* We need a delay here to stabilize initialization of MCU */
+	usleep_range(7000, 8000);
+	dev_info(dev, "Firmware loading/trigger ok.\n");
+
+	priv->fw_loaded = true;
+
+release_fw:
+	release_firmware(fw);
+free:
+	iounmap(mcu_csr_base);
+free_pmb:
+	iounmap(pmb_addr);
+
+	return ret;
+}
+
+static int mt798x_2p5ge_phy_config_init(struct phy_device *phydev)
+{
+	struct pinctrl *pinctrl;
+	int ret;
+
+	/* Check if PHY interface type is compatible */
+	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
+		return -ENODEV;
+
+	ret = mt798x_2p5ge_phy_load_fw(phydev);
+	if (ret < 0)
+		return ret;
+
+	/* Setup LED */
+	phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED0_ON_CTRL,
+			 MTK_PHY_LED_ON_POLARITY | MTK_PHY_LED_ON_LINK10 |
+			 MTK_PHY_LED_ON_LINK100 | MTK_PHY_LED_ON_LINK1000 |
+			 MTK_PHY_LED_ON_LINK2500);
+	phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED1_ON_CTRL,
+			 MTK_PHY_LED_ON_FDX | MTK_PHY_LED_ON_HDX);
+
+	/* Switch pinctrl after setting polarity to avoid bogus blinking */
+	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "i2p5gbe-led");
+	if (IS_ERR(pinctrl))
+		dev_err(&phydev->mdio.dev, "Fail to set LED pins!\n");
+
+	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_LPI_PCS_DSP_CTRL,
+		       MTK_PHY_LPI_SIG_EN_LO_THRESH100_MASK, 0);
+
+	/* Enable 16-bit next page exchange bit if 1000-BT isn't advertising */
+	mtk_tr_modify(phydev, 0x0, 0xf, 0x3c, AUTO_NP_10XEN,
+		      FIELD_PREP(AUTO_NP_10XEN, 0x1));
+
+	/* Enable HW auto downshift */
+	phy_modify_paged(phydev, MTK_PHY_PAGE_EXTENDED_1,
+			 MTK_PHY_AUX_CTRL_AND_STATUS,
+			 0, MTK_PHY_ENABLE_DOWNSHIFT);
+
+	return 0;
+}
+
+static int mt798x_2p5ge_phy_config_aneg(struct phy_device *phydev)
+{
+	bool changed = false;
+	u32 adv;
+	int ret;
+
+	ret = genphy_c45_an_config_aneg(phydev);
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
+		changed = true;
+
+	/* Clause 45 doesn't define 1000BaseT support. Use Clause 22 instead in
+	 * our design.
+	 */
+	adv = linkmode_adv_to_mii_ctrl1000_t(phydev->advertising);
+	ret = phy_modify_changed(phydev, MII_CTRL1000, ADVERTISE_1000FULL, adv);
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
+		changed = true;
+
+	return __genphy_config_aneg(phydev, changed);
+}
+
+static int mt798x_2p5ge_phy_get_features(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = genphy_c45_pma_read_abilities(phydev);
+	if (ret)
+		return ret;
+
+	/* This phy can't handle collision, and neither can (XFI)MAC it's
+	 * connected to. Although it can do HDX handshake, it doesn't support
+	 * CSMA/CD that HDX requires.
+	 */
+	linkmode_clear_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT,
+			   phydev->supported);
+
+	return 0;
+}
+
+static int mt798x_2p5ge_phy_read_status(struct phy_device *phydev)
+{
+	int ret;
+
+	/* When MDIO_STAT1_LSTATUS is raised genphy_c45_read_link(), this phy
+	 * actually hasn't finished AN. So use CL22's link update function
+	 * instead.
+	 */
+	ret = genphy_update_link(phydev);
+	if (ret)
+		return ret;
+
+	phydev->speed = SPEED_UNKNOWN;
+	phydev->duplex = DUPLEX_UNKNOWN;
+	phydev->pause = 0;
+	phydev->asym_pause = 0;
+
+	/* We'll read link speed through vendor specific registers down below.
+	 * So remove phy_resolve_aneg_linkmode (AN on) & genphy_c45_read_pma
+	 * (AN off).
+	 */
+	if (phydev->autoneg == AUTONEG_ENABLE && phydev->autoneg_complete) {
+		ret = genphy_c45_read_lpa(phydev);
+		if (ret < 0)
+			return ret;
+
+		/* Clause 45 doesn't define 1000BaseT support. Read the link
+		 * partner's 1G advertisement via Clause 22.
+		 */
+		ret = phy_read(phydev, MII_STAT1000);
+		if (ret < 0)
+			return ret;
+		mii_stat1000_mod_linkmode_lpa_t(phydev->lp_advertising, ret);
+	} else if (phydev->autoneg == AUTONEG_DISABLE) {
+		linkmode_zero(phydev->lp_advertising);
+	}
+
+	if (phydev->link) {
+		ret = phy_read(phydev, PHY_AUX_CTRL_STATUS);
+		if (ret < 0)
+			return ret;
+
+		switch (FIELD_GET(PHY_AUX_SPEED_MASK, ret)) {
+		case PHY_AUX_SPD_10:
+			phydev->speed = SPEED_10;
+			break;
+		case PHY_AUX_SPD_100:
+			phydev->speed = SPEED_100;
+			break;
+		case PHY_AUX_SPD_1000:
+			phydev->speed = SPEED_1000;
+			break;
+		case PHY_AUX_SPD_2500:
+			phydev->speed = SPEED_2500;
+			break;
+		}
+
+		phydev->duplex = DUPLEX_FULL;
+		/* FIXME:
+		 * The current firmware always enables rate adaptation mode.
+		 */
+		phydev->rate_matching = RATE_MATCH_PAUSE;
+	}
+
+	return 0;
+}
+
+static int mt798x_2p5ge_phy_get_rate_matching(struct phy_device *phydev,
+					      phy_interface_t iface)
+{
+	return RATE_MATCH_PAUSE;
+}
+
+static int mt798x_2p5ge_phy_probe(struct phy_device *phydev)
+{
+	struct mtk_i2p5ge_phy_priv *priv;
+
+	priv = devm_kzalloc(&phydev->mdio.dev,
+			    sizeof(struct mtk_i2p5ge_phy_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	switch (phydev->drv->phy_id) {
+	case MTK_2P5GPHY_ID_MT7988:
+		/* The original hardware only sets MDIO_DEVS_PMAPMD */
+		phydev->c45_ids.mmds_present |= MDIO_DEVS_PCS |
+						MDIO_DEVS_AN |
+						MDIO_DEVS_VEND1 |
+						MDIO_DEVS_VEND2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	priv->fw_loaded = false;
+	phydev->priv = priv;
+
+	mtk_phy_leds_state_init(phydev);
+
+	return 0;
+}
+
+static struct phy_driver mtk_2p5gephy_driver[] = {
+	{
+		PHY_ID_MATCH_MODEL(MTK_2P5GPHY_ID_MT7988),
+		.name = "MediaTek MT7988 2.5GbE PHY",
+		.probe = mt798x_2p5ge_phy_probe,
+		.config_init = mt798x_2p5ge_phy_config_init,
+		.config_aneg = mt798x_2p5ge_phy_config_aneg,
+		.get_features = mt798x_2p5ge_phy_get_features,
+		.read_status = mt798x_2p5ge_phy_read_status,
+		.get_rate_matching = mt798x_2p5ge_phy_get_rate_matching,
+		.suspend = genphy_suspend,
+		.resume = genphy_resume,
+		.read_page = mtk_phy_read_page,
+		.write_page = mtk_phy_write_page,
+	},
+};
+
+module_phy_driver(mtk_2p5gephy_driver);
+
+static struct mdio_device_id __maybe_unused mtk_2p5ge_phy_tbl[] = {
+	{ PHY_ID_MATCH_VENDOR(0x00339c00) },
+	{ }
+};
+
+MODULE_DESCRIPTION("MediaTek 2.5Gb Ethernet PHY driver");
+MODULE_AUTHOR("SkyLake Huang <SkyLake.Huang@mediatek.com>");
+MODULE_LICENSE("GPL");
+
+MODULE_DEVICE_TABLE(mdio, mtk_2p5ge_phy_tbl);
+MODULE_FIRMWARE(MT7988_2P5GE_PMB_FW);
-- 
2.45.2


