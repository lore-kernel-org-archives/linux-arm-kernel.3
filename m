Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E66AE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	Content-Type:Content-Transfer-Encoding:MIME-Version:Subject:To:From:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rr7rETNDvpeIgqIwf5EqcCB/yWw4eNp8t13fgc5Qq7k=; b=t1CIZ7293c6cl15C5shKwhGQxz
	EHOtc+doGI91fqLk0RfgeKEYlTLHhcWDskz6VxQtby+semS5f+9ymtTSFsTGh6mK4IU0n1REyjWBF
	Lb6Ea/NmpSX9pq9qvjNx+rG15AfO/87CaYaG1w3PTyahflVQfUkp9p9cUqTWiPBH1LcPjO8UpF3Hi
	pskLun1TcgIfxPhelJwrvEwPfsjPIPjDOUuvDkq4qnJy6O83ZmlAp6hO/8ccjyj0+Aq7COAXkgvsy
	GoJguGm/e+moegpOQI+4CetS3aSBfIyLzP9+Wl4ygO8pju/7+D9d2+j42fhK958DLr1wPkArBZrFA
	z++l072w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGpi-00000004dHJ-47U4;
	Mon, 13 Jan 2025 09:34:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGgr-00000004aTf-2sjy;
	Mon, 13 Jan 2025 09:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Rr7rETNDvpeIgqIwf5EqcCB/yWw4eNp8t13fgc5Qq7k=; b=mRLDcjT2LmTwN9Em6twYy2HQLy
	lnW6MjJNG+qxyOyyjgiMJkSmkR11PDvDviGM2so/p2e4bCVz8X5Bg/po3BTYrnc98wRJXjXzyzgwv
	cHTxjDLNd/R86YbfR4WrepjGx1FvBTxYJu1LmMzlLSS5vn8LqhBH1brgYPZrBnv3gAPPfdWH6CIZx
	I41wHKlLEbex+bBIirBem2kESKwxxVuZa5m5KB+tF/0cRPBkMQz5sgnG+Qmv6zcJb2i29Mlg23Wvp
	l9bdRb4S3uOYNXXHSMyepE/DdwGaYY64Hi6fWA2BL3q/ooTmvHnfDkpaP6MmItlZc3a/ITaCQEA8D
	5BMpRcrQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36320 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXGeh-0006Gx-0A;
	Mon, 13 Jan 2025 09:22:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXGeO-000Esx-0r; Mon, 13 Jan 2025 09:22:24 +0000
In-Reply-To: <Z4TbR93B-X8A8iHe@shell.armlinux.org.uk>
References: <Z4TbR93B-X8A8iHe@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 1/5] net: phylink: use pcs_neg_mode in
 phylink_mac_pcs_get_state()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXGeO-000Esx-0r@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 09:22:24 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_012457_717963_6DF2B0CF 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Alexander Duyck <alexanderduyck@fb.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Sean Anderson <sean.anderson@seco.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Machon <daniel.machon@microchip.com>, kernel-team@meta.com, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Chester A. Unal" <chester.a.unal@arinc9.com>, netdev@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Woudstra <ericwouds@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
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
index 31754d5fd659..31f2d8a8ff19 100644
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
+	if (!pcs || pcs->neg_mode)
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


