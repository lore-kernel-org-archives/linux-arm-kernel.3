Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D25AC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 18:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=; b=2tjTjKXtZlTPRVqjaKFNlw/2mc
	P3bTDKRacMqLcloL6o58g0ibQdCsKCN/j3Fukx2mO9MXgW4d92Sbc3h0UeeCrmOVZWbWDgeJyDb2r
	ck2vK26FoH+TH0+KWI+O0oXEJV+j0APIc+Q1Uf1SGdDFLngvnDor3m+ficuhQWHVG+aO62mZxkBrE
	5OW3NZByoRzvUq+UXQWJ9QKYo+Sx2zYONSvxFWpapcAQFvNUT20DgUMS9NIKtG8c4JSYErw2dTl+8
	0FXqIyiqm97nO9k9yzBkFu2DVLLa7BGXe/G1Ju+5HKzK9PMrPf2yCuSN+Nqeu8PKEmfY3BXscF+nt
	NYEy/MxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJccb-00000009N1x-2qEQ;
	Mon, 26 May 2025 18:32:25 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJcaS-00000009Mkl-2N5g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 18:30:13 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-861d7a09c88so43712739f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748284211; x=1748889011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=HdA3i1sSR53jvgcWPZzeQixTUWoA0WaEtoFMDZZY7PGlqskoNK9HcVKBnuoUSERGb+
         beqo4qSN9LTBnKfZhzOmSeRUzIx8HeeFnoO+2YAkGYn6I1NOKbLeUgfrtPBLXYWx1nVw
         jJ59aHvpIKvv8Ni8FHXntCseKjE7LG575wJcMAzoi73TgnaGVCu0Tf2P0zsAEkpdqzt9
         tXcCwLkCB+HrrFPOuwQ6IP2i5WWYBXmlKH8Fa8psJeKbUIlBlyrH3NYZfHajY1N7PjTy
         RgU/kGXmD7B1GSMNBGE87Gxx7LVjBegwfgUmh6JlHcDX91+E39PYUmhMkp5ZOuy23FxI
         UxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748284211; x=1748889011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=oW5KjZq47oVEQmtqbx996+eXFv6+/yda1wPHgQfqQhsBiCKTxADBWXep1ysr8CeOHU
         cSiU6+tXYZpp4JZCvd+7xHMMgeliaVveFLI67bEPTum3AxdaJTfELwYeRhwVdL1DahqV
         bAYEhV9+0KMigTdswUh46F0Wq7phEZxfVns/q9neu/lgK5UXHBdj5FD6ZEwEt9UIiivq
         YekiSWSEm7seSLaiWEJ6Lj7lIimJIjmmFrSs4VQKpD2lCMsUQKyVlRVcr7MSY2tDz/oE
         1JJaYy50G6ivehvNjVXcC6U6Xe6I8uvjUVDSwrPM6+jsDZFbY3IciLrLi/3qb35Q5G7I
         L2Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUXUFIuXp0jkg6wOyzyZ0sKHEKsHMYUOak3wHKmeiQQvra+2L4P4tTDwE2nnsNcxbqSp2wSWNDN04DtxeTAdg8D@lists.infradead.org
X-Gm-Message-State: AOJu0YzO718UlzLuuJ2pgGUp6NQuUMEjKK2XyfxrZUcuMkNc1eucb8P2
	sJ+uIGtPcS4RzC/Nf32Ejje75iKw37LcJDLU9+fYe9c9urVcECA4yEvO
X-Gm-Gg: ASbGncuMCrs8gXNs3v19mvlg2S/sXoas2whm8yF5t0TpeRcDSFGGAvCy8+i6SmMjLU4
	kKfTBEpjd7MtJBUUF4aIZvpLV89GmLrHjpwUPn6P23Xfp4mWxz+xOy+/7GvY5aQEeTgxhYq5nJR
	JlDmHX2CMrUbTIQi7VWsM2WyncBZEFSqtDL/wyOPuxkAGWmD6w/FCaofWuYtvjUWeZVvk1J4d4z
	Jj+78hCsB4hsAQy7Vy92TBhTRl6c+sEud5C4gZeQTp113/EwIE+3TJrzvx/3b5jTo55et3zmXae
	ryxcqkjXl79HKk/5k9Q6Dq3JXDFnyc/Z/2P830DygDM6G2EdznKodag8sf4qxHsi0a9DVUyMHIn
	wGbLZi6Tiu1togZqCd2kh8lAWRUBp9w==
X-Google-Smtp-Source: AGHT+IF1vt1ugwCJCcgD8FLb9pLv6neLoJcOaXY12NIdGkKI+c6RUDeQIjiCz+L7fEf4ThkwNMlUxA==
X-Received: by 2002:a05:6602:474b:b0:864:48ec:c312 with SMTP id ca18e2360f4ac-86cbb7b86c3mr1087224339f.3.1748284211399;
        Mon, 26 May 2025 11:30:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a235bff69sm477028639f.8.2025.05.26.11.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 11:30:10 -0700 (PDT)
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
Subject: [PATCH v1 1/3] net: stmmac: allow drivers to explicitly select PHY device
Date: Mon, 26 May 2025 12:29:34 -0600
Message-Id: <20250526182939.2593553-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_113012_600799_4D70F665 
X-CRM114-Status: GOOD (  14.75  )
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


