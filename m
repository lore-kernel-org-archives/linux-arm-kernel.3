Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1447BCAC59C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WccaLEiIaDvqaYutuYcQHZr5FDSFXi1LYHeN2DiWnSI=; b=CrAP8T+7IbNWrpP69xHuI9j5zR
	imXKO3Du6DIKnHIVIZ9VnPxIkKgeaXrXEeeleDdpOWO1X+/zkIZBBGibE0Dp5uqStfjrcmjNC8c/B
	WHJyxwiU/oPvO2EqW6EgAlqPjQLRc659wNIIfeXIYEMT3acNMjjasDKaUwARuKoy7FBdbUyVZhv28
	HHxRrL9oebzrn6uhB6YsXyp/cpS9Nc/QQR6OZvS1YQo+vFkwhiqOpTLqTaIdtzEtYNAqLrmsKL6yP
	goY53C9QGHJW1gHeyh1zx4VJkcXKXgf5aTH3he/9Qz3OtYHizmOdLqBxdtYOd6EMCQeO0Ifcy6vEe
	AMODayZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqg-00000005FRz-3RFL;
	Mon, 15 Sep 2025 17:18:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqd-00000005FM1-1dqu;
	Mon, 15 Sep 2025 17:18:40 +0000
Received: from [192.168.0.172] (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62D571189;
	Mon, 15 Sep 2025 19:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757956640;
	bh=+cN0Nkg4synqsjTMriyb7/FljLTMktP0+zGLZo/1hjk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g2vN5oihFVCOz5jVLtWhN5k4dRsDVYNxb35Cemiw9e19kh9y82aKJWvWhwzRHMvRW
	 wTy1FmZXWLuTkYFvM0F9uCSMcnkMLY7W50iZmKMUgFixq/UQZuqDTpg3EVH0Zc8M+p
	 VlpI8EQ06kGMvBAGNrnKghcgRUgOhmNtaVWc1+f8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 15 Sep 2025 19:18:11 +0200
Subject: [PATCH v5 2/8] media: uapi: Convert RkISP1 to V4L2 extensible
 params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-extensible-parameters-validation-v5-2-e6db94468af3@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7688;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=+cN0Nkg4synqsjTMriyb7/FljLTMktP0+zGLZo/1hjk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoyEpp9AYbOOetgJMFAr+UmQHggPsgRFzpGIcSe
 pQW65Htmb+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaMhKaQAKCRByNAaPFqFW
 PPwxD/sFecl9kiDsc9xT3r4NpLVKSKWR1eJjTuL8hg9XPerpCs0e+864C9bZQEfSLLpoC5ng1Uf
 koF5obB5jSLwLZH1OfPCq4ojZrPluMrXDbfLpMUbvwS7IOeEElIOMAWREHI9GbNqH3FczJwtI5U
 ORz50BxgP1eeh5S7Ou3ZpB0+FhYlrZcnSfYew5cQ+PGiVqFuFbr1cesAaAGF2thlD+himFFRv0E
 pexk0ZEokAkDkARzAeURfo190bvwzCSF710Q+9e1WpDL8zYLwtNCY28N1cBPR7VEgsqHc7srGXC
 1sH8RfLfybm7joc7TwQDGorc8nz5KWyBgtv1iClffHphNjjMgQcIznc83uYGnWpxxbENmhngGVO
 ux8kLZDt/A6U3I0Tt9WVyPhwNj+fHV1NcJr4hY7fGWnjgvGctQulHF6U9ipbPf3QWKJcbpY9KsE
 3ydV2u+5+H1HE9K8cLCkdz785qkE4lc5OF8fa2Ek7OTTbgYqz1LFg0SwD5uc93JBsm1kb2K2iKe
 cSbppFWcoW7cX+CkBxMnhmM6TbK/8mgC2bbWEuUNI50gdrVpYiGhdFoGSozJJ8xB9Ma1tJ2EcyQ
 j8juHR1Bi70YwXRAsBBSIlPTqCPcS6nkxKBc7GYAP2jb4FDNIdvM4otMVqPIBh6Bl25nxG5KKdN
 pUuAVGbzSN0SxUw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_101839_592330_016CF6AC 
X-CRM114-Status: GOOD (  28.99  )
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
 include/uapi/linux/rkisp1-config.h | 104 ++++++++-----------------------------
 1 file changed, 22 insertions(+), 82 deletions(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 3b060ea6eed71b87d79abc8401eae4e9c9f5323a..b90d94d3a852fb0af0fe447649487e9e80aca795 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -7,8 +7,13 @@
 #ifndef _UAPI_RKISP1_CONFIG_H
 #define _UAPI_RKISP1_CONFIG_H
 
+#ifdef __KERNEL__
+#include <linux/build_bug.h>
+#endif /* __KERNEL__ */
 #include <linux/types.h>
 
+#include <linux/media/v4l2-isp.h>
+
 /* Defect Pixel Cluster Detection */
 #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
 /* Black Level Subtraction */
@@ -1158,79 +1163,26 @@ enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
 };
 
-#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
-#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
+/* For backward compatibility */
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
- * parameters block and is used by the driver for validation purposes.
- *
- * The @flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
- *
- * When userspace wants to configure and enable an ISP block it shall fully
- * populate the block configuration and set the
- * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE bit in the @flags field.
- *
- * When userspace simply wants to disable an ISP block the
- * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bit should be set in @flags field. The
- * driver ignores the rest of the block configuration structure in this case.
- *
- * If a new configuration of an ISP block has to be applied userspace shall
- * fully populate the ISP block configuration and omit setting the
- * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits
- * in the @flags field.
- *
- * Setting both the RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and
- * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the @flags field is not allowed
- * and not accepted by the driver.
- *
- * Userspace is responsible for correctly populating the parameters block header
- * fields (@type, @flags and @size) and the block-specific parameters.
- *
- * For example:
+ * interpreted by the driver.
  *
- * .. code-block:: c
- *
- *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
- *		struct rkisp1_ext_params_bls_config *bls =
- *			(struct rkisp1_ext_params_bls_config *)block;
- *
- *		bls->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
- *		bls->header.flags = RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE;
- *		bls->header.size = sizeof(*bls);
- *
- *		bls->config.enable_auto = 0;
- *		bls->config.fixed_val.r = blackLevelRed_;
- *		bls->config.fixed_val.gr = blackLevelGreenR_;
- *		bls->config.fixed_val.gb = blackLevelGreenB_;
- *		bls->config.fixed_val.b = blackLevelBlue_;
- *	}
- *
- * @type: The parameters block type, see
- *	  :c:type:`rkisp1_ext_params_block_type`
- * @flags: A bitmask of block flags
- * @size: Size (in bytes) of the parameters block, including this header
+ * The flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
  */
-struct rkisp1_ext_params_block_header {
-	__u16 type;
-	__u16 flags;
-	__u32 size;
-};
+#define rkisp1_ext_params_block_header v4l2_params_block_header
 
 /**
  * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
@@ -1594,21 +1546,7 @@ enum rksip1_ext_param_buffer_version {
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
@@ -1624,11 +1562,6 @@ enum rksip1_ext_param_buffer_version {
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
@@ -1678,4 +1611,11 @@ struct rkisp1_ext_params_cfg {
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
2.51.0


