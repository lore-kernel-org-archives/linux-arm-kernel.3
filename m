Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951FBC56201
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 02:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DteK7ahJcWyyf0jNlGCUan3gdCG+7fB8ZCtaU7OCkNA=; b=ifkLKuaHud8+26W2eHMlNPfjOT
	7sbpnhh6cBFhrUhSmQrQu9n+cEQ2TJ7OjJBmsn7c/m60QzElMiOzsc58utJIn4hX4EM/RBppKxP6F
	JiqbW6UONt4YtYraL10L2/LP+wbkR9aFbVHGM2IxXIFxP2Z4XGLRZnfwAMA2wdYEoDNsdeGZ5wJrW
	SRXiazMB/LP+ux2BWEllECY8tTvUdQff8iTDV7c+YQq8YVi8+Fbxpou5AQp2DOQeWX2bO3NT++XV/
	ODr6CkIxysioNtn4dCBtj7popcnCjip2bvs0iF9QLA8p5RS0YjLNHVPQKzWE2nbYZhU+FnQxg6tTn
	OfgRAsww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRN0-000000037TQ-3Br8;
	Wed, 05 Aug 2026 02:28:38 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRMu-000000037KZ-1Dc0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 02:28:35 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso384291a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 19:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896911; x=1786501711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DteK7ahJcWyyf0jNlGCUan3gdCG+7fB8ZCtaU7OCkNA=;
        b=eYBs37YMk9+86Anp6i6b73DsL9UN6YRn502U5xuGjXqeKr3AcUGB+Bnjd9WUnw77HO
         48sJXyxC36Uk2e0ak6PIAjdBOUm4ooddNES5hD1za8U1oZw1713ScHFuPXlcBrpiuqkR
         bndB4FXB3WgbgGfPjYZrzI/iqyODMBfrlG6WiWv4xiCsZhu5Bj4XlW8FbFul27zVZiSm
         fiBVDoxF2cYsZpT8BgybEX773IjtI7fjucvOdTYwYmapwIibTex/4QLoz2+23TB86W+A
         n3WDLRp46bLxXC8y9n5rbcAw2AXfDmPP3z22ckiU7UZvuUqmMilGy1Z+Axf+6jxJsuKA
         9ePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896911; x=1786501711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DteK7ahJcWyyf0jNlGCUan3gdCG+7fB8ZCtaU7OCkNA=;
        b=P9f36EJEqracLm98J6Y3iQRLTVrnCe+4dm/togaggrRi+8RH0JlPVBNI2gZkmbSx+s
         VAXW8inD/+s19u1WiQit13rWJNBLAnuAAETkCUgi2LsxQrGsJ45oxw4gBmfwbNPHzdqW
         AjtAE1zg16H9NfqPzqAs5rZO4UYZEoOcndhqZaiSHR8h0CB+/1kWCWv/SsDNEItAqxjj
         jwbLDVcaumt3ooXMkNfvO0FVqq7SD2G7+7PWbgez1npJeszCAV5csuk9Cjpirf2Aslij
         7GBW9Gg4MR7YAvGyjyaWvi/yM6UYNZm4DtS7/4g9ahvcU4MvdBNBz0gTLqplVT29OMeb
         0tlQ==
X-Forwarded-Encrypted: i=1; AHgh+RoaGlUsSVgbXQ37S+JTH4y04sWKBrqGe0KCNEEdNwInwRraSHWdmMf/jhvmBwXBFQz/hLKUo0I529aTGiIltmSG@lists.infradead.org
X-Gm-Message-State: AOJu0YxwZD6Vx89EKslUj0RnPwuCjv0h4WpX+eBIGdRV6sf7knoVWJAi
	yIEcVwDi04EP1JfJZSpDIem1g7qnmRZ1keF5bQ6b3PFqX1va3cxLhmIZ
X-Gm-Gg: AR+sD12m460es/ichWmzObFTT0IaCY6vBBSHGLcefrjrAc1Kv7WgNQw1iAQX7RxKzVZ
	41u9wd30K/kpR42OTBbTJuz3XXp8TYiEZ3X8YkqkK66cY6JqRqwSzi9bD5tyxPOscVrVkHGaEji
	pkumaiCW0GnSGFnJBU9sZ6e3Wy2C3aGpGbrBSHB/xkUotDr2o2SoO24tSwl2jFUci9df+4AvShi
	nVfFiWDGHLcC9oZ5SMZICqb11hayPCcvOR3Y18H2ZgoGPGm2QyKvXtghbo0PG+MEBnoXR+IVYLq
	7pC7cPqYC69SHfGJsX5zaSpoiwXU/BibM0Jlln3yl0nyAXIJFUObXdhQGTAiOcn+//nY6fGcAH0
	Gqi71zXUtxEn239zhbgcNpYv6C+Cw85B4n8lFpYvT0gbsRWIgR68dCb5Jso2pWWdA7RQtYOwOII
	n6dwpeVEYOpqdmIFtrhRRPOQZBZ+aGAClreU0uT7dq0vwUXmhXIYgcC3+8kA9Irw0sEOt2SiZ8m
	YfjOl2yEtjI1hM40nBiNqYpuS4MDLLp7x/mrki6OMEMALoI2tgjxvRL/txnoqyMQbZcD6qUyc1g
	yHSVhdL//T7X9UKcHVlo7nkuNq1ig2VwueBfmMGQiMlZ5/Qzcidl81eToYoaMEhpq5x2SCSC0cc
	mdqWL1itffHDi2Nlu
X-Received: by 2002:a05:6830:290a:b0:7f1:ddf1:c731 with SMTP id 46e09a7af769-7f1e5f6ca2dmr2589356a34.13.1785896911128;
        Tue, 04 Aug 2026 19:28:31 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:27:01 -0600
Subject: [PATCH net-next v2 3/8] mfd: add X-Powers AC200 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-3-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_192832_708542_03D5071F 
X-CRM114-Status: GOOD (  26.16  )
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

The X-Powers AC200 is a mixed-signal companion IC with a paged register
map accessed over I2C.

Enable the package supplies and input clock, prevent the clock rate from
changing, and apply the vendor settling delays around common reset.
Initialize the paged regmap, report the chip and package revision, and
instantiate the Ethernet PHY control child when firmware describes it.

Cache only the common page selector. Individual function resets can
invalidate other registers without regmap's knowledge, so all functional
registers remain volatile.

The AC200 and its children cannot initiate DMA. Mark the parent as
DMA-incapable before adding the child. Register the common-reset action
before the MFD child so managed teardown removes the child before
resetting its parent, and also reset the chip during system shutdown.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mfd/Kconfig  |  12 +++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/ac200.c  | 207 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 220 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782..3360c9b86be8 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -205,6 +205,18 @@ config MFD_AC100
 	  This driver include only the core APIs. You have to select individual
 	  components like codecs or RTC under the corresponding menus.
 
+config MFD_AC200
+	tristate "X-Powers AC200"
+	depends on I2C
+	depends on OF
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  Support for the X-Powers AC200 mixed-signal companion IC. The AC200
+	  contains audio, video, RTC and Fast Ethernet PHY functions and is
+	  co-packaged with some Allwinner H6 and H616 SoCs. This driver provides
+	  the shared register access used by the individual function drivers.
+
 config MFD_AXP20X
 	tristate
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c33..890e76a9ad00 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_MFD_DA9052_SPI)	+= da9052-spi.o
 obj-$(CONFIG_MFD_DA9052_I2C)	+= da9052-i2c.o
 
 obj-$(CONFIG_MFD_AC100)		+= ac100.o
+obj-$(CONFIG_MFD_AC200)		+= ac200.o
 obj-$(CONFIG_MFD_AXP20X)	+= axp20x.o
 obj-$(CONFIG_MFD_AXP20X_I2C)	+= axp20x-i2c.o
 obj-$(CONFIG_MFD_AXP20X_RSB)	+= axp20x-rsb.o
diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
new file mode 100644
index 000000000000..dd31205fe698
--- /dev/null
+++ b/drivers/mfd/ac200.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MFD core driver for the X-Powers AC200
+ *
+ * Copyright (C) 2019 Jernej Skrabec <jernej.skrabec@gmail.com>
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ *
+ * Based on the AC100 driver:
+ * Copyright (C) 2016 Chen-Yu Tsai
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#define AC200_SYS_VERSION_REG			0x0000
+#define AC200_SYS_VERSION_PACKAGE_MASK		GENMASK(15, 14)
+#define AC200_SYS_VERSION_CHIP_MASK		GENMASK(11, 0)
+
+#define AC200_SYS_CONTROL_REG			0x0002
+#define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT	BIT(0)
+
+/* Interface register accessible from every register page. */
+#define AC200_TWI_REG_ADDR_H	0x00fe
+#define AC200_MAX_REG		0xa1f2
+
+struct ac200 {
+	struct regmap *regmap;
+};
+
+static const char * const ac200_supplies[] = {
+	"ac-ldoin",
+	"ephy-vcc",
+	"rtc-vcc",
+	"tv-vcc",
+};
+
+static const struct regmap_range_cfg ac200_range_cfg[] = {
+	{
+		.range_max = AC200_MAX_REG,
+		.selector_reg = AC200_TWI_REG_ADDR_H,
+		.selector_mask = 0xff,
+		.window_len = 256,
+	},
+};
+
+/*
+ * Each AC200 sub-block can reset independently, invalidating its register
+ * contents without regmap's knowledge. Cache only the common page selector;
+ * this avoids a selector read-modify-write for every access on the same page
+ * without ever returning stale functional-register values.
+ */
+static bool ac200_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg != AC200_TWI_REG_ADDR_H;
+}
+
+static const struct regmap_config ac200_regmap_config = {
+	.name = "ac200",
+	.reg_bits = 8,
+	.reg_stride = 2,
+	.val_bits = 16,
+	.ranges = ac200_range_cfg,
+	.num_ranges = ARRAY_SIZE(ac200_range_cfg),
+	.max_register = AC200_MAX_REG,
+	.volatile_reg = ac200_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static const struct mfd_cell ac200_cells[] = {
+	{
+		.name = "ac200-ephy-ctl",
+		.of_compatible = "x-powers,ac200-ephy-ctl",
+	},
+};
+
+static int ac200_disable(struct ac200 *ac200)
+{
+	return regmap_write(ac200->regmap, AC200_SYS_CONTROL_REG, 0);
+}
+
+static void ac200_disable_action(void *data)
+{
+	ac200_disable(data);
+}
+
+static int ac200_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device_node *ephy_node __free(device_node) = NULL;
+	struct ac200 *ac200;
+	struct clk *clk;
+	unsigned int version;
+	int ret;
+
+	ac200 = devm_kzalloc(dev, sizeof(*ac200), GFP_KERNEL);
+	if (!ac200)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(ac200_supplies),
+					     ac200_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable supplies\n");
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable input clock\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to lock clock rate\n");
+
+	ac200->regmap = devm_regmap_init_i2c(client, &ac200_regmap_config);
+	if (IS_ERR(ac200->regmap))
+		return dev_err_probe(dev, PTR_ERR(ac200->regmap),
+				     "failed to initialize regmap\n");
+
+	i2c_set_clientdata(client, ac200);
+
+	/*
+	 * No minimum delay is documented. Match the vendor driver's 40 ms delay
+	 * before its first AC200 register access after enabling the input clock.
+	 */
+	msleep(40);
+
+	ret = regmap_read(ac200->regmap, AC200_SYS_VERSION_REG, &version);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read chip version\n");
+
+	dev_info(dev, "AC200 revision %#lx in package %lu\n",
+		 FIELD_GET(AC200_SYS_VERSION_CHIP_MASK, version),
+		 FIELD_GET(AC200_SYS_VERSION_PACKAGE_MASK, version));
+
+	/* Run after the MFD children have been removed. */
+	ret = devm_add_action_or_reset(dev, ac200_disable_action, ac200);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ac200->regmap, AC200_SYS_CONTROL_REG, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ac200->regmap, AC200_SYS_CONTROL_REG,
+			   AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
+	if (ret)
+		return ret;
+
+	/* Match the settling interval used by the vendor initialization. */
+	usleep_range(1000, 2000);
+
+	/* Neither the AC200 nor its child devices can perform DMA. */
+	dev->coherent_dma_mask = 0;
+	dev->dma_mask = &dev->coherent_dma_mask;
+	ephy_node = of_get_compatible_child(dev->of_node,
+					    "x-powers,ac200-ephy-ctl");
+	if (!ephy_node)
+		return 0;
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, ac200_cells,
+				   ARRAY_SIZE(ac200_cells), NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add MFD devices\n");
+
+	return 0;
+}
+
+static void ac200_shutdown(struct i2c_client *client)
+{
+	struct ac200 *ac200 = i2c_get_clientdata(client);
+
+	ac200_disable(ac200);
+}
+
+static const struct of_device_id ac200_of_match[] = {
+	{ .compatible = "x-powers,ac200" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ac200_of_match);
+
+static const struct i2c_device_id ac200_i2c_ids[] = {
+	{ "ac200" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ac200_i2c_ids);
+
+static struct i2c_driver ac200_driver = {
+	.driver = {
+		.name = "ac200",
+		.of_match_table = ac200_of_match,
+	},
+	.probe = ac200_probe,
+	.shutdown = ac200_shutdown,
+	.id_table = ac200_i2c_ids,
+};
+module_i2c_driver(ac200_driver);
+
+MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
+MODULE_DESCRIPTION("X-Powers AC200 MFD core driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0


