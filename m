Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE494CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3GDMpG1Xl8dnTcsYC7o9/KBVC2SyBWUPNHv9NyslB8=; b=uO1WhAYdIeYJNw4d4TnEKmuD/V
	1gdRmhfZ8tE3VuexpdUFRh9M9c0i9PwGzNGwVjQ7SnlH1+kiYiabQ5/9Rcwc47OhTcG7K1BeNkxUv
	vs5JgMIgwKlqkkMXdu4Bc1AHAs3XjHk7nxm3TkhnuICeeF7NNDWtrQcPg3xIVPELyD2kqK7KhPJjX
	Ii9I/Qi2aLDW24HvTL+U3E+mF/a5/dUYndF6PUmKiKOGGhbRAhZjFE45cMytBVekHHD/aRl6TOf40
	kLkQi0r5kH8UhpxIFrYbtkBkqmxoWZWGJ6mwFKBuZvrE8cyo+I3b4WGog6IRO+sQEqwwE1hayf2IL
	vKI3bRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqg-00000005FQY-0Fg7;
	Mon, 15 Sep 2025 17:18:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqc-00000005FLL-2BOD;
	Mon, 15 Sep 2025 17:18:39 +0000
Received: from [192.168.0.172] (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4764DB0B;
	Mon, 15 Sep 2025 19:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757956639;
	bh=eeqsbZCxS9oe9L1PBM9quXHkAJpq21b3LpH/n1xUbZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vqEbV2Icbkt/gEUfjxXb7J9IJm4cOt3OyF6m7wYavDGtSfVa8zU2XOWta1yK1JK77
	 FRUsR4NHYJwIjkn0vN365XX899LDumqAs4DQ0jAWv0m0Lxi4y/NYr8sMoDSebI1r3r
	 5WuuOUW0YjlzKlo+sCvaFgCmDI8TEWKMGg7j8gjY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 15 Sep 2025 19:18:10 +0200
Subject: [PATCH v5 1/8] media: uapi: Introduce V4L2 generic ISP types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-extensible-parameters-validation-v5-1-e6db94468af3@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6349;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=eeqsbZCxS9oe9L1PBM9quXHkAJpq21b3LpH/n1xUbZk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoyEppg3cgUFxHN/uhJZUBUODkQMIKpvxbjLUSn
 PEFjY/K0/uJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaMhKaQAKCRByNAaPFqFW
 PFXKEACuiEUbycwT1V1OAqE/ehYJoqmpIumqQxqYwpPV2wbeRhbeJEZY+wWCo3KA1M/Iq+qNzUX
 gkFcVkow5Tsw3AgaeOwCP7yl6NlK5ixa4nBsyVvqjBk8WxX66Ke4XQRsI8b3TjXnmuRra0s5tB0
 I7nNaOqsSZgXigGyFIjbjgZOL2WVcezffXc/IZLpK/tzAkHVXzdkKCXWG2uSYXUpECfwITJAb67
 NfK5B5hDqstSsmkz4MaPwqGCmDfRT5pYOj0DgZdEVfuuzgSZYY7Rq2YE3xDzIpa5po+X8KgOoKw
 zTfmVhs4OuKTTJMiFJshEOuSrGmNbfTpKhy4mozR0mBhFfN4pz95rpWgMi+Qzen7Lgy1D6eMPlr
 BdsleRFbmvJdizH4pboRKxKMIJ0Wk7qcyhLAeVOgpriTx244ctCMkPhsk6K83oP+No+DnFQ2jf5
 wPLThdI5XLm85xqt51xMDtY2Xo66vmoROnRVuh6yDtMQMiR2dKP6HwfJbvjKQ3Au4GHsAVi+a1S
 cp4DLLodgAGpM/dghFek55rLKZMlhmeoCL1iCcGfQONkdu3bhnSAS1WFYQahD8gd6hCVH+z4pwg
 sX/jQkMnhJGPkp5jiCEMDHUXUbosBVuVqsXLoKa8SVC0Xl84V6mJOVLNvTeAmlhbRVZrLgOU1pa
 tS5vLyf0Qv7I9gQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_101838_719055_3798FE06 
X-CRM114-Status: GOOD (  22.65  )
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

Introduce v4l2-isp.h in the Linux kernel uAPI.

The header includes types for generic ISP configuration parameters
and will be extended in future with support for generic ISP statistics
formats.

Generic ISP parameters support is provided by introducing two new
types that represent an extensible and versioned buffer of ISP
configuration parameters.

The v4l2_params_block_header structure represents the header to be
prepend to each ISP configuration block and the v4l2_params_buffer type
represents the base type for the configuration parameters buffer.

The v4l2_params_buffer represents the container for the ISP
configuration data block. The generic type is defined with a 0-sized
data member that the ISP driver implementations shall properly size
according to their capabilities.

[Add v4l2_params_buffer_size()]
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 MAINTAINERS                         |   6 +++
 include/uapi/linux/media/v4l2-isp.h | 100 ++++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee8cb2db483f6a5e96b62b6f2edd05b1427b69f5..e82c3d0758d6033fe8fcd56ffde2c03c4319fd11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26410,6 +26410,12 @@ F:	drivers/media/i2c/vd55g1.c
 F:	drivers/media/i2c/vd56g3.c
 F:	drivers/media/i2c/vgxy61.c
 
+V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	include/uapi/linux/media/v4l2-isp.h
+
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
 L:	linux-mtd@lists.infradead.org
diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
new file mode 100644
index 0000000000000000000000000000000000000000..b838555dce2b290a14136ab09ea4d2dfdc95b26b
--- /dev/null
+++ b/include/uapi/linux/media/v4l2-isp.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Video4Linux2 generic ISP parameters and statistics support
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+ */
+
+#ifndef _UAPI_V4L2_ISP_H_
+#define _UAPI_V4L2_ISP_H_
+
+#include <linux/stddef.h>
+#include <linux/types.h>
+
+#define V4L2_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
+#define V4L2_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
+
+/*
+ * Reserve the first 8 bits for V4L2_PARAMS_FL_* flag.
+ *
+ * Driver-specific flags should be defined as:
+ * #define PLATFORM_SPECIFIC_FLAG0     ((1U << V4L2_PARAMS_FL_DRIVER_FLAGS(0))
+ * #define PLATFORM_SPECIFIC_FLAG1     ((1U << V4L2_PARAMS_FL_DRIVER_FLAGS(1))
+ */
+#define V4L2_PARAMS_FL_DRIVER_FLAGS(n)       ((n) + 8)
+
+/**
+ * struct v4l2_params_block_header - V4L2 extensible parameters block header
+ *
+ * This structure represents the common part of all the ISP configuration
+ * blocks. Each parameters block shall embed an instance of this structure type
+ * as its first member, followed by the block-specific configuration data. The
+ * driver inspects this common header to discern the block type and its size and
+ * properly handle the block content.
+ *
+ * The @type field is an ISP driver-specific value that identifies the block
+ * type. The @size field specifies the size of the parameters block.
+ *
+ * The @flags field is a bitmask of per-block flags V4L2_PARAMS_FL_* and
+ * driver-specific flags specified by the driver header.
+ *
+ * @type: The parameters block type (driver-specific)
+ * @flags: A bitmask of block flags (driver-specific)
+ * @size: Size (in bytes) of the parameters block, including this header
+ */
+struct v4l2_params_block_header {
+	__u16 type;
+	__u16 flags;
+	__u32 size;
+} __attribute__((aligned(8)));
+
+/**
+ * v4l2_params_buffer_size - Calculate size of v4l2_params_buffer for a platform
+ *
+ * Users of the v4l2 extensible parameters will have differing sized data arrays
+ * depending on their specific parameter buffers. Drivers and userspace will
+ * need to be able to calculate the appropriate size of the struct to
+ * accommodate all ISP configuration blocks provided by the platform.
+ * This macro provides a convenient tool for the calculation.
+ *
+ * @max_params_size: The total size of the ISP configuration blocks
+ */
+#define v4l2_params_buffer_size(max_params_size) \
+	(offsetof(struct v4l2_params_buffer, data) + (max_params_size))
+
+/**
+ * struct v4l2_params_buffer - V4L2 extensible parameters configuration
+ *
+ * This struct contains the configuration parameters of the ISP algorithms,
+ * serialized by userspace into a data buffer. Each configuration parameter
+ * block is represented by a block-specific structure which contains a
+ * :c:type:`v4l2_params_block_header` entry as first member. Userspace populates
+ * the @data buffer with configuration parameters for the blocks that it intends
+ * to configure. As a consequence, the data buffer effective size changes
+ * according to the number of ISP blocks that userspace intends to configure and
+ * is set by userspace in the @data_size field.
+ *
+ * The parameters buffer is versioned by the @version field to allow modifying
+ * and extending its definition. Userspace shall populate the @version field to
+ * inform the driver about the version it intends to use. The driver will parse
+ * and handle the @data buffer according to the data layout specific to the
+ * indicated version and return an error if the desired version is not
+ * supported.
+ *
+ * For each ISP block that userspace wants to configure, a block-specific
+ * structure is appended to the @data buffer, one after the other without gaps
+ * in between nor overlaps. Userspace shall populate the @data_size field with
+ * the effective size, in bytes, of the @data buffer.
+ *
+ * @version: The parameters buffer version (driver-specific)
+ * @data_size: The configuration data effective size, excluding this header
+ * @data: The configuration data
+ */
+struct v4l2_params_buffer {
+	__u32 version;
+	__u32 data_size;
+	__u8 data[] __counted_by(data_size);
+};
+
+#endif /* _UAPI_V4L2_ISP_H_ */

-- 
2.51.0


