Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300EDC54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYjaVLSyECwhZTYecx4FhraqJDr8W4MzrHZKpg3sjsI=; b=nZ4fGiF2O3KRhxTijEjpg+Nq9l
	kGaJ6OMJ+eIZGfexeBR5FY57geu1Fk3ykYrOjXzLdmNCwoNPqCffh1nwGh2KFX+8ds1nyG8WonuwO
	c5GTvVZVZCMkASW1ro4Ry+LO2vyG54C6j28cqBOS2nMSXizd02r/3F0B/+UmTv/TA2nVmBKLqNQme
	GjctECuy6eVo67PfBSYRKCSAEmbc0Hao/RKMPsm/JyWSESUkidedh06vByiuNpojJDZYoFqv0ErDJ
	+pj74OGNOeKxcCG+1rIaWwbZa2HVJkrB5ll6gazxBEpscDaGHLpACuGvbu7eKRSFx9rklr1guoVwA
	+dbF+4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok4M-00000005iSl-1Th3;
	Tue, 28 Jul 2026 15:50:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3l-00000005hx4-0l6l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:49:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49550ec592cso7382475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253775; x=1785858575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SYjaVLSyECwhZTYecx4FhraqJDr8W4MzrHZKpg3sjsI=;
        b=rC7xzBpmVoUiIpa2+1WnCxLxJu4WyN+yxLmqsgYd+9yTXV+hjRfI6QeOfM4KkD5FNp
         1talmD8Bxv0whvwaVRGltOrSzfKVctSI6jmPtc+VrzpVK1GiEEAbDcn7TGMnAIge3imO
         M8qRLpE6jdioIPrMxGB9iR1zfCvQh1jXrVKB88tmtcZLmvEOHA4vjB5s8F7aGp1a9UAz
         EVNWDb6KiRcDKAL39tRLwA7mdXo0SZL0qm3b+V2lFQ3PowKv95t3D4sXhEFF27pjHL0c
         htcpXWeSeMY3T+sOoyX4mOHPmbwn8ar4iC1jIp8dOoFK20lF0LixeVVysEF7sbxBGWn1
         cl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253775; x=1785858575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SYjaVLSyECwhZTYecx4FhraqJDr8W4MzrHZKpg3sjsI=;
        b=Osze0kW08249K5OnlIdQ3girfmRJrtfbHTIZgbcU4OpxYIE2QEORqjd6uqYaabDIQa
         GkiBB/GfSpG1JpZ37NOzj5sV/qVpVuulB38eIZFGaFiPa3M1y/2U3klvd7KadNzQI+bT
         lAWEhGlPvwbtMpBcm1OtlOT8TO6ltK4IiK7eD9ezuR08HdxlRuFiMeTgnnofBcfCziEV
         eiIkcekm7aI2ogdeMyRSjk0kYMVhhDC4nY4qWIWmOp66axkmic7GlXDWdeXi89NK7THB
         OA7bvgtKbzHalwuVcQ7oTOwkqCe9YkwCiuavzJEQWKnfsVnDtFh1XjH7660s+MoZzhsB
         sLVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdAjvYW4KtGlJ94/ZlpqjoW6shdmGmWBjPp9e9uAoLdzyyI2MUZ3TOI+NKofMD6nDKt9/CBlYmA1UXR2VoO+i+@lists.infradead.org
X-Gm-Message-State: AOJu0YyrSs7lPh5KbUVttPWomhEmHwvyb4qLcL2UtPT46IXoa/YwxEJs
	SLpS+uyQacCfegjoeqKeckHskqa9m2mONLWSnolwp06lWZ1eHIQM8Z/w
X-Gm-Gg: AR+sD12i1B4eAux6U3+LTJJ67WfjqwH8UpDCvhWhGxh/DriXPR+R0vH5FODNoqNb+nJ
	4ZAXaGNs+tqlCxv7r5NtMM+QfBaiMtfsB12H3t9l9TQOd1fjiX28vsokclsVYBDvZwEAnpbrAIp
	QQMwcUO8iL2wKxaFsjdiDwgE4f//E9SaTPGqXlMM+tRm4CBRDtMjmHwSseeF8Hv6caarVDdJ9Ku
	vFkyF29B8eTl7O+v1l3cGKsL9Knq04e86AxhQjNNE6//PAo3Dk+1F+WoFVMMHW5YArDcBnznt0y
	i7PeNsEwBFVIHnPkNnmkQ2SYTEjTZovXrFYOOwgxtjmHNBtmRwXy4++jOCAhZSYdZfrI+kB2HGR
	mJXK9bE9AXMEtbZPDMvJoWlEd1fsbNNtxDa8SCPO/iQIBb2TIB2N+qnX+WYDGH6mSLGnRlMTBzq
	7TGwDjxNfkDjG9yOXZmOQqM5Ubg3yU
X-Received: by 2002:a05:600c:4584:b0:495:501a:fcf8 with SMTP id 5b1f17b1804b1-496c6575c60mr30023435e9.9.1785253775035;
        Tue, 28 Jul 2026 08:49:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:34 -0700 (PDT)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v19 08/10] net: dsa: mt7530: move MDIO bus locking into regmap
Date: Tue, 28 Jul 2026 17:48:35 +0200
Message-ID: <20260728154846.1828945-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_084937_262651_1C2E0E85 
X-CRM114-Status: GOOD (  16.15  )
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

From: Daniel Golle <daniel@makrotopia.org>

The switch register regmap was created with .disable_locking = true,
relying on callers to manually lock the MDIO bus. Move the locking
into the regmap using .lock/.unlock callbacks, matching the PCS
regmaps that already do this. This allows any code path reaching the
regmap to be automatically protected.

With regmap handling bus locking, the manual mt7530_mutex_lock/unlock
wrappers in mt7530_write(), _mt7530_read(), mt7530_rmw() and
mt7530_port_change_mtu() become redundant and are removed.

The MT7531 indirect PHY access functions need serialization of their
multi-step register sequences, but no longer need to hold bus->mdio_lock
across the whole operation. Switch them to reg_mutex.

core_write()/core_rmw() are the only remaining callers of
mt7530_mutex_lock(). They access TRGMII core PHY registers via the
clause 22 MMD indirect protocol -- a separate register space that
bypasses regmap and needs manual bus->mdio_lock protection.

Generated using the following semantic patch:

// Remove mt7530_mutex_lock/unlock around single regmap-based calls.
@@
expression priv, reg, val;
@@
 {
-	mt7530_mutex_lock(priv);
-
 	mt7530_mii_write(priv, reg, val);
-
-	mt7530_mutex_unlock(priv);
 }

@@
expression priv, reg, mask, set;
@@
 {
-	mt7530_mutex_lock(priv);
-
 	regmap_update_bits(priv->regmap, reg, mask, set);
-
-	mt7530_mutex_unlock(priv);
 }

@@
expression p;
identifier val;
@@
 {
-	u32 val;
-	mt7530_mutex_lock(p->priv);
-	val = mt7530_mii_read(p->priv, p->reg);
-	mt7530_mutex_unlock(p->priv);
-	return val;
+	return mt7530_mii_read(p->priv, p->reg);
 }

@@
expression priv;
@@
-	mt7530_mutex_lock(priv);
 	val = mt7530_mii_read(priv, MT7530_GMACCR);
 	...
 	mt7530_mii_write(priv, MT7530_GMACCR, val);
-	mt7530_mutex_unlock(priv);

@@
expression priv, port;
@@
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
-	mt7530_mutex_lock(priv);
+	mutex_lock(&priv->reg_mutex);

@@
expression priv;
@@
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/mt7530-mdio.c |  9 ++++++---
 drivers/net/dsa/mt7530.c      | 38 +++++++++--------------------------
 2 files changed, 15 insertions(+), 32 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index 11ea924a9f35..f7c8eeb27211 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -141,12 +141,14 @@ static const struct regmap_config regmap_config = {
 	.val_bits = 32,
 	.reg_stride = 4,
 	.max_register = MT7530_CREV,
-	.disable_locking = true,
+	.lock = mt7530_mdio_regmap_lock,
+	.unlock = mt7530_mdio_regmap_unlock,
 };
 
 static int
 mt7530_probe(struct mdio_device *mdiodev)
 {
+	struct regmap_config rc = regmap_config;
 	struct mt7530_priv *priv;
 	struct device_node *dn;
 	int ret;
@@ -200,8 +202,9 @@ mt7530_probe(struct mdio_device *mdiodev)
 			return PTR_ERR(priv->io_pwr);
 	}
 
-	priv->regmap = devm_regmap_init(priv->dev, &mt7530_regmap_bus, priv,
-					&regmap_config);
+	rc.lock_arg = &priv->bus->mdio_lock;
+	priv->regmap = devm_regmap_init(priv->dev, &mt7530_regmap_bus,
+					priv, &rc);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3c2a3029b10c..5f56a423b147 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -184,11 +184,7 @@ mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
 static void
 mt7530_write(struct mt7530_priv *priv, u32 reg, u32 val)
 {
-	mt7530_mutex_lock(priv);
-
 	mt7530_mii_write(priv, reg, val);
-
-	mt7530_mutex_unlock(priv);
 }
 
 static u32
@@ -200,15 +196,7 @@ _mt7530_unlocked_read(struct mt7530_dummy_poll *p)
 static u32
 _mt7530_read(struct mt7530_dummy_poll *p)
 {
-	u32 val;
-
-	mt7530_mutex_lock(p->priv);
-
-	val = mt7530_mii_read(p->priv, p->reg);
-
-	mt7530_mutex_unlock(p->priv);
-
-	return val;
+	return mt7530_mii_read(p->priv, p->reg);
 }
 
 static u32
@@ -224,11 +212,7 @@ static void
 mt7530_rmw(struct mt7530_priv *priv, u32 reg,
 	   u32 mask, u32 set)
 {
-	mt7530_mutex_lock(priv);
-
 	regmap_update_bits(priv->regmap, reg, mask, set);
-
-	mt7530_mutex_unlock(priv);
 }
 
 static void
@@ -555,7 +539,7 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mt7530_mutex_lock(priv);
+	mutex_lock(&priv->reg_mutex);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
@@ -588,7 +572,7 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 
 	ret = val & MT7531_MDIO_RW_DATA_MASK;
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -603,7 +587,7 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mt7530_mutex_lock(priv);
+	mutex_lock(&priv->reg_mutex);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
@@ -635,7 +619,7 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 	}
 
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -649,7 +633,7 @@ mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mt7530_mutex_lock(priv);
+	mutex_lock(&priv->reg_mutex);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
@@ -672,7 +656,7 @@ mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 
 	ret = val & MT7531_MDIO_RW_DATA_MASK;
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -687,7 +671,7 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mt7530_mutex_lock(priv);
+	mutex_lock(&priv->reg_mutex);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, reg,
 				 !(reg & MT7531_PHY_ACS_ST), 20, 100000);
@@ -709,7 +693,7 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 	}
 
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -1444,8 +1428,6 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 	if (!dsa_is_cpu_port(ds, port))
 		return 0;
 
-	mt7530_mutex_lock(priv);
-
 	val = mt7530_mii_read(priv, MT7530_GMACCR);
 	val &= ~MAX_RX_PKT_LEN_MASK;
 
@@ -1465,8 +1447,6 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 
 	mt7530_mii_write(priv, MT7530_GMACCR, val);
 
-	mt7530_mutex_unlock(priv);
-
 	return 0;
 }
 
-- 
2.53.0


