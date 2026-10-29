Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA3C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qB72FkUH;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=j4WbG2NN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bsf5l6ud7rlUf7O2tF4L9HwoxLS2enNSti+p8OjI1b4=; b=qB72FkUHDo/mDq
	zf5n0k1RdAvrA1S+TNwuRfTfwiwm77MkAkUh1gVP6PRwz9Im0cgzraBDyLUaqAYxu9/hSd3T5B/WO
	wCqykFwWw7Gc0Yrj/Bj35bzH4PUu/o5O92qQxl03tTl5WIk14yyxX1Udv9BlJQIg0k+TUGv3Sikog
	V38qng83kmHInKOeXA+j7fS9G+e31BEKBzJays4lKo06Nkp39DAlvhM8vwH6nTXNPSfrLHcuyU03o
	oUsYg3CGJd2Mka3QFjSkLuZ6RLdHZmKiTzWXgloOUXJhguTbHFI+tjdDgMBLbPHE+g/Q3oz1aRCvK
	ezmg0H4f0jSEs9WVOOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRR9-00000009ZJL-01GK;
	Thu, 29 Oct 2026 14:49:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRQv-00000009ZB4-2Rrk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:48:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D9A4EC49F47;
	Thu, 29 Oct 2026 14:49:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7494B60360;
	Thu, 29 Oct 2026 14:48:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FEA3103290F8;
	Thu, 29 Oct 2026 15:48:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793285323; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bsf5l6ud7rlUf7O2tF4L9HwoxLS2enNSti+p8OjI1b4=;
	b=j4WbG2NNWV2gw4+u8jnW8y6vVh8NIOs27TljFa5tlce2/CWZJQW9PM8E2ODqm7LDHVJDWH
	9dy8qkcyY7l3ZoVUA+87P4JZhhw28SlnXok7V4daErwa2/JT2wLgWqEtAtOV94K06uMgQc
	C4Tk7XXbE74Dd0eo81a139MyxmjvJIRZ5wD8kLkbh658+kZSZVUJu8MvqCw+035DHZ45E+
	U9MQTUalfQHgfkjL5druaXmpfgJQjtDD0N0eqQvwJyorE3kj0mYD2cpwnsgdYhsMzAYc9t
	kVdd2ZD1XjKGjiJUgdqSiCrycabxFD7pmRrl3Gl73dfhOG2tqsIVN3hEKoGNCg==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Thu, 29 Oct 2026 15:48:22 +0100
Subject: [PATCH v9 2/4] mfd: aaeon: Add SRG-IMX8P MCU driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261029-dev-b4-aaeon-mcu-driver-v9-2-f9b6d0cc180d@bootlin.com>
References: <20261029-dev-b4-aaeon-mcu-driver-v9-0-f9b6d0cc180d@bootlin.com>
In-Reply-To: <20261029-dev-b4-aaeon-mcu-driver-v9-0-f9b6d0cc180d@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, mfd@lists.linux.dev, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_074849_975638_B0DE86BD 
X-CRM114-Status: GOOD (  32.76  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a driver for the Aaeon SRG-IMX8P embedded controller. This driver
provides the core I2C communication interface and registers child
devices (GPIO and watchdog controllers).

The driver implements a custom regmap bus over I2C to match the MCU's
fixed 3-byte command format [opcode, arg, value]. Register addresses
are encoded as 16-bit values (opcode << 8 | arg) using the
AAEON_MCU_REG() macro defined in the shared header. The regmap
instance is shared with child drivers via dev_get_regmap(). Concurrent
I2C accesses from child drivers are serialized by regmap's built-in
locking.

The MCU wants a STOP between a command and its response, so they are
two separate transfers. Both are issued under the I2C segment lock so
that no other transfer on the same I2C segment can land in between.

I2C transfers use heap-allocated DMA-safe buffers rather than
stack-allocated ones, as required by I2C controllers that perform DMA.

Regmap caching is enabled (REGCACHE_MAPLE) with a volatile_reg
callback that marks GPIO input read registers (opcode 0x72) and the
watchdog status register (opcode 0x63, arg 0x02) as volatile. All
other registers written by the driver (GPIO direction,
GPO state, watchdog control) are stable and can be safely cached.

Only those two kinds of registers are readable. Any other opcode is a
command, and the frame sent for a read is the same as the one used to
write it, so reading it, for instance through the regmap debugfs
registers file, would execute the command.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 MAINTAINERS                   |   2 +
 drivers/mfd/Kconfig           |  11 +++
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/aaeon-mcu.c       | 221 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/aaeon-mcu.h |  40 ++++++++
 5 files changed, 275 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f85e2a8b192..55fc12c283fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -192,6 +192,8 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
 R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
+F:	drivers/mfd/aaeon-mcu.c
+F:	include/linux/mfd/aaeon-mcu.h
 
 AAEON UPBOARD FPGA MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 87ed55c155f0..72bca7026cee 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1581,6 +1581,17 @@ config ABX500_CORE
 	  remain unchanged when IC changes. Binding of the functions to
 	  actual register access is done by the IC core driver.
 
+config MFD_AAEON_MCU
+	tristate "Aaeon SRG-IMX8P MCU Driver"
+	depends on I2C
+	select MFD_CORE
+	select REGMAP
+	help
+	  Select this option to enable support for the Aaeon SRG-IMX8P
+	  onboard microcontroller (MCU). This driver provides the core
+	  functionality to communicate with the MCU over I2C. The MCU
+	  provides GPIO and watchdog functionality.
+
 config AB8500_CORE
 	bool "ST-Ericsson AB8500 Mixed Signal Power Management chip"
 	depends on ABX500_CORE && MFD_DB8500_PRCMU
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index f8101d2a9ce9..166b25638f7f 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
 obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
+obj-$(CONFIG_MFD_AAEON_MCU)	+= aaeon-mcu.o
 obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
 obj-$(CONFIG_MFD_SM501)		+= sm501.o
 obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
new file mode 100644
index 000000000000..e7470023265d
--- /dev/null
+++ b/drivers/mfd/aaeon-mcu.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU driver
+ *
+ * Copyright (C) 2026 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/mfd/core.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+struct aaeon_mcu {
+	struct i2c_client *client;
+	u8 *cmd;      /* DMA-safe 3-byte write buffer [opcode, arg, value] */
+	u8 *response; /* DMA-safe 1-byte read buffer for MCU acknowledgment */
+};
+
+static const struct mfd_cell aaeon_mcu_devs[] = {
+	MFD_CELL_BASIC("aaeon-mcu-wdt", NULL, NULL, 0, 0),
+	MFD_CELL_BASIC("aaeon-mcu-gpio", NULL, NULL, 0, 0),
+};
+
+/* Number of bytes in a MCU command: [opcode, arg, value] */
+#define AAEON_MCU_CMD_LEN      3
+
+/*
+ * Custom regmap bus for the Aaeon MCU I2C protocol.
+ *
+ * The MCU uses a fixed 3-byte command format [opcode, arg, value] followed
+ * by a 1-byte response. It requires a STOP condition between the command
+ * write and the response read, so two separate transfers are issued. The
+ * I2C segment lock is held across both so that no other transfer on the
+ * same I2C segment can land between the command and its response. The
+ * regmap lock serialises concurrent accesses from the GPIO and watchdog
+ * child drivers.
+ *
+ * Register addresses are encoded as a 16-bit big-endian value where the
+ * high byte is the opcode and the low byte is the argument, matching the
+ * wire layout produced by regmap for reg_bits=16.
+ */
+
+/*
+ * Send the command held in mcu->cmd and read the 1-byte response into
+ * mcu->response. Both buffers are heap-allocated and thus DMA-safe.
+ */
+static int aaeon_mcu_xfer(struct aaeon_mcu *mcu)
+{
+	struct i2c_adapter *adap = mcu->client->adapter;
+	struct i2c_msg msg = {
+		.addr	= mcu->client->addr,
+		.flags	= I2C_M_DMA_SAFE,
+		.buf	= mcu->cmd,
+		.len	= AAEON_MCU_CMD_LEN,
+	};
+	int ret;
+
+	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
+
+	ret = __i2c_transfer(adap, &msg, 1);
+	if (ret == 1) {
+		msg.flags = I2C_M_RD | I2C_M_DMA_SAFE;
+		msg.buf   = mcu->response;
+		msg.len   = 1;
+		ret = __i2c_transfer(adap, &msg, 1);
+	}
+
+	i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
+
+	if (ret < 0)
+		return ret;
+
+	return ret == 1 ? 0 : -EIO;
+}
+
+static int aaeon_mcu_regmap_write(void *context, const void *data, size_t count)
+{
+	struct aaeon_mcu *mcu = context;
+
+	/*
+	 * use_single_write guarantees one register per call: a 2-byte
+	 * address followed by a 1-byte value.
+	 */
+	if (count != AAEON_MCU_CMD_LEN)
+		return -EINVAL;
+
+	memcpy(mcu->cmd, data, count);
+
+	/* The MCU always sends a response byte after each command; discard it. */
+	return aaeon_mcu_xfer(mcu);
+}
+
+static int aaeon_mcu_regmap_read(void *context, const void *reg_buf,
+				 size_t reg_size, void *val_buf, size_t val_size)
+{
+	struct aaeon_mcu *mcu = context;
+	int ret;
+
+	/*
+	 * reg_buf holds the 2-byte big-endian register address [opcode, arg].
+	 * Append a trailing 0x00 to form the full 3-byte MCU command.
+	 */
+	mcu->cmd[0] = ((u8 *)reg_buf)[0];
+	mcu->cmd[1] = ((u8 *)reg_buf)[1];
+	mcu->cmd[2] = 0x00;
+
+	ret = aaeon_mcu_xfer(mcu);
+	if (ret)
+		return ret;
+
+	/*
+	 * val_buf is owned by the regmap caller and is not necessarily
+	 * DMA-safe, so go through the driver's response buffer.
+	 * use_single_read guarantees val_size == 1.
+	 */
+	*(u8 *)val_buf = *mcu->response;
+
+	return 0;
+}
+
+static const struct regmap_bus aaeon_mcu_regmap_bus = {
+	.write = aaeon_mcu_regmap_write,
+	.read  = aaeon_mcu_regmap_read,
+};
+
+static bool aaeon_mcu_volatile_reg(struct device *dev, unsigned int reg)
+{
+	/*
+	 * GPIO input registers are driven by external signals and can change
+	 * at any time without CPU involvement, always read from hardware.
+	 *
+	 * The watchdog status register reflects hardware state and can change
+	 * autonomously.
+	 *
+	 * All other registers are written by the driver and their values are
+	 * stable, so they can be safely cached.
+	 */
+	if ((reg >> 8) == AAEON_MCU_READ_GPIO_OPCODE)
+		return true;
+	if (reg == AAEON_MCU_REG(AAEON_MCU_CONTROL_WDT_OPCODE, 0x02))
+		return true;
+	return false;
+}
+
+static bool aaeon_mcu_readable_reg(struct device *dev, unsigned int reg)
+{
+	/*
+	 * Every opcode but the GPIO input read and the watchdog status is a
+	 * command: the frame sent for a read is identical to the one used to
+	 * write it, so reading such a register would execute the command.
+	 * Only the registers reflecting hardware state may be read.
+	 */
+	return aaeon_mcu_volatile_reg(dev, reg);
+}
+
+static const struct regmap_config aaeon_mcu_regmap_config = {
+	.reg_bits          = 16,
+	.val_bits          = 8,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.max_register      = AAEON_MCU_MAX_REGISTER,
+	.readable_reg      = aaeon_mcu_readable_reg,
+	.volatile_reg      = aaeon_mcu_volatile_reg,
+	.cache_type        = REGCACHE_MAPLE,
+	.use_single_write  = true,
+	.use_single_read   = true,
+};
+
+static int aaeon_mcu_probe(struct i2c_client *client)
+{
+	struct aaeon_mcu *ddata;
+	struct regmap *regmap;
+
+	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->client = client;
+
+	ddata->cmd = devm_kcalloc(&client->dev, AAEON_MCU_CMD_LEN, sizeof(*ddata->cmd),
+				  GFP_KERNEL);
+	if (!ddata->cmd)
+		return -ENOMEM;
+
+	ddata->response = devm_kzalloc(&client->dev, sizeof(*ddata->response), GFP_KERNEL);
+	if (!ddata->response)
+		return -ENOMEM;
+
+	regmap = devm_regmap_init(&client->dev, &aaeon_mcu_regmap_bus,
+				  ddata, &aaeon_mcu_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap),
+				     "failed to initialize regmap\n");
+
+	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
+				    aaeon_mcu_devs, ARRAY_SIZE(aaeon_mcu_devs),
+				    NULL, 0, NULL);
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
+		.name = "aaeon-mcu",
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
index 000000000000..3a1aeec85d60
--- /dev/null
+++ b/include/linux/mfd/aaeon-mcu.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Aaeon MCU driver definitions
+ *
+ * Copyright (C) 2026 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#ifndef __LINUX_MFD_AAEON_MCU_H
+#define __LINUX_MFD_AAEON_MCU_H
+
+/*
+ * MCU register address: the high byte is the command opcode, the low
+ * byte is the argument.  This matches the 3-byte wire format
+ * [opcode, arg, value] used by the MCU I2C protocol.
+ */
+#define AAEON_MCU_REG(op, arg)		(((op) << 8) | (arg))
+
+/*
+ * Opcode for GPIO input reads. These registers are volatile, their values
+ * are driven by external signals and can change without CPU involvement.
+ * Used by the MFD driver's volatile_reg callback to bypass the regmap cache.
+ */
+#define AAEON_MCU_READ_GPIO_OPCODE	0x72
+
+/*
+ * Opcode for watchdog control and status commands.
+ * The status register (arg=0x02) reflects hardware state and is volatile.
+ */
+#define AAEON_MCU_CONTROL_WDT_OPCODE	0x63
+
+/*
+ * Highest register address in the MCU register map.
+ * The WRITE_GPIO opcode (0x77) with the highest GPIO argument (0x0B = 11,
+ * i.e. MAX_GPIOS - 1) produces the largest encoded address.
+ */
+#define AAEON_MCU_MAX_REGISTER		AAEON_MCU_REG(0x77, 0x0B)
+
+#endif /* __LINUX_MFD_AAEON_MCU_H */

-- 
2.56.0


