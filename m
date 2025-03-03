Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3272C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohEJ1FwDpFTkrVu0Ct+G3zL1K8cCEz95xL4GXyCX2D4=; b=VPcjF1/6CWBe0aagXqwqlsLOGS
	KICQ/WQSM3iyCOkkpWAOnW+ksDf6g+bf8ZyfMM/1lMom+qXhhWL71mSnDN0VGOvLRd2IbECSJKQSA
	3cuZIumEVsZWYTYLUm+KlziwdXbVmqdof0w/1U8Tn+/lKZA6J4OjSloj/hFdeJfR2kj9Xn2yDvu8y
	3EhiwEt4Kv9CHtLFwC4AMSM2aYT5/xINigaFA/uuwk+zYccVkGQOa6X5EPEHfTD/c5QopoNuEjYaI
	jm3Y2NYhJsiFX7tQSWDKG3Cx+x61U1qd7iHY61QuNqQF4QOVeqoPoArP2cFHsVAQeZY1MKtEERBqq
	21n53AMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCMq-00000002CNQ-4B2X;
	Mon, 03 Mar 2025 20:26:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCF1-00000002B7X-3fQz;
	Mon, 03 Mar 2025 20:18:21 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso9198105e9.1;
        Mon, 03 Mar 2025 12:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741033098; x=1741637898; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ohEJ1FwDpFTkrVu0Ct+G3zL1K8cCEz95xL4GXyCX2D4=;
        b=TLPwxjfceo0AA9DLamLhRxXNQCiLDspm+/moq6gEg1tydTsN1zAm2WeGOxNjOlc5Kd
         /gfyujSDAu2VJdJ1NrjO/xncNn3ScWH2grkz9Nji/zXgsf8SHsEtIHWU3Bcn4/vVD2qc
         t6UvEbtZLwgVoGvrMg7/b9HLJnOx963e1YwZcnXqouoEQgWbTPURkOZ1Kj8+81ndpaWi
         olAyufWbLL46BRx9x6OVw6Dswfvfj2SuK+OMBjttU/+K8Q0P12wOxp7GeegqjCG5KeTA
         c4YXp3JiWogwtrVqSc0DnOwyh8DkqZES8jB2Cc6V0Cmpo8MbUv18i2rpCH+6utD9si8Z
         boyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741033098; x=1741637898;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohEJ1FwDpFTkrVu0Ct+G3zL1K8cCEz95xL4GXyCX2D4=;
        b=BOpYvMetGrnydBs8YJy7r3OyNg+2EUYOfiD9JmJD21ZxWEU41lV+4uQgvMtLwrafxF
         bZh+8ZV+SrxRCMvSbR7DA1IFtzDxIcM/KIZq2RWzJP3mQzDXBn9gt8/37lrR3n6fBl1I
         rdeD334VJKWr/OK/Uwl6rI7C/dsq8iQqU612Vq42B1rv/iyPpBrE2Z1IPc002dCjZZU0
         YNo9lyfifLzWjBO311zwFzb5bcl4yJ49QAtLk5ZqPJMKOBBukine0/Nmmy9ZnL84TPIX
         0nMcBRG5qYsYvVmGUQa8dVd/tRDvZbox6liXHEEF1YDxRmfPGaUBRM/90+5Ov+ewWDHm
         N7mA==
X-Forwarded-Encrypted: i=1; AJvYcCVBv4QQFmh7kZgHfBG/lPYzWrf6N5JSaNUiuhsC1zArF7qKvpgqyZKFhga6e+u5/4ya3IJ5b31+5seZ7ChEia0=@lists.infradead.org, AJvYcCWUaPns8Lq+STaaL3ggcS57qDrjCaG237SWdGsywbdpPXUekN1WUsL2HPBpLr8SmgkGjSNkDfcg6LgXLJjPeXFY@lists.infradead.org
X-Gm-Message-State: AOJu0YwpzE5hAmnIIXLvoCQ7J0NBlnY2PqqhFMQNvcwgYlgR9yF1Ac/v
	EtBI6RmHYx5h79xlNyHy8IwskjNMmYmp+dD1GjrgLOdcV5jAi0Vo
X-Gm-Gg: ASbGnctZq+E2QVaSYH5TEOIkNMV96xeijjYUs9NiBrDdglRlxWUUFxYl1mPNu15YcN4
	oMLtKf3Buzw7cJdQRuZ+IxaQUrIbt3VJKSyLqvxnwyPrVq4fuVCMugd/O3ISB7YmHsSFIFOnSR/
	yrMElZpcA25rxoZZ2odWeCg+OHBu6j2k6j2kR2raj7XSXa+Xuk5fwdVbpgifE4apFKPCwG1ft6m
	b5HIAEcN7yWBFqC+sOeiWPn2Gu7+XiQHRzyRbfhir/R6mpDIhQBilUk7sKpRWSRXXMmhm+7C9Kq
	m5NJWlK7p4JmkVFB+LpmqmMWGvgx/Nj2lqXYAzP1/u66GeiUrZNsUQgg4ngIA4siQg2EFBOVdDO
	N0DnLP9TNWJhCNgiOFCfu8dLtjH2YnM5/5/xgy6TP0GuK0P5SQWQrtSsdSqWTsuNxbDjjPowyPd
	LyrAH8XCT9QGhiYia/Zau6xB9zUTALthraQ/FC
X-Google-Smtp-Source: AGHT+IGJatbfIe84xhWbFRU+VTpPA5HixJRnRiYEqNmRPgTUX0qdo/bnGs7BwcgPj5k7yJs8Neh6iw==
X-Received: by 2002:a05:6000:2c6:b0:390:fc60:b6d0 with SMTP id ffacd0b85a97d-390fc60bbeemr9075339f8f.16.1741033097939;
        Mon, 03 Mar 2025 12:18:17 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e4844a2dsm15503094f8f.72.2025.03.03.12.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:18:17 -0800 (PST)
Message-ID: <211e14b6-e2f8-43d7-b533-3628ec548456@gmail.com>
Date: Mon, 3 Mar 2025 21:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 8/8] net: phy: remove remaining PHY package
 related definitions from phy.h
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Rosen Penev <rosenp@gmail.com>
References: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_121819_922190_A116F3C1 
X-CRM114-Status: GOOD (  17.47  )
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



