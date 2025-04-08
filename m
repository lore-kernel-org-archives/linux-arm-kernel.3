Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4EDC369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=; b=e7TfnAwbZm3Vwfv93JSyIjVkAp
	A4jBbU3YFq/K8ceeC3jU3QFBAhRorRu83C+rdfJl6OBvLYQzqefvFQOwZ6CRPFSxkohBJ8hKTMXEt
	1TEwQ0UKX4ArMYdm6fA+lwNHpBWLwuIDsDFoZjXeCJLl+XHg4nmlJn+q/NL73g0/1TRfIjc8hJlOt
	NE4Re1KRjLJRREbsT7mN+UpB1qM1gY9Tq+kchepPIUqrqEuXU6vKL2DwRugf865xEaxQ0ESKF3SSU
	3cmDTSJH5KdNNg/qQ6KfPf1edgDmxEy2EFspFRXBNV16ylzFzBtqdQI/Z8I5AoEXlDdmyZrVpowqV
	axDQJPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BDH-00000004gzJ-0pfn;
	Tue, 08 Apr 2025 15:50:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B6J-00000004fnq-1Ifz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:43:01 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3914a5def6bso3441084f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126977; x=1744731777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=Jv1yXdPeV1exnIu2D7xA3GyuerSpmwgeEHvT1JjJQvw1bGaYPRx1sl6I/sWCyBm243
         hCIqt3qeLaPessBF/YxJOikp+FHqD+KU6RyHmeCU92SzWylsJkAAMqfY0PyKzKvC/6CO
         YKsSGtefN7j00fRRbJQd2Z4iwkIRS54DB2YYImJqStVhDByQN7jQbukO2ffaVLjIn1PI
         Sq2+sZrcQHA8cGalCCCnjFDEFMd93CV8AEYK1NZfVJQR1qm8T5hpyxHgrhIDVN17ygbu
         YBVGt7HqY9LKuRqQEME9w3GwgaOeBKBAFAG+fawVHQUrNG9B+Ss8jdQOaFWe+iOAHcTT
         C3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126977; x=1744731777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=OjtfgdtqxjwVwmZET9SrkpeGWoSh4mmDMtie0Y5JX89kl57tADsx4OeJMOf00u4W8V
         YlWHM0l/UAfIKlUMVsuEoGp6OwRNXw+ciRJWbBbX9h8V3iKbXircsCoXGWwIy8ctDFi2
         qI3Mps1nW0kblGdMDXUJAoL2RRNgAFmZ+Z7Eed+DMMkCxD8VIOBZAeTlR8Ej++EdgwGB
         Av4QXiE/8awQ1vTgssJuBCHyp3dId12JLr/tfV+AXd9ChNtgcMGJ7wOdvjaD2pDCTbUQ
         tzEL1i41LQZ/wIFMG+drfMdEunLlPJK5oXtbbT7eFQfNL49rd24+XQ4W3QJRaOfxHi0c
         cAmw==
X-Forwarded-Encrypted: i=1; AJvYcCXUDQpYA8vzJAuxsg6cEcxa0IuI8jAmJfyUt9zllO+xeyNKL3zyetl1zXlNFK/C9cfawKNxIAI+C+S5rgK0YlNW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+HnGY2ZqJHBnSY0EOG21lsh2h1BSJGPDlQVtub9kFOnyV2pu/
	ooFDyvKK50fPFNt+7MoVNbT2KCwhxCuqHTR4AvGkxl0x+NkG7g8M
X-Gm-Gg: ASbGncs14OxkF9q7KBeymavPZ1gjTLNOqsODaci+AlrHvVShkB9f9KdJGJyeCPMbmh1
	XNWxXLc4xFOi7zHLjQb77yBTxdt20FhwsmpzEfnn//46aTf+63XaqSbkY/eNUAjJFyRZXKYKZSb
	4SqjR+zVOVwPIXOTbh7imRN/roxp53TZjTln6fxRa/lM0CY5176LDEgvIoAEcXNvBGnjowIZFze
	E8evSoY2MhycDJ95I56hLm7gyMdo2SshrrBbAIa7akpFRMimFpYze6qKp/+0jBX4NapVDI4T5Kd
	DZHEx/pQIxm0ci2/AtjVtAXISrVtCAiPCvBENz8APWVPesRsRNSQKKivb/bVJdJ8XSPsI/AwvIl
	mfFxOyxfL+Sy9dholXg==
X-Google-Smtp-Source: AGHT+IG0AMxcw+cd08RKS5cdUE5DuDrHXtBsG7uCqS+Lpu1Nku8qrLyC5cK51TsZmHFhPyplpfJWLw==
X-Received: by 2002:a05:6000:290a:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-39cba93cf03mr14625191f8f.52.1744126977343;
        Tue, 08 Apr 2025 08:42:57 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:56 -0700 (PDT)
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
Subject: [PATCH v5 3/6] bus: add driver for IMX AIPSTZ bridge
Date: Tue,  8 Apr 2025 11:42:33 -0400
Message-Id: <20250408154236.49421-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_084259_357182_A519EEB6 
X-CRM114-Status: GOOD (  24.03  )
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


