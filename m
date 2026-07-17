Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB3EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0uRZpPkHTFGQEhRIP55ce7iIYoUNOFMFnyc5qdnNIQ=; b=Aghy0hKfOU6YHsrIv8u+1jtsmN
	npWT3RNFnxMiTHsguMfUG5XwRPzEO48ojUsCEU+wCXETR+fyeKkP8AshzuEQPndGFvcGZzxFvfbAC
	tAS3MWc7cF+UNkUcfuZBym5hpRwbuL0dV4s2B29t2oQKmeu9PslAlWMTxDcOpbczfSaA1Ja4flM3l
	IWLHZ0rRkILOKKKlApW2WVv/AbTOaGXBdaRa8GfseSBwazCnEdYh3NALCBitYfCsUsGTa02+dyd8B
	0YsENE9oQ1MEr+EJQQEnHB6XquDtHPZoOS4mzggjLfaUgRZhv5MjlQE6L+h8w1uY0MQrVUhMW2Vnv
	j9F6Z3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTd-00000001JVT-33Ku;
	Fri, 17 Jul 2026 06:55:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTX-00000001JPa-40ax
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 06:55:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-495437bb891so8431615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 23:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271310; x=1784876110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z0uRZpPkHTFGQEhRIP55ce7iIYoUNOFMFnyc5qdnNIQ=;
        b=cjHN+j22/FtKLClqgg8/ebN4q7OUAvM9+MBEFq+cG4/2POLT7VW2rX2EMm6k8Q+pGS
         B+XT8bU4Aa56hql1F5IQcDNtsDoFIAFKu7eHXSpseY/zj6ZqyIvSvCqFs3v1vhT/D0ys
         UdKg4j3VBw0ccrYIEldBroXZyjNcn6/1U7scPcC0xv9w8Zrm6uWhpfIvyEh2iZCe5egJ
         CeA8nbQyYiSeudNVr/n9lZqaiqfJun1onKquYaLJbHX5ohGJ7MwmsY3BzrKyf7cIwPkc
         YvcL3oHyQN4vrfUO7A4GoCwU9Fm7UHcIv5LBN1e08brxahN9WERmjawY/M1e9SuFSqSH
         e2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271310; x=1784876110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z0uRZpPkHTFGQEhRIP55ce7iIYoUNOFMFnyc5qdnNIQ=;
        b=MHufZo4A/QuSPpR/blniCGmO9QuXkxsSWMt8ohK0KKrNvsdC1KuH01NjAmT5wthG2q
         mk5kCS4rjcL04h3lzQeA3bAtcbhLuiq/uZctKWgLsbPniqK0NQw927Aqu3L/KDD0Yw/H
         6OJHsxSUxqzgwIDTI8CAcDx6nZs6kD/mq/peiT6MclN6yEqzxcr9/ExK5lY5Ttep/eqi
         fyPfbU49ACSjODunXgC4uYTbfdSdjZ9QpoqkG/pDV00TOLgtQWp0RdQ0+6a4uk1ql/Ad
         Dybazch9nxfOLLzhag0xFpwBeGFaVKveKiQpxmknFCaq6+cbUKdwTrCbCVIGe6xCgmxU
         cBfg==
X-Forwarded-Encrypted: i=1; AHgh+RroCgOcUDhyvfZFuLe9Lc//Bxzfl5alIaNPuqz7e6Vs52e5R5rV4GZ4xlrkaLNpPENicHnwrduI1OdRja78OTOI@lists.infradead.org
X-Gm-Message-State: AOJu0YzDi/RLqEa8a7fNUb6lpRla4WK2pM2bTgDVXkUczZLU+x/HSJs1
	VtHT9Cxq7AB+DbhfeOO+JAxdj57loKRcgsmV/g+sqnt2PP1JWLUQ2CtF
X-Gm-Gg: AfdE7cmr8a1nwXHowsfOtleN2t1ZiZvHxrcEpTa0sSjB+fs2jpUzZYvHNBX8V+gYlqy
	DZ6n2yYv/pY2QfzhpuGVPcleiHnTujouAIljKoaGdL9wjqB/UBvn8W7t5w2A/m2rursENN571qm
	POGBwOu4M5twEHqvJVjVHmDLZenRm31okMCukjK8oiRCoU5XjqyTZENFo+DaLhsY0VrQCuq2Wgg
	fpe3mYQP8VMbGBp5BTaX3Yu/PgSG8Vlw22YvDgR4nt6wnj9cXgxGHQGnLSb1jHRH2cICs0TKGv+
	UCZE1Noz+X/wU3npxB2syBUr7MX0EdyKUNBFwRZRz6xIgDxkXGL9kx8wmMiO5nrIx05XnmyDbfq
	nQWtZVW0apiFEUMEa615hbvxSHxp2idaAXpjkKntXDRsdBiqGaODfIRcKWqpb2GqYaSEI3cL6if
	SKG3LS3Jo5vyN+afKc0PMMekyJ8OVmnd2OzRmCqWbfPtUfiXrLrTepdP2TKnFYyRhjUK094A==
X-Received: by 2002:a05:600c:a210:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-4954a341bcdmr7403935e9.18.1784271309770;
        Thu, 16 Jul 2026 23:55:09 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:09 -0700 (PDT)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri, 17 Jul 2026 08:54:01 +0200
Message-ID: <20260717065448.1498335-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235512_023150_C044A5A4 
X-CRM114-Status: GOOD (  18.77  )
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


