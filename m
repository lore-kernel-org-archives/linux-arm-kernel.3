Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF42DCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dqFywCr55VrKMslNk/QGMOXV5hNMK9F5bxBArsZULoI=; b=0qPSiSgsyLHNxpa2d5f5SwMnvp
	Z/kiSWWIZKueL/Tt0XDM64DrRxE1l4REamGigeDlLsbkCI3BN8kkBM7FtrEBLWOq1/WbKln632DTi
	5lZEvTGRd2AgydQcpwaMrVWeohBLc6miFXq3UK1DSgueRFzwCkbPeaUZs2nGTYCccunquAC1rB/Bd
	8TkpZdJOClxO82SHwP1lcFTC0ARNk9DgaHVbELmVmTxzkYo0QcIURhp3hNH/ZBm1WC3vyDIwGJZ5Z
	2rNttx9QH4Wu//IqHor0rT0fbKYVi4Kxqw4P2Hy2z2s0K9igOTvp4XTYAQNK1OMCnLdqI0oj097D2
	q9dT/oFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNQH-0000000ANCs-1Elo;
	Fri, 24 Oct 2025 19:26:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNQF-0000000ANCA-30uV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 19:26:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so22147515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 12:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761333957; x=1761938757; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqFywCr55VrKMslNk/QGMOXV5hNMK9F5bxBArsZULoI=;
        b=D2G5Ifi6iPO6JcD1pBFEV3yoqReH0LE8kOAryCAN8cOjvMdMVtg1SsuhSonZOgScy6
         9yFOUlvFXaidRDAjpzs8Z4om3oi1CVqz++Ikcz9KrNi2GxmzAPyqlok+wHm80t5tJ3F5
         igZu6MEChjObQZ03ZBXgRHRKZv9KBGNfCrBNpi6on868gVgrTQ0m+oZA2GAbyeNn9yE/
         eMe+/Kb1u6TNK2JvSkGwEYGQdNZ/JThAJ7T2teciqeO1ipHnFj2JcYHmtA0dJjLdqNcW
         ZTOfNgh9xve2nDgPqWpeck5/u/qTskXT6GWfA/THwmpvbI6EYOroL66RoTmcy6GAfj+D
         1h9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333957; x=1761938757;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dqFywCr55VrKMslNk/QGMOXV5hNMK9F5bxBArsZULoI=;
        b=YDozuUAh2X9pb+JMhmt4V3hZi20KTOisE/TNGqABej4O3/uIaT21lhzemn2Y6QUmq5
         qcqkZZg/FKIlSxnyxok0C18RtILznLg5ziwbvh9+m1Wm4SZ/rpbDPPj8/y/ZVWFSfZRU
         q287s90fSnyrlDQlPP8cKtC0LWtwbmLXMV0HMxuR58zIhpD54dGZPpFil75Onl1f28Rk
         CiTaB+Z1ojnmWj91zQ0BLtCONgOxlDBdNkBSKCRIM3h+1tMM0wwYuG92LiP9k59IcXW6
         eu1JSRZq1/YWJYqNc7Lt+jDDJfdeqDJOGUkIOp9RtO1IL0eALMRl6C/eOaildzwVchZ/
         fYUA==
X-Forwarded-Encrypted: i=1; AJvYcCUuVlC5Xw1kUjFlf2Y2AhSOUWHubg0TVTQ7kvUaGv3GfU4xFDXsy6rJWY9bPS6F7Mkf5etq09eOodXnsgP9Etvr@lists.infradead.org
X-Gm-Message-State: AOJu0YwmHfiWyDsorT+R4YxVPVQlmGpNTp5+CgpvAJWh5LWYXUhd6gi+
	nEkGR7i2MxJTZBQKsLo4v3zhaBBS4N+4AZzxhji+wUmJOPFqksY6sQtl
X-Gm-Gg: ASbGncv89MMZQa0tsoqvHA5FHCbVFHajLIfutnq7aUM/o+g5ERQo4iom+sQNiTxyKzb
	6Hb2FIB1WFDjjYowvfaSOZnVr5uWVA9EKFMWJD9uTVV1NMIPIGdMYXrHOqTCjbnQ4pldWLTQ2eB
	oJq7Fb8gXjdz9/D3j+APqnPJpQPKDfCC2pi0YvpmEOSl/4tJpVuXOJkuOVsgOY6jDabtqEHEQ4f
	tjnMTAI6KMqDe/+qt8cQsK4KOVz7qm1NEJAzW1hlvhs+e3R9RVYnbsoIHlB/v2vnu7cV9lWUYQJ
	QSUcr2Wo1yW6YH6bX2ffnzOH/C6DmGcW/zEgbXuQ0QvkCHbnzFGLsvZJWvFyyn9qFT5PW+UfnxL
	QklTRxPLIIh40MpXoilPQgDW1OFbqJrWnQtyeIqwRiIjX30sY00ooCxbexYDaZovAgFxuQlHx3B
	jWHOlxM1x8I7xktMm8Pgd0UoWyRkDHEKTi/50aJzTdwnNRDtxpGzVt0VyxbHXwRcDONTzyJbX0D
	21o+1gNII8IUuet7SA4QxXvXgaZ+yTrEhScSP417BQ=
X-Google-Smtp-Source: AGHT+IFzgFd0mKn5lagKBu1vcGEo58/NqJHfG5HmD4FjgxLN7PAUYJf8aNBB2MlJkzKRkcDthg76Dg==
X-Received: by 2002:a05:6000:26d1:b0:425:86b1:113a with SMTP id ffacd0b85a97d-4298f5825famr3429065f8f.16.1761333957262;
        Fri, 24 Oct 2025 12:25:57 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f20:af00:7cba:4f15:bb68:cf78? (p200300ea8f20af007cba4f15bb68cf78.dip0.t-ipconnect.de. [2003:ea:8f20:af00:7cba:4f15:bb68:cf78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428e9b2sm167097105e9.5.2025.10.24.12.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 12:25:56 -0700 (PDT)
Message-ID: <8335ad5a-f5fa-4fb6-b67a-d73c4021291a@gmail.com>
Date: Fri, 24 Oct 2025 21:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next] net: stmmac: mdio: fix smatch warning
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_122559_777240_128286DF 
X-CRM114-Status: GOOD (  13.20  )
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

max_addr is the max number of addresses, not the highest possible address,
therefore check phydev->mdio.addr > max_addr isn't correct.
To fix this change the semantics of max_addr, so that it represents
the highest possible address. IMO this is also a little bit more intuitive
wrt name max_addr.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Reported-by: Simon Horman <horms@kernel.org>
Fixes: 4a107a0e8361 ("net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register")
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 3f8cc3293..1e82850f2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -583,9 +583,9 @@ int stmmac_mdio_register(struct net_device *ndev)
 	struct device_node *mdio_node = priv->plat->mdio_node;
 	struct device *dev = ndev->dev.parent;
 	struct fwnode_handle *fixed_node;
+	int max_addr = PHY_MAX_ADDR - 1;
 	struct fwnode_handle *fwnode;
 	struct phy_device *phydev;
-	int max_addr;
 
 	if (!mdio_bus_data)
 		return 0;
@@ -609,15 +609,12 @@ int stmmac_mdio_register(struct net_device *ndev)
 
 		if (priv->synopsys_id < DWXGMAC_CORE_2_20) {
 			/* Right now only C22 phys are supported */
-			max_addr = MII_XGMAC_MAX_C22ADDR + 1;
+			max_addr = MII_XGMAC_MAX_C22ADDR;
 
 			/* Check if DT specified an unsupported phy addr */
 			if (priv->plat->phy_addr > MII_XGMAC_MAX_C22ADDR)
 				dev_err(dev, "Unsupported phy_addr (max=%d)\n",
 					MII_XGMAC_MAX_C22ADDR);
-		} else {
-			/* XGMAC version 2.20 onwards support 32 phy addr */
-			max_addr = PHY_MAX_ADDR;
 		}
 	} else {
 		new_bus->read = &stmmac_mdio_read_c22;
@@ -626,8 +623,6 @@ int stmmac_mdio_register(struct net_device *ndev)
 			new_bus->read_c45 = &stmmac_mdio_read_c45;
 			new_bus->write_c45 = &stmmac_mdio_write_c45;
 		}
-
-		max_addr = PHY_MAX_ADDR;
 	}
 
 	if (mdio_bus_data->needs_reset)
-- 
2.51.1


