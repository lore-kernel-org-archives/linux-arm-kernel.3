Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A17CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nhf4CJ/Pi93+Nfxx63SI2Ea15s19Jp++IUEa4h1jmqo=; b=y7fq0FlKW5SKmVCnjMh69YlMAC
	zfGpk5cq02Nozkfvu2uImr0Xy16gtXElGwDvwI1urMHaacOeThiux+UybTUybZdxkY0j843X4MJQS
	FaKKaLv+Xa91TQwQF9KNRPZkChPhEb++kTDDRoWO/ZQUsouvGqJH5tDE9nCZr9s2oGTjIhPf3cmJj
	K9cRCQPD++WaCLt1JznYFzbPKdh0ro5DeC0GBG/snoUyLYSbCp+umHViWKyt3aFukMAXUi06CMv6e
	Z8cYO3nr6WQEGzE1gwCy5ruu1v4ArkPNdAubddxqvWNoqzUb9+roa3qWENeuJjBSt+ZCtnbLs69EY
	HYBK0hOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCwx-00000005HrL-3kiF;
	Mon, 15 Sep 2025 17:25:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCww-00000005Hq8-14bd;
	Mon, 15 Sep 2025 17:25:11 +0000
Received: from [192.168.0.172] (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87C9D710;
	Mon, 15 Sep 2025 19:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757956644;
	bh=dBQRMbRcyYg/zn0kFv486waP0cB51OPeZXzibnFMrnE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sfxJZnXZ1njBuwv4ybeXtz7UIrGAISt9Iyq6VOIb0Gzb6Xzs+jWOquGfiLSPCjwRF
	 VfVvVXd/ZtMNkmCSuM0LOgygFHdeaWtNwlh5eMe1btd56FjXnD5/Kgb+fkW/PGnDU4
	 +OPmporjY8UZz643E1BF9kENxKqw0kfzvTAE3C9Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 15 Sep 2025 19:18:14 +0200
Subject: [PATCH v5 5/8] media: v4l2-core: Introduce v4l2-isp.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-extensible-parameters-validation-v5-5-e6db94468af3@ideasonboard.com>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
In-Reply-To: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10339;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=dBQRMbRcyYg/zn0kFv486waP0cB51OPeZXzibnFMrnE=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoyEppa14RsLFl+/EdpeZknNHTwssrge035c3Xr
 ye7wcR0fkqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaMhKaQAKCRByNAaPFqFW
 PODGD/4tHHE4jPaQFVUdgsa/CRP2AzRgWdhgCRChJywWKycY/gqCbXSvxyeFDZtMs7iyq2mG8vs
 UMZpxGztWWNSE2ViMO3p9qeZSZOpX1Z6wR8zPohD5MvzLsmXsftBKVyGsVRYOxmkf5e8XCsJr74
 eDAK+Gt1Jm2E6bL2mAPrOVwBqHrwJfGb1BzXviQK7oDVcexsIk2y1Gy80BPMJevYAXA5Gn3SGRe
 3iJB08vLa3LXr2vxU/eX9xupQG9Bu2KxU172N/Gl90rdGRjpmLnQVKwVoV8f8hZcj/+eqdRGaAv
 Eh7IT7hhj0vvT6bDInH+8B37LHAKFrgfTYRQ8KYjdZvBH9AK7s/dNTWyV3aWWZD4dHJLok8gKW9
 9N/Go9wCyoskRBCcWD8kcBokrnTgQPBHrxXlFAgE1BdSJcfXzVKylKywlNMqPXBGx3+zrqazzVk
 16UzUNSh7y0NFY95UpRpYdlhZT68iCfPa6Or/sEXkFN7jieaSybLgTOmjAmUeNJ6J+l0cn39hXI
 QoCkFFxDIY48LDhld2zGZjEAtRPlOYB5ChIrE0mbLl9/vdhcp9hEFPZ43DU9UKNCKgOriYrV0h7
 vsZD0gNtY5TLe4mgQ2PXHgjZ+7ZjQsaGs5uv2yulx0/TR5pzLQDmuclL8dsrO1RBW6B1LVq67Z8
 mjBOUIQznQ7cwjA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_102510_430237_0FB77153 
X-CRM114-Status: GOOD (  28.32  )
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

Add to the v4l2 framework helper functions to support drivers
when validating a buffer of extensible ISP parameters.

Introduce new types in include/media/v4l2-isp.h that drivers shall use
in order to comply with the generic ISP parameters validation procedure,
and add helper functionss to v4l2-isp.c to perform blocks and buffer
validation.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 MAINTAINERS                        |   2 +
 drivers/media/v4l2-core/Kconfig    |   4 ++
 drivers/media/v4l2-core/Makefile   |   1 +
 drivers/media/v4l2-core/v4l2-isp.c | 108 +++++++++++++++++++++++++++++++++++++
 include/media/v4l2-isp.h           | 100 ++++++++++++++++++++++++++++++++++
 5 files changed, 215 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index abba872cb63f1430a49a2afbace4b9f9958c3991..5e0e4208ebe6c58a9ea0834e1ebb36abd2de06e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26415,6 +26415,8 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
+F:	drivers/media/v4l2-core/v4l2-isp.c
+F:	include/media/v4l2-isp.h
 F:	include/uapi/linux/media/v4l2-isp.h
 
 VF610 NAND DRIVER
diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 331b8e535e5bbf33f22638b2ae8bc764ad5fc407..d50ccac9733cc39a43426ae7e7996dd0b5b45186 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -82,3 +82,7 @@ config V4L2_CCI_I2C
 	depends on I2C
 	select REGMAP_I2C
 	select V4L2_CCI
+
+config V4L2_ISP
+	tristate
+	depends on VIDEOBUF2_CORE
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 2177b9d63a8ffc1127c5a70118249a2ff63cd759..329f0eadce994cc1c8580beb435f68fa7e2a7aeb 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
 obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
+obj-$(CONFIG_V4L2_ISP) += v4l2-isp.o
 obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
 obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
 obj-$(CONFIG_V4L2_VP9) += v4l2-vp9.o
diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
new file mode 100644
index 0000000000000000000000000000000000000000..e350bdaf53b5502e1ec2a4989c20df1100ab2d2a
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Video4Linux2 generic ISP parameters and statistics support
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+
+#include <media/videobuf2-core.h>
+#include <media/v4l2-isp.h>
+
+int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
+				size_t max_size)
+{
+	size_t header_size = offsetof(struct v4l2_params_buffer, data);
+	struct v4l2_params_buffer *buffer = vb2_plane_vaddr(vb, 0);
+	size_t payload_size = vb2_get_plane_payload(vb, 0);
+	size_t buffer_size;
+
+	/* Payload size can't be greater than the destination buffer size */
+	if (payload_size > max_size) {
+		dev_dbg(dev, "Payload size is too large: %zu\n", payload_size);
+		return -EINVAL;
+	}
+
+	/* Payload size can't be smaller than the header size */
+	if (payload_size < header_size) {
+		dev_dbg(dev, "Payload size is too small: %zu\n", payload_size);
+		return -EINVAL;
+	}
+
+	/* Validate the size reported in the parameter buffer header */
+	buffer_size = header_size + buffer->data_size;
+	if (buffer_size != payload_size) {
+		dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
+			buffer_size, payload_size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_params_buffer_validate);
+
+int v4l2_params_blocks_validate(struct device *dev,
+				const struct v4l2_params_buffer *buffer,
+				const struct v4l2_params_handler *handlers,
+				size_t num_handlers)
+{
+	size_t block_offset = 0;
+	size_t buffer_size;
+
+	/* Walk the list of parameter blocks and validate them. */
+	buffer_size = buffer->data_size;
+	while (buffer_size >= sizeof(struct v4l2_params_block_header)) {
+		const struct v4l2_params_handler *handler;
+		const struct v4l2_params_block_header *block;
+
+		/* Validate block sizes and types against the handlers. */
+		block = (const struct v4l2_params_block_header *)
+			(buffer->data + block_offset);
+
+		if (block->type >= num_handlers) {
+			dev_dbg(dev, "Invalid parameters block type\n");
+			return -EINVAL;
+		}
+
+		if (block->size > buffer_size) {
+			dev_dbg(dev, "Premature end of parameters data\n");
+			return -EINVAL;
+		}
+
+		/* It's invalid to specify both ENABLE and DISABLE. */
+		if ((block->flags & (V4L2_PARAMS_FL_BLOCK_ENABLE |
+				     V4L2_PARAMS_FL_BLOCK_DISABLE)) ==
+		     (V4L2_PARAMS_FL_BLOCK_ENABLE |
+		     V4L2_PARAMS_FL_BLOCK_DISABLE)) {
+			dev_dbg(dev, "Invalid parameters block flags\n");
+			return -EINVAL;
+		}
+
+		/*
+		 * Match the block reported size against the handler's expected
+		 * one, but allow the block to only contain the header in
+		 * case it is going to be disabled.
+		 */
+		handler = &handlers[block->type];
+		if (block->size != handler->size &&
+		    (!(block->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) ||
+		    block->size != sizeof(*block))) {
+			dev_dbg(dev, "Invalid parameters block size\n");
+			return -EINVAL;
+		}
+
+		block_offset += block->size;
+		buffer_size -= block->size;
+	}
+
+	if (buffer_size) {
+		dev_dbg(dev, "Unexpected data after the parameters buffer end\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_params_blocks_validate);
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
new file mode 100644
index 0000000000000000000000000000000000000000..2ad62c6169eef3d0fb8d245de56cc6bd7e6227e4
--- /dev/null
+++ b/include/media/v4l2-isp.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Video4Linux2 generic ISP parameters and statistics support
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+ */
+
+#ifndef V4L2_PARAMS_H_
+#define V4L2_PARAMS_H_
+
+#include <linux/media/v4l2-isp.h>
+
+struct device;
+struct vb2_buffer;
+
+/**
+ * typedef v4l2_params_block_handler - V4L2 extensible format block handler
+ * @arg: pointer the driver-specific argument
+ * @block: the ISP configuration block to handle
+ *
+ * Defines the function signature of the functions that handle an ISP block
+ * configuration.
+ */
+typedef void (*v4l2_params_block_handler)(void *arg,
+					  const struct v4l2_params_block_header *block);
+
+/**
+ * struct v4l2_params_handler - V4L2 extensible format handler
+ * @size: the block expected size
+ * @handler: the block handler function
+ *
+ * The v4l2_params_handler defines the type that driver making use of the
+ * V4L2 extensible parameters shall use to define their own ISP block
+ * handlers.
+ *
+ * Drivers shall prepare a list of handlers, one for each supported ISP block
+ * and correctly populate the structure's field with the expected block @size
+ * (used for validation) and a pointer to each block @handler function.
+ */
+struct v4l2_params_handler {
+	size_t size;
+	v4l2_params_block_handler handler;
+};
+
+/**
+ * v4l2_params_buffer_validate - Validate a V4L2 extensible parameters buffer
+ * @dev: the driver's device pointer
+ * @vb: the videobuf2 buffer
+ * @max_size: the maximum allowed buffer size
+ * @buffer_validate: callback to the driver-specific buffer validation
+ *
+ * Helper function that performs validation of an extensible parameters buffer.
+ *
+ * The helper is meant to be used by drivers to perform validation of the
+ * extensible parameters buffer size correctness.
+ *
+ * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
+ * against @max_size and its validated to be large enough to accommodate at
+ * least one ISP configuration block. The effective buffer size is compared
+ * with the reported data size to make sure they match.
+ *
+ * Drivers should use this function to validate the buffer size correctness
+ * before performing a copy of the user-provided videobuf2 buffer content into a
+ * kernel-only memory buffer to prevent userspace from modifying the buffer
+ * content after it has been submitted to the driver.
+ */
+int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
+				size_t max_size);
+
+/**
+ * v4l2_params_blocks_validate - Validate V4L2 extensible parameters ISP
+ *				 configuration blocks
+ * @dev: the driver's device pointer
+ * @buffer: the extensible parameters configuration buffer
+ * @handlers: the list of block handlers
+ * @num_handlers: the number of block handlers
+ *
+ * Helper function that performs validation of the ISP configuration blocks in
+ * an extensible parameters buffer.
+ *
+ * The helper is meant to be used by drivers to perform validation of the
+ * ISP configuration data blocks. For each block in the extensible parameters
+ * buffer, its size and correctness are validated against its associated handler
+ * in the @handlers list.
+ *
+ * Drivers should use this function to validate the ISP configuration blocks
+ * after having validated the correctness of the vb2 buffer sizes by using the
+ * v4l2_params_buffer_validate() helper first. Once the buffer size has been
+ * validated, drivers should perform a copy of the user-provided buffer into a
+ * kernel-only memory buffer to prevent userspace from modifying the buffer
+ * content after it has been submitted to the driver, and then call this
+ * function to perform per-block validation.
+ */
+int v4l2_params_blocks_validate(struct device *dev,
+				const struct v4l2_params_buffer *buffer,
+				const struct v4l2_params_handler *handlers,
+				size_t num_handlers);
+
+#endif /* V4L2_PARAMS_H_ */

-- 
2.51.0


