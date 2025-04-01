Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AA2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=; b=PVM3fK4QJdMoirIGGOp4yaN/im
	UdK4+miP/56NJ6MrYsPRziMBHzVY0CYoOMa2Zf7zCaYMNySZH7DJniSnOFUNjQppVmfl7ApHD2z6B
	E5Hf68MJM+XtEC4Uh7RWYj77xG7B1CViD9agE4jtCmn7Z884btIR9FzIGsFk1+mBr+j9QEdCAR9VC
	pliUUSZ0vQ2Puhjyy26I4MLZp9U6y0kIgNt0zxB2m2z6Ow9SA4HXM00Q64anOrmloHjcv8NVqZVua
	IpX2/SgkTIQ4G7GB31bA9aOzpX2G56rGVBxJshU/VZfLFWa3wmH5s/Y27vfM1yrPWSd1cP1Pfyp8r
	T4L6ggbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdyu-00000003nBN-3y2f;
	Tue, 01 Apr 2025 15:56:52 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdoJ-00000003kwf-1q6e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:45:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4182605f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522354; x=1744127154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=lukTJjenXLqlMoP4vwdhDdHR/Lc+LjBXEcfH8i+NlJXRAGC9UMWqbrvUesK3Gm6S2m
         OiScUuDyHgxyLVStR/9IcZxkacPVE6GLYdiJnRuAtBxmoHZ5uJGv4JSw1tE7MXqtyasH
         VjP5DUbY77nkqeFlSHtJKsIzdJSuWdbXi12ETgubB1OC78AmxTbypnJ5OvUEHwtflik1
         DXI9hHk4aq2WScfghPOpIj+N2NH9USZIsVkqI9KWMAdW4GMq8td9VLHAjVX7LAxemLsg
         I7ROgFsMaff6uU21pK50TdPNCkotytjz73JuqiVMJTTqB2yUkahioqGF8UqC82QSjZ32
         bQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522354; x=1744127154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=tN7ErWZA2j2M2ADv6XQN4EbXgUUeErt02IxnjfMFg7sIvNlSaDsxZPVwQ+y23+Woy1
         ufKB51PcKO5x0ifrne8eExooA65XH3IkDnl1eRbPhUpzQ5pzJ7vPQF+zcKb1lw66pqQZ
         7FXVM1kuR2hykfQeA06YEKo0IOfgTxO/xj2AkF/h30hln/zxTTueERN72xfM91TAx5qC
         THaf3vNgw7z8JjCzfu0NAGJJx4mNVcqNhOq86lwDGC4HUoj9NRQqZLFCf3TVoasIDKtC
         tZFyYH4AGM8l7N9G6Blbq3pZ4PjeqkmSJ0hhIdBqGK/T7V66qXTBlahxgwdbxDux7TLx
         PgcA==
X-Forwarded-Encrypted: i=1; AJvYcCVAWBdQ3zsvINaTSaymmBzUOcKNZBzeYr/IJ873uvvxAxkF2MWcxglhkOGZN3b9uV5p+bIXqo0qO9THFFVJ6o1z@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf6jjVQJhC84A8aUCU8wRwPKyy/YG+dSosFh/XGGrFfLKAuQzq
	DFeNbL5gfiZA2d4CYSGPlWER7+z4zSZeZ7YDi36Mv4GT142sRZXg1BVKptAh
X-Gm-Gg: ASbGnctRx2jEuuGdP+ULv9VQqUP+nvhnzbwtCYvgYQ3OTvCp4CPfzlODgI+skvE9Ipi
	gJ0RsiwnmZu1rSYcujkVmX2f1LL01eCOjw4rEebQyLcNyrU10OCtuO6tSqXKNsx7Nd8KVLFa+m9
	e2Stl9jZmyQszSXnCwdcTl9m8sT0rKLiXMOb7ED9S6fmxnzBxnpQbjj+739ADm0IgN0Ufxb2QmS
	fhMjz70UIw73P6TxXyy4iCG4Hp9e4/5IVfGTOkM26LquEL/vmHiUdgXOaOuzm3RsnyTmh8TCS9v
	CaZWAeQNEaazgaMEd9oJgz+7b4ILIktnULbSGAMDOE3B5wBfD7MG50G8eI5YrP7+il/hulAHUDS
	XoDEJSeI=
X-Google-Smtp-Source: AGHT+IE2m9aQ7hxMdL1hcSCVBaAL9i81WJkbAFdNTU9OkqMxfa+QpMQqlgxt2/QmZqWboPf3GEwH7Q==
X-Received: by 2002:a5d:64cc:0:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39c1211de8dmr10794398f8f.51.1743522353458;
        Tue, 01 Apr 2025 08:45:53 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] bus: add driver for IMX AIPSTZ bridge
Date: Tue,  1 Apr 2025 11:44:01 -0400
Message-Id: <20250401154404.45932-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_084555_630075_78B21219 
X-CRM114-Status: GOOD (  24.49  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The secure AHB to IP Slave (AIPSTZ) bus bridge provides access control
configurations meant to restrict access to certain peripherals.
Some of the configurations include:

	1) Marking masters as trusted for R/W. Based on this
	(and the configuration of the accessed peripheral), the bridge
	may choose to abort the R/W transactions issued by certain
	masters.

	2) Allowing/disallowing write accesses to peripherals.

Add driver for this IP. Since there's currently no framework for
access controllers (and since there's currently no need for having
flexibility w.r.t the configurations) all this driver does is it
applies a relaxed, "default" configuration, in which all masters
are trusted for R/W.

Note that some instances of this IP (e.g: AIPSTZ5 on i.MX8MP) may be tied
to a power domain and may lose their configuration when the domain is
powered off. This is why the configuration has to be restored when the
domain is powered on.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/bus/Kconfig      |  6 +++
 drivers/bus/Makefile     |  1 +
 drivers/bus/imx-aipstz.c | 92 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 drivers/bus/imx-aipstz.c

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index ff669a8ccad9..fe7600283e70 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -87,6 +87,12 @@ config HISILICON_LPC
 	  Driver to enable I/O access to devices attached to the Low Pin
 	  Count bus on the HiSilicon Hip06/7 SoC.
 
+config IMX_AIPSTZ
+	tristate "Support for IMX Secure AHB to IP Slave bus (AIPSTZ) bridge"
+	depends on ARCH_MXC
+	help
+	  Enable support for IMX AIPSTZ bridge.
+
 config IMX_WEIM
 	bool "Freescale EIM DRIVER"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index cddd4984d6af..8e693fe8a03a 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_FSL_MC_BUS)	+= fsl-mc/
 
 obj-$(CONFIG_BT1_APB)		+= bt1-apb.o
 obj-$(CONFIG_BT1_AXI)		+= bt1-axi.o
+obj-$(CONFIG_IMX_AIPSTZ)	+= imx-aipstz.o
 obj-$(CONFIG_IMX_WEIM)		+= imx-weim.o
 obj-$(CONFIG_INTEL_IXP4XX_EB)	+= intel-ixp4xx-eb.o
 obj-$(CONFIG_MIPS_CDMM)		+= mips_cdmm.o
diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
new file mode 100644
index 000000000000..44db40dae71b
--- /dev/null
+++ b/drivers/bus/imx-aipstz.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#define IMX_AIPSTZ_MPR0 0x0
+
+struct imx_aipstz_config {
+	u32 mpr0;
+};
+
+static void imx_aipstz_apply_default(void __iomem *base,
+				     const struct imx_aipstz_config *default_cfg)
+{
+	writel(default_cfg->mpr0, base + IMX_AIPSTZ_MPR0);
+}
+
+static int imx_aipstz_probe(struct platform_device *pdev)
+{
+	const struct imx_aipstz_config *default_cfg;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(base))
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to get/ioremap AC memory\n");
+
+	default_cfg = of_device_get_match_data(&pdev->dev);
+
+	imx_aipstz_apply_default(base, default_cfg);
+
+	dev_set_drvdata(&pdev->dev, base);
+
+	pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
+
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static int imx_aipstz_runtime_resume(struct device *dev)
+{
+	const struct imx_aipstz_config *default_cfg;
+	void __iomem *base;
+
+	base = dev_get_drvdata(dev);
+	default_cfg = of_device_get_match_data(dev);
+
+	/* restore potentially lost configuration during domain power-off */
+	imx_aipstz_apply_default(base, default_cfg);
+
+	return 0;
+}
+
+static const struct dev_pm_ops imx_aipstz_pm_ops = {
+	RUNTIME_PM_OPS(NULL, imx_aipstz_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+/*
+ * following configuration is equivalent to:
+ *	masters 0-7 => trusted for R/W + use AHB's HPROT[1] to det. privilege
+ */
+static const struct imx_aipstz_config imx8mp_aipstz_default_cfg = {
+	.mpr0 = 0x77777777,
+};
+
+static const struct of_device_id imx_aipstz_of_ids[] = {
+	{ .compatible = "fsl,imx8mp-aipstz", .data = &imx8mp_aipstz_default_cfg },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, imx_aipstz_of_ids);
+
+static struct platform_driver imx_aipstz_of_driver = {
+	.probe = imx_aipstz_probe,
+	.driver = {
+		.name = "imx-aipstz",
+		.of_match_table = imx_aipstz_of_ids,
+		.pm = pm_ptr(&imx_aipstz_pm_ops),
+	},
+};
+module_platform_driver(imx_aipstz_of_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("IMX secure AHB to IP Slave bus (AIPSTZ) bridge driver");
+MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
-- 
2.34.1


