Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AD8C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 23:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=; b=0ZfRz7KiMvnM9gT+6Tw4dYSmJz
	Cz9i36JDgRDzPvoXT7mDy2v5pmmXix2/q3hsgw7giIz0ytlTFozkTiokANsBXT4YK/o14ebSEf4gP
	PfW31X7UnkPwR8qw4vshIm247B36GiZ/eYk2Xi6NiJOLKq48Ncy80oluOaD2zaNTLkh30EV44le5K
	11SsX3rzencop0VIELvXpePJBo45HBH7NWw2VCDXsIM8WRMKBUI7TOPBMxWr3MjIFlmTHDeq0eQ59
	P+Brs9OxOn0ny1Sgii68hMs2ahy6VfxHIfqoiyBVRrWQOSbc5ekQbuvk41FGY1fvPe2YW7W8+Xkgn
	/GoC2OEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSa-0000000CLMV-0rIt;
	Thu, 24 Sep 2026 23:02:36 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSQ-0000000CLHd-3z4B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 23:02:28 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d8239so2588145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 16:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290945; x=1790895745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=;
        b=PEEh1Id6ufHjuVwx0EeOyAqzxefgeSsMMBrE7fqXOnM0lSN9LLTAWnM1zJUGL3pVtJ
         cYRseaycctpFdOXHJPJ9KY44DipyVzZOK/tLn/k4+Ye2Up/tvrpOcIe05nqgvhY61fiA
         MdpFlcvrRHvRW+UDLRaA/VRyBofHNXDT1qXv87qBXODcOKKFDCe+xldQcsttLSowS+Pz
         yy+oUEH+P2qo2xin66Ar5xR2m9J4uEFfuiuofcJHnqJB9Otim8vsK5b0KZ4d35yND/Kp
         Szr6KZ4q38kQ29aRDDDRI1BPTUjeoRKdtBVAv4q9Yxz/9PG2NHKwLXl61Z7Ig0o82BrR
         H7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290945; x=1790895745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=;
        b=ZnpCCQLpREDkvtRutGXV18WowS6NszdVKDtj5DFJozaBDd/k4iiZBA7+GNNKCd9FIX
         Eke+ERxPdyI/sKqdJio4RUzsFALl76BRT0sD2/Y6LDIbzuDoGKMpC1Qg/uZ3erQ9Q4c/
         tkVJwkvxA4HdmdHIl/+1svYVwrVdaIbWmBIr6nRCG0FIQSxGk/83hVPvjPoPeboBQ31K
         b6/SO7yS3XOCCC4Q3C1WG4DDfSCoj0v2elbMReCBj91tJAj9qYa7e/nFuUSraWWuovgF
         DkmDavddG3i1++sE/gB2W6mlb7tEZ2V6q1eYS8Gi14ilzA/sdZZ9dYRdrlwCw+luGAE1
         lRcA==
X-Forwarded-Encrypted: i=1; AKwUvBzPqslDNG9LT/fFHnizHWXEBVrJ/cZyzwkbAvVGQl3NRLi0IGZl2E9owCsL6INE52K1iTFV+6KS1se3I6RHuUw9@lists.infradead.org
X-Gm-Message-State: AFuF++mO8v/RnxNEKvIjj1kWGyKq3ql8dRUGlayhk8s+l8VvxSsQLfgI
	OApO/P6R9TX0nJVT56OuDqJkdX0QnOiCVOyjOkayDUxK8cEA+YNdncrb
X-Gm-Gg: AYBFou0zC+FKpEF/VK4c2Udx71j2bzbbUzA1iaR8g7N/aiCzowY717iM9UQlYb9yZwt
	qUeHI8lSD93NtxC9H4jiyCnh9OV6zOzJwHDrmFKvGU4l9yeN4KW+pL5+tkx2aUTEabbPLZVjNqL
	SsZ0TWFkhaapMeazJ1rT0ntASkrzRjdHO9J7Yj8yXAUM+JV6ObiyTtaPU/bPL5lu9Kxs6xZtj4A
	GhEw/Ti0N1beiGFVVam0VeriSRN7OMnLfX41v/lUzy6AnqA//+WlJXwWxW2ZiK4FEv3N03j2rvk
	/6CfTyV6eYHam6TGNsUsXVPrrci62jsWR8fjjV4Kp4n0CiMhamzp6X93bMIdB+o5Cie3dyfv+cD
	8O/eBKaxRsv8K5thDBBBUvDxmKzHexWNoztZsbIN/WvTVpppQ4JVBJyWK6LBjJRhdPdVvkpCZH3
	wwlUI3z5Sv3LN4DQqKhps9IFsKy6zmoTA5AQdSXoGrWb8qzWYLU5Nud/ugWc7BQskSnOuH2NhGe
	9Hdt8iT0ZsTI+1Ptnsk33eCAWu12Wpi3juOp84Oo/m6VoNT0dUHRldbNKFeK+Ge
X-Received: by 2002:a05:600c:530e:b0:49f:bc28:e8bc with SMTP id 5b1f17b1804b1-49fe7bab945mr63722815e9.17.1790290945335;
        Thu, 24 Sep 2026 16:02:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:24 -0700 (PDT)
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
Subject: [PATCH net-next v17 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri, 25 Sep 2026 01:01:42 +0200
Message-ID: <20260924230211.11519-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_160227_042746_2C216DBD 
X-CRM114-Status: GOOD (  19.14  )
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


