Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5147BCC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1UhGspZt3n8d7AimaUoaUHhmKl1e/RrKismBjq1j3Q=; b=OzIL/XvIvErhA5suDBtF2nePH7
	R0eK27+veFTrNay+auV5vsyiY+IrdIsiky3w2J3qF4uGtHMFyc30UzR1vqNXHrJ1gD+pEWWRTHWtc
	NDeHQa5nYzSc7wmYD8NGDOWU0yAhmlzT294xUkXJTkUIyp8kf+no2d3/UHbC3NZwLJz0imuQAYd9o
	QOmpmysrOlGs8YniSstvyV+D99MBWAp3qlTDBJc4CCM4LMFYzFB3y+MjeLebIaOXXCTN5UpSuwAwe
	+VX11e66FXJYV9igzh7CMpq0yRevCZPj0nxP2aLm55SIwSzyNS/CNpQ5GDDLZQqZYbQwSCD3DK0Lw
	EzsBmW/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKf-0000000EjZu-3zp2;
	Wed, 14 Oct 2026 07:23:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKQ-0000000EjK8-1rtT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2164131f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962588; x=1792567388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1UhGspZt3n8d7AimaUoaUHhmKl1e/RrKismBjq1j3Q=;
        b=d/HQV/0/ZqDbn+lL+52OuMTyH87nVHhsNnlAEgVNDiWX7dzi9N1+6eLZ9DYECsTLhM
         y3y/H0C2SkSQOHkcfrF++f2940VdHm7i+q/+g+4AaiGHhDA+0Etye1fhqLSdLUp43UlV
         zSq35f5AxV0bmdp8S7EQ6JK50+Qvsq4joyZZh7FtJJciJAkrfrLZrbKdO7HxKDy8NFqQ
         I+qfa6mzsnGKRsxO6MGirF2hU5ypNBtSG5sORBoLElsF7uZdGEFn819lrPM7dVFV/v2a
         01HzSUzfwjgZ7sAYZNV5YgVElNPh+jEkN8/jrYSyg8+cdUdl3hug53ooi2MSWCIdab85
         gEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962588; x=1792567388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1UhGspZt3n8d7AimaUoaUHhmKl1e/RrKismBjq1j3Q=;
        b=ShEI3G7UrQ+9VZNLaGYvq2hG3s/OyAbXfhkgj5CyXbiooKu+vC7Ij/ZguLw2k5FWMe
         hf6jEh+45KD6uoGfbBcQcHaw2HcMfc9iwTduBIr4oGpjGmpja+ZQQc5uHmYV9QryzktK
         8Wpn8OcYwGiNJosVl+KamG5q74e1o3YrcN6GZ16W5KI63qcYKxGANFh09REaPBm48V3Q
         HJVbiIXeVAfbnrlH7f954NSw0Nc/tZogZNDUZdpaMIyOG7I3PO+/TpWaeeCMfDlqZh25
         CRzmUopostaubkmRvi4CzriPtUCQg1K2DSgCaPWG89RtSdeclZ3ClfevFnc+ZfnjkyrV
         Zm9A==
X-Gm-Message-State: AFq9FYK2bim1dNFOe/yxGsUUoJDd/zXEyBbqHJhpAvgURIh/k5aKSmpf
	I29dUGSiSn72X6kIcnpY4byKom90Lo7JtC0cQyC4oKdazq80/x3jJwwwnTIq4VthDgNbag==
X-Gm-Gg: AYBFou1kq6vknm/m0r8NCLMsOvxV6T2uw3WG1AbYmdfUiZ6wipsioJFmW5jkVrEklaW
	ceVjBiboGI/aeUBZ0wRzRRvYHXqFUqTwKLkEBACE3B2Acf/EGJ9ff/kkyYURbnqwY07NjxJE6Hy
	rbpZ8x34BtLbXtaNzAAYzM5RhnHuaH3qnkJd3oOdnllZHGGwhRugcbfJ1/zPIm+TKPBw8sgdhl+
	oPHoncGuX7FV+Ev57OiRklxirPxWuEB5Dst2gQF23L9mmDC9vBVAMqnaTahAiVEIgZVe1q7YQkk
	p6q68EC80gpGMBO2Z/coKhqqWhUTC+VjQUpIuA+6gf3W4Gs55rIa/ZURyQJH10yK2j7tTy/dMTz
	MMuaW5VCNcpSDDu19QTSccnhrSDxLGml2CfwEULZG9YdtAR//DiYUyOdp1P30QIfFUliz2yPqHv
	LxWws0cztamZLTn2qDWIoeu8/SprxytnENrNX+WR3vqNIJFxwE6rnEI5sdWb0rNr987VW7THiQL
	lfjFTzh1QzUKBYk9JX/ITJ102mVhufOOrkwySPzIToXJe9I4VMcfjBlgVQTTHvqcYZg5+uzd/z9
	19Ak62c/dF1HsxlAzknGErQthOF5JCempEaf5ICe2jrHmUNavZ1MZuqxz1bKJicJW1qfrRH1
X-Received: by 2002:a05:6000:2c06:b0:48d:ed3c:4cdd with SMTP id ffacd0b85a97d-48ded3c5789mr1068940f8f.49.1791962588408;
        Wed, 14 Oct 2026 00:23:08 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:07 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 15/24] net: mdio: Add ZTE ZX279128S MDIO controller
Date: Wed, 14 Oct 2026 08:20:55 +0100
Message-ID: <20261014072109.1759502-16-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002310_521328_9652DE8A 
X-CRM114-Status: GOOD (  23.55  )
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

Provide bounded Clause 22 transactions and managed clock and MDIO-bus
registration.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/net/mdio/Kconfig          |  11 +++
 drivers/net/mdio/Makefile         |   1 +
 drivers/net/mdio/mdio-zx279128s.c | 157 ++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-zx279128s.c

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index a05229838c..59812a082a 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -199,6 +199,17 @@ config MDIO_THUNDER
 	  ThunderX SoCs when the MDIO bus device appears as a PCI
 	  device.
 
+config MDIO_ZX279128S
+	tristate "ZTE zx279128s MDIO bus controller"
+	depends on ARCH_ZTE || COMPILE_TEST
+	depends on HAS_IOMEM && OF_MDIO
+	help
+	  This driver supports the MDIO controller of the ZTE zx279128s
+	  SoC. It reaches the PHYs of the integrated switch and, on boards
+	  such as the ZTE ZXHN H3600, an external PHY.
+
+	  To compile this driver as a module, choose M here.
+
 menu "MDIO Multiplexers"
 
 config MDIO_BUS_MUX
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 0485867460..ce21e1496c 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_MDIO_REGMAP)		+= mdio-regmap.o
 obj-$(CONFIG_MDIO_SUN4I)		+= mdio-sun4i.o
 obj-$(CONFIG_MDIO_THUNDER)		+= mdio-thunder.o
 obj-$(CONFIG_MDIO_XGENE)		+= mdio-xgene.o
+obj-$(CONFIG_MDIO_ZX279128S)		+= mdio-zx279128s.o
 
 obj-$(CONFIG_MDIO_BUS_MUX)		+= mdio-mux.o
 obj-$(CONFIG_MDIO_BUS_MUX_BCM6368)	+= mdio-mux-bcm6368.o
diff --git a/drivers/net/mdio/mdio-zx279128s.c b/drivers/net/mdio/mdio-zx279128s.c
new file mode 100644
index 0000000000..fa0aab5b28
--- /dev/null
+++ b/drivers/net/mdio/mdio-zx279128s.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ZTE zx279128s MDIO controller
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+
+#define ZX_MDIO_DATA_WR		0x04
+#define ZX_MDIO_DATA_RD		0x08
+#define ZX_MDIO_CFG		0x0c
+#define ZX_MDIO_STATUS		0x10
+#define  ZX_MDIO_STATUS_DONE	BIT(0)
+#define ZX_MDIO_CMD		0x14
+#define  ZX_MDIO_CMD_REG	GENMASK(4, 0)
+#define  ZX_MDIO_CMD_ADDR	GENMASK(9, 5)
+#define  ZX_MDIO_CMD_WR		BIT(10)
+#define  ZX_MDIO_CMD_RD		BIT(11)
+#define  ZX_MDIO_CMD_CLK_DIV	BIT(12)
+#define  ZX_MDIO_CMD_BIT13	BIT(13)
+#define  ZX_MDIO_CMD_START	BIT(14)
+#define  ZX_MDIO_CMD_BIT15	BIT(15)
+
+#define ZX_MDIO_POLL_US		10
+#define ZX_MDIO_TIMEOUT_US	2000
+
+struct zx279128s_mdio {
+	void __iomem *base;
+};
+
+static int zx279128s_mdio_xfer(struct mii_bus *bus, u32 op, int addr,
+			       int regnum, u16 data)
+{
+	struct zx279128s_mdio *priv = bus->priv;
+	void __iomem *base = priv->base;
+	u32 cmd, val;
+	int ret;
+
+	/* Clear the previous command and its status */
+	writel(readl(base + ZX_MDIO_CMD) & ~ZX_MDIO_CMD_START,
+	       base + ZX_MDIO_CMD);
+	writel(0, base + ZX_MDIO_STATUS);
+
+	cmd = readl(base + ZX_MDIO_CMD);
+	cmd &= ~(ZX_MDIO_CMD_WR | ZX_MDIO_CMD_RD | ZX_MDIO_CMD_ADDR |
+		 ZX_MDIO_CMD_REG);
+	cmd |= op | FIELD_PREP(ZX_MDIO_CMD_ADDR, addr) |
+	       FIELD_PREP(ZX_MDIO_CMD_REG, regnum);
+
+	if (op == ZX_MDIO_CMD_WR)
+		writel(data, base + ZX_MDIO_DATA_WR);
+	writel(cmd | ZX_MDIO_CMD_START, base + ZX_MDIO_CMD);
+
+	ret = readl_poll_timeout(base + ZX_MDIO_STATUS, val,
+				 val & ZX_MDIO_STATUS_DONE, ZX_MDIO_POLL_US,
+				 ZX_MDIO_TIMEOUT_US);
+	if (ret) {
+		dev_err_ratelimited(&bus->dev, "timeout (addr %d, reg %d)\n",
+				    addr, regnum);
+		return ret;
+	}
+
+	writel(0, base + ZX_MDIO_STATUS);
+	writel(readl(base + ZX_MDIO_CMD) & ~ZX_MDIO_CMD_START,
+	       base + ZX_MDIO_CMD);
+
+	return 0;
+}
+
+static int zx279128s_mdio_read(struct mii_bus *bus, int addr, int regnum)
+{
+	struct zx279128s_mdio *priv = bus->priv;
+	int ret;
+
+	ret = zx279128s_mdio_xfer(bus, ZX_MDIO_CMD_RD, addr, regnum, 0);
+	if (ret)
+		return ret;
+
+	return readl(priv->base + ZX_MDIO_DATA_RD) & 0xffff;
+}
+
+static int zx279128s_mdio_write(struct mii_bus *bus, int addr, int regnum,
+				u16 val)
+{
+	return zx279128s_mdio_xfer(bus, ZX_MDIO_CMD_WR, addr, regnum, val);
+}
+
+static int zx279128s_mdio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct zx279128s_mdio *priv;
+	struct mii_bus *bus;
+	struct clk *clk;
+	u32 val;
+
+	bus = devm_mdiobus_alloc_size(dev, sizeof(*priv));
+	if (!bus)
+		return -ENOMEM;
+
+	priv = bus->priv;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	clk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get the register clock\n");
+	clk = devm_clk_get_enabled(dev, "wclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get the work clock\n");
+
+	val = readl(priv->base + ZX_MDIO_CMD);
+	val &= ~(ZX_MDIO_CMD_START | ZX_MDIO_CMD_BIT15 | ZX_MDIO_CMD_BIT13);
+	val |= ZX_MDIO_CMD_CLK_DIV;
+	writel(val, priv->base + ZX_MDIO_CMD);
+	writel(0, priv->base + ZX_MDIO_STATUS);
+	writel(0, priv->base + ZX_MDIO_CFG);
+
+	bus->name = "zx279128s-mdio";
+	bus->read = zx279128s_mdio_read;
+	bus->write = zx279128s_mdio_write;
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
+	bus->parent = dev;
+
+	return devm_of_mdiobus_register(dev, bus, dev->of_node);
+}
+
+static const struct of_device_id zx279128s_mdio_of_match[] = {
+	{ .compatible = "zte,zx279128s-mdio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, zx279128s_mdio_of_match);
+
+static struct platform_driver zx279128s_mdio_driver = {
+	.probe = zx279128s_mdio_probe,
+	.driver = {
+		.name = "zx279128s-mdio",
+		.of_match_table = zx279128s_mdio_of_match,
+	},
+};
+module_platform_driver(zx279128s_mdio_driver);
+
+MODULE_AUTHOR("Navid Ghahremani <ghahramani.navid@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx279128s MDIO controller driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0


