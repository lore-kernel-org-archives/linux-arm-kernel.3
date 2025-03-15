Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A95C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/n2TjI2M2VtBMHZFJp0/mcf13FR0dQEfPH18lq5S60=; b=KSp6oO9hBr4DfXk15rCKWsF+jm
	fdaqMogCBbOEgnpT242hs1wYdh56RNTsAKuY5/TYtOdFFiwlCL2YLtQw5MdIjXjDo9ddaCDotc5I+
	uDnwwmJSGG5h3xLn2yufz09Jyv/xwmyVtaWncbwG+HHBe7LWy93k1BcWWKBMoCjMVGPnaCgQVIbbE
	C/gGNeITmtm6wMboe6q75OWDwsz6MIOqg8deC8jvWLseSn1yRMSoh/VlMq+CkILoFlKPbKdlTmAUp
	R4B/cpqEfv8TcMfbkqb9yrfo1tZ9HdBOt3W67xJ2n9+kX/VSCz9u3XYGux2WBPmMi5tARLISjdtQS
	jd2AXxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTu8-0000000GYsv-38fX;
	Sat, 15 Mar 2025 15:58:28 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTgx-0000000GX2k-1AWX;
	Sat, 15 Mar 2025 15:44:52 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so1806531f8f.2;
        Sat, 15 Mar 2025 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742053489; x=1742658289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/n2TjI2M2VtBMHZFJp0/mcf13FR0dQEfPH18lq5S60=;
        b=hQPdayeElt5qFgJ7ycqKO6n7j+6SPns6+7GDZ9Du4gUw9EUwxWCW3Aves2NeKSpE6s
         V/M4br4vpyZWXLsuIABAmKeIEb1i4bgIHzqNwlELiZsDeqySmRgZ0eudCXEOWF2Js+Xj
         xAAKEWTcmZuyfMO/7cUKRk4OIl8938azd191imPpAh/cGnvVhaNf0Vd1fdDeJmKMWjug
         bNAN37D9ZqUtJMz4fKLxiB4fnx0D9Nzi3bxlEYwoNaCY5cSI/ERYB9Hb6jtS+ZfIqllp
         1GM1Z6EFLRBEkGcnB+ih/Kw0WCDew4vnc9zXMdxMYkQl0aBHcpYF7RnKGKN125xN3Urj
         ktag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742053489; x=1742658289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/n2TjI2M2VtBMHZFJp0/mcf13FR0dQEfPH18lq5S60=;
        b=NGWWAE6ORPeSJK+qk8IMno2tUlGyRmsIrRUBLnik5AbzNB5qERaGB8udH2bgFyIiMO
         RyNNX3F4n2hwepNC6fGjlagMwFVOGlsKmPblnvn8DTwlGubydXKfno2Bre5CGZOygNd5
         PXVxTQ9ZjR5mZsYes8JjSvpUCmQcFX7yRNX/jxTBlcQBYUkkBV84jYdfOH2xpksLhyMQ
         1wASn7Cc/x3HdMamhUIGHXhZsHASLl/ZlyFxXOt/CkKyxAi9NgHNo10mkEaPjAIMo3NA
         Y+g21LaNblrnHf802C1yIFih3YxBcO/vMgk/R2O/hxhHhz7SUyzZc0sSrEC+2yOYmH6i
         2xEg==
X-Forwarded-Encrypted: i=1; AJvYcCUNB7yIQ19eOEJLhHPMB3f/luVDkXTRB1/jZ6i715Nx6A+ubps/47JBwMLciL8kDnRKdgEK5Ou8LrGqkjHvQPM=@lists.infradead.org, AJvYcCXiQaU/vnJ8zHGAr7Twl07bvv66411HGEq3Fivv1TW+h9k8NS4e5OaGgc1gzxv8v+91OLhFyV7rNq4a1IZa2DlJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz/sd1JM+1eu5rQPcCISzcJekccpoDIbhYEt1GB8LXQmel0sB9
	dzKhhRrYO0AUNDqEoUBP+qkAqHZQPsdOr/Zj7fL6QkrC16ygVEoI
X-Gm-Gg: ASbGnctxDb+KTtlpAMu6jFwKRj+q3RO5ZqHwVNXEJCZAYFhZeTLkx7oxCwgrIKivqkU
	nxPLIPA0xLBekVDdHwM/4uYhhwzlKF7+kiB2LmGZlgbDCcu+/X4jsRPqN5NQzo893rSPc3IdILu
	spsVh5kVR9fdSMj0SvAacqW01JCgWXwRoyD0WDRqug7zqP6t+zaeluJN8liT6u3Q3a9iNFrnjlz
	S7qse3K/ngm8+g2pqcEAnllaRVx2PPEEfatGOVY35piknbniL7OKtFOVYiI7P05MSi+zOC1N3ei
	9ZVEhg36DmOLmysdjqGQxcMJgYkH7LebRB6Bnt9EiSp/BpCczyrLaliu3VTerVWqw/ZIU+OGVxZ
	XAdgC9BxWXFHVng==
X-Google-Smtp-Source: AGHT+IFfi4s8YK/7ZOy1tENtskKAFtjhxc2HmKBHt4o16W7ijUbFjzkhItG3iYRAjb22D/PG7p8FBg==
X-Received: by 2002:a05:6000:1564:b0:38f:28a1:501e with SMTP id ffacd0b85a97d-3971d03df3dmr8216932f8f.8.1742053489365;
        Sat, 15 Mar 2025 08:44:49 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm53464195e9.11.2025.03.15.08.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:44:49 -0700 (PDT)
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
Subject: [net-next PATCH v13 07/14] net: mdio: regmap: add support for C45 read/write
Date: Sat, 15 Mar 2025 16:43:47 +0100
Message-ID: <20250315154407.26304-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154407.26304-1-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084451_365457_096F3F01 
X-CRM114-Status: GOOD (  24.28  )
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


