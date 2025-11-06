Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE024CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzBB2UijmCHVcRf7zDJoQKSDLaPP35srt0SKwOk7mnI=; b=WC68FAVMwLkiMCv/xQM3uLazQP
	NV/Rp6UuTrFSkT20DoP9AKq/LruAaNdWwS8kkmdVki9s7R+0jpodhgdWyNVa+j6MtVdAiI0GpiNS4
	MvRMZ70ggg21RtI7pUP6Se4n04RhHCMLilRovocHilqrvikn20iE9+OqSxB0DHZuT4IUsHz24x5RS
	2kmETmZqP1JR8v2SrcsSqTH1ZLbjRZ7H6Pda8Eth0f7sDBn5Lm36xvOQQR1x7GMNzHZFNWcVF7Zqi
	3LH1aclf6so+/KckIcDupa9nBl4CR8+0XoTAyDKp0RvHhys5g5Fd914efQss3IzcbxPbLSZgomjfK
	cLXv+JxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy60-0000000FNkE-0g01;
	Thu, 06 Nov 2025 11:24:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy5w-0000000FNfn-1AKy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 11:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UzBB2UijmCHVcRf7zDJoQKSDLaPP35srt0SKwOk7mnI=; b=1gKYzpftgWqRE5TRemFZNjchAw
	kUej7N0A1oleBKN8fdgR3jJemeX3S85a2ohNJGFOc1EeYIp0urBE8xR0gm9VNR8znWWOCBKHYHlZ6
	0FVu1ocR+LwdGxurJVqe/gGgl0H1kiOH4c/9Ux6Y/fTeacQndeQGGwcGmtswBGzZXnRIP65xhOQkc
	09GA+qeZvQdGLOcLqDRx2J8weQZtmg5QhOaVtp/ZZ9sFWxASNRa/lra0X72vp3IMBxAlsCPc3Ldqc
	uJtUVDpLJPgQBRXEmgvGNIpqlrfUDS8o18MnM0THVA1UD8QSut22pswYRuSoXjdoTfeFTfhoDhUoq
	4D1tQaAA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60354 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vGy5q-000000004wp-0M57;
	Thu, 06 Nov 2025 11:23:54 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vGy5o-0000000DhQn-34JE;
	Thu, 06 Nov 2025 11:23:52 +0000
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next 9/9] net: stmmac: sti: use ->set_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vGy5o-0000000DhQn-34JE@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:52 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_032400_341143_64C13760 
X-CRM114-Status: GOOD (  11.71  )
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

Rather than placing the phy_intf_sel() setup in the ->init() method,
move it to the new ->set_phy_intf_sel() method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 25 +++++++------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 593e154b5957..b0509ab6b31c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -146,17 +146,18 @@ static void stih4xx_fix_retime_src(void *priv, int spd, unsigned int mode)
 			   stih4xx_tx_retime_val[src]);
 }
 
-static int sti_dwmac_set_mode(struct sti_dwmac *dwmac)
+static int sti_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 {
-	struct regmap *regmap = dwmac->regmap;
-	u32 reg = dwmac->ctrl_reg;
-	int phy_intf_sel;
-	u32 val;
+	struct sti_dwmac *dwmac = bsp_priv;
+	struct regmap *regmap;
+	u32 reg, val;
+
+	regmap = dwmac->regmap;
+	reg = dwmac->ctrl_reg;
 
 	if (dwmac->gmac_en)
 		regmap_update_bits(regmap, reg, EN_MASK, EN);
 
-	phy_intf_sel = stmmac_get_phy_intf_sel(dwmac->interface);
 	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
 	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
 	    phy_intf_sel != PHY_INTF_SEL_SGMII &&
@@ -231,17 +232,8 @@ static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
 static int sti_dwmac_init(struct platform_device *pdev, void *bsp_priv)
 {
 	struct sti_dwmac *dwmac = bsp_priv;
-	int ret;
-
-	ret = clk_prepare_enable(dwmac->clk);
-	if (ret)
-		return ret;
-
-	ret = sti_dwmac_set_mode(dwmac);
-	if (ret)
-		clk_disable_unprepare(dwmac->clk);
 
-	return ret;
+	return clk_prepare_enable(dwmac->clk);
 }
 
 static void sti_dwmac_exit(struct platform_device *pdev, void *bsp_priv)
@@ -286,6 +278,7 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 	dwmac->fix_retime_src = data->fix_retime_src;
 
 	plat_dat->bsp_priv = dwmac;
+	plat_dat->set_phy_intf_sel = sti_set_phy_intf_sel;
 	plat_dat->fix_mac_speed = data->fix_retime_src;
 	plat_dat->init = sti_dwmac_init;
 	plat_dat->exit = sti_dwmac_exit;
-- 
2.47.3


