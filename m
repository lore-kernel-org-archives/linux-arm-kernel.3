Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D67CCD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 20:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXBv0LTahcDV/Iaq6s1n4lHcOX1JeaCaC/1W6Jb31AA=; b=OOzt2lpy+oTsdaXzmez5krAUYe
	CGAX7psvOpBqXW9Z4tbJgOQrOflnF/Oui/iz/SlGmH6tyMCnLoY6LC4LFZYfZjKnYV5YPI8Y5AhGg
	Iupuuu7Nsg/BkpWoWFOqXd4d1ftY67SFYe5QC7ilcL43eFz/I+sFcd4l4R8BW5yEx7Qd73RGbG9Tg
	cOBu65wPACUGq5KCuNcXdEoJj3hxqS609XGw3P/nLmzAfLYUhAYteHKtIn/Ip8wrDFOh3ioUtA0pT
	lS9fnjtn4Y5UKC2xcob6gLG8W3mmcL20+s17wFKSL/FG6x6mvBnPtiWuJ3dARt/ANhIXAylrxejp6
	NMGOC45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaNM-0000000GHwc-3AVZ;
	Tue, 16 Jun 2026 20:27:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaNJ-0000000GHu7-0gwL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 20:27:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-45eeba68948so3694941f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 13:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641627; x=1782246427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXBv0LTahcDV/Iaq6s1n4lHcOX1JeaCaC/1W6Jb31AA=;
        b=R2vw24t1VaZxuDISnT6sCPe+3Pcqe1ooRXGGOX5PKItj6BVO3SCt8IxZXt5n4ZIgFR
         O1oJh4DSAmWRBMxG0X7UcogeN0yu6HY1ADFWf2l3mdirEykVF8XUcrkQ4tjPblA8bRG5
         UKrKefC7M6U0gMkku8GcS7iLP6Pq7llOADG3Qao51D5uv2fOY1cEp7fLefAOQT+bjcT8
         9+jvOA4NeYv0c6gyrz1vnwUKJe54Ygv+N7/DI1GMGivMzaWe3he7Xc2nCCqF8VBQCwbs
         XA+BY90MGBQrBka/qthTevc5kHu3oKlODErQ91VyTh+Pr980gTnZosPuunz9ZLi5ga2J
         j1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641627; x=1782246427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXBv0LTahcDV/Iaq6s1n4lHcOX1JeaCaC/1W6Jb31AA=;
        b=leW9LbaXFvOwiVDiVy3oObXFTSbjA8ev2N2IH0lBTw3B0lJWvhYXzkJJLUOlebXz2R
         ASL17UassxTw5/rWAMHBGSLRTT3crLP/z4apzZFlRonpZsyxu3fcHPRhXlu6hZuJiJBw
         1bFpTu5zu/5VsK6/hWEv95SZzAhEHtuO35yQ2XHu4hIO4jtZuUYHFeSPWV8zzu+1n256
         76GTO+UKyNtUgs/1+zF6XEjq/vF2gAcTsUnD0et5eWvKmjkKMYrZawL0kNobY5zTyKm0
         6RBM2QuVe5hsBEGEMzCq+s//M2cvk9eQaw57rMPuYCyrMgEPher+qmZSUuxe5Eap4GCW
         jW1Q==
X-Forwarded-Encrypted: i=1; AFNElJ91wJvTPjupzrwtQarSsNj/rgVdNeeVA+xWVbMTdz4KuzLXXgqe99ytsfmMkMW188eE20Qi/TLmd/y26UVnHddr@lists.infradead.org
X-Gm-Message-State: AOJu0YwtyG5gRZrTlL7auVT+L+FsTP4QNWGepkC80IVyBFbKqk9x+OP2
	M9fPdaKoroz3IXm8JINa+C3qecwtR8nUnjr23NcCXtPRnumxKt3k777F
X-Gm-Gg: Acq92OEL3areLPgidAzn/PgfheiwM+fIj+Vve9ml7UNCVTRUE1NkMHAdKwKczLePIjA
	Vuuiwwrm5lZCd3Tz5f1ZtmN/UGO/eyCt3dG4CTkoRfxFosj9TB5b0Ci1NJWb2mdGJcXIkIk9BYy
	aqgesOH1qN9sf82vIlCUJuWXM5MfdwYOvrehsqCYL+xpHNmmg+vssgU63MHFoC9u4w8ERjbA7vi
	3MnX0Splk3SR6LPKnNP3jcKaWvgkhDfEufr3t3n4yOdeIA4IFkzppU7xBaaxARdQuNVMWJ1atWh
	AnSuQ/X3q5B0/o1WXeW+GqBcgHeZ9jP87aFpMPMgkpiguoEWaZPrpD7Hr3xbLy25AwBa9C5J3j1
	KZNcfTRamqQtlUWbNk7A+wcKs117hv6lStlNw7pzNjrXHvqMYA3VPCNU9uG7+nsvmRT+9I8Xyrs
	MU0D+FaxZon/h/dbJBWIg1n05rRMCPswYKJQ==
X-Received: by 2002:a05:600c:a104:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-492333ab197mr15140435e9.13.1781641626827;
        Tue, 16 Jun 2026 13:27:06 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:06 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:24 +0300
Subject: [PATCH RFC v4 04/12] clk: zte: Add Clock registration
 infrastructure.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-4-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11496;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=qum6l8+tCrrqR02yHwh3t4yH0w6TRVXfiZs3oZFSBbY=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGvZqzCIpbWjYc5d7M1aNl2DjTTdzYR2Kq2
 ig8adoeMGKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKEKBAAoyvFxBhwoWKuc9d5nb7HQWGArjoDaAy
 98GoacliWT6n/v5nS8F9r5cRNcr9UL/inhK80tv3dMtprYK4SWA9QHbIPlbGOWx9riFjf157yYj
 hnK5ynhEbEO3KmzasZAboD92Ee3cgljkUNXGw/Am9C9Ray7lO3GunuFgyGuE3bf2l8efMkJQz04
 1dj0yJ0c6PzM8+7kFLS+SDrKUfGcR+fwFg2ej1eni8vUCBfdEYLLyCVKpiiqN1e2FeOzPhIUnIy
 T2Sr5ro82ik4vmkiaQM9F+iVdaiBQAi2V+5ouCL0DK/9oiMkWT0RZjl7LiFfv/IYZBaJMomjJ/2
 OUQ+pSsl9n3O9PYcSVmCFaiN6T5ddKAcgT3tw6/r7dMZjrCe83zZzjVYaxg1p5JhwLuBSuhEowr
 XdtZfykGXdKmPICd7mSUXS1eK1Mr2zvqHyWZXfRqzgBmxru0YCuF3gNB+JbYckTjVt5yqQBRXB1
 9HMRge3gJ82G2Qqn5D1lJLqxvMUHpC8B7MizSeTU4FRj5Os4nTlZ/BJ6+4d1vP7BEP5hIoBIM5z
 au+2P4sBmZCoPaR+2WbKtRleLuiZ8hNk4hwAbYGdSqb/cSY2xtvf/XziAlAxqmCS8wufNexys4w
 bomTXjdrfQhL+1lwANc3j/hUGSP1+3JpQMz2bWeOzsIGtM/I1QvU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_132709_269063_425C60C9 
X-CRM114-Status: GOOD (  23.13  )
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
 MAINTAINERS                  |   1 +
 drivers/clk/Kconfig          |   1 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/zte/Kconfig      |  17 +++++
 drivers/clk/zte/Makefile     |   5 ++
 drivers/clk/zte/clk-regmap.c |  30 +++++++++
 drivers/clk/zte/clk-zx.c     | 157 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk-zx.h     |  79 ++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c     |  19 ++++++
 9 files changed, 310 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cc1ede3c80c..f1f0459b2c72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3870,6 +3870,7 @@ F:	Documentation/devicetree/bindings/arm/zte.yaml
 F:	Documentation/devicetree/zte,zx297520v3-*
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 
 ARM/ZYNQ ARCHITECTURE
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
index 000000000000..b7b65a2172a9
--- /dev/null
+++ b/drivers/clk/zte/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# ZTE Clock Drivers
+#
+
+config COMMON_CLK_ZTE
+	tristate "Clock driver for ZTE SoCs"
+	depends on ARCH_ZTE || COMPILE_TEST
+	default ARCH_ZTE
+	select AUXILIARY_BUS
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
index 000000000000..7908f1562f63
--- /dev/null
+++ b/drivers/clk/zte/clk-regmap.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Copyright (c) 2026 Stefan Dösinger.
+ * Author: Stefan Dösinger <stefandoesinger@gmail.com>
+ */
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
index 000000000000..6e21c4a82a46
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/platform_device.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+
+#include "clk-zx.h"
+
+static void zx_adev_release(struct device *dev)
+{
+	dev_info(dev, "Aux device released.\n");
+}
+
+static void zx_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+int zx_clk_probe(struct platform_device *pdev)
+{
+	unsigned int public_clk_count = 1, highest_id = 0;
+	struct clk_hw_onecell_data *clocks;
+	struct device *dev = &pdev->dev;
+	const struct zx_clk_data *data;
+	struct auxiliary_device *adev;
+	struct regmap *map;
+	struct clk *clk;
+	unsigned int i;
+	int res;
+
+	data = device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	map = device_node_to_regmap(dev->of_node);
+	if (!map)
+		return -EINVAL;
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
+		clk = devm_clk_get_enabled(dev, data->inputs_enable[i]);
+		if (IS_ERR(clk)) {
+			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s failure\n",
+					     data->inputs_enable[i]);
+		}
+	}
+	for (i = 0; i < data->num_inputs; ++i) {
+		clk = devm_clk_get(dev, data->inputs[i]);
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
+	res = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clocks);
+	if (res)
+		return res;
+
+	adev = devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = data->reset_auxdev_name;
+	adev->dev.parent = dev;
+	adev->dev.release = zx_adev_release;
+	adev->dev.of_node = dev->of_node;
+
+	res = auxiliary_device_init(adev);
+	if (res)
+		return dev_err_probe(dev, res, "Failed to init aux dev %s\n", adev->name);
+
+	res = auxiliary_device_add(adev);
+	if (res) {
+		auxiliary_device_uninit(adev);
+		return dev_err_probe(dev, res, "Failed to add aux dev %s\n", adev->name);
+	}
+
+	return devm_add_action_or_reset(dev, zx_adev_unregister, adev);
+}
+EXPORT_SYMBOL_NS_GPL(zx_clk_probe, "ZTE_CLK");
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE common clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
new file mode 100644
index 000000000000..b39bbed2d420
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.h
@@ -0,0 +1,79 @@
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
+	const char *reset_auxdev_name;
+};
+
+int zx_clk_probe(struct platform_device *pdev);
+
+#endif /* __DRV_CLK_ZX_H */
diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
new file mode 100644
index 000000000000..c0475d5441fb
--- /dev/null
+++ b/drivers/clk/zte/pll-zx.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <linux/clk-provider.h>
+#include <linux/rational.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <linux/units.h>
+#include <linux/clk.h>
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
2.53.0


