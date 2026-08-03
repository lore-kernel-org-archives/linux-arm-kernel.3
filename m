Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DA2C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBn8+Hx956XQS2N8rfelEGrUn9IDXjKs/rR491vlUQk=; b=V/t5fAT14VHFYwjJFPlwwJSYnq
	Axqn/seG+LQYBdNogckhTe4OoQ33I7QN5vYCucILEg4tBxaKz8Q3zWIDO1bN78jRic0rQ3dT3R2GW
	UKbD8q8WK33UMyDV5H56xOmof3NPh7O02eX5nD+5gubctBzNxTD4y0AGxyilhduAo2K5qy8u8349e
	MxhvISIbWOtByrjTyet2e89P6tn7Yz9Ru8CzGHhC6w3n7+TLo/zN44R3xHl/50RjHj5d0B85kd4GY
	TnmaH/3TRnehLJ6xdY0P857jB0L2YWF5+JQ90+wX3Y/4q8UreTiIAUBXY6GawLdz68EP/Bhd6FCVI
	L/Y8BDFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1n-0000000GLO9-2r7o;
	Mon, 03 Aug 2026 05:15:55 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1f-0000000GL40-1Nbh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:54 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb68bdf53aso1091837a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734145; x=1786338945; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBn8+Hx956XQS2N8rfelEGrUn9IDXjKs/rR491vlUQk=;
        b=hSVQFf15pQHGLsStXBW5aIOsCxHabUlfKCalLEP0QqeFK9lBErllzqpdgA8ZJrXiCW
         +2bXlVaPW3kzjdly58cwGLw2ZdAADws8bamHrHGBz8iTNjKyQuqsbxIgnwGnSvPQwoNU
         YvqZqSxLCRHRiK2z8edYNGByKThUUeTqm8JgoiyqoYLyp8mPBmeXjxOWWBa/FQcr8JUU
         mjeUc3IjVx4Z3yeqMhrqbCt5k69pH4at2ShjpeyCFxWKGt+88X/KZ/N3NlSUEKzR/294
         p1reuuB/3rcl2KrMXD+zohUvqsz67lWcbQR1xjOcax5tRleCIhxAifBbg7R78u5VjxZv
         0nWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734145; x=1786338945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBn8+Hx956XQS2N8rfelEGrUn9IDXjKs/rR491vlUQk=;
        b=g4M8AmsrBd2K4OtUKJRhZ7QneILe37lj02KR2ConiyjnvFWHYbH4BqlLOOTXf65D+i
         yamJEOaWy9knXrGH4x1sJnWJk2+rrhbocMbBqpMZnO03YI3qrm6eZLigsA/oqabzsiL9
         xUdE23qmTSuuw820fyyBQSIwc5Qf/rWB+1nTucSAb6wt+WL2LKBqUM0zlCwf54GZY41i
         ewQYPUMIi+/VGjYfdHLbbnR2b3V9q+4sn8wVrLb8L2aej3UsfIF5Swc+qtFxhRNeXSo5
         XRHXOfT/WstFtRhQR/+LjsB3KSlVAc2msugdt4WPBDRlfG8DscjgkWXhDs6E0kADLg1W
         9sYg==
X-Forwarded-Encrypted: i=1; AHgh+RpwjSv5RudWsJy/L8EPzRlUKZm74vX45YxAbIb2XYFKQMsyXBMVno5hykyMosO7pZ5fPuUT61xFvFOq7xiH13Lr@lists.infradead.org
X-Gm-Message-State: AOJu0YwYr7tyPWGh7/MqfUmQnIxMrshlMgJiLL/1Gu9xzjH+6ol3oF7h
	ExEFl+vPEpqonLjQt9bt/j5b8RfMpaYlDEk18WhUOUGbgYJjpiIHYkWwKnsSi0E8
X-Gm-Gg: AR+sD10AP9OuPUoIX3zmoicfRUTFMVwjZQRqO3ZjpMgwC1JZNQewZW6TplaiysqwkmR
	ilKd4xF03QRLNKv418zepjgRdMkiex+iJ3BCXKlAvjNCsvOBOOk6HGxRuDpnkJLH7mfD969SJff
	wAZWvyK0/+rG8z7NCgTBFy5Uj12NgGYUid50+T8F+y6vHtO1JVOR0UMCpb5v6A3XE2un0L2wKDc
	HtCU7UuwYxzBPtdqVd0qsgRmveyvkEb3jzFUuhMy+0tHyMsEwQRRJBP0DWwd6a46xzLtr7dCeNX
	nqtsnM3niyY0yWAj7kmghaRUkfjH+ZRfCO2Ch1JyRWK5JxW3kdUIi5hXWBgWc3LXxD2ZPFYcyNa
	C1lqmzFE+IN5u4j5bZ7UcVwhoE0Pgd5wGQ4s2qqdvlNV+qz7WyNdmjkarnvpge8bcWTGs3SR02e
	HekCHS1fP5vJ4TBAli5qMWliqknpljvYlM7DXWa+SFWiuKHWBSQ1NWm5idlQ91Zu5mx+Yl+L+tU
	QF+DK+GVXCCj1CQTMy1nzAxWJvcXb9EKRLnylYIdcfW5p8EQNPCblOPzgnncdDJfUApKkLJs9wN
	sXwwVu17A3m4nI+mpjbCFDqf0F91w/ILUd1ej0oWXyl5IZIv200kWRbAkdG5Fghvd4orDShO79R
	n3SAlemR9z+R8o6Tatg==
X-Received: by 2002:a05:6830:f95:b0:7dc:4947:36a1 with SMTP id 46e09a7af769-7f19714f993mr12573380a34.12.1785734145466;
        Sun, 02 Aug 2026 22:15:45 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:25 -0600
Subject: [PATCH 15/21] net: phylink: allow PHY-autonomous EEE without MAC
 LPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-15-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221547_476163_113BA497 
X-CRM114-Status: GOOD (  19.84  )
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

Phylink treats a MAC which implements its LPI operations but advertises no
LPI capability as incapable of EEE. It disables PHY EEE during attach and
rejects ethtool EEE requests. The same problem occurs when the MAC supports
LPI on another interface but not on the interface currently connected to
the PHY. Both cases are incorrect when the attached PHY can generate LPI
autonomously without help from the MAC.

Recognize the PHY autonomous-EEE capability, preserve its EEE
advertisement, and allow ethtool EEE requests in that configuration.
Evaluate MAC LPI support for the active interface, and restrict EEE modes
to the MAC capability mask only when the MAC actually manages LPI.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phylink.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 18d2ead97aa5..e64f72793aa0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1512,6 +1512,19 @@ static void phylink_deactivate_lpi(struct phylink *pl)
 	}
 }
 
+static bool phylink_phy_supports_autonomous_eee(struct phy_device *phy)
+{
+	return phy && phy->drv && phy->drv->set_tx_lpi;
+}
+
+static bool
+phylink_mac_supports_eee_interface(struct phylink *pl,
+				   phy_interface_t interface)
+{
+	return pl->mac_supports_eee &&
+	       test_bit(interface, pl->config->lpi_interfaces);
+}
+
 static void phylink_activate_lpi(struct phylink *pl)
 {
 	int err;
@@ -2090,6 +2103,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 {
 	struct phylink_link_state config;
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
+	bool mac_eee;
 	char *irq_str;
 	int ret;
 
@@ -2106,6 +2120,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	linkmode_copy(supported, phy->supported);
 	linkmode_copy(config.advertising, phy->advertising);
 	config.interface = interface;
+	mac_eee = phylink_mac_supports_eee_interface(pl, interface);
 
 	ret = phylink_validate_phy(pl, phy, supported, &config);
 	if (ret) {
@@ -2144,7 +2159,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	/* If the MAC supports phylink managed EEE, restrict the EEE
 	 * advertisement according to the MAC's LPI capabilities.
 	 */
-	if (pl->mac_supports_eee) {
+	if (mac_eee) {
 		/* If EEE is enabled, then we need to call phy_support_eee()
 		 * to ensure that the advertising mask is appropriately set.
 		 * This also enables EEE at the PHY.
@@ -2165,7 +2180,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 		 */
 		linkmode_and(phy->advertising_eee, phy->advertising_eee,
 			     pl->supported_lpi);
-	} else if (pl->mac_supports_eee_ops) {
+	} else if (pl->mac_supports_eee_ops &&
+		   !phylink_phy_supports_autonomous_eee(phy)) {
 		/* MAC supports phylink EEE, but wants EEE always disabled. */
 		phy_disable_eee(phy);
 	}
@@ -3300,17 +3316,20 @@ EXPORT_SYMBOL_GPL(phylink_get_eee_err);
  */
 int phylink_ethtool_get_eee(struct phylink *pl, struct ethtool_keee *eee)
 {
+	bool mac_eee;
 	int ret = -EOPNOTSUPP;
 
 	ASSERT_RTNL();
+	mac_eee = phylink_mac_supports_eee_interface(pl, pl->cur_interface);
 
-	if (pl->mac_supports_eee_ops && !pl->mac_supports_eee)
+	if (pl->mac_supports_eee_ops && !mac_eee &&
+	    !phylink_phy_supports_autonomous_eee(pl->phydev))
 		return ret;
 
 	if (pl->phydev) {
 		ret = phy_ethtool_get_eee(pl->phydev, eee);
 		/* Restrict supported linkmode mask */
-		if (ret == 0 && pl->mac_supports_eee_ops)
+		if (ret == 0 && mac_eee)
 			linkmode_and(eee->supported, eee->supported,
 				     pl->supported_lpi);
 	}
@@ -3326,10 +3345,11 @@ EXPORT_SYMBOL_GPL(phylink_ethtool_get_eee);
  */
 int phylink_ethtool_set_eee(struct phylink *pl, struct ethtool_keee *eee)
 {
-	bool mac_eee = pl->mac_supports_eee;
+	bool mac_eee;
 	int ret = -EOPNOTSUPP;
 
 	ASSERT_RTNL();
+	mac_eee = phylink_mac_supports_eee_interface(pl, pl->cur_interface);
 
 	phylink_dbg(pl, "mac %s phylink EEE%s, adv %*pbl, LPI%s timer %uus\n",
 		    mac_eee ? "supports" : "does not support",
@@ -3337,12 +3357,13 @@ int phylink_ethtool_set_eee(struct phylink *pl, struct ethtool_keee *eee)
 		    __ETHTOOL_LINK_MODE_MASK_NBITS, eee->advertised,
 		    eee->tx_lpi_enabled ? " enabled" : "", eee->tx_lpi_timer);
 
-	if (pl->mac_supports_eee_ops && !mac_eee)
+	if (pl->mac_supports_eee_ops && !mac_eee &&
+	    !phylink_phy_supports_autonomous_eee(pl->phydev))
 		return ret;
 
 	if (pl->phydev) {
 		/* Restrict advertisement mask */
-		if (pl->mac_supports_eee_ops)
+		if (mac_eee)
 			linkmode_and(eee->advertised, eee->advertised,
 				     pl->supported_lpi);
 		ret = phy_ethtool_set_eee(pl->phydev, eee);

-- 
2.53.0


