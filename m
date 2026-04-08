Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC91FD5F95
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHlzd5CvUO2+I2VRLlo+/O6Bf4yCL5cx4cCvx5Vp9oE=; b=imfHNdUHVwFfkJgJqM6Pn3sp+c
	RWv2lHJKOMQUpoQMHXuQozSRTxRFrXkJ9eEHe4H1DJG8a9pnOJFdgbNhN6qOzgnfiVo9ymb58qMeM
	qZhbw1hrjqxmQ1mzKKpUwyvmPfcX4OttGwCMSiKSD9LoRqYM+6cdMbIf4CWfhtl3tQOz4tKUuWzlQ
	GMrgcscsirRYVZ6OwFGQ8pPtaf44uFXBu//5rGsZ1pLBrcw9qmGX48vxZEWQxIWHSDeJOnqRiY7A1
	9E19uvBijVYdUNWuXPRaDs+LomxTavb4yuDifZV4t+48bfyPEweVzmfOb9p7HFSfiZSXPf/H5zaXI
	q9Wtaorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANq3-00000008U5D-0zyr;
	Wed, 08 Apr 2026 08:00:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANps-00000008U04-1N9I;
	Wed, 08 Apr 2026 08:00:32 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775635222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FHlzd5CvUO2+I2VRLlo+/O6Bf4yCL5cx4cCvx5Vp9oE=;
	b=AE7H4D6K9V3yP1maNxD4jXnCz5hWuNdOevOgzNfADM+PXVyMWF8KnC4s+KqtLs8M7y1WYC
	i1TtEeqhCcaGgfaU0ChDsnJfVgisWziXE9Q+YFS+/0Dq06i8ucS14oUrc+8BayNun7kUgc
	ZKsBlxJo7cm4z1GsDkf6Scwxmb82ox4WT5+ta2bEfR4AsoYRZBAbc052eMGIqedSHubzhg
	9xVctrwsfy+2EyiiF+XDfjtvEJiejGUGHpWsmPe3guFF1+UqR5UEpcUGZOkOooZFnP7jA5
	TSpD3o6KkbankCfkgBBGhqXitWOF4WnItbP7PQABZ/gJl8DMgjTjpAgCxC9mXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775635222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FHlzd5CvUO2+I2VRLlo+/O6Bf4yCL5cx4cCvx5Vp9oE=;
	b=JiBHrrqGS6UCAMzZi58QG4bRjW2RjdJ+e83KuQBQVXtQwKIOWA0m66+peGlzrVs+Hzk4Ue
	HfX6h8m/8xtUsSAg==
Date: Wed, 08 Apr 2026 10:00:16 +0200
Subject: [PATCH 2/3] nvmem: Add the Raspberry Pi OTP driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-rpi-otp-driver-v1-2-e02d1dbe6008@linutronix.de>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
In-Reply-To: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775635221; l=6674;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=5Gb2Eanpx7XkulkXCm+RTCsTcN0EES8SSGSQojOG/Uc=;
 b=zXz1tZx0f/gWHma8Nei2S3X1zuf+Xsv9NZ53fkTpQIo+9i/1QRjdXDRI1SpvCBoki9HU2i6nr
 8mZnT0IX2IIB+5Ezdoddm/tJzZTbnDspEkeZEzBMbgBL31sFCpJdo6B
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_010028_527889_315D2F00 
X-CRM114-Status: GOOD (  23.45  )
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

Raspberry Pis have OTP registers which can be accessed through the
videocore firmware. Add a nvmem driver to support these OTP registers.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 drivers/nvmem/Kconfig                      |  12 +++
 drivers/nvmem/Makefile                     |   1 +
 drivers/nvmem/raspberrypi-otp.c            | 159 +++++++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h |   2 +
 4 files changed, 174 insertions(+)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 74ddbd0f79b0..892d05fe67be 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -483,4 +483,16 @@ config NVMEM_QORIQ_EFUSE
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem_qoriq_efuse.
 
+config NVMEM_RASPBERRYPI_OTP
+	tristate "Raspberry Pi OTP support"
+	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
+	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
+	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
+	help
+	  This driver provides access to the Raspberry Pi OTP memory via the
+	  nvmem subsystem. The driver supports the customer otp as well as the
+	  device specific private key OTP.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called raspberrypi-otp.
 endif
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 7252b8ec88d4..8ca2095e068f 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -95,3 +95,4 @@ obj-$(CONFIG_NVMEM_ZYNQMP)		+= nvmem_zynqmp_nvmem.o
 nvmem_zynqmp_nvmem-y			:= zynqmp_nvmem.o
 obj-$(CONFIG_NVMEM_QORIQ_EFUSE)		+= nvmem-qoriq-efuse.o
 nvmem-qoriq-efuse-y			:= qoriq-efuse.o
+obj-$(CONFIG_NVMEM_RASPBERRYPI_OTP)	+= raspberrypi-otp.o
diff --git a/drivers/nvmem/raspberrypi-otp.c b/drivers/nvmem/raspberrypi-otp.c
new file mode 100644
index 000000000000..13ee3784b137
--- /dev/null
+++ b/drivers/nvmem/raspberrypi-otp.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
+struct rpi_otp_priv {
+	struct rpi_firmware *fw;
+	struct device *dev;
+	u32 read_tag;
+	u32 write_tag;
+};
+
+struct rpi_otp_driver_data {
+	const char *name;
+	u32 read_tag;
+	u32 write_tag;
+};
+
+struct rpi_otp_header {
+	u32 start;
+	u32 count;
+	u32 data[];
+};
+
+static int rpi_otp_read(void *context, unsigned int offset, void *buf, size_t bytes)
+{
+	struct rpi_otp_priv *priv = context;
+	struct rpi_otp_header *fwbuf;
+	int ret;
+
+	fwbuf = kmalloc(sizeof(struct rpi_otp_header) + bytes, GFP_KERNEL);
+	if (!fwbuf)
+		return -ENOMEM;
+
+	fwbuf->start = offset / 4;
+	fwbuf->count = bytes / 4;
+
+	ret = rpi_firmware_property(priv->fw, priv->read_tag, fwbuf,
+				    sizeof(struct rpi_otp_header) + bytes);
+	if (ret)
+		goto out;
+
+	memcpy(buf, fwbuf->data, bytes);
+
+out:
+	kfree(fwbuf);
+	return ret;
+}
+
+static int rpi_otp_write(void *context, unsigned int offset, void *val, size_t bytes)
+{
+	struct rpi_otp_priv *priv = context;
+	struct rpi_otp_header *fwbuf;
+	int ret;
+
+	fwbuf = kmalloc(sizeof(struct rpi_otp_header) + bytes, GFP_KERNEL);
+	if (!fwbuf)
+		return -ENOMEM;
+
+	fwbuf->start = offset / 4;
+	fwbuf->count = bytes / 4;
+	memcpy(fwbuf->data, val, bytes);
+
+	ret = rpi_firmware_property(priv->fw, priv->write_tag, fwbuf,
+				    sizeof(struct rpi_otp_header) + bytes);
+
+	kfree(fwbuf);
+	return ret;
+}
+
+static const struct rpi_otp_driver_data rpi_otp_customer = {
+	.name = "rpi-otp-customer",
+	.read_tag = RPI_FIRMWARE_GET_CUSTOMER_OTP,
+	.write_tag = RPI_FIRMWARE_SET_CUSTOMER_OTP,
+};
+
+static const struct rpi_otp_driver_data rpi_otp_private = {
+	.name = "rpi-otp-private",
+	.read_tag = RPI_FIRMWARE_GET_PRIVATE_OTP,
+	.write_tag = RPI_FIRMWARE_SET_PRIVATE_OTP,
+};
+
+static int rpi_otp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nvmem_device *nvmem;
+	struct rpi_otp_priv *priv;
+	struct device_node *np;
+	const struct rpi_otp_driver_data *data;
+	struct nvmem_config config = {
+		.read_only = false,
+		.word_size = 4,
+		.stride = 4,
+		.reg_read = rpi_otp_read,
+		.reg_write = rpi_otp_write,
+		.size = 32,
+	};
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
+	np = of_get_parent(dev->of_node);
+	if (!np) {
+		dev_err(dev, "Missing firmware node\n");
+		return -ENOENT;
+	}
+
+	priv->fw = devm_rpi_firmware_get(&pdev->dev, np);
+	of_node_put(np);
+	if (!priv->fw)
+		return -EPROBE_DEFER;
+
+	priv->dev = dev;
+	priv->read_tag = data->read_tag;
+	priv->write_tag = data->write_tag;
+	config.dev = dev;
+	config.priv = priv;
+	config.name = data->name;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem), "error registering nvmem config\n");
+
+	return 0;
+}
+
+static const struct of_device_id rpi_otp_of_match[] = {
+	{
+		.compatible = "raspberrypi,firmware-otp-customer",
+		.data = &rpi_otp_customer
+	},
+	{
+		.compatible = "raspberrypi,firmware-otp-private",
+		.data = &rpi_otp_private,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rpi_otp_of_match);
+
+static struct platform_driver raspberry_otp_driver = {
+	.probe	= rpi_otp_probe,
+	.driver = {
+		.name	= "rpi-otp",
+		.of_match_table = rpi_otp_of_match,
+	},
+};
+module_platform_driver(raspberry_otp_driver);
+
+MODULE_AUTHOR("Gregor Herburger <gregor.herburger@linutronix.de>");
+MODULE_DESCRIPTION("Raspberry OTP driver");
+MODULE_LICENSE("GPL");
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index e1f87fbfe554..6e94ccf34f47 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -92,6 +92,8 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
 	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
+	RPI_FIRMWARE_GET_PRIVATE_OTP =                        0x00030081,
+	RPI_FIRMWARE_SET_PRIVATE_OTP =                        0x00038081,
 
 	/* Dispmanx TAGS */
 	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =                   0x00040001,

-- 
2.47.3


