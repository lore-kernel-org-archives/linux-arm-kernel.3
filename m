Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E121D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q29RUPutLmuuyf9faHhOKORrc2m54NhTCroX/m+7cLM=; b=DlKbmJvtQDHMRg80fzucKC0/cz
	cU80JZHfLmSgpfpHEOFi/eVjYiAiIWsvpE+hkiDfb7PuWUVssNMyLl+NREtYQNdHGYr/oaeYFiST0
	U/celsVPXubkLrbG+k13ksv9sBKljEJArlclhF6Z0ILQkgki4rYRqRu8iFaOv+y7sUm50bwyWIMiC
	n9CN7nouTPPEpNufHNQ2fiCI1lP1wpXuBA0Dse42k54Hwrmjo5nffcBBjUexm8TynSYciyxZvSuj+
	egHUX4DySWYVcmia5G2amTwaD86pjcodbMBWrt1BIeDqtFFXdSf0XiT8TX39M5cYAcwGz/fReLOao
	Ddl81mgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs14-0000000ABJE-3UVb;
	Tue, 26 Nov 2024 09:37:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFroy-0000000A8bp-2vor;
	Tue, 26 Nov 2024 09:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q29RUPutLmuuyf9faHhOKORrc2m54NhTCroX/m+7cLM=; b=xujefXPZgKsCaPwA+WmgsyBufV
	qVsTNt6ZLHLgj4SLSbZsU9Jb5UgSObfpkn0fiWBlNKgKVgu5iHD6oOELmMA6sM2K0o7FdjDu0a801
	RiPa7faoW8PNqOqbls68dwNmuKPLzaYDjwEpccptH7FC+WwLNoZDvA46E9yPgc5djQXoSpBJoMYfr
	2wd1v48XpX0mfRQ/TfMB3DqdPKL2o+3INNRreyT7uN0W9p11zf4aTJiPVmfZvWzKxPy7QbltAa0rV
	IuqP9ztqJEYFl3TPYDnCcxMbgMZdBLHtRBml3Ym2s/1lDD9vI7w+3Ovj9sB8mjkUlD+nuyyELeNru
	8Gb4VZbQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48390 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFron-0006V0-0J;
	Tue, 26 Nov 2024 09:25:13 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFrol-005xQe-Ou; Tue, 26 Nov 2024 09:25:11 +0000
In-Reply-To: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 11/16] net: mvpp2: implement pcs_inband_caps()
 method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFrol-005xQe-Ou@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:25:11 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012524_735908_EA21E306 
X-CRM114-Status: GOOD (  13.45  )
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

Report the PCS in-band capabilities to phylink for Marvell PP2
interfaces.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 571631a30320..f85229a30844 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -6224,19 +6224,26 @@ static const struct phylink_pcs_ops mvpp2_phylink_xlg_pcs_ops = {
 	.pcs_config = mvpp2_xlg_pcs_config,
 };
 
-static int mvpp2_gmac_pcs_validate(struct phylink_pcs *pcs,
-				   unsigned long *supported,
-				   const struct phylink_link_state *state)
+static unsigned int mvpp2_gmac_pcs_inband_caps(struct phylink_pcs *pcs,
+					       phy_interface_t interface)
 {
-	/* When in 802.3z mode, we must have AN enabled:
+	/* When operating in an 802.3z mode, we must have AN enabled:
 	 * Bit 2 Field InBandAnEn In-band Auto-Negotiation enable. ...
 	 * When <PortType> = 1 (1000BASE-X) this field must be set to 1.
+	 * Therefore, inband is "required".
 	 */
-	if (phy_interface_mode_is_8023z(state->interface) &&
-	    !phylink_test(state->advertising, Autoneg))
-		return -EINVAL;
+	if (phy_interface_mode_is_8023z(interface))
+		return LINK_INBAND_ENABLE;
 
-	return 0;
+	/* SGMII and RGMII can be configured to use inband signalling of the
+	 * AN result. Indicate these as "possible".
+	 */
+	if (interface == PHY_INTERFACE_MODE_SGMII ||
+	    phy_interface_mode_is_rgmii(interface))
+		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
+
+	/* For any other modes, indicate that inband is not supported. */
+	return LINK_INBAND_DISABLE;
 }
 
 static void mvpp2_gmac_pcs_get_state(struct phylink_pcs *pcs,
@@ -6343,7 +6350,7 @@ static void mvpp2_gmac_pcs_an_restart(struct phylink_pcs *pcs)
 }
 
 static const struct phylink_pcs_ops mvpp2_phylink_gmac_pcs_ops = {
-	.pcs_validate = mvpp2_gmac_pcs_validate,
+	.pcs_inband_caps = mvpp2_gmac_pcs_inband_caps,
 	.pcs_get_state = mvpp2_gmac_pcs_get_state,
 	.pcs_config = mvpp2_gmac_pcs_config,
 	.pcs_an_restart = mvpp2_gmac_pcs_an_restart,
-- 
2.30.2


