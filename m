Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9AAC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/n2TjI2M2VtBMHZFJp0/mcf13FR0dQEfPH18lq5S60=; b=U7MllGD+2jkfXiBjj2aU+i8xLa
	6xM4PHYIKbeEXUZhLE5aqHT3t/+oRTMwD6hzjNJfJ9iMtSIRcS8Ei+vWtmMuMu+icow10H/M5Ry/n
	Lc8s3kgtLtZ1uGLwFV0pg3286qKBuQJBFZdkmko220Yl7Z/SFrl2MQHd6bPhNqbJypvc7FNOLGSkk
	zkvazdFjYlcFX/eSz9p2dxS2h2zp2634cJq+3ZrMCYYldP/JrKxQNlk4B2/vW6L2r/WYXdVZ+1HoI
	iMtYKkiwTSchxLWIpPFvvOaqj3Y1/99599tj2P+QzGfYzHHuR5octRuz9WJM4JC+KSjl5KbYrwYq6
	kB1vzJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25s0-00000003Zwa-2atQ;
	Tue, 08 Apr 2025 10:07:52 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25d1-00000003W6w-3Ge2;
	Tue, 08 Apr 2025 09:52:24 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4168226f8f.3;
        Tue, 08 Apr 2025 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105942; x=1744710742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/n2TjI2M2VtBMHZFJp0/mcf13FR0dQEfPH18lq5S60=;
        b=lc/WcfDCZsHivDzGTQJQzr6QIOmzDFttSSqRatR+StBnk3ALayOnJy5ZXOO3SDmKp0
         17dFa6GRbfO26aSRpJx5Sqtq0MwWVueZyIcmXaNv3SGCXFKJcP/6D7TFlHPLZZQF2C7N
         UbJ1pC41KI4ci0uOnrHykWRr+I4hrHDpOLSqGO/ZSsp6htq1ZaIonVOpSHwtxOpgzzo9
         tWiJ+0jtP3cMmz2F9799pcRwov1QYwkU2Jd+DN2QqNKV6eAHNPX6WeY6S24QXwHQ2m6i
         H1566zpl0YXbZZIv59w4abxuNLUH11JZ4fHhivNq79mROQFSUpPXUya9dhqZKF7mGeSD
         ijCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105942; x=1744710742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/n2TjI2M2VtBMHZFJp0/mcf13FR0dQEfPH18lq5S60=;
        b=m+iYCctrzFf6vw9Cp0O1IDWVcZnk/YthPKc4COcQfaRzZlU1xSEKmr9KiWdSAcPUZW
         Gsl4Di4pvuHaxBX3/8x1tEzftVkM2v7DFkLE7qQjERv9yBNYAmpV37D7yP/pfS+fzAFw
         FcvMUXtZQ4de5H75yLX/HS3XU23EPDhGPs3L2m7ZZHprhCt9yZ3+hEvA/D2xwphV8Er5
         kKh+taEAeJGJtlXe/9uIowaRfGbmV1i0gI38O4hO+rHIXbVrDsuKTOaSMZsZyEPjj97j
         rtiEyvr8pEnTFHucoN+ZYtxI2+6WoRWCqvBoB9xCnIwFf6R2E/kti/2tqlBInTSnpvhH
         I5lw==
X-Forwarded-Encrypted: i=1; AJvYcCVqNprbzTdzbVkr/6dAqkYAB+Y5tPBEO8jyCuxEQkQiTV9ZtIdFpdlVdPnmSy/r1T80BNv88trckRekDCsZPBOc@lists.infradead.org, AJvYcCXkavXEurl9EV9aLE2YNyl4sjdST6k1hzb4jIjwlWHQZzcssRUTVfYDmrzLLe/YsZ5xKOijLyLNcVXvdO7bRXQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxokLY+FRnwM4Zvhj9hdXaL8zw7g1M+W0433SpuBy5dglAVgcJl
	OO9bBOtU6OFPyfnnDCDg0LGMC1cnx5nisYjiBW21MaoNclHaInpE
X-Gm-Gg: ASbGnctM9z4UkhNQEqkAaHBCkKUWFjm3+c0tqSAWb916jHWVRubS/bVhWfj2ZBm1kIW
	2BkuNelhC/X6MQuaMc0lXWnP3fNjmfNUpMMsP8HwRcr8SZoKH8g7pePN9lAhQYtgCrYGbzeeWVR
	LIEHqQKNZWqjua8PY0wimu9Ks0Te5iy5KpfWOcR8Q5/5E1sb2FtuvSYszQ8Ks+B4u8gg8+5UNnf
	9vSH/cXQDhUidH160rlOwnXt/oUbi5IEHyXIqmnwnTZqquJxmC0/8UgaFtTrkk6Bm7mB35vDWvg
	onUobo8EaJlIcqXAoXCnDwJc8LX4AdbobzEB276AKHpJNNAH6ZzN/3yJ9qTybNBZPs9tz4MyyRp
	NC5evNO3vtrZgAQ==
X-Google-Smtp-Source: AGHT+IH3R7VcjDJQU/ug/E8DovK1LG8xkzqoBKVcedT+o9lyrCg3IyGaPsRO5doikyNGRfNi09b8bQ==
X-Received: by 2002:a05:6000:440e:b0:397:3900:ef83 with SMTP id ffacd0b85a97d-39cba93cfb8mr8318008f8f.32.1744105941913;
        Tue, 08 Apr 2025 02:52:21 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:21 -0700 (PDT)
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
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 07/16] net: mdio: regmap: add support for C45 read/write
Date: Tue,  8 Apr 2025 11:51:14 +0200
Message-ID: <20250408095139.51659-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025223_823023_E71BF667 
X-CRM114-Status: GOOD (  25.15  )
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

Add support for C45 read/write for mdio regmap. This can be done
by enabling the support_encoded_addr bool in mdio regmap config and by
using the new API devm_mdio_regmap_init to init a regmap.

To support C45, additional info needs to be appended to the regmap
address passed to regmap OPs.

The logic applied to the regmap address value:
- First the regnum value (20, 16)
- Second the devnum value (25, 21)
- A bit to signal if it's C45 (26)

devm_mdio_regmap_init MUST be used to register a regmap for this to
correctly handle internally the encode/decode of the address.

Drivers needs to define a mdio_regmap_init_config where an optional regmap
name can be defined and MUST define C22 OPs (mdio_read/write).
To support C45 operation also C45 OPs (mdio_read/write_c45).

The regmap from devm_mdio_regmap_init will internally decode the encoded
regmap address and extract the various info (addr, devnum if C45 and
regnum). It will then call the related OP and pass the extracted values to
the function.

Example for a C45 read operation:
- With an encoded address with C45 bit enabled, it will call the
  .mdio_read_c45 and addr, devnum and regnum will be passed.
  .mdio_read_c45 will then return the val and val will be stored in the
  regmap_read pointer and will return 0. If .mdio_read_c45 returns
  any error, then the regmap_read will return such error.

With support_encoded_addr enabled, also C22 will encode the address in
the regmap address and .mdio_read/write will called accordingly similar
to C45 operation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/mdio-regmap.c   | 170 +++++++++++++++++++++++++++++--
 include/linux/mdio/mdio-regmap.h |  14 +++
 2 files changed, 176 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mdio/mdio-regmap.c b/drivers/net/mdio/mdio-regmap.c
index 810ba0a736f0..f263e4ae2477 100644
--- a/drivers/net/mdio/mdio-regmap.c
+++ b/drivers/net/mdio/mdio-regmap.c
@@ -15,22 +15,72 @@
 #include <linux/regmap.h>
 #include <linux/mdio/mdio-regmap.h>
 
+#define MDIO_REGMAP_C45			BIT(26)
+#define MDIO_REGMAP_ADDR		GENMASK(25, 21)
+#define MDIO_REGMAP_DEVNUM		GENMASK(20, 16)
+#define MDIO_REGMAP_REGNUM		GENMASK(15, 0)
+
 #define DRV_NAME "mdio-regmap"
 
 struct mdio_regmap_priv {
+	void *ctx;
+
+	const struct mdio_regmap_init_config *config;
+};
+
+struct mdio_regmap_mii_priv {
 	struct regmap *regmap;
 	u32 valid_addr_mask;
+	bool encode_addr;
 };
 
-static int mdio_regmap_read_c22(struct mii_bus *bus, int addr, int regnum)
+static int mdio_regmap_mii_read_c22(struct mii_bus *bus, int addr, int regnum)
+{
+	struct mdio_regmap_mii_priv *ctx = bus->priv;
+	unsigned int val;
+	int ret;
+
+	if (!(ctx->valid_addr_mask & BIT(addr)))
+		return -ENODEV;
+
+	if (ctx->encode_addr)
+		regnum |= FIELD_PREP(MDIO_REGMAP_ADDR, addr);
+
+	ret = regmap_read(ctx->regmap, regnum, &val);
+	if (ret < 0)
+		return ret;
+
+	return val;
+}
+
+static int mdio_regmap_mii_write_c22(struct mii_bus *bus, int addr, int regnum,
+				     u16 val)
 {
-	struct mdio_regmap_priv *ctx = bus->priv;
+	struct mdio_regmap_mii_priv *ctx = bus->priv;
+
+	if (!(ctx->valid_addr_mask & BIT(addr)))
+		return -ENODEV;
+
+	if (ctx->encode_addr)
+		regnum |= FIELD_PREP(MDIO_REGMAP_ADDR, addr);
+
+	return regmap_write(ctx->regmap, regnum, val);
+}
+
+static int mdio_regmap_mii_read_c45(struct mii_bus *bus, int addr, int devnum,
+				    int regnum)
+{
+	struct mdio_regmap_mii_priv *ctx = bus->priv;
 	unsigned int val;
 	int ret;
 
 	if (!(ctx->valid_addr_mask & BIT(addr)))
 		return -ENODEV;
 
+	regnum |= MDIO_REGMAP_C45;
+	regnum |= FIELD_PREP(MDIO_REGMAP_ADDR, addr);
+	regnum |= FIELD_PREP(MDIO_REGMAP_DEVNUM, devnum);
+
 	ret = regmap_read(ctx->regmap, regnum, &val);
 	if (ret < 0)
 		return ret;
@@ -38,21 +88,25 @@ static int mdio_regmap_read_c22(struct mii_bus *bus, int addr, int regnum)
 	return val;
 }
 
-static int mdio_regmap_write_c22(struct mii_bus *bus, int addr, int regnum,
-				 u16 val)
+static int mdio_regmap_mii_write_c45(struct mii_bus *bus, int addr, int devnum,
+				     int regnum, u16 val)
 {
-	struct mdio_regmap_priv *ctx = bus->priv;
+	struct mdio_regmap_mii_priv *ctx = bus->priv;
 
 	if (!(ctx->valid_addr_mask & BIT(addr)))
 		return -ENODEV;
 
+	regnum |= MDIO_REGMAP_C45;
+	regnum |= FIELD_PREP(MDIO_REGMAP_ADDR, addr);
+	regnum |= FIELD_PREP(MDIO_REGMAP_DEVNUM, devnum);
+
 	return regmap_write(ctx->regmap, regnum, val);
 }
 
 struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 					  const struct mdio_regmap_config *config)
 {
-	struct mdio_regmap_priv *mr;
+	struct mdio_regmap_mii_priv *mr;
 	struct mii_bus *mii;
 	int rc;
 
@@ -66,12 +120,17 @@ struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 	mr = mii->priv;
 	mr->regmap = config->regmap;
 	mr->valid_addr_mask = BIT(config->valid_addr);
+	mr->encode_addr = config->support_encoded_addr;
 
 	mii->name = DRV_NAME;
 	strscpy(mii->id, config->name, MII_BUS_ID_SIZE);
 	mii->parent = config->parent;
-	mii->read = mdio_regmap_read_c22;
-	mii->write = mdio_regmap_write_c22;
+	mii->read = mdio_regmap_mii_read_c22;
+	mii->write = mdio_regmap_mii_write_c22;
+	if (config->support_encoded_addr) {
+		mii->read_c45 = mdio_regmap_mii_read_c45;
+		mii->write_c45 = mdio_regmap_mii_write_c45;
+	}
 
 	if (config->autoscan)
 		mii->phy_mask = ~mr->valid_addr_mask;
@@ -88,6 +147,101 @@ struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_mdio_regmap_register);
 
+static int mdio_regmap_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	const struct mdio_regmap_init_config *config;
+	struct mdio_regmap_priv *priv = context;
+	int addr, regnum;
+	int ret;
+
+	config = priv->config;
+
+	addr = FIELD_GET(MDIO_REGMAP_ADDR, reg);
+	regnum = FIELD_GET(MDIO_REGMAP_REGNUM, reg);
+
+	if (reg & MDIO_REGMAP_C45) {
+		int devnum;
+
+		if (!config->mdio_write_c45)
+			return -EOPNOTSUPP;
+
+		devnum = FIELD_GET(MDIO_REGMAP_DEVNUM, reg);
+		ret = config->mdio_read_c45(priv->ctx, addr, devnum, regnum);
+	} else {
+		ret = config->mdio_read(priv->ctx, addr, regnum);
+	}
+
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
+	return 0;
+}
+
+static int mdio_regmap_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	const struct mdio_regmap_init_config *config;
+	struct mdio_regmap_priv *priv = context;
+	int addr, regnum;
+
+	config = priv->config;
+
+	addr = FIELD_GET(MDIO_REGMAP_ADDR, reg);
+	regnum = FIELD_GET(MDIO_REGMAP_REGNUM, reg);
+
+	if (reg & MDIO_REGMAP_C45) {
+		int devnum;
+
+		if (!config->mdio_write_c45)
+			return -EOPNOTSUPP;
+
+		devnum = FIELD_GET(MDIO_REGMAP_DEVNUM, reg);
+		return config->mdio_write_c45(priv->ctx, addr, devnum, regnum, val);
+	}
+
+	return config->mdio_write(priv->ctx, addr, regnum, val);
+}
+
+static const struct regmap_config mdio_regmap_default_config = {
+	.reg_bits = 26,
+	.val_bits = 16,
+	.reg_stride = 1,
+	.max_register = MDIO_REGMAP_C45 | MDIO_REGMAP_ADDR |
+			MDIO_REGMAP_DEVNUM | MDIO_REGMAP_REGNUM,
+	.reg_read = mdio_regmap_reg_read,
+	.reg_write = mdio_regmap_reg_write,
+	/* Locking MUST be handled in mdio_write/read(_c45) */
+	.disable_locking = true,
+};
+
+struct regmap *devm_mdio_regmap_init(struct device *dev, void *priv,
+				     const struct mdio_regmap_init_config *config)
+{
+	struct mdio_regmap_priv *mdio_regmap_priv;
+	struct regmap_config regmap_config;
+
+	/* Validate config */
+	if (!config->mdio_read || !config->mdio_write) {
+		dev_err(dev, ".mdio_read and .mdio_write MUST be defined in config\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	mdio_regmap_priv = devm_kzalloc(dev, sizeof(*mdio_regmap_priv),
+					GFP_KERNEL);
+	if (!mdio_regmap_priv)
+		return ERR_PTR(-ENOMEM);
+
+	memcpy(&regmap_config, &mdio_regmap_default_config, sizeof(regmap_config));
+	regmap_config.name = config->name;
+
+	mdio_regmap_priv->ctx = priv;
+	mdio_regmap_priv->config = config;
+
+	return devm_regmap_init(dev, NULL, mdio_regmap_priv,
+				&regmap_config);
+}
+EXPORT_SYMBOL_GPL(devm_mdio_regmap_init);
+
 MODULE_DESCRIPTION("MDIO API over regmap");
 MODULE_AUTHOR("Maxime Chevallier <maxime.chevallier@bootlin.com>");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mdio/mdio-regmap.h b/include/linux/mdio/mdio-regmap.h
index 679d9069846b..504fa2046043 100644
--- a/include/linux/mdio/mdio-regmap.h
+++ b/include/linux/mdio/mdio-regmap.h
@@ -17,10 +17,24 @@ struct mdio_regmap_config {
 	struct regmap *regmap;
 	char name[MII_BUS_ID_SIZE];
 	u8 valid_addr;
+	/* devm_mdio_regmap_init is required with this enabled */
+	bool support_encoded_addr;
 	bool autoscan;
 };
 
 struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 					  const struct mdio_regmap_config *config);
 
+struct mdio_regmap_init_config {
+	const char *name;
+
+	int (*mdio_read)(void *ctx, int addr, int regnum);
+	int (*mdio_write)(void *ctx, int addr, int regnum, u16 val);
+	int (*mdio_read_c45)(void *ctx, int addr, int devnum, int regnum);
+	int (*mdio_write_c45)(void *ctx, int addr, int devnum, int regnum, u16 val);
+};
+
+struct regmap *devm_mdio_regmap_init(struct device *dev, void *priv,
+				     const struct mdio_regmap_init_config *config);
+
 #endif
-- 
2.48.1


