Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8855FE87847
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pGgY1AXtB3+/bquNYu0YC11KDwnMcvuAwORygeqiBw=; b=iL5pG/QWHRr9eWqgWlOh0V9j2o
	7Yk/DQHI+R7qelxAMLOnKM5/6AiemdrMWWX0R4d4QPddzR2DJgtlzBsGRAfs1Ej1wXQ/1/Maxay9D
	6AdHJ2xWSf4G5XaXwCRMjHEEseJOkdxoB2FZ6kWBGePi7Oy7srNqXTg5QYVx/5vWXU5FICFCZdQcl
	FNmDehc8UDmpcHcN9V1jHwwV3jznVy/KVi6lPGx10NyG7okugpAsyoXjFAYJ8Kl5FKpW0HdITWVjB
	VDb6D96q+39v5qwDVunZs+2whSFKPM+0uzF62Kz6zQK+eBgVrqP1+1OMJ/ga0pjtAvAxOM+R6icMz
	TNwIgFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ9u-00000006vpX-2wqc;
	Tue, 03 Feb 2026 16:21:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ9r-00000006vlf-0ZQf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:21:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ACBC44E423E2;
	Tue,  3 Feb 2026 16:21:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 82EDB60728;
	Tue,  3 Feb 2026 16:21:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C8D1119A88EE;
	Tue,  3 Feb 2026 17:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770135700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9pGgY1AXtB3+/bquNYu0YC11KDwnMcvuAwORygeqiBw=;
	b=uxO9zjj8jMKiToMR0RtzEMAGbfLVKejGFCB745ACtXJcDUoIHsk5rsTgizaWP87oBCvKkg
	P7dB0pswzHJ1W5QBmgQPDysnNGa/zr0Uf91W+/InwpufEqKWLHnoOi9smMLeF1n49Qrv2M
	tBbNZ+r1ZyUGTEm9qoZ1SNxBYzVulPIZYUyhR9rLoAj/RLC5+oCEFTg2fjHjUjvmvrVtqc
	aTzq89taMREwrore8krM0fCxXg9Nl2km7Y+IFMCLAXDSmbQ+FfpqDexJOiMU8b/tcNi2h+
	Nrrh9YRGzveHIsSjk4dGbKcXTI4iwTWlnhO4fUoeTY0GTZMqYU6l//D2cNIIkA==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 03 Feb 2026 17:21:12 +0100
Subject: [PATCH v3 3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260203-dev-b4-aaeon-mcu-driver-v3-3-0a19432076ac@bootlin.com>
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7217;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=YLJOuvpWZfrp0dIHbGdNR9H/BLU+eWxUoMWIYPVsD8Q=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpgiCH8PeiC/MuCitGeJjLtt0ymvN894AU9vs8y
 A+qsAhZcZGJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaYIghwAKCRCfwAsFcf4K
 7TdvC/9+XhVjfUkrB3MnoV8QRMPJXFjr7K+MU8oii9i0gy572WMLuruf1xU9jyuA/OPF812etmJ
 6WX3F6rWn3kubgfgvSVKVbVLlkake/j6+2xcFAH9w6JLBTwrLd4i3HeQboUdjjfE13BIc7d0IpF
 GDZtwq0/cZ1WZgX3fV/FWhj2AmWCaCtYAryWFhk7oIOIhLBpntJmGpDK5Ud6GNvmcTNvYD0PyRU
 vp2PxVMoxld96s87bnW44Mw4LyC+9iHwWRZh22HFoRwgdVgMg6VK7alxKMCm/6T5YtYGb74FoC/
 dRmUSHCZr1h6WbJxR6qUDZE3Dkvu63zfQw8iZ4GXvJ8A/iEkEdQ1a4H/WPo5GN/wlF4ipUGQoyv
 YqNVzm7OFo0jU4S5IBxcT+gzOX6PK3KapMyAl9FrMpcooWTrTZRAMBvZKlQxDQDy+E+edJjR4yU
 Si+NIpKq7KxePTfy0EHUix77TPpyWhdWR3G8E9b281VImfSEqHAnucv9QiRKsyReAFU90=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_082143_366820_3C766870 
X-CRM114-Status: GOOD (  22.67  )
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

Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8P
embedded controller. This driver provides the core I2C communication
interface and registers child devices (GPIO and watchdog controllers).

The MCU firmware version is queried during probe and logged for
diagnostic purposes. All I2C transactions are serialized using a mutex
to ensure proper communication with the microcontroller.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 MAINTAINERS                   |   2 +
 drivers/mfd/Kconfig           |  10 +++
 drivers/mfd/Makefile          |   2 +
 drivers/mfd/aaeon-mcu.c       | 137 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/aaeon-mcu.h |  20 ++++++
 5 files changed, 171 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea9d55f76f3509c7f6ba6d1bc86ca2e2e71aa954..f91b6a1826d04bef8a0f88221f6c8e8a3652cd77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -191,6 +191,8 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
 R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
+F:	drivers/mfd/aaeon-mcu.c
+F:	include/linux/mfd/aaeon-mcu.h
 
 AAEON UPBOARD FPGA MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index aace5766b38aa5e46e32a8a7b42eea238159fbcf..7a1ceedece899faad7a03a1fe7b1c91b72253c05 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1574,6 +1574,16 @@ config AB8500_CORE
 	  the irq_chip parts for handling the Mixed Signal chip events.
 	  This chip embeds various other multimedia functionalities as well.
 
+config MFD_AAEON_MCU
+	tristate "Aaeon SRG-IMX8P MCU Driver"
+	depends on I2C || COMPILE_TEST
+	select MFD_CORE
+	help
+	  Select this option to enable support for the Aaeon SRG-IMX8P
+	  onboard microcontroller (MCU). This driver provides the core
+	  functionality to communicate with the MCU over I2C. The MCU
+	  provides GPIO and watchdog functionality.
+
 config MFD_DB8500_PRCMU
 	bool "ST-Ericsson DB8500 Power Reset Control Management Unit"
 	depends on UX500_SOC_DB8500
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28afae975ac61d282b3b85af5440119..0bc3a10c787c55730131224fc1053fe35657dd71 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_AAEON_MCU)	+= aaeon-mcu.o
diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
new file mode 100644
index 0000000000000000000000000000000000000000..4f2420668106453549ab42888bbfd50363bdfc45
--- /dev/null
+++ b/drivers/mfd/aaeon-mcu.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU driver
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/mfd/core.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+#define AAEON_MCU_FW_VERSION	0x76
+
+/**
+ * struct aaeon_mcu_dev - Internal representation of the Aaeon MCU
+ * @dev: Pointer to kernel device structure
+ * @i2c_lock: Mutex to serialize I2C bus access
+ */
+struct aaeon_mcu_dev {
+	struct device *dev;
+	struct mutex i2c_lock;
+};
+
+static const struct mfd_cell aaeon_mcu_devs[] = {
+	{
+		.name = "aaeon-mcu-wdt",
+	},
+	{
+		.name = "aaeon-mcu-gpio",
+	},
+};
+
+static int aaeon_mcu_read_version(struct device *dev, u8 index, u8 *version)
+{
+	u8 cmd[3] = { AAEON_MCU_FW_VERSION, index, 0x00 };
+
+	return aaeon_mcu_i2c_xfer(dev, cmd, sizeof(cmd), version, sizeof(*version));
+}
+
+static int aaeon_mcu_print_fw_version(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	u8 major, minor;
+	int ret;
+
+	ret = aaeon_mcu_read_version(dev, 0x00, &major);
+	if (ret)
+		return ret;
+
+	ret = aaeon_mcu_read_version(dev, 0x01, &minor);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "firmware version: v%d.%d\n", major, minor);
+
+	return 0;
+}
+
+int aaeon_mcu_i2c_xfer(struct device *dev,
+		       const u8 *cmd, int cmd_len,
+		       u8 *rsp, int rsp_len)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct aaeon_mcu_dev *mcu = i2c_get_clientdata(client);
+	int ret;
+
+	guard(mutex)(&mcu->i2c_lock);
+
+	ret = i2c_master_send(client, cmd, cmd_len);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_master_recv(client, rsp, rsp_len);
+	if (ret < 0)
+		return ret;
+
+	if (ret != rsp_len) {
+		dev_err(dev,
+			"i2c recv count error (expected: %d, actual: %d)\n",
+			rsp_len, ret);
+		return -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(aaeon_mcu_i2c_xfer);
+
+static int aaeon_mcu_probe(struct i2c_client *client)
+{
+	struct aaeon_mcu_dev *mcu;
+	int ret;
+
+	mcu = devm_kzalloc(&client->dev, sizeof(*mcu), GFP_KERNEL);
+	if (!mcu)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, mcu);
+	mcu->dev = &client->dev;
+
+	ret = devm_mutex_init(&client->dev, &mcu->i2c_lock);
+	if (ret)
+		return ret;
+
+	ret = aaeon_mcu_print_fw_version(client);
+	if (ret) {
+		dev_err(&client->dev, "unable to read firmware version\n");
+		return ret;
+	}
+
+	return devm_mfd_add_devices(mcu->dev, PLATFORM_DEVID_NONE, aaeon_mcu_devs,
+				    ARRAY_SIZE(aaeon_mcu_devs), NULL, 0, NULL);
+}
+
+static const struct of_device_id aaeon_mcu_of_match[] = {
+	{ .compatible = "aaeon,srg-imx8p-mcu" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
+
+static struct i2c_driver aaeon_mcu_driver = {
+	.driver = {
+		.name = "aaeon_mcu",
+		.of_match_table = aaeon_mcu_of_match,
+	},
+	.probe = aaeon_mcu_probe,
+};
+module_i2c_driver(aaeon_mcu_driver);
+
+MODULE_DESCRIPTION("Aaeon MCU Driver");
+MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/aaeon-mcu.h b/include/linux/mfd/aaeon-mcu.h
new file mode 100644
index 0000000000000000000000000000000000000000..2e9f5f316f33b70c732faa850576cee596455dab
--- /dev/null
+++ b/include/linux/mfd/aaeon-mcu.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Aaeon MCU driver definitions
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#ifndef __LINUX_MFD_AAEON_MCU_H
+#define __LINUX_MFD_AAEON_MCU_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+int aaeon_mcu_i2c_xfer(struct device *dev,
+		       const u8 *cmd, int cmd_len,
+		       u8 *rsp, int rsp_len);
+
+#endif /*  __LINUX_MFD_AAEON_MCU_H */

-- 
2.52.0


