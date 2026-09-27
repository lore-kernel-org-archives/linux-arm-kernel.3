Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12122CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 20:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUceZn+ZYo9pcUVc5KdBZXypYMxcrBpVlO1tu/ti/Bs=; b=1/4Plft+vhesOiohEHc71iKxA/
	fLE6m4eFdPuTfgLSYzmP484zytn40+CfRgShb7+YRNFxu2DwTDDqFozQdKql3r3GKsQnYTRnRu9mJ
	nNhuOjImc7EEh+1UOK68DoAF1UB1aNjxR7kLJFuOT86ALNU9ac8SXFtSIu3wpq/WvedpxAGvV6t4o
	+jz+/jSycqm6TyLrRC5rOitUsEATVKWyWsm43v3o48W0XKBr/4RHpCjbFyW/akRN29fTIb5XIg2LI
	5hbCS4jxL0HGlkyd5lF+Vm+dJw7IO4iQbvo+qxZ96p3o4BzCWaR3zV8xOSQYM4fiCCXqy2IExo62l
	exiop7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvGM-0000000GnW8-3IT0;
	Sun, 27 Sep 2026 20:14:18 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvGF-0000000GnPz-1nzo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 20:14:13 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48884b021dbso711210f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 13:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540050; x=1791144850; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUceZn+ZYo9pcUVc5KdBZXypYMxcrBpVlO1tu/ti/Bs=;
        b=sZtdxG4TMMNa2/4Rd7tyBe0Abl11+eqjwsGrfmmMBtqXtHpvULav2It45XAmI4mEDs
         RgKnYJxx8hWT5EKSsBs2w3wLVU2qs4aeTWSHtoaB89Ho1OBq6WVsqLkoKiaRNE5Dzo4l
         35CJbCwa8mitYyNfquk53wuBD7e9MybBaAkxhFoMbG/NRdDc1zmTwRHd5hLws8WZ5j/D
         UHEqEEu8kkxYUmh+veuMKQyx48EEvxFuAif9+B5L2YoRNKzinlWYI2Xfx7riX9rz45rx
         4mv+KjYn+TE2gGL90rvhF4GyrBpMoID+sPe5f8RfbbWxTIf+Np9L8zYJk3IQ7fKkBoZt
         Cl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540050; x=1791144850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUceZn+ZYo9pcUVc5KdBZXypYMxcrBpVlO1tu/ti/Bs=;
        b=kGimuJ9HMj0VOwLclsoZoy1uBTlFb5tO4TrTumJQeQJOVAir7U4dPTjxPdPWb3Q93h
         3R2uqk8TH3/Py11pYQfyZ07SFFkToW0A1eXA7AmvK94M1NLi1HkpH6dwLyEq9o6PJNcG
         7MsYNKW8+XutFz0cUNIgPv2BrGOejPl4AAmLpuTWoqCW3Li1k3DYsavZ7NDQ1sx+D7gH
         wyfvli8igt4jmtEB8UknLFa3xuJLf+3kariUHu8J2WSNvTEi0SL4mYpb4IFlFJzuPfAS
         VMAzifCqXTYzWNyV5V2L8pDHGMuE/12Yy8IOB4f6pbbh2yZjCKshD7EtfxmD3OGhHNdB
         4/iw==
X-Forwarded-Encrypted: i=1; AKwUvByZ826J7nACKF29R3848BoKlIoxbMCRwpETa+/BEM/29OKTnX4yjX72fwoVu4Zw+ccQXWp/UHLDmvBB15IKOzkw@lists.infradead.org
X-Gm-Message-State: AFq9FYJ3y7orgZuSTYDq3uuyd5EmQx/J3SlxRunMyusXLDvixHf1/q2U
	IZYSLwTrVyhx2GoTW/Hl4bPHtBhoOaRgT/xtp6tuqya+hHy/hhXXZKYg
X-Gm-Gg: AYBFou27PivAB+xJL5StvBK/rPYTGkZiRKCQgZgcoCeQSC5zqz4SfTd0rT4/JhPFUom
	AouuNlP0GyExzdULzHKvLG4Xa1RuEDphdeFNy5VyCplDIjHcp4aFqcYSdOjXpblg4rQjEn5w4rR
	oei+za4kZGZRvuRz/pyYbgu9YkPfblzgmFQQM9kYR2ccE0Aj4hJLD1MgUPJZGHlKPl4xxbemSqL
	nA+TtwpD1/STLMmpMefE+znvCdCVnI2tIW45qpnJggj3ZFQFEy3ucliWlKyulkSB6L30f0evxrS
	In9BUXl08a/gH1ExriCqaLziXMvchHvVSJJ1Cx7Pa6DsoDxQgVxOuoLguZdWRg8Ds5BkzBWtcFt
	lSUaFgh4eGNtyC8JvbiVmhEVgmwupk4xj00Zah42B6EMkSt9nU3VolEoNDCgagcsEajN/R/ppaC
	i8r9Ktiylz2Fl6lcmCJ9J/bSaPwEKBEmvgYRJnFarJ3ht48b9X+pD1SegXNraEUNJTN/B9hOVKa
	qlqNQNx
X-Received: by 2002:a05:6000:41cd:b0:487:11e1:cab2 with SMTP id ffacd0b85a97d-48871770959mr20219237f8f.49.1790540049588;
        Sun, 27 Sep 2026 13:14:09 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:09 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:32 +0300
Subject: [PATCH v13 04/13] mfd: zx297520v3: Add a clock and reset MFD
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-4-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8980;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=/no/lvHVLlUeWbGnAU42PbuF5Flsu1tg3CcL3JrVyrg=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj0QNoX0bL63wDmSkceKLeek0stm0x6V3s69
 TBoK7EkItKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJxWQ//XKrkasQ8YHRwe4KgOUdIdG2jjoKtOJZ
 PVGNYax3DmGwp26f7jpencxIgUzrpsOCUdA1mC3FOyn3mExcTKhKRKk541/ZX3brYFTo99xI9UY
 prO/q08JBDERLdiNC3OPXk3t2VQJ3da09n7P5WF0A9cgMmCSi3R126qONV7HCzAMUA0DxI51AZy
 FgfmarQIjksqanVdVxhQH8DQvvGHwDBoyNhRpRSqsMOwZmbr+iXCAAEbbMPpbln5vMilhuf29zi
 8+M9CapoBof/1C+oe4ja+VzXLd7ZXXQEhB1DAGxD6rbXoOmlWmOwsvxvhOY0OemjpzAM/0Ud5TB
 MBUjpu2dbIwH2/Guk7kwJQDy0tCRFRu0mcQs2YbI2uGirGJcd/0e7FhTR+dcnYyF4rKRrEKSs2r
 k5Q2yGMCrG6B1Q31JeUEIPpTvRJAT9FnfA1HDGQQguoXVebUNJb6kU0HpQiIZ0LNbs4R2z0UjjV
 Pa8LRWtBlQFHZupcDGjKLXxtin0fgwi0AG4kbmkBdB5YnCejDbdCo941jdNOxielJpoRk85hbst
 IHZ5CwXLvxfGsFaEY/v8ETQXrpCpbN6KCR+U36COPVGb2jbT0zVay+ALT4/ybrR4hVm8EvfHSqQ
 uVPth0snLfebuqNc+ZqcWzWz7AQWh1WdZ7hS+LsDp9U71VffS8xQ=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_131411_530789_71DAD9E8 
X-CRM114-Status: GOOD (  37.27  )
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

v13: Break out the MAINTAINERS change so Lee can selectively apply this
patch. I made sure it compiles without the DT binding headers.

Lee, if you prefer, I can send this patch with the MAINTAINERS change
folded in stand-alone (or as a pull request). It'll have to tricke into
the clk tree before I can PR the bindings and clk driver though.

Changes v12:
Added comments elaborating on the role of the driver and the hardware.

Regarding the names: zx297520v3 is the SoC's name (chip marking, boot
messages). TOPCRM, MATRIXCRM, LSPCRM are ZTE's names for the MMIO blocks
in their downstream sources. Sadly no datasheet is available. "clk",
"reset" names for the child nodes are mine.

Regarding personal copyright: I am not affiliated with ZTE nor paid by
them. This is my personal hobby project. I am using knowledge extracted
from ZTE's kernel dumps, but not code.

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
 drivers/mfd/Kconfig              |  12 +++++
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/zte-zx297520v3-crm.c | 111 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 857ca3bb0d5b..b30600f6ff0c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2580,5 +2580,17 @@ config MFD_MAX7360
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
index 000000000000..d896261a4d40
--- /dev/null
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ *
+ * This driver splits the ZTE zx297520v3 SoC's clock and reset management devices into MFD child
+ * nodes that are managed by independent drivers in their respective subsystems.
+ *
+ * ZTE's downstream kernel names the mmio regions "topcrm", "matrixcrm" and "lspcrm". For an
+ * explanation of how the controllers relate please see the DT binding documentation found in
+ * Documentation/devicetree/bindings/clock/zte,zx297520v3-*yaml.
+ *
+ * The controllers are primarily clock controllers, but they all have reset controls as well. Top
+ * and Matrix controllers have further auxiliary functions.
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
+MODULE_DESCRIPTION("ZTE zx297520v3 CRM driver");
+MODULE_LICENSE("GPL");

-- 
2.55.0


