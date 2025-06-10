Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE971C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67VEu7Em6E5HQaJhzv+j8FH2Rkd50dtS2qYsocCeLKg=; b=fCeR8lXsvQnt2grpm2s0fLnQen
	GdWvuixuY8wSue+9yTwWsJBNuDgYc/ygONJ/JuE+ceMQX1nrQ80wQF7pxrspLTUD5DPaLm1hbGZI0
	TQlfGHh/7CQyd/2gLWC0Fc2Wi2XpKdJqove+DdlRAhIjqPWCKnaiomKIXbdc6DQ0VijGs3MxvxVBX
	j3ZGBUce7GA6xdzQTiQx9zLeNN2z8CVUa2FrH6b2ksdoIa/ALxLVjmxsbiacfxU9Annj+ZKiEx0Iy
	UUvk/jRvsHQqSVHbTIY9gI2Yq4WTTkoSAE+oAS+/A35rutPPVu2QcpgKE3wFmO6T4k+M8x8DUcVSh
	aL2k0RZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l2-00000008EVi-0WlG;
	Tue, 10 Jun 2025 22:47:52 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Qi-00000007P2g-0eY1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:02:29 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a51d552de4so3062190f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571347; x=1750176147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67VEu7Em6E5HQaJhzv+j8FH2Rkd50dtS2qYsocCeLKg=;
        b=NpaQ0Wl3aVC5h1c8ez/hcHuubotoINb8GM4k9Rr66g9ip56+hJTNshJ5hcia0yhWBE
         2/gmOcO3L1PHAp+cjUBfwkYYr3z8EoHQf8AWfUSCIbTRBMOHpbNkunmJ2/JZzOcelcY2
         9pzcZ3JBNhd7A4y2smtT2VJsibu17tONyxtXVr9q2ufBKyxjTWPfpis48VKlpgUijrBv
         J2+VVymu/OsKi3jJl/t1ROfh8xLjD3pcQf6f/+RAqkd7hO5f2JkhBShPln7eCIB/PtMt
         rPOpAtn8/hi49AZTFjs6BeMkoZ0ahmQK7XcSi1ZXtV+wqfUsJ5CXTcDS/H+tjr7IrH5b
         Sv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571347; x=1750176147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67VEu7Em6E5HQaJhzv+j8FH2Rkd50dtS2qYsocCeLKg=;
        b=Hb8PXml3kGhT1peYewuUx+iQF240zvBDKbaq3PNaDQHSSg6QhzOE/AX7Z/g+hVU3sJ
         RThngmFWxZ7BaUcuSPXHLlVWICIsHHQ6Zvssv3E5dc3ceoN/2rrRiiGN7JRkWNPoimya
         wfjUlH0FobxSwYJQwfKmtXceftN67dHVcAs2x4Dbby9j54reesm8NVqrPCOULYRmVB2W
         m4SC5mRzMWpFncPaSMypbnSNJE70WGzZFnOjWtHXehTfuUZwD4vZp9KdrcF/sj5B9rWk
         1SBo/eH4DewlnJ4LEuJL4CGxpoglniP4HASFrjBkq5n38cXiEs4QUe+d+0qhnNw8fvB7
         O/fw==
X-Forwarded-Encrypted: i=1; AJvYcCVec2kUeTuMtm2aZLsXAOuNukcNuK2esO7EQK+moLzKI2OH8s5R6f/WAxGaO3PBBzE10nRwlbrVmOOimKXY1Yhq@lists.infradead.org
X-Gm-Message-State: AOJu0YwP1+x6wU2QlVZo5KskarnNq2AqwjzIs2o8TFB8dS3dQtT8Bz73
	Nz3i6CwnkPtNFTccyfU8zpp3G6GbulK1KjwfM6mx5vSU1dovJ+c3WXS/
X-Gm-Gg: ASbGnctDI1c79BZLNeufXsKV9dSNyZXnBFf/4BerlxpOTIQzqyoTO9Y9n28Pfv/O+D9
	0GnAhre7/S5hgLxZAlIoYygUyTiAfbiVnbq5HRatBFignXtQsWXjbFRW6tCRRKcj0U1XNHt55tO
	O1rdCIorzkKaQb9sNuKyhaQRK5hhaw89LAaUGEnq+8QtK+iSnCtb5RoYFmwpWocxFRcv9CrzTeU
	zUYgfg6PKsBCipF/Rt28hp1R9+nRXO18arPcXt4X3z+1DhpCOuktr5fQlpZypFz7EsSpSyPnZHk
	FZOftpheMWWjwN244eZZuZmHXftdEiFteZdVEE3sFaQxrK6WcTFev4ZGcM4nEZl0SIFckXBByod
	0aUOksYmmudXXWjpMHOcj9ns=
X-Google-Smtp-Source: AGHT+IGHhW/p8zADhnFLJnKLHKJ98yUEXlzsMVwwzjxsFGqrs0N2We4X8hpm2okE6IPM60AODO77rw==
X-Received: by 2002:a05:6000:26d3:b0:3a5:2cb5:6429 with SMTP id ffacd0b85a97d-3a5319b5c98mr14820076f8f.43.1749571346552;
        Tue, 10 Jun 2025 09:02:26 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:26 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/6] bus: add driver for IMX AIPSTZ bridge
Date: Tue, 10 Jun 2025 12:01:49 -0400
Message-Id: <20250610160152.1113930-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_090228_197512_11737B7A 
X-CRM114-Status: GOOD (  24.79  )
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
 drivers/bus/imx-aipstz.c | 96 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
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
index 000000000000..6610251f41c7
--- /dev/null
+++ b/drivers/bus/imx-aipstz.c
@@ -0,0 +1,96 @@
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
+struct imx_aipstz_data {
+	void __iomem *base;
+	const struct imx_aipstz_config *default_cfg;
+};
+
+static void imx_aipstz_apply_default(struct imx_aipstz_data *data)
+{
+	writel(data->default_cfg->mpr0, data->base + IMX_AIPSTZ_MPR0);
+}
+
+static int imx_aipstz_probe(struct platform_device *pdev)
+{
+	struct imx_aipstz_data *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to allocate data memory\n");
+
+	data->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(data->base))
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to get/ioremap AC memory\n");
+
+	data->default_cfg = of_device_get_match_data(&pdev->dev);
+
+	imx_aipstz_apply_default(data);
+
+	dev_set_drvdata(&pdev->dev, data);
+
+	pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
+
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static int imx_aipstz_runtime_resume(struct device *dev)
+{
+	struct imx_aipstz_data *data = dev_get_drvdata(dev);
+
+	/* restore potentially lost configuration during domain power-off */
+	imx_aipstz_apply_default(data);
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


