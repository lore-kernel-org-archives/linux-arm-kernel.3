Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5D1FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=; b=X60RT/BWlNY0XLUYMdwHLk3WJs
	EYzQ9flYgKrWQEk+Eg96XH8gNNbbp+5gUTcernGExL9QmF4pungNkQdn2WbAyVCvftjjLklHptVFB
	ljJ5EAHPJ1IgZALfIPm/eyhJ9ZAyajmEanUt1YAGbbLHYcnLEl9Tu6jNHg2yCahdYMA8AC6W2z8tl
	rZKIKSs8sZmhmtLu0KRzRyVvuXmC1h458PnsgPI+z7J6yihQToC0GAx7BIqaPliHxsv4qEgbYOzhs
	jzZUN8UoEUA5lUA43e3ZdsHWObx93f2h94DhZQmGP+LmyoZHpoK6h77GmbUspPpzeXkVopTJU8d3n
	H6k8XD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUV-0000000HAG1-0zwK;
	Tue, 05 May 2026 18:27:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUS-0000000HAE9-24dP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 18:27:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso42572965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 11:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005647; x=1778610447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=AWoehVONG9DGPMvf+fdC7DNrEyO1IQLqlTWV027K8l1gietfsIXS8VMbCXhjfdsjHj
         ZOjovU4bZGWTRoZwF1SM2qVNA/5/lQC8Zg9vm2xGcPigyqGT8at3+B0MebrpfyEn1wV6
         TnmwcCupWbKanJlOR+7tO2XVxtXK5xT4NLqcWKVsL95jut25nenO7OxemVPLgBVpNlr9
         8KEwvHkcn7G/0UgaVN17nXY/n5vNJ03qMjv/deU3K14SkQlYhIqRaE06K1s6pkKJyeuX
         kExvsEvucF+J9FQSbi+5vQU2ovIixhOfs1FJA9US9ptLD9wGwZ6O+sDJGrfe7xP17t9u
         qxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005647; x=1778610447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=B+php8r+/YcDhDn3Gb6bPCmf813dyVKLVbaVgNyyiOG1spsJdyR1vjICvU3xB1tpKQ
         kM2SuB4z9RKqgLbdCaXh6J2SRqq14/PYTzJtOBPFMD3ck3Xt6pwZ7VgLX6IrpAe1Ir5y
         pofgOFVl8ieggarTQ5NW+EZe0gLA5mzxiEt8Lh3LNkmqHLlerzrmgyfACNQ7VL+759/c
         qeJTvk+MNyz3SfY4xiAgtJyow+Lo1wPAATc7ZePJKQMC93A/tjyjv4uRCXaKyit+iRV7
         rCCK/XU1QNtsqkiXJCI903mikaph1cJkCHw8Jmt3jX9Mu2ftiZeogQntYk+8tNOEM6Xr
         r4mw==
X-Forwarded-Encrypted: i=1; AFNElJ8p9nbcze0khN3SEynD+Z95Kb6KXPweiFvLALRvq2k61ViBST6NZLdOFfSx3T80ha8kjnoRL6kR11zc2Qsf+QOY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5CT8FrKlD50xMfhpJWgXg/PK/r1JkWYymQuBq0ZWbic3DLIxN
	8/LzUdO6t0Gm3env58hx/A7H+jgndBhRwu2qYj8ysSbHhIBu0KENKBFG
X-Gm-Gg: AeBDieu80iSM5vAs4QDS0kEGJcy0GFJFhKKZ2MaifrqT3zhqZ/fSKywy0Fzi3zn9z8t
	T10khqFDw7vPcfRJQT+rs0UsV3esH+7I8YJCmJYfnJ96c5XAURMSXPO+FIK8fKbGBNgqbySea0T
	5LzINKG3gMJnN0lIkfJc5nxN26Mz5lrAdaHRFFS+883wYJauCXvETydzAa0MDW00vVnrPxYkQ64
	0vj2Wd4HuDUh+2T4SQKV6+wc1V68VY63eAmE0YDxnb+FELPvrYPQ/IOniN80fz8btnMdJHlXX1S
	Rp8Qrisq8EOT9QNCs4V36C7nfMZ3ezP7N6GaASUETqvkfqSCaAM8WfgRKxICh3tdhd2f7/xAZe4
	4lY3HKfrL1NH4CrawkeiiUpqaSv9x/2YvX8THnlv7nQVSmwzt55lJrbsf2Dt8EXISpCrNHboh78
	kvnI0WyaY5SZMzrBy3KBF3F3fTidyIyo3i/IHZOTIYN5eFAO+v7GAHeqJVpLyNSs7atUVKU09Hr
	J6Ufd8=
X-Received: by 2002:a05:600c:a412:b0:48b:339:73cf with SMTP id 5b1f17b1804b1-48e51f184ebmr5001945e9.1.1778005646464;
        Tue, 05 May 2026 11:27:26 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:26 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 01/10] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue,  5 May 2026 20:27:02 +0200
Message-ID: <20260505182713.27644-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112728_578041_E3B3D491 
X-CRM114-Status: GOOD (  19.50  )
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 087ac63f9193..4d59c0dd78db 100644
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
 
@@ -629,7 +634,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1868,6 +1873,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   config->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -2026,7 +2034,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2828,12 +2836,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3761,14 +3769,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3939,7 +3947,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0


