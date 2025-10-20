Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84738CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnILWF1pktJPUB0eCXF7r9IMycjcsNR+f7mqmfp+Tr4=; b=AIlP9PoNUJEvnGBQasF/hPBnT2
	ccXjU8ZA7aMAULx0qLVZYEWPf/3EWt1AjqAi2/HAZH01Jr/7oSKH9pWerdmenTOMe7IwxxB7Ftaxs
	8wPbY4cGGNYz+MKkT/D61emP6aYVg60FEQmFVih++cixfmp4hGc6XMApEuMw/6wB/mgw+adojl1A+
	+qO1s1bGo7SYOG/50BdI6jsEdVzyPm5yAb94l08k39CvyRrihKgF7tysHRWniiJ6Arl/bVMx5KIbg
	mMERLgKD4vYp12ln/NTK0efq2efggPoa7HJomD34DS+5P3bTJBZNc3hZDoQFw4aj0SbK3VEPipuAD
	7EqTE02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlCR-0000000CLyg-3ZtN;
	Mon, 20 Oct 2025 08:25:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlCO-0000000CLvr-3ydD;
	Mon, 20 Oct 2025 08:25:02 +0000
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8669F1116;
	Mon, 20 Oct 2025 10:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760948596;
	bh=Hf+mZVh/21OUTmvHUpHmYMXcMyGNzYqP900JsER1oH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ojklEwlhYOqITshz00TVK0juS1OgjQHxBPpcMCZktghSARYMLdVpArGGU0zyguug3
	 yNCr3xk9LXIUsldkmT0CqsjLQe9cI5AsbuY/vyc6yE8+2trImmRQ2kMefwcM/Rd04y
	 GxPSGhSYftIG0VhWMcl0aMzcwNiE3oOvbKPnToGc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 20 Oct 2025 10:24:47 +0200
Subject: [PATCH v8 1/8] media: uapi: Introduce V4L2 generic ISP types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-extensible-parameters-validation-v8-1-afba4ba7b42d@ideasonboard.com>
References: <20251020-extensible-parameters-validation-v8-0-afba4ba7b42d@ideasonboard.com>
In-Reply-To: <20251020-extensible-parameters-validation-v8-0-afba4ba7b42d@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6398;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Hf+mZVh/21OUTmvHUpHmYMXcMyGNzYqP900JsER1oH0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo9fHX8D+twJn48EIwve+Jbu+M5/6sKEm0nl4uE
 EuR8+S+Z3CJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaPXx1wAKCRByNAaPFqFW
 PDlXD/9QXQKgF8/QaKK3apST+wAmtomhqqny2ZnSWi192RvOt8Fly10F9RnCYce0fXcRJPEr2EJ
 Vki6yE4u/2Cn3OM2J2R22/r1f8zjj2LcDAE5NoJo2QkOc9viNLtJwgj8tscEF01WprShMJ1yOqr
 f9sosL6CqRvb5uErFFdWqTcZZECSzbkR0jy59/UG1i32dyTamvBJHb7Md0aYrIuRNT8BQP6J+FP
 pNTcHyzHHUmeel9XwiyJ+gkbCyEJI4GEYPTLA/E+UmtV3TnjgsuXsUnp5g02teWy+MQqQHFb5Ji
 KWB5wzRJN+bnVV/XYmRbXCtiAHwVOHRfNUrI/VTm2Qz7Qtmko5QfB17xjsIrULIgCEBasiymf0E
 Ayxv3TtMm7oe+BCzUJWtYbt9E0zEZjh/cJirncmmgLUBeOHzzTK7rxLaQ7yb7eed8IaDX0oGVVw
 3PjRGY/BcMyOIedf4ArP6s7dw7ZzPj942DJHYKSsGNTlYrmjiReIY7w/epeaeeHmAc7LQV2qUwr
 ZdzUqUOtmRFTV092sxqWR0AJ160Z+z1xvnA4YoEZzDicftKq1D1ewgRl/DQNsSUZMBLjBhXBJdt
 ObPAkADBZVGr5yJd1IhgIa3Y7nIN9yRsf+Nq3UitZbOhqp/HCjX5hnzWN5CyMckWGXTJE8xKb0S
 e6gvfpZUZp4ZJdQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_012501_139013_C3CEB19E 
X-CRM114-Status: GOOD (  22.32  )
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
and will be extended in the future with support for generic ISP statistics
formats.

Generic ISP parameters support is provided by introducing two new
types that represent an extensible and versioned buffer of ISP
configuration parameters.

The v4l2_params_buffer represents the container for the ISP
configuration data block. The generic type is defined with a 0-sized
data member that the ISP driver implementations shall properly size
according to their capabilities. The v4l2_params_block_header structure
represents the header to be prepend to each ISP configuration block.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 MAINTAINERS                         |   6 +++
 include/uapi/linux/media/v4l2-isp.h | 102 ++++++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f7351fced572eff0a18038095ec1724047890b55..d925745077f21e5a1388a30217a24beeb4fff3b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26852,6 +26852,12 @@ F:	drivers/media/i2c/vd55g1.c
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
index 0000000000000000000000000000000000000000..779168f9058e3bcf6451f681e247d34d95676cc0
--- /dev/null
+++ b/include/uapi/linux/media/v4l2-isp.h
@@ -0,0 +1,102 @@
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
+/**
+ * enum v4l2_isp_params_version - V4L2 ISP parameters versioning
+ *
+ * @V4L2_ISP_PARAMS_VERSION_V0: First version of the V4L2 ISP parameters format
+ *				(for compatibility)
+ * @V4L2_ISP_PARAMS_VERSION_V1: First version of the V4L2 ISP parameters format
+ *
+ * V0 and V1 are identical in order to support drivers compatible with the V4L2
+ * ISP parameters format already upstreamed which use either 0 or 1 as their
+ * versioning identifier. Both V0 and V1 refers to the first version of the
+ * V4L2 ISP parameters format.
+ *
+ * Future revisions of the V4L2 ISP parameters format should start from the
+ * value of 2.
+ */
+enum v4l2_isp_params_version {
+	V4L2_ISP_PARAMS_VERSION_V0 = 0,
+	V4L2_ISP_PARAMS_VERSION_V1
+};
+
+#define V4L2_ISP_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
+#define V4L2_ISP_PARAMS_FL_BLOCK_ENABLE		(1U << 1)
+
+/*
+ * Reserve the first 8 bits for V4L2_ISP_PARAMS_FL_* flag.
+ *
+ * Driver-specific flags should be defined as:
+ * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
+ * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(1))
+ */
+#define V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(n)       ((n) + 8)
+
+/**
+ * struct v4l2_isp_params_block_header - V4L2 extensible parameters block header
+ * @type: The parameters block type (driver-specific)
+ * @flags: A bitmask of block flags (driver-specific)
+ * @size: Size (in bytes) of the parameters block, including this header
+ *
+ * This structure represents the common part of all the ISP configuration
+ * blocks. Each parameters block shall embed an instance of this structure type
+ * as its first member, followed by the block-specific configuration data.
+ *
+ * The @type field is an ISP driver-specific value that identifies the block
+ * type. The @size field specifies the size of the parameters block.
+ *
+ * The @flags field is a bitmask of per-block flags V4L2_PARAMS_ISP_FL_* and
+ * driver-specific flags specified by the driver header.
+ */
+struct v4l2_isp_params_block_header {
+	__u16 type;
+	__u16 flags;
+	__u32 size;
+} __attribute__((aligned(8)));
+
+/**
+ * struct v4l2_isp_params_buffer - V4L2 extensible parameters configuration
+ * @version: The parameters buffer version (driver-specific)
+ * @data_size: The configuration data effective size, excluding this header
+ * @data: The configuration data
+ *
+ * This structure contains the configuration parameters of the ISP algorithms,
+ * serialized by userspace into a data buffer. Each configuration parameter
+ * block is represented by a block-specific structure which contains a
+ * :c:type:`v4l2_isp_params_block_header` entry as first member. Userspace
+ * populates the @data buffer with configuration parameters for the blocks that
+ * it intends to configure. As a consequence, the data buffer effective size
+ * changes according to the number of ISP blocks that userspace intends to
+ * configure and is set by userspace in the @data_size field.
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
+ * in between. Userspace shall populate the @data_size field with the effective
+ * size, in bytes, of the @data buffer.
+ */
+struct v4l2_isp_params_buffer {
+	__u32 version;
+	__u32 data_size;
+	__u8 data[] __counted_by(data_size);
+};
+
+#endif /* _UAPI_V4L2_ISP_H_ */

-- 
2.51.0


