Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037CEC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 20:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx9y/Q4rUmTnVZBD/oVaP0c3pNlAmpBQq+Yqe1RoBhg=; b=rF146ZUuVlzS9GuG0VIjL4tQlw
	/KuIAJIuoAYlJKmtTte0Zkh4o8ollvQUChUhTOPjMEoNsock4Vw4eWKQpA7StJrxyn3zHSB7EC0sE
	XG1kYufiAtku/MCjhyrVgrr9oTVM04/5jH5bz6zS30+qBOMKG8uUD20AjxeD0BDkf21/bd0iGPiPI
	1AH4Iv9kRmejKtFVkTTdCr/2oNLjJ+A0k9yfY5b7AmFUB6NG8mT7TBpqEJRCUxpLvpoV8GUQxX8W5
	LOWlgc8wy0l0dJpuzm+cVilhaE+8kav8nD6b0gimxfQcf95vRNcnZANnER9wA/SFkUzXBJ5UsguOt
	PFUR3g6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqctA-0000000G1Xa-2nd3;
	Sun, 02 Aug 2026 20:34:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqct8-0000000G1VL-0o2U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 20:34:27 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1612344f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 13:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702864; x=1786307664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9y/Q4rUmTnVZBD/oVaP0c3pNlAmpBQq+Yqe1RoBhg=;
        b=UOTgv2u1uxkArEXVozjL727z5U5lmgR9eB2B6+BfnHHRZfbjk94z2zHwogsFj/RteU
         yJ3N5tT/pz5gmMEgojjJrl3VmtWN8d751wUKWgnlnvnjWoaS1/iIj47V88F+2BQhd9nd
         RqvOxPZ/Sd5e+G7r82koNWacny6rA9489V6jywaZP/Pxga6sbmp5+/8XTFiv/6fRbR/F
         A1cdaS0yDNxxTcIRNoZZKgh921A6vjMpwVRGyWNM/wRyZerKeortfK1Xo7dsDrP8cc8N
         NElGxnO4oJ8GfihHl/bqmujMrq4ipmBmnHvZWgy0sDxZHBWwY7JpRNj1nXAmaT1rshhg
         78Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702864; x=1786307664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yx9y/Q4rUmTnVZBD/oVaP0c3pNlAmpBQq+Yqe1RoBhg=;
        b=Fk/7Tw54KtVjmYMi0dLS3wHaRWNwHOiDYOxvVzvRTFPFx5FKQzvr70Rc+rpayPWG3E
         2WzEyiiYZukvdATvT5/0DdUYfXmJb7UCJR5P7ZA6TV95z3SSPwKS8SvimoShAoPvA+4f
         Mk79opIgitWDYB5iv0S3+Gw1xsrulYPVpTBvS2LfWccvK/+Q7BcxdsOKmKSNZYq5et3h
         OjlGfrHJERvduiriLGrYlF1FO+wLVLF/Y78MQgszdHL+Cj+lditP5ON9QYnMysY3d2oD
         77WV49kPnDxAsP+hYGIWBOItTRANIkqpVcoVs4PXXOCGFu2qz8AESRw7EYrETLz8BIQF
         O9Jw==
X-Forwarded-Encrypted: i=1; AHgh+RqEcYLB7qNygyb1skcQAA5yaxC+ea++Ydg8xLpqUlUyHmZ+bE71hnBinYu0D9BoRYfUaG+vbbENzfN+JUXea0IU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0MDardM5cqQKm+YYJ5W2YG0nxfflFleR/Bg4M0LAdETkNMQUc
	7WCZxq0/jXzBhJsFzqTwJuwvVOOzODujYdBihZfXmXJX5n7eUDllOIs5
X-Gm-Gg: AR+sD132dZJv8XQHZ6Tl5DtclY/KRaTYapiyNCzJ7smsFZbhWoqeF3Nw1o0uflPbzdt
	jZgae1uzF1KTNsAJNN3gThS8kHgiANw8AL3ZXd2tzLepwo8KplY/qjaWYRlNvnH4xAWEP5HLzDp
	4gk2afnuC/Kb1U4s3yIxlnVFrmuz2dMckxLxo59dXh5B6/HrtKXZvvhHAfny3JAyDiptsPQFhGF
	G5UCEIU8WbnMofJAJJHxCAXJ/tZVCIP3v3xncIPLBFCBm9ehS8iXEr2OQiTmlpZDZLLP2d+D7rD
	wZ5HYWPrzBMP+qOIbZ51AhzyyXfo12/liQtsH5JO0GKN7TioNQTvqWGurCX3a3rAolmw52LWw9W
	ngDiIun9r3GEB6HUz/Kk7/W/aSP7Eqnl+5g6J3B8rf+AkOFLM6mv9XXsKbGm8/agRIxgZ0BbzC2
	hJSycIP/an+CAGxk069+NNoKFIqlQg/zITytmcUXmW80+jDFZGAvrMZMqG/uTFS+jIRBTvJR5F
X-Received: by 2002:a05:600c:190f:b0:495:39aa:1359 with SMTP id 5b1f17b1804b1-4980c66b43fmr121883265e9.3.1785702864156;
        Sun, 02 Aug 2026 13:34:24 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:23 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:36 +0300
Subject: [PATCH v9 04/12] mfd: zx297520v3: Add a clock and reset MFD driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-4-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8132;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=HDB6HKomcJYNmQDMZ6Gdx360Qh14RD85fFKiFafb3J0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6mysk8ZAIRhyiWgck/Nf3N8sNG9hqDSp4efE
 iQp2GBhrR2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKk+RAAp4FsiuVXDePHeCuEUimSugNlBdbsE6X
 r9DohvSpZN8c3PYA4atJj1AsgPChWzl1c+SMOdsEZCi6z/TyLE87mSYydsv9n5XzOoUdRMP05yD
 Qo1Yb6iQj53PB4SLYNLjEpzmuYOv+UTK4sZND4EoS8EHerOeXwF2vtJSXlCAfR8IYyMuXFwSEI3
 Ix46FLYJMvgqJNhHpglJpD09s9/slj8na6RI4sEjkTOBNFWJRhR9QxsNzpyZQAmixdcTfZHiUof
 g1gBC/eZIbMRJN/OOH3HffTLJ5nmrXr22oKJ9znSH/NyzjbH/4RMtmKwvUgxUf52PkgECFoXvmu
 LCd0SKSKKN2eXJmyZT6ZrxjPynsiETtnDjEEqp1dG7yTJ9bqCvOY8hutiS3j3rSpT6HZ1MLIpFA
 +cnr7gHGvztxiehgniyx6OsM2AidmnEjoa6J1xwfV02LkYVgvJ9y68nXBeSmC9qfCSpTpTcjUIq
 CXcXV57cmOpAVKkr3DHf6jjbmZpvPRUe8DVnyFLfXab9F+/jr7tvqbfScod4n9iJIK8EZD5DePt
 VZfhRNdRPLzLrweY88LEX3TNawe/+hrDO/j+Cx2bBLGgwNeVXgA8+W70yNjE9R3Z8/oF+KaJtUk
 9mJrMconBf35VXu1/Y+9AlotvjPa92q8H43Oe4XYdK8VqCi681dE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_133426_280803_FCF295B1 
X-CRM114-Status: GOOD (  34.91  )
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

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
the next patches will drive the respective functionalities.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

What I am still unsure about: How much sense does it make to have this
module-capable and able to unbind: In practice, the board doesn't work
without this driver and its clock and reset children.

Changes v9:
Deassert the LSP reset and enable the LSP pclk here. In practice the
boot rom needs to do that because it prints to an LSP-connected UART and
reads the boot policy from the LSP connected flash chip.

In doing so, I migrated the match data to an enum as mfd.md suggests.

Changes v8:
*) Remove .of_compatible from PHY mfd child

*) Move to drivers/mfd (Sashiko)

For me either soc/zte or mfd/ is fine. Note though that this MFD parent
is very specific to the zx297520v3 SoC. I don't expect this to be reused
anywhere else. There are two more MFD-ish devices in there: soc_sys at
0x140000, which I plan to handle in the same driver, and an i2c PMIC,
which would get its own host driver.

*) Use PLATFORM_DEVID_AUTO (Sashiko). NONE was intentional as I only
ever expect one instance, but I don't see any harm in doing the standard
thing and use AUTO

*) On the suggestion not to put the link to mfd_cells[] into match data:
I see that it is spelled out in Sashiko's mfd.md, written by Lee Jones,
the MFD maintainer. I would appreciate some education on the rationale
behind it: Putting a pointer into the void *data is a common pattern in
the kernel. I don't understand in which situation this can possibly
break?

Both structs are static const in the same compilation unit. data is a
const void *, not a uintptr_t or kernel_ulong_t, so it seems passing a
pointer is the intended use. What am I missing?

Changes v7:
Add phy MFD child

Changes v6: Make the ZTE SoC driver section depend on HAS_IOMEM
(Sashiko). The entire MFD section, which contains MFD_CORE, depends on
HAS_IOMEM even with COMPILE_TEST.

Add a NULL ptr check for of_device_get_match_data (Sashiko). While not
uniform, rave-sp, rohm-bd9576, atc260x, da9052-i2c protect against
incorrect manual attachment that way.

Add lspclk here as well in an attempt to satisfy both Conor Dooley, who
asks for MFD for top and matrix, and Philipp Zabel, who prefers aux but
at least wants the reset driver limited to one driver type.

Changes v5: Use MFD instead of Aux bus for top and matrix crm because of
extra functionality: Reboot in top, hwlock in Matrix.

LSP clocks stay with the aux bus and are thus not handled in this
driver. The clk driver will bind directly to the lspcrm node.
---
 MAINTAINERS                      |   1 +
 drivers/mfd/Kconfig              |  11 ++++
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/zte-zx297520v3-crm.c | 117 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 131 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e01ef014c110..b9f96455bca7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3915,6 +3915,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 35f6e9b76d05..c0c7e83487f4 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2572,5 +2572,16 @@ config MFD_MAX7360
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_ZTE_ZX297520V3_CRM
+	tristate "ZTE zx297520v3 Clock and Reset Manager"
+	select MFD_CORE
+	default SOC_ZX297520V3
+	help
+	  Say yes here to enable the driver for the ZTE zx297520v3 clock and
+	  reset manager MFD driver. This driver provides the host device for
+	  the clock and reset drivers and is required to boot the SoC. You
+	  will also need to enable CLK_ZTE_ZX297520V3 and RESET_ZTE_ZX297520V3
+	  to build the actual clock and reset child drivers.
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c33..4f6a78170ac5 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -303,3 +303,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_ZTE_ZX297520V3_CRM)	+= zte-zx297520v3-crm.o
diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
new file mode 100644
index 000000000000..37cd0c14680e
--- /dev/null
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+enum zx297520v3_mfd_type {
+	ZX297520V3_MFD_INVALID = 0,
+	ZX297520V3_MFD_TOPCRM,
+	ZX297520V3_MFD_MATRIXCRM,
+	ZX297520V3_MFD_LSPCRM,
+};
+
+static const struct mfd_cell zx297520v3_topcrm_cells[] = {
+	{
+		.name = "zx297520v3-topclk",
+	},
+	{
+		.name = "zx297520v3-topreset",
+	},
+	{
+		.name = "reboot",
+		.of_compatible = "syscon-reboot",
+	},
+	{
+		.name = "zx297520v3-usb-phy",
+	},
+};
+
+static const struct mfd_cell zx297520v3_matrixcrm_cells[] = {
+	{
+		.name = "zx297520v3-matrixclk",
+	},
+	{
+		.name = "zx297520v3-matrixreset",
+	},
+	/* A set of hwlock controllers is found here as well, but no driver is implemented yet */
+};
+
+static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
+	{
+		.name = "zx297520v3-lspclk",
+	},
+	{
+		.name = "zx297520v3-lspreset",
+	},
+};
+
+static int zx297520v3_crm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	enum zx297520v3_mfd_type type;
+	const struct mfd_cell *cells;
+	struct reset_control *rst;
+	unsigned int num_cells;
+	struct clk *pclk;
+
+	type = (enum zx297520v3_mfd_type)of_device_get_match_data(dev);
+	switch (type) {
+	case ZX297520V3_MFD_TOPCRM:
+		cells = zx297520v3_topcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_topcrm_cells);
+		break;
+
+	case ZX297520V3_MFD_MATRIXCRM:
+		cells = zx297520v3_matrixcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_cells);
+		break;
+
+	case ZX297520V3_MFD_LSPCRM:
+		cells = zx297520v3_lspcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_lspcrm_cells);
+
+		pclk = devm_clk_get_enabled(dev, "pclk");
+		if (IS_ERR(pclk))
+			return dev_err_probe(dev, PTR_ERR(pclk), "Could not get pclk\n");
+
+		rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+		if (IS_ERR(rst))
+			return dev_err_probe(dev, PTR_ERR(rst), "Could not get reset\n");
+		break;
+
+	default:
+		return -ENODEV;
+	}
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, num_cells, NULL, 0, NULL);
+}
+
+static const struct of_device_id of_match_zx297520v3_crm[] = {
+	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)ZX297520V3_MFD_TOPCRM },
+	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)ZX297520V3_MFD_MATRIXCRM },
+	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)ZX297520V3_MFD_LSPCRM },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_crm);
+
+static struct platform_driver zx297520v3_crm = {
+	.probe = zx297520v3_crm_probe,
+	.driver = {
+		.name = "zx297520v3-crm",
+		.of_match_table = of_match_zx297520v3_crm,
+	},
+};
+module_platform_driver(zx297520v3_crm);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 CRM MFD host driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0


