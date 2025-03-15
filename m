Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D7FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHfS9Ayq+62ZEPKyiIIGlUUpg7PHKrYF5eIEp4kJv8I=; b=fUkjFy1WnOK1jzlcY0UbJOAve4
	AUZZTgyRiU1kpuybr5U98TD5ENMHfxoiPB2qWOKioG0TVFCfnTsxr4c3FYtC8liHkia9nktaqZiQX
	StENGMG+2jLj16WjozE/l4YPkUrRqecKlttlt4bZuS+cGhJ2LPsj4N6R/kXzYWmB8R+T3JUWbNlcB
	dBnUPjTFPATjV4v/royeoOT7VyNv0mLHvW7JvLmnLxIAV2iNmGWQNy7tJt5zEY2i/r+sh0EW/c9a9
	1LTFk2wzdG4xYBFVCbqW1obZkA07mYs2rD8l5Ev49UORkyZfwP3pEpXA+cjrkFW5UhlWalHZaJzZg
	1/40GsAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTxP-0000000GZAu-3bZC;
	Sat, 15 Mar 2025 16:01:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTh1-0000000GX43-0hEC;
	Sat, 15 Mar 2025 15:44:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfe574976so4052935e9.1;
        Sat, 15 Mar 2025 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742053493; x=1742658293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHfS9Ayq+62ZEPKyiIIGlUUpg7PHKrYF5eIEp4kJv8I=;
        b=HrKBvV32vgYWEYhpdh581GOP4CL36RPL7Fyiet57xaalxOo2th9MvqZX2ssEVwW2QC
         6Od9LAOXBVwv8fbMmWvAEMAQVpyh81GvuVnd8q8vbAxntcwdnkPixIfym6nlP8M2Ns47
         84zzkyVjAPYh++rN1HBcDVUW1+cmuTx7by5/e/E2Q8P6DDyRmQO5hWszkIi7M0STBxLu
         lFLi0hBZSwgwIeFz+K1/0pzL39pYGrdi4umngJxGM7fZMHrInmu4/Zb+pfwiCDMvgDxf
         BFZenYnsQMLwdC1qtz7A0nyGIiVZ8TMijrbYIFiIEVaD3MiRUXnyQEOUZjUs49f1y+Wj
         V7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742053493; x=1742658293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHfS9Ayq+62ZEPKyiIIGlUUpg7PHKrYF5eIEp4kJv8I=;
        b=D6LQ5y4Yv2vl18vcXCh7hF7WiNDneW6GOMbBL7w47y3zvSe6zt4L0GzPL2zzbXjIVF
         7DAlfrEJbbiXxnKtCYB0ilyuq6zze5IfbeGw8o8CVjJjqdnitK6DRTt0HfWfcD4O/cp1
         Ube4EiRA6NIOgPicjPjUDdwFTBHt/NKSIkzcZWmEko3y2cQ2/H2l+bCR8L04niFeo4bA
         8dg1hGhCe6IlImK963cAZ2lpfqNvR4EThHMjrNe544cI5sPBzvYy3/KdgP3VY5TcaLru
         s36MBx8JWRqGpwv0HpZsKNi/Tzd4gpqkMT1NOTZITHBcSHSRi3T0sZQTsPgA1zyCGOTw
         vW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfw+sZeM1FVg0wTBK/6bZ17If5VdbLnpOOl8P5lI3sZcw8882lUiEp7yfjJcv3znXnWA8zWcd2J5RnCOk+k9Y=@lists.infradead.org, AJvYcCXHjSBzxM1iPhY/vas4cn0rwi71GDjSAePrhfejQkhiakSeljXa4MAVI8eLSnBatgUHp240jzD5zAzomK/C0Oc5@lists.infradead.org
X-Gm-Message-State: AOJu0YwFx8+JbTCDJrwCLjA9MJK+VN28GX1aGQQVvxar5vH++zqVbEqQ
	zStGgsCYSrWhu+Oyg+PV3DB+ezhyeWfoF6WpMu7ompRABPeV0WDu
X-Gm-Gg: ASbGncv5mqHyKdiFUywehpstdx9NxeFxPhYzeeKZghjVfbbvQjXuIwgUylmG4tpNqfZ
	tbdU1CKcDrEPeAfsu6clGDLtcE456TcXdPjmIPZ3jnIJeV+TVRq9k+SJzOXtxnhoBg4M9OYuYAf
	WOxko3wJi9NzgLv8xObyUHadwrAg2bJwr3/2X8nX5r/XGsHLRXIE7/11Adu/RAG44j4o8SWVvGL
	4FJL2xLN5ErewgV/tlyOwxZZM5oqAjDNuekFKD/ycrOE/YfqWu/t6ojPVzpLsqJlCRNpMWR3S2h
	RuCkcVJxE9140VaPb0l1bn0EA1kXrTMtjvw4Y/uBbPkj5KeGxrSGmYpukPifmdM+N046ffz3LWM
	0MQA48Dj5MmA5Uw==
X-Google-Smtp-Source: AGHT+IGeR0GlB6V/S9Dn/s5gMh0ja71UFOJhw5HL2cIq3odbRefg3sGJoJMZ8zyrbhiVe+3weElnTg==
X-Received: by 2002:a05:600c:1548:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43d2a2ececcmr8971025e9.5.1742053493214;
        Sat, 15 Mar 2025 08:44:53 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm53464195e9.11.2025.03.15.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:44:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v13 09/14] net: mdio: regmap: add OF support
Date: Sat, 15 Mar 2025 16:43:49 +0100
Message-ID: <20250315154407.26304-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154407.26304-1-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084455_217988_A834A6FA 
X-CRM114-Status: GOOD (  14.94  )
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

Permit to pass a device tree node to mdio regmap config and use
the OF variant of mdiobus_register.

This is done to autoprobe PHY defined in device tree as the current
mdiobus_register only permits probing PHY using the MDIO mask value.

Previous implementation is not changed as of_mdiobus_register fallback
to mdiobus_register if the passed device tree pointer is NULL.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/mdio-regmap.c   | 2 +-
 include/linux/mdio/mdio-regmap.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-regmap.c b/drivers/net/mdio/mdio-regmap.c
index ed0443eb039f..8e89068c844d 100644
--- a/drivers/net/mdio/mdio-regmap.c
+++ b/drivers/net/mdio/mdio-regmap.c
@@ -143,7 +143,7 @@ struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 	else
 		mii->phy_mask = ~0;
 
-	rc = devm_mdiobus_register(dev, mii);
+	rc = devm_of_mdiobus_register(dev, mii, config->np);
 	if (rc) {
 		dev_err(config->parent, "Cannot register MDIO bus![%s] (%d)\n", mii->id, rc);
 		return ERR_PTR(rc);
diff --git a/include/linux/mdio/mdio-regmap.h b/include/linux/mdio/mdio-regmap.h
index bb0e7dc9c0dc..228f12e90750 100644
--- a/include/linux/mdio/mdio-regmap.h
+++ b/include/linux/mdio/mdio-regmap.h
@@ -14,6 +14,7 @@ struct regmap;
 
 struct mdio_regmap_config {
 	struct device *parent;
+	struct device_node *np;
 	struct regmap *regmap;
 	char name[MII_BUS_ID_SIZE];
 	u8 valid_addr;
-- 
2.48.1


