Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44EDC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 10:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orWgUHmQriyeNcYTKTqzfO4CbKpuvQ3L/489i8p8bBQ=; b=PocGX0cSrr6iMTEvGRjt29seeT
	ftrJraA9Va8iG6r6k/iu9G9GrTJ4h216BvSWTxs4PCpKwgDhRmFN4x720o8YBUBSJq66UnqUv2WX7
	dixmQKsGkHctSTAYJwCrhpWK1gd9epvIGiWQQV+AKlUmS+1uGUZEXd1PG50XbBRzdy0yin9McsGgZ
	UESv0/2FbEupzdpO4EWsO/JguSdMJ4t8Wt3LSCxRkgTZWSg8Acn+/GAVHnwqGePaZgYsjfRChw8bj
	/1xfgMFrC4qrvz5rq7New/WYbr2/KRLGpmy+AkyYZyp1r6fb7pM6H3g4ScM8qAHROjpuJd03lKcV/
	vFhXMlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhRk-00000005oYD-0Mcq;
	Sat, 10 May 2025 10:28:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhNc-00000005ney-34AI;
	Sat, 10 May 2025 10:24:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a1d8c09674so1187421f8f.1;
        Sat, 10 May 2025 03:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746872667; x=1747477467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orWgUHmQriyeNcYTKTqzfO4CbKpuvQ3L/489i8p8bBQ=;
        b=f2kLAKbn2huhsbaKb08mQtRY9IOVZ0rtJHxaZ1gkyYoct8VaU2/Q0hWSKhUcSpc1RZ
         b7aVntUQNgJY1tvJ1mSB0xlBSC2brFA7f10yCjP2ftD62/LsqVkKljZmL70HgaeU5fef
         ry+kruy3LxvxyxGtm+V1K78FvNIrHifYeL856Y6/weDDWwH2boAqHaqGz1bI11AkDzvg
         EAtrgvQrYJZJI7O+HEgMLAo5KHmRj4s17mYRBY+1xNDv2KnSz6XZ9eSQVIW7PFuAqn7f
         gFwA8N9ZcN/xZvZxQJT22KPFwOPMQMkEPyNDxYNjriycsp7F8cLgZ/BTiQmIlqO4JUiX
         2t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746872667; x=1747477467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orWgUHmQriyeNcYTKTqzfO4CbKpuvQ3L/489i8p8bBQ=;
        b=VE45FW2DVc14+4M60O90DcNcQLnvlvp6GQKQ5HdxqHKwm4HafokE++u+dvtGTQWX6s
         sO43mdMPc0imADpzg3TPuWpQP7fJoBRjhwn4k8xlhPz5IAWo8/Mti/wP7VjBbDLx+wJ7
         yc3pDFUt6uH5hJBURAyoNEU5FZ7H7ISAPv15lmKF2TS8yin7gfCQrq9SoQpc1cqmeVVA
         sCzwTq2HEO9zdH6n2qwMnX1jYeKi5IgrdAzGAg+HpsAOU1m77Gud2ltxU5BIXyHnTFTd
         RvWZo1Qmf2d84MBwlCOuJcv6gkoGemCZcOaQzuYEFRntTWYu/Ke06kyvxkxlxC85dlEM
         cpSA==
X-Forwarded-Encrypted: i=1; AJvYcCVFze8eSij8KNR/xVE0ffPsEqgGoJ/LKC0awKdVQAHe6ud7CFksukd54N1uWFDonyUCQgiEv3Y3ufMGNgpnhBk=@lists.infradead.org, AJvYcCX6Bq5t9CkpDocKWDbr+tR+hG3dQzhR40l5yjFcjkuQn24siaXvEplpYp3z5s7N7f9siab83oaxaE6Tzbwc6ujO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk3zVqH0XkV3jwzKPWvEhAP6VaB/HoWk5HIiKRSRODBXjt+QJt
	S/cNe/a5xZGKT23ix40juX9GQaQmiSMVUkFiSOSTRkQjGlXeo78n
X-Gm-Gg: ASbGncsjQquq2FWUF/5OUiId6V+/PRkghK54ITEV03CbZEGu7bbSBRW1BUZZlxpr5PE
	SjGQJN9Vi1GOr+45Afo2XENkv6YyA+I0HtxoHZl+k6XA7wQMvhBc6ig1JDBq0QR1F2d5aoaxEVO
	vcyiBWIpIIUB9AdpqSm5cQUzBwj4niO9tCFm1eup0GkJHzu1Aws1uLhYhrGkeTKf2HO0kJl3aeA
	01WEPLsth9F/cUy1/AkiWAbwkYjpQ0c2PArD25tDbWxKEuERhHGKis4aeydCzGhWhKlyUoS5uye
	mat5pn30W8kz7CwU8lFMBaIYhV2f3roPC7k5NfZBhftWcUqcZaRD63iQsHsh6FrB5DvJbH69rKb
	aF7j6dREUjFsyUKLWPodv
X-Google-Smtp-Source: AGHT+IF8fF8mgD9KREMGAiFhe0OUNtFJZt1x4egNmFWBpaRbum1X6E6uSAwHuhPCucDqGUyba997Lw==
X-Received: by 2002:a5d:64ac:0:b0:3a1:1229:8fe0 with SMTP id ffacd0b85a97d-3a1f6482c15mr5576406f8f.38.1746872666782;
        Sat, 10 May 2025 03:24:26 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm57981265e9.13.2025.05.10.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:24:26 -0700 (PDT)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH v3 01/11] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Sat, 10 May 2025 12:23:21 +0200
Message-ID: <20250510102348.14134-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250510102348.14134-1-ansuelsmth@gmail.com>
References: <20250510102348.14134-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_032428_770271_099B27FF 
X-CRM114-Status: GOOD (  18.95  )
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
index 0faa3d97e06b..ec42fd278604 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -59,6 +59,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -610,7 +615,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1809,6 +1814,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   config->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -1967,7 +1975,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2684,12 +2692,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3576,14 +3584,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3729,7 +3737,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.48.1


