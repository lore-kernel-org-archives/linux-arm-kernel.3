Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D55C5B560
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=; b=1xVA6YG2toiehtBTmaMxZTU2fJ
	Ilnd0EbCP0SmBYNvLbN3lUTGmEE9HnL3i96dY5oJNVp0vDVrNcP7fvl8Bn8z7nc/BPjUDQG8Fu0Rf
	AKXO+g3sP0Hl3XLajsKPW+VxP2Kpx4MxRq8uIfhxidl5Xt9W458nHOveCX0zIU/4jagqTgX1DAbMb
	MySvZg7sYMfBzpryGAMkF7XgU7hdWi4cWy1ZhW6kgfgKGDSaAABAs+S5LIiO9UYxJ6LeVQ3rR9qoD
	GdSKhyuWhYGUl45xYtBjWILEIhi7R7IUi5t9yRmtvUnHnJpwGRoEd6t+I3tK9Lxs6U3VYhP7sKFvb
	t4D8pO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABC-0000000AfrJ-3FDW;
	Sun, 09 Aug 2026 20:31:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAB8-0000000AfnG-1Mjw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:31:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495635a85d2so11115665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307488; x=1786912288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=KklF8i92t2W+j5GKGFdBn+TKZebFCIfq2QLCEwY/KBRd1RPxt64tiSIv5e1j7YCJeS
         nvGbBqiXjpfypYBQCiLgz772MGlDqUiMiottjB8puzRPjvMWGJAZNkG+TpS7NPhZIgfL
         xA0+8xI2RglaGWjQ+0KnkS91xafPS2IzNDAp9/Zq61oAg0hzUmlVXWSHgL2k6qeLibgD
         EvvdvWk0B8nn1Qjvirrd7AzKSYjwl8wzluUg0Lugp/vN6HRM41SXtRA+3fCk+GEMEshq
         M0VnHeoj7KbZiPrL024S5TvzJVq4LPBhtz3QBzSh96cL5rc67YGEq/eDsTHQNKykunCn
         qdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307488; x=1786912288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=EvfSuAqDKWE/omfw2tuJxCiBlQHJWXO7gGBt0/Cd/KVcbvBrjjDHk/8/nAgT95PwGy
         7/cJNx6JciG7P/4FrTkKERaODx1zRrWq8fIKLR91wM7SH6jkhueWrW2ip7hFmD8ilGuN
         O4RYNnO0elrhSA0ql1EBuX8il3D+bmEkpaDfS4b4XY9vOWF0T9AcjerAgcdKVvfib+Su
         yHmDoBKPchOD1hT/3+8PdiImCpt/uqJecoubXf3w3FwlMwKhFcI9HwslSxu3y3lDh7OK
         piuqiMjcN6gcXRTciwsojqrVsx2Y1dul98g2sRHXq+ekQKuOrBJA7HNm8YzuSZAOVke4
         c/MQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbeR8fHAjYs0Vh4P+WDrFLLr+XW7gW4m03gnwqPiFO5r7OhhiHc32MJmbptXgFD+9eoZRChNMoa+Y6viQ6bWrr@lists.infradead.org
X-Gm-Message-State: AOJu0YxNh9z2WXl3O2q4p2gng9iGCDjD9gi0PfOgU3J2PyzmWbvPz2iw
	AtP9xViLjL7QCSDBp3cTgovVtsOGxuVE8iG83hmQg21ho/WeGuScplbj
X-Gm-Gg: AR+sD11JklVEbCpPxQMoHmJvGa28J2lOArsRnXMG60Vj7mWc8E2c2s2o8EtZ+Z3noyC
	34yPlEIyn73ITJzAmUrFWDHy/ztms/qzLNtbI6hszaE4f8UtdxeWP3YNB9AMG5IWEmu/ehKhUgl
	7t0nBErURX5AmH3WBKSS6Fex1IoPJ+6yM7zxKXqshx/P8YTzBdTQQRpcz+qLt78i9XDGFsxiCn2
	OC/bljdQyrmz3YkUK55pKwjaXN9Qd4KhSwwR8mJGMvXAXN4+nvXbwiqSIWBkEMHphNNEK4WfW4l
	BkSwheLxAlteXQHK5LHU89lTF+RZ85EcbOtkJRzU93QerG5Y0csYLXRrSha8Srou0WX+9hl1rkR
	HkFlNqYIK1G/gxplJjjxMBur9SxYaEKyJJk4SMp6WM/Aq9ck6WysVEpXiGsj3aABCi84KmnJeuz
	bAiZJzXTn/9r/4Hdw4a8cW/DOGDSlP34mubE4FUDagt07g+s7Vh5Za1l7PURRkZ7ddgO3W0YSCj
	9Oz1P6bnGYipNoo25AWCmhs05i+gsdV1CMI8Q+94/XNvRxj
X-Received: by 2002:a05:600c:1d23:b0:499:51b8:d649 with SMTP id 5b1f17b1804b1-49951b8d652mr428256435e9.3.1786307488474;
        Sun, 09 Aug 2026 13:31:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:28 -0700 (PDT)
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
Subject: [PATCH net-next v12 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Sun,  9 Aug 2026 22:30:58 +0200
Message-ID: <20260809203116.640271-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_133130_385180_F166C1B7 
X-CRM114-Status: GOOD (  19.21  )
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


