Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892B7CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=; b=1oDpsg/OmhnSycMGv9Td/T0lOf
	vGSKp30kFX/wxT0U9liv4v5+XmS/C+I+mOT4APMDBxGyUH0bidTF9UWZXjrNltxYKoQB0GqT24vED
	gRXDKO6wk88xTXaywIBCb4HeSWcAhq6z8oXAqWgrP5FeQFLlKpvs2wQ8KUcnGJ/V720tUYYEmTN33
	jE7Auxe/OrHg9CBpTiXy53wjXip1tmbeluOBKBACuJuvPTh5LHzWboCaSLQR0Tw90r1tAeKedK9aE
	nqdZggeVKf1Zt63C0+LCIY+XSdeIDaT9o2PX8IB/rRHqu3LH0NGyJkE1IHc5MjizCPEeaaqzKsGuj
	DsEZ4xtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8a-00000005s7f-42bp;
	Tue, 09 Jun 2026 15:13:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8Y-00000005s6J-0btO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:13:07 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-68c76fb8009so7327290a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017984; x=1781622784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=gEf14ZlmoIPKWBog7jMdgOj/u7MvzUXeCOCa+N2qUIwdLPAEhwtYqRUgwY7p6MXsjS
         99MB7sImDS8hLJs4yQHNY77yrAZZbzdBCrYbDCkxLCpHRJpm5xWcbUynfW1ZUd0Q+FYb
         7w1aioucvaC4/3b9H7MVF1PxSw1gAb42SPOnRAmssr7KJ9GZe6+Vc7vk++SEPxkEjSJY
         Gjo9OKdVVNkL+3m+bAy3E/Z9yboPJHTz0E9oXGtQoI7XjkWpY2nF9Ax8tInIogBLjsAf
         k/k+6n5EWN7FcoilspFHAM6Epj/tPRmSZWL1KVdoVIS7s/OYwNS3N8X4PmWl6nKoG4jV
         xKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017984; x=1781622784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=gYyU0ScOgVGrTkuHJ6x5T6IOs72AtXMY1ZuvORQyidenSHemdzbEH/+BBrBKPL5Mvb
         e597eZtGCyebKL4Ju23RqXwurIF2znPAe0oICC1OJ+M+zPwIhC83eOwcyOf1rLDa0K4D
         TXhsvaZLpRzsKdf2ZJ9B59PX81nEhs6TsKvk1ZuyGwGBb69P7TG/HsWZrQr2Ja+x1A4X
         TWDm8sa0cXTjMFz9LNdDWMuxDDWZ5/Ot5TyxH3vXxXEg3q97F2eNZJgXOaJU50cWdofn
         ZFDQVV5wA5PkZFI59pDLoQ8y2umdnyOsbMy76ma8lfxwgEJccn8DEdcPKC6hyb+lU5pF
         mzEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jPz+nosNYrRtZwPBxkyFnAdAVC4VOySCp0p5PIsPWdprLYLZsG0u28VbCYyoyki+u93Lviwixa8Mec7f/eokh@lists.infradead.org
X-Gm-Message-State: AOJu0YyLCDyUCE1W2cx3ltf0vHkvMsv+ap7mAHHPQO9JYtGfohvNUcUS
	vEvsmJ4gCD2HwbGccfG1es0Sz8SNTE+5jjOqNRU26e2cIv4k1ROjPqbyZYuUKA==
X-Gm-Gg: Acq92OGRCUHzVICV8E8oRjiEwjPvxdRTY4ccwYWZVKooyyTaO3iWzuzp063G2VgT3Qg
	VnbNK947u5Bu67de4DLb0pg4jDXMwRXX8wh0C4eqowSpAusKW/CVgzFMbTCXGP7cLnaaI2gtbw6
	jydbkT9rhEc1qM8vi7mk4RASnxfz2vRR7x8MMvqcTZ/xN7Jf59A3w3Y3cCPaarQpS7yHgZuXyem
	pEUTwVeJO48+zcN8T++1y67uUIpIpJWbOTHFLee+ylZPvb7JBAjND8qNTFmSrWX1ghjm14JSwpL
	yAV48p6T+vtMt/no70fuoQoSqJEHyZuafX8rwh01MGjgUO+gjvq9LSSA8Osmf3abO4mDVZTLFFI
	91KaBOZ0/ORmy7BZ+h4aqNXa4jUR/NHj3TpkB8FaCiV+GMzCEzoFZnqi0+6DiA2+bs5a0YSeEOz
	tWfgWI435izg8XB6BsQ1Z915loU/F3fIlJlVoV7cCnBzg=
X-Received: by 2002:a17:907:78e:b0:bf0:701e:b148 with SMTP id a640c23a62f3a-bf3721590cfmr1063340066b.27.1781017983934;
        Tue, 09 Jun 2026 08:13:03 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:03 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue,  9 Jun 2026 17:11:57 +0200
Message-ID: <20260609151212.29469-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_081306_212037_FF3EE62E 
X-CRM114-Status: GOOD (  19.25  )
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


