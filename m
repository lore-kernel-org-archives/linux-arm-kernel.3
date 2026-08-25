Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D2FC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Qy3s+Fp9Lihv9auQawxJcEtrI9dX/WAGcTUc2vxK9M=; b=mCBtZBpek7SAubHSLG87evu/bf
	NLv5StcLcEuDOwEUnARVZWbiMd0J2pUMfg1Xwm1Z3XVnUE6+ppp73qIDZXivz1JRgJRJpXGUjNCg+
	Hjds3FPGdzfVJvQNPePhLU60JZYdJ3JFRE8MTbHoNnYw1GdLTK+2bfaUbCeyQyeWJt21TtR/tw2in
	cs/lW6x76ta006E6EX4ACGGM/S9H8Y8lZbbKke5tbwCNvquBYnsBCxL4+0ISntAclTFm++kpAGf/9
	gRTfHhzN9f7fQzQEJxtJs5QNRq5mgraa29Q7UO3pzyJ25urJgEa5eBJbBrNWvJkxXLHUnwS96IAvw
	XesG9JIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyydj-00000001VrT-2YZE;
	Tue, 25 Aug 2026 21:25:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyydb-00000001VkJ-2Hvz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:25:00 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so2599574a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 14:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693094; x=1788297894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Qy3s+Fp9Lihv9auQawxJcEtrI9dX/WAGcTUc2vxK9M=;
        b=gGQ74wOAvjI5Ihl/5KlsWTGvNv1LiN5oArZcYHrzHegsfAeP3y3rgzUp9H8sT4Slyc
         k+JdR7yhCSrWi3iMPTRqa8Aaqfqwkg6EI13fWFbXV/KGthNp3R+HuKtL0FwJ/I7DV2Nh
         8CK4A/NRvdcnK3yJiJEPCTxmpSrDRPb5G6ywI/k+MaXan0uL6OyISsoLHmzp3sS+06/s
         ZXktrZSihpkKp6YCT2MsxNPRDXc8o4nLpm1E5vlDF+c1eKHdUDNSLdyhTxzm8Wc3z/XC
         8Zx2C7qJ8kx+10DLttTC4UU1EpgT0qnux0Ao9qIDUotWpwbhDmTe9IE0yWWAw31LH6g1
         67yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693094; x=1788297894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Qy3s+Fp9Lihv9auQawxJcEtrI9dX/WAGcTUc2vxK9M=;
        b=FDhh//Jspbwok4tAeIFcMfr6NkhCyn0M2RXv3vGjzs06qiaPLu26d+I0BlERh8RTfu
         qO4kisarvbCac2xdzkyJbaSLn/fdCWs3/8Cy5MvRmXvfZbbZJLSo4cLk+z6NymUP5Vvk
         AAddgE9s03MJuFbm1IWuNxAb6Q5YAwckT+I1Zm7ee1bz6+Rj/Z7LJVqY4ZDFrNaObRa8
         jtwtbIriRd+6Px5+2tsp54j7FcExO37iUfQBLnEMpyyiTQQWS2QF2WxNx0dpPenY3O0n
         PPMYQZ0TvfYbcbsayKuvA/QqBKTYB3mzP6kZu92hwfg0Dvyr9VfcQwydLNDIZYkcQYsp
         wKHg==
X-Forwarded-Encrypted: i=1; AHgh+RouwBwednfD1khUbZ2HoCx0Ue/TUJtX7O4X0fYLLvwuGRmKBCO/JPHDL7sVDF1DzhOkyVDr3zs4RZD1UBWh8nFQ@lists.infradead.org
X-Gm-Message-State: AFuF++l8nbTQi1fe7pti/KTD6DVqDVTc1cvuq5NgZnpV4e3F4tBXTlDP
	GSNp4KOCkpnb9TNQF7jiBchTa/7ujDCpw6fjLPjCNY7gldK+v0kcNV/a
X-Gm-Gg: AR+sD10+3uowDhmDEDy24elGqfb4oPcasWd2lhH5qAveIuUDY/EoloBLgwh5MhHpK9k
	0qsliYg43kGACkn0MGHUBCvBOO6UH0iGQgTxIGEHmU1w8sipXprzsKn7gYPIpWnwKpCYJIr6gjR
	O8GveEWax5qlC2Zpf15Er61P9KwUHFjTpsgWi+Zts4CqLrrQyjHswDIGgnxHHFu6K5rtqZ8Jw79
	UOdiFSkX6X6psV1esc5YHFmaTHxwrK/oZjGGMkRrWu9ImolQU/gKfMNVTX4/RjoCJxxxfboh7ll
	ZaRvbX4VTzEfeJxLZ7JskGdVtVVXwyD0tKYP8Q0v+MfjG0TCdzoo9vB51DrVOcA7hA+SFZ4mwd3
	ovkN2ncz84ZKAA7wub4KcHiofAqjZ6Vh4xoPoeC5LJM9C0AZuIWwNZJifjiOFqXvoUuibBuuSyS
	NRrQKnVuhRjHKM1lvZ29CN6XUytSb8wRniEpoo6AurG1UK/uTva42pa9ebF6CXfeLx8AZkVQ==
X-Received: by 2002:a17:906:5147:20b0:c25:58e:8d64 with SMTP id a640c23a62f3a-c25058e9f37mr408088366b.12.1787693093277;
        Tue, 25 Aug 2026 14:24:53 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:24:52 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 26 Aug 2026 00:24:04 +0300
Subject: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-zx29clk-v11-5-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
In-Reply-To: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8059;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=GyHrxXzSPEHclS31mhAWoGMCFoZfDGIqKKW+3E99RBk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjggCqxhed1WOGkhLep2BMVjMP7aJqdL6OGLku
 bpC2HBhYyKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4IAhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ1AxAAgc4Z6nVrJxYxRhJLoXq8sQHMsU+QSzp
 KDTec1rDF5EsN3WiTmFTWUCDksFbcQKqj3gsxCrG+uQVR1OmGOj6h8mnCjNGJff9gYJE3phtaXm
 DljRCUB9xB5fIdtO+GDXnZGpI5gzIzcD049CW4q3g9fRvYM6/k19C6s8RZCMnmZ/URSONXhggle
 lSJLxQLtCTvXZCrOiP2IkhRyGAWFSIXKhJIdN0vmIhI+2Pnm26m+A26u3blHiiezzmjopfHgdTy
 WbEFeaYZCsCu04HijMN8qgYi4sBqNZnE4PusprvbK6WT6oIJEm3O/LXl24sbYPjBMUa0nim17j0
 27AqoiajIAYpV8qBpBPQGlJFE8AMZfflyz5qdNdZ676AQaOvjbeckKGphSsRbsqtoPo2nQ8KRtO
 VxBvfqDp+CYRIdBvJz/kCw7lTOLX6yNgClVHPHlzb412J5/aPpGxwmJDTcJ4Bsc5wEnh3Xy4N/z
 8A5kz8LVvbeACnSQICWQL+zQGyZiEjyqtK7SPqQZjtgLXHEUlbH/U7/jreFaCJcrzApUPNxeb/I
 I5Mqd/IaKipoXuUjt3AK0x+pOjVHCvWvd5k99m2YCrw8aehjVZbKtr6m2xvdE9zFqYGtErhKneL
 Ir9BgwmYr6oxOZMDq4VjTwkxU/hmfEOrIfWyMKwUZVQsaepiRhUg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_142455_680915_20C28130 
X-CRM114-Status: GOOD (  34.56  )
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

Changes v10 (All Lee Jones):
*) drop "select REGMAP_MMIO"
*) Drop comment about unimplemented hwlocks
*) Use MFD_CELL_[NAME|OF]
*) Renamed the device type enum and its values
*) Use device_get_match_data instead of the of_ variant
*) Improved debug messages

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
 drivers/mfd/Kconfig              |  12 +++++
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/zte-zx297520v3-crm.c | 101 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 116 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index acec8c1e0fc9..717ed9439d91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3906,6 +3906,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e4fd4572472f..ef9d96484bc5 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2578,5 +2578,17 @@ config MFD_MAX7360
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_ZTE_ZX297520V3_CRM
+	tristate "ZTE zx297520v3 Clock and Reset Manager"
+	depends on ARCH_ZTE || COMPILE_TEST
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
index 000000000000..b098def47e7b
--- /dev/null
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -0,0 +1,101 @@
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
+#include <linux/property.h>
+#include <linux/reset.h>
+
+enum zx_device_type {
+	TYPE_INVALID = 0,
+	TYPE_TOPCRM,
+	TYPE_MATRIXCRM,
+	TYPE_LSPCRM,
+};
+
+static const struct mfd_cell zx297520v3_topcrm_cells[] = {
+	MFD_CELL_NAME("zx297520v3-topclk"),
+	MFD_CELL_NAME("zx297520v3-topreset"),
+	MFD_CELL_OF("reboot", NULL, NULL, 0, 0, "syscon-reboot"),
+	MFD_CELL_NAME("zx297520v3-usb-phy"),
+};
+
+static const struct mfd_cell zx297520v3_matrixcrm_cells[] = {
+	MFD_CELL_NAME("zx297520v3-matrixclk"),
+	MFD_CELL_NAME("zx297520v3-matrixreset"),
+};
+
+static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
+	MFD_CELL_NAME("zx297520v3-lspclk"),
+	MFD_CELL_NAME("zx297520v3-lspreset"),
+};
+
+static int zx297520v3_crm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct mfd_cell *cells;
+	struct reset_control *reset;
+	enum zx_device_type type;
+	unsigned int num_cells;
+	struct clk *pclk;
+
+	type = (enum zx_device_type)(kernel_ulong_t)device_get_match_data(dev);
+	switch (type) {
+	case TYPE_TOPCRM:
+		cells = zx297520v3_topcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_topcrm_cells);
+		break;
+
+	case TYPE_MATRIXCRM:
+		cells = zx297520v3_matrixcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_cells);
+		break;
+
+	case TYPE_LSPCRM:
+		cells = zx297520v3_lspcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_lspcrm_cells);
+
+		pclk = devm_clk_get_enabled(dev, "pclk");
+		if (IS_ERR(pclk))
+			return dev_err_probe(dev, PTR_ERR(pclk), "Could not get 'pclk'\n");
+
+		reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+		if (IS_ERR(reset))
+			return dev_err_probe(dev, PTR_ERR(reset),
+					     "Failed to deassert reset control\n");
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
+	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)TYPE_TOPCRM },
+	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)TYPE_MATRIXCRM },
+	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)TYPE_LSPCRM },
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
+MODULE_DESCRIPTION("ZTE zx297520v3 CRM host driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0


