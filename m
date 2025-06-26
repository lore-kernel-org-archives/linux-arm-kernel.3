Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92D5C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q51p0D6joOH4+ZA0xeQSWKxObvqWX7HJjHs05TsGJt0=; b=H5befhY73aIlozcrahS+9Yyrly
	KQuSL8SKrtbcPvqm/ksSyfozDTqV0hDAAGatOQt7K1iXbHoALqUcgXTPobTbchSOGCLsuArWXk4ru
	VZXbw4iUKAmZSMp/U0RjnfinHMPj023B+7Ffd8yXYNyDGi4g7XVBYoTNzdQOR+iuiwAMf5omARYOV
	BsXYqe/VT7YlpDRuFQTbEGqVNbP+86lUSwXN3yDUzaAsELIY94D3JpCn2aXmiphdJ18v2uiFaVfVd
	qUxXSwHJzqqCdWF46XKA13wNUAqr/4WpoCfmne7bZzpd8wjCACfdwQ4l6UXaAGtaTYGEeKxA4Oza3
	q0u0a8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUw6B-0000000D4CL-23D2;
	Thu, 26 Jun 2025 23:33:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu4l-0000000CpAW-1x8E;
	Thu, 26 Jun 2025 21:24:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a5123c1533so833398f8f.2;
        Thu, 26 Jun 2025 14:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750973046; x=1751577846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q51p0D6joOH4+ZA0xeQSWKxObvqWX7HJjHs05TsGJt0=;
        b=fhczPQls6y2GNIjAaa1AU83izbzwvE0FNsVGAhpgvvX5+brqm+K2wfx83Ig/9q7eFt
         epx2pktBLQDUqFVz3izzHOn/GQ+Tn50GiDsBVt9D/oJxV32R47kZWKYgQxG9PJZb1m2t
         pyNEL/sPjMoKdxoqQ3P1BcPplpd9+9324e2ArxDFu4kp4NRKZVMVSkgqJMqnDuc5S34Y
         UQzabRdo8ysV7OeYI7Og6SrP4xSv5wjtZKU027WxfIvLISUOzVQ5aKGE0o13lv7s6fsp
         cemWzd+5aaTIvPU1tr0Lco18SVqTy/uvIcfOX0nQONjzlTIDjWYIjUCFlRsAaWojR+oD
         IuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973046; x=1751577846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q51p0D6joOH4+ZA0xeQSWKxObvqWX7HJjHs05TsGJt0=;
        b=TX15XSLgkbpSomB2fkr80HbBgjv9tG9NtCD11xpFY33Cg/tVzxXbBCBCEUrEGik+fQ
         gEZrFBb66lAJmkg/zNLn2NvxlfgbPsXGxbZ3pXkSBbtHktcqg+Ens5507onOQQy0cdBp
         blCglEyzjuhNrF+8V22GKbY8RI7ra84CPwk5PJP12+/JYovRi57OsRIxSEtLU/iN+zGD
         jSHwjp+Vf+qfxkT+/LbeRc3JJZVtorw/l1jEWL7MIKL1JoR7RcPGhCKbLp0cLijLxuIy
         mtf3EidxiQ7DLys2WiQ37WGch9AfBoB8CzSjeLB29yXi+oDbOJ7PXB+vJAuxxaIOhDX9
         YP9A==
X-Forwarded-Encrypted: i=1; AJvYcCUz2QiOQcQFS3OiJYeagQartxMOIlwqEBJpCnnab88YNyGo/rAMU8F2javSH+awrUVeRWZb8SePfmQVQzk2ve8=@lists.infradead.org, AJvYcCWSahRPiigSRwIph4SyoYfGMC8C1PGL5E2yEgyFUO0rhuFIN4sM8uIBNzpguO0H9577uA3Pjohb1BiKh/a8d4vU@lists.infradead.org
X-Gm-Message-State: AOJu0YzztUvfO1LViR4uhks+UzgdH9IdzbZJq/Sx3yseSN2cWYfw8X1x
	ZnyqP2/uVPv6Xfb6eqygo/i32rCaXrHteMKWGtPKD4z4tWNGsNR//K3w
X-Gm-Gg: ASbGncti0i9lWyMHo945eqsnjqHXyBkxG4Id07SyV3ii81c9uXc6IS3jaJAoJlyd6hV
	nLJ6g+8SO4mPRsRfbgMBYIeftvAmuoYFAbA7W25Urz2akEMF8DUDcPQCMZTG4kOYoSHxYF25avk
	YvrbwaP83va/GCUoLpLNvZ3255obZgsvC6La3pc/2KLZoquBZ6R3wX/7w9t7fwsOCQgdF3hK1Ox
	lwY00AdpYDffUjj5tAPbakaUpAWzsZKRfQoDYTrJOwNt3CfhG1qwshBPzJzVu6pxUtwuIptIs+P
	qd17O4fc2GBCAeRE6lAaoV2tmV6k3lsbJrYQdj4FTzSfdoXmxAQAKUVeyX3++3mWl/qK7/WQHZk
	ez5Ve381yTdu2zats5/tZbtdkJ9D3Oko=
X-Google-Smtp-Source: AGHT+IFUAFT5M5Q3CduJ3muQBWpq2XELQIlYzjz6eKJuSYBHtb3xbG2uAtcpXRBZrCMlNM2c6wesvA==
X-Received: by 2002:a05:6000:20c6:b0:3a4:da87:3a73 with SMTP id ffacd0b85a97d-3a8fec79a28mr574471f8f.42.1750973045754;
        Thu, 26 Jun 2025 14:24:05 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm57186475e9.10.2025.06.26.14.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:24:05 -0700 (PDT)
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
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
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
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v15 09/12] mfd: an8855: Add support for Airoha AN8855 Switch MFD
Date: Thu, 26 Jun 2025 23:23:08 +0200
Message-ID: <20250626212321.28114-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250626212321.28114-1-ansuelsmth@gmail.com>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_142407_516522_FA472D01 
X-CRM114-Status: GOOD (  28.75  )
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

Add support for Airoha AN8855 Switch MFD that provide support for a DSA
switch and a NVMEM provider. Also provide support for the PBUS MDIO
to access the internal PHYs address from the switch registers to permit
the usage of a single regmap to handle both switch and PHYs.

An interesting HW bug wes discovered with the implementation of the MDIO
PBUS where the PHY status is not correctly detected if the PBUS is used
to read the PHY BMSR. For the only BMSR register, it's required to read
the address directly from the MDIO bus.

A check and a workaround is implemented to address this in the
regmap_read function.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mfd/Kconfig         |  12 ++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/airoha-an8855.c | 393 ++++++++++++++++++++++++++++++++++++
 3 files changed, 406 insertions(+)
 create mode 100644 drivers/mfd/airoha-an8855.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71..f2bfd6c9fc5f 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -53,6 +53,18 @@ config MFD_ALTERA_SYSMGR
 	  using regmap_mmio accesses for ARM32 parts and SMC calls to
 	  EL3 for ARM64 parts.
 
+config MFD_AIROHA_AN8855
+	tristate "Airoha AN8855 Switch Core"
+	select MFD_CORE
+	select MDIO_DEVICE
+	depends on NETDEVICES && OF
+	help
+	  Support for the Airoha AN8855 Switch Core. This is an SoC
+	  that provides various peripherals, to count, i2c, an Ethrnet
+	  Switch, a CPU timer, GPIO, eFUSE.
+
+	  Currently it provides a DSA switch and a NVMEM provider.
+
 config MFD_ACT8945A
 	tristate "Active-semi ACT8945A"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 79495f9f3457..f541b513f41e 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
 obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
+obj-$(CONFIG_MFD_AIROHA_AN8855)	+= airoha-an8855.o
 obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
 obj-$(CONFIG_MFD_SM501)		+= sm501.o
 obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
new file mode 100644
index 000000000000..bb03a2436f25
--- /dev/null
+++ b/drivers/mfd/airoha-an8855.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Core driver for Airoha AN8855 Switch
+ */
+
+#include <linux/bitfield.h>
+#include <linux/dsa/an8855.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mfd/core.h>
+#include <linux/mdio.h>
+#include <linux/mdio/mdio-regmap.h>
+#include <linux/module.h>
+#include <linux/phy.h>
+#include <linux/regmap.h>
+
+/* Register for HW trap status */
+#define AN8855_HWTRAP			0x1000009c
+
+#define AN8855_CREV			0x10005000
+#define   AN8855_ID			0x8855
+
+#define AN8855_RG_GPHY_AFE_PWD		0x1028c840
+
+/* MII Registers */
+#define AN8855_PHY_SELECT_PAGE		0x1f
+#define   AN8855_PHY_PAGE		GENMASK(2, 0)
+#define   AN8855_PHY_PAGE_STANDARD	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x0)
+#define   AN8855_PHY_PAGE_EXTENDED_1	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x1)
+#define   AN8855_PHY_PAGE_EXTENDED_4	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x4)
+
+/* MII Registers Page 4 */
+#define AN8855_PBUS_MODE		0x10
+#define   AN8855_PBUS_MODE_ADDR_FIXED	0x0
+#define   AN8855_PBUS_MODE_ADDR_INCR	BIT(15)
+#define AN8855_PBUS_WR_ADDR_HIGH	0x11
+#define AN8855_PBUS_WR_ADDR_LOW		0x12
+#define AN8855_PBUS_WR_DATA_HIGH	0x13
+#define AN8855_PBUS_WR_DATA_LOW		0x14
+#define AN8855_PBUS_RD_ADDR_HIGH	0x15
+#define AN8855_PBUS_RD_ADDR_LOW		0x16
+#define AN8855_PBUS_RD_DATA_HIGH	0x17
+#define AN8855_PBUS_RD_DATA_LOW		0x18
+
+struct an8855_core_priv {
+	struct mii_bus *bus;
+
+	unsigned int switch_addr;
+};
+
+static const struct mfd_cell an8855_core_childs[] = {
+	{
+		.name = "an8855-efuse",
+		.of_compatible = "airoha,an8855-efuse",
+	}, {
+		.name = "an8855-switch",
+		.of_compatible = "airoha,an8855-switch",
+	}, {
+		.name = "an8855-mdio",
+		.of_compatible = "airoha,an8855-mdio",
+	}
+};
+
+static bool an8855_is_pbus_bmcr_reg(u32 reg)
+{
+	if ((reg & ~(AN8855_GPHY_PORT | AN8855_ADDR)) != AN8855_GPHY_ACCESS)
+		return false;
+
+	if ((reg & AN8855_ADDR) != FIELD_PREP_CONST(AN8855_CL22_ADDR,
+						    MII_BMSR))
+		return false;
+
+	return true;
+}
+
+/* PHY page is Global for every Switch PHY.
+ * Configure it to 4 (as Switch PAGE) and keep it that way.
+ * Page selection doesn't affect the first PHY address from 0x0 to
+ * 0xf and we use PBUS to access the PHY address.
+ */
+static int an8855_mii_set_page(struct an8855_core_priv *priv, u8 addr,
+			       u8 page) __must_hold(&priv->bus->mdio_lock)
+{
+	struct mii_bus *bus = priv->bus;
+	int ret;
+
+	ret = __mdiobus_write(bus, addr, AN8855_PHY_SELECT_PAGE, page);
+	if (ret)
+		dev_err_ratelimited(&bus->dev, "failed to set mii page\n");
+
+	return ret;
+}
+
+static int an8855_mii_read32(struct mii_bus *bus, u8 phy_id, u32 reg,
+			     u32 *val) __must_hold(&bus->mdio_lock)
+{
+	int lo, hi, ret;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_MODE,
+			      AN8855_PBUS_MODE_ADDR_FIXED);
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_RD_ADDR_HIGH,
+			      upper_16_bits(reg));
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_RD_ADDR_LOW,
+			      lower_16_bits(reg));
+	if (ret)
+		goto err;
+
+	hi = __mdiobus_read(bus, phy_id, AN8855_PBUS_RD_DATA_HIGH);
+	if (hi < 0) {
+		ret = hi;
+		goto err;
+	}
+
+	lo = __mdiobus_read(bus, phy_id, AN8855_PBUS_RD_DATA_LOW);
+	if (lo < 0) {
+		ret = lo;
+		goto err;
+	}
+
+	*val = ((u16)hi << 16) | ((u16)lo & 0xffff);
+
+	return 0;
+err:
+	dev_err_ratelimited(&bus->dev, "failed to read register\n");
+	return ret;
+}
+
+static int an8855_regmap_read(void *ctx, uint32_t reg, uint32_t *val)
+{
+	struct an8855_core_priv *priv = ctx;
+	struct mii_bus *bus = priv->bus;
+	u16 addr = priv->switch_addr;
+	int ret;
+
+	/* Workaround a HW BUG where using only PBUS for
+	 * accessing internal PHY register cause the port status
+	 * to not be correctly detected. It seems BMSR is required
+	 * to go through direct MDIO read or is never refreshed.
+	 *
+	 * A theory about this is that PHY sideband signal is
+	 * checked only with MDIO operation on BMSR and using
+	 * PBUS doesn't trigger the check.
+	 *
+	 * Using interrupt to detect Link Up might be possible
+	 * but it's considered an optional feature for the Switch
+	 * reference (hence there could be devices with the
+	 * interrupt line not connected)
+	 */
+	if (an8855_is_pbus_bmcr_reg(reg)) {
+		addr += FIELD_GET(AN8855_GPHY_PORT, reg);
+		*val = mdiobus_read(bus, addr, MII_BMSR);
+		return 0;
+	}
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_mii_set_page(priv, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret < 0)
+		goto exit;
+
+	ret = an8855_mii_read32(bus, addr, reg, val);
+
+exit:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int an8855_mii_write32(struct mii_bus *bus, u8 phy_id, u32 reg,
+			      u32 val) __must_hold(&bus->mdio_lock)
+{
+	int ret;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_MODE,
+			      AN8855_PBUS_MODE_ADDR_FIXED);
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_ADDR_HIGH,
+			      upper_16_bits(reg));
+	if (ret)
+		goto err;
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_ADDR_LOW,
+			      lower_16_bits(reg));
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_DATA_HIGH,
+			      upper_16_bits(val));
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_DATA_LOW,
+			      lower_16_bits(val));
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	dev_err_ratelimited(&bus->dev,
+			    "failed to write an8855 register\n");
+	return ret;
+}
+
+static int an8855_regmap_write(void *ctx, uint32_t reg, uint32_t val)
+{
+	struct an8855_core_priv *priv = ctx;
+	struct mii_bus *bus = priv->bus;
+	u16 addr = priv->switch_addr;
+	int ret;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_mii_set_page(priv, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret)
+		goto exit;
+
+	ret = an8855_mii_write32(bus, addr, reg, val);
+
+exit:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int an8855_regmap_update_bits(void *ctx, uint32_t reg, uint32_t mask,
+				     uint32_t write_val)
+{
+	struct an8855_core_priv *priv = ctx;
+	struct mii_bus *bus = priv->bus;
+	u16 addr = priv->switch_addr;
+	u32 val;
+	int ret;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_mii_set_page(priv, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret)
+		goto exit;
+
+	ret = an8855_mii_read32(bus, addr, reg, &val);
+	if (ret < 0)
+		goto exit;
+
+	val &= ~mask;
+	val |= write_val;
+	ret = an8855_mii_write32(bus, addr, reg, val);
+
+exit:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
+static const struct regmap_range an8855_readable_ranges[] = {
+	regmap_reg_range(0x10000000, 0x10000fff), /* SCU */
+	regmap_reg_range(0x10001000, 0x10001fff), /* RBUS */
+	regmap_reg_range(0x10002000, 0x10002fff), /* MCU */
+	regmap_reg_range(0x10005000, 0x10005fff), /* SYS SCU */
+	regmap_reg_range(0x10007000, 0x10007fff), /* I2C Slave */
+	regmap_reg_range(0x10008000, 0x10008fff), /* I2C Master */
+	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
+	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
+	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
+	regmap_reg_range(0x1000a300, 0x1000a3ff), /* GPIO */
+	regmap_reg_range(0x1000a400, 0x1000a5ff), /* EFUSE */
+	regmap_reg_range(0x1000c000, 0x1000cfff), /* GDMP CSR */
+	regmap_reg_range(0x10010000, 0x1001ffff), /* GDMP SRAM */
+	regmap_reg_range(0x10200000, 0x10203fff), /* Switch - ARL Global */
+	regmap_reg_range(0x10204000, 0x10207fff), /* Switch - BMU */
+	regmap_reg_range(0x10208000, 0x1020bfff), /* Switch - ARL Port */
+	regmap_reg_range(0x1020c000, 0x1020cfff), /* Switch - SCH */
+	regmap_reg_range(0x10210000, 0x10213fff), /* Switch - MAC */
+	regmap_reg_range(0x10214000, 0x10217fff), /* Switch - MIB */
+	regmap_reg_range(0x10218000, 0x1021bfff), /* Switch - Port Control */
+	regmap_reg_range(0x1021c000, 0x1021ffff), /* Switch - TOP */
+	regmap_reg_range(0x10220000, 0x1022ffff), /* SerDes */
+	regmap_reg_range(0x10286000, 0x10286fff), /* RG Batcher */
+	regmap_reg_range(0x1028c000, 0x1028ffff), /* ETHER_SYS */
+	regmap_reg_range(0x30000000, 0x37ffffff), /* I2C EEPROM */
+	regmap_reg_range(0x38000000, 0x3fffffff), /* BOOT_ROM */
+	regmap_reg_range(0xa0000000, 0xbfffffff), /* GPHY */
+};
+
+static const struct regmap_access_table an8855_readable_table = {
+	.yes_ranges = an8855_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(an8855_readable_ranges),
+};
+
+static const struct regmap_config an8855_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0xbfffffff,
+	.reg_read = an8855_regmap_read,
+	.reg_write = an8855_regmap_write,
+	.reg_update_bits = an8855_regmap_update_bits,
+	.disable_locking = true,
+	.rd_table = &an8855_readable_table,
+};
+
+static int an8855_read_switch_id(struct device *dev, struct regmap *regmap)
+{
+	u32 id;
+	int ret;
+
+	ret = regmap_read(regmap, AN8855_CREV, &id);
+	if (ret)
+		return ret;
+
+	if (id != AN8855_ID) {
+		dev_err(dev, "Detected Switch ID %x but %x was expected\n",
+			id, AN8855_ID);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int an8855_core_probe(struct mdio_device *mdiodev)
+{
+	struct device *dev = &mdiodev->dev;
+	struct an8855_core_priv *priv;
+	struct gpio_desc *reset_gpio;
+	struct regmap *regmap;
+	u32 val;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->bus = mdiodev->bus;
+	priv->switch_addr = mdiodev->addr;
+	/* No DMA for mdiobus, mute warning for DMA mask not set */
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	regmap = devm_regmap_init(dev, NULL, priv, &an8855_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "regmap initialization failed\n");
+
+	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(reset_gpio))
+		return PTR_ERR(reset_gpio);
+
+	if (reset_gpio) {
+		usleep_range(100000, 150000);
+		gpiod_set_value_cansleep(reset_gpio, 0);
+		usleep_range(100000, 150000);
+		gpiod_set_value_cansleep(reset_gpio, 1);
+
+		/* Poll HWTRAP reg to wait for Switch to fully Init */
+		ret = regmap_read_poll_timeout(regmap, AN8855_HWTRAP, val,
+					       val, 20, 200000);
+		if (ret)
+			return ret;
+	}
+
+	ret = an8855_read_switch_id(dev, regmap);
+	if (ret)
+		return ret;
+
+	/* Release global PHY power down */
+	ret = regmap_write(regmap, AN8855_RG_GPHY_AFE_PWD, 0x0);
+	if (ret)
+		return ret;
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, an8855_core_childs,
+				    ARRAY_SIZE(an8855_core_childs), NULL, 0,
+				    NULL);
+}
+
+static const struct of_device_id an8855_core_of_match[] = {
+	{ .compatible = "airoha,an8855" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an8855_core_of_match);
+
+static struct mdio_driver an8855_core_driver = {
+	.probe = an8855_core_probe,
+	.mdiodrv.driver = {
+		.name = "an8855",
+		.of_match_table = an8855_core_of_match,
+	},
+};
+mdio_module_driver(an8855_core_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Driver for Airoha AN8855 MFD");
+MODULE_LICENSE("GPL");
-- 
2.48.1


