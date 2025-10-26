Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1648DCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 13:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iV7zXOLSpDl/GjDGuTV0gXndmuj4awizgI6hEbwPz0o=; b=K6a/t31A+bn2DNlIs4yIO2xPIL
	pm0n4JDMp5ITX131x7Gc9BimvJ9I5ezkzj2qWg3eCviarVoBuBJ7aKiuPOaByqSfDT6fLVVsYUPzc
	Jc+hEQloGMSoLe5HX9yqhYgKm97YaYoW0RaHuW+gYykS5ZEGHnbf/DrsrLQQ5mQsTRBQFb4MOPZIp
	0bcZtQYdtDA1mz1EgdQpDO9y1qZEXgRDcQKnXSKgyawUEsHO/oy3Ar0yaC9bxkB68TIzx4zDt02BE
	rLXjKYYc4LwTxJJtCfD7wltc+GNGEalXctdx0l9nmY8qZPTaZYZmXWZhJdmyQIAEMAK+ZlvjPf4xJ
	HsD9SutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1AO-0000000CNcC-2H1C;
	Sun, 26 Oct 2025 13:52:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1AJ-0000000CNZl-1KgV;
	Sun, 26 Oct 2025 13:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BABD43EF8;
	Sun, 26 Oct 2025 13:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DA4AC4CEFB;
	Sun, 26 Oct 2025 13:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761486730;
	bh=VGhYHt255SJat/VZWwuHPYqjLmHTlXqw3IFSd7ls2NI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=logvqZrn8mhBrRnpGEFyvMMfMk91tt2qUn/kx478z5f5JrNIG/vNSGGm9UXyVlBws
	 eawg5X72Nc+W9pFEmTbuYIceEffLCaVe4j+PVL4SfRxmbl5qqrCgajsYN0XAkzhVBL
	 VRbb9m4RijbslgqeTt3aBtU4Anx8wpAxrfwTBJEl/yJb18W5+J0GF6+sGHXK0pWe2m
	 G9yb5Qvfh90WpLYhl36UNKPVBj6h+nJl1rR9WnjpFKJD46IuHNZOs/cmAow95NB2RU
	 WQpvNtWq8Y0faojJiq0DQKrB/fgCOnOQ4HynPTEGk49yf0gmojRiHM5gG6A1oyEQhK
	 zInIV/ToDqQ9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26B6CCD1A5;
	Sun, 26 Oct 2025 13:52:09 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 26 Oct 2025 13:52:01 +0000
Subject: [PATCH 1/3] soc: apple: Add hardware tunable support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-b4-atcphy-v1-1-f81b1225f9c6@kernel.org>
References: <20251026-b4-atcphy-v1-0-f81b1225f9c6@kernel.org>
In-Reply-To: <20251026-b4-atcphy-v1-0-f81b1225f9c6@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6246; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=VGhYHt255SJat/VZWwuHPYqjLmHTlXqw3IFSd7ls2NI=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Y/9eb9V+9/yqmL7D4gkWtvsKc91P/tFtOMug07pGrc+
 eYfyn3XUcrCIMbBICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhIeQwjwx3rH+tE36iuuypZ
 KX7/SsRxZ9F16fJNyel630I/NKh4/WNk2Hrtg+3/ZaJtuqsq7ryNltifz3ww77rylf/ld/kiVK/
 nMQIA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_065211_399777_5980D984 
X-CRM114-Status: GOOD (  18.91  )
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

Various hardware, like the Type-C PHY or the Thunderbolt/USB4 NHI,
present on Apple SoCs need machine-specific tunables passed from our
bootloader m1n1 to the device tree. Add generic helpers so that we
don't have to duplicate this across multiple drivers.

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/soc/apple/Kconfig         |  4 +++
 drivers/soc/apple/Makefile        |  3 ++
 drivers/soc/apple/tunable.c       | 71 +++++++++++++++++++++++++++++++++++++++
 include/linux/soc/apple/tunable.h | 60 +++++++++++++++++++++++++++++++++
 4 files changed, 138 insertions(+)

diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
index ad67368892311bed5a94d358288390a6fb8b3b4a..d0ff32182a2b4a10c98cb96c70a03bea8c650f84 100644
--- a/drivers/soc/apple/Kconfig
+++ b/drivers/soc/apple/Kconfig
@@ -38,6 +38,10 @@ config APPLE_SART
 
 	  Say 'y' here if you have an Apple SoC.
 
+config APPLE_TUNABLE
+	tristate
+	depends on ARCH_APPLE || COMPILE_TEST
+
 endmenu
 
 endif
diff --git a/drivers/soc/apple/Makefile b/drivers/soc/apple/Makefile
index 4d9ab8f3037b7159771d8817fa507ba29f99ae10..0b85ab61aefe131349a67d0aa80204edd8e89925 100644
--- a/drivers/soc/apple/Makefile
+++ b/drivers/soc/apple/Makefile
@@ -8,3 +8,6 @@ apple-rtkit-y = rtkit.o rtkit-crashlog.o
 
 obj-$(CONFIG_APPLE_SART) += apple-sart.o
 apple-sart-y = sart.o
+
+obj-$(CONFIG_APPLE_TUNABLE) += apple-tunable.o
+apple-tunable-y = tunable.o
diff --git a/drivers/soc/apple/tunable.c b/drivers/soc/apple/tunable.c
new file mode 100644
index 0000000000000000000000000000000000000000..c54da8ef28cef16118c518c761f95e8dd9f78002
--- /dev/null
+++ b/drivers/soc/apple/tunable.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple Silicon hardware tunable support
+ *
+ * Each tunable is a list with each entry containing a offset into the MMIO
+ * region, a mask of bits to be cleared and a set of bits to be set. These
+ * tunables are passed along by the previous boot stages and vary from device
+ * to device such that they cannot be hardcoded in the individual drivers.
+ *
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/soc/apple/tunable.h>
+
+struct apple_tunable *devm_apple_tunable_parse(struct device *dev,
+					       struct device_node *np,
+					       const char *name)
+{
+	struct apple_tunable *tunable;
+	struct property *prop;
+	const __be32 *p;
+	size_t sz;
+	int i;
+
+	prop = of_find_property(np, name, NULL);
+	if (!prop)
+		return ERR_PTR(-ENOENT);
+
+	if (prop->length % (3 * sizeof(u32)))
+		return ERR_PTR(-EINVAL);
+	sz = prop->length / (3 * sizeof(u32));
+
+	tunable = devm_kzalloc(dev,
+			       sizeof(*tunable) + sz * sizeof(*tunable->values),
+			       GFP_KERNEL);
+	if (!tunable)
+		return ERR_PTR(-ENOMEM);
+	tunable->sz = sz;
+
+	for (i = 0, p = NULL; i < tunable->sz; ++i) {
+		p = of_prop_next_u32(prop, p, &tunable->values[i].offset);
+		p = of_prop_next_u32(prop, p, &tunable->values[i].mask);
+		p = of_prop_next_u32(prop, p, &tunable->values[i].value);
+	}
+
+	return tunable;
+}
+EXPORT_SYMBOL(devm_apple_tunable_parse);
+
+void apple_tunable_apply(void __iomem *regs, struct apple_tunable *tunable)
+{
+	size_t i;
+
+	for (i = 0; i < tunable->sz; ++i) {
+		u32 val, old_val;
+
+		val = old_val = readl_relaxed(regs + tunable->values[i].offset);
+		val &= ~tunable->values[i].mask;
+		val |= tunable->values[i].value;
+		if (val != old_val)
+			writel_relaxed(val, regs + tunable->values[i].offset);
+	}
+}
+EXPORT_SYMBOL(apple_tunable_apply);
+
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_AUTHOR("Sven Peter <sven@kernel.org>");
+MODULE_DESCRIPTION("Apple Silicon hardware tunable support");
diff --git a/include/linux/soc/apple/tunable.h b/include/linux/soc/apple/tunable.h
new file mode 100644
index 0000000000000000000000000000000000000000..7e74e81b32e56c9a8ce94cb64bb340b007bac8da
--- /dev/null
+++ b/include/linux/soc/apple/tunable.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Apple Silicon hardware tunable support
+ *
+ * Each tunable is a list with each entry containing a offset into the MMIO
+ * region, a mask of bits to be cleared and a set of bits to be set. These
+ * tunables are passed along by the previous boot stages and vary from device
+ * to device such that they cannot be hardcoded in the individual drivers.
+ *
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#ifndef _LINUX_SOC_APPLE_TUNABLE_H_
+#define _LINUX_SOC_APPLE_TUNABLE_H_
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+/**
+ * Struct to store an Apple Silicon hardware tunable.
+ *
+ * Each tunable is a list with each entry containing a offset into the MMIO
+ * region, a mask of bits to be cleared and a set of bits to be set. These
+ * tunables are passed along by the previous boot stages and vary from device
+ * to device such that they cannot be hardcoded in the individual drivers.
+ *
+ * @param sz Number of [offset, mask, value] tuples stored in values.
+ * @param values [offset, mask, value] array.
+ */
+struct apple_tunable {
+	size_t sz;
+	struct {
+		u32 offset;
+		u32 mask;
+		u32 value;
+	} values[] __counted_by(sz);
+};
+
+/**
+ * Parse an array of hardware tunables from the device tree.
+ *
+ * @dev: Device node used for devm_kzalloc internally.
+ * @np: Device node which contains the tunable array.
+ * @name: Name of the device tree property which contains the tunables.
+ *
+ * @return: devres allocated struct on success or PTR_ERR on failure.
+ */
+struct apple_tunable *devm_apple_tunable_parse(struct device *dev,
+					       struct device_node *np,
+					       const char *name);
+
+/**
+ * Apply a previously loaded hardware tunable.
+ *
+ * @param regs: MMIO to which the tunable will be applied.
+ * @param tunable: Pointer to the tunable.
+ */
+void apple_tunable_apply(void __iomem *regs, struct apple_tunable *tunable);
+
+#endif

-- 
2.34.1



