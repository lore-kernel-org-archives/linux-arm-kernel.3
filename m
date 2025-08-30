Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00FCCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zW9iMTsNFJqzaVU+9Umz/LvOS9lH5xEq/8s2G/XEJxE=; b=Ed7WNHHiazA6gr0OpaVf+n4T8f
	YiW462A0skVej2w7iSb5bPobKnQUyWU/d/TeC65Ipz68qGoJ+NEtN0aSQ0vGvLotMrTOpgB0E79pP
	BCnSH691OFXcsisXkFJdLMScvvnRi9WAuQbA2/Km2GxbAuzJzCVxgaHl/V2ktf3gKkBj7Ttlhrj0B
	k+K7UNRBX0zsubyw+xPMomB9euOGUy+v2IQvO+i+cOkwsuYzj9BF/nl6Nue1Qtr5C6v+KiUadmwBD
	wJmqycy37q1rnhM8YLnXrC+oppWdVa3HJ5b63DwfpJ8Pfuwt5Tc+d+kIT4VYOvWZskVVqTOdGFT/d
	Bc3CHIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJCR-00000007lUZ-0TFX;
	Sat, 30 Aug 2025 10:52:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIqA-00000007kAV-30Ru
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:29:47 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-61cbfa1d820so5588349a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756549785; x=1757154585; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zW9iMTsNFJqzaVU+9Umz/LvOS9lH5xEq/8s2G/XEJxE=;
        b=euJBKjbZu1n4rs1EVeYrBHW6n1xEI2qrrq2V9Ffp9HfT2q6MRKc6henIuOTrGgxx+Y
         syZLY12IwPhn6o0Nf29AzhM01ReqHCzZUK9bfrqOiBtlWTjIv0IEX6gsas+hefOydUKX
         8Y6rAsG+mEFuofdU4Shzx0A9G4MU4/bflMjSaXKBRYdgBhkQxfhFNUkGQ3apGGz2MUyb
         qshbbC8bcEmf40eT+JD4K+u2zw8BHrElEo770Y7JGOVA7831etnA+94cdhA4WGb8KfGR
         0zpvN115wwZtKBsv1bQCudldLqelDhBe9lWEFYe2//r3lgMiThcBusYkAdyg8QAh6uO3
         dw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549785; x=1757154585;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW9iMTsNFJqzaVU+9Umz/LvOS9lH5xEq/8s2G/XEJxE=;
        b=u+TPIzAeq8jtABWrBRRCbitVQab0kf5/MnklXmbKDCFPZnkfmA1zR6HWUNHIXqkGoB
         fTdc06kzqMW0L/DoXRhL+98gbfOVODSj7xKwgbYNx1Qa2lBsCxxHTxyJESufwZlhDihO
         6byWPRrCTLuTTxT/eiqytTQ5uEKkr9ANs1g3RYki0QpEISkJTPLEumIEjehvfbyOPwsY
         mNh4rl3yzCzNS6jjEueCnDYpPiucngc+slp9q2vIuMUPHAkSKVybEeFFgmJPPSDzsvp/
         MfWYorA9OE8jYyxYRrWytsXmZtGTRbKTY7WKwL8gFmQubNworK+hOj4ZOv1ROIB0xZTI
         wV/A==
X-Gm-Message-State: AOJu0YyHW/v8Zhig6sqdF7hnrS41dydPnf/iLOuXkDtPmdDFiK+WZha4
	R+ApPhYqi9O6YQgWm0FmEQE2t0MHFPKZ4MQxQ90uJcCxu6ku2WHF+6se
X-Gm-Gg: ASbGncuDqfOI+3RV2DQYXYjJ99K8adhomTtsiDAY0N+6+CSmRshyuXFvp1WxAwzl5Y/
	JQsDjGstwqAeW60kyGDANT3lCrhtemHU4egH2KlMGg/Gqo92Yn2cgTxEhGxd1zIFq+/pEhI/WU1
	sCNpHrFH+A3xk05HymMTv57Rq0J4i7U/v4oXbYpYqZZiyI8cEvCqBByxmSOF5CSfxJTH33DyjB0
	E3XVoLNQhQNewWo3Bqmp1sani91yc1DrZOxe0o4+BWhqM+vYC0ir0Jv0wVUeODS4T4jeGaHh7Vc
	ioy3Zg1uZlxc3RsE1OYzZnj2ZlUZcYjyZC8BIGf8FvmRzQ5ANYZXM/3FWhkgpLzb5pZsO8xmz8w
	1rNzU/LWWLme3cFbKXX3fmIuRhM8t7A4HgHTKypBoqIo6FeDmDgvYSPOdIhtAfCwPxgAcwNLt1Q
	e3JPJ75SPfux9H3RWYILh8exB3/7QfGqYLYwaeERBxQbSBE7VmVDi6Ooes
X-Google-Smtp-Source: AGHT+IGdeSzlz//5vitphrudTeLP3+ohGqqg8AR+C2VuNQVE861iGJnmaLhDcyecyp7lhX1sBovH7A==
X-Received: by 2002:a05:6402:2714:b0:61b:cadd:d95 with SMTP id 4fb4d7f45d1cf-61d269974c9mr1189801a12.8.1756549785008;
        Sat, 30 Aug 2025 03:29:45 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:80c:a2fc:7bcf:3a2? (p200300ea8f2f9b00080ca2fc7bcf03a2.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:80c:a2fc:7bcf:3a2])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc21542asm3234360a12.18.2025.08.30.03.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 03:29:44 -0700 (PDT)
Message-ID: <1d6eeae6-96c9-4c25-a250-01fb7580c9be@gmail.com>
Date: Sat, 30 Aug 2025 12:29:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 4/5] net: mdio: remove support for old fixed-link
 binding
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
X-CRM114-CacheID: sfid-20250830_032946_799615_D8F65C37 
X-CRM114-Status: GOOD (  13.75  )
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
 drivers/net/mdio/of_mdio.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index d8ca63ed8..5df01717a 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -379,21 +379,12 @@ struct phy_device *of_phy_get_and_connect(struct net_device *dev,
 }
 EXPORT_SYMBOL(of_phy_get_and_connect);
 
-/*
- * of_phy_is_fixed_link() and of_phy_register_fixed_link() must
- * support two DT bindings:
- * - the old DT binding, where 'fixed-link' was a property with 5
- *   cells encoding various information about the fixed PHY
- * - the new DT binding, where 'fixed-link' is a sub-node of the
- *   Ethernet device.
- */
 bool of_phy_is_fixed_link(struct device_node *np)
 {
 	struct device_node *dn;
 	int err;
 	const char *managed;
 
-	/* New binding */
 	dn = of_get_child_by_name(np, "fixed-link");
 	if (dn) {
 		of_node_put(dn);
@@ -404,10 +395,6 @@ bool of_phy_is_fixed_link(struct device_node *np)
 	if (err == 0 && strcmp(managed, "auto") != 0)
 		return true;
 
-	/* Old binding */
-	if (of_property_count_u32_elems(np, "fixed-link") == 5)
-		return true;
-
 	return false;
 }
 EXPORT_SYMBOL(of_phy_is_fixed_link);
@@ -416,7 +403,6 @@ int of_phy_register_fixed_link(struct device_node *np)
 {
 	struct fixed_phy_status status = {};
 	struct device_node *fixed_link_node;
-	u32 fixed_link_prop[5];
 	const char *managed;
 
 	if (of_property_read_string(np, "managed", &managed) == 0 &&
@@ -425,7 +411,6 @@ int of_phy_register_fixed_link(struct device_node *np)
 		goto register_phy;
 	}
 
-	/* New binding */
 	fixed_link_node = of_get_child_by_name(np, "fixed-link");
 	if (fixed_link_node) {
 		status.link = 1;
@@ -444,17 +429,6 @@ int of_phy_register_fixed_link(struct device_node *np)
 		goto register_phy;
 	}
 
-	/* Old binding */
-	if (of_property_read_u32_array(np, "fixed-link", fixed_link_prop,
-				       ARRAY_SIZE(fixed_link_prop)) == 0) {
-		status.link = 1;
-		status.duplex = fixed_link_prop[1];
-		status.speed  = fixed_link_prop[2];
-		status.pause  = fixed_link_prop[3];
-		status.asym_pause = fixed_link_prop[4];
-		goto register_phy;
-	}
-
 	return -ENODEV;
 
 register_phy:
-- 
2.51.0



