Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63B3C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyxU6GfAU2OYJBof45H0mHXE5/R7CERzacXu0RY4THE=; b=FxZ7TxglEuHp2Ubfqdu5jhRcQI
	heZEOTMKkxPCKqCfHbYyRLoBIXoiPXgKbNzaojOE4YAsrium7EgOF1kyOgo5zmladmg3jbuavC5QA
	PwhlSZbFwf6ZKWd/Ehf3xoW31lwU4FMvdWKfBpzVLVOJRigz3cFQHZi+bbocdEwQTkeBmMoBe3gHU
	kdX+n0dcmoTaeArtIQTvLbK17dCce3V5GtzJEs5ggK5C46eO6iE3Y3c3w4Oln9tFEHkyZsdhjRJau
	7bnQQhstlsIDXjEfWhpXcqoyBpcmEOKXHJkDO1TNy6JES54W8RYSpxaLMHta6L74QQylnGqHC5kMP
	FBz41KPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jsr-0000000BGZf-2df6;
	Tue, 01 Sep 2026 08:30:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jso-0000000BGWJ-2dJH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:30:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso4198105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251417; x=1788856217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YyxU6GfAU2OYJBof45H0mHXE5/R7CERzacXu0RY4THE=;
        b=QVwVAeig3nJeW6WTkfxB8GaAXgccnLLjXPUcy8n+h+/rtwOK9c4ndeGdV1m9EaM6TS
         copzGHySg8zqZtn8eOdTJll0jP98l3l0wvKaNBJCq49kFhyEhsWTQjfdi+5DDfYk9d5z
         bSRweh1/ZdmMitZ12jk6nwwgbJ9zWosu6U3/sXZmLxq8qFx37751Xv0rjhzzeJvoLLRG
         Zk0/lNmFM9Qx2/zlMqHXk1svxcqQTR4CWS7Z+MeG5DTvtubcifzVhAr+KXf8Jq15Rdzg
         ItwFvllvVp9xMa/NKKKiNwC71bekoLs1ZckxU/2ORIoSRKVeZcQd09rXD+qqYnBbJY/x
         eARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251417; x=1788856217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YyxU6GfAU2OYJBof45H0mHXE5/R7CERzacXu0RY4THE=;
        b=GPb8AwfODvrFEiytjKPkd6qSWLSv36pIGaqDkrMN/i0hR3JjnX+H67KhmzHW4b/Fbk
         7/u0DCqJWUX4zHA4H70OCz2DJzwIUqmBgH1JAn2r5WQVOB2YjB4MR+ZI03LX6oQUMv/s
         mpfHrryNjeiHC1z9i/0JNFzGRfC0af5XvO5JoWm7X0vwnoNC7O81vrmjDyaBXBdhXQHf
         dqiHdq0ojtqXYt8Kc/3EhrBfxaeCsKYiIA2a5r5Ku7Ad4NJ7rrDuWV+MyghryHBA+mQa
         FbMCfeYoZzZHADbtfwUjHFixJhVzrNS1WNcHoLP7QahauTvLnFPVs1OJxBCf5SK28epJ
         K1wg==
X-Forwarded-Encrypted: i=1; AHgh+RqfGz8OSgdYOa/fFozmV0ELULtYpzkn93Y4KHvwy/s+26lyZL1GBm7ZLYAmSkgoAE1xFf8jf0VGGsMS25Mogcjk@lists.infradead.org
X-Gm-Message-State: AFuF++ljSIRiMGA+c2v4QIXDoVg/j6Sg8RK+Zqd4B7Uy4LJ+fvnum6Nd
	Oi0/hwizww0A0rfURKoJmnMeJLdCHVaMYmqhADntfHIUpM/JKHJJiybz
X-Gm-Gg: AR+sD13/a5q9WfAIC+4nuoRhp/kB5ApXiH/0Bc7Rs1oZV9Y55vzRN1Byf+kmsQBDlIy
	4mPohczjDoJwnw6X098AOGY+44PNcuhX39MoK9ojE4xgV7Ty8Y0ceT5pF9oI2Y4X8453GIH6UCb
	tG1Jo4hq1VxJie5xIHVUT4oFU8Yq37Jk7hHDZWyrli+oykZml1Tb2SyRi+DWiLQsgpOOmHz/oci
	TXco9Xik40r0L5bOXwvbA3D6zgtDEfpXeqv4Z5W+Ltgit0212mxT6mgXp0mrOAlPwk2xVTgnOg9
	iX/jc+JJ+FdGgEfiGxHQdeJ8cCxvH+QwGr7VGVFa/jWmIy/8fjDFmy1DVUl+aMMwQL7N8ExbGtk
	/s1EoDSwRln+8fATyLoCJeiIOmovu77k2kWAy9BfXTFFigeirtvI8q5k5fPcdTv8qDlFLg+3ums
	lPsxWdW0/b4E/he8nS84XxrjQ/3HrO+si/7aiLxUxIlISOGF/cxwkCaYAJw0G+SNsiWEt5TqJwh
	Fr7fBZGsNVsSkNNF2RurJqbV1sWR2D59EJoVqrtoe/Th1Sb1KW2
X-Received: by 2002:a05:600c:4592:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49b91c290c1mr378787125e9.7.1788251416552;
        Tue, 01 Sep 2026 01:30:16 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:16 -0700 (PDT)
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
	llvm@lists.linux.dev
Subject: [PATCH net-next v15 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue,  1 Sep 2026 10:29:16 +0200
Message-ID: <20260901083001.8044-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013018_698572_3C2BA2BD 
X-CRM114-Status: GOOD (  20.06  )
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
index 3ec3bb439109..7f7a7328124f 100644
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
@@ -1904,6 +1909,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2025,7 +2033,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2825,12 +2833,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3758,14 +3766,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3936,7 +3944,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0


