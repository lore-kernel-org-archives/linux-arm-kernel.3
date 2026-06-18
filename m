Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392DDCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=; b=CYOS6PfvaldYls+9t1kVAWHSrL
	VJW5qpK5sZ8CvCMocXBCDmslPlsyFrFXxTBA2KkpgckLVFFWyG6EknRXg1Td6RYs9tnD1cGDxk05R
	3BN7thrMmxfxHiKbaNaFecIAvDomm9cIbLLRWlWdQOrAJ19hRpuH7WHLnorTZlS9f/ojD9CJRIDUb
	VbAK0WXF9GjWm1tAGmHW2fLz2bbvwcfe4DzILXJY+QVUABSB5ts/idBu7KDn4AJpmdlzJRCjNl6lP
	HeoHpKjslAy83KK3+JKVok5P10T48WR4ypCMnwO9EqJ63Xo/UqXssQRao1iLRgq9BJXlw+GfFTBb0
	nQZUbAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCK1-00000001IFJ-2cmS;
	Thu, 18 Jun 2026 12:58:17 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCJx-00000001IBP-1jH4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:58:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45ef29c5561so563909f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787491; x=1782392291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=EhkmWCdcOZYnDAYT5F/WTtm0ej2McwMjR3Saj8EDBKQmvazUFEhSP6DdPJCQnmt6Nq
         U1WlMwKqFGDtj9m+vxqw8ybeDm2AeYkQnLS7+tY7jE1lPMoxxs+JtbZrS4GiRiwTZcfj
         D11tcIM4l4TGmEU2ZO9JJtr0ZP7SOGsJaOxXUTRqYS1hFpLZSiV2feEROkfFmY1U5rqh
         McUBHisHCwlnekcGdKXlo+nAV/EErbjy7u4z1wQE3TJTFiTv6uRxIEAyC16o8QiEbtxY
         zjnl8mpBa9Q4pAuOL/v+peOPT0t3gnZDqGobMAbKPaOlXZf1swDnODOnIZrBHrEslzs+
         fWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787491; x=1782392291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=P1tf0S5IFcRrRSEMYzQVkm++JMv5ZWu3LULZivXJz3w05eHtYX3d/zu6eB7AnoShYj
         VSStt7+r9bf4ukgEuy6Hlv+BRqhLRi/ZRXy8Z6KB3DJ8wSH03lgRF1EijONf3DUPIpnt
         HfF7oUpO7VXMcKHeukUsKTdkzxDljEbVeHG7Nc8rfVHEHB5bmRCGMLBUhtLnVcqRa8Nl
         kEIlePJPMjyAc66H5roeL5dgoAeEJ/wa1iN8wucomzh9Pz1WtV3ZnC6HhvBlKG5y6jbc
         cPnTxFjnvSPEonWeLSi6v0+9SqzWf4n6qmJyU3qBjMLxb3dPqDUvM8W0nT6ZqcCArtrG
         VflA==
X-Forwarded-Encrypted: i=1; AFNElJ990MprxkKw/yrzSG4/1zxV+HJXjFWYOT8UmX8hDLJoe7Bf6M5CJKRZlRvVRaQ/pD7AnSNxkMZK9GAQ/0ZMGEq9@lists.infradead.org
X-Gm-Message-State: AOJu0YxHT+IGLJ1uNOOeTLbGlu7I+jRnx57BmfGTJFCrKKnjJ+p+FYNr
	wyhnMN73sSeSFebX1UGLUdhCxogvJen/iQogoq4C4PBYhKVlLqHwSTob
X-Gm-Gg: AfdE7ckLKe4N2vIVsfpmIEv9ltMd49sIw81pIwojUiiz1ZWLn1X0flu55w2byx9kgYc
	wIJZ7SRVy5VPdmOhO/eCbODqAF9NT/Wi2RBKM5YFK+wMFBFMOfSky466FRFk4eKS5Sh2VUoVoTe
	DKzEfCOyVfyPx+dvgGcxdB9qm+fMlX+nbzKtG5CuPeyht2Kq0c2H4zMz7bFt3g/g5j1PeCkW3Af
	MO3JkWolNfu2jj3r+58+X1vLwjMO5X8aZh6VMgYI53/ekWEi5b36tghlDZ0cnCgh3RsqfJbmlot
	vUaKpE3Tdh5G37hu7JpQw7ZGglMs0BTDtJ/1yGeuBp9qsmxKJOOmzK0+xg1APs3ePN+uI95+Mqr
	oB6uhDYzmbRW+qgdp0K+Q54cBZh4g9VY+RS/FRPWRGxDMtOdlpPPAXcaMUog0ngC8s6uE0FVGOK
	dYN1qTfrk4mHGvmneb0Qp6SgDl1aaZCyXku9yuNl/4wKaWcTGTHWqUKyWLVEfLbw==
X-Received: by 2002:a05:600c:5297:b0:492:3c7e:57aa with SMTP id 5b1f17b1804b1-4923c7e57c1mr12852015e9.0.1781787491038;
        Thu, 18 Jun 2026 05:58:11 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:09 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Thu, 18 Jun 2026 14:57:09 +0200
Message-ID: <20260618125752.1223-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_055813_470900_AAE42CA4 
X-CRM114-Status: GOOD (  19.10  )
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


