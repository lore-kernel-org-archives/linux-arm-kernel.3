Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9F9CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 21:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY1oo1i6xqwMEWS0AIaRnzYYPXrxbVaKGxJT0KKoFKM=; b=sw5Nl+w3CH/saFVV5smU/Tps79
	QbZo++rGD1EceiqzOx3wMHetX5+KOT1PCw67XzksS+A8dmnLB3AqG4Dhwe/XkXCipCk6FVwvUGcL1
	V9BjSgzycb0JJaDy7AnaRvjw4IaRQfN21KlKtgzaGaYGONwSXW6JAwhymleSEpdBz6PGXxCWha+ex
	NUmaddlojPmXm30Eymh1GaoA4wnma1s4x5CDWsWHmBm5gHy83OArAYK3G2PsPquRu4VU21uIsz1Z8
	KCpfJ4pUjAkpJudOYJxdV+s7chUKMBRjPh/g/zz4zdwtK75N2D6CAojOgpDWopsQwAZdLKTtvzuOv
	dgvPZD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTtC-0000000BdZh-1EwK;
	Tue, 19 Aug 2025 21:29:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNjm-0000000AocH-0q2W;
	Tue, 19 Aug 2025 14:54:59 +0000
Received: from [192.168.1.106] (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3D772F8A;
	Tue, 19 Aug 2025 16:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755615239;
	bh=J5eSElXXeku9ICNAMtSj+V7RX5KH1v+WgaLna1Zype4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mzOYIQP8SawFMmw0E20G9oKCFyrFfUqWbhryxBx3hdGZatsbuFnpqAgUrfuD8WTxo
	 ropA72KKGaGyMNJ08AuZV7JQTRaFdDy6DynSetwQi1BNyQk7S/j9Z7WeEUgBvCx+yn
	 hty0HhKR3GeyXQzzBHZcAdjIwzP8vkLmrZLfz6ac=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 19 Aug 2025 16:54:43 +0200
Subject: [PATCH v3 2/8] media: uapi: Convert RkISP1 to V4L2 extensible
 params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-extensible-parameters-validation-v3-2-9dc008348b30@ideasonboard.com>
References: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
In-Reply-To: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6996;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=J5eSElXXeku9ICNAMtSj+V7RX5KH1v+WgaLna1Zype4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBopJA7qu5yHHqr5fjFWHq3AtpZjsnjmBaIp7dEo
 vX0C5OzrkeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKSQOwAKCRByNAaPFqFW
 PGM0D/46IHYoD2XBkpZGNUgm3vfwT3w2zTFnV7BO2zWmVYLBrkbVftFXFuCApzi0ZNVSJvPNjll
 w1Y1r+hTENuwjHbxpEVbK0yZ5KvXs2KWI+wOpOq74QKe4cY6CwHDX9m+8llyOwc45Ezm5YpBtO9
 7bhaUNjYeoyLO7STVZ1A9X+InZBnej/EjKeZKYlAvR5dZG+BLnMdj3/ByOzXn8NW3uSXjpAOYHx
 jbqZAJ+oa2o0sNNApZFi1vRWIEryHxo3BHAVCQZ0c1ij7dWKmbn7I9gJESiWgdUu7Ylsxm7TsCc
 Oyg/r3BW4d5KcLa9i+XjPk6fE4nJ7bmBw4dVXbE7P7niWYhHyfchOdNNb/PA/orRkPCwhrt6cKi
 4PjIB1JxGCQ+1AdjfPw61psvdUvGhwcSKYw3jlES2EszTSgIILlDXuOemV2ZoK9AYUO/1nWjpO0
 gnkBeYa6FGJgNJKVadmL1or5LvqHl+K5pLpncUSgW/Ll0qe4X68CkaZwvou0rMfef3wC1y6oQV8
 tIyNL6eIO1HQqwqf5AGCuIGtAFGOWl8dzVyLklHZ6Z3DBlSrw6BJUOxkqrnbfuYHMGAljX0UdP6
 PMqLnWhSCmWATaEoYZx1R6vWchZTcobUowSZTF1cHPDIm4XTOX6VPivkNDrcgQNkl6wr6yS9YXD
 WzTpcETiz8n+LmA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_075458_390182_28F791D9 
X-CRM114-Status: GOOD (  27.18  )
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

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/linux/rkisp1-config.h | 67 +++++++++++++-------------------------
 1 file changed, 23 insertions(+), 44 deletions(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 3b060ea6eed71b87d79abc8401eae4e9c9f5323a..fc040c7fb13cf18eaf8d9067e7be38bff120e6f6 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -7,8 +7,13 @@
 #ifndef _UAPI_RKISP1_CONFIG_H
 #define _UAPI_RKISP1_CONFIG_H
 
+#ifdef __KERNEL__
+#include <linux/build_bug.h>
+#endif /* __KERNEL__ */
 #include <linux/types.h>
 
+#include <linux/media/v4l2-extensible-params.h>
+
 /* Defect Pixel Cluster Detection */
 #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
 /* Black Level Subtraction */
@@ -1158,26 +1163,21 @@ enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
 };
 
-#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
-#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
+#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	V4L2_PARAMS_FL_BLOCK_DISABLE
+#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	V4L2_PARAMS_FL_BLOCK_ENABLE
 
 /* A bitmask of parameters blocks supported on the current hardware. */
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
+ * blocks and is identical to :c:type:`v4l2_params_block_header`.
  *
- * The @type field is one of the values enumerated by
+ * The type field is one of the values enumerated by
  * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
- * interpreted by the driver. The @size field specifies the size of the
+ * interpreted by the driver. The size field specifies the size of the
  * parameters block and is used by the driver for validation purposes.
  *
  * The @flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
@@ -1193,14 +1193,14 @@ enum rkisp1_ext_params_block_type {
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
@@ -1220,17 +1220,8 @@ enum rkisp1_ext_params_block_type {
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
+#define rkisp1_ext_params_block_header v4l2_params_block_header
 
 /**
  * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
@@ -1594,21 +1585,7 @@ enum rksip1_ext_param_buffer_version {
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
@@ -1624,11 +1601,6 @@ enum rksip1_ext_param_buffer_version {
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
@@ -1678,4 +1650,11 @@ struct rkisp1_ext_params_cfg {
 	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
 };
 
+#ifdef __KERNEL__
+/* Make sure the header is type-convertible to the generic v4l2 params one */
+static_assert((sizeof(struct rkisp1_ext_params_cfg) -
+	      RKISP1_EXT_PARAMS_MAX_SIZE) ==
+	      sizeof(struct v4l2_params_buffer));
+#endif /* __KERNEL__ */
+
 #endif /* _UAPI_RKISP1_CONFIG_H */

-- 
2.50.1


