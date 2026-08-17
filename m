Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5B8C5DF77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqoVNLFwTkaibKrG7wotqvHEdvf4jAu2+V/EjNNkZNw=; b=dduACQURUeJV2zfRiSX34/SCEs
	DxMJbq+E7QoyACWLGSeD7Qz+aOhy/hbKecHRLtr2z5WP5QEGWDsEh085Oqz3g35BAiDJ1buyFqoHi
	HgX5C4qq0HVv9NP900WmUJ9joyBPFKAhFHUNrMNggFSV1FgG8jLDDerYESjMmu3v+rNDLq0UctBME
	ltTiPqp6IRly/BngF2PA1n88aVVz1llbZVaY3r1tLBZGpUXohj3Nj7SKkhVK4UsMOzY9gj6XgxBm9
	Uh4LQHeYNOD1VSA8gcjIpnfuj5KlQL9sLW/cR457QFWPqy415wdKJByEy2AVF2QJDgwbkbM3AsH1O
	M7LJKyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsad-00000005eh2-24qO;
	Mon, 17 Aug 2026 08:21:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaU-00000005eUK-0Okw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:20:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso27177955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 01:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954852; x=1787559652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uqoVNLFwTkaibKrG7wotqvHEdvf4jAu2+V/EjNNkZNw=;
        b=d2MSlekD0hOM82hJc0EWC4RHAXignzGfakVoaQHboe3pJvjYM5Dnj8OhQ8zWZNgX11
         +kaVTFLcTA0wzHMkQiaMZhG/E94xw7fH3HS95JBCqTZC1OpEKKq+8A72QrdvTteDtkLl
         4HEsBb8ZU5osWhXoxRAz8oOYtdfIux9qhjabW5dkZ+JgySgrkr5bP2J0RdbbXCCTycZU
         fWVuyzWb3koWSunCwAhL6Fy7Qr8ph8o7wgh47yWStlzrOxF3nMHaKodfQUvV9y414z2X
         s0n9rCTmL0JjbKZMKrCPuMD8mz66esoTLHgiJYULZv9MB7JLxREI8gtvZvhm5hUH2sYj
         BUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954852; x=1787559652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uqoVNLFwTkaibKrG7wotqvHEdvf4jAu2+V/EjNNkZNw=;
        b=dXS6/OJEOtix0GHt1utdCm9kvmQXLMynVmyYHjL6EWgHH1meXZDwOKaHnc5XOWWQCI
         VezN3lX46Gh9juw0FeCga3EJ2dyrcVOQl1TIpdbokSKE6IvmoHy+wXehOPTpQBcr5Lk+
         VFzNrhxjyohERZk3wDE5GqFT/+OIxP+tJX0valgCqFi8v8XsY8tOmJh5CusxjTtZVvif
         ff6bwxSCpd2wHhoIv2jLjzzb698gcPxoZ8jhxMfpWjqnZ3Rp9ZmHtXrLE0LZ66h08IUU
         rY+rZy5Vyo/BVPnMoR1xyT+1en9lo14H7EAgstmnkWqqRa/BJK3dKdDnrR9h/GrVZn6a
         Skiw==
X-Forwarded-Encrypted: i=1; AHgh+RoXM7P42qu/RPWpqE9B2vYY8udXAichsvIr4ub751E0G0go4EumnE17TcRkKiZ2PG6iNTpnP2YscZbFZoHJNseM@lists.infradead.org
X-Gm-Message-State: AOJu0YwWvaDnxMt6mIL5Jgxth879xkl6QoF+VFgWor1yoJFFFiroZBHm
	A9oEpb8MdFYm6A0PW6CMijS79rvMI5M9FZeNCm5Nwn8pU/EEbRrBqX/y
X-Gm-Gg: AR+sD12KV9DV0m9ZuKTSaygJ7OzM9QAH472qlLjPJQWq5NTXSF1lYFsA57V0ENZ2SG5
	QgI5KjFyZV0K2QH7kRjzqv38mZL4uUruiQWpSwVokI02uyWzJVLaUxVNwQ7ol7QffQGxPCYBTJL
	Nwisdm16F7oD8k2V1qLFxzBjk0MaODoARtl/rwvZDP+ST9/wurfoDeyu3g5DIjjtDrT9L6e7bHe
	jYPHu5VHY8UYlnpVP47mFxT+WhIVB/sz1y+HyT8PLdQb7mrfx4nZY+XbI9nY7qKqx9Rt6DS+/mx
	A95Yra+QOOrZ8DghBGCPoeHcRC7uy8AMtEh4l39SbAsFXUUf7fd8MJxUm2Fe8SXOWxFZXS2nkxm
	wW47PoO6lG02kjOOy5OFX6zYRchx/WKFgAU3Xnj1t1StGCsAnTw8DcQ5gO6GMNDLgVucGyi3TOm
	EE285ee2FVsvOu+URkhK8SuVvGh0zpJIzWHVmQCqI3Zd+uLaieQLT77oiTQNJbP7uoptaWnspT7
	fkfIt8Ptdx83/lJ+v7BmOrlfODv2zaIrTdoaOHddqLoT2IL84neT1XB
X-Received: by 2002:a05:600c:19c8:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-49987ad94c3mr300237535e9.8.1786954852026;
        Mon, 17 Aug 2026 01:20:52 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:51 -0700 (PDT)
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
Subject: [PATCH net-next v20 04/10] mfd: an8855: Add support for Airoha AN8855 Switch
Date: Mon, 17 Aug 2026 10:20:26 +0200
Message-ID: <20260817082034.20326-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012054_291697_E168620B 
X-CRM114-Status: GOOD (  27.01  )
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
 drivers/mfd/Kconfig         |  13 +
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/airoha-an8855.c | 523 ++++++++++++++++++++++++++++++++++++
 3 files changed, 537 insertions(+)
 create mode 100644 drivers/mfd/airoha-an8855.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782..4d763ed6e53d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -54,6 +54,19 @@ config MFD_ALTERA_SYSMGR
 	  using regmap_mmio accesses for ARM32 parts and SMC calls to
 	  EL3 for ARM64 parts.
 
+config MFD_AIROHA_AN8855
+	tristate "Airoha AN8855 Switch Core"
+	select MFD_CORE
+	select MDIO_DEVICE
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
index dd4bb7e77c33..00eab2c9f55f 100644
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
index 000000000000..0e8b3550d9e5
--- /dev/null
+++ b/drivers/mfd/airoha-an8855.c
@@ -0,0 +1,523 @@
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
+	unsigned int switch_addr;
+	u16 current_page;
+};
+
+struct an8855_phy_priv {
+	u8 addr;
+	struct an8855_core_priv *core;
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
+	val |= write_val & mask;
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
+	if (priv->current_page != FIELD_GET(AN8855_PHY_PAGE,
+					    AN8855_PHY_PAGE_EXTENDED_4))
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
+static int an8855_phy_register(struct device *dev, struct an8855_core_priv *priv,
+			       struct device_node *phy_np)
+{
+	struct mdio_regmap_config mrc = { };
+	struct an8855_phy_priv *phy_priv;
+	struct regmap *regmap;
+	struct mii_bus *bus;
+	u8 phy_offset;
+	u32 addr;
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
+	snprintf(mrc.name, MII_BUS_ID_SIZE, "an8855-phy%d-mii", addr);
+
+	bus = devm_mdio_regmap_register(dev, &mrc);
+	if (IS_ERR(bus))
+		return PTR_ERR(bus);
+
+	return fwnode_mdiobus_register_phy(bus, of_fwnode_handle(phy_np), addr);
+}
+
+static int an8855_mdio_register(struct device *dev, struct an8855_core_priv *priv)
+{
+	struct device_node *mdio_np;
+	int ret = 0;
+
+	mdio_np = of_get_child_by_name(dev->of_node, "mdio");
+	if (!mdio_np)
+		return -ENODEV;
+
+	for_each_available_child_of_node_scoped(mdio_np, phy_np) {
+		ret = an8855_phy_register(dev, priv, phy_np);
+		if (ret)
+			break;
+	}
+
+	of_node_put(mdio_np);
+	return ret;
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
+	/* Reset PHY page for switch address */
+	ret = an8855_mii_set_page(priv, priv->switch_addr,
+				  AN8855_PHY_PAGE_STANDARD);
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
+	ret = an8855_mdio_register(dev, priv);
+	if (ret)
+		return ret;
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


