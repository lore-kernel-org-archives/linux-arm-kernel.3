Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF1EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxM8+Leu8MwruhsMJIlIYRMswoFi1MwEa2tyG0/MFaI=; b=p83ufl4M6a2m7SHlvwITv2pxwU
	VEOdGhYPuPYJmDH1r3A92ZiyF/zSPgnrxQk3bwA1Dd0YJTsdmWUDnAvRmAygYVuVsumBpFQ0YD/kz
	N0saxbXG1JaCQ0YeycEmPXen4bDOdbF2r9OEkh5nkD886LRj4wy/BR+NOABra0ztBvcWozzWI+EL6
	hrBvfAo9GKhznc+U3+3ZGYy8BfiQM3zAxSBIEA/gbaLVEldsnLUPVTa06Pniw1prHDE1WalzQNYfY
	Em2AliEFbR2vWDuhlHZUfS7IxkfZ6VIUjvj2ecScUBJb0NUztEVvtSe2Ei/UFMIUrQAHJeEoTuF29
	MsAGpBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1fN-00000003BmU-3HT6;
	Fri, 13 Dec 2024 09:08:57 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1cB-00000003BE1-3UKj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:05:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E25651BF204;
	Fri, 13 Dec 2024 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734080731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxM8+Leu8MwruhsMJIlIYRMswoFi1MwEa2tyG0/MFaI=;
	b=mBjcJwO02cTezzCp3XYcoFdJbdVzBVazXlvccMmSiZd4UY/Kkyw+8TbOHO1Q85aXZ2GDXV
	rwd5DBplbdmBg60aSgTT8UExB2pIEAbtVLkhXfkX2h4sJVkhkG9xwdcUTa3IlQ2y9765r0
	aZIDleIr7dVb6VJcdZ3rzPn2gyes+lLphrABQJYTFanWm8xIb4d8buR/xK+ZKzJL23Sy2C
	kSR0L7oj0vd/lM/FAexfIJ6ptBBJVgo03/QAdB2adYYgn207pcviXxf1zuDeTIIj+j4xCt
	Tu6xea8EOQM8K+l11+4dSqBDHFbwKGgq6yXf3+YdVh/SkynlBGWS0qIPD3Kzfg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] net: stmmac: dwmac-socfpga: Add support for 1000BaseX
Date: Fri, 13 Dec 2024 10:05:24 +0100
Message-ID: <20241213090526.71516-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_010540_173903_9058F347 
X-CRM114-Status: GOOD (  11.52  )
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

The dwmac-socfpga found on altera socfpga SoCs can use 1000BaseX or
SGMII. The IP integrates a variation of the Lynx PCS, which the driver
supports well. However, there's some internal circuitry that needs
enabling when using SGMII or 1000BaseX through the "sgmii_adapter" in
the socfpga wrapper. So far, this is only enabled when SGMII is used as
the interface mode. Make so that 1000BaseX also enables that block.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 16020b72dec8..8c7b82d29fd1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -258,6 +258,7 @@ static int socfpga_set_phy_mode_common(int phymode, u32 *val)
 	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_GMII:
 	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
 		*val = SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_GMII_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
@@ -300,6 +301,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 	if (dwmac->f2h_ptp_ref_clk ||
 	    phymode == PHY_INTERFACE_MODE_MII ||
 	    phymode == PHY_INTERFACE_MODE_GMII ||
+	    phymode == PHY_INTERFACE_MODE_1000BASEX ||
 	    phymode == PHY_INTERFACE_MODE_SGMII) {
 		regmap_read(sys_mgr_base_addr, SYSMGR_FPGAGRP_MODULE_REG,
 			    &module);
@@ -321,7 +323,8 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 	 */
 	reset_control_deassert(dwmac->stmmac_ocp_rst);
 	reset_control_deassert(dwmac->stmmac_rst);
-	if (phymode == PHY_INTERFACE_MODE_SGMII)
+	if (phymode == PHY_INTERFACE_MODE_SGMII ||
+	    phymode == PHY_INTERFACE_MODE_1000BASEX)
 		socfpga_sgmii_config(dwmac, true);
 
 	return 0;
@@ -356,6 +359,7 @@ static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
 	if (dwmac->f2h_ptp_ref_clk ||
 	    phymode == PHY_INTERFACE_MODE_MII ||
 	    phymode == PHY_INTERFACE_MODE_GMII ||
+	    phymode == PHY_INTERFACE_MODE_1000BASEX ||
 	    phymode == PHY_INTERFACE_MODE_SGMII) {
 		ctrl |= SYSMGR_GEN10_EMACGRP_CTRL_PTP_REF_CLK_MASK;
 		regmap_read(sys_mgr_base_addr, SYSMGR_FPGAINTF_EMAC_REG,
@@ -374,7 +378,8 @@ static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
 	 */
 	reset_control_deassert(dwmac->stmmac_ocp_rst);
 	reset_control_deassert(dwmac->stmmac_rst);
-	if (phymode == PHY_INTERFACE_MODE_SGMII)
+	if (phymode == PHY_INTERFACE_MODE_SGMII ||
+	    phymode == PHY_INTERFACE_MODE_1000BASEX)
 		socfpga_sgmii_config(dwmac, true);
 	return 0;
 }
-- 
2.47.1


