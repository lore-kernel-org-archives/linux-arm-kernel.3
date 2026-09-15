Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCC2C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7gTniVYg1XP5oGZ8C8SuaDBTGgYmly5HRGxfrhlkRQ=; b=fsrXiOMPOUc3oQylNB37fK959W
	Hac/mtPFXb8LIH7v62KGex0L7lCnTRULlJFxDelLoNuBIQFp3Z0QpG3xL5CM32p2PAFSkmX40lOnY
	qpTiMmtC1Y79A4mkeae/X9P/gg941zf9FiGX1uiz+ojFGFRemv4x/kgCrr0jJdwFSejwy+2Iq+hfw
	qNTcXjXSdNNS9eRElXNYEoPc+B7t8PfcA1nkK5fwfcdDGir5IiGOcqRRPxviS7A8BrwVRFjV/hNdF
	HH/cUfYme3ys/2sCw54K8hDACMDQjVc7MgHXBXUdqYRQaBeAykRQt6SjoeA1ZcNFUvVXGuIyk/BtO
	JUHRsACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRA-00000006X4n-2Oo3;
	Tue, 15 Sep 2026 12:39:00 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQj-00000006Wf0-1blj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:35 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e79a408deso10049685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475912; x=1790080712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q7gTniVYg1XP5oGZ8C8SuaDBTGgYmly5HRGxfrhlkRQ=;
        b=Epm1fKKcw10sVkNMFd2wXV2Zr/TRVH1d7dfF9xrvnmSTGC7Irm8G5etzq4Sq043v+K
         +N381DN7HvQhTyD8C9ASCKvgy7MqMrYIKv3uEt4C6XnQ8wEmPzQCyDLfJ5PJ0d3Be9X1
         0ehsETX4tB9aGEiuyjhyOc+8Au9BYyaBeAjxQWLiQBefc1RPze3SP88e5bGaiUQgPPDU
         3b6HPfaYF3bEqHuDDZEd+JuvI+ZuV8Lq169iCwPm/Qa9cXJMNcrfbf1QqhsIlXwk2rWn
         eIvBfL75F/VzSTmKzGpNJx7NqwVKyLwcBb/9Jbak1MlUgEb+n4WHLmN3q9z5Guz9rwRt
         AHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475912; x=1790080712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Q7gTniVYg1XP5oGZ8C8SuaDBTGgYmly5HRGxfrhlkRQ=;
        b=JWUIltYqc7fycgzdqBxk+iRJ/XomEmO/kKaHnFlYot9JAquFplTPlBZtlBYIjbXGi3
         Oz0XK/KLjVoPPByiQNekJs0+0HIgURMFLcu2RlVhpTJvWFF3Yi+jvAt/hq1FnP3lX6q6
         X/KDYDOSOwzloW97gHtFcnHlr2ibN7bLajMj0AEF5/KRI4NlMGerevjQZOqG0J34OwBy
         MwKVOWQj2xgIOzMZAkrR5HDxyDvKt2dyKR2vJhLfC+T27zl34sycxOd93678TDmsGY+h
         yWhIvcxJosIvrLO8rDXt+1Uzq7f8iwCWPXldeZX+qzsHUHHNY8hMq00Bd8c7lU0VUdQd
         rHuQ==
X-Forwarded-Encrypted: i=1; AKwUvBydsnknA7RlC4kUpsdsbtTCXV3EtieQtUSwZyVqNznc/tDzjRuqWPxdVzqWwliQpKNJ9Ezi+2qOVKcu02I38Apf@lists.infradead.org
X-Gm-Message-State: AFuF++ldIFXkCWrEsNgKLqoy3x+qyZcD0r6tMAZZUw1jasoW28ZKcHC1
	z36uAdx/ADXh2d2O1liPZ0eUSdxz85m7Vk2TP388/9sGmdm6NCaDnF1k
X-Gm-Gg: AYBFou2btnFqyH6krEJVYH8aTQPpGE6B36RkBR3y+4N0LZw3pxNiXVkwbhXzOA6SnBw
	sitsJp+GZUPyT8b6AIoC6RihW4y52bf7r21tA0B4CTq0eA4fIelSGXOvdv03JAPhImDyAW8iIrF
	0Gm0SI8ZlSNleKNbwUg6+ChhCAif/CTVYk+eyjkv75nqNsB7kuPqabduXESu2o8iMRl5jL0vMc4
	CgIM1zvrTiSB7H50igrPftw+S0YPqjyUGxF6a6PWfbF/cII44AXipFEt4E3+QxNLSbP6b529o3i
	g0lphoBBQDEV2YWHxwJ5el3OjzyzlM6eP585Tuh3+8snPOQkcZARRazF1zyRvHpHDFV8xPpVEv2
	uef4hTgNgT70xnD6roukYrmtIQjEYqo+hMc1LFiNkN3zZ4pK7yPwY+6fbsciIyqNJp3tZcUZHAH
	L17bft50eXgEN68QvjXhcH2Ybx+6Qaz6DgfHQSA2he7sZYUC1xPA7XJjSkKf2sTCJuSVQzGnEYs
	LP/nitrbDi7x1IAqIO9zTso1Y/szdEW5Snzbyn+QvYT8ROpz1SKrjdfpRiklPQwCA==
X-Received: by 2002:a05:600c:a015:b0:49d:1f32:c911 with SMTP id 5b1f17b1804b1-49e7a65ce8cmr90507645e9.3.1789475911540;
        Tue, 15 Sep 2026 05:38:31 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:31 -0700 (PDT)
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
Subject: [PATCH net-next v22 4/9] mfd: an8855: Add support for Airoha AN8855 Switch
Date: Tue, 15 Sep 2026 14:38:01 +0200
Message-ID: <20260915123812.14747-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053834_035975_790DCDB0 
X-CRM114-Status: GOOD (  28.29  )
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

Add support for Airoha AN8855 Switch that provide support for a DSA
switch and a NVMEM provider.

Also make use of the mdio-regmap driver and register a regmap for each
internal PHY of the switch.
This is needed to handle the double usage of the PHYs as both PHY and
Switch accessor.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mfd/Kconfig         |  14 +
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/airoha-an8855.c | 557 ++++++++++++++++++++++++++++++++++++
 3 files changed, 572 insertions(+)
 create mode 100644 drivers/mfd/airoha-an8855.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e4fd4572472f..afbdcec0fce8 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -54,6 +54,20 @@ config MFD_ALTERA_SYSMGR
 	  using regmap_mmio accesses for ARM32 parts and SMC calls to
 	  EL3 for ARM64 parts.
 
+config MFD_AIROHA_AN8855
+	tristate "Airoha AN8855 Switch Core"
+	select MFD_CORE
+	select REGMAP
+	select PHYLIB
+	select MDIO_REGMAP
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
index 72d3944b0ad8..484127dba2ad 100644
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
index 000000000000..2b3b5f4a5a21
--- /dev/null
+++ b/drivers/mfd/airoha-an8855.c
@@ -0,0 +1,557 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Core driver for Airoha AN8855 Switch
+ *
+ * Copyright (C) 2024 Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/fwnode_mdio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mfd/core.h>
+#include <linux/mdio.h>
+#include <linux/mdio/mdio-regmap.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/regmap.h>
+
+/* Register for HW trap status */
+#define AN8855_HWTRAP			0x1000009c
+
+/*
+ * Register of the Switch ID
+ * (called Project ID in Documentation)
+ */
+#define AN8855_CREV			0x10005000
+#define   AN8855_ID			0x8855 /* Switch ID */
+
+/* Register for GPHY Power Down
+ * Used to Toggle the Gigabit PHY power and enable them.
+ */
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
+#define AN8855_MAX_PHY_PORT		5
+
+struct an8855_core_priv {
+	struct mii_bus *bus;
+	struct mii_bus *phy_bus;
+	unsigned int switch_addr;
+	u16 current_page;
+};
+
+struct an8855_phy_priv {
+	u8 addr;
+	struct an8855_core_priv *core;
+};
+
+struct an8855_phy_bus {
+	struct mii_bus *bus;
+	struct fwnode_handle *node;
+	u8 addr;
+};
+
+static const struct mfd_cell an8855_cells[] = {
+	MFD_CELL_OF("an8855-efuse", NULL, NULL, 0, 0,
+		    "airoha,an8855-efuse"),
+	MFD_CELL_OF("an8855-switch", NULL, NULL, 0, 0,
+		    "airoha,an8855-switch"),
+};
+
+static int an8855_mii_set_page(struct an8855_core_priv *priv, u8 addr,
+			       u8 page) __must_hold(&priv->bus->mdio_lock)
+{
+	struct mii_bus *bus = priv->bus;
+	int ret;
+
+	ret = __mdiobus_write(bus, addr, AN8855_PHY_SELECT_PAGE, page);
+	if (ret) {
+		dev_err_ratelimited(&bus->dev, "failed to set mii page\n");
+		return ret;
+	}
+
+	/* Cache current page if next MII read/write is for Switch page */
+	priv->current_page = page;
+	return 0;
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
+	*val = ((u32)hi << 16) | lo;
+
+	return 0;
+err:
+	dev_err_ratelimited(&bus->dev, "failed to read register\n");
+	return ret;
+}
+
+/*
+ * Protect concurrent access to phy page if switch address also
+ * expose a PHY.
+ */
+static void an8855_regmap_lock(struct an8855_core_priv *priv)
+{
+	if (priv->phy_bus)
+		mutex_lock(&priv->phy_bus->mdio_lock);
+	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
+}
+
+static void an8855_regmap_unlock(struct an8855_core_priv *priv)
+{
+	mutex_unlock(&priv->bus->mdio_lock);
+	if (priv->phy_bus)
+		mutex_unlock(&priv->phy_bus->mdio_lock);
+}
+
+static int an8855_regmap_read(void *ctx, uint32_t reg, uint32_t *val)
+{
+	struct an8855_core_priv *priv = ctx;
+	struct mii_bus *bus = priv->bus;
+	u16 addr = priv->switch_addr;
+	int ret;
+
+	an8855_regmap_lock(priv);
+	ret = an8855_mii_set_page(priv, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret < 0)
+		goto exit;
+
+	ret = an8855_mii_read32(bus, addr, reg, val);
+
+exit:
+	an8855_regmap_unlock(priv);
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
+	an8855_regmap_lock(priv);
+	ret = an8855_mii_set_page(priv, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret)
+		goto exit;
+
+	ret = an8855_mii_write32(bus, addr, reg, val);
+
+exit:
+	an8855_regmap_unlock(priv);
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
+	an8855_regmap_lock(priv);
+	ret = an8855_mii_set_page(priv, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret)
+		goto exit;
+
+	ret = an8855_mii_read32(bus, addr, reg, &val);
+	if (ret < 0)
+		goto exit;
+
+	val &= ~mask;
+	val |= write_val & mask;
+	ret = an8855_mii_write32(bus, addr, reg, val);
+
+exit:
+	an8855_regmap_unlock(priv);
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
+	.name = "switch",
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
+static int an8855_regmap_phy_reset_page(struct an8855_core_priv *priv,
+					int phy) __must_hold(&priv->bus->mdio_lock)
+{
+	/* Check PHY page only for addr shared with switch */
+	if (phy != priv->switch_addr)
+		return 0;
+
+	/* Don't restore page if it's not set to Switch page */
+	if (priv->current_page != AN8855_PHY_PAGE_EXTENDED_4)
+		return 0;
+
+	/*
+	 * Restore page to 0, PHY might change page right after but that
+	 * will be ignored as it won't be a switch page.
+	 */
+	return an8855_mii_set_page(priv, phy, AN8855_PHY_PAGE_STANDARD);
+}
+
+static int an8855_regmap_phy_read(void *ctx, uint32_t reg, uint32_t *val)
+{
+	struct an8855_phy_priv *priv = ctx;
+	struct an8855_core_priv *core_priv;
+	u32 addr = priv->addr;
+	struct mii_bus *bus;
+	int ret;
+
+	core_priv = priv->core;
+	bus = core_priv->bus;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_regmap_phy_reset_page(core_priv, addr);
+	if (ret)
+		goto exit;
+
+	ret = __mdiobus_read(bus, addr, reg);
+	if (ret >= 0)
+		*val = ret;
+
+exit:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int an8855_regmap_phy_write(void *ctx, uint32_t reg, uint32_t val)
+{
+	struct an8855_phy_priv *priv = ctx;
+	struct an8855_core_priv *core_priv;
+	u32 addr = priv->addr;
+	struct mii_bus *bus;
+	int ret;
+
+	core_priv = priv->core;
+	bus = core_priv->bus;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_regmap_phy_reset_page(core_priv, addr);
+	if (ret)
+		goto exit;
+
+	ret = __mdiobus_write(bus, addr, reg, val);
+
+exit:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret;
+}
+
+static const struct regmap_config an8855_phy_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_read = an8855_regmap_phy_read,
+	.reg_write = an8855_regmap_phy_write,
+	.disable_locking = true,
+	.max_register = 0x1f,
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
+static int an8855_phy_bus_register(struct device *dev, struct an8855_core_priv *priv,
+				   struct device_node *phy_np,
+				   struct an8855_phy_bus *phy_bus_info)
+{
+	struct mdio_regmap_config mrc = { };
+	struct an8855_phy_priv *phy_priv;
+	struct regmap *regmap;
+	u32 addr, phy_offset;
+	struct mii_bus *bus;
+	int ret;
+
+	ret = of_property_read_u32(phy_np, "reg", &addr);
+	if (ret)
+		return ret;
+
+	phy_offset = addr - priv->switch_addr;
+	if (phy_offset >= AN8855_MAX_PHY_PORT)
+		return -EINVAL;
+
+	phy_priv = devm_kzalloc(dev, sizeof(*phy_priv), GFP_KERNEL);
+	if (!phy_priv)
+		return -ENOMEM;
+
+	phy_priv->addr = addr;
+	phy_priv->core = priv;
+
+	regmap = devm_regmap_init(dev, NULL, phy_priv, &an8855_phy_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "phy%d regmap initialization failed\n",
+				      addr);
+
+	mrc.regmap = regmap;
+	mrc.parent = dev;
+	mrc.valid_addr = addr;
+	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus->id, addr);
+
+	bus = devm_mdio_regmap_register(dev, &mrc);
+	if (IS_ERR(bus))
+		return PTR_ERR(bus);
+
+	if (addr == priv->switch_addr)
+		priv->phy_bus = bus;
+
+	phy_bus_info->bus = bus;
+	phy_bus_info->addr = addr;
+	phy_bus_info->node = of_fwnode_handle(phy_np);
+
+	return 0;
+}
+
+static int an8855_mdio_register(struct device *dev, struct an8855_core_priv *priv,
+				struct an8855_phy_bus *phy_bus_infos)
+{
+	struct device_node *mdio_np;
+	int ret = 0;
+	int i = 0;
+
+	mdio_np = of_get_child_by_name(dev->of_node, "mdio");
+	if (!mdio_np)
+		return -ENODEV;
+
+	for_each_available_child_of_node_scoped(mdio_np, phy_np) {
+		if (i >= AN8855_MAX_PHY_PORT)
+			return -EINVAL;
+
+		ret = an8855_phy_bus_register(dev, priv, phy_np,
+					      &phy_bus_infos[i]);
+		if (ret)
+			break;
+
+		i++;
+	}
+
+	of_node_put(mdio_np);
+	return ret ? ret : i;
+}
+
+static int an8855_core_probe(struct mdio_device *mdiodev)
+{
+	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
+	struct device *dev = &mdiodev->dev;
+	struct an8855_core_priv *priv;
+	struct regmap *regmap;
+	int num_phys;
+	int i, ret;
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
+	/* Register virtual MDIO for each PHY */
+	num_phys = an8855_mdio_register(dev, priv, phy_bus_infos);
+	if (num_phys < 0)
+		return num_phys;
+
+	regmap = devm_regmap_init(dev, NULL, priv, &an8855_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "regmap initialization failed\n");
+
+	/* Reset PHY page for switch address */
+	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_mii_set_page(priv, priv->switch_addr,
+				  AN8855_PHY_PAGE_STANDARD);
+	mutex_unlock(&priv->bus->mdio_lock);
+	if (ret)
+		return ret;
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
+	/* Register PHYs */
+	for (i = 0; i < num_phys; i++) {
+		ret = fwnode_mdiobus_register_phy(phy_bus_infos[i].bus,
+						  phy_bus_infos[i].node,
+						  phy_bus_infos[i].addr);
+		if (ret)
+			return ret;
+	}
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, an8855_cells,
+				    ARRAY_SIZE(an8855_cells), NULL, 0,
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
+MODULE_DESCRIPTION("Driver for Airoha AN8855");
+MODULE_LICENSE("GPL");
-- 
2.53.0


