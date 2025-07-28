Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B85C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uknV8kFABnbg9sOVYofqLfBmUsHtQdNpXIke2XrC9CM=; b=1Iy7plj1+zp3hSME3lBwn8dBHe
	WY9zY+DwcDRfrlTGDC4IegnCEqo+OSHRLM1S3Wcu1RspIx0w1GaL/AMRAfvKyYqqcklRuW9a7acIJ
	LtzhfXr49hcSQ8Nwcr/2KaBhGHxfz7SvWKl/pyw7d4yBdeirteCv9Plakrky437VL6xlfToYY1U6q
	4AZwtCfRHktbr8hSDT+hF0k1b+rnqta/g1hK11JW9xLodkYXF5uOY8sxtx81Btq4PQ0hkFAEUQpWX
	lwnuzJbEILl9IeXl4TV1Izf/gKN2BO0kKRMbie7CQdqjFa/QHThOcZqd9K4J3Z7YdwNoaaQfmO+vO
	mbe7ah1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugR9R-0000000F2bR-3SyX;
	Mon, 28 Jul 2025 16:56:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQ3v-0000000EsM4-4C48
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uknV8kFABnbg9sOVYofqLfBmUsHtQdNpXIke2XrC9CM=; b=N2FoDpuKGup3GsZwcHFrF+b/e8
	lV42d1oNydb/bGE3Gt8hd38gwNfSBWfa1UNCDmVKpGH3MJ4DtIBU71u/ZEVAKauyZgKRoOiZECdY5
	koC+MFfOpjwZpLjs/63UeT2KaOIPrWhoFPwjFdhKDKRvoyEILKN7lKvOwrglno51ONom56JR3O1Bv
	tWaRDUWTWzBa5vhSoo9MFE3tW/QfHABjOJW0RnnRQWQQEW3DjsO1aUNZFYPbtKrNjNmYFwSH+uxFw
	tZcAeJWKuEjeu+iKu5fSeJYplRfD9i4nSJvWYLo3zW6q+5RUz1uUVUoYKnyOzYR0ETjQupZJctVRH
	cm4c63uQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40936 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ugQ3q-0000VP-1T;
	Mon, 28 Jul 2025 16:46:46 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ugQ38-006KDX-RT; Mon, 28 Jul 2025 16:46:02 +0100
In-Reply-To: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
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
Subject: [PATCH RFC net-next 7/7] net: stmmac: explain the
 phylink_speed_down() call in stmmac_release()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ugQ38-006KDX-RT@rmk-PC.armlinux.org.uk>
Date: Mon, 28 Jul 2025 16:46:02 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_084652_035741_DF0DF581 
X-CRM114-Status: GOOD (  10.56  )
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

The call to phylink_speed_down() looks odd on the face of it. Add a
comment to explain why this call is there.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f44f8b1b0efa..0da5c29b8cb0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4138,8 +4138,13 @@ static int stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
+	/* If the PHY or MAC has WoL enabled, then the PHY will not be
+	 * suspended when phylink_stop() is called below. Set the PHY
+	 * to its slowest speed to save power.
+	 */
 	if (device_may_wakeup(priv->device))
 		phylink_speed_down(priv->phylink, false);
+
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 	phylink_disconnect_phy(priv->phylink);
-- 
2.30.2


