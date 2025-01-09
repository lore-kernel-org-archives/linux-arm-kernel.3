Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1795E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	Content-Type:Content-Transfer-Encoding:MIME-Version:Subject:To:From:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEkzOP+TYKc4XOYXIthJckwH65MhpFEHyONM5gD+WwU=; b=Ga9Awv714kx2eFLkI9yttUxvB5
	RcOmiVvjvYe0f7CFc4kZQDFkiFfYEieVeErjEcCG82Amlx4gijGWJNM0SwOclVu8WkMaIEn9Ppw9F
	iwK3HeUstLDozmuRIQ4n28wqT8ws28EFp4FlAyzKxNk2/CUMyn/BsAbZmejuT+0XOrtTswdvJegIk
	gdMgwYnB3jI2CPl4CmyXpHbsmZM9uj7zRBGJsjNNEJTA2C5FkYNzHCvlnGqDSW3dxu+bqbQZM1FOk
	eQfIcLGqakTbn+bvqxmJiyo/cfkck/81KvjtBAipF/h/BMpIE175f0ZhKxS1pVAGxuKLkzcTbh1me
	oXzei0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuIn-0000000CRAF-0cKc;
	Thu, 09 Jan 2025 15:18:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuGR-0000000CQYn-3CxJ;
	Thu, 09 Jan 2025 15:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BEkzOP+TYKc4XOYXIthJckwH65MhpFEHyONM5gD+WwU=; b=PUAn1K1chNeJydB10OieWZJcME
	BleSKFdpoI0ZZb2s9t2YIQINwENbElALY0JC76AzUd/Ivy/FaWKIN3+D7ccesKZYmM6G85T8nhNz1
	iwhqI9kd47qrPA15IvYJJMlxCtF/iEVHnb1fiiQhjV27pRjar3mtq7AeIxg7j0jjbNsZM7sgyHWcp
	3hBSJSmkOJMpCxcQbXiXEAQ1xSqjzaPZk1Vvo+YlP4OFMYpTjqOj941X7gGqiBW9BGbX9v2a9Nnu9
	w5qDIHNwZlze8rVEetBmKR3TWBOUV157xNEcFWEnVtHdIuz15hSEjhFfY+XuPyVeW69M7Ie+3zppW
	x356MfWA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36270 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVuG0-0002D0-1I;
	Thu, 09 Jan 2025 15:15:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVuFh-000BXQ-D7; Thu, 09 Jan 2025 15:15:17 +0000
In-Reply-To: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
References: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 1/5] net: phylink: use pcs_neg_mode in
 phylink_mac_pcs_get_state()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVuFh-000BXQ-D7@rmk-PC.armlinux.org.uk>
Date: Thu, 09 Jan 2025 15:15:17 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_071603_801196_0A551213 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Alexander Duyck <alexanderduyck@fb.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Sean Anderson <sean.anderson@seco.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Machon <daniel.machon@microchip.com>, kernel-team@meta.com, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ar__n__ __NAL <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Woudstra <ericwouds@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

As in-band AN no longer just depends on MLO_AN_INBAND + Autoneg bit,
we need to take account of the pcs_neg_mode when deciding how to
initialise the speed, duplex and pause state members before calling
into the .pcs_neg_mode() method. Add this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 31754d5fd659..d08cdbbbbc1e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1492,12 +1492,24 @@ static int phylink_change_inband_advert(struct phylink *pl)
 static void phylink_mac_pcs_get_state(struct phylink *pl,
 				      struct phylink_link_state *state)
 {
+	struct phylink_pcs *pcs;
+	bool autoneg;
+
 	linkmode_copy(state->advertising, pl->link_config.advertising);
 	linkmode_zero(state->lp_advertising);
 	state->interface = pl->link_config.interface;
 	state->rate_matching = pl->link_config.rate_matching;
-	if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
-			      state->advertising)) {
+	state->an_complete = 0;
+	state->link = 1;
+
+	pcs = pl->pcs;
+	if (pcs->neg_mode)
+		autoneg = pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
+	else
+		autoneg = linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+					    state->advertising);
+
+	if (autoneg) {
 		state->speed = SPEED_UNKNOWN;
 		state->duplex = DUPLEX_UNKNOWN;
 		state->pause = MLO_PAUSE_NONE;
@@ -1506,11 +1518,9 @@ static void phylink_mac_pcs_get_state(struct phylink *pl,
 		state->duplex = pl->link_config.duplex;
 		state->pause = pl->link_config.pause;
 	}
-	state->an_complete = 0;
-	state->link = 1;
 
-	if (pl->pcs)
-		pl->pcs->ops->pcs_get_state(pl->pcs, state);
+	if (pcs)
+		pcs->ops->pcs_get_state(pcs, state);
 	else
 		state->link = 0;
 }
-- 
2.30.2


