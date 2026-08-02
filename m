Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7927C55182
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 20:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/uJ9rgeBYsc4vYHFy//xAr9TRI8XAnYRm6j0VRl8+k=; b=KddkkcQNsOKYEVwg5A1IwJr06D
	8t86zwQvC+7lfkKXW8/AM3vSXhyNPy782/mZnMPklGcrKrsif/CjVcgr0BwE+jlP+kJhSOLGogG02
	7Dwi/uvPvJdv2Wt45c8LvAFW4bC8Rr/qfHSKmETs//UtLl3vnnARhmftxiXALwxGytpIFoII0YDPt
	IZSZ2iAQF12iGaVfKPTD7uQftcz4UBtqLW7n5fkliCG/iF2YK2ohhr52UbvwXMLaR6aWge3jC8Ydh
	3ac+LIxZQfHDrTocPrdKE6g04e9iRKzYVkXuPCzcykpsSgwPS54ICYLMuQNhzR88bZCN1fZh2xNNx
	c2RgggqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqctH-0000000G1cu-1CSZ;
	Sun, 02 Aug 2026 20:34:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqctE-0000000G1a0-0wSV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 20:34:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-496b7622a83so8613515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 13:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702870; x=1786307670; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/uJ9rgeBYsc4vYHFy//xAr9TRI8XAnYRm6j0VRl8+k=;
        b=OMp6DUqRg7/V4BoLbXSuQuAdIotTrUL13mSbYwHJNswT6Yvc2DeMHCuqJauDfbgWfW
         EDBt3i4iIWgAT3s4fEyg496ayHKDs/Ehef45kJqKJcYqHGYxbBbwPJi5n+Kc0BDbVIzO
         PZOHy7BkBgiWkRFxLxC/ePAHDwV1ar85uBPJQ1kR9to3CWhybRWp7QWQ8Apt+NtkMkl6
         jBe7tz1CO1z0aHmN77pg50DmyhbNexDeTT6JOkNP9Eu8wZ4pNh7ES3xr4e+C6MOlR+Tp
         vYPESacsYCAf/xJ8bmSy+zEmCwYcTAhMcIDS6s9hVApH/16bgyT3YRGxS5yU8NxSkK6p
         EA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702870; x=1786307670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/uJ9rgeBYsc4vYHFy//xAr9TRI8XAnYRm6j0VRl8+k=;
        b=p5gNpE1Lg5mDbvM+9LbI5Wy9iDf1BBce8bq8bPHXzr5wMStbl8dyTN0ZmJZfKnVJmj
         crzp0oADFLdB47uFU69Z0ERuNGGiX5B/YBFQ/77nXMgnl29Brir1TkU7QH5rZbdjJNla
         myqregRm2BUdWq+NknyxZtpcM2QyoE6e+JNR68utyWuMPrak3H+Lm6+V33RSTb/x36N+
         i+aXRhMKHGBiWXlv55ymz6DfqgM0aD0N7HIbNpBlwZ91pIJbrvTheDmUMEEVY5QK0RfT
         NDquJKbZOBI90cfercb8mwl7Z1/f5dx+KWLbL7hE+LMgPANMPq2mrrRv2E8q8HxWkOH5
         N/mw==
X-Forwarded-Encrypted: i=1; AHgh+RqwKfrsn6a7SXyRGHiL7saPeI0NoE3MdI/x3OsZ0OSfngoxwKSnbHpqswmKOXOGhC6M6o1rXhib3C4CPvO3xFCb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh0CR+bi2MUnmGfKpH73/73Mdo4yH+VH//EgI6O2mV7Il1rW7u
	z1Nt2qkox9dDvYYO734AkyZIqeaer0aIRjkbDf6FYz7Y8V02ztTE3+SI
X-Gm-Gg: AR+sD12ISHSU2MUP/gt/bOvePFBnKO3SeFPLO6IKfLQAMbnAoKkU9xQzQXBQWaarcoe
	vXM14RxaRylEfldXZk11g6Tsos8z7/J7Z5WPjisodyfqv8jtM0p5alQ0WHXYzCo2X4u7E90tcaZ
	zqcTc1Cn9E4BVY08AssiSasr4D88ajBI1J0OrHXLsvIutvPVbroWFBBR9or2Q9Hu1dEpOEdZ/IG
	lt+8eMlMofDwuPfP2Ry9HUO49FMIXySYc95q+HG1aqQIWSjdUErB99Smb02LMVi1Pha/a9tLLje
	TZa5hKWfy7cYgQRFQyM1CCW1hyT+lgQDHvq2/jNJFnQ2SDGMxn7w2hSLi4ZH5c0k9DZBPUxln6/
	bfSq3i5w2dQuIdg6vsDv8+6lEpLAinykw4nXKLR/UDVJCBYve7yP42jzhw5SdJs7cuvc8KtfgIC
	iYw2xpg04S5CfvK5dWaGFFgv5XhJmLXIj1cB88b4gsTuBBGNTTDlXILBh+QxdCfZ+vdGf2Xpfy
X-Received: by 2002:a05:600d:640f:20b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-4980c672adbmr123140795e9.9.1785702870100;
        Sun, 02 Aug 2026 13:34:30 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:28 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:37 +0300
Subject: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15082;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=bliMqz9DYmlGJpuJakC365hV2+7POVwzt1MUpR8IO5k=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6mykflOEFiu71wc1GczjZPa68Y6TmIpQB2Mi
 +T4HtQvzsGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLobQ//TXe/dYXrjElj9++NCXYloN0vSBLejV0
 gEMP3s9qlzMUblSd87qnT4CQkb50Tv30FnyNj7pjkzsQ2I3kCiyl6C/PqIOurRFybJ/SQtGXvPh
 YcrzMC8fyhCqZCkvaGiJv0c45pNM9Q3efQ/Rg9+5g27Bv9+RA/JbRm7/MDQVQlmDqnLZV3rE+ba
 8aQ2SOXJq60FWZE1apDJ4sRXa/17kMCK0sbzmH4YVHzY7IAOyhxHV/TCzibbNfw0Ats8+JGAMuv
 rTd8U1uYSHwMsHHGlSs5NdnymCzHOfz+obA/rOJPK4g3T/vpqBHPsxcKAWQENKgDwSy5DWw8+Vd
 hOHXYUXraoGA1EjBDiDFitCG9BdRIUCAQKoXfCNtdNYLuG61eumzhUrSkj0r0FTx0XcS+eLvrAK
 WSmB9dYyCzwt+AUZDxMT0zGcwkP8smqbn+bMu1HlzKOO/LHBZ7nkxY8vvlPQMHuC0BuCflLCI3N
 amHObSt4JrYdmJ54i5Nsbw2TymFkq0a35qUXgFc6VVrm0YXyjxhMjARoKYgc9i5srpvhka/Lxkv
 LyoJe90wuHCx6pLUPjLP8YBKI288PF6iaPscAiY6P8c5ck5Ol0QQ83jmF0zcRuTEx52yFJo4Xp8
 CRp/E4uaFLrtJrFIrKNzMMLEFxFS+SvlDQuXKl61ruoKZAo3HZv8=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_133432_408197_ACC40DF7 
X-CRM114-Status: GOOD (  31.86  )
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

Version 9:
Rework parent matching and clock export control. Most of the changes
will be in the next patches. The visible change here is that the clock
array is unified with single clocks having a type rather than one array
per type.

Depend on HAS_IOMEM, similarly to Sashiko's flagged issue in the Reset
patch

ZX297520V3_CLK_NO_EXPORT is gone again.

The explicit clock input array and enabling of LSP's pclk is removed
from the clock driver. The MFD parent takes care of this instead. The
clock driver does some sanity checking on the static clock data though.

Version 8:
Use ZX297520V3_CLK_NO_EXPORT=(~0u) for unexported clocks. While using 0,
and starting clock indices at 1, is a common pattern in existing
drivers, it exposes a driver implementation detail in the hardware
binding interface.

If desired, I can change the special index to a separate field in the
structs.

Fix the return value if the ->init() callback fails. (Sashiko)

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
code may have a reference to this data" is trying to tell me.

*) Fix error check for device_node_to_regmap.
---
 MAINTAINERS                  |   1 +
 drivers/clk/Kconfig          |   1 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/zte/Kconfig      |  17 ++++
 drivers/clk/zte/Makefile     |   5 ++
 drivers/clk/zte/clk-regmap.c |  32 ++++++++
 drivers/clk/zte/clk-zx.c     | 189 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk-zx.h     | 142 ++++++++++++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c     |  18 +++++
 9 files changed, 406 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b9f96455bca7..77fa86c671b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3915,6 +3915,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
 F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
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
index 6899e32e14aa..651fe866ddad 100644
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
index 000000000000..152c2423b8f0
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
+	depends on HAS_IOMEM
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
index 000000000000..80332dba97f6
--- /dev/null
+++ b/drivers/clk/zte/clk-regmap.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/regmap.h>
+
+#include "clk-zx.h"
+
+struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
+				    const struct zx_gate_desc *desc,
+				    struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
+				       const struct zx_div_desc *desc,
+				       struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
+				   const struct zx_mux_desc *desc,
+				   struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}
diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
new file mode 100644
index 000000000000..27bbafd8ce4d
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+
+#include "clk-zx.h"
+
+static struct clk_hw *zx_clk_register_fixed_div(struct device *dev,
+						const struct zx_fixed_divider_desc *desc,
+						struct clk_hw * const *clocks)
+{
+	const struct zx_parent_desc *p = &desc->parent;
+
+	switch (p->type) {
+	case ZX_PARENT_FW:
+		return devm_clk_hw_register_fixed_factor_fwname(dev, NULL, desc->name, p->fw_name,
+								CLK_SET_RATE_PARENT, 1, desc->div);
+
+	case ZX_PARENT_ID:
+		return devm_clk_hw_register_fixed_factor_parent_hw(dev, desc->name, clocks[p->id],
+								   CLK_SET_RATE_PARENT, 1,
+								   desc->div);
+	}
+	WARN_ON_ONCE(1);
+	return ERR_PTR(-EINVAL);
+}
+
+static int zx_clk_validate(struct device *dev, struct device_node *of_node,
+			   const struct zx_clk_data *data)
+{
+	const struct zx_parent_desc *parents;
+	unsigned int i, p, num_parents;
+	struct clk *clk;
+
+	/*
+	 * Sanity check: Make sure all parents are there and write a clear message rather than
+	 * leave potential orphans.
+	 */
+	for (i = 0; i < data->num_clocks; ++i) {
+		switch (data->clocks[i].type) {
+		case ZX_CLOCK_PLL:
+			parents = data->clocks[i].pll.parents;
+			num_parents = data->clocks[i].pll.num_parents;
+			break;
+
+		case ZX_CLOCK_FIXED_DIV:
+			parents = &data->clocks[i].fixed_div.parent;
+			num_parents = 1;
+			break;
+
+		case ZX_CLOCK_MUX:
+			parents = data->clocks[i].mux.parents;
+			num_parents = data->clocks[i].mux.num_parents;
+			break;
+
+		case ZX_CLOCK_DIV:
+			parents = &data->clocks[i].div.parent;
+			num_parents = 1;
+			break;
+
+		case ZX_CLOCK_GATE:
+			parents = &data->clocks[i].gate.parent;
+			num_parents = 1;
+			break;
+
+		default:
+			return dev_err_probe(dev, -EINVAL, "Invalid clock entry %u\n", i);
+		}
+
+		for (p = 0; p < num_parents; ++p) {
+			switch (parents[p].type) {
+			case ZX_PARENT_FW:
+				clk = of_clk_get_by_name(of_node, parents[p].fw_name);
+				if (IS_ERR(clk))
+					return dev_err_probe(dev, PTR_ERR(clk),
+							     "Input clk %s failure\n",
+							     parents[p].fw_name);
+				clk_put(clk);
+				break;
+
+			case ZX_PARENT_ID:
+				if (parents[p].id >= i)
+					return dev_err_probe(dev, -EINVAL,
+							     "Clock %u has parent %u\n",
+							     i, parents[p].id);
+				break;
+
+			default:
+				return dev_err_probe(dev, -EINVAL,
+						     "Clock %u has unexpected parent of type %u\n",
+						     i, parents[p].type);
+			}
+		}
+	}
+
+	return 0;
+}
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data)
+{
+	struct clk_hw_onecell_data *exports;
+	struct clk_hw **clocks;
+	struct regmap *map;
+	unsigned int i;
+	int res;
+
+	res = zx_clk_validate(dev, of_node, data);
+	if (res)
+		return res;
+
+	map = device_node_to_regmap(of_node);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	clocks = devm_kcalloc(dev, data->num_clocks, sizeof(*clocks), GFP_KERNEL);
+	if (!clocks)
+		return -ENOMEM;
+
+	if (data->init) {
+		res = data->init(map);
+		if (res)
+			return res;
+	}
+
+	for (i = 0; i < data->num_clocks; ++i) {
+		struct clk_hw *hw;
+
+		switch (data->clocks[i].type) {
+		case ZX_CLOCK_PLL:
+			hw = zx_clk_register_pll(dev, map, &data->clocks[i].pll, clocks);
+			break;
+
+		case ZX_CLOCK_FIXED_DIV:
+			hw = zx_clk_register_fixed_div(dev, &data->clocks[i].fixed_div, clocks);
+			break;
+
+		case ZX_CLOCK_MUX:
+			hw = zx_clk_register_mux(dev, map, &data->clocks[i].mux, clocks);
+			break;
+
+		case ZX_CLOCK_DIV:
+			hw = zx_clk_register_divider(dev, map, &data->clocks[i].div, clocks);
+			break;
+
+		case ZX_CLOCK_GATE:
+			hw = zx_clk_register_gate(dev, map, &data->clocks[i].gate, clocks);
+			break;
+
+		default:
+			return -EINVAL;
+		}
+
+		if (IS_ERR(hw))
+			return dev_err_probe(dev, PTR_ERR(hw), "Failed to register clk %u\n", i);
+
+		clocks[i] = hw;
+	}
+
+	exports = devm_kzalloc(dev, struct_size(exports, hws, data->num_exports), GFP_KERNEL);
+	if (!exports)
+		return -ENOMEM;
+	exports->num = data->num_exports;
+
+	for (i = 0; i < data->num_exports; ++i) {
+		if (data->exports[i] >= data->num_clocks)
+			return dev_err_probe(dev, -EINVAL,
+					     "Export %u points to out of range clock %u\n",
+					     i, data->exports[i]);
+
+		exports->hws[i] = clocks[data->exports[i]];
+	}
+
+	devm_kfree(dev, clocks);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, exports);
+}
+EXPORT_SYMBOL_NS_GPL(zx_clk_common_probe, "ZTE_CLK");
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE common clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
new file mode 100644
index 000000000000..175fbba3e0b3
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.h
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#ifndef __DRV_CLK_ZX_H
+#define __DRV_CLK_ZX_H
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#define CLK_ZX_PLL_PREPARE_IS_ENABLE	1
+#define CLK_ZX_MAX_PARENTS		8
+
+enum zx_parent_type {
+	ZX_PARENT_FW,
+	ZX_PARENT_ID,
+};
+
+struct zx_parent_desc {
+	enum zx_parent_type		type;
+	union {
+		const char		*fw_name;
+		unsigned int		id;
+	};
+};
+
+#define PARENT_FW(_name) { .type = ZX_PARENT_FW, .fw_name = (_name) }
+
+#define PARENT_ID(_id) { .type = ZX_PARENT_ID, .id = (_id) }
+
+static inline struct clk_parent_data zx_get_parent(const struct zx_parent_desc *p,
+						   struct clk_hw * const *clocks)
+{
+	struct clk_parent_data ret = {};
+
+	switch (p->type) {
+	case ZX_PARENT_FW:
+		ret.fw_name = p->fw_name;
+		ret.index = -1;
+		return ret;
+
+	case ZX_PARENT_ID:
+		ret.hw = clocks[p->id];
+		ret.index = -1;
+		return ret;
+	};
+
+	WARN_ON_ONCE(1);
+	return ret;
+}
+
+struct zx_pll_desc {
+	const char			*name;
+	const struct zx_parent_desc	*parents;
+	unsigned int			num_parents;
+	unsigned long			rate;
+	u16				reg;
+	u16				flags;
+};
+
+struct zx_fixed_divider_desc {
+	const char			*name;
+	struct zx_parent_desc		parent;
+	unsigned int			div;
+};
+
+struct zx_mux_desc {
+	const char			*name;
+	const struct zx_parent_desc	*parents;
+	unsigned int			num_parents;
+	u16				reg;
+	u8				shift, size;
+};
+
+struct zx_div_desc {
+	const char			*name;
+	struct zx_parent_desc		parent;
+	u16				reg;
+	u8				shift, size;
+};
+
+struct zx_gate_desc {
+	const char			*name;
+	struct zx_parent_desc		parent;
+	unsigned long			flags;
+	u16				reg;
+	u8				shift;
+};
+
+enum zx_clock_type {
+	ZX_CLOCK_INVALID = 0,
+	ZX_CLOCK_PLL,
+	ZX_CLOCK_FIXED_DIV,
+	ZX_CLOCK_MUX,
+	ZX_CLOCK_DIV,
+	ZX_CLOCK_GATE,
+};
+
+struct zx_clock {
+	enum zx_clock_type type;
+	union {
+		struct zx_pll_desc pll;
+		struct zx_fixed_divider_desc fixed_div;
+		struct zx_mux_desc mux;
+		struct zx_div_desc div;
+		struct zx_gate_desc gate;
+	};
+};
+
+struct clk_hw *zx_clk_register_pll(struct device *dev, struct regmap *regmap,
+				   const struct zx_pll_desc *desc,
+				   struct clk_hw * const *clocks);
+struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
+				   const struct zx_mux_desc *desc,
+				   struct clk_hw * const *clocks);
+struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
+				       const struct zx_div_desc *desc,
+				       struct clk_hw * const *clocks);
+struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
+				    const struct zx_gate_desc *desc,
+				    struct clk_hw * const *clocks);
+
+struct zx_clk_export {
+	unsigned int priv;
+	unsigned int binding;
+};
+
+struct zx_clk_data {
+	int (*init)(struct regmap *map);
+	const struct zx_clock *clocks;
+	unsigned int num_clocks;
+	unsigned int *exports;
+	unsigned int num_exports;
+};
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data);
+
+#endif /* __DRV_CLK_ZX_H */
diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
new file mode 100644
index 000000000000..fc76c6524a16
--- /dev/null
+++ b/drivers/clk/zte/pll-zx.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/regmap.h>
+
+#include "clk-zx.h"
+
+struct clk_hw *zx_clk_register_pll(struct device *dev, struct regmap *regmap,
+				   const struct zx_pll_desc *desc,
+				   struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}

-- 
2.54.0


