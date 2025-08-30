Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFC9CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 19:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHENl3vhXJdefcBx8Eb74+JpAMuYZm+3iaoopdaiCnc=; b=IbmUAu6txgiD85I/MjXe/5DXvc
	CatEfyU1qB97KLTMtM3nOqBN/Gm0ySQJmtT6xuSYf26RMmOMJnYhSGk/YNtMD0z+IRRP5RlnIBUzD
	rerSvRZnGCPJ6CM8bnswzdZ8NHcOLtftb4nHfOrZmcc1RweQ7wZ8CkxpytQbWbB51FKvFMLF86a/I
	kVBqVJq/tbDWg3jVaHCRcb1vqUHGd9taGz37u16n1WgxYv7XRF4yKf9v7XAym8BZHPrEWXpAMj/St
	FHjpjUgtngtMnnyl3JyvndvILm1g34pmk5kflRi6GbO+uhPeQAUXnQwJPX2TFF/2+gXACDyU6lR7c
	7pBl7Dsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRYX-00000008Ngq-0Tey;
	Sat, 30 Aug 2025 19:48:09 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRJl-00000008MgM-0bEh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 19:32:54 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-afec5651966so579929766b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 12:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756582371; x=1757187171; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VHENl3vhXJdefcBx8Eb74+JpAMuYZm+3iaoopdaiCnc=;
        b=K0dxyoQ1OoGwxkxbPHk5CsKZLjN2wU+9todA1QhXnRUT6uU+R/rxgDKCyiaQSdKLZn
         ifuN5OhlaSqCYMZf+x+C8t1BLRU+ZSn1KC+chlQAHqDtcQR+leFTvOUw6qgQYu1/m2sz
         dcz7afN7VdIqOSg7IwbS6JXTPsbBYpw8KogaHi3AnwKq+PXtLjogxumAXN0ObsVssMaw
         VLKD8mJhQdI94UAGCWuqQ8Xut2xpITz850Z+j42Xq0b0YwiD47C3/Mrxp05sxyQ4jfTJ
         +ptxXz1Qb9NAKX9T0Hq9IhmZR3JaoUYC+iZB80Hv/CKr3jxsKad1T6uDV9ESSczFgEcT
         P8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756582371; x=1757187171;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHENl3vhXJdefcBx8Eb74+JpAMuYZm+3iaoopdaiCnc=;
        b=Q4TCpNnap5AH2gCNZ8uVES2up5HZKE+Hf3UJHVB/auizTqXRbDaZWRpkC3lYQxLnuC
         m9L57LruyeNbRvjKXBUQmztJfuHc1KMAgRcK2Y9XJYGoVc9hslt6RVG5leWBXrDwYxvv
         nxM6pkqTQ7X9Vg6Yja/p6NnT0bhvu08cAIzD+E5e4uFHOWoQAnbZwPlb2O0H1loMwaZk
         SgMeIcDjV7Tf0VGClko74gizrcnC0vnW1FIkfKkrHjCL7ksmKrqm8YTGvvij2k3XHggY
         VIYQ+9sWF3XrYqWwBdTn0Qz30RRJxxqj6Mj1ywYNPu3517O5YPJxqzMWGDdxSITohuBg
         z9zQ==
X-Gm-Message-State: AOJu0YxPuYhQ858CZdhfGQVAgxJHSC1ULVmxe+KvEoUUuu8p+1Z2Y+GS
	0aqfHJG+TlwHnkahck0+QXgwGOr5i8hGyWhivhNN0YM+IxvzcqHz4uYt
X-Gm-Gg: ASbGncv2qhnrdRUCDIAK+lDg2VGoz1jFzE89v4J1zpO+UJlj7aF2qQgvA0WphOfRGXG
	xnt7HGWZSfIH82qRmytXv338qIclpGEd8ZRpbaGPpVA+Go1hp494q9lBXz5tc4IOfPQkJ32qcu+
	cKsLEQpNRoZpUdP7/yrmokt/1sSPiMzvTKM2TXOmQ4GmJqDBQxtDg2rgxliDpt7Vicn87etwi3v
	h/Rp1qzD9E2Gj+RJ0o7nxZOXaLAE0TE9OT4qefCkH31Nf2ToJVSukRdMUMwXk9YxHWi7Htcx6I3
	GULbhclHDzEmQkXqziVlLIs0cK3fTZuqT1Pz464PEZF/1VECPBpPhbS3oOl1KjgtIKtKjCdR8pv
	N5kHKdzSPYKmT+Juq8UFlPe3GQXI74h70OIKyq3hsfXui1UO0AX9jFswBHBbqyeIMJbWTdG67jL
	sLuy8aeabibA4Cl8Nv5pibHd0/lt6r+Pi2Bz1orWCX4iUe5vpMWcfa4nX3gcB+SM1H2/Y=
X-Google-Smtp-Source: AGHT+IHA3zUgybJZTrlaQmm42vW573BT8RwTkL58yLGsMMmkwBFUBqcelRcIgsQR4ekQ2oc8fLvDlQ==
X-Received: by 2002:a17:906:c111:b0:aff:2ed7:5f11 with SMTP id a640c23a62f3a-b01d8a8b548mr237323466b.24.1756582371450;
        Sat, 30 Aug 2025 12:32:51 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:d113:449:b8c4:341? (p200300ea8f2f9b00d1130449b8c40341.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:d113:449:b8c4:341])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aff0ed6ff82sm356709566b.111.2025.08.30.12.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 12:32:51 -0700 (PDT)
Message-ID: <4f7a6509-1753-497a-a116-d6e135816c14@gmail.com>
Date: Sat, 30 Aug 2025 21:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 5/5] net: phy: phylink: remove support for
 deprecated fixed-link binding
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
References: <cd55d7fb-6600-49e5-a772-18b39811b0d2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <cd55d7fb-6600-49e5-a772-18b39811b0d2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_123253_181699_FB617FEB 
X-CRM114-Status: GOOD (  12.46  )
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



