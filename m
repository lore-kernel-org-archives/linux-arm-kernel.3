Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E65C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MdKCtNkfinKWmrbT0g6/abtf3hr1i4RMWD/kXN9ElM=; b=ulpfDDi0MvfiJ0rj3GGB6sqRUv
	Efl3LpWVEtsd6KiSBF14r/3OWvl6NZ9S2rINXrpJTGVOZVDaUo/ujKlno9naHxzfSzZT1PvpptOOU
	g1nxKCtnbfaEMsuUwE4M0RINQVkKRnTx8cYdJ/CM3kD9pwatvny0B4fihSRFI0XjozsRSPoG1OHyV
	nilNBKDGSnwlrkltYqKywAj/14TsPTCwY50mgaAElgBkgUGZhWkUPjnqOCD+nHCUvpSrRf7VAUmTe
	UeJHWgFPTkxUiftR2E027kxkirx7OO4DVnQejwVoSQJ9PZJQiP+lmq7+q3rs2zPsHoLMO7xeCVjdJ
	oZK5WOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ19-00000003dgC-3Nga;
	Mon, 27 Jul 2026 18:25:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ16-00000003dd9-22cE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 18:25:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso15412465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176730; x=1785781530; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MdKCtNkfinKWmrbT0g6/abtf3hr1i4RMWD/kXN9ElM=;
        b=gPmb/iJM/sFEC4SaCzBL/l9fDGMA9jinsyILrPuUq4lDmtktbKOEbg4nzvBSCeODM4
         vCiJf38bvQ717X+dxJWjZzVRNV9CsuDjvJzwglUwvQ6AwwPZYiOPO0wL4JGygeuQj7wz
         q4Uomgu18T48eyR44do0B/lALOBChjCAkPoYSjcoH6J2VYQN1/mClPaOyrd8csNt4QcB
         9GLreLRIYXgussRKkS6l0zkXgFIPng2iVZZeqSv3T59hEqBTmpRpiKo811WQLCE7mW2c
         2aX2QQZvV9P8u+ymUfS+5U/2tcLJPG4pY4HmOaw40uffjeRFKlbAPqitWrxDOxXX4rcT
         4FNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176730; x=1785781530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MdKCtNkfinKWmrbT0g6/abtf3hr1i4RMWD/kXN9ElM=;
        b=C+SNuNwR/OUOIvvvgsKJXIj2qCzE/9QYEnkKd+7i37sLSiIWMFt/smfllVKm+xhyOR
         m7jxyihohBcFhCWBnyeqSE97FAzgA4O1BAU3rnf+sgJ8nSQ6a7mevrIEUR0SHzZk8HMf
         AnozUJKHkXZdVMgMlKMUBUz/IwtQ7rjkY75LfivCjEJZWqkk1OQ1gfNIbxm7Y+KiiCqX
         GJq3s2RE18oFyrWiRBZIa1pSl7GXXftOWji22Wmq1p83XOkvEmu8Mp9GpUL+DoKINfEZ
         XOnCkn72uScC5tSkLEV/jBdM1NNoIzX2jUzhPU7poJcrqhHzEMonZAuQXN3f7lMFpJBi
         6Q7w==
X-Forwarded-Encrypted: i=1; AHgh+Rr+2nnSTuol/DrNIhiqBhgPcHTooO40aSlgILaWspwEH76oUIxtN5NF3BTcuHg+8ZNETA6rwDSE6YoJbzFH/+Cz@lists.infradead.org
X-Gm-Message-State: AOJu0YzMjf+aHmVZgaOLszar6WSjy3CpYh8xuxfzGp55WfTW4KBGRaaR
	yJrYoQP4k/bm2VsX4Xy6I7dUIgzxS+TSpw0gjQ8M7sORf4K6nSFWAb7G
X-Gm-Gg: AR+sD13iD+aG/idAITm1BKo7NEGmSsgsVjXueHPyCYZZkmOuR3eQY4wKKeUYALbSuqs
	lImEBVBrky+rbwoUuyB3xu/r36MZMN268USvDNZPlEpNzDXz2SpV73sFlkvtsnKPHiwgofYfFe2
	Z0/WgCRor41BZFtfNVy158ySBcLVtF4NG51QGjlYZ9GADUJlshwH+VSzYhiV6MYXqVO9j1grrqE
	OR6qpPVD283KcV51aFQmONLV8HZ8PkeIttfH5rI5vcbInwb2h2RzUqc3EfCwo43pxhHHBKp5hC1
	NxLJGlZS7OGh2vcl+1ggLql/7Fbq16DgdE3qWgNU5Ua2ZzeHr+Lr63KaE/syZTq6SaL5DRo3Z41
	ynQiZK57/SfpH9p0Q96Wp51PX9/SXuRuQHH+uU+bmT2I2/a47Oii+xi2MSrABlMGqweU4Bls3Yr
	lGSjtCezneW31viRupQ5dWC9M=
X-Received: by 2002:a05:600d:6405:10b0:495:518a:d95a with SMTP id 5b1f17b1804b1-496c4fd961bmr1777965e9.29.1785176730336;
        Mon, 27 Jul 2026 11:25:30 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:25:29 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:19 +0300
Subject: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-4-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7335;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=Z0YfX8jUsZUimRbbgNY9xw3prHCkWNC3qnu0Cc2fWXk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6GBIxStOP2KyOvFMZI3ZqqqrsPUzMx3rxf
 SkqpfwB9OKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiL6Rg/9HKudFEBi38W18LPvABhw8mKMW7IIpAl
 0ILwg2qJQNrPOUHvHTotO9J0d73FuEL24iLg0pjmdx2nqQl4IMHfJkD5rwIwYP2OnL4X7J5s7DU
 E/0w72F4KOIHa2jvq5C+zgscFuOmvPGExZScfzTllSdBttx6LNnOtQaeBrXysVah9xEYy2ziNI8
 vcLk5b5dkO0B/Dw+XNmT4EbzwnMW87Ifk4RmvS5y4ZWNg39liSUlUF+xH001Eev9MEsw1mVBD3j
 dJBTup4bk5lSkq0cUUjUoliB2525m7vIOofytPv3Jym7NfhxC5P9iCMBgkc+PW4HWNwoMvm35xb
 WWWuagQV1IHkjR9DppainyzbZqw41o7M+NNX8UYlmmWVlkYWsJFFgLE+SzWc1qbJSJ6UEYnXC5h
 EBO0Z4XzLT6hJOoCIMpVhfZy8NEXExFX7Qji1OuTUwJHVQdxVzWE4Z9h5nvxvTXIZXdFq6bMrUA
 42k+ilf4pj2GcdfmcwWf7d+5YskRoEiUDlkLCbe2wrwLOsLMbWWhmCMbrAz31ltVMugVPnTVCKx
 MIIB/8AbIPvVInM3i8wRn49/syaaUTW9kbLbSEAcMB+eNNpFE/JpswhjY8LsJ9JhFQtZmjDd+Yd
 xk4ZdLBtk50Dj3SqPj26fmXeRWT58M+faR4fg2B+p5R45FAItZX0=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_112532_990573_622AF724 
X-CRM114-Status: GOOD (  33.08  )
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
 MAINTAINERS                      |  1 +
 drivers/mfd/Kconfig              | 11 +++++
 drivers/mfd/Makefile             |  2 +
 drivers/mfd/zte-zx297520v3-crm.c | 98 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05322672b9b5..b04e9d43cfb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3883,6 +3883,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
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
index 000000000000..3a4f6cd0756e
--- /dev/null
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/platform_device.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/of.h>
+
+struct zx297520v3_crm_data {
+	const struct mfd_cell *cells;
+	unsigned int num_cells;
+};
+
+static const struct mfd_cell zx297520v3_topcrm_devs[] = {
+	{
+		.name = "zx297520v3-topclk",
+	},
+	{
+		.name = "zx297520v3-topreset",
+	},
+	{
+		.name = "syscon-reboot",
+		.of_compatible = "syscon-reboot",
+	},
+	{
+		.name = "zx297520v3-usb-phy",
+	},
+};
+
+static const struct zx297520v3_crm_data zx297520v3_topcrm_data = {
+	.cells = zx297520v3_topcrm_devs,
+	.num_cells = ARRAY_SIZE(zx297520v3_topcrm_devs),
+};
+
+static const struct mfd_cell zx297520v3_matrixcrm_devs[] = {
+	{
+		.name = "zx297520v3-matrixclk",
+	},
+	{
+		.name = "zx297520v3-matrixreset",
+	},
+	/* A set of hwlock controllers is found here as well, but no driver is implemented yet */
+};
+
+static const struct zx297520v3_crm_data zx297520v3_matrixcrm_data = {
+	.cells = zx297520v3_matrixcrm_devs,
+	.num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_devs),
+};
+
+static const struct mfd_cell zx297520v3_lspcrm_devs[] = {
+	{
+		.name = "zx297520v3-lspclk",
+	},
+	{
+		.name = "zx297520v3-lspreset",
+	},
+};
+
+static const struct zx297520v3_crm_data zx297520v3_lspcrm_data = {
+	.cells = zx297520v3_lspcrm_devs,
+	.num_cells = ARRAY_SIZE(zx297520v3_lspcrm_devs),
+};
+
+static int zx297520v3_crm_probe(struct platform_device *pdev)
+{
+	const struct zx297520v3_crm_data *data;
+
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, data->cells,
+				    data->num_cells, NULL, 0, NULL);
+}
+
+static const struct of_device_id of_match_zx297520v3_crm[] = {
+	{ .compatible = "zte,zx297520v3-topcrm", .data = &zx297520v3_topcrm_data },
+	{ .compatible = "zte,zx297520v3-matrixcrm", .data = &zx297520v3_matrixcrm_data },
+	{ .compatible = "zte,zx297520v3-lspcrm", .data = &zx297520v3_lspcrm_data },
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


