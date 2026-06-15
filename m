Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A552CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=; b=sRitgOH1haWkHmCyrlwcNwo7R6
	yLIwKLIZOUggZaoRPrCpp5wu43zqDBrAKKcW/lw2pXQ62kzChuVR2+PHNPMJrHYcifTYw9y1awaZa
	KcJlb4/W809LDamFlkQO+xbkAKckB51r5t2xEK4UjEY6QG5vW9iF+6wfRWMb7MUkksjTDQ3IXx5h9
	PRb6+QRRmMIMm4Yzvm7vDAXwHDiilwTU+rA2tPfXHlHp/4vapqwi3A68USb1u4vo2ESmHCUkCVb64
	9r6s6P8NMNs7af/Okj53F6q/Ak/Tq1aJUBe8vmE2m71aiQy2JypCsE/cwZFyKWYbjnOER2y+07XVc
	rGRPdk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Sm-0000000EBSn-0vjE;
	Mon, 15 Jun 2026 12:30:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6SY-0000000EBHU-3ylp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:30:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490be03d47bso34453865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526633; x=1782131433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=gEbgpnOs1MGOg/LtlfNmmWWSFMDvkPsK2Xe78oL3ugNUYpF1uPwWjAG4PFYRG3SmoR
         sdXx+HjDFhb9jhmAvrPzDYeV0mLu6d9nwwvkOnyeODQAFyPANw/EJ2vEPXUQEqnd9EBG
         bMMTuh+MT1rxZhYQ97+MQsWs+jnS3D1sQNjOjML7257TtbuWpbYLoitKRnsjwndKBw5q
         M0kpWZ0H0pwEYkwX6HSe6mzz8Dx7n6lTwwUSV4RgNd1gD0FuNuOGPZOj/lTSJJY7n7ey
         7VTFStkTL/6O6EOh6Bm8G4rjA/rSuMU504+IpxvzGpG7Zbkaub1V2kELQ1iUwswdaq5Z
         7Bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526633; x=1782131433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=odsOrD8okCWkh6Qpud6JqOHc/KW7ulia/dDiw74z+nEdDAXnRkrihhKkGx9XDlSfp7
         Y7hhjKnLOwaNJ7D8Zv7+500zzuT2XhcPvhbq7CtLPywR7sC1Ial/OSrwtPkcIdIWHkVK
         J8TxvQswKEwN/JN6yFA+sDe0c5CT8xPc8phsbg1DKujWcekONFCWY3qSXJlvF4mXaTeO
         C6FHvOsLs9Kx1wj8t8lE10YkbHtfgpuzjUwR3KIInPVAK0rTIHIB84nlSrsu8O4ykfz5
         NbDlx6nFiLqCLhil/FxFEYOsx4RFysea7P8St7tMNc/96NAo5xfXhNDD/+3XAOBtBJRE
         qAKg==
X-Forwarded-Encrypted: i=1; AFNElJ+FXtopt8eI9hP6LJ+eGrW1amI9uiNMpPT03XJRyZ4BnfU029N0WmMbVUV+uIa2PeGfJ7TKVKdd4aVhPdYu/Woe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/4nedl4X2Rv12OwIe1GDQARFrupSiKV98JRGGPnXn69lxkn6e
	+sY87sLCtB3SPmw62g6Yj0znXb9RFy/NTmr86rIeO/BdfrmpGnoCp7lW
X-Gm-Gg: Acq92OHILuduFHLBRko4XHtnA6iHXaqoASEtmGdkHFcXk7GC4m0v0mIuI7KeGybBvYp
	7fmoZqD/W+9GGVfL6unuKJ0Frm2HM8SCwtsfT+BXQiqwnRPHa/Vr7gcMa2Wg1TWREYTOE03LnOW
	jcLD8oiPSQwUSmExjT3/kdpr/K4L22M3iRtvN3yOj8RNil9HX9g5UMdB7E0jFIzfvyQZRjWrEUY
	GuxpTlYQaCt+OGC5+LPVA2ta7iC8TSxMdQfqfg/5dm1dCnP5GAzyJiRF77XmMGR898MLB4PNeXC
	v9I5yHDulcN0Jn43J86ERvDv3zI8CBlHsgEwhff3Ad/kE3wZeZHWybdvEnaRjQ0lAS+mUGyJUld
	qJ61+sM84BT1WhLx3YaG8fyRAdPV99rudTUDiliGlLqCiljYU5LLlomPABYwtFcg6QB58U1d6c2
	BCvl3toF56cimiuldrZUUNGz64PqiZlMNIeooObnx18B5kPEAtplRdL/w=
X-Received: by 2002:a05:600c:4753:b0:490:be9e:fd03 with SMTP id 5b1f17b1804b1-490ec4bf9a6mr188542715e9.7.1781526632715;
        Mon, 15 Jun 2026 05:30:32 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:32 -0700 (PDT)
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
Subject: [PATCH net-next v7 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Mon, 15 Jun 2026 14:29:37 +0200
Message-ID: <20260615122950.22281-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053035_016484_9772C0AF 
X-CRM114-Status: GOOD (  19.27  )
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


