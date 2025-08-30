Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FEACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 19:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zW9iMTsNFJqzaVU+9Umz/LvOS9lH5xEq/8s2G/XEJxE=; b=0kS/Txkr8En32zIx6kA93qFNXe
	BKMqsQnLBe+9x7vgxvrVb4Y7d9/RpRlwOsvjYVzeC/BNOpdhnvBcqf7JQEhPW40ygxhgYyp1AMdDq
	GBzey2h4ifqx9yxcbJqia/hbMNApRmBJVYF2pf75NVTTSrYipkjPTjfJWrNQjKBlKk0TGhuut+6yv
	sR+HSFJelE+HIsglqW+ZTqz9Pe8vGJ0hclaYcIcPmZCm/mxzyGyEnzhwhGpPN5g5cjM86go0CcpK+
	HN+Zo6yjLp71r0aWFU0pt43blZ7istjH4lA8fFU7Yw+9bHNaM2GrKnLIb0IZHShcwrPjo4zNQqKY7
	Q7a5wt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRVo-00000008NUj-3tVC;
	Sat, 30 Aug 2025 19:45:20 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRJ4-00000008MZm-1FIy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 19:32:11 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-61d143aa4acso1773440a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 12:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756582329; x=1757187129; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zW9iMTsNFJqzaVU+9Umz/LvOS9lH5xEq/8s2G/XEJxE=;
        b=mNZkpihW0B/kyl8b2SJ0gXcI/3OLvBPc/857/sr1D1iNHVByzd1DD0OPP1Dc0RcDEK
         cSFTM05XxlqrBx9fpZcdgSG5rJv0cZZaM8wYF3kPaxI93NH+tx+ZWOQpQD1K+eCOo3vl
         ol5nrjD5eSGRM3ha4if3vWGpbcMVvrnEJQQubMAwK8nATLCRHjsNU6qi5nGtHHeET2UB
         zOEwYnw27FWOwSf2QNzeGOB4+wx7zLkxdARCOFknO927amA2NRv9icAieOeGGwKyo6A+
         6i/2URbVJuDwQpUdK4qxquTnRFzCcNb6UlVy5Y7ebWBWBl9wweeevPvHFPhJTJmhl4Uc
         dsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756582329; x=1757187129;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW9iMTsNFJqzaVU+9Umz/LvOS9lH5xEq/8s2G/XEJxE=;
        b=pI8LYsoNySGQYyAvs9/KIfTYqv5oMhFbG0WZ0nLEBAiqobMBH9N62hAJ+sLZdXoExh
         dgMwv+qHSvMOXXmDD2hsCPU0hYjmF7i66DN48M/I9LwqSVLhYGKwq5cn6axFP+cDpm3W
         qHqu0dB4tA76IR7ONd+lOlHhY4vxUh4FtLX7ABaP5z4nYRX8+EvNOuG+SVG59zoA9KKB
         SAVrQpuYj4msZ+v0kxxnttbLl53otBQAEv//uJX/b0s0WtocOOHYFLKMHkStfl4ENuiT
         qCH+QD6t8VXVXw/wkg4qVcxPEE1UeIGpSzMPsefazJF6Zsba5QU7OM7QclfxGR1QuYUQ
         Ki/g==
X-Gm-Message-State: AOJu0Yz/nWR1MrJ+KgLFWqY3mlQFHAyxB4hvCZ0KDb5EBnklcA5UMYk0
	NfC71DeAD/ZHRWn111JKdG2p95t0BMUS4ufZfAZDQcI/h+V3BP8YzUbw
X-Gm-Gg: ASbGnctntckSrDEhjAMjBsFyM2WZ+WocYs6D7CmfzZ+ihevcq2OFdfKe59lrw9nCRNQ
	4K2tuNiLeuaUn7PHfls2zoxOX80mSaziXza2btI9gwQaIy9C2FTMqzeiId9rtSHTk0AQ2SEWwNC
	Y7RFPOqs2PrdgwcxDZ/GtJBJ8yLE4GV6dype3Ftk65edhFLr/r79uRs64Z2lDo+dF+pCtY8jvk7
	tdA1fOLes6hpb2X6p+dfQj7mjEu8N747bwOp5hXVq1IN35uZEMyaZGRgYHWHzQktqNq3WqwA93Z
	cgVZRvDVAXJApr72f1Cqs1arixBvM+kQuPRxa1NIPwxSNp/5ZvilHiVJ1vzC2i8F1TLecIr80O9
	4jxl1Wbo59J7atcEcaoV/2KEemVqs0ck7zEkIT5WyxROGE6vZ7d1xVGDBxM3EPjsTCCb0OyYRNe
	MyXqimSyWm37jNvadme3bKQk35fstKeVBh9XzBeq1vySKF98bv0R3pcqoWCHa6ZTuTGzuwxseiV
	L+hWQ==
X-Google-Smtp-Source: AGHT+IFrk1LXoK3vtbVKyySU0eF8+oT1juSPvm5Mwgv8TIAz4C4y5vspb/wDpo57jnVmRrAhuQhiKw==
X-Received: by 2002:a05:6402:3810:b0:61c:fb8e:ab81 with SMTP id 4fb4d7f45d1cf-61d26fe5d4fmr2460830a12.25.1756582328554;
        Sat, 30 Aug 2025 12:32:08 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:d113:449:b8c4:341? (p200300ea8f2f9b00d1130449b8c40341.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:d113:449:b8c4:341])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc22b594sm4172371a12.21.2025.08.30.12.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 12:32:07 -0700 (PDT)
Message-ID: <227dd76f-4170-47d2-87ab-932f9f38ad1b@gmail.com>
Date: Sat, 30 Aug 2025 21:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 4/5] net: mdio: remove support for old fixed-link
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
References: <cd55d7fb-6600-49e5-a772-18b39811b0d2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <cd55d7fb-6600-49e5-a772-18b39811b0d2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_123210_334748_123EF67C 
X-CRM114-Status: GOOD (  13.97  )
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



