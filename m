Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEE8E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	Content-Type:Content-Transfer-Encoding:MIME-Version:Subject:To:From:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++pAlUoiirivdfHRZ6/eIfXRXYJMF6OZOVu6+YVIt14=; b=Gw/4QLk2i/AZR4InkzqZx+sMl8
	E64+reGjRp5erNQ1u46tsHKRXVKhXLeWFG2nAgkYUHSpcxsZXVYl2Cmt1r4/iemPqlAgN6q/KOs/f
	dbPcoCRjoJAtK8q+zfvGSJDdpAc1htGRJA+8hfl8CdHzJq/Ien0aoTcr7zjVRbYl8MP2BWMi4F7Mn
	s84fpp0wqCbQ2mSSktNQDBepZmmIneCY9wKsbvn1cXN4WYQCfA55voM7QVApBGGCQezLpqRfwvqes
	XEH/6+OTpKM5ej1OMKlwmVA918DaJJs5Zw3BheCPIIs1C88tGlFD6eJti48s2FLmdr4+Z+rhJc1YI
	PcdvtBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGoW-00000004cud-0FAr;
	Mon, 13 Jan 2025 09:32:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGfM-00000004abi-24jX;
	Mon, 13 Jan 2025 09:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=++pAlUoiirivdfHRZ6/eIfXRXYJMF6OZOVu6+YVIt14=; b=JkKeqIJSEmU7aCYJJ4h+ken2YQ
	23HIj4C7VT3wqx1jNn7A/hBd6wZhTbDlYDMfIH/QtibUB8Q6MB3EvwTHq9Y3ZeWrIEXbacNUsDnpW
	TiqCV/oqFIViPlmg3PWkbNjt1PcEOqw14k9aQ2l2sdn2V7lo6HVIYo6Iyu3edOr4Zvf+lkpqE7Bs0
	Ij3bHnchcPfSdVINzBkfE0zwSMWae4Q2I/MxHsY74EiiT3hc8W8r7ru9v7Xzynioswkvq0E0wJuX/
	d27xb9LXeYSdpSKk9KC2Z2DBSVbRbDLzQdwL9jY4rGOL/rtiu6kD7g3HQlLajBexRELRNr0bibC3W
	/3WK0Lmw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36016 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXGf2-0006IC-10;
	Mon, 13 Jan 2025 09:23:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXGei-000EtL-Fn; Mon, 13 Jan 2025 09:22:44 +0000
In-Reply-To: <Z4TbR93B-X8A8iHe@shell.armlinux.org.uk>
References: <Z4TbR93B-X8A8iHe@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 5/5] net: phylink: provide fixed state for
 1000base-X and 2500base-X
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXGei-000EtL-Fn@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 09:22:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_012324_532088_7FEF0ADE 
X-CRM114-Status: GOOD (  11.94  )
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

When decoding clause 22 state, if in-band is disabled and using either
1000base-X or 2500base-X, rather than reporting link-down, we know the
speed, and we only support full duplex. Pause modes taken from XPCS.

This fixes a problem reported by Eric Woudstra.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b79f975bc164..ff0efb52189f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3882,27 +3882,36 @@ void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
 	if (!state->link)
 		return;
 
-	/* If in-band is disabled, then the advertisement data is not
-	 * meaningful.
-	 */
-	if (neg_mode != PHYLINK_PCS_NEG_INBAND_ENABLED)
-		return;
-
 	switch (state->interface) {
 	case PHY_INTERFACE_MODE_1000BASEX:
-		phylink_decode_c37_word(state, lpa, SPEED_1000);
+		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
+			phylink_decode_c37_word(state, lpa, SPEED_1000);
+		} else {
+			state->speed = SPEED_1000;
+			state->duplex = DUPLEX_FULL;
+			state->pause |= MLO_PAUSE_TX | MLO_PAUSE_RX;
+		}
 		break;
 
 	case PHY_INTERFACE_MODE_2500BASEX:
-		phylink_decode_c37_word(state, lpa, SPEED_2500);
+		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
+			phylink_decode_c37_word(state, lpa, SPEED_2500);
+		} else {
+			state->speed = SPEED_2500;
+			state->duplex = DUPLEX_FULL;
+			state->pause |= MLO_PAUSE_TX | MLO_PAUSE_RX;
+		}
 		break;
 
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
-		phylink_decode_sgmii_word(state, lpa);
+		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
+			phylink_decode_sgmii_word(state, lpa);
 		break;
+
 	case PHY_INTERFACE_MODE_QUSGMII:
-		phylink_decode_usgmii_word(state, lpa);
+		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
+			phylink_decode_usgmii_word(state, lpa);
 		break;
 
 	default:
-- 
2.30.2


