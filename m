Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04B2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=; b=RMv8ThL+zWrIn7pRRQQe3oSxgE
	I+GqXJ/UEqmGYxgPA5oLJlIFRZzX7GLPxMLD0lVZf2qhWUrWr+dro6PavY7nCAYyFeIfeVj24nb38
	f5JLRB/Sg6C3IgH3PqpH9KixP8ZCzkssPO3gGvcsFCPFmI2sHJK9nrv80ZdrdsygC7rb3/W3xdgHU
	E6PmprFLiyj3TWYn/rNE6vzS1/H7P4YhM+JjQzWO9KaXMOi6VVUaKB++SiqkR7wMdLWYfYGNH5V+g
	V/OAUFNXNhxGdLLCnh3Ivy3KFJt3YZBjmS8GYJWYZHu3T8mQXqKSR4uPB6ZqhQjKvSO5eYT3GPt85
	Obnfs+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kNo-00000006cdg-43VU;
	Tue, 15 Apr 2025 17:47:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jy7-00000006Xp1-2RxG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:21:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso7607321f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737666; x=1745342466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=UF2dRoYiIdsn+j0O0RTluNrksqLD0yvcZufLlHQb6caqVALJxkjG75U9OM+ShSH3w3
         8yv34kO1Y2UITUxpDIlaJU7I3N8zijr6B5xXYkZ56/hY0qhjPdEg6pAYSmz5ajT/2CMx
         cHRQFj4Mflaikyc5qBKMhL58/0yc+7b6YeQ5Ff6hLVfhFsQZ4lYedbilWiJRNgJrX5y6
         HxpjU8x1JAOxYxzKhGJyx8AA0Yf0xVt2zXqbKrA9VpZ0fgCGa4V2KOQm9WPJuXWiCYte
         i7OZ4EFFUl+4+RWePMsKfqbz2Zf1luuK/NJ9Ol14ybCE4zbfbGUFv9G8qC0Gxpy2btaH
         l6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737666; x=1745342466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=EZsYMdE8T5lJ2CspZX1R0172OzRJf+XneZphGLxjnwBziH3DDI3smo7sDCEixJ8uUZ
         oE7lliSSxqt1f5BEZCmzx+xHo8ajRHMhyyJoC8IFi4xETOaIit3Vq81BJVrXsufD7IDw
         e/2t5y83vJsGOx8HGf/lrgbIfvkGaM+YVPI3mALsMjEAD4UpGnro8yBwFvEnorwW4aAq
         lMgvSZv1a9t3kdXj2vykjwitFlsliD2gvtGubhrBVDsPEe+sdhj/sF18eq+F30gt6uM2
         8SMwT890EVw+//85OLbBpWoai5xiyb8X7f/aAXODz0CkFQgoGhzNMligvUO2F3R23s4O
         13eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAB22OMN6RyIUOKXR2zlvjB6m3YUig9DyNl3qvkJ/cjTaYYJUx4Wt5KkqnI7qUtP4WJ3mZjosOmod+SaxrUJs2@lists.infradead.org
X-Gm-Message-State: AOJu0YwcfSyDjEFDXcdtac9spXp6vVhQErYAUd7FoVZCpO3rNmWt+rsk
	enJuROg+9u2OlDjxx51KHzL97c+fqzo9aUUWOQn9af6yDBv8McB2
X-Gm-Gg: ASbGncueKyeubX5sIUs+Jix2k5x5EvaD06sjjkdahqU066EoJ/LR5lBl9t2OM1nuBEk
	lyzzp8Trr3KtQtvV69OrmmwmW03Lq11hZ/g2k7A8EQmKW7ZfX1s00e5cSodUZUVu0bqHvbbDgXI
	a+WYdvzahNxStBOqAHgiMfNQYPtG54Z7LjCmiwfhfXoJB4c8vxSSUO8ePOuTR3N2Bf/IKYidkLw
	GjPk+obhPk25fUvSVnH0Yoh/4SS7oJceBsCFEyq1MORAX9/quN1Viz9qpgMERb5tzRjaouZtqzF
	kHY6566TIsiLTJzT1lDZCX5e97VZGi9NM95asvkHztCLZxnomAlWJnXUU2GmS003rpv9bMV7iPW
	4ePNqLcL+feT0uA==
X-Google-Smtp-Source: AGHT+IGluMtsFmqw+QbXEPUMGrf4Yg+XMsClLT/fyWCDWpKwYSIgHYsl2lHPQCscdBps9+U6EsmWUA==
X-Received: by 2002:a5d:64a7:0:b0:39e:cbf3:79db with SMTP id ffacd0b85a97d-39ee2737516mr306093f8f.10.1744737665614;
        Tue, 15 Apr 2025 10:21:05 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:05 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/6] bus: add driver for IMX AIPSTZ bridge
Date: Tue, 15 Apr 2025 13:19:16 -0400
Message-Id: <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_102107_623766_8997B1BC 
X-CRM114-Status: GOOD (  24.22  )
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


