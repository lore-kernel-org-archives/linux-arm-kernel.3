Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AF7C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mPWUWkwmmObY+Ge4/3GNYHR3RTsnlUqPRmRgUCBL5s=; b=bIjR6uZpMeOMU2LkTRzq5Yy2uR
	b1/rCDpAzqwX+F4fS5C664ySV2eXAAZ+/2o7trYG5fA9cW8sF9SEfiNqaeF8moQSF4e8R/daTAyO1
	3bt29ylki8vcTqDZANhwVBXQAcZ9qQNj1M+ybEUDMoV+Vg86keRxk1G0V1nSeJDPN7C5smFh7GYIs
	D+CzqlO4smQ9i2FQICy3PrZVY0/a0ZRz8W/aq9IT9qLNnmLMW0eE26GUX9MNkibsjbiRCzAD1KGdX
	vgqi0KwszCH3mX9Yb1d5yDxcOEWhTPK+iadVVhKouXkEvKVIKfc4ddmbi/4b5cnmbY0eOICy/uniq
	FKAlSkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9H5-00000001gkC-2ry2;
	Thu, 22 May 2025 17:00:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9B5-00000001fYp-3K06;
	Thu, 22 May 2025 16:53:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so90316055e9.1;
        Thu, 22 May 2025 09:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747932834; x=1748537634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mPWUWkwmmObY+Ge4/3GNYHR3RTsnlUqPRmRgUCBL5s=;
        b=Iy9z4jw/nuuu2oHrR5SWMUOGN0B5nWCA4bvQZmQosnJJQeb9GoNYlWMe6ziZ/IV2Ma
         P+Xco2paZhdSJrd+HfjPsn6+hUFKbiD/UfhqFgEG/ZrV6QyuEkRc1YDwjjze5KKAYmdp
         Ckysbuku7RyRxZXcrGTYIOWSPvhhhKEUVy8zgyPcqQ9lO44gRrQa8B+cpNVR/QSlN0c0
         OdvxelqSG2GfTmaPU5qobKwQ9zFDITXw6ThR5LuMtDcVuXECevhLAMPeV2MATbvQ8lJ8
         IIzn3zlCtM4SjaUCMm2mVYxyxD9gm+XMkaGR6gkMYYdCIIfZVdJIU5ir19xbvnYDfCZl
         aa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747932834; x=1748537634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mPWUWkwmmObY+Ge4/3GNYHR3RTsnlUqPRmRgUCBL5s=;
        b=tkqsbSTp6273hgbLTz3+JQ7o/SbD5EHIuYFJJZivkHDnkOdN9Lzbr/nSBz0TVvWO0x
         6eLQIYtm3bve99CoPw4f4k0bDVHr9agMK+uJ0yZFmYxaMRJbtbRoRkz1v9wf0UPCBJ+V
         n+/8Sl10el434ZbaMiEnI41bI/T8uakFDvFaIE8hM3BhRB+Sf5IOaptQQyq+MxS9hsx4
         E7KM5di5imGTYOGy+cdbLvezghpEFpfnf0z2NoXQE7za5jTcaHKlGtZiyfdo0V50c5J4
         rrvS/VD0T7zNwYaoGbK2vU1ub43YmaSXwbNHhJBQXp8tPdP4aVx1qcRvzovWbrag+pfx
         CBgA==
X-Forwarded-Encrypted: i=1; AJvYcCWee4+KnpY8svJa3H89eiOaVRp4oOdc41wSSlVpK5EMQ08V4rrH31HQ3u9IzffJ10KDYpRF2iede9NSwXYHvELm@lists.infradead.org, AJvYcCWreh6um9lvYep4NodgVzmOqWTDXEiunsZzSX+Q3Cvp7V5EsZ9tKff+X9g8K2ZEM0NnbQOeuY4WreEjDXM2iS0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrlFIjEnURUZjPikGCAjFPN4SAl79R4DEbO2SRN932XF5DZjUz
	8YxH05Xl+mDG6bwEkMOqjMGMMsc1N88yEH3lZyKz2nVnHhsF0m1W3cah
X-Gm-Gg: ASbGncs+ybC6xc309YuU0Xct3ujW9Qcnfu47Ypxt5LUZdtIWlZWa9aS+7jlwGUDFqCO
	5s0Hrza8ELsA109IP1fqUMLdKvC87vfhQZhqjnO4iG1WQGQl38hFFBkvLrsXePYh/bwchsYadcU
	V8HXpWFNzBimKh9ivfEa3w92OimUHzrc9rrq2sW1Ddd7ZVhiVILlZYjqHrriIai6TMmjSuEa8SM
	aQw0abu3UgEDw/jpAw7yI7RGLSFMclf51oyCWfGvzzxYoyjXnUQ2gmGsWPnOXbscLFEtqnxFxn/
	3onF1UJPYT9S9sM4YFUUeVVj5XTsJFoJWBEbHGDwGnZQloja21KlZX7LF3YJ+QkC3ss6OCR0d40
	f8vBUDibmfZ23QcvIm0Aa
X-Google-Smtp-Source: AGHT+IFmR4PB7sf4/6zd128WxYGdEUHoGzx/c9HXM4LqXrQuqXcb1xnJb7dY9wh8h9zgkCfv8xuaYA==
X-Received: by 2002:a05:600c:8507:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-442fd608753mr236599325e9.1.1747932833793;
        Thu, 22 May 2025 09:53:53 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-447f6b297easm118737525e9.6.2025.05.22.09.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 09:53:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 2/3] net: dsa: mt7530: Add AN7583 support
Date: Thu, 22 May 2025 18:53:10 +0200
Message-ID: <20250522165313.6411-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522165313.6411-1-ansuelsmth@gmail.com>
References: <20250522165313.6411-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_095355_833723_5B4F4A59 
X-CRM114-Status: GOOD (  17.31  )
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

Add Airoha AN7583 Switch support. This is based on Airoha EN7581 that is
based on Mediatek MT7988 Switch.

Airoha AN7583 require additional tweak to the GEPHY_CONN_CFG register to
make the internal PHY work.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/mt7530-mmio.c |  1 +
 drivers/net/dsa/mt7530.c      | 24 ++++++++++++++++++++++--
 drivers/net/dsa/mt7530.h      | 18 ++++++++++++++----
 3 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
index 5f2db4317dd3..842d74268e77 100644
--- a/drivers/net/dsa/mt7530-mmio.c
+++ b/drivers/net/dsa/mt7530-mmio.c
@@ -11,6 +11,7 @@
 #include "mt7530.h"
 
 static const struct of_device_id mt7988_of_match[] = {
+	{ .compatible = "airoha,an7583-switch", .data = &mt753x_table[ID_AN7583], },
 	{ .compatible = "airoha,en7581-switch", .data = &mt753x_table[ID_EN7581], },
 	{ .compatible = "mediatek,mt7988-switch", .data = &mt753x_table[ID_MT7988], },
 	{ /* sentinel */ },
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7361380ffb5f..df213c37b4fe 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1298,7 +1298,7 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 	 * is affine to the inbound user port.
 	 */
 	if (priv->id == ID_MT7531 || priv->id == ID_MT7988 ||
-	    priv->id == ID_EN7581)
+	    priv->id == ID_EN7581 || priv->id == ID_AN7583)
 		mt7530_set(priv, MT7531_CFC, MT7531_CPU_PMAP(BIT(port)));
 
 	/* CPU port gets connected to all user ports of
@@ -2612,7 +2612,7 @@ mt7531_setup_common(struct dsa_switch *ds)
 	mt7530_set(priv, MT753X_AGC, LOCAL_EN);
 
 	/* Enable Special Tag for rx frames */
-	if (priv->id == ID_EN7581)
+	if (priv->id == ID_EN7581 || priv->id == ID_AN7583)
 		mt7530_write(priv, MT753X_CPORT_SPTAG_CFG,
 			     CPORT_SW2FE_STAG_EN | CPORT_FE2SW_STAG_EN);
 
@@ -3236,6 +3236,16 @@ static int mt7988_setup(struct dsa_switch *ds)
 	reset_control_deassert(priv->rstc);
 	usleep_range(20, 50);
 
+	/* AN7583 require additional tweak to CONN_CFG */
+	if (priv->id == ID_AN7583)
+		mt7530_rmw(priv, AN7583_GEPHY_CONN_CFG,
+			   AN7583_CSR_DPHY_CKIN_SEL |
+			   AN7583_CSR_PHY_CORE_REG_CLK_SEL |
+			   AN7583_CSR_ETHER_AFE_PWD,
+			   AN7583_CSR_DPHY_CKIN_SEL |
+			   AN7583_CSR_PHY_CORE_REG_CLK_SEL |
+			   FIELD_PREP(AN7583_CSR_ETHER_AFE_PWD, 0));
+
 	/* Reset the switch PHYs */
 	mt7530_write(priv, MT7530_SYS_CTRL, SYS_CTRL_PHY_RST);
 
@@ -3344,6 +3354,16 @@ const struct mt753x_info mt753x_table[] = {
 		.phy_write_c45 = mt7531_ind_c45_phy_write,
 		.mac_port_get_caps = en7581_mac_port_get_caps,
 	},
+	[ID_AN7583] = {
+		.id = ID_AN7583,
+		.pcs_ops = &mt7530_pcs_ops,
+		.sw_setup = mt7988_setup,
+		.phy_read_c22 = mt7531_ind_c22_phy_read,
+		.phy_write_c22 = mt7531_ind_c22_phy_write,
+		.phy_read_c45 = mt7531_ind_c45_phy_read,
+		.phy_write_c45 = mt7531_ind_c45_phy_write,
+		.mac_port_get_caps = en7581_mac_port_get_caps,
+	},
 };
 EXPORT_SYMBOL_GPL(mt753x_table);
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index d4b838a055ad..7e47cd9af256 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -20,6 +20,7 @@ enum mt753x_id {
 	ID_MT7531 = 2,
 	ID_MT7988 = 3,
 	ID_EN7581 = 4,
+	ID_AN7583 = 5,
 };
 
 #define	NUM_TRGMII_CTRL			5
@@ -66,7 +67,8 @@ enum mt753x_id {
 
 #define MT753X_MIRROR_REG(id)		((id == ID_MT7531 || \
 					  id == ID_MT7988 || \
-					  id == ID_EN7581) ? \
+					  id == ID_EN7581 || \
+					  id == ID_AN7583) ? \
 					 MT7531_CFC : MT753X_MFC)
 
 #define MT753X_MIRROR_EN(id)		((id == ID_MT7531 || \
@@ -76,19 +78,22 @@ enum mt753x_id {
 
 #define MT753X_MIRROR_PORT_MASK(id)	((id == ID_MT7531 || \
 					  id == ID_MT7988 || \
-					  id == ID_EN7581) ? \
+					  id == ID_EN7581 || \
+					  id == ID_AN7583) ? \
 					 MT7531_MIRROR_PORT_MASK : \
 					 MT7530_MIRROR_PORT_MASK)
 
 #define MT753X_MIRROR_PORT_GET(id, val)	((id == ID_MT7531 || \
 					  id == ID_MT7988 || \
-					  id == ID_EN7581) ? \
+					  id == ID_EN7581 || \
+					  id == ID_AN7583) ? \
 					 MT7531_MIRROR_PORT_GET(val) : \
 					 MT7530_MIRROR_PORT_GET(val))
 
 #define MT753X_MIRROR_PORT_SET(id, val)	((id == ID_MT7531 || \
 					  id == ID_MT7988 || \
-					  id == ID_EN7581) ? \
+					  id == ID_EN7581 || \
+					  id == ID_AN7583) ? \
 					 MT7531_MIRROR_PORT_SET(val) : \
 					 MT7530_MIRROR_PORT_SET(val))
 
@@ -673,6 +678,11 @@ enum mt7531_xtal_fsel {
 #define  CPORT_SW2FE_STAG_EN		BIT(1)
 #define  CPORT_FE2SW_STAG_EN		BIT(0)
 
+#define AN7583_GEPHY_CONN_CFG		0x7c14
+#define  AN7583_CSR_DPHY_CKIN_SEL	BIT(31)
+#define  AN7583_CSR_PHY_CORE_REG_CLK_SEL BIT(30)
+#define  AN7583_CSR_ETHER_AFE_PWD	GENMASK(28, 24)
+
 /* Registers for LED GPIO control (MT7530 only)
  * All registers follow this pattern:
  * [ 2: 0]  port 0
-- 
2.48.1


