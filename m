Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32E2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NvJrVWR2;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=I25/iaae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UppNpDYzZNIDxZtaFyLP0rWrh3H5U70UQJCj/sM0fJs=; b=NvJrVWR2uBvGr29iA4xLdVPZyj
	0CuEMvDZeRaANs5VDk7IHE9OY8iN0AuRHVGtohfYEhlxFC5Bag0LneNj0dsvBpYj7208NX+A6dVNG
	0sirQFkGcuUzDA1xNQg8lFFe1OBmbLeNremt6fLbFqfrx5wznscuAn3EqY2S19ZoCVYUgnzcnl7js
	DCsYcPe7ja3sL5+C99BailGHcSqSxt8tuR9Davjz8bZSQtWSTN48LjMsvZUQk9naiQyQhruY2W4um
	1LjJnITczWNYgaH/9pmaPfx5w/famkpachTMy6J9qStONHxR3Y+k+g3eJ9fPy8HBzfb+vSJnVtWDS
	BjJIqokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJahH-0000000Cc7B-3hS6;
	Wed, 21 Oct 2026 18:05:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJah9-0000000Cc1G-0sbd;
	Wed, 21 Oct 2026 18:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605943;
	bh=kraiM8Pt/yQrqMmIrjzsa2ShmhTLDzq0mUE/Ni1LxP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I25/iaae/O0gnK1k7AAnXQLI9BNEk+K1YXfKrAMvk6gwh6v7vv1znbLk2S/UJV8iN
	 jjPYNqSdYuS7yv4r9Eyqwz8xnS80SLq5QW6g5sx3q+Hp3aLJd2EfKuPD8IxyIgyeNM
	 Tt1yXA40HVImPFnJKy0Ju8+aS4ShzQLTK4Bnmjgf6/klrT30wyd4EAd+LJ5A49YDBL
	 SCY8MwaI1KKXb6ik8Tbu22L1Tw4wmUMMroS7cW2MMwTqVaj9hHZVgzvP0rhraXzZul
	 NVxXLSl5H+fGX7U9/o45tQy161VGgQBVA1Z0ep+MeRNVejgraukg+2wAs4yOwm7nbw
	 E9onOgWJM/X4A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1E2717E0912;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6517A480030; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:28 +0200
Subject: [PATCH v18 3/7] usb: dwc3: rockchip: introduce glue driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-3-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6223;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=kraiM8Pt/yQrqMmIrjzsa2ShmhTLDzq0mUE/Ni1LxP0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vdNC2Plhu6+pJ163dOvWrELQ1P3Mcd5Q
 mrO8Jni/sPQ4YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qaqMIP/2vt23K97NnEdwT12Z5E3mOiVfuFbKXpUtCy1HvW9ezFeZCQeKSGkB7XN+VZzhN/v+A
 VD/c/dY2dm+JEcSiEOANUCyGDnSEYfWN2JaXQgq8qDnhmOkwAcAScB0NaClPvK9PNdQaEfYnmjh
 I8Y8kO3AKx5gLCfohHZiK9DBGe8pWXivl4o4UfrCJ8nwpjlD7EQABHzk3xBNlXpBsW5KA/ok2GY
 lU7iS8bOkNxHPVpPYutONCQBiaROp6kzSzabZlIImnGk+TiG+LugrKXFVpu2tbFlrQw1loCl/GT
 WrHYOOSRtA+w0Vl5jtWA2MN289nR+A5WuCSO//I88jJdCzYPn1qI3xIH/nVwj9q2xru6qQFx7/o
 U2x4xL0KvGq/se7YFrPkB9u1D+vhLdfBDGYamjek8W6s6n4G5UJo9WrlWHTaPnOV71Ckdlnz/fI
 OOBOCafjAuQOf+D0wQBtn+LMzMjgsOnjtc9r4EqndOtXyI5d0z3EL6zIDohf83ZPcuConAdjj0S
 1uxuKneeKjELbetzNwyH5OM1Fae/8gJKphL0sUaf1QNJtnX637FggkZ/hCD8SdVx5C19Yxew9Bv
 0jKFs5dGaJdEUV7ybuh2H8nTVsckdh6ghVebRrYDvhE3gDOU0UBhpnOeSc/sh9Ee3E6TS8qNmGE
 AWINIGBQyf340qLLbs3U4Nw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_110547_423043_99582912 
X-CRM114-Status: GOOD (  22.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
For now this handles things identical to the default glue.

After this change the glue driver is mandatory for Rockchip RK3588 and
RK3576; it does not make sense to fallback to the core driver as the
whole purpose of the glue driver is fixing race conditions resulting in
SErrors and non-functional USB.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/Kconfig         |  11 ++++
 drivers/usb/dwc3/Makefile        |   1 +
 drivers/usb/dwc3/core.c          |  15 ++++++
 drivers/usb/dwc3/dwc3-rockchip.c | 106 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 18169727a413..3c120ea9746d 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -190,6 +190,17 @@ config USB_DWC3_OCTEON
 	  Only the host mode is currently supported.
 	  Say 'Y' or 'M' here if you have one such device.
 
+config USB_DWC3_ROCKCHIP
+	tristate "Rockchip DWC3 Platform Driver"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on OF
+	default USB_DWC3
+	help
+	  Rockchip SoCs with DesignWare Core USB3 IP inside,
+	  and IP Core configured for USB 2.0 and USB 3.0 in host
+	  or dual-role mode.
+	  Say 'Y' or 'M' if you have such device.
+
 config USB_DWC3_RTK
 	tristate "Realtek DWC3 Platform Driver"
 	depends on OF && ARCH_REALTEK
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index f37971197203..444e7e7f34b2 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_IMX)		+= dwc3-imx.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
+obj-$(CONFIG_USB_DWC3_ROCKCHIP)		+= dwc3-rockchip.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
 obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
 obj-$(CONFIG_USB_DWC3_GOOGLE)		+= dwc3-google.o
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..4b7132887a03 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2448,11 +2448,26 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 }
 EXPORT_SYMBOL_GPL(dwc3_core_probe);
 
+/*
+ * List of compatibles, which have "synopsys,dwc3" as a fallback
+ * compatible, but have a vendor specific glue driver that should
+ * be used instead of this one.
+ */
+static const char *const dwc3_compatible_blocklist[] = {
+	"rockchip,rk3588-dwc3",
+	"rockchip,rk3576-dwc3",
+};
+
 static int dwc3_probe(struct platform_device *pdev)
 {
 	struct dwc3_probe_data probe_data = {};
 	struct resource *res;
 	struct dwc3 *dwc;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dwc3_compatible_blocklist); i++)
+		if (device_is_compatible(&pdev->dev, dwc3_compatible_blocklist[i]))
+			return -ENODEV;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
new file mode 100644
index 000000000000..4129aefd6a8b
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026, Collabora Ltd. */
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include "glue.h"
+
+struct dwc3_rockchip {
+	struct dwc3		dwc;
+};
+
+static int dwc3_rockchip_probe(struct platform_device *pdev)
+{
+	struct dwc3_probe_data probe_data = {};
+	struct resource *res;
+	struct dwc3_rockchip *dwc_rk;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "missing memory resource\n");
+		return -ENODEV;
+	}
+
+	dwc_rk = devm_kzalloc(&pdev->dev, sizeof(*dwc_rk), GFP_KERNEL);
+	if (!dwc_rk)
+		return -ENOMEM;
+
+	dwc_rk->dwc.dev = &pdev->dev;
+	dwc_rk->dwc.glue_ops = NULL;
+
+	probe_data.dwc = &dwc_rk->dwc;
+	probe_data.res = res;
+	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+
+	return dwc3_core_probe(&probe_data);
+}
+
+static void dwc3_rockchip_remove(struct platform_device *pdev)
+{
+	dwc3_core_remove(platform_get_drvdata(pdev));
+}
+
+static int dwc3_rockchip_runtime_suspend(struct device *dev)
+{
+	return dwc3_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_runtime_resume(struct device *dev)
+{
+	return dwc3_runtime_resume(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_suspend(struct device *dev)
+{
+	return dwc3_pm_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_resume(struct device *dev)
+{
+	return dwc3_pm_resume(dev_get_drvdata(dev));
+}
+
+static void dwc3_rockchip_complete(struct device *dev)
+{
+	dwc3_pm_complete(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_prepare(struct device *dev)
+{
+	return dwc3_pm_prepare(dev_get_drvdata(dev));
+}
+
+static const struct dev_pm_ops dwc3_rockchip_dev_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(dwc3_rockchip_suspend, dwc3_rockchip_resume)
+	RUNTIME_PM_OPS(dwc3_rockchip_runtime_suspend, dwc3_rockchip_runtime_resume,
+		       dwc3_rockchip_runtime_idle)
+	.complete = pm_sleep_ptr(dwc3_rockchip_complete),
+	.prepare = pm_sleep_ptr(dwc3_rockchip_prepare),
+};
+
+static const struct of_device_id dwc3_rockchip_of_match[] = {
+	{ .compatible = "rockchip,rk3588-dwc3" },
+	{ .compatible = "rockchip,rk3576-dwc3" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dwc3_rockchip_of_match);
+
+static struct platform_driver dwc3_rockchip_driver = {
+	.probe		= dwc3_rockchip_probe,
+	.remove		= dwc3_rockchip_remove,
+	.driver		= {
+		.name	= "dwc3-rockchip",
+		.pm	= pm_ptr(&dwc3_rockchip_dev_pm_ops),
+		.of_match_table	= dwc3_rockchip_of_match,
+	},
+};
+
+module_platform_driver(dwc3_rockchip_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare DWC3 Rockchip Glue Driver");

-- 
2.53.0


