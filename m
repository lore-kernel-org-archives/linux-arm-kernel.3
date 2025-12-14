Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192FBD5B16D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoDWglqkScO5HlItWaasov7CJUmSq0LaPJiWuWMCV/s=; b=dAQY8WlYAASL/p7qm8layHNCrT
	JToa4LcoUxdS2NbXnffNnrdvhf9Cn3jCsAmgyhM3QLGXoh0IIpGlF0mi4CCV9E0dzUND3aXfXFYgU
	AJMGTfjyHusI/cXLtRvwVdCj6/ZyJLc+4zpETgU6CdJFsHWXfgY7TFqVvEE/SEZaLqFrPaCjlMML2
	YMiAaCMT01EzzvsBSG+G/h8nLqSzyA6QNjRWnvxPYRBPCgwZz5v4YbycZwsi/PtFniWghscj+NCcW
	Wb0KQmSdF5eBkabLkdqaeO4xThuHo9O9DnarmZ62eDb3aFDsjt2vmGo9AM9Iv+2aMSviPcLcZyj3p
	HI5IvQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUkdq-00000002QVR-3sFV;
	Sun, 14 Dec 2025 11:51:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUkdo-00000002QU5-3HfW;
	Sun, 14 Dec 2025 11:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D61A460172;
	Sun, 14 Dec 2025 11:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C65CC4CEF5;
	Sun, 14 Dec 2025 11:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765713115;
	bh=3/FNvvvthqfqE8Hlk9y9M/lWMbT998+aR2jWJxRXnA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pBLhF4lGrIIxEaPTpF5axl9z18mJTDJ5LbOp9s9ZmhwWSUU0wpxWMqde28DVnY4Kq
	 hJBli3Bh4b1S4dgafbxlEFCdPoEr7UBarv6dNg2jCrT0FkHTsji5D8enx1haF8NC3h
	 ibbMo/RVVK3NgDmil9DATdrIbwtHhZN/jyeW2OFOSLv/hrHTpSN6dHfztckZzhF/lf
	 OFlCLpGgFKp8G3lFMQRYWxzML4ExfqMTgcHnEg9w7MZCaj8Hd/GCsyMPhi1Y5sZ+2v
	 uiqsGwemTrvlAJBlId1GDTqFgHkDcamYUoMs/UsIHios5C2+/AR8dkmOG+wDvx+l3C
	 2M3LDyU/PJDBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAADD59D99;
	Sun, 14 Dec 2025 11:51:55 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 14 Dec 2025 11:51:34 +0000
Subject: [PATCH v3 1/3] soc: apple: Add hardware tunable support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-b4-atcphy-v3-1-ba82b20e9459@kernel.org>
References: <20251214-b4-atcphy-v3-0-ba82b20e9459@kernel.org>
In-Reply-To: <20251214-b4-atcphy-v3-0-ba82b20e9459@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6699; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=3/FNvvvthqfqE8Hlk9y9M/lWMbT998+aR2jWJxRXnA4=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ6bdkqsHdm3OW9zuFiodtmbTRs25kevmCgms3P5hz1S59
 zalT/TMOkpZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATqYhjZDjlvZ7tVXdN5qM7
 79YX+n7zO3N3Wvwv86mH/C5ES4bOOurK8FfWSF6vjtn9svakK+xicso8p01ue3z6sXvBccbrCw9
 qT+IEAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/soc/apple/Kconfig         |  4 ++
 drivers/soc/apple/Makefile        |  3 ++
 drivers/soc/apple/tunable.c       | 80 +++++++++++++++++++++++++++++++++++++++
 include/linux/soc/apple/tunable.h | 62 ++++++++++++++++++++++++++++++
 4 files changed, 149 insertions(+)

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
index 0000000000000000000000000000000000000000..6593238391715be07cdfec0c1b116d6946f53fb5
--- /dev/null
+++ b/drivers/soc/apple/tunable.c
@@ -0,0 +1,80 @@
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
+#include <linux/overflow.h>
+#include <linux/soc/apple/tunable.h>
+
+struct apple_tunable *devm_apple_tunable_parse(struct device *dev,
+					       struct device_node *np,
+					       const char *name,
+					       struct resource *res)
+{
+	struct apple_tunable *tunable;
+	struct property *prop;
+	const __be32 *p;
+	size_t sz;
+	int i;
+
+	if (resource_size(res) < 4)
+		return ERR_PTR(-EINVAL);
+
+	prop = of_find_property(np, name, NULL);
+	if (!prop)
+		return ERR_PTR(-ENOENT);
+
+	if (prop->length % (3 * sizeof(u32)))
+		return ERR_PTR(-EINVAL);
+	sz = prop->length / (3 * sizeof(u32));
+
+	tunable = devm_kzalloc(dev, struct_size(tunable, values, sz), GFP_KERNEL);
+	if (!tunable)
+		return ERR_PTR(-ENOMEM);
+	tunable->sz = sz;
+
+	for (i = 0, p = NULL; i < tunable->sz; ++i) {
+		p = of_prop_next_u32(prop, p, &tunable->values[i].offset);
+		p = of_prop_next_u32(prop, p, &tunable->values[i].mask);
+		p = of_prop_next_u32(prop, p, &tunable->values[i].value);
+
+		/* Sanity checks to catch bugs in our bootloader */
+		if (tunable->values[i].offset % 4)
+			return ERR_PTR(-EINVAL);
+		if (tunable->values[i].offset > (resource_size(res) - 4))
+			return ERR_PTR(-EINVAL);
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
+		old_val = readl(regs + tunable->values[i].offset);
+		val = old_val & ~tunable->values[i].mask;
+		val |= tunable->values[i].value;
+		if (val != old_val)
+			writel(val, regs + tunable->values[i].offset);
+	}
+}
+EXPORT_SYMBOL(apple_tunable_apply);
+
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_AUTHOR("Sven Peter <sven@kernel.org>");
+MODULE_DESCRIPTION("Apple Silicon hardware tunable support");
diff --git a/include/linux/soc/apple/tunable.h b/include/linux/soc/apple/tunable.h
new file mode 100644
index 0000000000000000000000000000000000000000..531ca814cd02357a0c5de6f3acde805294c13d4a
--- /dev/null
+++ b/include/linux/soc/apple/tunable.h
@@ -0,0 +1,62 @@
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
+ * @res: Resource to which the tunables will be applied, used for bound checking
+ *
+ * @return: devres allocated struct on success or PTR_ERR on failure.
+ */
+struct apple_tunable *devm_apple_tunable_parse(struct device *dev,
+					       struct device_node *np,
+					       const char *name,
+					       struct resource *res);
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



