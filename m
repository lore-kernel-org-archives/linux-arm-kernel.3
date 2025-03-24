Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D73C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dkHLVtiZRGLb+v1unC8oKgvdUemVJjrLv1sSsCEAtg=; b=iSrl/x3UNMFDDIyV+a3wtBwn33
	mbHTdyf222e1TW2/7UA24+L6hUgvab+pmBvGTdN+iZf1aftderKjcslNwegHbStdJfQoQbwML8Th8
	IEDJo3QnPuJ8244QIX871NDSOgVo8sIaG2d3Bnj2L8U+8iYSG5sfmBqh0Kxsi4V/c53KG+TNlB0JS
	dAxwSJ+fw+h46O1N22UlWc3rYTcZlz0vAGmC7m2ujdOg65/1Jr1UMQ+n5cEKyIsJrqakp+P/EVMjI
	6HBxj2RPvZ+IOCTTRov078qbi2x2p5gH29jFrp5jtdzntw4IGWo3Krq1DAU9zaJxrwSd92kCUPlQt
	gyOMFInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkpq-00000003gBc-3hFw;
	Mon, 24 Mar 2025 16:39:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkgq-00000003eTQ-2WjA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:30:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso34766815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 09:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833815; x=1743438615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dkHLVtiZRGLb+v1unC8oKgvdUemVJjrLv1sSsCEAtg=;
        b=O9oUr6wbzkV6PKD3Lvl9PYWnp8Xqs8ZK2i/cgxT9nb+w/fx75r7Wg4IWJsRl4RT5PV
         vhXwahqKcDJZNPM+rNlbxn+nDn9QBo4k7lR04xOY9E8tJjqtn7psZNrMoQ1IJoWAtIPA
         UAK1BTQk2BUquVCwtCwK8JksuI6x0dYMkR0Lo5cFYxmG2RjkdGQAX1ANEaf0pT55bf4r
         tXLz2FDzi6TV740JdG+YUpiuTMwTyqP4WBrGYhIoOCO1Nmcm7pG3efLICqGukYqiy6du
         gS3vWARrVrMg4ENzdyiDe97CDgbIQDsIwuXrRS30xJtDuV1oF2dmxb03mHXDumttBJmS
         IBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833815; x=1743438615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dkHLVtiZRGLb+v1unC8oKgvdUemVJjrLv1sSsCEAtg=;
        b=A0vwG1/TkTzEE3LMZ0XbfpZtAGZ/DfsLWB8fwFZcb+3SOEk41qxFWy0EMrZyUyA+nO
         2HbFsxpxOJ7bjUkkjmFRv14fWm+PkfzFRMvXrSkIFEyKdmJO1itTTB66h4V0qzaKabkM
         gaQQ41cFzxPpluKM1j4mUXDdlBjxu8nqqUxgK01GdSRn7vt64r1ZTL7J/Rk8RA281bj4
         CRJ9vuVMahb736ylEuyJwqZ+C5rM8a5s0LRFdplSoBMObQ4Oic9U8SwJPMxSk057u8Q6
         kuQ2zCsePGhEPOAtbBV79fgszJFRFeC6lyfEL+acgiwMKdIBn4TwMi13SBqR2ae5Jlgp
         M4Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWXfEOCchVdnXst/yFGpvtQrfKjW7C/hEnDt9BafmyCIQNIJ5rIwYAmgYow09iWkG8UUI4V5bOEuEcf0oUQonWT@lists.infradead.org
X-Gm-Message-State: AOJu0YxUxV4lfrKpfCOgFmrINc0KZ18QroZgaIN3x6CEDaj/YnGbIzaT
	Kb1BV4C/Vh3r8yqRAt0PQR46R9zeTFB4mTLn0DidnwAFsWdSCLCD
X-Gm-Gg: ASbGncuElRnfzMrVrEQOek82HGoVXPPXy5TAyS399VUcYPh5ujhfung3LP3naKKzReL
	Ze43r5uIeTWlBfVCPejY2Fnl247P8df/Dw2H2imHsNQW9DyYDbF66ICwwFTUe/kpA+T59nnlip7
	vKbO4lYT65OlV98NeUMCvyQmamerGx3rf0RAwIi13Gdozyn0o2AUIWz44qW0ADIuMRlgp0IVdhg
	OTBOsciDCqBGoyWk7tERt5RqV/JXK1y0cA+ewNmH1BJOJOfdZoGAEBCyIQXgYytxr8XBsFEFvgr
	o7x1TyVwhqMAyBIPhM0Xz66eA8PFf8g3aAc5F/HSZjmlQ57ftjztSTTwH8kuXQL9bE3WtY4qgEl
	hbZoAYkw=
X-Google-Smtp-Source: AGHT+IH2+OEelK919FNU/gpPRx8fo5vdl1AROa4aq4iE0A/wWtsH8FX2Q56/X5JEk5OPq1wa3npreg==
X-Received: by 2002:a05:600c:1d15:b0:43d:677:3a8a with SMTP id 5b1f17b1804b1-43d509efa8cmr114128435e9.10.1742833814705;
        Mon, 24 Mar 2025 09:30:14 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:14 -0700 (PDT)
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
Subject: [PATCH v3 3/5] bus: add driver for IMX AIPSTZ bridge
Date: Mon, 24 Mar 2025 12:25:54 -0400
Message-Id: <20250324162556.30972-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_093016_642424_A0662A07 
X-CRM114-Status: GOOD (  24.15  )
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
index 000000000000..538ad89dba30
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
+	base = devm_platform_ioremap_resource_byname(pdev, "ac");
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


