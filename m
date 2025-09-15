Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B906CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HKaJ1l4BnTjSVgAEPeGBoxJASPRGDuJr6UwQE3zW+Q=; b=nIIK/9A0jZuUypO9LE7Ka3TDTj
	pCW/7iPGqL3/bLv++pjNDtG44X3O99S9xoUbHaTym/QhpViz0FLLYMbJeoLjdqqDWiwU9OyRkZztY
	m0DS0p6R8C6/sO3QlHb1Z+BVizUtvfPT576o4sWz8TQ/zvwqUAZ+ch/kX6AP/NkyLnSLNlSBqTiHR
	G7OIaOAvO5V6rrV8W2GXLQDEUFtGNwRduLccDbrRuTkNW9QcjZ/nDfmdKAMdHb4dQDQsS03V+sIfa
	0mBm7eEhO2nPAIa1w33cnQaK9dNCV3/8EFgduRwXBSrpNJEO942YoW71gpcnUQ2XPKvRbHOBiy/2/
	YQZPPcJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqk-00000005FWR-1SHW;
	Mon, 15 Sep 2025 17:18:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqe-00000005FMh-2Bpl;
	Mon, 15 Sep 2025 17:18:42 +0000
Received: from [192.168.0.172] (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C1261440;
	Mon, 15 Sep 2025 19:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757956641;
	bh=H/GK7lEJ75WVhR6Q9Jw/swR31Ip5Ixqo78+hkhaS8UA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ICbLOUYpWIwcf8FiOEvFc690wx6Gxe+ezST0K2ggX30cg4UFvGb25qFDn+Acax3Um
	 +0pueIu7zQa4Fh4YAVC2GRj1CnCcXP1Aju1zMxU1rLd8uZJy5Bukx1uyeDshnN3bod
	 eTu1+lhO9ivzR9TaTuUvEGdbMZdf3zkVdrdaS7uM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 15 Sep 2025 19:18:12 +0200
Subject: [PATCH v5 3/8] media: uapi: Convert Amlogic C3 to V4L2 extensible
 params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-extensible-parameters-validation-v5-3-e6db94468af3@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6329;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=H/GK7lEJ75WVhR6Q9Jw/swR31Ip5Ixqo78+hkhaS8UA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoyEpp7I+SZ05eJ7IuLT687k93D4ypGiijh92EC
 kmd1bfqTO2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaMhKaQAKCRByNAaPFqFW
 PFYVD/sFKmrEww0pDZddfzXP1UFuJN3ybT5PHFtj43CghT4xLdpw+yxo5TaMi7Mwg2VhI4mpk82
 DAtT/wZSXYOhGoCmzzpTkuXP5j4GlaBOk2v+eHhruztjcCYpfWU5z+hjyNTuTYb/Z8Mt9TFh1EK
 FPcevbxgJpDW4LrnhZHx6ghVHLS+qKBM2rIPo6IYJq+JSR/PnBcpP9y5+F0+wfJ9jFaITIsi1sH
 nojHtRe4w3VaNfs9Vx0+nk6EpEpP2X+2cvuO090+nBoymKsn7qGd4GKjU+KUELZabatJJxNuOvD
 bjjvdPvOC1RMOLKeX3N9H8bIktOcxzfNlkXaZg315+txD3VkQxJ7EGHMvWHiCjrqLBsykhsaZTq
 NxTWBGkkvWw4Ip9aI+nv5616v5n2W2XdFZHdqzmPI3YbgejrzGl3gbdaLL/w/Tj3bXVNkuay+U1
 /WO0dI5wnTLxkL+Zwy7si9KeZARtL+PTl6RK3BNvFpgy9EvWj+keJkTIvzXmaKG1c8gZvndFxWY
 jgj53DeovN6hfxSQNZH7ckarwm0NB5RSg/O9/Kxa4JLCTcm2YCf5cE4Npzp39mnmrlL6K1jGj9e
 vTDL8YvbTnRHqSr80pcaQMWmxS2wagPt2q/WH9KL0PfpTGIRxvYAwPvVphAZ7E7bpH+7F7jRvZ4
 YDqo2UFwpMZPuhQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_101840_736085_D030A919 
X-CRM114-Status: GOOD (  25.07  )
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

With the introduction of common types for extensible parameters
format, convert the c3-isp-config.h header to use the new types.

Factor-out the documentation that is now part of the common header
and only keep the driver-specific on in place.

The conversion to use common types doesn't impact userspace as the
new types are either identical to the ones already existing in the
C3 ISP uAPI or are 1-to-1 type convertible.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Keke Li <keke.li@amlogic.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/linux/media/amlogic/c3-isp-config.h | 86 ++++++------------------
 1 file changed, 20 insertions(+), 66 deletions(-)

diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
index ed085ea62a574932c7ad8d59d34b2c5c74a597d8..bf6de55b27a7d4d15effcca5525865650d9070fb 100644
--- a/include/uapi/linux/media/amlogic/c3-isp-config.h
+++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
@@ -6,8 +6,13 @@
 #ifndef _UAPI_C3_ISP_CONFIG_H_
 #define _UAPI_C3_ISP_CONFIG_H_
 
+#ifdef __KERNEL__
+#include <linux/build_bug.h>
+#endif /* __KERNEL__ */
 #include <linux/types.h>
 
+#include <linux/media/v4l2-isp.h>
+
 /*
  * Frames are split into zones of almost equal width and height - a zone is a
  * rectangular tile of a frame. The metering blocks within the ISP collect
@@ -176,62 +181,22 @@ enum c3_isp_params_block_type {
 	C3_ISP_PARAMS_BLOCK_SENTINEL
 };
 
-#define C3_ISP_PARAMS_BLOCK_FL_DISABLE (1U << 0)
-#define C3_ISP_PARAMS_BLOCK_FL_ENABLE (1U << 1)
+/* For backward compatibility */
+#define C3_ISP_PARAMS_BLOCK_FL_DISABLE	V4L2_PARAMS_FL_BLOCK_DISABLE
+#define C3_ISP_PARAMS_BLOCK_FL_ENABLE	V4L2_PARAMS_FL_BLOCK_ENABLE
 
 /**
  * struct c3_isp_params_block_header - C3 ISP parameter block header
  *
  * This structure represents the common part of all the ISP configuration
- * blocks. Each parameters block shall embed an instance of this structure type
- * as its first member, followed by the block-specific configuration data. The
- * driver inspects this common header to discern the block type and its size and
- * properly handle the block content by casting it to the correct block-specific
- * type.
  *
  * The @type field is one of the values enumerated by
  * :c:type:`c3_isp_params_block_type` and specifies how the data should be
- * interpreted by the driver. The @size field specifies the size of the
- * parameters block and is used by the driver for validation purposes. The
- * @flags field is a bitmask of per-block flags C3_ISP_PARAMS_FL*.
- *
- * When userspace wants to disable an ISP block the
- * C3_ISP_PARAMS_BLOCK_FL_DISABLED bit should be set in the @flags field. In
- * this case userspace may optionally omit the remainder of the configuration
- * block, which will be ignored by the driver.
- *
- * When a new configuration of an ISP block needs to be applied userspace
- * shall fully populate the ISP block and omit setting the
- * C3_ISP_PARAMS_BLOCK_FL_DISABLED bit in the @flags field.
- *
- * Userspace is responsible for correctly populating the parameters block header
- * fields (@type, @flags and @size) and the block-specific parameters.
- *
- * For example:
- *
- * .. code-block:: c
+ * interpreted by the driver.
  *
- *	void populate_pst_gamma(struct c3_isp_params_block_header *block) {
- *		struct c3_isp_params_pst_gamma *gamma =
- *			(struct c3_isp_params_pst_gamma *)block;
- *
- *		gamma->header.type = C3_ISP_PARAMS_BLOCK_PST_GAMMA;
- *		gamma->header.flags = C3_ISP_PARAMS_BLOCK_FL_ENABLE;
- *		gamma->header.size = sizeof(*gamma);
- *
- *		for (unsigned int i = 0; i < 129; i++)
- *			gamma->pst_gamma_lut[i] = i;
- *	}
- *
- * @type: The parameters block type from :c:type:`c3_isp_params_block_type`
- * @flags: A bitmask of block flags
- * @size: Size (in bytes) of the parameters block, including this header
+ * The flags field is a bitmask of per-block flags C3_ISP_PARAMS_FL_*.
  */
-struct c3_isp_params_block_header {
-	__u16 type;
-	__u16 flags;
-	__u32 size;
-};
+#define c3_isp_params_block_header v4l2_params_block_header
 
 /**
  * struct c3_isp_params_awb_gains - Gains for auto-white balance
@@ -498,26 +463,9 @@ struct c3_isp_params_blc {
 /**
  * struct c3_isp_params_cfg - C3 ISP configuration parameters
  *
- * This struct contains the configuration parameters of the C3 ISP
- * algorithms, serialized by userspace into an opaque data buffer. Each
- * configuration parameter block is represented by a block-specific structure
- * which contains a :c:type:`c3_isp_param_block_header` entry as first
- * member. Userspace populates the @data buffer with configuration parameters
- * for the blocks that it intends to configure. As a consequence, the data
- * buffer effective size changes according to the number of ISP blocks that
- * userspace intends to configure.
- *
- * The parameters buffer is versioned by the @version field to allow modifying
- * and extending its definition. Userspace should populate the @version field to
- * inform the driver about the version it intends to use. The driver will parse
- * and handle the @data buffer according to the data layout specific to the
- * indicated revision and return an error if the desired revision is not
- * supported.
- *
- * For each ISP block that userspace wants to configure, a block-specific
- * structure is appended to the @data buffer, one after the other without gaps
- * in between nor overlaps. Userspace shall populate the @total_size field with
- * the effective size, in bytes, of the @data buffer.
+ * This is the driver-specific implementation of :c:type:`v4l2_params_buffer`.
+ *
+ * Currently only C3_ISP_PARAM_BUFFER_V0 is supported.
  *
  * The expected memory layout of the parameters buffer is::
  *
@@ -561,4 +509,10 @@ struct c3_isp_params_cfg {
 	__u8 data[C3_ISP_PARAMS_MAX_SIZE];
 };
 
+#ifdef __KERNEL__
+/* Make sure the header is type-convertible to the generic v4l2 params one */
+static_assert((sizeof(struct c3_isp_params_cfg) - C3_ISP_PARAMS_MAX_SIZE) ==
+	      sizeof(struct v4l2_params_buffer));
+#endif /* __KERNEL__ */
+
 #endif

-- 
2.51.0


