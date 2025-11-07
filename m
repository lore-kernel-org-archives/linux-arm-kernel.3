Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D82CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6b2Jeag/15waNFP16mPLz7zFFYTMVqMxpfra85ewdwk=; b=TrtVcEvvAuiDlMU29ZfB37/JFI
	pI4zs2uFv9PvAn3hqQpUWfvn2N5GdeO4hnw4F5fE3DY55IgW8UDRB5CIh70l2k8NTXdU9IW+YPpLw
	Cd9Kdqsk7tKTtzESe805wryQHRQsTXZB9pKxhBx8zn3lmV0Rv5WakcD6x1S6nCHCndXxGo6ZWUiPy
	foghoIaIgb2YxuAIxUzCnXyh7/INnGsNJOlkViBu+BNii7pniPmPLkmZ/yCJOLJnXoiq5w3tawiU/
	A44M40ES0AgwIa4wo50V+xTDOchJiQG68pODmN7WrR21+6fLL07P0++PtwCFqIDUEY4zLMP+hJ7QB
	Nrd/nZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHql-0000000Gsok-0Qc4;
	Fri, 07 Nov 2025 08:29:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHqi-0000000Gsk1-0WXy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6b2Jeag/15waNFP16mPLz7zFFYTMVqMxpfra85ewdwk=; b=N2EDNrYyhg0H3Yv2T5jPC1mMNh
	YAIeb+w4j06Kb0t1XN+W6BPwAc6NdgLITQjPiTDxj9rhKSs5u9BQWbAvcW+2E+ShCTkCTaZXoJyce
	ZYC8Jz+FEw2wqav8zHC4pjsPuosP7hVYvylRF4rMBBQfdwdJA2gvKIsoAykqkL2nFB8R7HRgUyqQC
	w40SPqg9HXXtCTFuApRdvcB1QKe5MIl6jqLRFmDMPJwP8DqqbnzkaSYYMpMSppTJ1ut+03ZLfG4Yn
	nSBm8mW+flfvZV7hAntpanIqYVAYmuBR1W5B/shu2sYO/Dqwol7z5aRCLoQFL3dz6PNrxqS7VeLZL
	JSUxWELg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33948 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHHqa-000000006Bi-0VZP;
	Fri, 07 Nov 2025 08:29:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHHqY-0000000Djrn-1D6H;
	Fri, 07 Nov 2025 08:29:26 +0000
In-Reply-To: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
References: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v3 11/11] net: stmmac: ingenic: use
 ->set_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHHqY-0000000Djrn-1D6H@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 08:29:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_002936_184962_44B4A624 
X-CRM114-Status: GOOD (  11.33  )
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
v3: fix Smatch warning: phy_intf_sel is unsigned and thus cannot be
    negative
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++++++------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 41a2071262bc..8e4a30c11db0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -134,32 +134,21 @@ static int x2000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
+static int ingenic_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = bsp_priv;
-	phy_interface_t interface;
-	int phy_intf_sel, ret;
-
-	if (mac->soc_info->set_mode) {
-		interface = mac->plat_dat->phy_interface;
-
-		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
-		if (phy_intf_sel < 0 || phy_intf_sel >= BITS_PER_BYTE ||
-		    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel)) {
-			dev_err(mac->dev, "unsupported interface %s\n",
-				phy_modes(interface));
-			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
-		}
 
-		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
-			phy_modes(interface));
+	if (!mac->soc_info->set_mode)
+		return 0;
 
-		ret = mac->soc_info->set_mode(mac, phy_intf_sel);
-		if (ret)
-			return ret;
-	}
+	if (phy_intf_sel >= BITS_PER_BYTE ||
+	    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel))
+		return -EINVAL;
+
+	dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
+		phy_modes(mac->plat_dat->phy_interface));
 
-	return 0;
+	return mac->soc_info->set_mode(mac, phy_intf_sel);
 }
 
 static int ingenic_mac_probe(struct platform_device *pdev)
@@ -221,7 +210,7 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 	mac->plat_dat = plat_dat;
 
 	plat_dat->bsp_priv = mac;
-	plat_dat->init = ingenic_mac_init;
+	plat_dat->set_phy_intf_sel = ingenic_set_phy_intf_sel;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
-- 
2.47.3


