Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0237DC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQ9m9HGe9/qjs9gf28iHfA2/6NxUxjMKKdh6HhKymZg=; b=g0yZZbEljBjGb10dNhv88LIE6/
	p5rHt4aZpwaC2O6jMFEoDG70qCARL/rQUAlIzuBSMBBPyducNyS+xlZfHOZ0T1mjBMl/3juKWdVJj
	YTIGMICu4G0ifct4osyEIWua9cMiGEDBp3hvWg/arzqMvD8GY3fZ4fxekgz1mXmp3SqkZi+xFbV84
	5hb0gj2obTPT8TzWbNYer1hptPAIpwo65hQ4KuIG2MDuUEphEpkUsoMzkbHQRHeNgQwbPfIOALoOF
	aG+LWNSUhxGjzDkMntkZPpLFkBRgQo1O9qpgeQsSiBfCeYS9G8HX0X03vPCQj2N2OSLOt2CN0stPj
	Bqqbbh1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYek-00000006e7V-0dri;
	Fri, 21 Feb 2025 19:25:50 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYZ1-00000006d9t-313U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:19:57 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abb7a6ee2deso383502066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165594; x=1740770394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQ9m9HGe9/qjs9gf28iHfA2/6NxUxjMKKdh6HhKymZg=;
        b=dpUifGCZH6F9iXNicbEKc8irdCV/JPaudxUoA4yraTUrOhkfDrCtt7z0HSByLRzqPc
         Sscf++KwA5WswjWV2QHEwhNuyU3Tax462j0eLhIOXZbUWQ5o0BiewycaLE40mL+kHuTp
         VtwG67eSU3CUzI3NqkqOeJU/XyJmLIHb4CJrONTYVfoWy/FMVPJu1xzg/iVm05vOgnYN
         M/4C+l89yVTupjSGE4YNlqDr5RDrE/fIVnJnw0OQKhOPb7vulaPC9h5yIZ4syKuACr8p
         w3iQ2nguLWmcu6MhsN+MbcudJtvSK61w/FRTWMNEj3rXe1SI89pwVyZaO05yybuR4Gz9
         OuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165594; x=1740770394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQ9m9HGe9/qjs9gf28iHfA2/6NxUxjMKKdh6HhKymZg=;
        b=eFO15Wx3AjVa7VL2UcWwAgMyrm2AEkVpIQ8ZWJ08+2aThK5gNOdgBg7A+vjaeaa+b8
         cgmbg+qR4IeJSI8bE7zhGdBd5e6CF1y15SNNaJpXgNQnfQvSewm0Uie1LRIdzPz8FdTD
         UIm+PFm5MxbC/K5lJfhCNe0Esgvii3uKhIA+KuZvo0ISKAPyHYnpRLcWvl/JfDayxpqR
         q64XYbp7UUEQ18ZLqeMHlstPhlWHV+paEbPhaW/V5JDQFykBoQc/3z7DFubp3I6BWWeX
         CDw18zPwfEvXteMRP97QsvWPf3cw2UE1mcklKdgO9TczYKZiliJDAdkmbBbNxtPMKCIm
         T08A==
X-Forwarded-Encrypted: i=1; AJvYcCWg3T63RkKF1S0mMWbCTT6L9U74D0sGQiMIQ7Z9BNYduArUYjRr/1rjEqKsnYuMnJFiSYC479q9tA/Yz9X6X1nk@lists.infradead.org
X-Gm-Message-State: AOJu0YxQwu56y0ASLwV3fSR6Cl727KempMso6y2ZR3WP7VqDQZvE1GIU
	ggn3FmQnUggv14neM38whihp0wy2i/5/CBv0BNv9up8uH7YCAi2k
X-Gm-Gg: ASbGncvGN/9H6W2M2y3ODZdxx1vOgty8dqRKFO42SA9ADK/NDPgCgB9rbaJNa02WCTy
	HvIM82AnU9bjgCRUDTKq/7o+FHY/4KIBGQ95fBB55cEme9tnATqGG8ITKSzb7n7lADkz9iygonh
	VTPLBOCwuKx4tl/doeB7qJxtHz12HwLd2dpAvg7D3Lx/Yo8DduGOoL3XAJwb9QlhF1xbhpayLhF
	GbOcnaIJyv0f9WoZ/K7ii5OJKxblCCi0DC+h4A1/JYfey4GIomig3IFxntcN03MKauMc/he+fJz
	RZenBmLpPyXcPxux16xieG7Y+LWAajjf7w2Np6C0wKrrAHUCYAq24EliY8A=
X-Google-Smtp-Source: AGHT+IE3CwqgwPcD60DkN7R6068FIpprPZitsT+PIQCgtbOY0Zrq/F8xkAzZ5w5gvOhKLrjtzpX6hg==
X-Received: by 2002:a17:906:794e:b0:abb:d9c6:ecb2 with SMTP id a640c23a62f3a-abc09aa9b80mr441416066b.21.1740165593802;
        Fri, 21 Feb 2025 11:19:53 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:53 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] bus: add driver for IMX AIPSTZ bridge
Date: Fri, 21 Feb 2025 14:19:07 -0500
Message-Id: <20250221191909.31874-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_111955_760700_C8DFA8EE 
X-CRM114-Status: GOOD (  23.78  )
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

Note that some instances of this IP may be tied to a power domain and may
lose their configuration when the domain is powered off. This is why the
configuration has to be restored when the domain is powered on.

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
index 000000000000..75696eac8ba2
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
+	void __iomem *base;
+	const struct imx_aipstz_config *default_cfg;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(base))
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to get/ioremap memory\n");
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
+	void __iomem *base;
+	const struct imx_aipstz_config *default_cfg;
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


