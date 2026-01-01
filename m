Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F075FA3725
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 23:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCjHmqGF1DoicBpBrx8MW/PuZzy6yn0k87uRF3BxXZI=; b=TDRSnCCXRqtHhMjsfsKIY5u00m
	qsgWeIjgulLq6YBMP/uMbInsaIHg8yNQ1R27GOepKhn3fBO0DMPeAzrftqCGa/dHC9H0mUgUmnFBg
	64UfXHPr3KvyDfCs983aYB4vbRDtGrFWO7KAi/QJEX3apEgfug2JCcWQn13XInELIskWFRrymbKli
	uaV2bFKY5br9VSCWGVdKf6vSKqU1KyNcBErI79+hPYFoc4J4j/UtWnUHlq+Ud6B2fW1Gngh7evkIf
	gIjq1c8QunChchU60PIpHb4jKXjd8WJfx+CYJDEWS6AA3q/QAKL09vKu5sxJ0aMpXWetEbsvtuweV
	ycfWFBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbSXP-00000007eoY-1uGK;
	Thu, 01 Jan 2026 23:57:03 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbSXI-00000007enG-0ZKG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 23:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767311812; bh=bYFjwlPbd+Ih8tTrTGAVSqx5azwneW2bhRp0g+04pKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IShuFOpy1kEo3preA7Pt15odnQpEehB07OVIwRyaxrzU8QCwQ9DjbEHkgFeYBQz7L
	 AmTC16oi3i+YDDsAiZ+OKhzzyCb7T23nW8TjDeWNZpf2jV7qxje9wRem9GL2hVkETg
	 MhUcSPzisU/Ah3plOLpSE0mN6aGgH5G4sLhp3CUxmXQH/jb1wpTgW+NhommBzhiBg1
	 5t8BD2Sl6iiORjCGkOlXxgeoJsuRMlxvB2rDkbj935uxEPCfc4MgEB+K/TJpLhY86g
	 fDCGRRz6EzHXjONE2YzxRHwGHfjvvgw+U49mHNT6WkcKirSODNS5RKYjpDEQ0oMs6C
	 zMuBfp7kRbu8Q==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id ACC9B3E9B72;
	Thu,  1 Jan 2026 23:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767311812; bh=bYFjwlPbd+Ih8tTrTGAVSqx5azwneW2bhRp0g+04pKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IShuFOpy1kEo3preA7Pt15odnQpEehB07OVIwRyaxrzU8QCwQ9DjbEHkgFeYBQz7L
	 AmTC16oi3i+YDDsAiZ+OKhzzyCb7T23nW8TjDeWNZpf2jV7qxje9wRem9GL2hVkETg
	 MhUcSPzisU/Ah3plOLpSE0mN6aGgH5G4sLhp3CUxmXQH/jb1wpTgW+NhommBzhiBg1
	 5t8BD2Sl6iiORjCGkOlXxgeoJsuRMlxvB2rDkbj935uxEPCfc4MgEB+K/TJpLhY86g
	 fDCGRRz6EzHXjONE2YzxRHwGHfjvvgw+U49mHNT6WkcKirSODNS5RKYjpDEQ0oMs6C
	 zMuBfp7kRbu8Q==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 3FE2A3E9B74;
	Thu,  1 Jan 2026 23:56:52 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: nxp: Add a simple NXP LPC32xx socinfo driver
Date: Fri,  2 Jan 2026 01:56:47 +0200
Message-ID: <20260101235647.2411062-3-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101235647.2411062-1-vz@mleia.com>
References: <20260101235647.2411062-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260101_235652_723117_9DAAC783 
X-CRM114-Status: GOOD (  22.42  )
/bin/ln: failed to access 'reaver_cache/texts/20260101_235652_723117_9DAAC783': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_235652_723117_9DAAC783 
X-CRM114-Status: GOOD (  23.04  )
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

Add NXP LPC32xx specific driver to get unique SoC ID from System Control
Block registers and export it to userspace.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/soc/Kconfig           |   1 +
 drivers/soc/Makefile          |   1 +
 drivers/soc/nxp/Kconfig       |  16 +++++
 drivers/soc/nxp/Makefile      |   2 +
 drivers/soc/nxp/lpc32xx-soc.c | 114 ++++++++++++++++++++++++++++++++++
 5 files changed, 134 insertions(+)
 create mode 100644 drivers/soc/nxp/Kconfig
 create mode 100644 drivers/soc/nxp/Makefile
 create mode 100644 drivers/soc/nxp/lpc32xx-soc.c

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb80..c21b0d2f58fc 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -18,6 +18,7 @@ source "drivers/soc/loongson/Kconfig"
 source "drivers/soc/mediatek/Kconfig"
 source "drivers/soc/microchip/Kconfig"
 source "drivers/soc/nuvoton/Kconfig"
+source "drivers/soc/nxp/Kconfig"
 source "drivers/soc/pxa/Kconfig"
 source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 47a3925ff84c..a04c21a8a5a4 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -24,6 +24,7 @@ obj-y				+= loongson/
 obj-y				+= mediatek/
 obj-y				+= microchip/
 obj-y				+= nuvoton/
+obj-y				+= nxp/
 obj-y				+= pxa/
 obj-y				+= qcom/
 obj-y				+= renesas/
diff --git a/drivers/soc/nxp/Kconfig b/drivers/soc/nxp/Kconfig
new file mode 100644
index 000000000000..84be69272011
--- /dev/null
+++ b/drivers/soc/nxp/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+if ARCH_LPC32XX || COMPILE_TEST
+
+menu "NXP LPC32xx SoC drivers"
+
+config LPC32XX_SOCINFO
+	tristate "NXP LPC32xx SoC information driver"
+	default ARCH_LPC32XX
+	select SOC_BUS
+	help
+	  NXP LPC32xx specific driver to get unique SoC ID from SCB registers.
+
+endmenu
+
+endif
diff --git a/drivers/soc/nxp/Makefile b/drivers/soc/nxp/Makefile
new file mode 100644
index 000000000000..466fbf946dee
--- /dev/null
+++ b/drivers/soc/nxp/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_LPC32XX_SOCINFO) += lpc32xx-soc.o
diff --git a/drivers/soc/nxp/lpc32xx-soc.c b/drivers/soc/nxp/lpc32xx-soc.c
new file mode 100644
index 000000000000..06b10310da76
--- /dev/null
+++ b/drivers/soc/nxp/lpc32xx-soc.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Vladimir Zapolskiy <vz@mleia.com>
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/sys_soc.h>
+
+#define SERIAL_ID0	0x130
+
+static int lpc32xx_soc_probe(struct platform_device *pdev)
+{
+	struct soc_device_attribute *soc_dev_attr;
+	struct device *dev = &pdev->dev;
+	struct soc_device *soc_dev;
+	struct regmap *scb;
+	u32 serial_id[4];
+	int ret;
+
+	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
+	soc_dev_attr->family = "NXP LPC32xx";
+
+	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
+	if (ret)
+		return ret;
+
+	scb = syscon_regmap_lookup_by_compatible("nxp,lpc3220-scb");
+	if (!IS_ERR(scb)) {
+		/* Do not bail out on error, if SCB device tree node is found */
+		ret = regmap_bulk_read(scb, SERIAL_ID0, serial_id, 4);
+		if (ret)
+			return ret;
+
+		soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL,
+							     "%08x%08x%08x%08x",
+							     serial_id[3],
+							     serial_id[2],
+							     serial_id[1],
+							     serial_id[0]);
+		if (!soc_dev_attr->serial_number)
+			return -ENOMEM;
+	} else {
+		dev_info(dev, "failed to get SCB regmap: %ld\n", PTR_ERR(scb));
+	}
+
+	soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
+
+	platform_set_drvdata(pdev, soc_dev);
+
+	return 0;
+}
+
+static void lpc32xx_soc_remove(struct platform_device *pdev)
+{
+	struct soc_device *soc_dev = platform_get_drvdata(pdev);
+
+	soc_device_unregister(soc_dev);
+}
+
+static const struct of_device_id lpc32xx_soc[] = {
+	{ .compatible = "nxp,lpc3220", },
+	{ .compatible = "nxp,lpc3230", },
+	{ .compatible = "nxp,lpc3240", },
+	{ .compatible = "nxp,lpc3250", },
+	{ }
+};
+
+static struct platform_driver lpc32xx_soc_driver = {
+	.probe = lpc32xx_soc_probe,
+	.remove = lpc32xx_soc_remove,
+	.driver = {
+		.name = "lpc32xx-soc",
+		.of_match_table = lpc32xx_soc,
+	},
+};
+
+static int __init lpc32xx_soc_device_init(void)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	if (!of_match_node(lpc32xx_soc, of_root))
+		return 0;
+
+	ret = platform_driver_register(&lpc32xx_soc_driver);
+	if (ret) {
+		pr_info("Failed to register lpc32xx-soc platform driver: %d\n",
+			ret);
+		return ret;
+	}
+
+	pdev = platform_device_register_simple("lpc32xx-soc", -1, NULL, 0);
+	if (IS_ERR(pdev)) {
+		pr_info("Failed to register lpc32xx-soc platform device: %ld\n",
+			PTR_ERR(pdev));
+		platform_driver_unregister(&lpc32xx_soc_driver);
+		return PTR_ERR(pdev);
+	};
+
+	return 0;
+}
+device_initcall(lpc32xx_soc_device_init);
+
+MODULE_AUTHOR("Vladimir Zapolskiy <vz@mleia.com>");
+MODULE_DESCRIPTION("NXP LPC32xx SoC driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


