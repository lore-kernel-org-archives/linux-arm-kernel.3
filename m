Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827ACCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHENl3vhXJdefcBx8Eb74+JpAMuYZm+3iaoopdaiCnc=; b=UMsJ1RnKv1U8Fst6B4slqe4Z5U
	6DgsVbCXKW/we0R9l9YO7JqEwiCvcX44vcH2YbdFGw0bVJfE+OQonDe4dcjTSQeHQ6BsbDQ1wyWAE
	nKGIs6tpk6R0syoF0GUCxRa0ItMM+v5USYDdNm1pDf50FobpaYDB5ac1582moUdJ1wfBIr7GATh6j
	XdCobP7xFl5Tvx7g/1DjlaUCArLfmbPkeezMiSUNAdOvv9VMgiIZv0pqcfKud5Jj+0oJaGytxL+Cc
	o7niOm8PO79jrR52czGkz0rT87ukAZzlifyUZuICl2KqjUmH1aTI75Wr2F8uNnigUDGhTTSEY5uwE
	uDFqDjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJF9-00000007lem-3xOs;
	Sat, 30 Aug 2025 10:55:35 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIrb-00000007kHz-16pi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:31:16 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so34358266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756549874; x=1757154674; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VHENl3vhXJdefcBx8Eb74+JpAMuYZm+3iaoopdaiCnc=;
        b=gVBDIV7xyxra5A0fX39hvucf5oypfWO9u6V88/4ARvemA+4pcDzd95Lmcfw1ITGx/U
         KoPFQmIEwVWK4DhddPuEjUCFWLhX67T6vJM0G669F//4e8Ke4sF/Gu6mlWZ6OiYhuMTe
         AJqU/sOnQ+wskDUA3guf5FvAYNfOvWf0G7+kOCim/rgcPRqKnKNfI9/MZAJXkJijniwO
         ikN4s5FHD5smzRSYc5dJX/NxO7rqao30rINus9cyw3QkS8MhAiN+/gqw4jqMuw3hNSzo
         CW1+pPu74Yvz92JfyvUn0e1obXm8kyoqmRQOq0og21pDrW39DmvFdw+aABEt8qBlFLiM
         B88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549874; x=1757154674;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHENl3vhXJdefcBx8Eb74+JpAMuYZm+3iaoopdaiCnc=;
        b=QlEB/xwIwJhm1DRaGG0EEM8xNxC9aWfAg4bRnYwd9RYyZdG2AWucQFMEGjAhzYExET
         fWMpQ+qR9+CISfTHudw6BcNAq6g1ZYEXZQXaDTuFHmk5+NWPiKfhpDZSEW1cQ5VFe1xD
         thlmoaeKTfjjl2FoOxfptx+BijMNCcDH5Quc6e6meQeuW75CrRHJULdz65vZvB1YZZ6E
         qL9Weu6+rx0lPJFIWAWx/lBhW8w9vHERS1uZ8t3Fw1j4cIgwPIq4PmCGbqn18duvATLE
         jP9jbFMLt89mrxYkzuIZYFaeMqq6HFIc7pswCO6mEfnRHhlCJtis7Bm6MutxSuCwVVaA
         zOKA==
X-Gm-Message-State: AOJu0YxbLHC/g1Z78NWE923vLHUeceJIaVwUMe2/MBHleMn7WP7VIKJx
	HiHebpEqdt+eyUnw0xh6+ztZTDuGrdxF5bD3ExW+hmSwZwiDz2fDAC9e
X-Gm-Gg: ASbGnctg4dtZ7PLwvIKFAJAxtC/XZSMjBOLBIXB+wtUF9QZIM+3mAA9/HfJWC8KT5Xh
	Lseds6h+vkVKLikgti+BvW0dCgkrArc7c8mcJIy049/9ri6IxS44enMc+L44GsZZNc2K2T4T6JF
	oGxA0i8Q+T+TK2QBTO7lkCixpKnxPs/Z2Zm+RNJOaZaBt7Md5KWZUGIQJsUG3bbvdkTyf+Rvsbr
	pKuJZbAecFxeoi+EpQDDsOdF/bkQl759HU2TKpFzCS//I6lAVXTnOf+uT3nHCFVBfdeayBfTfet
	3Bv4x1CdNb9KRA1+48SjIuhbOfgHuyrW7yp/RAmm/KqiKkRNH8RUucmz+9Q+tBfsGIOHP+P74WE
	5sCBTIFhKPhsiu6GN3KqA+mxCA7qTnnP7wAxmtrJCBFGVWXsEV9IEyt+v/Nz6TEQAl+36vs3bT8
	X1IQ3Njob0uHSLxqPo4uZ9536d7dcb7rt3axMN5faA85OiaSAc47UYK3EB
X-Google-Smtp-Source: AGHT+IG8ZDCC2V3+EonpNeqqDHEWdVKRo5hKxw3mm3OIcIvvZGu3whG8VR1DHL+/mPpMHOJAVfIpog==
X-Received: by 2002:a17:907:7ba1:b0:afc:bcfc:b3b7 with SMTP id a640c23a62f3a-b01d973e909mr149125566b.38.1756549873319;
        Sat, 30 Aug 2025 03:31:13 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:80c:a2fc:7bcf:3a2? (p200300ea8f2f9b00080ca2fc7bcf03a2.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:80c:a2fc:7bcf:3a2])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b0307435422sm94050066b.78.2025.08.30.03.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 03:31:12 -0700 (PDT)
Message-ID: <c8820f9f-796d-4d1a-9ce0-be3788e814b1@gmail.com>
Date: Sat, 30 Aug 2025 12:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 5/5] net: phy: phylink: remove support for deprecated
 fixed-link binding
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_033115_318522_F1F8E8F1 
X-CRM114-Status: GOOD (  12.25  )
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

The old array-type fixed-link binding has been deprecated
for more than 10 yrs. So remove support for it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phylink.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index c7f867b36..e3e22e013 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -690,29 +690,6 @@ static int phylink_parse_fixedlink(struct phylink *pl,
 
 		if (ret)
 			return ret;
-	} else {
-		u32 prop[5];
-
-		ret = fwnode_property_read_u32_array(fwnode, "fixed-link",
-						     NULL, 0);
-		if (ret != ARRAY_SIZE(prop)) {
-			phylink_err(pl, "broken fixed-link?\n");
-			return -EINVAL;
-		}
-
-		ret = fwnode_property_read_u32_array(fwnode, "fixed-link",
-						     prop, ARRAY_SIZE(prop));
-		if (!ret) {
-			pl->link_config.duplex = prop[1] ?
-						DUPLEX_FULL : DUPLEX_HALF;
-			pl->link_config.speed = prop[2];
-			if (prop[3])
-				__set_bit(ETHTOOL_LINK_MODE_Pause_BIT,
-					  pl->link_config.lp_advertising);
-			if (prop[4])
-				__set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT,
-					  pl->link_config.lp_advertising);
-		}
 	}
 
 	if (pl->link_config.speed > SPEED_1000 &&
@@ -768,7 +745,7 @@ static int phylink_parse_mode(struct phylink *pl,
 		pl->cfg_link_an_mode = MLO_AN_INBAND;
 
 	dn = fwnode_get_named_child_node(fwnode, "fixed-link");
-	if (dn || fwnode_property_present(fwnode, "fixed-link"))
+	if (dn)
 		pl->cfg_link_an_mode = MLO_AN_FIXED;
 	fwnode_handle_put(dn);
 
-- 
2.51.0



