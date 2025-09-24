Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87407CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 18:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0Dx61SmUSZPOg+fQqzHu8F8LceEPLcrc6v6iwBDeog=; b=WHszt7kSQnPmqpuB8mhi/IQPfv
	jjFVdnnvVoEIOGlnhu/ec8Zu2sFZaRfnJ33/fjjkRHA4XlHzAOgZ4GMaHQpQcig2mrajIWyzA3uUC
	m7PgQgJKzWoMva5Ap4Or73gFQK0BxTd0EQ/P6WxOxcfNOyVbG1o6wIZldEZVVTf7F83kIySoCFGVI
	yXwFgiZJcpyGs7cq8LaoeUkY+2OJu7Q0xZSjJr/IJYwbZLfpwnYO4fyrxjuzDAMc6fTFC33qpBF3A
	uc8v2upgX5taswCxGnLrlOu7RTYCzhpXkPJo+v0pQXBOqK7KBx0JBh34P/gtMfRzLuoO+P9CQnyJu
	BlHAG5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1U6W-00000002YHh-26mg;
	Wed, 24 Sep 2025 18:20:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1U6U-00000002YD6-12op
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 18:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X0Dx61SmUSZPOg+fQqzHu8F8LceEPLcrc6v6iwBDeog=; b=MfXS1Fnfcde3qYg7/oUfA8kSDE
	YhWg/6jAiNfAQo0ulW9VChKrsCBTo2IRdgH3aMBnxEz97+RCVwtlhpJcqG23ifHzqJfFO8V7I0PKZ
	fy08eRZtacm1e7mfpbXP8EbQnVQghJN29Jc5YDCkPemRkRo5XwkwyDprpII7OSX+YVIN60847K4Dq
	fTIuMPlCWasvCCIvKF9gUy/V0pOqK2ziTIiUKyBvlas0vYaivn4uzDGQLB4rLiw2+MWAXEQvOH6Bz
	HnNwtsClSQ6o8GXzqU7v8+aIQejE4LjII/XJWDdk9NzJpuB3QXl3FM5MIb/eXVe2GXi5S6KNAC9td
	cFaD1kcw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51776 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v1U5k-0000000011g-1ojl;
	Wed, 24 Sep 2025 19:19:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v1U5j-00000007Hvi-1Q0x;
	Wed, 24 Sep 2025 19:19:47 +0100
In-Reply-To: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	"Alexis Lothor__" <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH RFC net-next 2/9] net: stmmac: remove xstats.pcs_* members
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v1U5j-00000007Hvi-1Q0x@rmk-PC.armlinux.org.uk>
Date: Wed, 24 Sep 2025 19:19:47 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_112034_299187_24C2A48F 
X-CRM114-Status: GOOD (  15.59  )
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

As a result of the previous commit, the pcs_link, pcs_duplex and
pcs_speed members are not used outside of the interrupt handling code,
and are only used to print their status using the misleading "Link is"
messages that bear no relation to the actual status of the link.

Remove the printing of these messages, these members, and the code
that decodes them from the hardware.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  3 --
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 28 +------------------
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 28 +------------------
 3 files changed, 2 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index eaa1f2e1c5a5..8ff3406cdfbf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -192,9 +192,6 @@ struct stmmac_extra_stats {
 	unsigned long irq_pcs_ane_n;
 	unsigned long irq_pcs_link_n;
 	unsigned long irq_rgmii_n;
-	unsigned long pcs_link;
-	unsigned long pcs_duplex;
-	unsigned long pcs_speed;
 	/* debug register */
 	unsigned long mtl_tx_status_fifo_full;
 	unsigned long mtl_tx_fifo_not_empty;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index fe776ddf6889..2c5ee59c3208 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -266,34 +266,8 @@ static void dwmac1000_pmt(struct mac_device_info *hw, unsigned long mode)
 /* RGMII or SMII interface */
 static void dwmac1000_rgsmii(void __iomem *ioaddr, struct stmmac_extra_stats *x)
 {
-	u32 status;
-
-	status = readl(ioaddr + GMAC_RGSMIIIS);
+	readl(ioaddr + GMAC_RGSMIIIS);
 	x->irq_rgmii_n++;
-
-	/* Check the link status */
-	if (status & GMAC_RGSMIIIS_LNKSTS) {
-		int speed_value;
-
-		x->pcs_link = 1;
-
-		speed_value = ((status & GMAC_RGSMIIIS_SPEED) >>
-			       GMAC_RGSMIIIS_SPEED_SHIFT);
-		if (speed_value == GMAC_RGSMIIIS_SPEED_125)
-			x->pcs_speed = SPEED_1000;
-		else if (speed_value == GMAC_RGSMIIIS_SPEED_25)
-			x->pcs_speed = SPEED_100;
-		else
-			x->pcs_speed = SPEED_10;
-
-		x->pcs_duplex = (status & GMAC_RGSMIIIS_LNKMOD_MASK);
-
-		pr_info("Link is Up - %d/%s\n", (int)x->pcs_speed,
-			x->pcs_duplex ? "Full" : "Half");
-	} else {
-		x->pcs_link = 0;
-		pr_info("Link is Down\n");
-	}
 }
 
 static int dwmac1000_irq_status(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index d85bc0bb5c3c..8a19df7b0577 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -592,34 +592,8 @@ static void dwmac4_ctrl_ane(struct stmmac_priv *priv, bool ane, bool srgmi_ral,
 /* RGMII or SMII interface */
 static void dwmac4_phystatus(void __iomem *ioaddr, struct stmmac_extra_stats *x)
 {
-	u32 status;
-
-	status = readl(ioaddr + GMAC_PHYIF_CONTROL_STATUS);
+	readl(ioaddr + GMAC_PHYIF_CONTROL_STATUS);
 	x->irq_rgmii_n++;
-
-	/* Check the link status */
-	if (status & GMAC_PHYIF_CTRLSTATUS_LNKSTS) {
-		int speed_value;
-
-		x->pcs_link = 1;
-
-		speed_value = ((status & GMAC_PHYIF_CTRLSTATUS_SPEED) >>
-			       GMAC_PHYIF_CTRLSTATUS_SPEED_SHIFT);
-		if (speed_value == GMAC_PHYIF_CTRLSTATUS_SPEED_125)
-			x->pcs_speed = SPEED_1000;
-		else if (speed_value == GMAC_PHYIF_CTRLSTATUS_SPEED_25)
-			x->pcs_speed = SPEED_100;
-		else
-			x->pcs_speed = SPEED_10;
-
-		x->pcs_duplex = (status & GMAC_PHYIF_CTRLSTATUS_LNKMOD);
-
-		pr_info("Link is Up - %d/%s\n", (int)x->pcs_speed,
-			x->pcs_duplex ? "Full" : "Half");
-	} else {
-		x->pcs_link = 0;
-		pr_info("Link is Down\n");
-	}
 }
 
 static int dwmac4_irq_mtl_status(struct stmmac_priv *priv,
-- 
2.47.3


