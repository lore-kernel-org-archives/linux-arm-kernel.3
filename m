Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C55D44D42
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huAJvy+H9l+GheA/RC75XQQKkdS5LpAA6/u7dPnX/o0=; b=Bjl7bOHELNtjuO5u4KR75T5xiM
	OhhuSXa6qmUO3dErvzqkKzbyZE0OPS1jK2xIsv6K7bYl75XiHoRqKdDBeM/PiweFrwQdlUtc8GyI6
	CpPfdAS3MrsdKCt/fZFaPPjcj79dfTrs04Z7nAlfSIthnfhAutZ0dYDhl0yL1GX7w29VZTXwY3ad7
	hd3+MAcomFyq5BsOYlgkjF1c/kQBM2Zlh2K2q0XdlMFMklRnS6VLwfJPLVXI45ILnUJw0N+JpSpJo
	n06togqKbrbw1jZQAvt0ZIh9GvBa79vMg+04ZWTf+bchWIx6wKOUmwM3PoaOpAZEg8kpba+JkLaJq
	bXulNcsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8d3y-00000002i4o-1z2Z;
	Wed, 06 Nov 2024 10:14:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cQl-00000002Ybn-0NlJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:34:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20cdbe608b3so64570845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730885666; x=1731490466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huAJvy+H9l+GheA/RC75XQQKkdS5LpAA6/u7dPnX/o0=;
        b=Zq3FYi3+M92nD2DfEQs8Xk12N4Wv9nhHmbAC+/g0tGqf3B0n9ti1VSNmRVtp3W1YRb
         iJ9C5AJJEcLQF9TXtH25U3pquhL4VDZEgO3IrwF9y0WfQWSg1fy+LBmAO5LkQev0gd5t
         rCyZZ6IXsPAv0ZGjBLg0Tc0PUkHyUIlsy2PwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885666; x=1731490466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huAJvy+H9l+GheA/RC75XQQKkdS5LpAA6/u7dPnX/o0=;
        b=Ao0xaD5+etwHpWkhioTSMCHTsJd0sy6vtmBauGz1JSMSE+O2/Gb+ho2VtwkAxTs5CR
         qK9ht3lOJnVxQ9QFGJRdgzn/O8DXGEv8v+sl39tVtQwe8pdkiO0A3hjaOdV3Ys0p10Qh
         fXkrH2pKLCvI4jXhYM3NJzbxpaZ6HwWwId4OrbuK/o0L/DEnTfA96hLJAUzU/vZ4zuVg
         enzj/R2gWwyYDcTuyprR/IcVAaKIGtyMfCaBbfeXRC0lf+4KQszWyfs+7NqTU6aXhId0
         07PBmhqOkyyHnB8hytNnEhKK9I0Spl5V3BEXyq3xw9luVjUT/IT61Wd71TOxSkY75hpV
         Cddg==
X-Forwarded-Encrypted: i=1; AJvYcCUnFfi6PXEHkENaY6JeUGIyqDSkgFFBh31hT+mPNurGfjBsxH6gMKbZuLFNpbUFLl4AYMH/pjC+S4y7EZ/nPMNY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6twkcbU5kvVl5WFGhwuf0/f7JiwSFxkdaWRZcaLpRakaGkajE
	FIlpj6pQXBwBVfhUZp0ZyfcKL6HgIbDK8L8p74OzhJyCpAZZle6iqp7KHSdsHA==
X-Google-Smtp-Source: AGHT+IE8snQcE1SrWqRDKoVNxvdLDszHzzVL8SuvRX5QTD4ROo5gi7GAvwYyTMVyyNbQu2tQSQbmrw==
X-Received: by 2002:a17:902:e852:b0:20b:6458:ec83 with SMTP id d9443c01a7336-210f74f6e5emr384238155ad.4.1730885665976;
        Wed, 06 Nov 2024 01:34:25 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:93fe:1d68:b50:3213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057062b8sm91478665ad.63.2024.11.06.01.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:34:25 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v11 6/7] platform/chrome: Introduce device tree hardware prober
Date: Wed,  6 Nov 2024 17:33:33 +0800
Message-ID: <20241106093335.1582205-7-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
In-Reply-To: <20241106093335.1582205-1-wenst@chromium.org>
References: <20241106093335.1582205-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_013427_243086_4B2398E7 
X-CRM114-Status: GOOD (  44.03  )
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

Some devices are designed and manufactured with some components having
multiple drop-in replacement options. These components are often
connected to the mainboard via ribbon cables, having the same signals
and pin assignments across all options. These may include the display
panel and touchscreen on laptops and tablets, and the trackpad on
laptops. Sometimes which component option is used in a particular device
can be detected by some firmware provided identifier, other times that
information is not available, and the kernel has to try to probe each
device.

This change attempts to make the "probe each device" case cleaner. The
current approach is to have all options added and enabled in the device
tree. The kernel would then bind each device and run each driver's probe
function. This works, but has been broken before due to the introduction
of asynchronous probing, causing multiple instances requesting "shared"
resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
time, with only one instance succeeding. Work arounds for these include
moving the pinmux to the parent I2C controller, using GPIO hogs or
pinmux settings to keep the GPIO pins in some fixed configuration, and
requesting the interrupt line very late. Such configurations can be seen
on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
Lenovo Thinkpad 13S.

Instead of this delicate dance between drivers and device tree quirks,
this change introduces a simple I2C component prober. For any given
class of devices on the same I2C bus, it will go through all of them,
doing a simple I2C read transfer and see which one of them responds.
It will then enable the device that responds.

This requires some minor modifications in the existing device tree.
The status for all the device nodes for the component options must be
set to "fail-needs-probe". This makes it clear that some mechanism is
needed to enable one of them, and also prevents the prober and device
drivers running at the same time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
Maintainer expects this to be merged through I2C tree.

Changes since v9:
- Added inclusion of stddef.h for NULL

Changes since v8:
- Added trailing commas on last field in struct variable declarations
  (Andy)
- Added macros wrapping chromeos_i2c_probe_dumb_* and
  chromeos_i2c_probe_simple_*_cfg variable declarations (Andy)
- Split up hw_prober_platforms into one field per line (Andy)
- Picked up Doug's reviewed-by

Changes since v7:
- Corrected Makefile item order
- Replaced "failed-needs-probe" with "fail-needs-probe" in commit message
- Added include of "linux/of.h" for of_machine_is_compatible()
- Switched to simple probe helpers for trackpads on Hana

Changes since v6:
- Adapted to new I2C OF prober interface
- Collected Acked-by

Changes since v5:
- Adapt to new i2c_of_probe_component() parameters

Changes since v4:
- Fix Kconfig dependency
- Update copyright year
- Drop "linux/of.h" header
- Include "linux/errno.h"
- Move |int ret| declaration to top of block
- Return -ENODEV on no match instead of 0
- Unregister platform driver and device unconditionally after previous
  change

Changes since v3:
- Include linux/init.h
- Rewrite for loop in driver probe function as suggested by Andy
- Make prober driver buildable as module
- Ignore prober errors other than probe deferral

Changes since v2:
- Addressed Rob's comments
  - Move remaining driver code to drivers/platform/chrome/
  - Depend on rather than select CONFIG_I2C
  - Copy machine check to driver init function
- Addressed Andy's comments
  - Explicitly mention "device tree" or OF in driver name, description
    and Kconfig symbol
  - Drop filename from inside the file
  - Switch to passing "struct device *" to shorten lines
  - Move "ret = 0" to just before for_each_child_of_node(i2c_node, node)
  - Make loop variable size_t (instead of unsigned int as Andy asked)
  - Use PLATFORM_DEVID_NONE instead of raw -1
  - Use standard goto error path pattern in hw_prober_driver_init()

- Changes since v1:
  - New patch
---
 drivers/platform/chrome/Kconfig               |  11 ++
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_of_hw_prober.c   | 154 ++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 7dbeb786352a..b7dbaf77b6db 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -61,6 +61,17 @@ config CHROMEOS_TBMC
 	  To compile this driver as a module, choose M here: the
 	  module will be called chromeos_tbmc.
 
+config CHROMEOS_OF_HW_PROBER
+	tristate "ChromeOS Device Tree Hardware Prober"
+	depends on OF
+	depends on I2C
+	select OF_DYNAMIC
+	default OF
+	help
+	  This option enables the device tree hardware prober for ChromeOS
+	  devices. The driver will probe the correct component variant in
+	  devices that have multiple drop-in options for one component.
+
 config CROS_EC
 	tristate "ChromeOS Embedded Controller"
 	select CROS_EC_PROTO
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index 2dcc6ccc2302..fb8335458a22 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -6,6 +6,7 @@ CFLAGS_cros_ec_sensorhub_ring.o:=	-I$(src)
 
 obj-$(CONFIG_CHROMEOS_ACPI)		+= chromeos_acpi.o
 obj-$(CONFIG_CHROMEOS_LAPTOP)		+= chromeos_laptop.o
+obj-$(CONFIG_CHROMEOS_OF_HW_PROBER)	+= chromeos_of_hw_prober.o
 obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)	+= chromeos_privacy_screen.o
 obj-$(CONFIG_CHROMEOS_PSTORE)		+= chromeos_pstore.o
 obj-$(CONFIG_CHROMEOS_TBMC)		+= chromeos_tbmc.o
diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
new file mode 100644
index 000000000000..297d4704b75f
--- /dev/null
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ChromeOS Device Tree Hardware Prober
+ *
+ * Copyright (c) 2024 Google LLC
+ */
+
+#include <linux/array_size.h>
+#include <linux/errno.h>
+#include <linux/i2c-of-prober.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/stddef.h>
+
+#define DRV_NAME	"chromeos_of_hw_prober"
+
+/**
+ * struct hw_prober_entry - Holds an entry for the hardware prober
+ *
+ * @compatible:	compatible string to match against the machine
+ * @prober:	prober function to call when machine matches
+ * @data:	extra data for the prober function
+ */
+struct hw_prober_entry {
+	const char *compatible;
+	int (*prober)(struct device *dev, const void *data);
+	const void *data;
+};
+
+struct chromeos_i2c_probe_data {
+	const struct i2c_of_probe_cfg *cfg;
+	const struct i2c_of_probe_simple_opts *opts;
+};
+
+static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
+{
+	const struct chromeos_i2c_probe_data *data = _data;
+	struct i2c_of_probe_simple_ctx ctx = {
+		.opts = data->opts,
+	};
+
+	return i2c_of_probe_component(dev, data->cfg, &ctx);
+}
+
+#define DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(_type)					\
+	static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_ ## _type ## _cfg = {	\
+		.type = #_type,									\
+		.ops = &i2c_of_probe_simple_ops,						\
+	}
+
+#define DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(_type)					\
+	static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_ ## _type = {	\
+		.cfg = &(const struct i2c_of_probe_cfg) {					\
+			.type = #_type,								\
+		},										\
+	}
+
+DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
+
+DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
+
+static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
+	.cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
+	.opts = &(const struct i2c_of_probe_simple_opts) {
+		.res_node_compatible = "elan,ekth3000",
+		.supply_name = "vcc",
+		/*
+		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
+		 * Synaptics trackpad needs 100 ms.
+		 * However, the regulator is set to "always-on", presumably to
+		 * avoid this delay. The ELAN driver is also missing delays.
+		 */
+		.post_power_on_delay_ms = 0,
+	},
+};
+
+static const struct hw_prober_entry hw_prober_platforms[] = {
+	{
+		.compatible = "google,hana",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_touchscreen,
+	}, {
+		.compatible = "google,hana",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_hana_trackpad,
+	},
+};
+
+static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
+{
+	for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
+		int ret;
+
+		if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
+			continue;
+
+		ret = hw_prober_platforms[i].prober(&pdev->dev, hw_prober_platforms[i].data);
+		/* Ignore unrecoverable errors and keep going through other probers */
+		if (ret == -EPROBE_DEFER)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver chromeos_of_hw_prober_driver = {
+	.probe	= chromeos_of_hw_prober_probe,
+	.driver	= {
+		.name = DRV_NAME,
+	},
+};
+
+static struct platform_device *chromeos_of_hw_prober_pdev;
+
+static int chromeos_of_hw_prober_driver_init(void)
+{
+	size_t i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
+		if (of_machine_is_compatible(hw_prober_platforms[i].compatible))
+			break;
+	if (i == ARRAY_SIZE(hw_prober_platforms))
+		return -ENODEV;
+
+	ret = platform_driver_register(&chromeos_of_hw_prober_driver);
+	if (ret)
+		return ret;
+
+	chromeos_of_hw_prober_pdev =
+			platform_device_register_simple(DRV_NAME, PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(chromeos_of_hw_prober_pdev))
+		goto err;
+
+	return 0;
+
+err:
+	platform_driver_unregister(&chromeos_of_hw_prober_driver);
+
+	return PTR_ERR(chromeos_of_hw_prober_pdev);
+}
+module_init(chromeos_of_hw_prober_driver_init);
+
+static void chromeos_of_hw_prober_driver_exit(void)
+{
+	platform_device_unregister(chromeos_of_hw_prober_pdev);
+	platform_driver_unregister(&chromeos_of_hw_prober_driver);
+}
+module_exit(chromeos_of_hw_prober_driver_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("ChromeOS device tree hardware prober");
+MODULE_IMPORT_NS(I2C_OF_PROBER);
-- 
2.47.0.199.ga7371fff76-goog


