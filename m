Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229BAC54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzxG+LmD3OJBziXxFrZNUzc+hlymbEKWiIuouLUjQy0=; b=ahxmG9bWXpqUCVKhM0hxu8nO0K
	l0tNlBywwGR9jCpViFH5nrsyymBJ5C2dzghkdmBEfrkRok1mo1x3pyO2EPnyYzMf1ito4tVglntP1
	xmCHFUGGkBn9aeEq5B1IL9TSfTEqD6SsTs6oeRq6yG0Daj8lKETAhnKLwsLgkv6tC3K+Pk1yoUf1d
	0ba+WuubB7ugXZi2+5BURA+jK6KT6zBfTp15L00Xpi4mRAwDui96xPL+G2Y2TrdXVtj4NmF0Zqum/
	19ZxM96BELqa5pMXUV/dZLRaqB1aZ/URf61ElJHuFvglrNq0ke/wqvzZaYiRU555rM3ELaBiXxXvu
	KxTon+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNwo-0000000ABXD-3Ag3;
	Thu, 30 Jul 2026 10:25:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNwg-0000000ABOv-3E24
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:25:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso13640775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407097; x=1786011897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gzxG+LmD3OJBziXxFrZNUzc+hlymbEKWiIuouLUjQy0=;
        b=YDCV5fwlYf0txGKRQDC8ZhS+bQdX8AZzaVv2HeZsQDFxiJfx9RDSRhMHV3lx7PhfjO
         6/+FFIzpxxqgqwbHqz3csECWNtVZpdKlJuJM717dxbzzaw6E9Lk2nMGC0ZpxUAqPlfmA
         ltUW1pNH984nqVvSY1bUospcamDoCj+OKBAs8dHm6PlQBk5BiaZb/FkEGWnMnAuLPLMi
         qoZWgI/bG87BHxouBo4HsvtfOuKgax7DL9tJ9vG7TI+sHT+wIFxDj1W1y7yWObFy+CkN
         ibms3f1gqx6gGsMJSpVGngY5e3PqWvi+JmSbSc5AhVRUPkwspquAjYsVGrDtYJ6iD2qe
         WYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407097; x=1786011897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gzxG+LmD3OJBziXxFrZNUzc+hlymbEKWiIuouLUjQy0=;
        b=W9gk4MeeGvwH+GO2Xciwsq0InR7nSrihIrCIMsndtNILBAQoJtB8M6NCA3yhubpfj9
         uPK9GWANJY0LZ9SfI18z+CzCJM9I3Lswe2Ef3/8J0pAB5leV/gT0kAaaP501n1d8sGQc
         iC6gYa/BbCALG63xVDsvVm5I1jGE4IZqecjOLjNJKzzv66uCLi75ZGH4MrRwT/tG2R+p
         /iUf99rLAJgq0y8fTVYHVnb/PjM1T4DkfGE6pj2EFX4OFYSgkjokZm2drCwgAW9ln6G5
         NSGNeOsQW8Oqdl61hCpBPaq3zMdDJzBr9dM8YYwZsejqiJ64/NGl43OtYlLdgA1Rpd5a
         19rQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp80GnHmCpXXpmi8CoLuc0iClJFV4MKVmEYb/TQ+T38pSXrBYbalbdqwVNaQd1NXedUAIyRWYVPD6o+WzOAGXGu@lists.infradead.org
X-Gm-Message-State: AOJu0YxhtEYwUnjX7n6gWf/WZFZkNcj6GdHN43cyKEEVfMQM3+cMZhKv
	O5wQQiq0Cewtzdv3R8teYITrXRheEAb1rKz8PDebhiKGn2Hehw5Os4Up
X-Gm-Gg: AR+sD11oVPNxDUbC2j8Qo1Y+OueLmpeGKUCC9+O/+QKuTmaBbZrUifx012GJ8H0w0/0
	DNbKmaL2LRBO7rbcu3gaqKj71IAa909DO2W2BZR/QlXGmg+GBIUBaoPKE/FtgPf0eA497hiDRJY
	Ng3jsUYxKuxZqacGDs+yXeN+VA/nSW7yEW7dLeYIpgg1AKGA4p4tKMfceKD0+Cbqlz32LC7E6lx
	CzZ0crcMeCM0ty9Yv3v/YPkN3plNqqkkhIavigt6YielWZJYviho14l0GcA5BaWX89oTM+Weuru
	yyptIZ2zNJ0DQnth/QeglUy7BMPeCGo4yAD+zpm0fG3OwuVWGDzLEVjxH6baNlST1kT/2vo3DFM
	7jfQT52FqA3fP07if+BvAf71o3mSEX4rcj0Z3KePrU34K30A/ewChXIob+HyUQHSitrHk05VbAZ
	Pt0qgs90/LOvjgVqVJV3ei4ZI6equWW3gufBnpp50fLtFzvLXzoggUKlT0tYGpUukUtFwkJS4r+
	XNlMw19x5i8K5LiOChBip9MwloOHzAzeoOKWwSB86cUpQrQ5jMl4TQ=
X-Received: by 2002:a05:600c:6298:b0:495:64c7:804f with SMTP id 5b1f17b1804b1-49800ea1ea9mr27095295e9.23.1785407096531;
        Thu, 30 Jul 2026 03:24:56 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:24:56 -0700 (PDT)
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
Subject: [PATCH net-next v10 01/11] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Thu, 30 Jul 2026 12:24:12 +0200
Message-ID: <20260730102444.1967900-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032458_841560_CF1706B5 
X-CRM114-Status: GOOD (  19.34  )
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
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 59dfe35afa54..3464e3ec5699 100644
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
@@ -1867,6 +1872,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   config->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -2025,7 +2033,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2827,12 +2835,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3760,14 +3768,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3938,7 +3946,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0


