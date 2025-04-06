Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75B9C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 22:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jotKc/Fqpl2Jd1jPfcmFs0z7oPm/HmjlcBjHuS3pTY=; b=jYNTnHIuYPLEAd0vzHVsOH754Q
	GDtHlfkxL/LwIhAPG0zxWG9R3YT5HAVzvL7YzST5JVv7HP3QJZwCzs78QRkg/IVdOYvdoE6r9xLX0
	zA8Z+5mWZbhVMYwiOjukpuyi49fKGXdeA35359X2rGpQmSYv60dHOCC5ClLlmR4Fbwe8ko3BB+Tkc
	8ZIQkAH4w8pK5f6+hgySQDRWnO2BApN4z2zPR5q6iAszuz2mfkMoCj5QF3YaXATY1YVeAuvTR5M1O
	XQOEjR6cMqIW+ZanEZSCvZeouqlNQWNiDDbUOwfARu8a/uL7KmLmr0GCeI36oUxMSiRUtM5lxSiTu
	HPRe9KDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YM0-0000000Fu4l-3QJH;
	Sun, 06 Apr 2025 22:20:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YGd-0000000FsuY-29Yd;
	Sun, 06 Apr 2025 22:15:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so24972675e9.1;
        Sun, 06 Apr 2025 15:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743977702; x=1744582502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jotKc/Fqpl2Jd1jPfcmFs0z7oPm/HmjlcBjHuS3pTY=;
        b=DVwX2YzZwbMxgw7aTEvaQ5reMcOdKB300IuE88owaJD/3aMTZ8DHiEG+f8rkQ2qlrf
         s6AK6f2Q3O1nnLTSQ924N3vIYfkqoWo9Z3tshQhMyo6+Zk1Rlrl0WTZPKf2aMdpQb9Pm
         TFGX+TFNTtvXHE4bYaNBg5Q4ICgAT3iKpgL1RBNSOUfe9mQftRQW9+I179ROkQoee645
         MrGQxoO5zfEDRjHNIbghSeCaLTLsYUBj3DpJLVN5e55Y29wWebJLfe6eL9j8HeDyAeBV
         fd1sQjzbRE9IGPd1GDp0/sYEVGBKf0dI6yVTBomDMk9VBNBiuTuc78Cj01TLUV4y5j5T
         ECJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743977702; x=1744582502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jotKc/Fqpl2Jd1jPfcmFs0z7oPm/HmjlcBjHuS3pTY=;
        b=puVugBocdAkiI4tLinhttFPkhKY9NIhH0jGFxKaPlvFke6ZMwwoNRk64RUl1UfM0wE
         fT/LpqFsCNDOY/e5P8X8Nl+VXz36LppkDP8X61qyT9ntkvP38DqvFVnQgJR3G4gtZ1Np
         ztT2Mqz7jVqExiMd8d+Pqy/KVHFpVa+9QqAS6+gEOobkOuC+1hSGKbA23+2wXnvwlxNE
         t6Ywfn6qibQRBgEWp4olim2RmKZOHj5mEiUnGGQw2VxKR7u7J0RxXS/K82xuvQtv3FBv
         ktveATKvlUZAZr0fLdM/A5ZfKCbSPI/qTM1t9IUupU1cLA/7zkWB1G0T9HV5GaCxTNsf
         Vp8A==
X-Forwarded-Encrypted: i=1; AJvYcCUKcZoIMqz5tL5wUBJLY1lONv0S8fYtjFpOp8ZtrFQq0ulU9/LF6YCPDpcumkDom8Aj0nlvqkxCXrRh+6tCb0Zn@lists.infradead.org, AJvYcCWJyU4KA2hVjO2fvdKyVTIFAmzuoSMFFc/5J0oIDWfNlAQbAaA4jiMHFTuVeUUZIy3v9eiPhr5RKi20KGxPUt4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoKNlq5PJxqansmwu+rtYVlrB5p+24kauBNaTInReZCPPBAyxQ
	LDIqblvJ532fsQTq2qtI6VjHtTwtAqz0QhtsW9TogHeRDXhCEp4S
X-Gm-Gg: ASbGncsDos12XhDMQA0hhESOqxHG9HFLOm7tHsRxPPEaN8rz6HCvQGK2S4RABQQq9m2
	K+CjIf6W1yyHAs8TIB3EA1XvF2G5x29/o7G+bcRJrAVAFMDGfdqBCjcw2sJrQ7x+qSSxaPor9z4
	uM3vccEZiWCw9BrdJOS816f/uyyMMTj8Tr0xS2kCUyuMKl0k+RpSUe+JMwxmv2jG6Bj66jq8rrG
	rcG9JQIyY5EP+0QjL503K9t+mNuKrFP5bbrM5BOjDwZthXCgL7ovo+FzhNh+OAT1cKsITqFoDdY
	RcoNpy5JN0BcvI9C9Q9WarCOLvrHeJRr0EujT5p4pmpOHBb99XSWXGix82Iy+LPsTpnAvpWZDRn
	rh8ac4jLJWcxu9w==
X-Google-Smtp-Source: AGHT+IF4Orsr0uagyxWiA2SygCLbqK10XpF3iEqB0Ey1M4fJ6BNRGD2Cn9NKoC8AeNVhrjTx7AWL5g==
X-Received: by 2002:a05:600c:5785:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43ee0783d96mr59382275e9.30.1743977701942;
        Sun, 06 Apr 2025 15:15:01 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm111517055e9.39.2025.04.06.15.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 15:15:01 -0700 (PDT)
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
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: [RFC PATCH net-next v2 02/11] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Mon,  7 Apr 2025 00:13:55 +0200
Message-ID: <20250406221423.9723-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250406221423.9723-1-ansuelsmth@gmail.com>
References: <20250406221423.9723-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_151503_568023_7C128977 
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
index 4a1edf19dfad..6a7d6e3768da 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -66,6 +66,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -616,7 +621,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1815,6 +1820,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   config->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -1973,7 +1981,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2685,12 +2693,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3577,14 +3585,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	phylink_dbg(pl, "optical SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
 		    (int)PHY_INTERFACE_MODE_MAX,
-		    pl->config->supported_interfaces,
+		    pl->supported_interfaces,
 		    (int)PHY_INTERFACE_MODE_MAX,
 		    pl->sfp_interfaces);
 
 	/* Find the union of the supported interfaces by the PCS/MAC and
 	 * the SFP module.
 	 */
-	phy_interface_and(interfaces, pl->config->supported_interfaces,
+	phy_interface_and(interfaces, pl->supported_interfaces,
 			  pl->sfp_interfaces);
 	if (phy_interface_empty(interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
@@ -3730,7 +3738,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.48.1


