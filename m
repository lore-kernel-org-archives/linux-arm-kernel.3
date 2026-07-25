Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB5AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 16:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4btXov3MykEzr3bDDsOQNUij+8xR3BX+MxxGuX/Kqp4=; b=MQXlqr9XG5F4xHyVZiPHHmoMzq
	8uCzURKVT+Mq1IAeo+tyF8wMlCFUdgQXB+N71B6zsyDGmDhl/JV9wXbKbWD8Dqtehe8IY+XkJ+k7x
	YiI3/fF78QlLIx/YStW0rrOh5YscjUaTA6vZ4em2KYFTBD1ZT2Zsajgegmx4E6pAyl/7JjzjUob0V
	tIMrDr04T2gWiiLz7Si+Bc+d0kik7uMA05kTMJymINdIBt6RdNffA5rvzMr5OrVrB4VfUkix2kZ9G
	J/Ab8w6MNga0RiS/Wkxm/Ba4PWgI/BBs0whz2OkbXQyDFhrkuMbHqrkxOKiGGW1FcuCbl3qQUVAeh
	rzFs6RAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnf7s-00000000WSv-3RBw;
	Sat, 25 Jul 2026 16:21:24 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnf7c-00000000WNq-2IbJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 16:21:11 +0000
Received: by chaosmail.tech (Postfix) id 034301C89C8;
	Sat, 25 Jul 2026 16:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784996466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4btXov3MykEzr3bDDsOQNUij+8xR3BX+MxxGuX/Kqp4=;
	b=V6tbMtiLilPg1250c3OpcpzgSzJuqn9JjQ9ljrfMyK5IIc22zorR5PPmSrkkyyqNi61Syx
	fqEFfnAVkeZWEDImxjfaA9HG2iLP6g5lQDKLV7EdPZZNP7BYNXtqsybT2nrk4vUx9NF5vs
	uBg9g3npmAZeNS7G+dgKsz6hebXWt9k=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 18:20:58 +0200
Subject: [PATCH 3/3] usb: typec: tipd: Add sn201202x support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-tipd-ace3-v1-3-73202d36138a@chaosmail.tech>
References: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
In-Reply-To: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784996463; l=11626;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=Jesl8eQRmpUMw7jv78whnHSxDtucn3U0vzPdmBcYkMQ=;
 b=VvaZaRONk63Crj8JCKAJC64teozYkLiRsmca779dljkObg3PM0BX3of2Q2/6pUBlYksgA9QYT
 n0/xTsz7WQWCtmaTuYmrLcXd3bd3PWP+pUMODixf85Tv46eXj2eIiVV
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_092108_846538_3DB0397D 
X-CRM114-Status: GOOD (  25.47  )
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

Add support for sn201202x (aka ACE3), a tipd variant that uses a very
similar register map, that is exposed over a "logical register"
interface on the SPMI bus.

Co-developed-by: Alyssa Milburn <amilburn@zall.org>
Signed-off-by: Alyssa Milburn <amilburn@zall.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 MAINTAINERS                     |   1 +
 drivers/usb/typec/tipd/Kconfig  |  14 +++++++
 drivers/usb/typec/tipd/Makefile |  12 ++++--
 drivers/usb/typec/tipd/core.h   |  14 ++++++-
 drivers/usb/typec/tipd/spmi.c   | 297 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 332 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2819ca62e0c..821932703b60 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2641,6 +2641,7 @@ F:	drivers/soc/apple/*
 F:	drivers/spi/spi-apple.c
 F:	drivers/spmi/spmi-apple-controller.c
 F:	drivers/usb/dwc3/dwc3-apple.c
+F:	drivers/usb/typec/tipd/spmi.c
 F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
diff --git a/drivers/usb/typec/tipd/Kconfig b/drivers/usb/typec/tipd/Kconfig
index b82715293072..6aa2fa439fdd 100644
--- a/drivers/usb/typec/tipd/Kconfig
+++ b/drivers/usb/typec/tipd/Kconfig
@@ -10,3 +10,17 @@ config TYPEC_TPS6598X
 
 	  If you choose to build this driver as a dynamically linked module, the
 	  module will be called tps6598x.ko.
+
+config TYPEC_SN201202X
+	tristate "TI SN201202x USB Power Delivery controller support"
+	select POWER_SUPPLY
+	select REGMAP_I2C
+	select USB_ROLE_SWITCH
+	select REGMAP_SPMI
+	help
+	  Say Y here to enable support for SN201202x, a TPS6598x variant
+	  that uses SPMI as a host bus, and is found on Apple devices starting
+	  from the M3 series.
+
+	  If you choose to build this driver as a dynamically linked module, the
+	  module will be called sn201202x.ko.
diff --git a/drivers/usb/typec/tipd/Makefile b/drivers/usb/typec/tipd/Makefile
index ba38daee9e72..9a547bb14831 100644
--- a/drivers/usb/typec/tipd/Makefile
+++ b/drivers/usb/typec/tipd/Makefile
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS_trace.o			:= -I$(src)
+CFLAGS_trace.o					:= -I$(src)
 
-obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
-tps6598x-y			:= i2c.o
-tps6598x-$(CONFIG_TRACING)	+= trace.o
+obj-$(CONFIG_TYPEC_TPS6598X)			+= tps6598x.o
+tps6598x-y					:= i2c.o
+tps6598x-$(CONFIG_TRACING)			+= trace.o
+
+obj-$(CONFIG_TYPEC_SN201202X)			+= sn201202x.o
+sn201202x-y					:= spmi.o
+sn201202x-$(CONFIG_TRACING)			+= trace.o
diff --git a/drivers/usb/typec/tipd/core.h b/drivers/usb/typec/tipd/core.h
index 1ba29e439e01..fed326a9788d 100644
--- a/drivers/usb/typec/tipd/core.h
+++ b/drivers/usb/typec/tipd/core.h
@@ -25,6 +25,10 @@
 #include "tps6598x.h"
 #include "trace.h"
 
+#ifdef CONFIG_TYPEC_SN201202X
+#include <linux/spmi.h>
+#endif
+
 /* Register offsets */
 #define TPS_REG_VID			0x00
 #define TPS_REG_MODE			0x03
@@ -234,8 +238,14 @@ static const char *tps6598x_psy_name_prefix = "tps6598x-source-psy-";
 static struct tps6598x *tps6598x_from_device(struct device *dev)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
-	struct tps6598x *tps = i2c_get_clientdata(client);
-	return tps;
+#ifdef CONFIG_TYPEC_SN201202X
+	if (!client) {
+		struct spmi_device *device = to_spmi_device(dev);
+
+		return spmi_device_get_drvdata(device);
+	}
+#endif
+	return i2c_get_clientdata(client);
 }
 
 static int
diff --git a/drivers/usb/typec/tipd/spmi.c b/drivers/usb/typec/tipd/spmi.c
new file mode 100644
index 000000000000..f94453131ea2
--- /dev/null
+++ b/drivers/usb/typec/tipd/spmi.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/spmi.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+
+#include "core.h"
+
+struct sn201202x {
+	struct cd321x cd;
+	struct completion select_completion;
+	struct completion sleep_completion;
+	struct completion wake_completion;
+	struct spmi_device *sdev;
+};
+
+#define tps_to_sn(tps) container_of_const((tps), struct sn201202x, cd.tps)
+
+static int regmap_sn201202x_select_reg(struct spmi_device *sdev, u8 reg)
+{
+	int err;
+	u8 val;
+	bool warned = false;
+	struct tps6598x *tps = spmi_device_get_drvdata(sdev);
+	struct sn201202x *sn = tps_to_sn(tps);
+
+	reinit_completion(&sn->select_completion);
+	err = spmi_register_zero_write(sdev, reg);
+	if (err)
+		return err;
+
+	if (!wait_for_completion_timeout(&sn->select_completion, msecs_to_jiffies(100)))
+		return -ETIMEDOUT;
+
+	while (1) {
+		err = spmi_register_read(sdev, 0, &val);
+		if (err)
+			return err;
+		if (val == (reg | 0x80)) {
+			if (!warned) {
+				dev_warn(tps->dev,
+					 "Got interrupt but selection not complete?\n");
+				warned = true;
+			}
+			msleep(20);
+			continue;
+		}
+		if (val == reg)
+			break;
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int regmap_sn201202x_read(void *context,
+				 const void *reg, size_t reg_size,
+				 void *val, size_t val_size)
+{
+	int err;
+	unsigned int offset = 0x20;
+	size_t len;
+	u8 addr;
+
+	WARN_ON(reg_size != 1);
+	WARN_ON(val_size > 0x40);
+
+	addr = *(u8 *)reg;
+
+	err = regmap_sn201202x_select_reg(context, addr);
+	if (err)
+		return err;
+
+	while (val_size) {
+		len = min_t(size_t, val_size, 16);
+		err = spmi_ext_register_read(context, offset, val, len);
+		if (err)
+			return err;
+		offset += len;
+		val += len;
+		val_size -= len;
+	}
+
+	return 0;
+}
+
+static int regmap_sn201202x_write(void *context, const void *data,
+				  size_t count)
+{
+	int err = 0;
+	unsigned int offset = 0xa0;
+	size_t len;
+	u8 addr;
+
+	WARN_ON(count < 1);
+
+	addr = *(u8 *)data;
+	data += 1;
+	count -= 1;
+
+	WARN_ON(count > 0x40);
+
+	err = regmap_sn201202x_select_reg(context, addr);
+	if (err)
+		return err;
+
+	while (count) {
+		len = min_t(size_t, count, 16);
+		err = spmi_ext_register_write(context, offset, data, len);
+		if (err)
+			return err;
+		offset += len;
+		data += len;
+		count -= len;
+	}
+
+	return err;
+}
+
+static irqreturn_t sn201202x_irq(int irq, void *data)
+{
+	struct completion *c = data;
+
+	complete(c);
+	return IRQ_HANDLED;
+}
+
+static const struct regmap_bus regmap_sn201202x = {
+	.read				= regmap_sn201202x_read,
+	.write				= regmap_sn201202x_write,
+	.reg_format_endian_default	= REGMAP_ENDIAN_NATIVE,
+	.val_format_endian_default	= REGMAP_ENDIAN_NATIVE,
+};
+
+static struct regmap *__devm_regmap_init_sn201202x(struct spmi_device *sdev,
+						   const struct regmap_config *config,
+						   struct lock_class_key *lock_key,
+						   const char *lock_name)
+{
+	return __devm_regmap_init(&sdev->dev, &regmap_sn201202x, sdev, config,
+				  lock_key, lock_name);
+}
+
+#define devm_regmap_init_sn201202x(dev, config)				\
+	__regmap_lockdep_wrapper(__devm_regmap_init_sn201202x, #config,	\
+				dev, config)
+
+static const struct tipd_data sn201202x_data = {
+	.irq_handler = cd321x_interrupt,
+	.irq_mask1 = APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
+		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
+		     APPLE_CD_REG_INT_PLUG_EVENT,
+	.tps_struct_size = sizeof(struct sn201202x),
+	.remove = cd321x_remove,
+	.register_port = cd321x_register_port,
+	.unregister_port = cd321x_unregister_port,
+	.trace_data_status = trace_cd321x_data_status,
+	.trace_power_status = trace_tps6598x_power_status,
+	.trace_status = trace_tps6598x_status,
+	.init = cd321x_init,
+	.read_data_status = cd321x_read_data_status,
+	.reset = cd321x_reset,
+	.switch_power_state = cd321x_switch_power_state,
+	.connect = cd321x_connect,
+};
+
+static const struct of_device_id sn201202x_of_match[] = {
+	{ .compatible = "apple,sn201202x", &sn201202x_data},
+	{}
+};
+
+static int sn201202x_probe(struct spmi_device *device)
+{
+	const struct of_device_id *match;
+	const struct tipd_data *data;
+	struct sn201202x *sn;
+	struct tps6598x *tps;
+	int irq_select, irq_sleep, irq_wake;
+	int ret;
+
+	match = of_match_device(sn201202x_of_match, &device->dev);
+	if (!match)
+		return -EINVAL;
+	data = match->data;
+
+	sn = devm_kzalloc(&device->dev, data->tps_struct_size, GFP_KERNEL);
+	if (!sn)
+		return -ENOMEM;
+	sn->sdev = device;
+	tps = &sn->cd.tps;
+
+	mutex_init(&tps->lock);
+	tps->dev = &device->dev;
+	tps->data = data;
+
+	tps->irq = of_irq_get_byname(device->dev.of_node, "irq");
+	if (tps->irq < 0)
+		return tps->irq;
+	irq_select = of_irq_get_byname(device->dev.of_node, "select");
+	if (irq_select < 0)
+		return irq_select;
+	irq_sleep = of_irq_get_byname(device->dev.of_node, "sleep");
+	if (irq_sleep < 0)
+		return irq_sleep;
+	irq_wake = of_irq_get_byname(device->dev.of_node, "wake");
+	if (irq_wake < 0)
+		return irq_wake;
+
+	init_completion(&sn->select_completion);
+	init_completion(&sn->sleep_completion);
+	init_completion(&sn->wake_completion);
+
+	ret = devm_request_threaded_irq(&device->dev, irq_select, NULL, sn201202x_irq,
+					IRQF_ONESHOT, NULL, &sn->select_completion);
+	if (ret)
+		return ret;
+	ret = devm_request_threaded_irq(&device->dev, irq_sleep, NULL, sn201202x_irq,
+					IRQF_ONESHOT, NULL, &sn->sleep_completion);
+	if (ret)
+		return ret;
+	ret = devm_request_threaded_irq(&device->dev, irq_wake, NULL, sn201202x_irq,
+					IRQF_ONESHOT, NULL, &sn->wake_completion);
+	if (ret)
+		return ret;
+
+	tps->regmap = devm_regmap_init_sn201202x(device, &tps6598x_regmap_config);
+	if (IS_ERR(tps->regmap))
+		return PTR_ERR(tps->regmap);
+
+	ret = spmi_command_wakeup(device);
+	if (ret)
+		return ret;
+	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies(100)))
+		return -ETIMEDOUT;
+
+	spmi_device_set_drvdata(device, tps);
+	return tps6598x_probe(tps);
+}
+
+static void sn201202x_remove(struct spmi_device *device)
+{
+	struct tps6598x *tps = spmi_device_get_drvdata(device);
+
+	tps6598x_remove(tps);
+}
+
+static int __maybe_unused sn201202x_resume(struct device *dev)
+{
+	struct tps6598x *tps = dev_get_drvdata(dev);
+	struct sn201202x *sn = tps_to_sn(tps);
+	int err;
+
+	err = spmi_command_wakeup(sn->sdev);
+	if (err)
+		return err;
+	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies(100)))
+		return -ETIMEDOUT;
+	return tps6598x_resume(dev);
+}
+
+static int __maybe_unused sn201202x_suspend(struct device *dev)
+{
+	struct tps6598x *tps = dev_get_drvdata(dev);
+	struct sn201202x *sn = tps_to_sn(tps);
+	int err;
+
+	err = tps6598x_suspend(dev);
+	if (err)
+		return err;
+	err = spmi_command_sleep(sn->sdev);
+	if (err)
+		return err;
+	if (!wait_for_completion_timeout(&sn->sleep_completion, msecs_to_jiffies(100)))
+		return -ETIMEDOUT;
+	return 0;
+}
+
+MODULE_DEVICE_TABLE(of, sn201202x_of_match);
+
+static const struct dev_pm_ops sn201202x_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(sn201202x_suspend, sn201202x_resume)
+};
+
+static struct spmi_driver sn201202x_driver = {
+	.driver = {
+		.name = "sn201202x",
+		.pm = &sn201202x_pm_ops,
+		.of_match_table = sn201202x_of_match,
+	},
+	.probe = sn201202x_probe,
+	.remove = sn201202x_remove,
+};
+module_spmi_driver(sn201202x_driver);
+
+MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("TI SN201202x USB Power Delivery Controller Driver");

-- 
2.55.0


