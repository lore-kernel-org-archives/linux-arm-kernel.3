Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FF6C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 18:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=; b=UE0u2x5ddHkeP3V1UvUTyFsaQl
	tSN4QIGij/w7Eiy1sypBqWSIOS4+pCUIqOpRURMu3bIsh1zV3n7d3YFxW3v2tmWpQ7olXVEJ8ZCFp
	NOZSuki/K3u4EUP+zaeCJ7odFTRZccGMSIs0swrA6Y1e8VwqgkPSqv3khdoGY1Z9SiTZ7ZqbfTbUT
	6lncJ7j3fwHuiVzl3A4Y6RV7QXZhsi/JJD+DbwQf/XrubJTy8lzWFAbC1McqAg7oJlsLlIn0Ybm/v
	8v5yyptKtJPKhQ4tcKAnW2dSzi5cDA84cGJ3i+tFPFdyPbLf0Z/Vmsi5fWfe2MxqtRhjxhSIt2j2Q
	D6XOUH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJygq-0000000BK9c-2rrD;
	Tue, 27 May 2025 18:06:16 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyXP-0000000BIRx-2UUs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 17:56:32 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-476a720e806so31138281cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748368590; x=1748973390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=ayhOeSe8B/JgOEegY+T2cQD8aZvGqPQhQZBUR1W38Z4t2T2xBHBUujv7GxG4QjxstT
         gsl0owGEG96mopeCPLdBlvcm4h880IpSQdwwP8bEfhgapS8IAw2sfTbyp1tDLYCjikfA
         AlMGieyot53aaK5W63yhuQFRaB1CuvUUXTmQmmIoHoC8RiTMLiI/bu6qhR6CvwL0wbQD
         9+EBfBkjGEL17rmI5VSJHdlBlEHvZYcspbdr+C5glJq9QINweZ4leeH/9U2R5+DD0EEW
         kQTwekqRqy9lbX5cbUZudqf0HXi7JwcU2EsKkMccTMrOr62l28WfXh59OGc02mfXxZFN
         iF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368590; x=1748973390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=bGHZmqn8y6fhizWtNc/ZShAD6w54c606KlCBIcwpAt08+6eYo0RwxSkYKcDsM5ByH4
         Ji02it+Y+douAegXhDUXrfBvihhYKbdPdNIIfqLjxLZCq943Uh2hEeN+VAXv8qlDt91Q
         pVuHnLsbEmUzgIqQqNYCEhsH5+gyFxO4mK6iqz2baviEG+OuOlMxK6xJQwVh3FoB8o3G
         FucHzENmSVEmZkZ9xRIbxrYjFCPAxqv7CHV2cezxd5Ru6BrrEbNOK3x+aUeXifE1pyVb
         0KZLqyeoCfMMgKdqVG43pYxjfDYTdVFgan0xeEuNcV+6PZ1Z9MsrGmK35zvedC+hVEvc
         Wgvw==
X-Forwarded-Encrypted: i=1; AJvYcCXzsUJs2kCz9ri2dKDVQvxeWSYjk6Jkyz6OvHldbl/MBvA8LmDrZdAX7vQCLhXiPkLVBIGmzvTxstZpbovfnKS0@lists.infradead.org
X-Gm-Message-State: AOJu0YzchL/iSTTXjTZOC88jUsnu0DYZ68ssfIwBYX4rAiXI01tXeF9H
	/6FYKS3t3K6angM9Mu9MDg0RfsefRrc6MNAmFrnrfWor9L4kziL0nh2FbvJeQHTNGJI=
X-Gm-Gg: ASbGncuOEhymuj7/OqllkeRyumEOwHLFIdSrgFuvTwKdswHZleID1zS1xVbXkfzyk6+
	Zjr9Stjawh1WPwyMTRy72LmNd9e/C/LmgfMees9OICSUXVKe1jZMb9X8iIW0VafB0DyuEAeYirA
	LSCLN+q0HghsOQiinZSmLElFz4uLiIAZ66eJSj8Sco6ZdIu03w68BsZihR4XAkXZCE7GXqpu+5M
	wcL6QGknLMrEA1xtaS4SE1Jh5E5bHunxzXhb2oeNUaGe7h6OyzFyN7sVIUwjc1JAjszQDetJl2l
	waehX90celWdnz5eKyeVe8mtMB7a4ZCS3rFHptRgUPQvzGbPLE5VEq/JGUEPTIoqnB2ke6Z6ARd
	NYs5WeFOGqOWbPLpACIB/c/RRu1tJJQ==
X-Google-Smtp-Source: AGHT+IFLIO0D64jUevJ/lz7zQvSZw2ntrY7H7wTTGXZU+ByFDYJ39AXVKInapU4LgwZEqDykU4orhg==
X-Received: by 2002:a05:6e02:154e:b0:3dc:87c7:a5b5 with SMTP id e9e14a558f8ab-3dc9b67fdd9mr138337085ab.3.1748368579606;
        Tue, 27 May 2025 10:56:19 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc82e014f4sm38082275ab.40.2025.05.27.10.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 10:56:19 -0700 (PDT)
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
Subject: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select PHY device
Date: Tue, 27 May 2025 11:55:54 -0600
Message-Id: <20250527175558.2738342-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_105631_629620_9375E4BD 
X-CRM114-Status: GOOD (  14.95  )
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


