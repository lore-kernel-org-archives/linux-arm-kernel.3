Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35634C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruwJDFQSUBKkmHxXAItjo00hWtmNH/z9jKnwScXnE0c=; b=suJwKmRIal/6VVeH1PiA2Nhdh5
	+1yZTN1VHESgbTR5S0S1/AL42M4r8w3/VKtc5vspQBiXkEBLkWmV4YwSbkwp6IU/fK5jOom7sDyAn
	o3ea2JbGh6VRGFAE8Psjkqtz9p/PnhPVjRuZf8RCiQJhajVPoq2ZnSu+fUyO/3ePAbNvtykGF4cNH
	QNIKIc9SKfD/rwt2oxpPfyl5DeGNMT5lZGZgsuguW24lkYH16+kGJOpZBYrd4fz3jTWK/v5ZVGkqZ
	G1+WKrn4LiRXWPiEN1QOKpVSuPkNdzWpV8UtotlywuwRyREV0WpuYnR8T/QAfdVlQu0vbnoNLkzvq
	O+C6bTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjVA-0000000491a-1qbW;
	Wed, 05 Feb 2025 17:47:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiFd-00000003yhQ-0vNh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=ruwJDFQSUBKkmHxXAItjo00hWtmNH/z9jKnwScXnE0c=; b=F1LlNw7A0TPyLqTg/2M9tf3F98
	6MT3irgJsxeIumtUKVHz/NGqWGLYjBtD856Jf0C0ecAg9EJ2Fko+6ayly2AtQoDlrg37KEKrs1jlX
	JkC6NCLb5eIWBnpCKLuUSeVa05W/+hd24Htj0iShE0ARGYWFd9WANEFWFiB6G+8hIQe5TOtYhNM67
	JZ3dDiNS5wLnO4i9FDz01YwJS2xlGXqQM0ie8KphszvQ1TgbyEHLkB4qLOKi8zsPNqBayYY5YXSvl
	zaM/1bcWowhSG97lBFFmqLljVgHnA7rgj/gylT2dEA8/nv7pcFfg5Z8a1y7zqdNtifVn0bMvAz29K
	Tr1F1ulA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiFY-0000000Ghbv-38mO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56D8DA43826;
	Wed,  5 Feb 2025 16:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD493C4CEE2;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738772856;
	bh=Csuc3FSHcEWXNgKPtDz61sWC6yYR4AyjZcoQ6XqVssw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=npRlMugw0/5p+ag7ovsqMEI8JtyqfHxDMmVf4HVzilo6FSVPHc48G+cnUgfpA/YG3
	 MXPUs63STzwElNQ46ha5MsEgA55dBDdG4F3UwXCA4UrR1vAISQduszNvZbZd9e/4GQ
	 kDIS9Dmazf9hHAflZGZQ6dSJOz18nZOBTn6PfqSLyzCON9Sja7l1P7YYhL3gS4hAZk
	 Jzp5iLKAPx5IdifK/EZcbwhOmfS76uBZO1QVSNm/S3eiTNxVIt947xN7lejbrf9T1l
	 fnsSxe1dWFScKHp8An0upsNDWgd+HxI7BbCe/GOqUlQ5MI/Xl1l+dhr48caeidep7X
	 4CYQDiz8eKr2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA50C02199;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 05 Feb 2025 17:27:27 +0100
Subject: [PATCH v6 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-z2-v6-2-cc60cbee1d5b@gmail.com>
References: <20250205-z2-v6-0-cc60cbee1d5b@gmail.com>
In-Reply-To: <20250205-z2-v6-0-cc60cbee1d5b@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738772855; l=16231;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=F4HT3DCaOFAFCnqGhdc6iukzWXU5Qg3618zrKAPdmLo=;
 b=+9vR0axCR6/nqv9lDAmm6Q7aC3sWIj6x6Sd6TtF2VUmDXEihOKnivj7ipq5JkmLbXOHexlvmc
 cNE53IYu7/zCvB5NiKlGFC4XrXfbf6LbHQuGIFsSDN9yOggsT+H/E1X
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_162741_228846_C550EC41 
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Adds a driver for Apple touchscreens using the Z2 protocol.

Signed-off-by: Janne Grunau <j@jannau.net>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/input/touchscreen/Kconfig    |  13 +
 drivers/input/touchscreen/Makefile   |   1 +
 drivers/input/touchscreen/apple_z2.c | 473 +++++++++++++++++++++++++++++++++++
 3 files changed, 487 insertions(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 1a03de7fcfa66c0f60768be17d776a79e36e570e..6c885cc58f323b3628538d41460248f8ab1dbf7d 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -103,6 +103,19 @@ config TOUCHSCREEN_ADC
 	  To compile this driver as a module, choose M here: the
 	  module will be called resistive-adc-touch.ko.
 
+config TOUCHSCREEN_APPLE_Z2
+	tristate "Apple Z2 touchscreens"
+	default ARCH_APPLE
+	depends on SPI
+	help
+	  Say Y here if you have an Apple device with
+	  a touchscreen or a touchbar.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called apple_z2.
+
 config TOUCHSCREEN_AR1021_I2C
 	tristate "Microchip AR1020/1021 i2c touchscreen"
 	depends on I2C && OF
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 82bc837ca01e2ee18c5e9c578765d55ef9fab6d4..97a025c6a3770fb80255246eb63c11688ebd79eb 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_TOUCHSCREEN_AD7879_I2C)	+= ad7879-i2c.o
 obj-$(CONFIG_TOUCHSCREEN_AD7879_SPI)	+= ad7879-spi.o
 obj-$(CONFIG_TOUCHSCREEN_ADC)		+= resistive-adc-touch.o
 obj-$(CONFIG_TOUCHSCREEN_ADS7846)	+= ads7846.o
+obj-$(CONFIG_TOUCHSCREEN_APPLE_Z2)	+= apple_z2.o
 obj-$(CONFIG_TOUCHSCREEN_AR1021_I2C)	+= ar1021_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_ATMEL_MXT)	+= atmel_mxt_ts.o
 obj-$(CONFIG_TOUCHSCREEN_AUO_PIXCIR)	+= auo-pixcir-ts.o
diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
new file mode 100644
index 0000000000000000000000000000000000000000..a996cf28e4d25fd747bdc6be7ff64a40238641a4
--- /dev/null
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -0,0 +1,473 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Z2 touchscreen driver
+ *
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/spi/spi.h>
+#include <linux/unaligned.h>
+
+#define APPLE_Z2_NUM_FINGERS_OFFSET      16
+#define APPLE_Z2_FINGERS_OFFSET          24
+#define APPLE_Z2_TOUCH_STARTED           3
+#define APPLE_Z2_TOUCH_MOVED             4
+#define APPLE_Z2_CMD_READ_INTERRUPT_DATA 0xEB
+#define APPLE_Z2_HBPP_CMD_BLOB           0x3001
+#define APPLE_Z2_FW_MAGIC                0x5746325A
+#define LOAD_COMMAND_INIT_PAYLOAD        0
+#define LOAD_COMMAND_SEND_BLOB           1
+#define LOAD_COMMAND_SEND_CALIBRATION    2
+#define CAL_PROP_NAME                    "apple,z2-cal-blob"
+
+struct apple_z2 {
+	struct spi_device *spidev;
+	struct gpio_desc *reset_gpio;
+	struct input_dev *input_dev;
+	struct completion boot_irq;
+	bool booted;
+	int index_parity;
+	struct touchscreen_properties props;
+	const char *fw_name;
+	u8 *tx_buf;
+	u8 *rx_buf;
+};
+
+struct apple_z2_finger {
+	u8 finger;
+	u8 state;
+	__le16 unknown2;
+	__le16 abs_x;
+	__le16 abs_y;
+	__le16 rel_x;
+	__le16 rel_y;
+	__le16 tool_major;
+	__le16 tool_minor;
+	__le16 orientation;
+	__le16 touch_major;
+	__le16 touch_minor;
+	__le16 unused[2];
+	__le16 pressure;
+	__le16 multi;
+} __packed;
+
+struct apple_z2_hbpp_blob_hdr {
+	__le16 cmd;
+	__le16 len;
+	__le32 addr;
+	__le16 checksum;
+};
+
+struct apple_z2_fw_hdr {
+	__le32 magic;
+	__le32 version;
+};
+
+struct apple_z2_read_interrupt_cmd {
+	u8 cmd;
+	u8 counter;
+	u8 unused[12];
+	__le16 checksum;
+};
+
+static void apple_z2_parse_touches(struct apple_z2 *z2,
+				   const u8 *msg, size_t msg_len)
+{
+	int i;
+	int nfingers;
+	int slot;
+	int slot_valid;
+	struct apple_z2_finger *fingers;
+
+	if (msg_len <= APPLE_Z2_NUM_FINGERS_OFFSET)
+		return;
+	nfingers = msg[APPLE_Z2_NUM_FINGERS_OFFSET];
+	fingers = (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
+	for (i = 0; i < nfingers; i++) {
+		slot = input_mt_get_slot_by_key(z2->input_dev, fingers[i].finger);
+		if (slot < 0) {
+			dev_warn(&z2->spidev->dev, "unable to get slot for finger\n");
+			continue;
+		}
+		slot_valid = fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
+			     fingers[i].state == APPLE_Z2_TOUCH_MOVED;
+		input_mt_slot(z2->input_dev, slot);
+		if (!input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid))
+			continue;
+		touchscreen_report_pos(z2->input_dev, &z2->props,
+				       le16_to_cpu(fingers[i].abs_x),
+				       le16_to_cpu(fingers[i].abs_y),
+				       true);
+		input_report_abs(z2->input_dev, ABS_MT_WIDTH_MAJOR,
+				 le16_to_cpu(fingers[i].tool_major));
+		input_report_abs(z2->input_dev, ABS_MT_WIDTH_MINOR,
+				 le16_to_cpu(fingers[i].tool_minor));
+		input_report_abs(z2->input_dev, ABS_MT_ORIENTATION,
+				 le16_to_cpu(fingers[i].orientation));
+		input_report_abs(z2->input_dev, ABS_MT_TOUCH_MAJOR,
+				 le16_to_cpu(fingers[i].touch_major));
+		input_report_abs(z2->input_dev, ABS_MT_TOUCH_MINOR,
+				 le16_to_cpu(fingers[i].touch_minor));
+	}
+	input_mt_sync_frame(z2->input_dev);
+	input_sync(z2->input_dev);
+}
+
+static int apple_z2_read_packet(struct apple_z2 *z2)
+{
+	struct apple_z2_read_interrupt_cmd *len_cmd = (void *)z2->tx_buf;
+	struct spi_transfer xfer;
+	int error;
+	size_t pkt_len;
+
+	memset(&xfer, 0, sizeof(xfer));
+	len_cmd->cmd = APPLE_Z2_CMD_READ_INTERRUPT_DATA;
+	len_cmd->counter = z2->index_parity + 1;
+	len_cmd->checksum =
+		cpu_to_le16(APPLE_Z2_CMD_READ_INTERRUPT_DATA + len_cmd->counter);
+	z2->index_parity = !z2->index_parity;
+	xfer.tx_buf = z2->tx_buf;
+	xfer.rx_buf = z2->rx_buf;
+	xfer.len = sizeof(*len_cmd);
+
+	error = spi_sync_transfer(z2->spidev, &xfer, 1);
+	if (error)
+		return error;
+
+	pkt_len = (get_unaligned_le16(z2->rx_buf + 1) + 8) & 0xfffffffc;
+
+	error = spi_read(z2->spidev, z2->rx_buf, pkt_len);
+	if (error)
+		return error;
+
+	apple_z2_parse_touches(z2, z2->rx_buf + 5, pkt_len - 5);
+
+	return 0;
+}
+
+static irqreturn_t apple_z2_irq(int irq, void *data)
+{
+	struct apple_z2 *z2 = data;
+
+	if (unlikely(!z2->booted))
+		complete(&z2->boot_irq);
+	else
+		apple_z2_read_packet(z2);
+
+	return IRQ_HANDLED;
+}
+
+/* Build calibration blob, caller is responsible for freeing the blob data. */
+static const u8 *apple_z2_build_cal_blob(struct apple_z2 *z2,
+					 u32 address, size_t *size)
+{
+	u8 *cal_data;
+	int cal_size;
+	size_t blob_size;
+	u32 checksum;
+	u16 checksum_hdr;
+	int i;
+	struct apple_z2_hbpp_blob_hdr *hdr;
+	int error;
+
+	if (!device_property_present(&z2->spidev->dev, CAL_PROP_NAME))
+		return NULL;
+
+	cal_size = device_property_count_u8(&z2->spidev->dev, CAL_PROP_NAME);
+	if (cal_size < 0)
+		return ERR_PTR(cal_size);
+
+	blob_size = sizeof(struct apple_z2_hbpp_blob_hdr) + cal_size + sizeof(__le32);
+	u8 *blob_data __free(kfree) = kzalloc(blob_size, GFP_KERNEL);
+	if (!blob_data)
+		return ERR_PTR(-ENOMEM);
+
+	hdr = (struct apple_z2_hbpp_blob_hdr *)blob_data;
+	hdr->cmd = cpu_to_le16(APPLE_Z2_HBPP_CMD_BLOB);
+	hdr->len = cpu_to_le16(round_up(cal_size, 4) / 4);
+	hdr->addr = cpu_to_le32(address);
+
+	checksum_hdr = 0;
+	for (i = 2; i < 8; i++)
+		checksum_hdr += blob_data[i];
+	hdr->checksum = cpu_to_le16(checksum_hdr);
+
+	cal_data = blob_data + sizeof(struct apple_z2_hbpp_blob_hdr);
+	error = device_property_read_u8_array(&z2->spidev->dev, CAL_PROP_NAME,
+					      cal_data, cal_size);
+	if (error)
+		return ERR_PTR(error);
+
+	checksum = 0;
+	for (i = 0; i < cal_size; i++)
+		checksum += cal_data[i];
+	put_unaligned_le32(checksum, cal_data + cal_size);
+
+	*size = blob_size;
+	return no_free_ptr(blob_data);
+}
+
+static int apple_z2_send_firmware_blob(struct apple_z2 *z2, const u8 *data,
+				       u32 size, bool init)
+{
+	struct spi_message msg;
+	struct spi_transfer blob_xfer, ack_xfer;
+	int error;
+
+	z2->tx_buf[0] = 0x1a;
+	z2->tx_buf[1] = 0xa1;
+
+	spi_message_init(&msg);
+	memset(&blob_xfer, 0, sizeof(blob_xfer));
+	memset(&ack_xfer, 0, sizeof(ack_xfer));
+
+	blob_xfer.tx_buf = data;
+	blob_xfer.len = size;
+	blob_xfer.bits_per_word = init ? 8 : 16;
+	spi_message_add_tail(&blob_xfer, &msg);
+
+	ack_xfer.tx_buf = z2->tx_buf;
+	ack_xfer.len = 2;
+	spi_message_add_tail(&ack_xfer, &msg);
+
+	reinit_completion(&z2->boot_irq);
+	error = spi_sync(z2->spidev, &msg);
+	if (error)
+		return error;
+
+	/* Irq only happens sometimes, but the thing boots reliably nonetheless */
+	wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
+
+	return 0;
+}
+
+static int apple_z2_upload_firmware(struct apple_z2 *z2)
+{
+	const struct apple_z2_fw_hdr *fw_hdr;
+	size_t fw_idx = sizeof(struct apple_z2_fw_hdr);
+	int error;
+	u32 load_cmd;
+	u32 address;
+	bool init;
+	size_t size;
+
+	const struct firmware *fw __free(firmware) = NULL;
+	error = request_firmware(&fw, z2->fw_name, &z2->spidev->dev);
+	if (error) {
+		dev_err(&z2->spidev->dev, "unable to load firmware\n");
+		return error;
+	}
+
+	fw_hdr = (const struct apple_z2_fw_hdr *)fw->data;
+	if (le32_to_cpu(fw_hdr->magic) != APPLE_Z2_FW_MAGIC || le32_to_cpu(fw_hdr->version) != 1) {
+		dev_err(&z2->spidev->dev, "invalid firmware header\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * This will interrupt the upload half-way if the file is malformed
+	 * As the device has no non-volatile storage to corrupt, and gets reset
+	 * on boot anyway, this is fine.
+	 */
+	while (fw_idx < fw->size) {
+		if (fw->size - fw_idx < 8) {
+			dev_err(&z2->spidev->dev, "firmware malformed\n");
+			return -EINVAL;
+		}
+
+		load_cmd = le32_to_cpup((__force __le32 *)(fw->data + fw_idx));
+		fw_idx += sizeof(u32);
+		if (load_cmd == LOAD_COMMAND_INIT_PAYLOAD || load_cmd == LOAD_COMMAND_SEND_BLOB) {
+			size = le32_to_cpup((__force __le32 *)(fw->data + fw_idx));
+			fw_idx += sizeof(u32);
+			if (fw->size - fw_idx < size) {
+				dev_err(&z2->spidev->dev, "firmware malformed\n");
+				return -EINVAL;
+			}
+			init = load_cmd == LOAD_COMMAND_INIT_PAYLOAD;
+			error = apple_z2_send_firmware_blob(z2, fw->data + fw_idx,
+							    size, init);
+			if (error)
+				return error;
+			fw_idx += size;
+		} else if (load_cmd == LOAD_COMMAND_SEND_CALIBRATION) {
+			address = le32_to_cpup((__force __le32 *)(fw->data + fw_idx));
+			fw_idx += sizeof(u32);
+
+			const u8 *data __free(kfree) =
+				apple_z2_build_cal_blob(z2, address, &size);
+			if (IS_ERR(data))
+				return PTR_ERR(data);
+
+			if (data) {
+				error = apple_z2_send_firmware_blob(z2, data, size, false);
+				if (error)
+					return error;
+			}
+		} else {
+			dev_err(&z2->spidev->dev, "firmware malformed\n");
+			return -EINVAL;
+		}
+		fw_idx = round_up(fw_idx, 4);
+	}
+
+
+	z2->booted = true;
+	apple_z2_read_packet(z2);
+	return 0;
+}
+
+static int apple_z2_boot(struct apple_z2 *z2)
+{
+	int error;
+
+	reinit_completion(&z2->boot_irq);
+	enable_irq(z2->spidev->irq);
+	gpiod_set_value(z2->reset_gpio, 0);
+	if (!wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20)))
+		return -ETIMEDOUT;
+
+	error = apple_z2_upload_firmware(z2);
+	if (error) {
+		gpiod_set_value(z2->reset_gpio, 1);
+		disable_irq(z2->spidev->irq);
+		return error;
+	}
+	return 0;
+}
+
+static int apple_z2_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct apple_z2 *z2;
+	int error;
+
+	z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
+	if (!z2)
+		return -ENOMEM;
+
+	z2->tx_buf = devm_kzalloc(dev, sizeof(struct apple_z2_read_interrupt_cmd), GFP_KERNEL);
+	if (!z2->tx_buf)
+		return -ENOMEM;
+	/* 4096 will end up being rounded up to 8192 due to devres header */
+	z2->rx_buf = devm_kzalloc(dev, 4000, GFP_KERNEL);
+	if (!z2->rx_buf)
+		return -ENOMEM;
+
+	z2->spidev = spi;
+	init_completion(&z2->boot_irq);
+	spi_set_drvdata(spi, z2);
+
+	/* Reset the device on boot */
+	z2->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(z2->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(z2->reset_gpio), "unable to get reset\n");
+
+	error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
+					  apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					  "apple-z2-irq", z2);
+	if (error)
+		return dev_err_probe(dev, error, "unable to request irq\n");
+
+	error = device_property_read_string(dev, "firmware-name", &z2->fw_name);
+	if (error)
+		return dev_err_probe(dev, error, "unable to get firmware name\n");
+
+	z2->input_dev = devm_input_allocate_device(dev);
+	if (!z2->input_dev)
+		return -ENOMEM;
+	z2->input_dev->name = (char *)spi_get_device_id(spi)->driver_data;
+	z2->input_dev->phys = "apple_z2";
+	z2->input_dev->id.bustype = BUS_SPI;
+
+	/* Allocate the axes before setting from DT */
+	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
+	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
+	touchscreen_parse_properties(z2->input_dev, true, &z2->props);
+	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_X, 100);
+	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_Y, 100);
+	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MAJOR, 0, 65535, 0, 0);
+	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MINOR, 0, 65535, 0, 0);
+	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MAJOR, 0, 65535, 0, 0);
+	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MINOR, 0, 65535, 0, 0);
+	input_set_abs_params(z2->input_dev, ABS_MT_ORIENTATION, -32768, 32767, 0, 0);
+
+	error = input_mt_init_slots(z2->input_dev, 256, INPUT_MT_DIRECT);
+	if (error)
+		return dev_err_probe(dev, error, "unable to initialize multitouch slots\n");
+
+	error = input_register_device(z2->input_dev);
+	if (error)
+		return dev_err_probe(dev, error, "unable to register input device\n");
+
+	/* Wait for device reset to finish */
+	usleep_range(5000, 10000);
+	error = apple_z2_boot(z2);
+	if (error)
+		return error;
+	return 0;
+}
+
+static void apple_z2_shutdown(struct spi_device *spi)
+{
+	struct apple_z2 *z2 = spi_get_drvdata(spi);
+
+	disable_irq(z2->spidev->irq);
+	gpiod_direction_output(z2->reset_gpio, 1);
+	z2->booted = false;
+}
+
+static int apple_z2_suspend(struct device *dev)
+{
+	apple_z2_shutdown(to_spi_device(dev));
+	return 0;
+}
+
+static int apple_z2_resume(struct device *dev)
+{
+	struct apple_z2 *z2 = spi_get_drvdata(to_spi_device(dev));
+
+	return apple_z2_boot(z2);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(apple_z2_pm, apple_z2_suspend, apple_z2_resume);
+
+static const struct of_device_id apple_z2_of_match[] = {
+	{ .compatible = "apple,j293-touchbar" },
+	{ .compatible = "apple,j493-touchbar" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, apple_z2_of_match);
+
+static struct spi_device_id apple_z2_of_id[] = {
+	{ .name = "j293-touchbar", .driver_data = (kernel_ulong_t)"MacBookPro17,1 Touch Bar" },
+	{ .name = "j493-touchbar", .driver_data = (kernel_ulong_t)"Mac14,7 Touch Bar" },
+	{}
+};
+MODULE_DEVICE_TABLE(spi, apple_z2_of_id);
+
+static struct spi_driver apple_z2_driver = {
+	.driver = {
+		.name	= "apple-z2",
+		.pm	= pm_sleep_ptr(&apple_z2_pm),
+		.of_match_table = apple_z2_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = apple_z2_of_id,
+	.probe    = apple_z2_probe,
+	.remove   = apple_z2_shutdown,
+};
+
+module_spi_driver(apple_z2_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_FIRMWARE("apple/dfrmtfw-*.bin");
+MODULE_DESCRIPTION("Apple Z2 touchscreens driver");

-- 
2.48.1



