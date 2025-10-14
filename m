Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED575CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bY+MNgYxtAcwJSbmZXSuZHjQkvXsDpNiHtbUbQagEGg=; b=ytFx9gQBMZGU+6JEJJ0//9SWc3
	TBwXpOwIF6b8ZS5ysgm4boCOpnewGqEIXLxI18aSOl28IzYZva5DMwVs5nN2FvxD0uO9tRNjvkwnv
	r9kQBBl5k2l4U+osarpf+N21UKdeK0B+n7sT3hicnX/jgqf/78ESlSApHOSLnvzVgVXUazfTTvnuf
	VaCMHnCf1pdtgkzMz78i5yG0CIVM2qDSYcgvWnuenONQzIyTfyMMMiIU1+QFejGAbsGf71GO4RW7j
	FrqzPhZb9SI50S/ICJtpsKTc/XGTCNeuaTVhulXjwSKPk/Xx7qM9VP8CnwKuVjm6aI3rmdo+h+Hm2
	Mz5V8WwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZyR-0000000FX7z-1yub;
	Tue, 14 Oct 2025 08:01:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZyE-0000000FWqB-1vxl;
	Tue, 14 Oct 2025 08:01:25 +0000
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A147F09;
	Tue, 14 Oct 2025 09:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760428776;
	bh=OgIwRrIQRBzj9481fixzaM0BqZmrVQNqE/YGhNXZuhM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WhYQdKBDqyIDe9z6V90qjkc9KGo8+n21u/GaY/0DuY7lrGJnWyvL+cMGSCFGbJC7o
	 j5cMh3brXilFCyvaaTxIGkvaSUHlI+87vGlAHyO1SHbhFQcWOWoaK7LzrE8XOJ1gER
	 WlVoQgIznElPxDdYUU5wJqmdrvLNWQ8HQwFoWets=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 14 Oct 2025 10:00:57 +0200
Subject: [PATCH v7 5/8] media: v4l2-core: Introduce v4l2-isp.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-extensible-parameters-validation-v7-5-6628bed5ca98@ideasonboard.com>
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10784;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=OgIwRrIQRBzj9481fixzaM0BqZmrVQNqE/YGhNXZuhM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7gNGhTryvD51w90R5q4GhmavpkW7sKKiONRjO
 F2jI1DmR/GJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO4DRgAKCRByNAaPFqFW
 PDoYD/4rEnrYB1kWwfaDEJO9Jo7wlez4y9700w0u3iXMevxDQVmFVNW02snLjW4Xe8MjHZJxpCr
 qknA5my0HbODHXEvuPuOHUwF/IB6V2N1GBVD2WepUM5nuC33lRKkKFGZnUlDfqOmaLWNoPIYpIp
 05kg4GeAi6TeKduCiwJ9S6q0ILWhmZVXRyypxJ0z/3S2H14GhEdVB9lFYsM645/BSCEkPnJMrKS
 DklvpuzfmhoLWRIwM2lvX7XKLizjwb/Vft/l//Qj27YiTAcOxiHC9qWKPDv0Z/Tje5GkuGvLik+
 DEPdNWkiNjs4ch5TfweD06PA+ubIsnhK2NTALHbw2HPZghA8jWPX2+YBNF4s32ZlLrA3kUanvsC
 I315iMcHL2rI46JO4amqBS4RHKQLZQfQNFd5v9Zcve2JeT61gsYIKbowUzowiG3LbUNMPF/okFE
 6WFPayrcJbRo+5A1yqEttl9bL7QOkUEeozQUhbsGgkk7TvVOVz4jH5fB79IAWIDYFwduEhowjZM
 ZCFpp9bjFPhcDlxcQEV+cJdZZ6jIMjddEffhXCGQV8CtPQzfF/hBfshB3VzG/iXPZ7zs+xS8cWi
 mYShRuMbA7X8NMQNMd956/GUIA+ayNJ2MfhgssBem5aFiq7ZE32RNBqenACyJta28geLZBDuF+s
 gz/kR8WVbtvmbqQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_010122_648273_2527F7A0 
X-CRM114-Status: GOOD (  29.20  )
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

Add to the V4L2 framework helper functions to support drivers when
validating a buffer of V4L2 ISP parameters.

Driver shall use v4l2_isp_params_validate_buffer_size() to verify the
size correctness of the data received from userspace, and after having
copied the data to a kernel-only memory location, complete the
validation by calling v4l2_isp_params_validate_buffer().

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 MAINTAINERS                        |   2 +
 drivers/media/v4l2-core/Kconfig    |   4 ++
 drivers/media/v4l2-core/Makefile   |   1 +
 drivers/media/v4l2-core/v4l2-isp.c | 128 +++++++++++++++++++++++++++++++++++++
 include/media/v4l2-isp.h           |  91 ++++++++++++++++++++++++++
 5 files changed, 226 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 340353334299cd5eebf1f72132b7e91b6f5fdbfe..59ab4a34f72c0430a8d7966942acb2242ad923ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26858,6 +26858,8 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
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
index 0000000000000000000000000000000000000000..35f0b701f1729c3c0ccc34b1c89189b179e0b684
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Video4Linux2 generic ISP parameters and statistics support
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+ */
+
+#include <media/v4l2-isp.h>
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+
+#include <media/videobuf2-core.h>
+
+int v4l2_isp_params_validate_buffer_size(struct device *dev,
+					 struct vb2_buffer *vb,
+					 size_t max_size)
+{
+	size_t header_size = offsetof(struct v4l2_isp_params_buffer, data);
+	size_t payload_size = vb2_get_plane_payload(vb, 0);
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
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer_size);
+
+int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
+				    const struct v4l2_isp_params_buffer *buffer,
+				    const struct v4l2_isp_params_block_info *info,
+				    size_t num_blocks)
+{
+	size_t header_size = offsetof(struct v4l2_isp_params_buffer, data);
+	size_t payload_size = vb2_get_plane_payload(vb, 0);
+	size_t block_offset = 0;
+	size_t buffer_size;
+
+	/*
+	 * Currently only the first version of the V4L2 ISP parameters format is
+	 * supported. We accept both V0 and V1 to support existing drivers
+	 * compatible with V4L2 ISP that use either 0 or 1 as their "first
+	 * version" identifiers.
+	 */
+	if (buffer->version != V4L2_ISP_PARAMS_VERSION_V0 &&
+	    buffer->version != V4L2_ISP_PARAMS_VERSION_V1) {
+		dev_dbg(dev,
+			"Unsupported V4L2 ISP parameters format version: %u\n",
+			buffer->version);
+		return -EINVAL;
+	}
+
+	/* Validate the size reported in the header */
+	buffer_size = header_size + buffer->data_size;
+	if (buffer_size != payload_size) {
+		dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
+			buffer_size, payload_size);
+		return -EINVAL;
+	}
+
+	/* Walk the list of ISP configuration blocks and validate them. */
+	buffer_size = buffer->data_size;
+	while (buffer_size >= sizeof(struct v4l2_isp_params_block_header)) {
+		const struct v4l2_isp_params_block_info *block_info;
+		const struct v4l2_isp_params_block_header *block;
+
+		block = (const struct v4l2_isp_params_block_header *)
+			(buffer->data + block_offset);
+
+		if (block->type >= num_blocks) {
+			dev_dbg(dev,
+				"Invalid block type %u at offset %zu\n",
+				block->type, block_offset);
+			return -EINVAL;
+		}
+
+		if (block->size > buffer_size) {
+			dev_dbg(dev, "Premature end of parameters data\n");
+			return -EINVAL;
+		}
+
+		/* It's invalid to specify both ENABLE and DISABLE. */
+		if ((block->flags & (V4L2_ISP_PARAMS_FL_BLOCK_ENABLE |
+				     V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)) ==
+		     (V4L2_ISP_PARAMS_FL_BLOCK_ENABLE |
+		     V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)) {
+			dev_dbg(dev, "Invalid block flags %x at offset %zu\n",
+				block->flags, block_offset);
+			return -EINVAL;
+		}
+
+		/*
+		 * Match the block reported size against the info provided
+		 * one, but allow the block to only contain the header in
+		 * case it is going to be disabled.
+		 */
+		block_info = &info[block->type];
+		if (block->size != block_info->size &&
+		    (!(block->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) ||
+		    block->size != sizeof(*block))) {
+			dev_dbg(dev,
+				"Invalid block size %u (expected %zu) at offset %zu\n",
+				block->size, block_info->size, block_offset);
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
+EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer);
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
new file mode 100644
index 0000000000000000000000000000000000000000..8b4695663699e7f176384739cf54ed7fa2c578f8
--- /dev/null
+++ b/include/media/v4l2-isp.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Video4Linux2 generic ISP parameters and statistics support
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+ */
+
+#ifndef _V4L2_ISP_H_
+#define _V4L2_ISP_H_
+
+#include <linux/media/v4l2-isp.h>
+
+struct device;
+struct vb2_buffer;
+
+/**
+ * v4l2_isp_params_buffer_size - Calculate size of v4l2_isp_params_buffer
+ * @max_params_size: The total size of the ISP configuration blocks
+ *
+ * Users of the v4l2 extensible parameters will have differing sized data arrays
+ * depending on their specific parameter buffers. Drivers and userspace will
+ * need to be able to calculate the appropriate size of the struct to
+ * accommodate all ISP configuration blocks provided by the platform.
+ * This macro provides a convenient tool for the calculation.
+ */
+#define v4l2_isp_params_buffer_size(max_params_size) \
+	(offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
+
+/**
+ * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
+ * @dev: the driver's device pointer
+ * @vb: the videobuf2 buffer
+ * @max_size: the maximum allowed buffer size
+ *
+ * This function performs validation of the size of a V4L2 ISP parameters buffer
+ * before the driver can access the actual data buffer content.
+ *
+ * After the sizes validation, drivers should copy the buffer content to a
+ * kernel-only memory area to prevent userspace from modifying it,
+ * before completing validation using v4l2_isp_params_validate_buffer().
+ *
+ * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
+ * against @max_size and it's validated to be large enough to accommodate at
+ * least one ISP configuration block.
+ */
+int v4l2_isp_params_validate_buffer_size(struct device *dev,
+					 struct vb2_buffer *vb,
+					 size_t max_size);
+
+/**
+ * struct v4l2_isp_params_block_info - V4L2 ISP per-block info
+ * @size: the block expected size
+ *
+ * The v4l2_isp_params_block_info collects information of the ISP configuration
+ * blocks for validation purposes. It currently only contains the expected
+ * block size.
+ *
+ * Drivers shall prepare a list of block info, indexed by block type, one for
+ * each supported ISP block and correctly populate them with the expected block
+ * size.
+ */
+struct v4l2_isp_params_block_info {
+	size_t size;
+};
+
+/**
+ * v4l2_isp_params_validate_buffer - Validate a V4L2 ISP parameters buffer
+ * @dev: the driver's device pointer
+ * @vb: the videobuf2 buffer
+ * @buffer: the V4L2 ISP parameters buffer
+ * @info: the list of per-block validation info
+ * @num_blocks: the number of blocks
+ *
+ * This function completes the validation of a V4L2 ISP parameters buffer,
+ * verifying each configuration block correctness before the driver can use
+ * them to program the hardware.
+ *
+ * Drivers should use this function after having validated the correctness of
+ * the vb2 buffer sizes by using the v4l2_isp_params_validate_buffer_size()
+ * helper first. Once the buffer size has been validated, drivers should
+ * perform a copy of the user provided buffer into a kernel-only memory buffer
+ * to prevent userspace from modifying its content after it has been submitted
+ * to the driver, and then call this function to complete validation.
+ */
+int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
+				    const struct v4l2_isp_params_buffer *buffer,
+				    const struct v4l2_isp_params_block_info *info,
+				    size_t num_blocks);
+
+#endif /* _V4L2_ISP_H_ */

-- 
2.51.0


