Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1989D43375
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 07:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HT68qZcuBxNkEdRr7/FSUYs50B01L2Hb2flNlXHqNHA=; b=wkct7TMeRNEvDGZa6WLZIHlsL+
	wuK1BAsbWfli5LMB6gmByygvGZEj3fV3PHF4ItKv0/nUegoSk1xcstZNgnrKyunAKx1v03zKORvEv
	D9dv3hv5/G70+/l3B7gdccAxI/XSn2NB994OcjehX3YOwwja3DwjSYi883rEWTPDU0WsGdcgqMiwx
	C0S8ERUdc6wf771vnmxL90KDy+8YEkkrLXQCsy9LD4TAsoS2uG8RFdz+yfrsspN6TBPd+AEMlBuDz
	PijN2ZBiG2A1fQQVtK88AZGadZYLxE1GhzsMgOpESPVgyQuVHEMTvz2cAQaCdMC+b+Med528JtHhz
	9OWe9Ulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmd-00000000DLF-1Bk9;
	Fri, 12 Dec 2025 07:41:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmX-00000000DHH-2CQi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 07:41:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 116E44E41BA4;
	Fri, 12 Dec 2025 07:41:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5058606DF;
	Fri, 12 Dec 2025 07:41:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CCFE8103C8E01;
	Fri, 12 Dec 2025 08:41:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HT68qZcuBxNkEdRr7/FSUYs50B01L2Hb2flNlXHqNHA=;
	b=HQ98dWE4p9UxM9xEMuZKdz0nFBad1e5a3dvVR8RFihv7TsCVgw/FcVU/ErEkjlp1KXRHav
	TkO9KliLxT9V1JaiRfVGmfYp5hwRdiOsBy7NZQk59G/DjUieMsBWkj/zEpcxw5z3W3QXzR
	jZpIvzPPBNCObr5TF4s3bk1tW7gd83UqS+hNI0QOe84NhOBwgqbWlDtyPl1k2fMghy5z3v
	yf7MsfOyVr9lKAhEzbWxBYwmWeW6/aE3QlfSGPuLihB1Vq3MRAsphMyIZVxCKMCjWM4vTh
	JS5LiZz+p85pKb+wOL/dVS4iSHN9qHFTSEHTW103quWInqwDtbNeQSnWtNJP6g==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:08 +0100
Subject: [PATCH 5/8] mfd: aaeon: Add SRG-IMX8PL MCU driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-5-6bd65bc8ef12@bootlin.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_234141_832908_2D874705 
X-CRM114-Status: GOOD (  19.64  )
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

Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8PL
embedded controller. This driver provides the core I2C communication
interface and registers child devices (GPIO and watchdog controllers).

The MCU firmware version is queried during probe and logged for
diagnostic purposes. All I2C transactions are serialized using a mutex
to ensure proper communication with the microcontroller.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 drivers/mfd/Kconfig           |  10 ++++
 drivers/mfd/aaeon-mcu.c       | 133 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/aaeon-mcu.h |  30 ++++++++++
 3 files changed, 173 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index aace5766b38aa5e46e32a8a7b42eea238159fbcf..9195115c7bcd619439cb9ff71d70e46629291867 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1574,6 +1574,16 @@ config AB8500_CORE
 	  the irq_chip parts for handling the Mixed Signal chip events.
 	  This chip embeds various other multimedia functionalities as well.
 
+config MFD_AAEON_MCU
+	tristate "Aaeon SRG-IMX8PL MCU Driver"
+	depends on I2C
+	select MFD_CORE
+	help
+	  Select this option to enable support for the Aaeon SRG-IMX8PL
+	  onboard microcontroller (MCU). This driver provides the core
+	  functionality to communicate with the MCU over I2C. The MCU
+	  provides various sub-devices including GPIO and watchdog controllers.
+
 config MFD_DB8500_PRCMU
 	bool "ST-Ericsson DB8500 Power Reset Control Management Unit"
 	depends on UX500_SOC_DB8500
diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
new file mode 100644
index 0000000000000000000000000000000000000000..472d44d5e8627f46806015599542753a5bda4526
--- /dev/null
+++ b/drivers/mfd/aaeon-mcu.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU MFD driver
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/aaeon-mcu.h>
+
+#define AAEON_MCU_GET_FW_VERSION 0x76
+
+static struct mfd_cell aaeon_mcu_devs[] = {
+	{
+		.name = "aaeon-mcu-wdt",
+		.of_compatible = "aaeon,srg-imx8pl-wdt",
+	},
+	{
+		.name = "aaeon-mcu-gpio",
+		.of_compatible = "aaeon,srg-imx8pl-gpio",
+	},
+};
+
+static int aaeon_mcu_print_fw_version(struct i2c_client *client)
+{
+	u8 cmd[3], version[2];
+	int ret;
+
+	/* Major version number */
+	cmd[0] = AAEON_MCU_GET_FW_VERSION;
+	cmd[1] = 0x00;
+	cmd[2] = 0x00;
+
+	ret = aaeon_mcu_i2c_xfer(client, cmd, 3, &version[0], 1);
+	if (ret < 0)
+		return ret;
+
+	/* Minor version number */
+	cmd[0] = AAEON_MCU_GET_FW_VERSION;
+	cmd[1] = 0x01;
+	/* cmd[2] = 0x00; */
+
+	ret = aaeon_mcu_i2c_xfer(client, cmd, 3, &version[1], 1);
+	if (ret < 0)
+		return ret;
+
+	dev_info(&client->dev, "firmware version: v%d.%d\n",
+		 version[0], version[1]);
+
+	return 0;
+}
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
+	mcu->i2c_client = client;
+	mutex_init(&mcu->i2c_lock);
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
+int aaeon_mcu_i2c_xfer(struct i2c_client *client,
+		       const u8 *cmd, int cmd_len,
+		       u8 *rsp, int rsp_len)
+{
+	struct aaeon_mcu_dev *mcu = i2c_get_clientdata(client);
+	int ret;
+
+	mutex_lock(&mcu->i2c_lock);
+
+	ret = i2c_master_send(client, cmd, cmd_len);
+	if (ret < 0)
+		goto unlock;
+
+	ret = i2c_master_recv(client, rsp, rsp_len);
+	if (ret < 0)
+		goto unlock;
+
+	if (ret != rsp_len) {
+		dev_err(&client->dev,
+			"i2c recv count error (expected: %d, actual: %d)\n",
+			rsp_len, ret);
+		ret = -EIO;
+		goto unlock;
+	}
+
+	ret = 0;
+
+unlock:
+	mutex_unlock(&mcu->i2c_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(aaeon_mcu_i2c_xfer);
+
+static const struct of_device_id aaeon_mcu_of_match[] = {
+	{ .compatible = "aaeon,srg-imx8pl-mcu" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
+
+static struct i2c_driver aaeon_mcu_driver = {
+	.driver = {
+		.name = "aaeon_mcu",
+		.of_match_table = aaeon_mcu_of_match,
+	},
+	.probe = aaeon_mcu_probe,
+};
+
+module_i2c_driver(aaeon_mcu_driver);
+
+MODULE_DESCRIPTION("Aaeon MCU MFD Driver");
+MODULE_AUTHOR("Jérémie Dautheribes");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/aaeon-mcu.h b/include/linux/mfd/aaeon-mcu.h
new file mode 100644
index 0000000000000000000000000000000000000000..89632cb46bc6c9518755dc43afb87faa94acb6f5
--- /dev/null
+++ b/include/linux/mfd/aaeon-mcu.h
@@ -0,0 +1,30 @@
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
+/**
+ * struct aaeon_mcu_dev - Internal representation of the Aaeon MCU
+ * @dev: Pointer to kernel device structure
+ * @i2c_client: Pointer to the Aaeon MCU I2C client
+ * @i2c_lock: Mutex to serialize I2C bus access
+ */
+
+struct aaeon_mcu_dev {
+	struct device *dev;
+	struct i2c_client *i2c_client;
+	struct mutex i2c_lock;
+};
+
+int aaeon_mcu_i2c_xfer(struct i2c_client *client,
+		       const u8 *cmd, int cmd_len,
+		       u8 *rsp, int rsp_len);
+
+#endif /*  __LINUX_MFD_AAEON_MCU_H */

-- 
2.52.0


