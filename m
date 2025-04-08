Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3984FC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/oMSgq7sYFkno4RV+Q5yWXEvKJ7n0a3OFGNv6kqHBM=; b=J0dlFGrVUn6HEMKLurI1BjmTC7
	3sMm9WN9z4dwTvBGnlpmmTvM0fijkBStFAOEAS6ohO/levpHuhtwLVigHSRU1Ye+eQd86MNF2HLYF
	6I7c3Nr7c7frL02TDSO5HNpFugPjqDkd0j0eQV0D5p7N5/OTxDU6qf3BE27T3iPKjARjkrywiz5eV
	/7vNakP2g5DjzuFVcDXYqryYXnh5tx+2TsycGe9MoGeQ2j+1bEByDOTKjN56hWQiZxFqhIaiy5xoB
	WrQaKZR9mKyWeCZzYPzcSoEzKWNywW44qxreV7oXi2ZOr0ioS8SVejhfJl0zOjqiUJex4E8wMofOz
	+meFGd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25xR-00000003be5-0Loh;
	Tue, 08 Apr 2025 10:13:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25d6-00000003W9A-0VGq;
	Tue, 08 Apr 2025 09:52:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso3060660f8f.0;
        Tue, 08 Apr 2025 02:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105947; x=1744710747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/oMSgq7sYFkno4RV+Q5yWXEvKJ7n0a3OFGNv6kqHBM=;
        b=BQYVuReDyWLRRStAKEHqlCBvoIqiLqyCrqvkk7WspvH5HQU39yc0pSSibOjPAs8daR
         RGb0WcBvmMe9cpzK0Jk4ToRzIjy8feTqA00l27hOE7UhowfMe/GCusViyeTmkiXh0+Dd
         r2p+TBALJ3tNSl1mKSGXbDh6Mz2lhL3643L2Ff2iYdwel8A3Y7eFMbYT5lNZ2FANrM4I
         P4UV1Mf1uCHasC7x+ls5lw+uDKEoA7z8Ani1XLUYa3Fyd9Z1NE413GehFQX/Z8olyt3j
         HPZ8xdEPe455pEyvUYgQPYZArQ6CGRbWMG0aG0paXTqbyEac4QMLU3deuGGYDptFY0GK
         CVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105947; x=1744710747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/oMSgq7sYFkno4RV+Q5yWXEvKJ7n0a3OFGNv6kqHBM=;
        b=KNYRTL3ILeOa35BR29953H5qFjGwKk+Mk4d5mQ66kGrDdizz/PRmoVNpj2bFRudQj7
         aNUeNONYaIctv628b7rho+mSlAhUexcWKXQfrZYosyzAAlb2I7UR4st5qHHx37L6S/iy
         r59HH8F3VKV0Gb0StMMdxe6B0kuL8T0ojUxxKEGCNkA9AY4CXCrmdQPXxyN/UbMhOVtS
         zNSiskUZjoZb5fnITtmW9UOThQbEFn3Q+ysfI3cTEiCIAYD08Xakt45q8Lz0rVxYBsov
         1HWKgyhCPNSaKYFO97ZjBTawaqRLeukW+2H5gvQ8gGIUFPgYITQFHXFpz99ZP3amb36m
         C5yA==
X-Forwarded-Encrypted: i=1; AJvYcCVBFTuN/mZ93jQTFLR++8pR1ki2337claL41Ut0mktpJ5/9lwc2kOAsw9tFu88VBNjvvk7MjjNrmBU0eW8Ydt0=@lists.infradead.org, AJvYcCWeJ3jPs6ZPoBJtf+5IJY8ThJL9XhJRksfVhHQyge80xE+Qy0RtY5MA5LDqsdhXeb7MNn8KOZqZZSf2GpS6NIfg@lists.infradead.org
X-Gm-Message-State: AOJu0YweISn/9BuCubMRsfhCM+BTb7rXL7tlB2e1YN3KxFVvvtSfiMpu
	QgVFbH0H7TVxOOylFsKa5ZrRO1fj8lKh7WQJwWhWRUcmVi/FCBdE
X-Gm-Gg: ASbGncvhNfMSyFHPDl0M44iwFxXCr2nmnMt8kLc7QcqWVQW/oGEAdL2S6xQolb8oW4q
	ixI777yf+XZvToKzIQs4d5F8zhn5Zq/f/rknrcgjnyHa1xWQuCpklvmPPJKrXBnESE0muY09T9d
	sasYNcTZHjaxWwIGXZi3WbMrA/675ff3bWWu7Rm7bEWIZmgmrJZm5mmav2V+0DdXzVVu96roovS
	JTuliMSR6wFzbrJjSRB9KM5b1Om+L5C93POrnRbyNacm5kd++mqs/dc+3sHdyt45roQpbjlKvaa
	SeZQ29xdT3Ce53g98VPGscWZgK+Dfm43IbFush5jct8J5um5ygjhEzKzoABVRW0jdJW/NI6P31q
	kcRC6UjEF65FBhg==
X-Google-Smtp-Source: AGHT+IGpjpd4CxIWAvXs4iDHSvrXVMcJ2nS+gwp8u4RZy/tfgUd7jRGBGybuKmuA2mz04D9BauX8oA==
X-Received: by 2002:a05:6000:4203:b0:391:3998:2660 with SMTP id ffacd0b85a97d-39cb35759c8mr12826712f8f.7.1744105946626;
        Tue, 08 Apr 2025 02:52:26 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:26 -0700 (PDT)
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
Subject: [net-next PATCH v14 10/16] mfd: an8855: Add support for Airoha AN8855 Switch MFD
Date: Tue,  8 Apr 2025 11:51:17 +0200
Message-ID: <20250408095139.51659-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025228_307956_9797B978 
X-CRM114-Status: GOOD (  25.51  )
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
switch and a NVMEM provider. Also provide support for a virtual MDIO
passthrough as the PHYs address for the switch are shared with the switch
address.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mfd/Kconfig         |  12 +
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/airoha-an8855.c | 429 ++++++++++++++++++++++++++++++++++++
 3 files changed, 442 insertions(+)
 create mode 100644 drivers/mfd/airoha-an8855.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 22b936310039..c5b5ee2f217b 100644
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
index 948cbdf42a18..f2095d57ab77 100644
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
index 000000000000..fb2edf3132f9
--- /dev/null
+++ b/drivers/mfd/airoha-an8855.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Core driver for Airoha AN8855 Switch
+ */
+
+#include <linux/bitfield.h>
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
+#define AN8855_PBUS_MODE_ADDR_INCR	BIT(15)
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
+	u16 current_page;
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
+static int an855_regmap_phy_reset_page(struct an8855_core_priv *priv,
+				       int phy) __must_hold(&priv->bus->mdio_lock)
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
+static int an8855_regmap_phy_read(void *ctx, int addr, int regnum)
+{
+	struct an8855_core_priv *priv = ctx;
+	struct mii_bus *bus = priv->bus;
+	int ret;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an855_regmap_phy_reset_page(priv, addr);
+	if (ret)
+		goto exit;
+
+	ret = __mdiobus_read(priv->bus, addr, regnum);
+
+exit:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret;
+}
+
+static int an8855_regmap_phy_write(void *ctx, int addr, int regnum, u16 val)
+{
+	struct an8855_core_priv *priv = ctx;
+	struct mii_bus *bus = priv->bus;
+	int ret;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an855_regmap_phy_reset_page(priv, addr);
+	if (ret)
+		goto exit;
+
+	ret = __mdiobus_write(priv->bus, addr, regnum, val);
+
+exit:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret;
+}
+
+static const struct mdio_regmap_init_config an8855_regmap_phy_config = {
+	.name = "phy",
+	.mdio_read = an8855_regmap_phy_read,
+	.mdio_write = an8855_regmap_phy_write,
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
+	struct regmap *regmap, *regmap_phy;
+	struct device *dev = &mdiodev->dev;
+	struct an8855_core_priv *priv;
+	struct gpio_desc *reset_gpio;
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
+	regmap_phy = devm_mdio_regmap_init(dev, priv, &an8855_regmap_phy_config);
+	if (IS_ERR(regmap_phy))
+		return dev_err_probe(dev, PTR_ERR(regmap_phy),
+				     "regmap phy initialization failed\n");
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


