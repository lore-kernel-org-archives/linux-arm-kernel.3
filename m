Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41765C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzBNkC1LrICEdp72G1BYaNAZRdriqn0nQ8BzbvM7AnI=; b=ivay+ytTir2HaFeb4jZXh9LDjO
	r6Olj5NSgthfdvJPqnGRpvk/8jAL40vxiMqbYP+Ecn1E4scys+0dWcdYj0YQRERNjC2ZMW+pdFmLC
	tAResfvsoCzfQYV9nOKmtk/khJ+HJUNUXg7yoaT3ErqtKlWSlIQclDw6+VfvKi1lQZsq4Ut4127gb
	im/LeGC3+1CR2al0Ovh3KV8jR/VkBZ18hiZhPBYl2yg6nSwB4F14NRD30KQYv6FxJDT2KlNTJuUlV
	d/4y+IwxGaztEcnGQUUXCLTPCFEPp6YCgoIK6pbiEQCg8ywsIRqZHV4Cxx4LiIYV1y65bnDaXPsfR
	utLmv2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWy8L-00000008a7F-0BVx;
	Wed, 02 Jul 2025 14:08:21 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxPF-00000008Qy1-391o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ade5b8aab41so897617966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462504; x=1752067304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzBNkC1LrICEdp72G1BYaNAZRdriqn0nQ8BzbvM7AnI=;
        b=dbA/D/Fo82pyRQ/js9a0aF0GKmr81wJFcv1sFFN1T8+0oj7TddfBuDPLJeFjdU3k0Y
         x++H8rl7EcfzTpjqy9hWZMPQjey4uVTkpPptVk+z7BGh1ALOykivgyKLtAnFlvUknW3y
         gJ0249EbUMwT44QmxvgCguWpwTaEqG+St5fEZDC3OOTRab9YWo7+zRD5gzie3+NwbJYO
         zbXssL5wZzEVSTwgJFOnzykC+gXWV9IgXmJ6NZU5jtSnJ0pxLPyZWc33dqF5GiBZFZrD
         QldHbGvmo1HLhKpnhyqzKmp/mrrW+1ic+aQTFD1ygwWsd1n/tvUWNM+m3GHyr+KVl/zo
         pXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462504; x=1752067304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzBNkC1LrICEdp72G1BYaNAZRdriqn0nQ8BzbvM7AnI=;
        b=OEZJrEnhugzej7xCJg/sCy96IrEI+NVR6e9Pj7JY7Pz/UiWt36NoFrCbeutFsB14Eu
         SvCFFpCARmtJw8zYSuHprxet+T+Nwtgad7uns70Aa6FBsnJhfneDJ90Us9qjReNLx7xq
         rS3YfA5KMVCXY2mMGo9oDsCPobDb/O3ZTVr7bsUaEFDaT7CgcXj8NtvM+h+sZkJHjvpW
         yFGjiMI3s0dbnmAKK4ZJhQ5uAM0NOapE1hfIcmLjlnpaaiHRBlIZoF9A4S2naOEqBAJ5
         bR2lzNi7YnWHBQzRg1A9owUMHo8oiuv8NtSxlQhsj32jSVUMbEA2NVeSc6nVDOSyIt0H
         64xg==
X-Forwarded-Encrypted: i=1; AJvYcCXjPpGMCAw0EdxJoDQSWh8059x0M5R57RBV46bzUd/1YXh7Nogx+RljrQO78vyWnyNOe00cxpcGz5UfKJU3baCo@lists.infradead.org
X-Gm-Message-State: AOJu0YzOOWh+HaFYvhQSbg+wvxgo5IoMDY71tmLw58Tsin4Qw1ajgbxV
	+mvhJjsAOkDpzsrC4yGOv7r1bzFvcSGEcy57qL4495VTeGSavwztLq9X
X-Gm-Gg: ASbGncui195jGpohexoekd8Z/fZP2Z3D4yOdvzgZfs+oBQepC1nFG3js9hp3CkqOj7K
	dZ/KjXIYGVGOLCQbE2wCjrrie5/PgyltG+LCpoFdQ393VkHNRdZ0srHB1Q3vYl+O4j8uBxL5Mdv
	jyTo7Rtu0uIjGuTC98LoTGZJ6OIWrKpYOCYKE5NLFTKX6l2F6Gunl8t8KZLdPDgFXcsw6fnT2Y2
	w2t4nCgH57kkD2TBsHq3XCGnoBlQ7zrIonPOZ0TGu5cXfaUZvqiXwWMlJ7SvmGZX9Uff5faJthd
	Ey5j/LHvmlP1NDgR81/TlUK6NXOfV6WOYtD0MSbE0corc4GylPBgZJ/i7mmtGSR7W58BRb4er0o
	=
X-Google-Smtp-Source: AGHT+IGmH+d+rJqdg7lcNzB3/fwDYNsWBYq6muddgYXHLvA0iF1uj2AkmeLO7/yU0aO2dA31B/VMrQ==
X-Received: by 2002:a17:906:d7e1:b0:ae0:aed9:eba0 with SMTP id a640c23a62f3a-ae3c2ceef09mr281682366b.55.1751462503903;
        Wed, 02 Jul 2025 06:21:43 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:43 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 15/24] media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
Date: Wed,  2 Jul 2025 16:20:41 +0300
Message-ID: <20250702132104.1537926-16-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062145_959633_6887FF38 
X-CRM114-Status: GOOD (  30.72  )
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

These drivers are meant to be used as a common framework for Maxim
GMSL2/3 serializers and deserializers.

This framework enables support for the following new features across
all the chips:
 * Full Streams API support
 * .get_frame_desc()
 * .get_mbus_config()
 * I2C ATR
 * automatic GMSL link version negotiation
 * automatic stream id selection
 * automatic VC remapping
 * automatic pixel mode / tunnel mode selection
 * automatic double mode selection / data padding
 * logging of internal state and chip status registers via .log_status()
 * PHY modes
 * serializer pinctrl
 * TPG

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 MAINTAINERS                                 |   1 +
 drivers/media/i2c/Kconfig                   |   2 +
 drivers/media/i2c/Makefile                  |   1 +
 drivers/media/i2c/maxim-serdes/Kconfig      |  16 +
 drivers/media/i2c/maxim-serdes/Makefile     |   3 +
 drivers/media/i2c/maxim-serdes/max_serdes.c | 413 ++++++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_serdes.h | 183 +++++++++
 7 files changed, 619 insertions(+)
 create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
 create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 334195989c00..8cd57b66afe3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14769,6 +14769,7 @@ M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
+F:	drivers/media/i2c/maxim-serdes/
 
 MAXIM MAX11205 DRIVER
 M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4c199da6ea..f504016aadfd 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1700,6 +1700,8 @@ config VIDEO_MAX96717
 	  To compile this driver as a module, choose M here: the
 	  module will be called max96717.
 
+source "drivers/media/i2c/maxim-serdes/Kconfig"
+
 endmenu
 
 endif # VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 5873d29433ee..25a0093d40ec 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
 obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
 obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
 obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
+obj-$(CONFIG_VIDEO_MAXIM_SERDES) += maxim-serdes/
 obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
 obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
 obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/maxim-serdes/Kconfig
new file mode 100644
index 000000000000..cae1d5a1293e
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_MAXIM_SERDES
+	tristate "Maxim GMSL2/3 Serializer and Deserializer support"
+	depends on VIDEO_DEV
+	select I2C_ATR
+	select I2C_MUX
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This driver supports the Maxim GMSL2/3 common Serializer and
+	  Deserializer framework.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called max_serdes.
diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/maxim-serdes/Makefile
new file mode 100644
index 000000000000..630fbb486bab
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+max-serdes-objs := max_serdes.o
+obj-$(CONFIG_VIDEO_MAXIM_SERDES) += max-serdes.o
diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.c b/drivers/media/i2c/maxim-serdes/max_serdes.c
new file mode 100644
index 000000000000..73e018d1f0d2
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max_serdes.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/stringify.h>
+
+#include <media/mipi-csi2.h>
+
+#include <video/videomode.h>
+
+#include <uapi/linux/media-bus-format.h>
+
+#include "max_serdes.h"
+
+const char * const max_serdes_tpg_patterns[] = {
+	[MAX_SERDES_TPG_PATTERN_GRADIENT] = "Gradient",
+	[MAX_SERDES_TPG_PATTERN_CHECKERBOARD] = "Checkerboard",
+};
+
+static const char * const max_gmsl_versions[] = {
+	[MAX_SERDES_GMSL_2_3GBPS] = "GMSL2 3Gbps",
+	[MAX_SERDES_GMSL_2_6GBPS] = "GMSL2 6Gbps",
+	[MAX_SERDES_GMSL_3] = "GMSL3",
+};
+
+const char *max_serdes_gmsl_version_str(enum max_serdes_gmsl_version version)
+{
+	if (version > MAX_SERDES_GMSL_3)
+		return NULL;
+
+	return max_gmsl_versions[version];
+}
+
+static const char * const max_gmsl_mode[] = {
+	[MAX_SERDES_GMSL_PIXEL_MODE] = "pixel",
+	[MAX_SERDES_GMSL_TUNNEL_MODE] = "tunnel",
+};
+
+const char *max_serdes_gmsl_mode_str(enum max_serdes_gmsl_mode mode)
+{
+	if (mode > MAX_SERDES_GMSL_TUNNEL_MODE)
+		return NULL;
+
+	return max_gmsl_mode[mode];
+}
+
+static const struct max_serdes_mipi_format max_serdes_mipi_formats[] = {
+	{ MIPI_CSI2_DT_EMBEDDED_8B, 8 },
+	{ MIPI_CSI2_DT_YUV422_8B, 16 },
+	{ MIPI_CSI2_DT_YUV422_10B, 20 },
+	{ MIPI_CSI2_DT_RGB565, 16 },
+	{ MIPI_CSI2_DT_RGB666, 18 },
+	{ MIPI_CSI2_DT_RGB888, 24 },
+	{ MIPI_CSI2_DT_RAW8, 8 },
+	{ MIPI_CSI2_DT_RAW10, 10 },
+	{ MIPI_CSI2_DT_RAW12, 12 },
+	{ MIPI_CSI2_DT_RAW14, 14 },
+	{ MIPI_CSI2_DT_RAW16, 16 },
+};
+
+const struct max_serdes_mipi_format *max_serdes_mipi_format_by_dt(u8 dt)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(max_serdes_mipi_formats); i++)
+		if (max_serdes_mipi_formats[i].dt == dt)
+			return &max_serdes_mipi_formats[i];
+
+	return NULL;
+}
+
+int max_serdes_get_fd_stream_entry(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				   struct v4l2_mbus_frame_desc_entry *entry)
+{
+	struct v4l2_mbus_frame_desc fd;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, &fd);
+	if (ret)
+		return ret;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EOPNOTSUPP;
+
+	for (i = 0; i < fd.num_entries; i++) {
+		if (fd.entry[i].stream == stream) {
+			*entry = fd.entry[i];
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
+int max_serdes_get_fd_bpp(struct v4l2_mbus_frame_desc_entry *entry,
+			  unsigned int *bpp)
+{
+	const struct max_serdes_mipi_format *format;
+
+	format = max_serdes_mipi_format_by_dt(entry->bus.csi2.dt);
+	if (!format)
+		return -ENOENT;
+
+	*bpp = format->bpp;
+
+	return 0;
+}
+
+int max_serdes_process_bpps(struct device *dev, u32 bpps,
+			    u32 allowed_double_bpps, unsigned int *doubled_bpp)
+{
+	unsigned int min_bpp;
+	unsigned int max_bpp;
+	bool doubled = false;
+
+	if (!bpps)
+		return 0;
+
+	*doubled_bpp = 0;
+
+	/*
+	 * Hardware can double bpps 8, 10, 12, and it can pad bpps < 16
+	 * to another bpp <= 16:
+	 * Hardware can only stream a single constant bpp up to 24.
+	 *
+	 * From these features and limitations, the following rules
+	 * can be deduced:
+	 *
+	 * A bpp of 8 can always be doubled if present.
+	 * A bpp of 10 can be doubled only if there are no other bpps or the
+	 * only other bpp is 20.
+	 * A bpp of 12 can be doubled only if there are no other bpps or the
+	 * only other bpp is 24.
+	 * Bpps <= 16 cannot coexist with bpps > 16.
+	 * Bpps <= 16 need to be padded to the biggest bpp.
+	 */
+
+	min_bpp = __ffs(bpps);
+	max_bpp = __fls(bpps);
+
+	if (min_bpp == 8) {
+		doubled = true;
+	} else if (min_bpp == 10 || min_bpp == 12) {
+		u32 bpp_or_double = BIT(min_bpp) | BIT(min_bpp * 2);
+		u32 other_bpps = bpps & ~bpp_or_double;
+
+		if (!other_bpps)
+			doubled = true;
+	}
+
+	if (doubled && (allowed_double_bpps & BIT(min_bpp))) {
+		*doubled_bpp = min_bpp;
+		bpps &= ~BIT(min_bpp);
+		bpps |= BIT(min_bpp * 2);
+	}
+
+	min_bpp = __ffs(bpps);
+	max_bpp = __fls(bpps);
+
+	if (max_bpp > 24) {
+		dev_err(dev, "Cannot stream bpps > 24\n");
+		return -EINVAL;
+	}
+
+	if (min_bpp <= 16 && max_bpp > 16) {
+		dev_err(dev, "Cannot stream bpps <= 16 with bpps > 16\n");
+		return -EINVAL;
+	}
+
+	if (max_bpp > 16 && min_bpp != max_bpp) {
+		dev_err(dev, "Cannot stream multiple bpps when one is > 16\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int max_serdes_xlate_enable_disable_streams(struct max_serdes_source *sources,
+					    u32 source_sink_pad_offset,
+					    const struct v4l2_subdev_state *state,
+					    u32 pad, u64 updated_streams_mask,
+					    u32 sink_pad_start, u32 num_sink_pads,
+					    bool enable)
+{
+	u32 failed_sink_pad;
+	int ret;
+	u32 i;
+
+	for (i = sink_pad_start; i < sink_pad_start + num_sink_pads; i++) {
+		u64 matched_streams_mask = updated_streams_mask;
+		u64 updated_sink_streams_mask;
+		struct max_serdes_source *source;
+
+		updated_sink_streams_mask =
+			v4l2_subdev_state_xlate_streams(state, pad, i,
+							&matched_streams_mask);
+		if (!updated_sink_streams_mask)
+			continue;
+
+		source = &sources[i + source_sink_pad_offset];
+		if (!source)
+			continue;
+
+		if (enable)
+			ret = v4l2_subdev_enable_streams(source->sd, source->pad,
+							 updated_sink_streams_mask);
+		else
+			ret = v4l2_subdev_disable_streams(source->sd, source->pad,
+							  updated_sink_streams_mask);
+		if (ret) {
+			failed_sink_pad = i;
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	for (i = sink_pad_start; i < failed_sink_pad; i++) {
+		u64 matched_streams_mask = updated_streams_mask;
+		u64 updated_sink_streams_mask;
+		struct max_serdes_source *source;
+
+		updated_sink_streams_mask =
+			v4l2_subdev_state_xlate_streams(state, pad, i,
+							&matched_streams_mask);
+		if (!updated_sink_streams_mask)
+			continue;
+
+		source = &sources[i + source_sink_pad_offset];
+		if (!source)
+			continue;
+
+		if (!enable)
+			v4l2_subdev_enable_streams(source->sd, source->pad,
+						   updated_sink_streams_mask);
+		else
+			v4l2_subdev_disable_streams(source->sd, source->pad,
+						    updated_sink_streams_mask);
+	}
+
+	return ret;
+}
+
+int max_serdes_get_streams_masks(struct device *dev,
+				 const struct v4l2_subdev_state *state,
+				 u32 pad, u64 updated_streams_mask,
+				 u32 num_pads, u64 *old_streams_masks,
+				 u64 **new_streams_masks, bool enable)
+{
+	u64 *streams_masks;
+	unsigned int i;
+
+	streams_masks = devm_kcalloc(dev, num_pads, sizeof(*streams_masks), GFP_KERNEL);
+	if (!streams_masks)
+		return -ENOMEM;
+
+	for (i = 0; i < num_pads; i++) {
+		u64 matched_streams_mask = updated_streams_mask;
+		u64 updated_sink_streams_mask;
+
+		updated_sink_streams_mask =
+			v4l2_subdev_state_xlate_streams(state, pad, i,
+							&matched_streams_mask);
+		if (!updated_sink_streams_mask)
+			continue;
+
+		streams_masks[i] = old_streams_masks[i];
+		if (enable)
+			streams_masks[i] |= updated_sink_streams_mask;
+		else
+			streams_masks[i] &= ~updated_sink_streams_mask;
+	}
+
+	if (enable)
+		streams_masks[pad] |= updated_streams_mask;
+	else
+		streams_masks[pad] &= ~updated_streams_mask;
+
+	*new_streams_masks = streams_masks;
+
+	return 0;
+}
+
+static const struct videomode max_serdes_tpg_pixel_videomodes[] = {
+	{
+		.pixelclock = 25000000,
+		.hactive = 640,
+		.hfront_porch = 10,
+		.hsync_len = 96,
+		.hback_porch = 40,
+		.vactive = 480,
+		.vfront_porch = 2,
+		.vsync_len = 24,
+		.vback_porch = 24,
+	},
+	{
+		.pixelclock = 75000000,
+		.hactive = 1920,
+		.hfront_porch = 88,
+		.hsync_len = 44,
+		.hback_porch = 148,
+		.vactive = 1080,
+		.vfront_porch = 4,
+		.vsync_len = 16,
+		.vback_porch = 36,
+	},
+	{
+		.pixelclock = 150000000,
+		.hactive = 1920,
+		.hfront_porch = 88,
+		.hsync_len = 44,
+		.hback_porch = 148,
+		.vactive = 1080,
+		.vfront_porch = 4,
+		.vsync_len = 16,
+		.vback_porch = 36,
+	},
+};
+
+static void max_serdes_get_vm_timings(const struct videomode *vm,
+				      struct max_serdes_tpg_timings *timings)
+{
+	u32 hact = vm->hactive;
+	u32 hfp = vm->hfront_porch;
+	u32 hsync = vm->hsync_len;
+	u32 hbp = vm->hback_porch;
+	u32 htot = hact + hfp + hbp + hsync;
+
+	u32 vact = vm->vactive;
+	u32 vfp = vm->vfront_porch;
+	u32 vsync = vm->vsync_len;
+	u32 vbp = vm->vback_porch;
+	u32 vtot = vact + vfp + vbp + vsync;
+
+	*timings = (struct max_serdes_tpg_timings) {
+		.gen_vs = true,
+		.gen_hs = true,
+		.gen_de = true,
+		.vs_inv = true,
+		.vs_dly = 0,
+		.vs_high = vsync * htot,
+		.vs_low = (vact + vfp + vbp) * htot,
+		.v2h = 0,
+		.hs_high = hsync,
+		.hs_low = hact + hfp + hbp,
+		.hs_cnt = vact + vfp + vbp + vsync,
+		.v2d = htot * (vsync + vbp) + (hsync + hbp),
+		.de_high = hact,
+		.de_low = hfp + hsync + hbp,
+		.de_cnt = vact,
+		.clock = vm->pixelclock,
+		.fps = DIV_ROUND_CLOSEST(vm->pixelclock, vtot * htot),
+	};
+}
+
+int max_serdes_get_tpg_timings(const struct max_serdes_tpg_entry *entry,
+			       struct max_serdes_tpg_timings *timings)
+{
+	u32 fps;
+
+	if (!entry)
+		return 0;
+
+	fps = DIV_ROUND_CLOSEST(1 * entry->interval.denominator,
+				entry->interval.numerator);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(max_serdes_tpg_pixel_videomodes); i++) {
+		struct max_serdes_tpg_timings vm_timings;
+		const struct videomode *vm;
+
+		vm = &max_serdes_tpg_pixel_videomodes[i];
+
+		max_serdes_get_vm_timings(vm, &vm_timings);
+
+		if (vm->hactive == entry->width &&
+		    vm->vactive == entry->height &&
+		    vm_timings.fps == fps) {
+			*timings = vm_timings;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(max_serdes_get_tpg_timings);
+
+int max_serdes_validate_tpg_routing(struct v4l2_subdev_krouting *routing)
+{
+	const struct v4l2_subdev_route *route;
+
+	if (routing->num_routes != 1)
+		return -EINVAL;
+
+	route = &routing->routes[0];
+
+	if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+		return -EINVAL;
+
+	if (route->sink_stream != MAX_SERDES_TPG_STREAM)
+		return -EINVAL;
+
+	return 0;
+}
+
+MODULE_DESCRIPTION("Maxim GMSL2 Serializer/Deserializer Driver");
+MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.h b/drivers/media/i2c/maxim-serdes/max_serdes.h
new file mode 100644
index 000000000000..fdd761fcd8b2
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max_serdes.h
@@ -0,0 +1,183 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#ifndef MAX_SERDES_H
+#define MAX_SERDES_H
+
+#include <linux/types.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-subdev.h>
+
+#define REG_SEQUENCE_2(reg, val) \
+	{ (reg),     ((val) >> 8) & 0xff }, \
+	{ (reg) + 1, ((val) >> 0) & 0xff }
+
+#define REG_SEQUENCE_3(reg, val) \
+	{ (reg),     ((val) >> 16) & 0xff }, \
+	{ (reg) + 1, ((val) >> 8)  & 0xff }, \
+	{ (reg) + 2, ((val) >> 0)  & 0xff }
+
+#define REG_SEQUENCE_3_LE(reg, val) \
+	{ (reg),     ((val) >> 0) & 0xff }, \
+	{ (reg) + 1, ((val) >> 8)  & 0xff }, \
+	{ (reg) + 2, ((val) >> 16)  & 0xff }
+
+#define field_get(mask, val) (((val) & (mask)) >> __ffs(mask))
+#define field_prep(mask, val) (((val) << __ffs(mask)) & (mask))
+
+#define MAX_SERDES_PHYS_MAX		4
+#define MAX_SERDES_STREAMS_NUM		4
+#define MAX_SERDES_VC_ID_NUM		4
+#define MAX_SERDES_TPG_STREAM		0
+
+#define MAX_SERDES_GRAD_INCR		4
+#define MAX_SERDES_CHECKER_COLOR_A	0x00ccfe
+#define MAX_SERDES_CHECKER_COLOR_B	0xa76a00
+#define MAX_SERDES_CHECKER_SIZE		60
+
+extern const char * const max_serdes_tpg_patterns[];
+
+enum max_serdes_gmsl_version {
+	MAX_SERDES_GMSL_MIN,
+	MAX_SERDES_GMSL_2_3GBPS = MAX_SERDES_GMSL_MIN,
+	MAX_SERDES_GMSL_2_6GBPS,
+	MAX_SERDES_GMSL_3,
+	MAX_SERDES_GMSL_MAX = MAX_SERDES_GMSL_3,
+};
+
+enum max_serdes_gmsl_mode {
+	MAX_SERDES_GMSL_PIXEL_MODE,
+	MAX_SERDES_GMSL_TUNNEL_MODE,
+};
+
+enum max_serdes_tpg_pattern {
+	MAX_SERDES_TPG_PATTERN_MIN,
+	MAX_SERDES_TPG_PATTERN_CHECKERBOARD = MAX_SERDES_TPG_PATTERN_MIN,
+	MAX_SERDES_TPG_PATTERN_GRADIENT,
+	MAX_SERDES_TPG_PATTERN_MAX = MAX_SERDES_TPG_PATTERN_GRADIENT,
+};
+
+struct max_serdes_phys_config {
+	unsigned int lanes[MAX_SERDES_PHYS_MAX];
+	unsigned int clock_lane[MAX_SERDES_PHYS_MAX];
+};
+
+struct max_serdes_phys_configs {
+	const struct max_serdes_phys_config *configs;
+	unsigned int num_configs;
+};
+
+struct max_serdes_i2c_xlate {
+	u8 src;
+	u8 dst;
+	bool en;
+};
+
+struct max_serdes_mipi_format {
+	u8 dt;
+	u8 bpp;
+};
+
+struct max_serdes_vc_remap {
+	u8 src;
+	u8 dst;
+};
+
+struct max_serdes_source {
+	struct v4l2_subdev *sd;
+	u16 pad;
+	struct fwnode_handle *ep_fwnode;
+
+	unsigned int index;
+};
+
+struct max_serdes_asc {
+	struct v4l2_async_connection base;
+	struct max_serdes_source *source;
+};
+
+struct max_serdes_tpg_entry {
+	u32 width;
+	u32 height;
+	struct v4l2_fract interval;
+	u32 code;
+	u8 dt;
+	u8 bpp;
+};
+
+#define MAX_TPG_ENTRY_640X480P60_RGB888 \
+	{ 640, 480, { 1, 60 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888, 24 }
+
+#define MAX_TPG_ENTRY_1920X1080P30_RGB888 \
+	{ 1920, 1080, { 1, 30 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888, 24 }
+
+#define MAX_TPG_ENTRY_1920X1080P60_RGB888 \
+	{ 1920, 1080, { 1, 60 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888, 24 }
+
+struct max_serdes_tpg_entries {
+	const struct max_serdes_tpg_entry *entries;
+	unsigned int num_entries;
+};
+
+struct max_serdes_tpg_timings {
+	bool gen_vs;
+	bool gen_hs;
+	bool gen_de;
+	bool vs_inv;
+	bool hs_inv;
+	bool de_inv;
+	u32 vs_dly;
+	u32 vs_high;
+	u32 vs_low;
+	u32 v2h;
+	u32 hs_high;
+	u32 hs_low;
+	u32 hs_cnt;
+	u32 v2d;
+	u32 de_high;
+	u32 de_low;
+	u32 de_cnt;
+	u32 clock;
+	u32 fps;
+};
+
+static inline struct max_serdes_asc *asc_to_max(struct v4l2_async_connection *asc)
+{
+	return container_of(asc, struct max_serdes_asc, base);
+}
+
+const char *max_serdes_gmsl_version_str(enum max_serdes_gmsl_version version);
+const char *max_serdes_gmsl_mode_str(enum max_serdes_gmsl_mode mode);
+
+const struct max_serdes_mipi_format *max_serdes_mipi_format_by_dt(u8 dt);
+
+int max_serdes_get_fd_stream_entry(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				   struct v4l2_mbus_frame_desc_entry *entry);
+
+int max_serdes_get_fd_bpp(struct v4l2_mbus_frame_desc_entry *entry,
+			  unsigned int *bpp);
+int max_serdes_process_bpps(struct device *dev, u32 bpps,
+			    u32 allowed_double_bpps, unsigned int *doubled_bpp);
+
+int max_serdes_xlate_enable_disable_streams(struct max_serdes_source *sources,
+					    u32 source_sink_pad_offset,
+					    const struct v4l2_subdev_state *state,
+					    u32 pad, u64 updated_streams_mask,
+					    u32 sink_pad_start, u32 num_sink_pads,
+					    bool enable);
+
+int max_serdes_get_streams_masks(struct device *dev,
+				 const struct v4l2_subdev_state *state,
+				 u32 pad, u64 updated_streams_mask,
+				 u32 num_pads, u64 *old_streams_masks,
+				 u64 **new_streams_masks, bool enable);
+
+int max_serdes_get_tpg_timings(const struct max_serdes_tpg_entry *entry,
+			       struct max_serdes_tpg_timings *timings);
+
+int max_serdes_validate_tpg_routing(struct v4l2_subdev_krouting *routing);
+
+#endif // MAX_SERDES_H
-- 
2.50.0


