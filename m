Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E010C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohEJ1FwDpFTkrVu0Ct+G3zL1K8cCEz95xL4GXyCX2D4=; b=c0maX/aMNOVDSyL/K5x4KtBjco
	eBp6DchU91iOLj3NGtyyJD4ZIMM5cOQXguno8DbB79RHGN6KxMp7AWkIjgY9zY4k0z5fK/I8gws73
	0UIKCEsm6YHGps5G1MM+0DOXqP+Nmw7BFURXYfGdvhjTGJ75WE7dAFor+rRur9I+Kb8zBDLPLzjl5
	Rg0qMh1GJSlTcZAjY5MyLiDu1DrsMIIHep6uE/M25pr+phZOWBUBOo0kOeso9USSemlVbc1SEOrpl
	IA3ypVb0B/6PcfcyVt+9sX6Dq+9+rPQAxuy83LWV0EWsw0Cub1GD3emDZOCuU4RSQSnhmVvOOou9k
	kiVqBxkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8Pn-0000000CneH-0xNn;
	Fri, 28 Feb 2025 22:01:03 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8G7-0000000CmHf-0R05;
	Fri, 28 Feb 2025 21:51:04 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so3216010a12.1;
        Fri, 28 Feb 2025 13:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779461; x=1741384261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ohEJ1FwDpFTkrVu0Ct+G3zL1K8cCEz95xL4GXyCX2D4=;
        b=dAUhN6/NIOkEkqazGjolCdv74aR6/vS8g32SXS1niMen5xVmKyrwGzw5SKov8p13lL
         6lMPBVnKNS9yRSPWn0bYdAH3YC5aCmG07753UMOP6pgwlJCW2ptyEV7yMLQBAcQH0/Vj
         bSuzVo3lU2xIH+TJZLOlBMW9gZYDqgv1bRb/U9VVAJxS+d4ZTCUNa/dMMrRuFp+xdaQf
         CjEaJH9dcMBvly4y2Nz9NbfObkDio4G0mlHQarb/LDPQAiyPRlOLpK6tba8LzeKLPkcC
         q0Xbu3419cYtjX/k0NhIL8D8XEo8MWuzhde4lUpiHVXOyqFR7+hjK+jDkRGnafDbWZeM
         VxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779461; x=1741384261;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohEJ1FwDpFTkrVu0Ct+G3zL1K8cCEz95xL4GXyCX2D4=;
        b=sMLuZ4fkpdYMAZfU+/iXh0yv+n4yy2pgyLS8n97La/zdgZy4umOP7Q9wP1geKZWH6i
         3YMXgNqQM1LQSDCb2bhQWAB0IJ97DuSGiPgUWDeLXkq34bAaZGmvQhlwFA/mcG+cZD1I
         gd4egbyWcd/AcWUYt0IYr35iYeYUS3eYMol00O0li8DiLFBoClrdbwMJpaMLDf1pK9+p
         j6ZJDAOD9lSTyZrZpwQIldp0q/+AQgcTtCDDqmxq6rigbEmyFcaJw/peyVw+FaGuu1M6
         BkzXbLAvp2tu5CYVcFkA4WOSIi5eRwc6fkX/KWdteA0pJwmw7eI3riYoYPG9vRX/xLuK
         nWDw==
X-Forwarded-Encrypted: i=1; AJvYcCUximQdBu8m/g1hyknktLWEmShTpUigRFqOVBRTYfctnquloK23cFEzr+4T3hhkG0XCD8PnzttmdGwfTQD4rtE=@lists.infradead.org, AJvYcCWGA5w4MyYQfVJimaesxa0+ltSXtY3xDPkWh04HbMqC6/eixjdvfgF+TxdJR1Lc8JYGj3H/rVgBraVe7xo7fp8b@lists.infradead.org
X-Gm-Message-State: AOJu0YymMbRHgJ2iFos4t75TSCFuzQk3KyR/riA+0yZDYg//pMeBD7Yj
	HmtEDkm7qVWmtXqMcPmg3mPkF89Bc+M2KYh0EaMWklAcQKvBuAY1
X-Gm-Gg: ASbGncuNQUb3L2X7f0tY4M8b19YzADWwtFxaN6FWoT3wIoGJAeKskyAUC66qmKri0hQ
	ajwKo7miUeXZx409Z6TqQgZ0PTqn/KPMTII5oZOcmgQELXIndJyn8ioWhU2RFqE1h4WXDAKD18D
	R2k7w1Zp8suFjZAiIFHZI7xjic9pfOVB9vCUn7XsMBtd7qGcaVWpu8tAAB7o7dyplVzfVXXyesA
	k8Xdlkkz5K63pFsum72VBeUCe+vCPzzRQvb/ksBoHTlKcsJfV3x3FAFKPkl5rYxqVDcOi7o4Flz
	puoXEiVdzrC8iqYfVLpEnEnYjM42X4vkk+3yH/0VUB30LvcluC7O1yjY97jS0gV9YTvtNhq2QsY
	JHP5uDhJGN3uKCaMpHET7h5zmzBM7vSvZpIpKb+zEN2+hW9t9jAmzky9ZY2PCJXxtCm4pnTUlgt
	PEOIg6drn16JlohcQiS22eyk9rEMB7vgLQTm1a
X-Google-Smtp-Source: AGHT+IHIxBD0q37AS6941FVNwixF/wGxSXpz2TASeoAjXdHZi+Zi5OpJg1iefscixpFzLBBtLAvS/A==
X-Received: by 2002:a05:6402:1d4d:b0:5dc:796f:fc86 with SMTP id 4fb4d7f45d1cf-5e4d6af436amr10684098a12.16.1740779461344;
        Fri, 28 Feb 2025 13:51:01 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a55e0sm3053226a12.79.2025.02.28.13.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:51:00 -0800 (PST)
Message-ID: <6ad490fa-61ad-48b8-9660-bb525f756f41@gmail.com>
Date: Fri, 28 Feb 2025 22:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 8/8] net: phy: remove remaining PHY package
 related definitions from phy.h
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
References: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_135103_159663_D1E94845 
X-CRM114-Status: GOOD (  17.59  )
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

Move definition of struct phy_package_shared to phy_package.c, and
move remaining PHY package related declarations from phy.h to
phylib.h, thus making them accessible for PHY drivers only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy_package.c | 31 ++++++++++++++++++++++++++++
 drivers/net/phy/phylib.h      |  7 +++++++
 include/linux/phy.h           | 38 -----------------------------------
 3 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 12c92d26e..c738f76e8 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -9,6 +9,37 @@
 #include "phylib.h"
 #include "phylib-internal.h"
 
+/**
+ * struct phy_package_shared - Shared information in PHY packages
+ * @base_addr: Base PHY address of PHY package used to combine PHYs
+ *   in one package and for offset calculation of phy_package_read/write
+ * @np: Pointer to the Device Node if PHY package defined in DT
+ * @refcnt: Number of PHYs connected to this shared data
+ * @flags: Initialization of PHY package
+ * @priv_size: Size of the shared private data @priv
+ * @priv: Driver private data shared across a PHY package
+ *
+ * Represents a shared structure between different phydev's in the same
+ * package, for example a quad PHY. See phy_package_join() and
+ * phy_package_leave().
+ */
+struct phy_package_shared {
+	u8 base_addr;
+	/* With PHY package defined in DT this points to the PHY package node */
+	struct device_node *np;
+	refcount_t refcnt;
+	unsigned long flags;
+	size_t priv_size;
+
+	/* private data pointer */
+	/* note that this pointer is shared between different phydevs and
+	 * the user has to take care of appropriate locking. It is allocated
+	 * and freed automatically by phy_package_join() and
+	 * phy_package_leave().
+	 */
+	void *priv;
+};
+
 struct device_node *phy_package_get_node(struct phy_device *phydev)
 {
 	return phydev->shared->np;
diff --git a/drivers/net/phy/phylib.h b/drivers/net/phy/phylib.h
index 06c50d275..f0e499fed 100644
--- a/drivers/net/phy/phylib.h
+++ b/drivers/net/phy/phylib.h
@@ -17,5 +17,12 @@ int __phy_package_write(struct phy_device *phydev, unsigned int addr_offset,
 			u32 regnum, u16 val);
 bool phy_package_init_once(struct phy_device *phydev);
 bool phy_package_probe_once(struct phy_device *phydev);
+int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size);
+int of_phy_package_join(struct phy_device *phydev, size_t priv_size);
+void phy_package_leave(struct phy_device *phydev);
+int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
+			  int base_addr, size_t priv_size);
+int devm_of_phy_package_join(struct device *dev, struct phy_device *phydev,
+			     size_t priv_size);
 
 #endif /* __PHYLIB_H */
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 2b12d1bef..c4a6385fa 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -319,37 +319,6 @@ struct mdio_bus_stats {
 	struct u64_stats_sync syncp;
 };
 
-/**
- * struct phy_package_shared - Shared information in PHY packages
- * @base_addr: Base PHY address of PHY package used to combine PHYs
- *   in one package and for offset calculation of phy_package_read/write
- * @np: Pointer to the Device Node if PHY package defined in DT
- * @refcnt: Number of PHYs connected to this shared data
- * @flags: Initialization of PHY package
- * @priv_size: Size of the shared private data @priv
- * @priv: Driver private data shared across a PHY package
- *
- * Represents a shared structure between different phydev's in the same
- * package, for example a quad PHY. See phy_package_join() and
- * phy_package_leave().
- */
-struct phy_package_shared {
-	u8 base_addr;
-	/* With PHY package defined in DT this points to the PHY package node */
-	struct device_node *np;
-	refcount_t refcnt;
-	unsigned long flags;
-	size_t priv_size;
-
-	/* private data pointer */
-	/* note that this pointer is shared between different phydevs and
-	 * the user has to take care of appropriate locking. It is allocated
-	 * and freed automatically by phy_package_join() and
-	 * phy_package_leave().
-	 */
-	void *priv;
-};
-
 /**
  * struct mii_bus - Represents an MDIO bus
  *
@@ -2109,13 +2078,6 @@ int phy_ethtool_get_link_ksettings(struct net_device *ndev,
 int phy_ethtool_set_link_ksettings(struct net_device *ndev,
 				   const struct ethtool_link_ksettings *cmd);
 int phy_ethtool_nway_reset(struct net_device *ndev);
-int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size);
-int of_phy_package_join(struct phy_device *phydev, size_t priv_size);
-void phy_package_leave(struct phy_device *phydev);
-int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
-			  int base_addr, size_t priv_size);
-int devm_of_phy_package_join(struct device *dev, struct phy_device *phydev,
-			     size_t priv_size);
 
 int __init mdio_bus_init(void);
 void mdio_bus_exit(void);
-- 
2.48.1



