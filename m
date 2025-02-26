Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C9CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aozAnWpbhCam5E6+6zNz06mhlqboVoG1Yv6qg/1M0vU=; b=qsECGNBLiop23qf7dig9iiLpj+
	Y2f84DVQLygD++ew9vde1R83HYw/zmIQZ5iGH5K7y5wSD7go68R5buymxGFQb73Xk/dmmtgnBNruA
	9hhesJmK3cmv3rlAZz0MGGgXBg2H42Umyy9zx2E5VwV4W0Q0X3/PksaS64rTfGZU0Q5rYzjBdQtbr
	wit+HYaXJ+jLcLCKS+Zua1fEyO+gRUgoQIG9CeAGbwxiv1XMeAPKVSMKkVColtNcZzejRCEKgnSJA
	dhtS0SSpbit3idQ9xc4E6y+ywqYDv/t38T+ovLRnxNC8aYK1u7R/m1KgoOCeXz7elDbXi2hH6kUN/
	5wDbQylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKs6-00000004dnz-0iBk;
	Wed, 26 Feb 2025 17:06:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKg0-00000004bJ5-0J9s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:54:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso292935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588866; x=1741193666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aozAnWpbhCam5E6+6zNz06mhlqboVoG1Yv6qg/1M0vU=;
        b=NmSNpsSc9dEOXM9rv8EjuO+if6KTZn8WhIGtAe1u5ALMcFmhL7CQE9UMSoS2jBiY5C
         fakY/hOwgulz3cCygxhWQo10EkIXxEHC6gDTRmthEwMFsMZQ1B6Q9oEYnBbiKGQawMrT
         GxYD3n/NhY/ZJ/9DTVt4rmjv02D9nZSvNtySXvsXL03ZLGM36u9GpDq3iwKrDoxbKypq
         2bgLeRdCVLm4XX8U5jihkYOrl7CJMCsu8cqdJxpxQIYjfHuv0juGUMO1zIVJHD6DmAd+
         UgCN6Te8SR5FLdDcTrUPaCowkG4520CQ2c+plLIj9OTsEADpsjoHp9O8pBize97+exLt
         BS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588866; x=1741193666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aozAnWpbhCam5E6+6zNz06mhlqboVoG1Yv6qg/1M0vU=;
        b=jy/LRV+GYdO5JVHXpPg6NNkbC9ySt7pozeMhWKRqIXAxg6KvBzxJbndqx+l3tTApxs
         n3r9Id89XU1Qg96voVohDth20Jly4Lu5pOZt/uyGCOyc2sUR4/x25rHHfLYOUl9091kj
         zsmZDCOeRLdIrxNigeT0jCd0zq3xPd4A98qPteNmyaGeRzwnn09qb1qzv+crKJCbPhaG
         Q4i5OVYHjnls9LxyUWUkGH7juPdZfKvIaUOYmw/I7T/dg4/rX93sK8ICi3vppfNis924
         BLYrtn6UORaSYkd4KVroS54ntZ9FKvE1THULC3zoQfBcoZGuVxWDoU4FdQ9ttg1EyXIQ
         P8Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXc1uJvOztLQ4ZTVFz/KdcTv9455V9FidIVVBBSY2G/Pi2X0x1T6TwKFiDlofjFqfuaG3tF8JaGXyh8OzGvoP7Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwCCbIzVIctaEr/F8f2SKm3KrTQWqY8YeIRshcBpOqENraD+zLa
	ez/Wj9ymQGCAg7PlYr4btazIs5ji43nbHuWdoVjMkkQvFNu8anBZ
X-Gm-Gg: ASbGncsXOhYsCx30+YDAQVCWSWUqNwADt2Ue8DJmxfrUDYiD5UopG4/U9mjDfVPJwm2
	KoYhsUCL/jzG9Zj/n/f7g1Gsmn95fu/kmOssg1DxIrNbm5VfxY/XdVYQu+cV8VJNIgN6rZyvTrZ
	XNVCCHNjHwteEDukmfDBK1AEwfaVUzbQv20Js3oN5rt71emBjc9P+NB1lFvhmz2qQlcKysjDidI
	nBeETvYVUGipBGmrJ6yC/FaqNmEwg4YcU2QiZjaEcXPuZQY5+L+hH5QoAxoDRVA0nTFmW5JJ57+
	JK6VsEVUpsGNnAsRO0zeWa1Hagab/ASDpmaeaahZKMLX/SjTGT4mxcMla9L6Px5o
X-Google-Smtp-Source: AGHT+IFACgAUKq5wmfKVcHjK35/otoDg213tSOtDa+s2dpYjWDl8G1TUQEQB59e49vjyaP8FtEj8dQ==
X-Received: by 2002:a05:600c:3548:b0:439:a138:1d with SMTP id 5b1f17b1804b1-439aebc2408mr158492005e9.22.1740588866434;
        Wed, 26 Feb 2025 08:54:26 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:26 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] bus: add driver for IMX AIPSTZ bridge
Date: Wed, 26 Feb 2025 11:53:12 -0500
Message-Id: <20250226165314.34205-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_085428_118337_DFBBA7FA 
X-CRM114-Status: GOOD (  23.69  )
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
index 000000000000..c90580da17a1
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


