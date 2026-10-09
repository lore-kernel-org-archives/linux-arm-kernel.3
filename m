Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3A5CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1AlJviyEsn0JwTEbIVJIrAaLLKDRuGfTWO+8DDkJVk=; b=yFAVmPT8MKx5tnuns3zrVWgqu5
	f6wUJBMtcZUVcS///bErAZkhejvS3rlPV7lL4M/MMr9PEbvVS35YJhMVPNl/4CdIshZi8ClEMCsrj
	uZ5EnZdkFrZwwgZZD5hsy8dolWLoN97RTBQWeFfyA+1OXvUOzvqw+9fYcKvqunVU4ZbXfDZJf9nqS
	PzIXFuJmY3a8qRiM/k02Ouxvq3rrlKjhP1JcYcWS35jhab7j4oVOmRrWoNvaThnr9hRopsFS+mwAD
	Fhx1o/sz1DF0/UYhgFqpAIEXnNhMJ+Y2hoyKf4tzpHqUh2tnsXNEvCGwM0Oj2n9iy1pnVTXc5u3tD
	CqLOKJ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBz-00000006caZ-34R2;
	Fri, 09 Oct 2026 16:11:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBt-00000006cSl-1rRh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 16:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=U1AlJviyEsn0JwTEbIVJIrAaLLKDRuGfTWO+8DDkJVk=; b=X/crjUJ5ST79MS5s8HJ9yZyWIj
	P4XspI8V2yS7hnWydr+AnU6Xv62JMJj53fd8nTAagfGWEkj95UMMjvb54c2dKwFUw7kzJ9YVMh6Xd
	rPYYir4rSukjtfrirpHG7wNn79CfH0QJ+Y2v5TBKU0nyPrANprm/Zk0WtjZvhabA1DZ41gsyOIkom
	uiAY7uC/ACC0qd+Lf81ajVjTuZ4CxxZErKBqdhAsaJHrDMdxbPBZcMhnBxPxC+K8lnVtU9ECcePRm
	d2eejFYIaYuCK/Mu+3Ax1HQeLsOFVyP2jjirF/VI00EE0YlpO5TcIUf899bLlZgQDqmJlfCkc17nK
	OuyZ4Y2A==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFDBq-0000000BOm9-1wi8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:11:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48c5358fc28so4244965f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562281; x=1792167081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1AlJviyEsn0JwTEbIVJIrAaLLKDRuGfTWO+8DDkJVk=;
        b=W5uKHUxj7aNxbM6Pd8sQRRPFTEf/LCqFfwXgvo+hTbyYWIhFENPrYfIy0gPZrC2CF1
         G+CQ9u1QtYJtECxvURmhICChSfVasQU/drGJiKLTpSywlSdD1RKbJW/ZWqAXMfBbAj6/
         vnkY2xzOrqXDqlbwjOi6ov1UF+bXRFJtnbDDOwlNBmtAldhj/3aliSFGC3+4ZWPiPDEc
         x4CpzCVouWi9IzZ+g36Ea6GP9MVbIifgqjV013iVTRW5rk4PvKV1pvmmznrOMnDoFZpx
         g0JIEkORz9JAeSZHHMpV1IvQjsAEABWHRF2769+mEmqOqbISctrz1lw2PSpu/0F6KUAa
         6TjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562281; x=1792167081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1AlJviyEsn0JwTEbIVJIrAaLLKDRuGfTWO+8DDkJVk=;
        b=aQmaUUbgfsaDV8BvHQGGiaTkVQ1Emu4k3KxKrGLdET4Yq9W2/cUHoujvJr7k6XrCsJ
         L/2QxGI+x1sw9aKguF811nabA+9hfYCX7f/lpycTUPY0W2QbuZJ3SJSyoA6XBo4n72Tt
         8zkPZ9/Btxu2aoRiGU5uOApLvWibkCwQzRZfe4eWnem5DdXpabdnfLhVMxK7bRyU8x9H
         RUENEVu4DP5czlI17BIenDk252SbLYl2XECkiQcKCOGk+2xQSk2qoW6P9gP8499M/i1s
         fOr6OWWK3NwCD+/yuhJgwQvLxOT74jaGf8Pkj/JzNhBZbOhe7fKFIrDU/BQ6FOWreQgp
         fzig==
X-Forwarded-Encrypted: i=1; AKwUvBxJXzEgzxpcG93hVs33QWHtK5tXn8LAp2L+I27JzKRlWbyaj6MVEG6IOmliQEzjQ5Z1pjDD1JUVHL15fOKefuX0@lists.infradead.org
X-Gm-Message-State: AFq9FYIxfmFMd3ek6HZqvmcKcBE2IvTfjwm9Oii+QSiMwvV9mhls+/As
	bLrix+/2Uu8TS4XMc1C2kknLvBQLAVzb4WX1x7GlT2rXOM+b49Ch9TmS
X-Gm-Gg: AYBFou2LgUGtlSK7lgmnsI81bmjPag6NnxllDedARDgdAnLF/93z22EuNQzjmlUgNUc
	z13bfNgoAWChuLPJ9qgTQfy8HgBz3m8mm6r0Gt1sToUgENrmzOAGJet3M+bHMw0rD//d7CSTpis
	ONyDGrOwgpAfej0KlxUsrBhL2r0CrR1uxbHbahCeukkV3hdX5RwuIaxRpBoUTrSUuBgUUx64sNw
	PK9dafQyW390P8ZLbM/2dN/J0wIUqZ0KV8rWJCQcpKnFEBCPaAZUXMY9UZ3pB2aIGjfeQ7shY3l
	Ybfy9ldaBAuNlVZQbgX88fD8/pRISHKfR4v5xnRcFirhhmcdnItjvaIMQWtU4H0otfsvYCoOrGy
	O1El+5U6N2DtZMI7o1bL4Bb2WA6UZewt7OOmtIypSQJyvm24B9yRDgTmIJUAc8F3RrMkzzJELbW
	AU5omWPZhtRyzRKbvLwFxDK0Yn/EdRtrIqeO0GY7QyLveXKAcrkXM1pcDqZWPO/Vjqz5YtKGbk9
	rE/uFsyPYwSibj+/wicGpiJa24MVRa/guywYdjsRfCBDCiLWFp3vw0LP/7nNGwcSqT2kQSYCjJZ
	fCrfbTK7kpV3o9gkCg==
X-Received: by 2002:a05:6000:4811:b0:488:7da0:fedb with SMTP id ffacd0b85a97d-48dbace3b1fmr4014645f8f.40.1791562281084;
        Fri, 09 Oct 2026 09:11:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:20 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v25 05/10] net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY
Date: Fri,  9 Oct 2026 18:10:50 +0200
Message-ID: <20261009161102.38961-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_171122_605850_7D7E95F1 
X-CRM114-Status: GOOD (  26.18  )
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

Add support for Airoha AN8855 Internal Switch Gigabit PHY.

This is a simple PHY driver to configure and calibrate the PHY for the
AN8855 Switch with the use of NVMEM cells.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/Kconfig      |   6 +
 drivers/net/phy/Makefile     |   1 +
 drivers/net/phy/air_an8855.c | 275 +++++++++++++++++++++++++++++++++++
 3 files changed, 282 insertions(+)
 create mode 100644 drivers/net/phy/air_an8855.c

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index d3835597e379..eca2ce135c86 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -96,6 +96,12 @@ config AIR_AN8801_PHY
 	help
 	  Currently supports the Airoha AN8801R PHY.
 
+config AIR_AN8855_PHY
+	tristate "Airoha AN8855 Internal Gigabit PHY"
+	depends on NVMEM || !NVMEM
+	help
+	  Currently supports the internal Airoha AN8855 Switch PHY.
+
 config AIR_EN8811H_PHY
 	tristate "Airoha EN8811H 2.5 Gigabit PHY"
 	select AIR_NET_PHYLIB
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 579066a638f0..d5c633db0742 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_ADIN_PHY)		+= adin.o
 obj-$(CONFIG_ADIN1100_PHY)	+= adin1100.o
 obj-$(CONFIG_ADIN1140_PHY)	+= adin1140-phy.o
 obj-$(CONFIG_AIR_AN8801_PHY)	+= air_an8801.o
+obj-$(CONFIG_AIR_AN8855_PHY)	+= air_an8855.o
 obj-$(CONFIG_AIR_EN8811H_PHY)   += air_en8811h.o
 obj-$(CONFIG_AIR_NET_PHYLIB)	+= air_phy_lib.o
 obj-$(CONFIG_AMD_PHY)		+= amd.o
diff --git a/drivers/net/phy/air_an8855.c b/drivers/net/phy/air_an8855.c
new file mode 100644
index 000000000000..bc22256fd5f9
--- /dev/null
+++ b/drivers/net/phy/air_an8855.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2024 Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+
+#define AN8855_PHY_SELECT_PAGE			0x1f
+#define   AN8855_PHY_PAGE			GENMASK(2, 0)
+#define   AN8855_PHY_PAGE_STANDARD		FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x0)
+#define   AN8855_PHY_PAGE_EXTENDED_1		FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x1)
+
+/* MII Registers Page 1 */
+#define AN8855_PHY_EXT_REG_14			0x14
+#define   AN8855_PHY_EN_DOWN_SHIFT		BIT(4)
+
+/* R50 Calibration regs in MDIO_MMD_VEND1 */
+#define AN8855_PHY_R50OHM_RSEL_TX_AB		0x174
+#define AN8855_PHY_R50OHM_RSEL_TX_A_EN		BIT(15)
+#define AN8855_PHY_R50OHM_RSEL_TX_A		GENMASK(14, 8)
+#define AN8855_PHY_R50OHM_RSEL_TX_B_EN		BIT(7)
+#define AN8855_PHY_R50OHM_RSEL_TX_B		GENMASK(6, 0)
+#define AN8855_PHY_R50OHM_RSEL_TX_CD		0x175
+#define AN8855_PHY_R50OHM_RSEL_TX_C_EN		BIT(15)
+#define AN8855_PHY_R50OHM_RSEL_TX_C		GENMASK(14, 8)
+#define AN8855_PHY_R50OHM_RSEL_TX_D_EN		BIT(7)
+#define AN8855_PHY_R50OHM_RSEL_TX_D		GENMASK(6, 0)
+
+#define AN8855_SWITCH_EFUSE_R50O		GENMASK(30, 24)
+
+/* PHY TX PAIR DELAY SELECT Register */
+#define AN8855_PHY_TX_PAIR_DLY_SEL_GBE		0x013
+#define   AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_A_GBE GENMASK(14, 12)
+#define   AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_B_GBE GENMASK(10, 8)
+#define   AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_C_GBE GENMASK(6, 4)
+#define   AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_D_GBE GENMASK(2, 0)
+/* PHY ADC Register */
+#define AN8855_PHY_RXADC_CTRL			0x0d8
+#define   AN8855_PHY_RG_AD_SAMPLE_PHSEL_A	BIT(12)
+#define   AN8855_PHY_RG_AD_SAMPLE_PHSEL_B	BIT(8)
+#define   AN8855_PHY_RG_AD_SAMPLE_PHSEL_C	BIT(4)
+#define   AN8855_PHY_RG_AD_SAMPLE_PHSEL_D	BIT(0)
+#define AN8855_PHY_RXADC_REV_0			0x0d9
+#define   AN8855_PHY_RG_AD_RESERVE0_A		GENMASK(15, 8)
+#define   AN8855_PHY_RG_AD_RESERVE0_B		GENMASK(7, 0)
+#define AN8855_PHY_RXADC_REV_1			0x0da
+#define   AN8855_PHY_RG_AD_RESERVE0_C		GENMASK(15, 8)
+#define   AN8855_PHY_RG_AD_RESERVE0_D		GENMASK(7, 0)
+
+#define AN8855_PHY_ID				0xc0ff0410
+
+struct air_an8855_priv {
+	bool needs_calibration;
+	u8 calibration_data[4];
+};
+
+static const u8 dsa_r50ohm_table[] = {
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
+	127, 127, 127, 127, 127, 127, 127, 126, 122, 117,
+	112, 109, 104, 101,  97,  94,  90,  88,  84,  80,
+	78,  74,  72,  68,  66,  64,  61,  58,  56,  53,
+	51,  48,  47,  44,  42,  40,  38,  36,  34,  32,
+	31,  28,  27,  24,  24,  22,  20,  18,  16,  16,
+	14,  12,  11,   9
+};
+
+static int an8855_get_r50ohm_val(struct device *dev, const char *calib_name,
+				 u8 *dest)
+{
+	u32 shift_sel, val;
+	int ret;
+	int i;
+
+	ret = nvmem_cell_read_u32(dev, calib_name, &val);
+	if (ret)
+		return ret;
+
+	shift_sel = FIELD_GET(AN8855_SWITCH_EFUSE_R50O, val);
+	for (i = 0; i < ARRAY_SIZE(dsa_r50ohm_table); i++)
+		if (dsa_r50ohm_table[i] == shift_sel)
+			break;
+
+	if (i < 8 || i >= ARRAY_SIZE(dsa_r50ohm_table))
+		*dest = dsa_r50ohm_table[25];
+	else
+		*dest = dsa_r50ohm_table[i - 8];
+
+	return 0;
+}
+
+static int an8855_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct air_an8855_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->needs_calibration = of_property_present(dev->of_node,
+						      "nvmem-cells");
+
+	if (priv->needs_calibration) {
+		int ret;
+
+		ret = an8855_get_r50ohm_val(dev, "tx_a", &priv->calibration_data[0]);
+		if (ret)
+			return ret;
+
+		ret = an8855_get_r50ohm_val(dev, "tx_b", &priv->calibration_data[1]);
+		if (ret)
+			return ret;
+
+		ret = an8855_get_r50ohm_val(dev, "tx_c", &priv->calibration_data[2]);
+		if (ret)
+			return ret;
+
+		ret = an8855_get_r50ohm_val(dev, "tx_d", &priv->calibration_data[3]);
+		if (ret)
+			return ret;
+	}
+
+	phydev->priv = priv;
+
+	return 0;
+}
+
+static int an8855_get_downshift(struct phy_device *phydev, u8 *data)
+{
+	int val;
+
+	val = phy_read_paged(phydev, AN8855_PHY_PAGE_EXTENDED_1, AN8855_PHY_EXT_REG_14);
+	if (val < 0)
+		return val;
+
+	*data = val & AN8855_PHY_EN_DOWN_SHIFT ? DOWNSHIFT_DEV_DEFAULT_COUNT :
+						 DOWNSHIFT_DEV_DISABLE;
+
+	return 0;
+}
+
+static int an8855_set_downshift(struct phy_device *phydev, u8 cnt)
+{
+	u16 ds = cnt != DOWNSHIFT_DEV_DISABLE ? AN8855_PHY_EN_DOWN_SHIFT : 0;
+
+	return phy_modify_paged(phydev, AN8855_PHY_PAGE_EXTENDED_1,
+				AN8855_PHY_EXT_REG_14, AN8855_PHY_EN_DOWN_SHIFT,
+				ds);
+}
+
+static int an8855_config_init(struct phy_device *phydev)
+{
+	struct air_an8855_priv *priv = phydev->priv;
+	int ret;
+
+	/* Enable HW auto downshift */
+	ret = an8855_set_downshift(phydev, DOWNSHIFT_DEV_DEFAULT_COUNT);
+	if (ret)
+		return ret;
+
+	if (priv->needs_calibration) {
+		ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_R50OHM_RSEL_TX_AB,
+				     AN8855_PHY_R50OHM_RSEL_TX_A_EN | AN8855_PHY_R50OHM_RSEL_TX_A |
+				     AN8855_PHY_R50OHM_RSEL_TX_B_EN | AN8855_PHY_R50OHM_RSEL_TX_B,
+				     AN8855_PHY_R50OHM_RSEL_TX_A_EN |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_A,
+						priv->calibration_data[0]) |
+				     AN8855_PHY_R50OHM_RSEL_TX_B_EN |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_B,
+						priv->calibration_data[1]));
+		if (ret)
+			return ret;
+		ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_R50OHM_RSEL_TX_CD,
+				     AN8855_PHY_R50OHM_RSEL_TX_C_EN | AN8855_PHY_R50OHM_RSEL_TX_C |
+				     AN8855_PHY_R50OHM_RSEL_TX_D_EN | AN8855_PHY_R50OHM_RSEL_TX_D,
+				     AN8855_PHY_R50OHM_RSEL_TX_C_EN |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_C,
+						priv->calibration_data[2]) |
+				     AN8855_PHY_R50OHM_RSEL_TX_D_EN |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_D,
+						priv->calibration_data[3]));
+		if (ret)
+			return ret;
+	}
+
+	/* Apply values to reduce signal noise */
+	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_TX_PAIR_DLY_SEL_GBE,
+			     AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_A_GBE |
+			     AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_C_GBE,
+			     FIELD_PREP(AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_A_GBE, 0x4) |
+			     FIELD_PREP(AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_C_GBE, 0x4));
+	if (ret)
+		return ret;
+	ret = phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_CTRL,
+			       AN8855_PHY_RG_AD_SAMPLE_PHSEL_A |
+			       AN8855_PHY_RG_AD_SAMPLE_PHSEL_C);
+	if (ret)
+		return ret;
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_REV_0,
+			    FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_A, 0x1));
+	if (ret)
+		return ret;
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_REV_1,
+			    FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_C, 0x1));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int an8855_get_tunable(struct phy_device *phydev,
+			      struct ethtool_tunable *tuna, void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return an8855_get_downshift(phydev, data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int an8855_set_tunable(struct phy_device *phydev,
+			      struct ethtool_tunable *tuna, const void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return an8855_set_downshift(phydev, *(const u8 *)data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int an8855_read_page(struct phy_device *phydev)
+{
+	return __phy_read(phydev, AN8855_PHY_SELECT_PAGE);
+}
+
+static int an8855_write_page(struct phy_device *phydev, int page)
+{
+	return __phy_write(phydev, AN8855_PHY_SELECT_PAGE, page);
+}
+
+static struct phy_driver an8855_driver[] = {
+{
+	PHY_ID_MATCH_EXACT(AN8855_PHY_ID),
+	.name			= "Airoha AN8855 internal PHY",
+	/* PHY_GBIT_FEATURES */
+	.flags			= PHY_IS_INTERNAL,
+	.probe			= an8855_probe,
+	.config_init		= an8855_config_init,
+	.soft_reset		= genphy_soft_reset,
+	.get_tunable		= an8855_get_tunable,
+	.set_tunable		= an8855_set_tunable,
+	.suspend		= genphy_suspend,
+	.resume			= genphy_resume,
+	.read_page		= an8855_read_page,
+	.write_page		= an8855_write_page,
+}, };
+
+module_phy_driver(an8855_driver);
+
+static struct mdio_device_id __maybe_unused an8855_tbl[] = {
+	{ PHY_ID_MATCH_EXACT(AN8855_PHY_ID) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(mdio, an8855_tbl);
+
+MODULE_DESCRIPTION("Airoha AN8855 PHY driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.55.0


