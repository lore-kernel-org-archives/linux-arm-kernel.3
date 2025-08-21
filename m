Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9394CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OzCbQvQjiE1jobblYoJbta+xq+evis9vcFR/bpUs3A=; b=h0di026JjkTTwoi4MPhKxcs8FE
	QvoF1O/5K2kP1PhGatQYdjts6Cq3Vopca8NeQ/HH0V2wSBgnOOQIgjXn+W02+o2bhFQlkdDQbJKpe
	xbs+f943SKRQUHoGarnP/xn5Ab9+EPcujQKRXrQtCi0NUpn9iZVl7ZIWPu/iVyzxmA5ABj7ubVIii
	osC0Ir1WlOc5yg11WIRwsNBrOlaI0rsZE3hIx+L2oI8s5PT6arsawfi3TtoptOCrXOcbsQ2fxXNfw
	wZsgZV/OrZHiNE39+JNOeDD6SBafSbSeDB6k3n3WNJhP0iWQAo1vC7/pWX4Uyup8G+379mS2QQHIh
	caJpcz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upF1k-00000000xjl-2rWY;
	Thu, 21 Aug 2025 23:49:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Oe-0000000HQe4-1Opn;
	Thu, 21 Aug 2025 15:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1OzCbQvQjiE1jobblYoJbta+xq+evis9vcFR/bpUs3A=; b=G/giWimGE1iRqP3jJVwBlRIh9g
	3lKXbk0rI91dZ8bCvlSyV+vQQKBaouwUODUDZWzolAKp+MXmoqCoawrsNrm908ZZdcHmhIXBZmCA7
	mrTWzHP7ks95cki3Q7zLGNeidpbo3F0ygBpZzzsGeTy9WFEhiN0wiEkQ+J7v2xYzvRO+wp3cpGWXM
	25l/F0UtDIUW81QbFCib29w015AO5HcLlLQPVHDzQ1wHHycNna/RnB5ip5ACmTUMiPRsNSGjT2LWN
	izh/79tsYV5+jEkp4p7MNYrBoI2WTfZQcPgVsoKlzleRYnljuynpv4iky9gdM5S/sRddOBAeytDWq
	jOngCOnQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Oa-00000000bK8-3kTW;
	Thu, 21 Aug 2025 15:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E49E841A1F;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 374A8C2BCC4;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790804;
	bh=vklN4/w2hbW7rNLgTYVlAI33wbeeVkY8FZwbhVtsJVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tAw+xFUduHWkahyOaAhbPExukBZjrLPXq92a1OoG0AUbsQgti7TToFv2d9ZOjC9nU
	 MpUpwBPyeExSw0QHPHHmmcDGR/hY+bXq9KAud+ulRNdRQnY30mADGuz0DvTnMMP8q0
	 /Iy5DSPakV5HwaR9Gv1rrAMPFjhQRm54fBPfZEWlCUU1qnluL2tkSuvXNBSSD+TRr1
	 ljA2+qKNofgRHGlUzso4/rg9937OCqIiXF2Q/muCRN5DW7O+dn4j/O603tNrVz7vbZ
	 GfrRWVe51j0ilOkrAxmyhr6KLNNxE+hslkkJVriFs9a138ljii+y7sIhTnDrVDzNWZ
	 3zcQL30PFMOtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28668CA0FE7;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:39:12 +0000
Subject: [PATCH RFC 20/22] soc: apple: Add hardware tunable support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-20-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6361; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=vklN4/w2hbW7rNLgTYVlAI33wbeeVkY8FZwbhVtsJVg=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy21PV4iZzXpfc0TPWYvT0/nIx9ueWn9s2MSiGzV+wq
 3PZic03OkpYGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATKb7CyPCkcbqJ7JuLEkmz
 GQsYm1WZ/gfP4DiiZfVrhvfthdsfbv/J8OP35dRP5QF28fv/v5s9keVIj4O/1YYbfVMs/nf/tnu
 9hAcA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_164009_445668_507E96EA 
X-CRM114-Status: GOOD (  20.59  )
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

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/soc/apple/Kconfig         |  4 ++
 drivers/soc/apple/Makefile        |  3 ++
 drivers/soc/apple/tunable.c       | 77 +++++++++++++++++++++++++++++++++++++++
 include/linux/soc/apple/tunable.h | 64 ++++++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+)

diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
index 6388cbe1e56b5a9d90acad3ee2377ed6ac0d207d..f266b70fd9620cc940dc685f7eb2972c21a361df 100644
--- a/drivers/soc/apple/Kconfig
+++ b/drivers/soc/apple/Kconfig
@@ -41,6 +41,10 @@ config APPLE_SART
 
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
index 0000000000000000000000000000000000000000..3d9d47b3861f6fea637a3c82f270e5d321b1a48e
--- /dev/null
+++ b/drivers/soc/apple/tunable.c
@@ -0,0 +1,77 @@
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
+int devm_apple_parse_tunable(struct device *dev, struct device_node *np,
+			     struct apple_tunable *tunable, const char *name)
+{
+	struct property *prop;
+	const __le32 *p = NULL;
+	int i;
+
+	prop = of_find_property(np, name, NULL);
+	if (!prop) {
+		dev_err(dev, "tunable %s not found\n", name);
+		return -ENOENT;
+	}
+
+	if (prop->length % (3 * sizeof(u32)))
+		return -EINVAL;
+
+	tunable->sz = prop->length / (3 * sizeof(u32));
+	tunable->values = devm_kcalloc(dev, tunable->sz,
+				       sizeof(*tunable->values), GFP_KERNEL);
+	if (!tunable->values) {
+		tunable->sz = 0;
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < tunable->sz; ++i) {
+		p = of_prop_next_u32(prop, p, &tunable->values[i].offset);
+		p = of_prop_next_u32(prop, p, &tunable->values[i].mask);
+		p = of_prop_next_u32(prop, p, &tunable->values[i].value);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(devm_apple_parse_tunable);
+
+void devm_apple_free_tunable(struct device *dev, struct apple_tunable *tunable)
+{
+	devm_kfree(dev, tunable->values);
+	tunable->sz = 0;
+}
+EXPORT_SYMBOL(devm_apple_free_tunable);
+
+void apple_apply_tunable(void __iomem *regs, struct apple_tunable *tunable)
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
+EXPORT_SYMBOL(apple_apply_tunable);
+
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
+MODULE_DESCRIPTION("Apple Silicon hardware tunable support");
diff --git a/include/linux/soc/apple/tunable.h b/include/linux/soc/apple/tunable.h
new file mode 100644
index 0000000000000000000000000000000000000000..4a149f0f210d0b4b9e17c213f0482e8fbe02355f
--- /dev/null
+++ b/include/linux/soc/apple/tunable.h
@@ -0,0 +1,64 @@
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
+/*
+ * Struct to store a Apple Silicon hardware tunable.
+ *
+ * sz: number of [offset, mask, value] tuples stored in values.
+ * values: array containing the hardware tunables.
+ */
+struct apple_tunable {
+	size_t sz;
+	struct {
+		u32 offset;
+		u32 mask;
+		u32 value;
+	} *values;
+};
+
+/*
+ * Parse an array of hardware tunables from the device tree.
+ *
+ * Return 0 on success, -ENOMEM if the allocation failed and -ENOENT if the
+ * tunable could not be found or was in an invalid format.
+ *
+ * dev: Device node used for devm_kzalloc internally.
+ * np: Device node which contains the tunable array.
+ * tunable: Pointer to where the parsed tunables will be stored.
+ * name: Name of the device tree property which contains the tunables.
+ */
+int devm_apple_parse_tunable(struct device *dev, struct device_node *np,
+			     struct apple_tunable *tunable, const char *name);
+
+/*
+ * Apply a previously loaded hardware tunable.
+ *
+ * regs: MMIO to which the tunable will be applied.
+ * tunable: Pointer to the tunable.
+ */
+void apple_apply_tunable(void __iomem *regs, struct apple_tunable *tunable);
+
+/*
+ * Manually frees a previous allocated tunable.
+ *
+ * dev: Device node used for devm_apple_parse_tunable
+ * tunable: Tunable allocaated by devm_apple_parse_tunable
+ */
+void devm_apple_free_tunable(struct device *dev, struct apple_tunable *tunable);
+
+#endif

-- 
2.34.1



