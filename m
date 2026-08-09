Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE5AC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 21:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SWP9jg8cNKwUNUFEJGTORk88ANCnzD7PTJF8nRu8aw=; b=mW6A0CbWsoLVsSyyU6HmEHAAF0
	tjQP8CeEEXjvRHVAHOM+wZuZscK4n7MHQyN2KWzcrY9p7uj6f95jWqLBCFdN4emBF/5mAUvkzabvH
	Ju5C5RDVwvMKZ3jVphqFRaOKTttFjkzKlKC1UcrHtE3mj8CEAB00gU/ilUZizQSeNbxiAwrPMo0zT
	+nwYRwJIO5VM1EmQGRxDP7oCXsi2pzvhLcyw373DlMOFxBAxYX4JNSjKpPlv9dDZEyYaCYHLYXgT1
	bSn36TB/xsDyBJd79R9Bh00X7kctHCMN/GYuHmFyvnfz8WzBuEfac6/TZCOHMdZQ8qPjhyU3S3YVO
	yBXMPLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtB51-0000000Ak8D-0ufn;
	Sun, 09 Aug 2026 21:29:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtB4y-0000000Ak4p-3XVF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 21:29:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1040426f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 14:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310951; x=1786915751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SWP9jg8cNKwUNUFEJGTORk88ANCnzD7PTJF8nRu8aw=;
        b=P8gxuzn0Ycf3nByiVqJ4wAk1+mF4nKuHDGBkF6vXToBtBZAk7Zda2kkTUD+e7DPVCu
         bVfRTJzzSBxAIuxjDtnOJs233O4t8aRKzT6Tp+xDfcWUa1pqjye9tLyzuOnuDi+hcTbu
         ha2XH2YoUS/8gFZmXRByVlOX/V1Kp3TpdoW5Mva+P/FCkcDRCFTDbUBJL1pux+mpBWdd
         1c2RJmlMrRgkd3nSj11/w7ER1DPUd/zlc8vEAUje0YIRwmUtKtt1O8cF2mRTsKp8+rIE
         VfV80WGbNxocrSfiIWWdNMNVLHoyhLV+3qQmr3uJlHQdl6r4hazOqJfknA5fTU65XevI
         9+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310951; x=1786915751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SWP9jg8cNKwUNUFEJGTORk88ANCnzD7PTJF8nRu8aw=;
        b=MeP2FkKHf7oQ5oE1Odk1OpwkGbCweNDODLt2WmZX0WMyfrr0Af1jg1eJVx7M0P2Yvv
         fjtRWxq0yFw+XGfuPTgQkG4PzXSMeF8uq4cKT72SFhtIpVZRZjeBKNsEWRanVF/hCaMH
         wbOsvmgWbu9K5YZ1IGgBHASzmHpGHXhCWglICZcM9qgGaIphBTQFoG7/su41ZuxtAt7K
         Pd2gqJ2GA+EHvI2l9aH+ROB2YKihuyNrfn/emy16dhjM73tQs5KeecVU0vg8w67p2btZ
         YqnIvEOgLtegP6xmnkwfp34HDB7cUB1IUtb7UBU0128Rih0/Fv6iI3w0NZv6kShwORPQ
         CggA==
X-Forwarded-Encrypted: i=1; AHgh+RqveMmNSthQ9wGUnBr5Y1B/PRycaeEF29xTnubY+6sc+lEMTVVL6TBrCtcFdNmhaTqRj3AtPToCUwVMsbhFoxi5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6N0MMJ/vRBOSMGXfIMtEeQtGj5zmQppTwDFPmlGXyAja2oIE9
	ps8vYA0BBa/Zszevg7KaooXbEOmRSjKc3HLyAyRNujeOKkuS7ee3dzYW
X-Gm-Gg: AR+sD13wZYS9w0zEIThaWDypn73UBO+/SsBtrHczz5dVtB+r8GLPTA+aMWu36kQcVTB
	8b41lVl5y/Jff8bDuC5vBJMggIXrlAe5ZSjE0jPiIcr7+5sVrXV0Vwmsf1nOrEJyKFWshAfb0at
	u9gUSe8hCJ32amn6plE6sRQhFuseHcl/BZmM+neI6PFe2VDO3bs295/QI1yOVXbCx5N0or7pghB
	N6qnlHi2cTcGWNYIKq8SA/dmLRbYvB6IEepz38fkxccJuMcYMea37oaiNHct5NKm8WX9vIlbIZ9
	hKYjgLVY9yZuA2Pnz5ifSbfCnythQTzgQaSMF5l7kVV6l7v0dv6ArQm4Y1m6zboMIhdsBWEsQpC
	M1tQz54lOHpRR+a/z1/PvXEdxH8QeyazMdUWVFrTjaKyfS0jIKf3GaEWMumaRUyUUa8Jcg/cRzT
	6iRgTVImjix+8nsgsO0tIo+pXmn9Lgm+2gk+H9yjo1gOCtClFZNRbpxoFryF3SKNTrOzTZHKA=
X-Received: by 2002:a05:6000:2dc3:b0:47f:9568:ebf0 with SMTP id ffacd0b85a97d-48130eee945mr19522868f8f.23.1786310950928;
        Sun, 09 Aug 2026 14:29:10 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm28987451f8f.18.2026.08.09.14.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:10 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 10 Aug 2026 00:28:23 +0300
Subject: [PATCH v10 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-zx29clk-v10-4-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
In-Reply-To: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8179;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=F48ZbgB2cKzAh96uUjTxHIRf1tzu97bISy6rmvv3yOo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqePEONRbId+nxoMPZNNnnFYnFQ0H8HlKQzAlwr
 hCSScFStMiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCanjxDhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKGSg//eHe937MRV8YX/9PdzDsPMUyiFxPbF6U
 YqzDtX10u/eIdP1QpX3mxCV8ehKCWkdtXSNHPlL09aVrDERc3lUhdA4H2vgWu0Ef49cwsE0KUbM
 cC9pjjQ3YGwPE62tpuLoC/P3FOaNm52i0UVXBnmEFc8YYPRrrDnjZTBa9wny/X4WXGTxiqf6Pl9
 zVpxvovQJ0Q/tZeeh3Df4HUr100heVltNz8638gzwJCOUjeeLZFFlnvkedTQ/tpNTFyBO3P/cWB
 GdTHuRfR2Y4ZdKqCtZrSMqupewpNAzy8PiRhOYSQf7Nl3BC9N0Xyn8c1iMNZWlFDyIQL8/Ko8TD
 NMU7U/ubwpsWMWCs24csHwV6FyutpFR+kV/uYwivyFaJXthaNgEXbZNNDXXNiQSKVL2elfnRQlu
 tQEd5giNftGyQPyLJhMDaUwmHSu0jkj4RC+ai4kYoZKELFmdO9YHSkQWRTjvzQ+V2uB/froTSJM
 8xUTADjpuLWOnJpQsXUYBm9R7upvDG23yFrkQsPjADMczkHrOJ8SnS/fVDaY0YKAh5pO0M+Xrr+
 +e2ir+KnkziEddpFXP98h3irJ0HBgpiX2R/QCiESTostrYfVqSx/20s08guw6eD92ejh58L72rV
 637OBaTxbCZkT0l/fhCWYimoLxeE0aMb6dHmApO19JYVmUpZpqc8=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_142912_924546_34D97C85 
X-CRM114-Status: GOOD (  35.63  )
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
 drivers/mfd/Kconfig              |  13 +++++
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/zte-zx297520v3-crm.c | 117 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61dbe959acf5..d50c03fd5a76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3909,6 +3909,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e4fd4572472f..08138713dfc0 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2578,5 +2578,18 @@ config MFD_MAX7360
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_ZTE_ZX297520V3_CRM
+	tristate "ZTE zx297520v3 Clock and Reset Manager"
+	depends on ARCH_ZTE || COMPILE_TEST
+	select MFD_CORE
+	select REGMAP_MMIO
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
index 72d3944b0ad8..ab0cba2042a2 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_ZTE_ZX297520V3_CRM)	+= zte-zx297520v3-crm.o
diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
new file mode 100644
index 000000000000..550ce4ad7ec5
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
+enum zx297520v3_parent_type {
+	ZX297520V3_INVALID = 0,
+	ZX297520V3_TOPCRM,
+	ZX297520V3_MATRIXCRM,
+	ZX297520V3_LSPCRM,
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
+	enum zx297520v3_parent_type type;
+	struct device *dev = &pdev->dev;
+	const struct mfd_cell *cells;
+	struct reset_control *rst;
+	unsigned int num_cells;
+	struct clk *pclk;
+
+	type = (enum zx297520v3_parent_type)(kernel_ulong_t)of_device_get_match_data(dev);
+	switch (type) {
+	case ZX297520V3_TOPCRM:
+		cells = zx297520v3_topcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_topcrm_cells);
+		break;
+
+	case ZX297520V3_MATRIXCRM:
+		cells = zx297520v3_matrixcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_cells);
+		break;
+
+	case ZX297520V3_LSPCRM:
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
+	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)ZX297520V3_TOPCRM },
+	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)ZX297520V3_MATRIXCRM },
+	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)ZX297520V3_LSPCRM },
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


