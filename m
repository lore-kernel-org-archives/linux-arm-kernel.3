Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E915C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsfCXzmlFFAtUda42ACCVl9QcJBbK9RzBZ2SreyufmI=; b=vjXRLgULrLIrmyw+ibMtzLn6s3
	4rIpKbAotHRv85HvCSwM/rFFW3I7aPfukDm+Ee4aFMJzqI+cs9qt2sDM8JgqfzPLTbaCkyzUOHb2V
	kuSzuV5u4+Io9O5f1NGI2wel9xAZqBHVv/0zNUzaYLVMgkXb3rqop1UU/1Y+yi149iStC1rha6qqc
	2huORmoyHng9n9ZzIG7mt3MlF7XqWNcbJLE///W3CR2R0Armp7OOXJ1Uu9Dx+x0rf/AYWbcaqxc1Q
	WSJ8wpCbnbXasJ32LXh6hkLVTTE3kd+eLy2JSFhIu3qEz1bTXd8o88eAw6g6MPTQq/Y8PRyHGzy8v
	ttUHfbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1l-00000005Rdw-1PdP;
	Thu, 02 Jul 2026 20:28:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1g-00000005Rad-1Jpe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:28:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so10839825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024127; x=1783628927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsfCXzmlFFAtUda42ACCVl9QcJBbK9RzBZ2SreyufmI=;
        b=cDIbY0jNh8LqExJapge/Nuz8YSYXVIAjKXIx4Cfwr4oLZp9OIn8cYi67uBLFhAcG0M
         jmORJx0lP5ZL+3rilcGp4TQl/3rpnW3LBYgySSHsptsdf6ducX0sgLlcdV+AQWUNK1Nc
         oVEs678NXKKheuZrvPEXg0rndzS9AA/6u1qGWQ728Tursx0lFNT/O3/ZHNpS2woe+K9I
         BzWiN0FEoqTC72/+8Pm6gz9zy8rvKYFzPkT+yj29AEOumOEExDWMGtKAVzE+0WVy7yBe
         rp3Cy15n65/QZEINrNRy5Pu5hTQwvYPfdgSPOhSDeAcoz+z6B4P5ukpyapEkXHm3Vj5j
         XMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024127; x=1783628927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsfCXzmlFFAtUda42ACCVl9QcJBbK9RzBZ2SreyufmI=;
        b=ipt8X2KWMj9PfjOlAYxq6N2bUsjObUgQM77Iwj88Zj/JkxEnWFfXuJ3MBe6cjckbq2
         TUMj4q+462v6gs0uiUSLPiUFpcBNep1kqOwnJQx7fbTaivk+5SBNRT81bK4i+tESjRAX
         5y8YFNIN3n+G0hr0tf8jLg/up/CMdSGWBk2vVFwy0re4yZA2IgUCL9k5GtdaQM+MEF6L
         XmfKwDjAzsSmI10d4wjbxI5k7xWtoH4DTlvD+I764U6yaC/U7gP4JmVXRufogy6j1tUm
         o5YuO0BLcOZTABD43GbpK3uoPlC1tjyuz9SBDiJtyfQyOxpcE19RL8Q/LRAVu6nlk2GO
         27Pw==
X-Forwarded-Encrypted: i=1; AFNElJ8XIWp2pcCvxARUUXkKlb9Ju/v+7VHwCkXwoyTzeZRmZ8aeKWdRmgVKkTlxxNkjmp9+3oFGc1KZe8DdqJa4LqvG@lists.infradead.org
X-Gm-Message-State: AOJu0YwGyCks/osbPRN3KK6ZWzgCQbP5lJ+BCn9Va3ynCxsJ0qWip6BI
	g1mkOqwmUiSN9bLQ3vm9PpdtmaI9gBQ8O39GT7fgx4McsSTzph0i6/2C
X-Gm-Gg: AfdE7cnz2Jx+SnA/XgGaLFzc8+Dmt6yC6azwIyt9Vt9pl/bVmTELNyBlYj/GE27IZaE
	FW6naIMGvuddAUDLR1xUNxfKbTnRbyyg2srxnWt8jggp9bYUP9Bd9RqkwRwqvDALbA0AfRfHBF/
	Qldt/GH8n+Wmepv9LH5ywU0BnNmseCnyj/I8WgNuDzLxjOO9TBhp6KI0OvMHDWkOujpICrWTmUh
	8FgcdwY2Z7U9vm0fADiuum00tTA6cIXBzc/hDkSuN/nhg/jam8h3qz18UZmKy2McNPMSCOUyZC8
	xN8SPBpF9kV+Eo7sWHxf/W0nDc1gBklGjHnmdrYFtchKYe1fccGGMqF80MaePeFAW6JECFqCyNC
	Tw2pdcrayKft8b9Dw8laqRTSabIvXfffYPelw9BsOEEio8LUV4qjIi5zlNutopFFWhinL3Z0U36
	2Qivq8KwLU3w+QW7ZnxCmyEL0=
X-Received: by 2002:a05:600d:108:10b0:493:c337:db19 with SMTP id 5b1f17b1804b1-493c3cdf959mr80608715e9.17.1783024126599;
        Thu, 02 Jul 2026 13:28:46 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:46 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:28:00 +0300
Subject: [PATCH v6 05/12] clk: zte: Add Clock registration infrastructure.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-5-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11991;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=nD4pdAjQRFx12q99yc0dvHRGI29k5S6vxp88vHzvDuE=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnpTTDTbcGy4QQA/hQMHoRjq2xP6RQkThZRA
 6GR+7jf0BqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ50A//ZpufSxdDDyuF6wU21b7fNI8lDeBJGgt
 hEb8q4fTLcS0K8kJKidCY/aGVLv/yt0K1kVLlwh8/ZUVscf+lYFoIdzSOFiDuF2TPU5s8frumyb
 +GviRnWxvT/oXiAIxq/AjNsBZDthsdN7yaT4lldS9xYZczFcSPAkstNdMKxqia8xnlisnsIhdNf
 IMl7lLNR+u2WqO3wuodBeIMcgEtXKlRZx7O+vzmlkg4HGOt26M8W/+2axLmAnw7i1h4c7NpklNG
 35yyzUrvCEN++afxuQq3lIIJt8XWccx+5AQB2oVFlS0AB6kpsNmIw777QxquzFe6G8SrmThrbkS
 dCFvBhUINx1C/Jt2y9zOGOlVdRaePkf9wOA6VXKPtHr73vxn7937s/5plq46eq3BTtuzCmVb+RF
 ffTRgE8mIzWGdTOQmxhFPGiaRsID/LPhq669OvO8pARiYrE8wr61GDlx/bGzhcm2DYtZr1/hvfd
 +ahVlZO6Enp8SVIPG9lFCq6H5mMRSTY+nf+FOcwsXRPSbrfFu33iotjEfjr8ZdwYN0ZjasbOhqS
 e7N+sa+5G0cw2fX1ZnP2wWaPvHRqOAT5NGuL50kPRthfPsLCmcWWr7hk+G+CVqQEqtspFK11UA9
 tStCM8oX//cKK+E36WZ9ldRd8n8LnoMLYknyHJfAUuFLqPSujECU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_132848_430237_2F9F9954 
X-CRM114-Status: GOOD (  28.77  )
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

The next patches will implement the regmap clocks and PLL driver. The
actual hardware specific clock listing will live in a separate module.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 6:
*) Remove auxdev now that LSP clocks also use MFD
*) Error codepath fixes pointed out by Sashiko.

Version 5:

*) Pass the static clk data instead of calling get_match_data to prepare
for operating as an MFD child.

*) Don't use devm_kzalloc to allocate the auxiliary_device
structure. I guess Sashiko is right, and that's what "Because once the
device is placed on the bus the parent driver can not tell what other
code may have a reference to this data" is trying to dell me.

*) Fix error check for device_node_to_regmap.
---
 MAINTAINERS                  |   1 +
 drivers/clk/Kconfig          |   1 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/zte/Kconfig      |  16 +++++
 drivers/clk/zte/Makefile     |   5 ++
 drivers/clk/zte/clk-regmap.c |  35 +++++++++++
 drivers/clk/zte/clk-zx.c     | 142 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk-zx.h     |  80 ++++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c     |  17 ++++++
 9 files changed, 298 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6502d343fe44..8f2e436cb42b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3882,6 +3882,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/soc/zte/
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
 F:	drivers/soc/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a907..6f0a863951ca 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -545,6 +545,7 @@ source "drivers/clk/uniphier/Kconfig"
 source "drivers/clk/visconti/Kconfig"
 source "drivers/clk/x86/Kconfig"
 source "drivers/clk/xilinx/Kconfig"
+source "drivers/clk/zte/Kconfig"
 source "drivers/clk/zynqmp/Kconfig"
 
 # Kunit test cases
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cc108a75a900..13a5478f1112 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -167,5 +167,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_X86)			+= x86/
 endif
 obj-y					+= xilinx/
+obj-$(CONFIG_COMMON_CLK_ZTE)		+= zte/
 obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
 obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
new file mode 100644
index 000000000000..0222549dd211
--- /dev/null
+++ b/drivers/clk/zte/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# ZTE Clock Drivers
+#
+
+config COMMON_CLK_ZTE
+	tristate "Clock driver for ZTE SoCs"
+	depends on ARCH_ZTE || COMPILE_TEST
+	default ARCH_ZTE
+	select MFD_SYSCON
+	help
+	  This option selects common clock infrastructure for ZTE based SoCs.
+	  You will need to enable one or more SoC specific drivers to make use
+	  of this.
+
+	  Enable this if you are building a kernel for a ZTE designed board.
diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
new file mode 100644
index 000000000000..27db07293165
--- /dev/null
+++ b/drivers/clk/zte/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_COMMON_CLK_ZTE) += clk-zte.o
+
+clk-zte-y += clk-zx.o pll-zx.o clk-regmap.o
diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
new file mode 100644
index 000000000000..1180d7aa7d62
--- /dev/null
+++ b/drivers/clk/zte/clk-regmap.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Copyright (c) 2026 Stefan Dösinger.
+ * Author: Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <linux/errno.h>
+
+#include "clk-zx.h"
+
+int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
+			  const struct zx_gate_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks)
+{
+	return -ENODEV;
+}
+
+int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
+			     const struct zx_div_desc *desc, unsigned int num,
+			     struct clk_hw_onecell_data *clocks)
+{
+	return -ENODEV;
+}
+
+int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
+			  const struct zx_mux_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks)
+{
+	return -ENODEV;
+}
diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
new file mode 100644
index 000000000000..8a1c91fdd63e
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+
+#include "clk-zx.h"
+
+static void zx_delete_clk_provider(void *data)
+{
+	of_clk_del_provider(data);
+}
+
+static void zx_clk_disable_unprepare_put(void *data)
+{
+	clk_disable_unprepare(data);
+	clk_put(data);
+}
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data)
+{
+	unsigned int public_clk_count = 1, highest_id = 0;
+	struct clk_hw_onecell_data *clocks;
+	struct regmap *map;
+	struct clk *clk;
+	unsigned int i;
+	int res;
+
+	map = device_node_to_regmap(of_node);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	for (i = 0; i < data->num_plls; ++i) {
+		if (data->plls[i].id) {
+			unsigned int last_idx = data->plls[i].id + data->plls[i].num_postdivs - 1;
+
+			if (last_idx > highest_id)
+				highest_id = last_idx;
+			public_clk_count += data->plls[i].num_postdivs;
+		}
+	}
+	for (i = 0; i < data->num_muxes; ++i) {
+		if (data->muxes[i].id) {
+			if (data->muxes[i].id > highest_id)
+				highest_id = data->muxes[i].id;
+			public_clk_count++;
+		}
+	}
+	for (i = 0; i < data->num_divs; ++i) {
+		if (data->divs[i].id) {
+			if (data->divs[i].id > highest_id)
+				highest_id = data->divs[i].id;
+			public_clk_count++;
+		}
+	}
+	for (i = 0; i < data->num_gates; ++i) {
+		if (data->gates[i].id) {
+			if (data->gates[i].id > highest_id)
+				highest_id = data->gates[i].id;
+			public_clk_count++;
+		}
+	}
+
+	if (WARN_ON(public_clk_count != highest_id + 1))
+		return -EINVAL;
+
+	clocks = devm_kzalloc(dev, struct_size(clocks, hws, public_clk_count), GFP_KERNEL);
+	if (!clocks)
+		return -ENOMEM;
+	clocks->num = public_clk_count;
+
+	for (i = 0; i < data->num_inputs_enable; ++i) {
+		clk = of_clk_get_by_name(of_node, data->inputs_enable[i]);
+		if (IS_ERR(clk)) {
+			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s failure\n",
+					     data->inputs_enable[i]);
+		}
+
+		res = clk_prepare_enable(clk);
+		if (res) {
+			clk_put(clk);
+			return dev_err_probe(dev, res, "Input clk %s enable failure\n",
+					     data->inputs_enable[i]);
+		}
+		res = devm_add_action_or_reset(dev, zx_clk_disable_unprepare_put, clk);
+		if (res)
+			return res;
+	}
+	for (i = 0; i < data->num_inputs; ++i) {
+		/* FIXME: devm_get_clk_from_child doesn't do any tree traversal, so it works here
+		 * whether "of_node" belongs to "dev" or a parent of "dev". Is it supposed to be
+		 * used that way though?
+		 */
+		clk = devm_get_clk_from_child(dev, of_node, data->inputs[i]);
+		if (IS_ERR(clk)) {
+			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s failure\n",
+					     data->inputs[i]);
+		}
+	}
+
+	res = zx_clk_register_plls(dev, map, data->plls, data->num_plls, clocks);
+	if (res)
+		return res;
+
+	res = zx_clk_register_muxes(dev, map, data->muxes, data->num_muxes, clocks);
+	if (res)
+		return res;
+
+	res = zx_clk_register_dividers(dev, map, data->divs, data->num_divs, clocks);
+	if (res)
+		return res;
+
+	res = zx_clk_register_gates(dev, map, data->gates, data->num_gates, clocks);
+	if (res)
+		return res;
+
+	/* This is to catch holes in the tables rather than registration errors. The count vs
+	 * highest ID should catch most static issues. This check here will trigger if an ID is
+	 * reused by accident.
+	 */
+	for (i = 1; i < public_clk_count; i++) {
+		if (WARN(!clocks->hws[i], "Clock %u not registered\n", i))
+			return -EINVAL;
+	}
+
+	res = of_clk_add_hw_provider(of_node, of_clk_hw_onecell_get, clocks);
+	if (res)
+		return res;
+	return devm_add_action_or_reset(dev, zx_delete_clk_provider, of_node);
+}
+EXPORT_SYMBOL_NS_GPL(zx_clk_common_probe, "ZTE_CLK");
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE common clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
new file mode 100644
index 000000000000..71ebcc1d5895
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#ifndef __DRV_CLK_ZX_H
+#define __DRV_CLK_ZX_H
+
+#include <linux/platform_device.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+struct zx_pll_desc {
+	unsigned int id;
+	const char *name;
+	const char * const *parents;
+	unsigned int num_parents;
+	unsigned long rate;
+	const unsigned int *postdivs;
+	unsigned int num_postdivs;
+	u16 reg;
+};
+
+struct zx_mux_desc {
+	unsigned int id;
+	const char *name;
+	const char * const *parents;
+	unsigned int num_parents;
+	u16 reg;
+	u8 shift, size;
+};
+
+struct zx_div_desc {
+	unsigned int id;
+	const char *name, *parent;
+	u16 reg;
+	u8 shift, size;
+};
+
+struct zx_gate_desc {
+	unsigned int id;
+	const char *name, *parent;
+	unsigned long flags;
+	u16 reg;
+	u8 shift;
+};
+
+int zx_clk_register_plls(struct device *dev, struct regmap *regmap,
+			 const struct zx_pll_desc *desc, unsigned int num,
+			 struct clk_hw_onecell_data *clocks);
+int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
+			  const struct zx_mux_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks);
+int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
+			     const struct zx_div_desc *desc, unsigned int num,
+			     struct clk_hw_onecell_data *clocks);
+int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
+			  const struct zx_gate_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks);
+
+struct zx_clk_data {
+	const char * const *inputs_enable;
+	unsigned int num_inputs_enable;
+	const char * const *inputs;
+	unsigned int num_inputs;
+	const struct zx_pll_desc *plls;
+	unsigned int num_plls;
+	const struct zx_mux_desc *muxes;
+	unsigned int num_muxes;
+	const struct zx_div_desc *divs;
+	unsigned int num_divs;
+	const struct zx_gate_desc *gates;
+	unsigned int num_gates;
+};
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data);
+
+#endif /* __DRV_CLK_ZX_H */
diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
new file mode 100644
index 000000000000..1a8cb37ca7e2
--- /dev/null
+++ b/drivers/clk/zte/pll-zx.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <linux/errno.h>
+
+#include "clk-zx.h"
+
+int zx_clk_register_plls(struct device *dev, struct regmap *regmap,
+			 const struct zx_pll_desc *desc, unsigned int num,
+			 struct clk_hw_onecell_data *clocks)
+{
+	return -ENODEV;
+}

-- 
2.54.0


