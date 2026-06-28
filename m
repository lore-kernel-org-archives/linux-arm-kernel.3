Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4244CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 21:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toV2D65NA/1vKDBO0FQAofEwMUf/WeMIUe8SBjKCHNY=; b=hosIgdrdrKArLDTW/2Byvq5nPR
	vES1Hsc3ZR6aAzYbPsWUmXGKDVncs1LXKyYE/3uLG/yUu7XfxQuJ7Dk+J+xOzV8guB8X905907AxK
	K7iHeFz0iEhl6NpzpFBWoDLkn4L9MPilO4/ZDT/yViiiJUnP7GO/GhBveZQljqyoDEDOW7zk4acYU
	rJ+YLBeCbFWCDyhs4jSP5kLDayh6YE9gNaSehQMe4VhuUXjyKTsjUfyDOQvTrodZiPoJXqqyly4nz
	bZYkAruPZOLACVMH3KsmdHlkUBXzz71Oc95P5kZA/Cwhz0x/IyAjbj8mBtNzfR7HixJBAVmUpMTR5
	4hijwpAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfR-0000000DL2B-1vNm;
	Sun, 28 Jun 2026 19:59:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfH-0000000DKvQ-0DL3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 19:59:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49249707788so21388135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 12:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676777; x=1783281577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toV2D65NA/1vKDBO0FQAofEwMUf/WeMIUe8SBjKCHNY=;
        b=lYQPF5zp5zc4p3W7cCFnBwiFLYccZtkxnb12PVxJMLEoTiXym+W1PPeZbD9OvU4+Xr
         sq5n/n5ONCM6f9Y/Jisp/1F+WP//gyQgk7VP9ef5EYAMp8YSyiPh7RIFTfYERql6Cqrj
         t5GoHzlWyDUCJ+2iVY2T+m5wZ7eNCO6m1RN4sJm6l9zSybG0jdYrODPjV7EktqNOsl3d
         L3g0OmSXMnXMp4u47AAHykC6CckmKNHjUdXcFRQQigZXuBZA3sAtCAp2h3KSMVcDa6au
         0i+F08g7SSr4uz2cPmBkcxEuU1QbKuNnqlOth6rYrYU6utOjolx6xSsN/l88qJeCQzhr
         Utsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676777; x=1783281577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=toV2D65NA/1vKDBO0FQAofEwMUf/WeMIUe8SBjKCHNY=;
        b=agULTdBasm1qN11BwJoX/oPhztx7Dk0jspXHGmRq+5qXYZca1FNmQcHSgEFQLovi6c
         fQP5ccNrcvFfxyurti/F412TzigPJT7yXHhhu9B9U3/27s+KmQL6zJSTNMqFZUun7DOu
         j6FttIdKlpCI7cBaf/Vpp6z3MCs8jtfAkHbNs3OxyHvrWFzmai4qSL25DVeKIQA/Upe2
         qafmtCtYL1TdpdJbozubniVSMtdrwow6hGgxmnX5GcxJPxAa/igb3WYt6W4gx4+koSnP
         FL6Um7MY0g7s65Z9U6Rl/5bJh1mV7dO4h5cyX8UBesRwDYkjDMUxDq7qSoueDNGoAdFQ
         E7rg==
X-Forwarded-Encrypted: i=1; AFNElJ/xn3hf6kjGWdPjLDwNy/E+gYQW4Kutw3GC4K5O4903BviS6iamg2tFF39cWWqbRL5qoZj3Mj7X9qZ63iax+wjy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw757G93Tx0YwNOW8XKnXCoY5rqodWevX5zKyBhL44V5/cesluJ
	/uQ5CZnEzE5kkZbYKSbUArX7nCQVZWUPGsakLCTQqSSN8o/sFK0de7Rs
X-Gm-Gg: AfdE7ckiX0a05YNoymPD/vTvYNH1XLYAgfdqpoWCHMMtCICkIcJJB5B8ScflEe48RKF
	pri+P9UQQMQQ2uOpiyUSeDkW22QgwdTWw/dgbf8ETuvGxpgiGM6y9e1RlR/NaYhX53o33vES99z
	km8vvK4lRL65odVa2CjMn7ZKYjCf94QthuSupd0Q6C1oPgoLxrFiWvVY9OrFnapjP66JSOBOc+1
	JN3XywkQV692JDKDWCF9QBmjzfFLsrHqE6ihQVUKWeSd35+XOHQBQ0kWCq/wqTdX0rPRkFnDGGT
	V8/ChW/HlRkiLfGivSTnImNtLAftlj6E9/GR+RGgpOW/xLq9bVxVl8w787FYZFLm1GJYCIul3re
	lmVyi3DpfmWeaWgQD7vRA0pKB2AVfU2jNEj0scoBMITfAoFbfHkm3/6v7DTg9jSNPrb3sZld4zk
	yaiLU4spNcLCa5LjwSb6Aks8E=
X-Received: by 2002:a05:600c:81c5:b0:492:4ff5:fb9e with SMTP id 5b1f17b1804b1-4926fcade65mr125720475e9.37.1782676777091;
        Sun, 28 Jun 2026 12:59:37 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:36 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:59:00 +0300
Subject: [PATCH RFC v5 05/12] clk: zte: Add Clock registration
 infrastructure.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-5-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12973;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=7A9PpfqnKJYuQ1Ut22RV/wxFWrB+uE007bJ36MXH8SM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0UYWQvS2Q6jmEAXpx0f/fGLlFM5RhBqLKFa
 potn+k1X+CJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKtvQ/8Clrc9uSJdhdaaE0hFX0dRwojFiRKYFY
 QnNbCFcc74n45WFeYMksIHaxM2wHXdYhZ2Wj1aZ77q+3wOzL5T0U+h4hmoyW1FJjwIVnprv6FQt
 NCo8yYwsR1zgxd/k7vANf8YOy7Pr53lK1J1G8NecPcpiTjL2ScrQlkjO8U+XXhhkzVmBZdSz1NW
 EyjFrbyun78XQowOE4aEHkmITC3eEI54Eo4oLSFuYF+uV5tmIQwTdPJVT1PxZHnxHTZ4sI4qyC8
 FqnIHbIctku0yarxrni9Z9Ui+811LP2XnPaDogb8Woowix3TUyStgO5ygym8NIW5sXQtLWHUuKl
 /y1eqKbFjPZVr8KzoM+LOc+PwNbphIhFKQU286EZR8J09sTsicNzqrfCbtGqgbhfwapMPl4NMZa
 eXdr90ZU/jI7/sx7K8pKpX8qSOkC0zHFiMWPKM7Suh04XwGftSdjkNw5hkM02Vbfxz6nDqvSLbV
 CmizPy7U57qUsDDT+9+SrPIY1p6B5ji4exQbkIRwb1zBeITyZi+vUbZ+2wjIeBzzMsqPw8dcJer
 qq9psGqqfA3ISc69xKBJeYFj6UR/2i/cx5Hk49ENJODaTGWKbwnSLYYL89cgA6ko/YpGozwJVV9
 FfO38rQ1kRwwg0zgdPzkNNN4md9wayE8172z3JIKN2IdYqgaEHA0=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_125939_167616_BED21EA9 
X-CRM114-Status: GOOD (  28.94  )
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
 drivers/clk/zte/Kconfig      |  17 ++++
 drivers/clk/zte/Makefile     |   5 ++
 drivers/clk/zte/clk-regmap.c |  30 +++++++
 drivers/clk/zte/clk-zx.c     | 192 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk-zx.h     |  81 ++++++++++++++++++
 drivers/clk/zte/pll-zx.c     |  19 +++++
 9 files changed, 347 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 57af566030db..297c15a2c860 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3871,6 +3871,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
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
index 000000000000..d098243145ce
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/clk.h>
+
+#include "clk-zx.h"
+
+static void zx_adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(adev);
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
+	struct auxiliary_device *adev;
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
+			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s enable failure\n",
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
+	res = devm_add_action_or_reset(dev, zx_delete_clk_provider, of_node);
+	if (res)
+		return res;
+
+	if (!data->reset_auxdev_name)
+		return 0;
+
+	adev = kzalloc_obj(*adev);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = data->reset_auxdev_name;
+	adev->dev.parent = dev;
+	adev->dev.release = zx_adev_release;
+	adev->dev.of_node = of_node;
+
+	res = auxiliary_device_init(adev);
+	if (res) {
+		dev_err_probe(dev, res, "Failed to init aux dev %s\n", adev->name);
+		goto adev_free;
+	}
+
+	res = auxiliary_device_add(adev);
+	if (res) {
+		dev_err_probe(dev, res, "Failed to add aux dev %s\n", adev->name);
+		goto adev_uninit;
+	}
+
+	return devm_add_action_or_reset(dev, zx_adev_unregister, adev);
+
+adev_uninit:
+	auxiliary_device_uninit(adev);
+adev_free:
+	kfree(adev);
+	return res;
+}
+EXPORT_SYMBOL_NS_GPL(zx_clk_common_probe, "ZTE_CLK");
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE common clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
new file mode 100644
index 000000000000..dabb71f27c16
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.h
@@ -0,0 +1,81 @@
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
+	const char *reset_auxdev_name;
+};
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data);
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


