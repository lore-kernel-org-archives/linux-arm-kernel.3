Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD25C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 00:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=; b=UCQdqXNCfeV3aq3Y5VpIiAhYxN
	SfQzzDrX/uF9FvUZm6UHByeFfKsfZ8RGi2XTvdQ798So4OtRP8kuvpGbvFpItQ2ttr14I+sMhAebV
	Ud22vHbfiPk9/ptN4VpN8ESoKRs7sTiRqHdvYYr9+MEJxkLzG1T98AeGrIz4+DhCV8wmfUncsBRTS
	HdikTXu9P/BpgynGheKqEDaGVT0kl8udxuqj3TcfH3QYoZvhRnyQcyTn8VCAJbecP8hM/mS6Gr7iA
	1PGJpavFiAceTh51PJ0KwpYuBDmJpmdKnEvSVJ+/lgNS77EAx67xLOD5hyof42u5+ZTDIXdMqYhJf
	KuiafgCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJLli-00000007rNC-3b5k;
	Mon, 26 May 2025 00:32:42 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJLjX-00000007rEY-1XLz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 00:30:33 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-86135d11760so135649139f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 17:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748219426; x=1748824226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=XFgipC9btbLG/2er+sUhygbNiOYHyfyMRicaS3KOcbjgMoB/wuTaRAGPpxe4pWOFim
         FKdlmjBaFAgzWWP8UUudhmWIodyWv5/XtWcjc+FQjkyuVSSV70NODbExDeTjVYnA13sq
         ldCquJOpIIXDQZFJbYpkVhoQjVphECO9yzJaEc/Kqiw5E7taeAtR+F3juS0dzikPBCWs
         Nyrpv6aqtjo3L9zI9gOjO6EgIyIOKmY8vT/Mxn1712b2AXSGJG5sU+VnRG1jrit3bZ14
         CVN2zKNn4P0w/SKrmcN7ltPPOFz/x6GXmvTkydR7P0uSfzNAZS9l8P2zmaRnPWTOuWeN
         WsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748219426; x=1748824226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=ssCP6JJbZTwgM10znBe3jnokgqZRjnNJdKWDAJmbz2bGRk491Ci5WyOytJn3ERiLKc
         hg2Aa0M7xMRyMMgc5jaXRyTv78n3p6jHAnjhr4AMUeHYzfrHRTw1Ub3lPPvSnYHAGwJz
         lzeoNY1jOPRtjwpbLHD3gFKbjioFwTRF3AeGi152WB1bzA9Fa70eLX+u0lALRQ7UPcD6
         vVS+vbJyuIwjYokOg+i5vIWhPCZ/EdxTH6CvmdTwQvM40xDCs1btYo2PT1pIO5uv6CAS
         agcbxEya+nYb1SUZGqxblZcwTzjoseltYg/2k70q9MTvAmNwQ7fsDxXDflUM4i61HrYv
         ijxA==
X-Forwarded-Encrypted: i=1; AJvYcCWm26WdzxgsBeWYrSTA2o/H78VI7XgdixHkznXGpg2+7uv0Cl07Os+i7um/xPCrKdh42YWv98UzFgvaNVaCibpW@lists.infradead.org
X-Gm-Message-State: AOJu0YzxeQk0GQB8m98S/u1I6EpflcEq+xzCClMi92raxLHr2CYlL7Ml
	tqBeEKjJGOMFNJdYHW7sReS1Rr7MCOzEdHKBy2bd+h9mLW8STMNlDhTE
X-Gm-Gg: ASbGncs57hb88qEktsVh5cz1RSBHNw4guVRwBLZ0oC58kUqWs//YEmlQVa/Kd0T8vpX
	pI1ezwjjHw5l3o9yUXn2wZli/xNAdiCFTNmVLRR9YNK5rTgj6Ps5xYjDOoLYcXjMQhpOhULWYqo
	0oBuwelCp0/HKDpqkEgyBG57orUztrXXVeXZjRNFCxjMwI47INc1ncxaWEbFNqpvtQ2df445Rcy
	iTEo5qB3tsvyJr099px9pb9d5eJ6h0kdsfZQumUcoMqldDMGZaF1agbqBkvY/oNS98RGKsFxNAn
	HpRF40+WK70gs8mYpI6Y1LHzwRy/SeoZoRXNU3nEFzh+HYp4bC3RYSssmGuXcjTJWvpKkhP34Td
	4bhHq1eybwcvQ2/QQdvNoMznQY5oTiQ==
X-Google-Smtp-Source: AGHT+IEUiP1VLM7hATU3uX+Sltx9XV9gv6KswEzefF313KmIFDOZCAlrrtUCSCIruHAM39yxFL/YfA==
X-Received: by 2002:a05:6e02:1988:b0:3dc:8c77:4d28 with SMTP id e9e14a558f8ab-3dc9b6aa09bmr58114665ab.1.1748219425742;
        Sun, 25 May 2025 17:30:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc85ef07dcsm25532785ab.36.2025.05.25.17.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 17:30:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev,
	James Hilliard <james.hilliard1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] net: stmmac: allow drivers to explicitly select PHY device
Date: Sun, 25 May 2025 18:29:21 -0600
Message-Id: <20250526002924.2567843-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_173027_407749_8472C5D9 
X-CRM114-Status: GOOD (  15.00  )
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

Some devices like the Allwinner H616 need the ability to select a phy
in cases where multiple PHY's may be present in a device tree due to
needing the ability to support multiple SoC variants with runtime
PHY selection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 59d07d0d3369..949c4a8a1456 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1210,17 +1210,25 @@ static int stmmac_init_phy(struct net_device *dev)
 	 */
 	if (!phy_fwnode || IS_ERR(phy_fwnode)) {
 		int addr = priv->plat->phy_addr;
-		struct phy_device *phydev;
+		struct phy_device *phydev = NULL;
 
-		if (addr < 0) {
-			netdev_err(priv->dev, "no phy found\n");
-			return -ENODEV;
+		if (priv->plat->phy_node) {
+			phy_fwnode = of_fwnode_handle(priv->plat->phy_node);
+			phydev = fwnode_phy_find_device(phy_fwnode);
+			fwnode_handle_put(phy_fwnode);
 		}
 
-		phydev = mdiobus_get_phy(priv->mii, addr);
 		if (!phydev) {
-			netdev_err(priv->dev, "no phy at addr %d\n", addr);
-			return -ENODEV;
+			if (addr < 0) {
+				netdev_err(priv->dev, "no phy found\n");
+				return -ENODEV;
+			}
+
+			phydev = mdiobus_get_phy(priv->mii, addr);
+			if (!phydev) {
+				netdev_err(priv->dev, "no phy at addr %d\n", addr);
+				return -ENODEV;
+			}
 		}
 
 		ret = phylink_connect_phy(priv->phylink, phydev);
-- 
2.34.1


