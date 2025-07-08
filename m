Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD06C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 11:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1SMcXL3ckPdAsDlCh4F1xEHukPBgnI6B/Rdif9gNeA=; b=iAMrqG6Hz/tlndHEWQMF1qjTon
	ueFaPYWgqCagFtSoUuamGMZefB9V5PR8qssOHQ2pl/VrYRjZGFCvtmbL2m8OLm+zQ5kgYyFJJTOr9
	is7vH64s+aqlWAq56LghSACE3mVnp2l/xLiYpRTSffWSrmGfEFjs4QfM0j/rdZCDyma6ZywEPfNL9
	PVu7gnWmGNmB7L88T8zEGNK6EvqpxGR6pxagGhHaZkos4Qd6twWL9kis7HurtPux+eyJbSq2LRNGB
	uxTAyg1Zg/7HiBvE85cqtTA2ivy0CiLHCJYLxA3rKK/dp+c88qV+ARR4jR7q8qUgwrIhdMBOmgGiB
	Z7Q/L1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ68d-0000000596S-3dZW;
	Tue, 08 Jul 2025 11:05:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5l9-000000055ZO-35LB;
	Tue, 08 Jul 2025 10:41:14 +0000
Received: from [192.168.0.172] (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 136BA1BAF;
	Tue,  8 Jul 2025 12:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751971240;
	bh=XwAActjfS4nOKs1fzm6HK5dbJXzBj0DHHjKJDlSxOY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SSNGuGeBEc8QrUmlMEAFY/5QS+GwdIqLi3O70eJ1fWhihs+skEEYDyjF7Oxr4HvLW
	 0tbhbj7WdZmPtuGUX8wMsLkKrZ7JVIayOFvYaBtNMSiwnTJQd0tnbkpKKrcBTCtnq2
	 hW8io2ES6+qrlgHkEundmllfPJ58mayPfN+/3sqs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 08 Jul 2025 12:40:49 +0200
Subject: [PATCH 2/8] media: uapi: Convert RkISP1 to V4L2 extensible params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-extensible-parameters-validation-v1-2-9fc27c9c728c@ideasonboard.com>
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
In-Reply-To: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6501;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=XwAActjfS4nOKs1fzm6HK5dbJXzBj0DHHjKJDlSxOY0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBobPXA/XSVnScdHok55ezv/agTY1NJfgWShsoZK
 0YmMzPByPWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaGz1wAAKCRByNAaPFqFW
 PHdUEACAatG5wcPTQUMVpaHoum7Uzwq9fPyF+p83SKUDIquu+077MBZBsjYhZ2Znu/7tE2FYwbi
 os/fZpfv3hpCTkYzrXqP7qoFxufqG75vW0lRiwhLghhDWOLH0QClzpAVY7d3hfXx392n5Cfu2+C
 neFZHrOEoAv0plURe49HSEsMgaXZyzM8Tt+8Wka9EfHPdSmBylZh87EBIBoMaby9h9ATwSwBfjZ
 zo1xoi/GsLwIOWRmqZTiSMCdsucd5G+V4ReAeyWcDjrwE+dVkB6ABOoPpNgvRdlfDMRoH7NNt9D
 46sLGBEx9vIK4y1wUk8S8IEJ0iRkR/KMp0L84wVs3B16BgPxJ1t+ZpCSWm1ny+2z0XggI8ktMcs
 y3iLi029VTVS15gzTm3usKKr7Mb1MVkV79yjCEc60EopvepSO/Krbs5hz1VOK0JbmdSD+qtpYlq
 wusHf2ewiCarn0InTvsPvrIbTZ04FRK7LACukkmoveR7eYNtEdZLg4NMBxX0I7yrjSD//25b9yv
 GnNCI0JbIN0XKdaS3uEzupQuMOqfrW1WIZVlFEEfoO7pIVlY0wrkAqME9IFCjv9RMIHhpuEWvYj
 fGqZWbtKriR4bgJadLxpoPduuVKpI30u3J0JmhWaZddr5NBskh2AfDRDnQfbNnfp+JbVTcQ3US9
 CoAZQB2TOKMpEBQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_034111_921980_6953984A 
X-CRM114-Status: GOOD (  26.85  )
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
format, convert the rkisp1-config.h header to use the new types.

Factor-out the documentation that is now part of the common header
and only keep the driver-specific on in place.

The conversion to use common types doesn't impact userspace as the
new types are either identical to the ones already existing in the
RkISP1 uAPI or are 1-to-1 type convertible.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/linux/rkisp1-config.h | 60 ++++++++++++--------------------------
 1 file changed, 18 insertions(+), 42 deletions(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 3b060ea6eed71b87d79abc8401eae4e9c9f5323a..fe58ff1aed15b0497a9a9fa9a0bfa1ede3889d3e 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -7,8 +7,12 @@
 #ifndef _UAPI_RKISP1_CONFIG_H
 #define _UAPI_RKISP1_CONFIG_H
 
+#include <linux/build_bug.h>
 #include <linux/types.h>
 
+#define _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
+#include <linux/media/v4l2-extensible-params.h>
+
 /* Defect Pixel Cluster Detection */
 #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
 /* Black Level Subtraction */
@@ -1165,19 +1169,14 @@ enum rkisp1_ext_params_block_type {
 #define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS	(V4L2_CID_USER_RKISP1_BASE + 0x01)
 
 /**
- * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
- *					   header
+ * rkisp1_ext_params_block_header - RkISP1 extensible parameters block header
  *
  * This structure represents the common part of all the ISP configuration
- * blocks. Each parameters block shall embed an instance of this structure type
- * as its first member, followed by the block-specific configuration data. The
- * driver inspects this common header to discern the block type and its size and
- * properly handle the block content by casting it to the correct block-specific
- * type.
+ * blocks and is identical to :c:type:`v4l2_params_block`.
  *
- * The @type field is one of the values enumerated by
+ * The type field is one of the values enumerated by
  * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
- * interpreted by the driver. The @size field specifies the size of the
+ * interpreted by the driver. The size field specifies the size of the
  * parameters block and is used by the driver for validation purposes.
  *
  * The @flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
@@ -1193,14 +1192,14 @@ enum rkisp1_ext_params_block_type {
  * If a new configuration of an ISP block has to be applied userspace shall
  * fully populate the ISP block configuration and omit setting the
  * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits
- * in the @flags field.
+ * in the flags field.
  *
  * Setting both the RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and
- * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the @flags field is not allowed
+ * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the flags field is not allowed
  * and not accepted by the driver.
  *
  * Userspace is responsible for correctly populating the parameters block header
- * fields (@type, @flags and @size) and the block-specific parameters.
+ * fields (type, flags and size) and the block-specific parameters.
  *
  * For example:
  *
@@ -1220,17 +1219,8 @@ enum rkisp1_ext_params_block_type {
  *		bls->config.fixed_val.gb = blackLevelGreenB_;
  *		bls->config.fixed_val.b = blackLevelBlue_;
  *	}
- *
- * @type: The parameters block type, see
- *	  :c:type:`rkisp1_ext_params_block_type`
- * @flags: A bitmask of block flags
- * @size: Size (in bytes) of the parameters block, including this header
  */
-struct rkisp1_ext_params_block_header {
-	__u16 type;
-	__u16 flags;
-	__u32 size;
-};
+#define rkisp1_ext_params_block_header v4l2_params_block
 
 /**
  * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
@@ -1594,21 +1584,7 @@ enum rksip1_ext_param_buffer_version {
 /**
  * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
  *
- * This struct contains the configuration parameters of the RkISP1 ISP
- * algorithms, serialized by userspace into a data buffer. Each configuration
- * parameter block is represented by a block-specific structure which contains a
- * :c:type:`rkisp1_ext_params_block_header` entry as first member. Userspace
- * populates the @data buffer with configuration parameters for the blocks that
- * it intends to configure. As a consequence, the data buffer effective size
- * changes according to the number of ISP blocks that userspace intends to
- * configure and is set by userspace in the @data_size field.
- *
- * The parameters buffer is versioned by the @version field to allow modifying
- * and extending its definition. Userspace shall populate the @version field to
- * inform the driver about the version it intends to use. The driver will parse
- * and handle the @data buffer according to the data layout specific to the
- * indicated version and return an error if the desired version is not
- * supported.
+ * This is the driver-specific implementation of :c:type:`v4l2_params_buffer`.
  *
  * Currently the single RKISP1_EXT_PARAM_BUFFER_V1 version is supported.
  * When a new format version will be added, a mechanism for userspace to query
@@ -1624,11 +1600,6 @@ enum rksip1_ext_param_buffer_version {
  * the maximum value represents the blocks supported by the kernel driver,
  * independently of the device instance.
  *
- * For each ISP block that userspace wants to configure, a block-specific
- * structure is appended to the @data buffer, one after the other without gaps
- * in between nor overlaps. Userspace shall populate the @data_size field with
- * the effective size, in bytes, of the @data buffer.
- *
  * The expected memory layout of the parameters buffer is::
  *
  *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
@@ -1678,4 +1649,9 @@ struct rkisp1_ext_params_cfg {
 	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
 };
 
+/* Make sure the header is type-convertible to the generic v4l2 params one */
+static_assert((sizeof(struct rkisp1_ext_params_cfg) -
+	       RKISP1_EXT_PARAMS_MAX_SIZE) ==
+	      sizeof(struct v4l2_params_buffer));
+
 #endif /* _UAPI_RKISP1_CONFIG_H */

-- 
2.49.0


