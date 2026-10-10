Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C63CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ON0MFr8eOk4lIfhGI46AGmWJn585om57WClZUKBxXg=; b=k4B3pWIROqNHEfux4mEV8GIuAX
	yS7m2MBlI7+GnT+2ybAnjnQfZbaztY728fGe5OfMQ6U516DUiMpzkX75JFnrdqLyJuZKVIRt/Wnw9
	aVB9Oi8EH2HvC/1frOLS7jNCTiQV/ocwvOSVjAioUvhg1SFGCZuRwP7houV1mzbqdJKU6xuzRFQEV
	U1ULy0EQmw9HGdC427EXathjxXqONTP4h4thaB7sFd+/AeO905fgNgaDudC2/H5wLn9ctoD7W53zx
	Fgcr2A7l9pnI5/xWO0Z4Yvb5vdxUomiRfENP1nRlJOIbArzpbfHX1vGHDzz6FSuQe1bAOLv5zCm83
	YaAURjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWhb-0000000843g-1J0q;
	Sat, 10 Oct 2026 13:01:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgv-000000083KB-3JhP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso474839f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637244; x=1792242044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ON0MFr8eOk4lIfhGI46AGmWJn585om57WClZUKBxXg=;
        b=M2WM1+BdQL/0+cBs/0CqtgtiBxNV3ywGfeXNqkeH8TjC8aASrE4da75fLhENoysP1G
         RfzZSdM/UsApYxNuv5lmFlhvPoia8wlP9rwMkWIuJLfHxP7GweyxyijLxeeGVtKXW5Or
         CjI8tXFls6FwTRjcQ9iGx7jbyD0wn8wyHdU+G8LJLiWdQyWScl435mchLHeVggsWEboB
         tZb+x2X1LcnRGjm+M9QNHmd1Dosr+LH8X3utAUMGQdDB+8/fBs/GVc5M/xVS+/XZbiUb
         Lp9T07O96y3r1FCPB9m5LJngvq4FmzCfdjcH6OTLtmsWE/9ZDBO/4SIBLt/KqMYevM9g
         QXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637244; x=1792242044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ON0MFr8eOk4lIfhGI46AGmWJn585om57WClZUKBxXg=;
        b=bM+QfxmR98fEGlCmFMZZxD9B6Iylm5AJ86ZXb99INY0J7ny5juYuWPrIKsiRs+bS/D
         Ac4zDtcHP4rIC1nty4b2wODz5s9dhsy3I4mjlIBFUKyGP8sq6RNn+A2SC3MAInUeqA3i
         iBWTheJnlcCDBiddbXhA50iqZbCD5PlBvfF3brWR0ixVJ9RLQKjiHtwVtoz8wDJ3GB7W
         4khnjZ/JZ+cyK4zpMC4xknYgDN+z7JOQqELuO+HkMOk7/XUAnbVwnC7jOu57FvJA9DkL
         8+GtesypEK32cpS3QwKZTqSsPHrAYWS6uLufjyCQ+FrmhTxyZTlAaAMVuZXTU4MIfHvO
         wbBg==
X-Gm-Message-State: AFq9FYLk4GE94Wpw2P/yQ+uWIiVSg2OS/mUdMTJ12/uh6TBxJ1SwXbF+
	cGEUKgbNnUA/jqXt5M1aBascxc9WaS3JUbgm9uy4TbRq20zNMv6NNKL9aUzY49kub0DOrQ==
X-Gm-Gg: AYBFou2mvSNxbT4w7HtkTaUS16SjNN65ZGk6fdP3RoneG0/sJGkh4CKFTyaRVRjlVK3
	m2QvOd/55ZBg2BdoSOgNK3E6DYrtfRpLn/ihh44R/WDsuJ5wcyCJLu05I0XW9RbV7H+7Pf1HLdS
	AKlf1zOECDtoNrPcFKS5sdWwPRlne4fwYKAdlpL3OxOwBXeOJVzTfp/K8YsRBvViq49F47Rzsx0
	6s1vP9vxSWEicAKxMz3UG97UVwExvnfgFnyEdMqVaSFe/+NfVuPe7Itvq5gtS5+zLXdGwvygl33
	iKhqwhnWXn5VvwW5EvzLC0fhx8HT4gwdlVFjAH87SuV9Fwqny2IpRMiB4NAYi0D/xG88Y4rglpm
	jUwYwJNYX6QuZi4fY4YwJDkvYl6yo5fKNwAhLaspFGTmIECU/p4PtulW63YoG9BmuVvzDNomdrq
	cif4ZdOEjlF2SzY9ExezmgfhzkTHub6kO7F0NmoPGPnWwh5Nmi2FEQfLrQkUp95C0VzoFZG1ymn
	ul87D3ULDy9O/znmsi9yRT8WW1NpFl36Tf3HFV/lC6UW+djIICxw5xocy1DVA1TPr/QjG9wl1bm
	GVYOJrmhV2bbjVvnoN5ItV/02hqByA/mwXGNcvhYjg/HOl1+hOOA+l+LIfjmobs=
X-Received: by 2002:a05:600c:3b8b:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a18e4a7cfcmr108085995e9.26.1791637243732;
        Sat, 10 Oct 2026 06:00:43 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:43 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 15/24] net: mdio: Add ZTE ZX279128S MDIO controller
Date: Sat, 10 Oct 2026 13:59:53 +0100
Message-ID: <20261010130024.177503-16-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060045_863686_98FA669F 
X-CRM114-Status: GOOD (  22.81  )
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

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/net/mdio/Kconfig          |  11 +++
 drivers/net/mdio/Makefile         |   1 +
 drivers/net/mdio/mdio-zx279128s.c | 158 ++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
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
index 0000000000..4c4a9ada68
--- /dev/null
+++ b/drivers/net/mdio/mdio-zx279128s.c
@@ -0,0 +1,158 @@
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
+#include <linux/mod_devicetable.h>
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


