Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4DEC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=; b=D9O1+oxez4Ir4FO6OKejCuYzW4
	CWgSRtwv0gcJpBL2QZ+3gwhMp2RFKBW3bxTA5F1oRD0RYp15A17im5Dzbxt5LtakMzWXjqpZGRHv7
	H8fAiJntqwQ5D8RkmH28ISbtMj2K4uSz4Q1ngmRtlIButk5G31JI0Sc25YJvVNzd4/pKMxkqvbjj4
	LcMU9VyvBsJKv8BMk1Eoul7EiI3xADeA8H2uX8T47ANTCzVmcAOGoUBaa2RacnsaI/W3wHT8J6SNV
	XN91oNMgJToCk5nf54Y/LNtMEULdWUwCDHP37HKu93OWDVt2a7Nec8QxsxpLK1I+dnGlaQeRbker2
	8yslBclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKNz-000000085Uw-1b7i;
	Fri, 07 Aug 2026 13:13:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKNw-000000085Rg-1PoE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:13:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49800c6a846so27499825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108394; x=1786713194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=H137DNobNEpYeuhl71TH65P0nz02bvBn+W+2xhuXWlkgW2SAGnR23vce5EfeMn0vYi
         Fj1C2fDMdVZEBwE+iKB19FppEfIEkslwEmW04+Su9EqTXRnkkNrJ8LG8QyIJ9S8wIZuV
         EqFjYsYaGYbfqxAomcOPgJXMM6vUOUX5UMDxu2fs1AiUnHeKIq9kweNcF51NwhwBWG3d
         STnnNibwimplBx1zbdonpXosfi2WsBO9N0Un1/nLRUfPO1HpXhyqUN3iU/vFO6DKmY+R
         4jBJiGB9aEj26CsEa0BYbTAbuRLktxvQJIDS9bsVHfgwrtYuyLPB3T9hPQd8DHJmVoYM
         ueSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108394; x=1786713194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=mIXEPHEwp09T3XbSbUlDmKz9C3TEUGH/LHQqw6pPcsK/HZrr+/xt+yA9u4C3uIJlC7
         7f+UoaAYhBscfqhk+0hOzyZPwtOkcp97cnN+0NSOef+bSZIsoQ6VkoCi+9WS9Pnejqiy
         DuimN0S6ytZfwB4g2MVc6iCnitcuXcO6wG6ixsW3qXOsaub7jwkMS1wzgFG+7qXsIhGY
         6auSWMzZUuKs7HARohGoG2WPa6p9h+u+lp8ZnXONWXhxd+xQiL0pMpD8Bd10DmUWOct/
         19NDMThC66KBW3XG0yGsrX6pBSg/yMqnMHvovj7Z2NcCEK7GFZsy3aWyr02NN7qp3d/Y
         m/qQ==
X-Forwarded-Encrypted: i=1; AHgh+RoU3uJWIneDmucciBvVpjkStf0Zb06fU3ryazVPCt46Eg1qQfqoPKPDHo/BiGbkrNOPq5ZxmeCVwlATDsE4tYut@lists.infradead.org
X-Gm-Message-State: AOJu0YyQlPReY/Q8hx9moOk6oA2sCDZacy3FYx9eqo0HrR+haEu+vpBn
	aH+mvuTRQ1UobKb4f0hgfoH2U+lIJGPNzevchMXo7VGOs9p9hytXa28r
X-Gm-Gg: AR+sD12G3pEPNiVK449F7aMxnT56OlcxqWARJKE0E8FfBHY4JdggO6IP91IMEVX6ysR
	+tZsevCN8obdcodMnwrG/G/OIkjjVGVFOepnYzoirzDrU/VanZrVYD0jEzafg3bMga2CGSSWXx/
	qm/gCybIvHMycYJTpxXgifoZCFCUbYWvW4ansEyG3Xu1gFLAHzjJY9kiVW5o+FrXlSgfXc/USOz
	TV0bfrXQahGCuT3v6ARMHm8Miv8vTCrx7MYjPk50wJfXU4FKF+8iljSTG7/7PKAPcQ/lEOl4bDv
	JzfFWDMIenPOCXqkda6h5LVrDiPFaRPtZt2fWHgRBu5r95D2mpqMSCxliEE/dhjQ7jXSU5qhSqK
	zj1lYcNzTzTD9fO6+xyTRzspAtP0AbtPZXD7fon1xzsaLjytsJNW9JLPOFetzKsGc0JsHRaLTmg
	2CMMRtp2ui3DOQQe2qST5HY9EuzP2lGJBR8GbfNm3/be+R+rJHNeVw1RnDZdCmkSE7eWI9/TQc4
	9PO+f8k6ayvrIWS1FbE5/OkW6l+NWwkstCcFsNqpo7SQJYlF0zgVg==
X-Received: by 2002:a7b:cc0b:0:b0:496:cb48:5eb8 with SMTP id 5b1f17b1804b1-49959e38ecamr104184045e9.15.1786108394327;
        Fri, 07 Aug 2026 06:13:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:13 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v11 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri,  7 Aug 2026 15:12:43 +0200
Message-ID: <20260807131301.192060-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_061316_562906_9C382164 
X-CRM114-Status: GOOD (  18.93  )
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

Add in phylink struct a copy of supported_interfaces from phylink_config
and make use of that instead of relying on phylink_config value.

This in preparation for support of PCS handling internally to phylink
where a PCS can be removed or added after the phylink is created and we
need both a reference of the supported_interfaces value from
phylink_config and an internal value that can be updated with the new
PCS info.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b241768edbcb..b7180ae76cc8 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -60,6 +60,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -628,7 +633,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1878,6 +1883,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 		goto free_pl;
 	}
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
 			       pl->config->lpi_capabilities &&
@@ -2024,7 +2032,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2824,12 +2832,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
 		return interface;
 	}
 
-	if (!test_bit(interface, pl->config->supported_interfaces)) {
+	if (!test_bit(interface, pl->supported_interfaces)) {
 		phylink_err(pl,
 			    "selection of interface failed, SFP selected %s (%u) but MAC supports %*pbl\n",
 			    phy_modes(interface), interface,
 			    (int)PHY_INTERFACE_MODE_MAX,
-			    pl->config->supported_interfaces);
+			    pl->supported_interfaces);
 		return PHY_INTERFACE_MODE_NA;
 	}
 
@@ -3757,14 +3765,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	phylink_dbg(pl, "optical SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
 		    (int)PHY_INTERFACE_MODE_MAX,
-		    pl->config->supported_interfaces,
+		    pl->supported_interfaces,
 		    (int)PHY_INTERFACE_MODE_MAX,
 		    pl->sfp_interfaces);
 
 	/* Find the union of the supported interfaces by the PCS/MAC and
 	 * the SFP module.
 	 */
-	phy_interface_and(pl->sfp_interfaces, pl->config->supported_interfaces,
+	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
 			  pl->sfp_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
@@ -3935,7 +3943,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0


