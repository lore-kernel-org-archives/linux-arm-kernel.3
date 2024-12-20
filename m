Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78620E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmwzVQdSamTI4Mm25hbiGBJIk1Q/esKMsBlmHYpUYHM=; b=Iv2BCDC8MQ2DMs0TrxOIHDA5Jo
	AYm/6oBnuJ4kDOP+lk7IOM6yrRC8pzMAm4iRB3uUO4YoLReKVDJfQZ6B6CuQwIaEOELZc1RG2Uq6X
	DDM+jfQQ7SJWctSfVnTy5K0lTUGygQKa0DfgtIaaeI1fTSBoKfBNTzRbrEPaHwju3izimwC5AKJsM
	gFkKEUPvbhP5nV75/N+8K1oWE7HqHT7rG8g9GHxmpkkmaZmL7ek9xTN7Ce8+Ei5gcrJ5J4oBj1yTf
	I4iQi1E4N7b+0zK7DmAn4C0H73Ukwv5ZCD1flt9h7cGkyy/QdyuSqZcE2J9v5KBXnx0eoheY4pJm7
	x+hf8OFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOde7-000000055pT-38Zt;
	Fri, 20 Dec 2024 14:06:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdOH-0000000536L-1o7g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:50:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so1333297f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 05:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702603; x=1735307403; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmwzVQdSamTI4Mm25hbiGBJIk1Q/esKMsBlmHYpUYHM=;
        b=Vk2oAGMF1tFiCTRCjdA8aalFq4InKqdMz8pNA8i2FwEFRy+QWQzDTpl0hH6P4Kc/N+
         1+AEip1d+Sh2uhx/+YGhZY3FjHoIKG4h7hA9WPcrk0mUrmRFpUmbCCSdfdz3JfjnRuG1
         aguflxDunTffdGchgAbeiPywDSJBmOvefGWBdTfyVgoUjj/uBhh/FMfnuReAkGuXzt7F
         oCeUKMLRFevGS87/kGPhcnQ3B6fGDz61o11DwWYZzIPU6JW/j5GnGLWgSF1t4p2cqOT7
         cCmKFrJXv9/8bmdR6GhnurAA3vXtvrlch3aJszkEDOdNme8V/lnnsmCxM+6083wOGeTw
         LzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702603; x=1735307403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmwzVQdSamTI4Mm25hbiGBJIk1Q/esKMsBlmHYpUYHM=;
        b=UtB/55CIjtiLQuA7J2z+BZGde5a6AUlJfenieGqfRIgbQC4q/aZKqFC4ssfSlN9dJM
         nREh83d9xcl5R7Rb1m8w+Jwrl2JsleDbNkPZr/s9Rall8w0ngx0/z1oGibMPPuW/vkJ9
         31fot54PKIgqi3CZqoazHAfC73FhkHVkxEU+m18Z1Q0YiZCgZEWxVnXtshUWP0+Norz1
         rcfjEHWaqNJDzcubw32uLKzj1LcNe2Q8iIr/UTI9+mqb0K0hNkdz/2O2mmRgR6msKFn2
         RI/pS6ClVp/vGZhN/tAq4s61l5UQF4lx27wrgpfl/2CIC7YztkPGuZiZ5IOSAb+wjxHc
         3BXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJWs7ZxVydqZlZw3EVwZ3Kga1lJZs6+W/6oLadYLOQuJuUAHKe/y2yhv+t2mlc+fZ1/kReT2zO0F8vv00UXG+P@lists.infradead.org
X-Gm-Message-State: AOJu0YxVWdmOM+3n1MFcTfwwaMCGZ9WLeMtl09H2ITb4p35MbRxf/Fy8
	Isw7gUccNLF1BVJ8CMVUBpxnGz9XLf56RrE9t1gXeRjZNq2mupahDQ64WemyQUAq+i5WCMzaQII
	dg4k=
X-Gm-Gg: ASbGncsonfhCfQAkKTbmctgQbxqxW/E/xEO5qf/wvXgnYHAGs6JU/Ool36en6b1lKL5
	efmo7fT6uy9q+YcOcrgPTvmTXI9iv2P5AVG+gjRUohpCWnjmS0XdwqGnoQ+4svvd9lEMj8LZMO6
	ezAtORbFD4C0ew7NiMMVtB7pxIN8ZNYisdVTIFSDVL0sEAfTAylOYiEd4oPODCQ0Ljl8xCWclJY
	f3T0BfGu5omqiC4dBb+H+y/se+Za4Fiv4bZm65eLKC6t9uhtvl7PgE4MJoJ27mUQKky3lIqP5o9
	BlxrMgJbPX+Zuay+EiNNyDnau82yFG67mOu/
X-Google-Smtp-Source: AGHT+IG4yktd0Nvj4jp85019vCB0iMT9S1j+gDh88vOL8Wge+kTTESou7askbSNFyaZ7Gt6ZtnOLAg==
X-Received: by 2002:a05:6000:1acd:b0:386:3c2f:a3e7 with SMTP id ffacd0b85a97d-38a1a1f7298mr6356413f8f.3.1734702603348;
        Fri, 20 Dec 2024 05:50:03 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm4044313f8f.30.2024.12.20.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:50:02 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 13:49:59 +0000
Subject: [PATCH v6 4/5] mailbox: add Samsung Exynos driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-acpm-v4-upstream-mbox-v6-4-a6942806e52a@linaro.org>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734702598; l=7455;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=8V4hRjvTjS/OPHho+b5gFECG0twWFwovkcgrCiubsOw=;
 b=aFSKkY8CH0jktsAVfeCjhnjjDoAFx4ULnLvakRK6H6Z+77IEJyqtRBaxSWah93ELQ7I8E4wWw
 nM/5nv7SeA+A0J15n+UpbuzK9zJ4psVXCTpXcGxYoVWX9ALZbNSHk2w
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_055005_475394_5DCCB4CA 
X-CRM114-Status: GOOD (  24.61  )
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

The Samsung Exynos mailbox controller, used on Google GS101 SoC, has 16
flag bits for hardware interrupt generation and a shared register for
passing mailbox messages. When the controller is used by the
ACPM protocol the shared register is ignored and the mailbox controller
acts as a doorbell. The controller just raises the interrupt to APM
after the ACPM protocol has written the message to SRAM.

Add support for the Samsung Exynos mailbox controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mailbox/Kconfig          |  11 +++
 drivers/mailbox/Makefile         |   2 +
 drivers/mailbox/exynos-mailbox.c | 174 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 8ecba7fb999e..44b808c4d97f 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -36,6 +36,17 @@ config ARM_MHU_V3
 	  that provides different means of transports: supported extensions
 	  will be discovered and possibly managed at probe-time.
 
+config EXYNOS_MBOX
+	tristate "Exynos Mailbox"
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	help
+	  Say Y here if you want to build the Samsung Exynos Mailbox controller
+	  driver. The controller has 16 flag bits for hardware interrupt
+	  generation and a shared register for passing mailbox messages.
+	  When the controller is used by the ACPM protocol the shared register
+	  is ignored and the mailbox controller acts as a doorbell that raises
+	  the interrupt to the ACPM firmware.
+
 config IMX_MBOX
 	tristate "i.MX Mailbox"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 5f4f5b0ce2cc..86192b5c7c32 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -11,6 +11,8 @@ obj-$(CONFIG_ARM_MHU_V2)	+= arm_mhuv2.o
 
 obj-$(CONFIG_ARM_MHU_V3)	+= arm_mhuv3.o
 
+obj-$(CONFIG_EXYNOS_MBOX)	+= exynos-mailbox.o
+
 obj-$(CONFIG_IMX_MBOX)	+= imx-mailbox.o
 
 obj-$(CONFIG_ARMADA_37XX_RWTM_MBOX)	+= armada-37xx-rwtm-mailbox.o
diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
new file mode 100644
index 000000000000..07bbc6b442ef
--- /dev/null
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+
+#include <dt-bindings/mailbox/google,gs101.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define EXYNOS_MBOX_MCUCTRL		0x0	/* Mailbox Control Register */
+#define EXYNOS_MBOX_INTCR0		0x24	/* Interrupt Clear Register 0 */
+#define EXYNOS_MBOX_INTMR0		0x28	/* Interrupt Mask Register 0 */
+#define EXYNOS_MBOX_INTSR0		0x2c	/* Interrupt Status Register 0 */
+#define EXYNOS_MBOX_INTMSR0		0x30	/* Interrupt Mask Status Register 0 */
+#define EXYNOS_MBOX_INTGR1		0x40	/* Interrupt Generation Register 1 */
+#define EXYNOS_MBOX_INTMR1		0x48	/* Interrupt Mask Register 1 */
+#define EXYNOS_MBOX_INTSR1		0x4c	/* Interrupt Status Register 1 */
+#define EXYNOS_MBOX_INTMSR1		0x50	/* Interrupt Mask Status Register 1 */
+
+#define EXYNOS_MBOX_INTMR0_MASK		GENMASK(15, 0)
+#define EXYNOS_MBOX_INTGR1_MASK		GENMASK(15, 0)
+
+#define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
+
+enum {
+	EXYNOS_MBOX_CELL_ID,
+	EXYNOS_MBOX_CELL_TYPE,
+	EXYNOS_MBOX_CELLS
+};
+
+#define EXYNOS_MBOX_CELL_TYPE_COUNT	2
+
+/**
+ * struct exynos_mbox - driver's private data.
+ * @regs:	mailbox registers base address.
+ * @mbox:	pointer to the mailbox controller.
+ * @dev:	pointer to the mailbox device.
+ * @pclk:	pointer to the mailbox peripheral clock.
+ */
+struct exynos_mbox {
+	void __iomem *regs;
+	struct mbox_controller *mbox;
+	struct device *dev;
+	struct clk *pclk;
+};
+
+static inline int exynos_mbox_chan_index(struct mbox_chan *chan)
+{
+	return chan - chan->mbox->chans;
+}
+
+static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct exynos_mbox *exynos_mbox = dev_get_drvdata(chan->mbox->dev);
+	int index = exynos_mbox_chan_index(chan);
+
+	writel(BIT(index), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+
+	return 0;
+}
+
+static const struct mbox_chan_ops exynos_mbox_chan_ops = {
+	.send_data = exynos_mbox_send_data,
+};
+
+static struct mbox_chan *exynos_mbox_xlate(struct mbox_controller *mbox,
+					   const struct mbox_xlate_args *sp)
+{
+	u32 id, type;
+
+	if (sp->args_count != EXYNOS_MBOX_CELLS) {
+		dev_err(mbox->dev, "Invalid argument count %d\n",
+			sp->args_count);
+		return ERR_PTR(-EINVAL);
+	}
+
+	id = sp->args[EXYNOS_MBOX_CELL_ID];
+	if (id >= mbox->num_chans) {
+		dev_err(mbox->dev, "Invalid channel ID %d\n", id);
+		return ERR_PTR(-EINVAL);
+	}
+
+	type = sp->args[EXYNOS_MBOX_CELL_TYPE];
+	if (type >= EXYNOS_MBOX_CELL_TYPE_COUNT) {
+		dev_err(mbox->dev, "Invalid channel type %d\n", type);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (type == DATA) {
+		dev_err(mbox->dev, "DATA channel type [%d] not supported\n",
+			type);
+		return ERR_PTR(-EINVAL);
+	};
+
+	return &mbox->chans[id];
+}
+
+static const struct of_device_id exynos_mbox_match[] = {
+	{ .compatible = "google,gs101-mbox" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_mbox_match);
+
+static int exynos_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct exynos_mbox *exynos_mbox;
+	struct mbox_controller *mbox;
+	struct mbox_chan *chans;
+	int i;
+
+	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
+	if (!exynos_mbox)
+		return -ENOMEM;
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	chans = devm_kcalloc(dev, EXYNOS_MBOX_CHAN_COUNT, sizeof(*chans),
+			     GFP_KERNEL);
+	if (!chans)
+		return -ENOMEM;
+
+	exynos_mbox->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(exynos_mbox->regs))
+		return PTR_ERR(exynos_mbox->regs);
+
+	exynos_mbox->pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(exynos_mbox->pclk))
+		return dev_err_probe(dev, PTR_ERR(exynos_mbox->pclk),
+				     "Failed to enable clock.\n");
+
+	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
+	mbox->chans = chans;
+	mbox->dev = dev;
+	mbox->ops = &exynos_mbox_chan_ops;
+	mbox->xlate = exynos_mbox_xlate;
+
+	for (i = 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
+		chans[i].mbox = mbox;
+
+	exynos_mbox->dev = dev;
+	exynos_mbox->mbox = mbox;
+
+	platform_set_drvdata(pdev, exynos_mbox);
+
+	/* Mask out all interrupts. We support just polling channels for now. */
+	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+
+	return devm_mbox_controller_register(dev, mbox);
+}
+
+static struct platform_driver exynos_mbox_driver = {
+	.probe	= exynos_mbox_probe,
+	.driver	= {
+		.name = "exynos-acpm-mbox",
+		.of_match_table	= exynos_mbox_match,
+	},
+};
+module_platform_driver(exynos_mbox_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos mailbox driver");
+MODULE_LICENSE("GPL");

-- 
2.47.1.613.gc27f4b7a9f-goog


