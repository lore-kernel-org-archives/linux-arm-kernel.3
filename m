Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9C7E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I26U7Ox2lNtFhwjRPjCJSLLsQcuC/B89jIp3DoJs92I=; b=oqLda7ldLpQbL0Rzrn/ECSX+oU
	1Sw73c0tpKNxnzdUdJgXIceNmyAv55AndALx0MW4/cbzj2nDfYUZGmT3M4LISPcj5e2Ji5fDuJFSo
	i7YEPzyzEbSWIcEw0wTQT/sWNR7YkHTH5C6vR4515SQlM9hh7ABIHUmLSQwzkG/m6FjSWdA/EHdjy
	/qqk5aRnf7Qe1uJccf4hAfUPiMSZPjavP8YuT36cTvficQ8mdo2Q9Fdr2Hz5lTux3nn4pIR3alXIT
	1gGi+hxjIa2F6BkhUwiGevkjt2iqA4I4lh5shsMlEnKIi0AzimvW/4r2CY0vC4dUXgiyYbwppQAHu
	OfrU6rYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrWJ-0000000Bpe3-0qUG;
	Thu, 09 Jan 2025 12:20:15 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrSl-0000000Bp5W-3BzY;
	Thu, 09 Jan 2025 12:16:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 509CGQAB041649;
	Thu, 9 Jan 2025 06:16:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736424986;
	bh=I26U7Ox2lNtFhwjRPjCJSLLsQcuC/B89jIp3DoJs92I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=k+T6TPHVErEew+JGTJbyIVP4M2rPobvboA9G5+NoiPgRRuIJK3trHp40rOzZs0TlO
	 vu1PbKJ60JuSdtBs3Qx9j7OKrrfjpb7IMJk8QQvOYhg3075r1Rb4Q6tmTELO3K/I1o
	 2hFzsLTXMd4+uD3+71mxtKeWRvNrEG/Ld7iv00+A=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509CGQja011999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 06:16:26 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 06:16:26 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 06:16:26 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509CGE6N120193;
	Thu, 9 Jan 2025 06:16:22 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <sjakhade@cadence.com>,
        <rogerq@kernel.org>, <thomas.richard@bootlin.com>,
        <christophe.jaillet@wanadoo.fr>, <u.kleine-koenig@baylibre.com>,
        <eballetb@redhat.com>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 2/2] phy: cadence-torrent: Add PCIe multilink + USB with same SSC register config for 100 MHz refclk
Date: Thu, 9 Jan 2025 17:46:03 +0530
Message-ID: <20250109121614.754466-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109121614.754466-1-s-vadapalli@ti.com>
References: <20250109121614.754466-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_041636_001769_4AFE4B5F 
X-CRM114-Status: GOOD (  20.73  )
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

From: Swapnil Jakhade <sjakhade@cadence.com>

Add register sequences and support for PCIe multilink + USB configuration
for 100MHz reference clock. The same SSC is used for both PCIe and USB.

Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v2:
https://lore.kernel.org/r/20250106131925.263240-3-s-vadapalli@ti.com/
Changes since v2:
- Based on feedback received from:
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  a) "const" has been used wherever applicable i.e.:
  s/static struct cdns_reg_pairs/static const struct cdns_reg_pairs
  s/static struct cdns_torrent_vals/static const struct cdns_torrent_vals
  b) Commenting style has been fixed.

***NOTE***
Since I don't have the hardware required to validate PCIe Multilink +
USB functionality, kindly *do not merge* this series until it gets a
"Tested-by" tag with proper validation of the functionality.

Regards,
Siddharth.

 drivers/phy/cadence/phy-cadence-torrent.c | 158 ++++++++++++++++++++--
 1 file changed, 150 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 1c5e96e2a188..37fa4bad6bd7 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -206,6 +206,7 @@
 #define RX_REE_GCSM2_CTRL		0x0110U
 #define RX_REE_PERGCSM_CTRL		0x0118U
 #define RX_REE_PEAK_UTHR		0x0142U
+#define RX_REE_PEAK_LTHR		0x0143U
 #define RX_REE_ATTEN_THR		0x0149U
 #define RX_REE_TAP1_CLIP		0x0171U
 #define RX_REE_TAP2TON_CLIP		0x0172U
@@ -298,6 +299,7 @@ enum cdns_torrent_phy_type {
 	TYPE_QSGMII,
 	TYPE_USB,
 	TYPE_USXGMII,
+	TYPE_PCIE_ML,
 };
 
 enum cdns_torrent_ref_clk {
@@ -696,6 +698,7 @@ static const char *cdns_torrent_get_phy_type(enum cdns_torrent_phy_type phy_type
 	case TYPE_DP:
 		return "DisplayPort";
 	case TYPE_PCIE:
+	case TYPE_PCIE_ML:
 		return "PCIe";
 	case TYPE_SGMII:
 		return "SGMII";
@@ -2481,6 +2484,7 @@ int cdns_torrent_phy_configure_multilink(struct cdns_torrent_phy *cdns_phy)
 	enum cdns_torrent_ssc_mode ssc;
 	struct regmap *regmap;
 	u32 num_regs, num_protocols, protocol;
+	u32 num_pcie_links = 0;
 
 	num_protocols = hweight32(cdns_phy->protocol_bitmask);
 	/* Maximum 2 protocols are supported */
@@ -2513,6 +2517,44 @@ int cdns_torrent_phy_configure_multilink(struct cdns_torrent_phy *cdns_phy)
 
 		phy_t1 = fns(cdns_phy->protocol_bitmask, 0);
 		phy_t2 = fns(cdns_phy->protocol_bitmask, 1);
+
+		/*
+		 * PCIe Multilink configuration can be supported along with a
+		 * non-PCIe protocol. The existing limitation associated with
+		 * the standalone PCIe Multilink configuration still remains,
+		 * implying that there can be only two links (subnodes) of the
+		 * PHY type PCIe which constitute the PCIe Multilink.
+		 *
+		 * Such configurations are handled by introducing a new protocol
+		 * namely TYPE_PCIE_ML. Both of the PCIe links which have the
+		 * protocol as TYPE_PCIE shall be treated as though the protocol
+		 * corresponding to them is TYPE_PCIE_ML only for the sake of
+		 * configuring the SERDES.
+		 *
+		 * PCIe Multilink configuration can be identified by checking if
+		 * there are exactly two links with phy_type set to TYPE_PCIE.
+		 * phy_t1 and phy_t2 are modified in such cases to support the
+		 * PCIe Multilink configuration with a non-PCIe protocol.
+		 */
+		for (node = 0; node < cdns_phy->nsubnodes; node++) {
+			if (cdns_phy->phys[node].phy_type == TYPE_PCIE)
+				num_pcie_links++;
+		}
+
+		if (num_pcie_links > 2) {
+			dev_err(dev, "cannot support PCIe Multilink with %u PCIe links\n",
+				num_pcie_links);
+			return -EINVAL;
+		} else if (num_pcie_links == 2) {
+			phy_t1 = TYPE_PCIE_ML;
+			for (node = 0; node < cdns_phy->nsubnodes; node++) {
+				if (cdns_phy->phys[node].phy_type == TYPE_PCIE) {
+					cdns_phy->phys[node].phy_type = TYPE_PCIE_ML;
+					continue;
+				}
+				phy_t2 = cdns_phy->phys[node].phy_type;
+			}
+		}
 	}
 
 	/**
@@ -2679,6 +2721,11 @@ int cdns_torrent_phy_configure_multilink(struct cdns_torrent_phy *cdns_phy)
 		}
 	}
 
+	/* Restore TYPE_PCIE_ML to TYPE_PCIE to be compatible with suspend-resume */
+	for (node = 0; node < cdns_phy->nsubnodes; node++)
+		if (cdns_phy->phys[node].phy_type == TYPE_PCIE_ML)
+			cdns_phy->phys[node].phy_type = TYPE_PCIE;
+
 	/* Take the PHY out of reset */
 	ret = reset_control_deassert(cdns_phy->phy_rst);
 	if (ret)
@@ -3091,15 +3138,14 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 	}
 
 	if (cdns_phy->nsubnodes > 1)
-		dev_dbg(dev, "Multi-link: %s (%d lanes) & %s (%d lanes)",
-			cdns_torrent_get_phy_type(cdns_phy->phys[0].phy_type),
-			cdns_phy->phys[0].num_lanes,
-			cdns_torrent_get_phy_type(cdns_phy->phys[1].phy_type),
-			cdns_phy->phys[1].num_lanes);
+		dev_dbg(dev, "Multi link configuration:\n");
 	else
-		dev_dbg(dev, "Single link: %s (%d lanes)",
-			cdns_torrent_get_phy_type(cdns_phy->phys[0].phy_type),
-			cdns_phy->phys[0].num_lanes);
+		dev_dbg(dev, "Single link configuration:\n");
+
+	for (i = 0; i < cdns_phy->nsubnodes; i++)
+		dev_dbg(dev, "%s (%d lanes)",
+			cdns_torrent_get_phy_type(cdns_phy->phys[i].phy_type),
+			cdns_phy->phys[i].num_lanes);
 
 	return 0;
 
@@ -3134,6 +3180,37 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
 	cdns_torrent_clk_cleanup(cdns_phy);
 }
 
+/* Multilink PCIe and USB Same SSC link configuration */
+static const struct cdns_reg_pairs ml_pcie_usb_link_cmn_regs[] = {
+	{0x0002, PHY_PLL_CFG},
+	{0x8600, CMN_PDIAG_PLL0_CLK_SEL_M0}
+};
+
+static const struct cdns_reg_pairs ml_pcie_usb_xcvr_diag_ln_regs[] = {
+	{0x0100, XCVR_DIAG_HSCLK_SEL},
+	{0x0013, XCVR_DIAG_HSCLK_DIV},
+	{0x0812, XCVR_DIAG_PLLDRC_CTRL}
+};
+
+static const struct cdns_reg_pairs usb_ml_pcie_xcvr_diag_ln_regs[] = {
+	{0x0041, XCVR_DIAG_PLLDRC_CTRL},
+};
+
+static const struct cdns_torrent_vals ml_pcie_usb_link_cmn_vals = {
+	.reg_pairs = ml_pcie_usb_link_cmn_regs,
+	.num_regs = ARRAY_SIZE(ml_pcie_usb_link_cmn_regs),
+};
+
+static const struct cdns_torrent_vals ml_pcie_usb_xcvr_diag_ln_vals = {
+	.reg_pairs = ml_pcie_usb_xcvr_diag_ln_regs,
+	.num_regs = ARRAY_SIZE(ml_pcie_usb_xcvr_diag_ln_regs),
+};
+
+static const struct cdns_torrent_vals usb_ml_pcie_xcvr_diag_ln_vals = {
+	.reg_pairs = usb_ml_pcie_xcvr_diag_ln_regs,
+	.num_regs = ARRAY_SIZE(usb_ml_pcie_xcvr_diag_ln_regs),
+};
+
 /* Multi link PCIe configuration */
 static const struct cdns_reg_pairs ml_pcie_link_cmn_regs[] = {
 	{0x0002, PHY_PLL_CFG},
@@ -4140,6 +4217,8 @@ static const struct cdns_reg_pairs usb_100_no_ssc_rx_ln_regs[] = {
 	{0x0C02, RX_REE_ATTEN_THR},
 	{0x0330, RX_REE_SMGM_CTRL1},
 	{0x0300, RX_REE_SMGM_CTRL2},
+	{0x0000, RX_REE_PEAK_UTHR},
+	{0x01F5, RX_REE_PEAK_LTHR},
 	{0x0019, RX_REE_TAP1_CLIP},
 	{0x0019, RX_REE_TAP2TON_CLIP},
 	{0x1004, RX_DIAG_SIGDET_TUNE},
@@ -4775,6 +4854,8 @@ static const struct cdns_torrent_vals_entry link_cmn_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_DP), &pcie_dp_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USXGMII), &pcie_usxgmii_link_cmn_vals},
 
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE_ML, TYPE_USB), &ml_pcie_usb_link_cmn_vals},
+
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_NONE), &sl_sgmii_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_PCIE), &pcie_sgmii_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_QSGMII), &sgmii_qsgmii_link_cmn_vals},
@@ -4789,6 +4870,7 @@ static const struct cdns_torrent_vals_entry link_cmn_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_NONE), &sl_usb_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE), &pcie_usb_link_cmn_vals},
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE_ML), &ml_pcie_usb_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_SGMII), &usb_sgmii_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_QSGMII), &usb_sgmii_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_DP), &usb_dp_link_cmn_vals},
@@ -4812,6 +4894,8 @@ static const struct cdns_torrent_vals_entry xcvr_diag_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_DP), &pcie_dp_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USXGMII), &pcie_usxgmii_xcvr_diag_ln_vals},
 
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE_ML, TYPE_USB), &ml_pcie_usb_xcvr_diag_ln_vals},
+
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_NONE), &sl_sgmii_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_PCIE), &sgmii_pcie_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_QSGMII), &sgmii_qsgmii_xcvr_diag_ln_vals},
@@ -4826,6 +4910,7 @@ static const struct cdns_torrent_vals_entry xcvr_diag_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_NONE), &sl_usb_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE), &usb_pcie_xcvr_diag_ln_vals},
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE_ML), &usb_ml_pcie_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_SGMII), &usb_sgmii_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_QSGMII), &usb_sgmii_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_DP), &usb_dp_xcvr_diag_ln_vals},
@@ -4839,6 +4924,7 @@ static const struct cdns_torrent_vals_entry xcvr_diag_vals_entries[] = {
 static const struct cdns_torrent_vals_entry pcs_cmn_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_NONE), &usb_phy_pcs_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE), &usb_phy_pcs_cmn_vals},
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE_ML), &usb_phy_pcs_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_SGMII), &usb_phy_pcs_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_QSGMII), &usb_phy_pcs_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_DP), &usb_phy_pcs_cmn_vals},
@@ -4874,6 +4960,10 @@ static const struct cdns_torrent_vals_entry cmn_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &sl_sgmii_100_no_ssc_cmn_vals},
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &sgmii_100_no_ssc_cmn_vals},
@@ -4906,6 +4996,10 @@ static const struct cdns_torrent_vals_entry cmn_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_int_ssc_cmn_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &sl_usb_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &sl_usb_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &sl_usb_100_int_ssc_cmn_vals},
@@ -4960,6 +5054,10 @@ static const struct cdns_torrent_vals_entry cdns_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &sgmii_100_no_ssc_tx_ln_vals},
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &sgmii_100_no_ssc_tx_ln_vals},
@@ -4992,6 +5090,10 @@ static const struct cdns_torrent_vals_entry cdns_tx_ln_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
@@ -5046,6 +5148,10 @@ static const struct cdns_torrent_vals_entry cdns_rx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
@@ -5078,6 +5184,10 @@ static const struct cdns_torrent_vals_entry cdns_rx_ln_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
@@ -5168,6 +5278,10 @@ static const struct cdns_torrent_vals_entry ti_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
@@ -5200,6 +5314,10 @@ static const struct cdns_torrent_vals_entry ti_tx_ln_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
@@ -5288,6 +5406,10 @@ static const struct cdns_torrent_vals_entry ti_j7200_cmn_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &sl_sgmii_100_no_ssc_cmn_vals},
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &sgmii_100_no_ssc_cmn_vals},
@@ -5320,6 +5442,10 @@ static const struct cdns_torrent_vals_entry ti_j7200_cmn_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_int_ssc_cmn_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &sl_usb_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &sl_usb_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &sl_usb_100_int_ssc_cmn_vals},
@@ -5374,6 +5500,10 @@ static const struct cdns_torrent_vals_entry ti_j7200_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
@@ -5406,6 +5536,10 @@ static const struct cdns_torrent_vals_entry ti_j7200_tx_ln_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
@@ -5460,6 +5594,10 @@ static const struct cdns_torrent_vals_entry ti_j7200_rx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
@@ -5492,6 +5630,10 @@ static const struct cdns_torrent_vals_entry ti_j7200_rx_ln_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-- 
2.43.0


