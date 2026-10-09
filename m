Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67ACCA601F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=; b=JPu7qoTw5Hf6lR+dQJvlIMEG+I
	6LmwjT4wzZnRchLsIvhekHP9QAvAl1qIpnD7EmIZCU1xEoId2dAZgy7rHc78+ooqqzPxCdJ0dmqAA
	gpGUa2syIgE4xzJrwNk0ovvzaB/7HGkcTW7GxLLM5sXxqsv0gDYh1xuOMfiQu0fu6ynan4IJwhEMk
	GCyWNge1eCVb6ds47OkakYQRiDPe2VK6FqM7KZkZvGiMUbnNBYoqmHiuOZ5OIZWDwOIqy5egmmft+
	mVXapZ16YhVoKiTNDykAppMwB2mIj5/aj1totMKs1AdO+cona2q55GIgYPPBugLR4zoPFkBN8PI5u
	QCzOltWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFKz-00000006xHv-0hcD;
	Fri, 09 Oct 2026 18:28:57 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFKw-00000006xF5-0ylP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:28:55 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a168355946so1952335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570532; x=1792175332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=;
        b=k4ezK2MiQWkfDjF8nw+1AfpOUrMZAoCb6mHt+1KGHdTVh9reeRN1/vahbh8VlCVi64
         HI2cJspkL0ZeQPGOFxkPA/3JA/u7RKaDrtDYY2xq8ym45dqNDt+pPqFU8yh2gjbpYRx0
         ud5lmliCbciJvV/5SQEy+lq1rWciXL/8C9wbOF1z8PugmlJSBqKrdDKCUnDbeqsFU4/S
         OyCEOXfMlUnnp+UFgh9wH0PjgREyCVMiSruGBzGrKneeVgWbD7TvEji8K1qD4i55QXoS
         7I0MOgrSNMQi46IqLqmAHcFaHBEDBEYjK69nq1MG/PCuVnlpuUZt7Vg5KDzFSspnMaV3
         jVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570532; x=1792175332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=;
        b=ZuyAJ7ShE59Cf9gf6360CeBohxhEvaa9Zm2iNd4uoNnNya7e4dJLEJs1fS6W4A7/y1
         dbexoHxNckdm1KSewm5i1GAPeVhP/w4GCxGmq7fGsoVJPVirTVHYLuutQbsG+L65CzCx
         lHtqCurX/Z2bluWHWWIJ0Y3yVnmowvuDoCu5YIFuRBrO824rMP4Izj3ProKNIPy+Erii
         q6DlyYXMPCVAr3PnbPFdwFlgIr5h03jRv/R7//dpx8B5um/DwgsMJeVNAouSPtkkgmcz
         0GQtEHWMbBwrNo2KaUl07G4ROImcZUgUCainnf21BPO/BspKwuNHhixtGhviSr7e+mdG
         eerQ==
X-Forwarded-Encrypted: i=1; AKwUvBySI9XHo8g/yDQFQ5+GhjZgEEk17VX46azmRPtGQ7faq8iwjoFvwcUCnzPO3M06a1ikPKHHGedwO6shZFmDCivf@lists.infradead.org
X-Gm-Message-State: AFuF++meydYkEwzYvoHC693iRKVjBpUdGVXBeuB4Nw2fCuL+UIuKYp+Q
	6AS8bgl+fecxcqEuPsTO9pCGW3SDGwD+wqE8dhqyPXgjAMKJPF/xRcZY
X-Gm-Gg: AYBFou2h0W5TZh6klKazhgX+TaUbOyTJjkz2MLwsmSHl1Hqi6z1d0Uyg96wr0hNvmtu
	1nq3MdEclm5XtNKnQb7TTgyQT9gKw7peJ0FEn4mnv5sK2rI7a8iyAzNf0IweEX+FBOtRMO6KVsq
	dMxiho0ajppP0MsYyH1HeYVtzrcNYkOPyB12qACZ7BbjDS3jMrU/9X6sVKd+bW4BHXsfZUbzFWu
	+XEVmq4LeJie89tWhMuRpSgQHUG0jlem4OS84b66zpIXwkVod7kbfqaNbtkWL7PWcAOy/03Q7Gw
	fyp0EmqpOeLPkAxylC2hVGyWbEj+myfGLq1ujPdswLjLwSUbwVZEW5/rXxaeh7AfQskObnewKKe
	xkwehMctQfkcqmFigoAqEWAW+dtjHnJ4Miy1W5fkSAzDIlpMLF7S+81gaVXN34PMFSsjvyYWbx6
	WwQjaYqkxJ5kG1cXHV6C9Rv14wyIBWDM3amaJGBSnu/ajjv4E5GtDMWX3xmYWPJLXKmZlQWfSmO
	YtvIiNsa+ns61bmz1I0NTqply0DI5ahtnOWXhOvNrNlf/QsOtQEhWsA2kfH09k4ZNWnV4WASNNT
	FJKNy/XSe7I9cUHjnw==
X-Received: by 2002:a05:600c:8184:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a18e4f2221mr40285605e9.32.1791570531906;
        Fri, 09 Oct 2026 11:28:51 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:28:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri,  9 Oct 2026 20:27:57 +0200
Message-ID: <20261009182836.50631-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112854_301282_F099E657 
X-CRM114-Status: GOOD (  18.90  )
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
index a7d086cdc9b2..a98e62fa4bd2 100644
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
@@ -2026,6 +2031,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2147,7 +2155,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2961,12 +2969,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3845,14 +3853,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4023,7 +4031,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.55.0


