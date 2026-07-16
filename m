Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D2CC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mAie+4SRqYB5ehQZsR75LVrdIpVXjXA+qRH2nIqf3c=; b=x2ZkUxIURvJoA9nvBMdUOQchlO
	PNC5RmcZSy5jw8QOBMDxqgVBLF1g4oowQJx30Tx27Uf2Yg9WW9IRZoXVyA1aelp7mOhJfhLGLpRpN
	3Vb/NTiShosHQS0dLBcykjX7gJkDTIkd581pZxjWSmW4hjnz0dadO5TPxsDsNpNfdbpdJBP/C/HK3
	sr1n1rLFpDm5eMMFZ0M3max6qUv1M1ZdNdSEpbqzJij/BvN2AefsZ51kyRO86+H0Dy+ePd4gouqSO
	OGCwlJP4KePETSYQ+8htArF+VGLRMO6NHdRyMPAG5RMHEamD7fkL+uYv2uN4L01qE5cB2+llYJRcd
	UCsl65XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTkl-00000000eOr-1Oqe;
	Thu, 16 Jul 2026 21:36:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTkf-00000000eHd-2fLJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:36:19 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493f6de72faso7169655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 14:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237776; x=1784842576; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mAie+4SRqYB5ehQZsR75LVrdIpVXjXA+qRH2nIqf3c=;
        b=PcBTGE7sSEakUjn0KS7to0TVPDtDKkz7jTiWM3s0wGzSOXSc/D7Wn1W+XdyJPJrUlU
         D4z4WNDOah/cStUHWH5Q2B3sEiyphS7aqVVSFBCu2FmtJ8me5jkjOBsxqFxRpRzvLgmI
         +qmfGAq+3vsZpe4RHBEETwIuf3jr4U0276QARQ2jC9UrZttBTZUB+/h44MF3vNuMiBpp
         8iOVuk87/8pB+07XO5/oyslcSO9MDqBWQXbtpLXgony9zPr28/Z7o9wl6nFx+S1zP2Qh
         4SnxEGQoWkr/GoORIJ8ZlcV+4kpqI887K867EAuBXyRzqCt6Ac1lkdjJlmHSXL+pnC9H
         1GIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237776; x=1784842576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mAie+4SRqYB5ehQZsR75LVrdIpVXjXA+qRH2nIqf3c=;
        b=UPbGKbLUoNMowXs5wW2DwmibHTNXur3iCr3/c9wWI/91cBLHSOmKYCGE/Jjf8D8SqB
         38Oqemi16UBxapBupUiPME95qB0se1IZmsN5mp0kmqCyOT6QdrohnhXA2g98KYljl3KH
         364PgcMssm4i4RXei4VCXd05wmBd5RgBmZmrcuN1TIwvy3ZCn0BRt/M3VkD/EVaeKvEp
         vP5bi0FcoVIiyGec/77mHAntOo/otQkmL+5yg7bJWQujD+l1R16SJfyIPTME/IGvabpz
         6HcmThUCqPuzRh8njI3Kieg7FYfoaXAA589BI3YnPH+Jb5bhiAFiXKERsR3y2bL6Icc8
         5bJg==
X-Forwarded-Encrypted: i=1; AHgh+Rpfs3fbUrMHF/Hks72r3TR1CGUrfNf8dRJxSM1iN/g0fC8ntvkQDpf1ZhKXHVhjrJSiaGGhclBPW70IGX44ebf8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7gBFMcXg0t0/xfJXMO8frVYK2Ou3RHATnQzr7bxOzL8fcqOf6
	oINC9XeYOqH+dMHNiJGMDiI3/qnx79lYx4j7/MF/LGeXNEsN5vFBOuk/
X-Gm-Gg: AfdE7cm20NxHklL3g+GMsEAx50YEdTy30NsrJ+iTIUn/AgYwokDYGiui4CouGSS85kW
	FG/WvDq7/H+FACr6IkffwZvMedRhuC74vcfLbugaX5iVbjMOUqxmjPnEcWPz5oEk4zo7xlN7mMx
	PvVQShlLpRyW8Uj5I3n4wYAxiWNY+yh4gQwj10fOyVn3kGFY2wL1lEwMz09boQAoUS2PrFpUSBl
	UxtPmcw7ScCQf+UXbgk2L+HVg0OLSoGSt5qx7mrff/XCgJWkAUsEAID+jXv/qQdUkABbuXMSf7D
	5rxlty6Fgj1kJ7UuYLTa6i69IHvEhvRLrS0/1XkavnLqFiwcJkKP/TAJHzGrsvcCN6fdLDGUsMF
	nJLRmNpaL2Kz6047ghZ1Sx+Vgs60Bm5ChDe1Fx1LpR5h1eYawcYBcXGGKT39R0EimnYldi/sn51
	v5lQwDDmz6I0fu
X-Received: by 2002:a05:600c:a48:b0:493:b4a3:5ab0 with SMTP id 5b1f17b1804b1-4954288882bmr50519625e9.13.1784237775629;
        Thu, 16 Jul 2026 14:36:15 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:36:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 17 Jul 2026 00:35:42 +0300
Subject: [PATCH v7 06/13] clk: zte: Add Clock registration infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-zx29clk-v7-6-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12642;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=C5xKHsMuzaBYcEFc16GfaBkK5o1oYFjlxMRTNW9V63E=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6xti7TkPF9z6pIDzJfNXj1b/BzbhKQGRF9K
 TeXXhygafaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOsRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiImPA//QyTRrt/qagmCe12CJycWOEDtslxoiz1
 6pGKp/qb+XM2zsb62ozc1nWhpjI19jo3f1WETKCR0ODpKgTJUmBj+lhQ87fQrl9XRDHvEuxXars
 BHUgHY7lCDlcudxmTaoRabCgihzh7JnbOplWKSqBMHrYw010QtSId4T3OxT6HaeiEKwCWDGf5TJ
 vIeeT3mJlfg4et1C8hB3KChIDRz2a/r14L/2gIN8dEvQEYBdjMFA1DFX8expxfOP/7zcfwfnpQS
 fhX6BkRKJTq7YSO+goMcVTeV1BISGzmtuIOTHWwDLy1zXzQ9jSbqe+LdNmGykl3urXnMHBBe99x
 ubtzm2JNmjO3i1GW90eH+aEoBHQ5Jt8z0qLyi8q/WdC93xFOdNqf4jeS31X/TDZh4Dp0ulUpWDC
 OKzcSBZUImz7wWQe2AUlndMhdM1OVHj7DLK7PTffrNUnPuHcdn5xMKfCmcxMRuk6GaV5YgYZOUN
 hi21dgcA5jrNl3A7qDh6INzNoCzaoRe0n/BnjrofyZCYS2oeEJ/EFFD8kGLeALFzaC5xt0WvkWe
 fMhhRQEh11DLGLHEnci0TU3JdGApzyBsvbUZu0R6xBXqaQC2lcOemUhD/oemdD/jGtNYWt3ABjX
 xaCa3dkdD7bLVhMKq8Cu3fRzA+BE/5ct3R1x2mp7BD/OGQyZPyOY=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_143617_800871_688CC577 
X-CRM114-Status: GOOD (  28.99  )
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

Version 7:
*) Add fixed dividers to handle PLL subdivisions
*) Never register PLLs directly as exported clocks - everything on this
SoC goes through a gate before it leaves a controller.

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
 drivers/clk/zte/clk-regmap.c |  34 ++++++++++
 drivers/clk/zte/clk-zx.c     | 155 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk-zx.h     |  90 +++++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c     |  16 +++++
 9 files changed, 319 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ca3312aa746..f88a2eda737a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3884,6 +3884,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
 F:	drivers/soc/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
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
index 000000000000..984abeb45ab2
--- /dev/null
+++ b/drivers/clk/zte/clk-regmap.c
@@ -0,0 +1,34 @@
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
+			     const struct zx_div_desc *desc, unsigned int num)
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
index 000000000000..db4fad2b4b05
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.c
@@ -0,0 +1,155 @@
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
+static int zx_clk_register_fixed_dividers(struct device *dev, struct regmap *regmap,
+					  const struct zx_fixed_divider_desc *desc,
+					  unsigned int num)
+{
+	struct clk_hw *clk;
+	unsigned int i;
+
+	for (i = 0; i < num; ++i) {
+		clk = devm_clk_hw_register_fixed_factor(dev, desc[i].name, desc[i].parent,
+							CLK_SET_RATE_PARENT, 1, desc[i].div);
+		if (IS_ERR(clk)) {
+			return dev_err_probe(dev, PTR_ERR(clk), "Failed to register clk %s\n",
+					     desc[i].name);
+		}
+	}
+
+	return 0;
+}
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
+	for (i = 0; i < data->num_muxes; ++i) {
+		if (data->muxes[i].id) {
+			if (data->muxes[i].id > highest_id)
+				highest_id = data->muxes[i].id;
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
+	if (data->init) {
+		res = data->init(map);
+		if (res)
+			return dev_err_probe(dev, PTR_ERR(clk), "Controller init failure\n");
+	}
+
+	res = zx_clk_register_plls(dev, map, data->plls, data->num_plls);
+	if (res)
+		return res;
+
+	res = zx_clk_register_fixed_dividers(dev, map, data->fixed_divs, data->num_fixed_divs);
+	if (res)
+		return res;
+
+	res = zx_clk_register_muxes(dev, map, data->muxes, data->num_muxes, clocks);
+	if (res)
+		return res;
+
+	res = zx_clk_register_dividers(dev, map, data->divs, data->num_divs);
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
index 000000000000..b30e4a29d951
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.h
@@ -0,0 +1,90 @@
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
+#define ZX297520V3_PLL_PREPARE_IS_ENABLE	1
+
+/* PLLs, divs and fixed div/factor clocks are never exported directly, only
+ * through a gate.
+ */
+
+struct zx_pll_desc {
+	const char *name;
+	const char * const *parents;
+	unsigned int num_parents;
+	unsigned long rate;
+	u16 reg;
+	u16 flags;
+};
+
+struct zx_fixed_divider_desc {
+	const char	*name;
+	const char	*parent;
+	unsigned int	div;
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
+			 const struct zx_pll_desc *desc, unsigned int num);
+int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
+			  const struct zx_mux_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks);
+int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
+			     const struct zx_div_desc *desc, unsigned int num);
+int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
+			  const struct zx_gate_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks);
+
+struct zx_clk_data {
+	int (*init)(struct regmap *map);
+	const char * const *inputs_enable;
+	unsigned int num_inputs_enable;
+	const char * const *inputs;
+	unsigned int num_inputs;
+	const struct zx_pll_desc *plls;
+	unsigned int num_plls;
+	const struct zx_fixed_divider_desc *fixed_divs;
+	unsigned int num_fixed_divs;
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
index 000000000000..f8ddb4c7dff6
--- /dev/null
+++ b/drivers/clk/zte/pll-zx.c
@@ -0,0 +1,16 @@
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
+			 const struct zx_pll_desc *desc, unsigned int num)
+{
+	return -ENODEV;
+}

-- 
2.54.0


