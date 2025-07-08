Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B4DC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrasVy14+Z7KTzMD6dPj3uC782kdS2U9Je6k8p15nOg=; b=EpCtTwql8/uhPvprIzCFpr/4Ie
	QluL7d3UPGvK3yYijOmyAUlGLGitbcMV4cEnu5buVJ0KE3i68AyliPa5YNmFI0aMgHaIJHBm3j7Sd
	l05FJe8DXfWlRXWG8SmtplA/6xx1t6eh6LsHinv20iJVCIt/Eodd3TDvNcF1yxege5BlGKTqxWxB5
	gB6+B/FrwxS6FlFeOz1Mfdp26kIkwLYnhji7l6lHjSlqbaJT4BaAs2ypFqlM+vvf7V/NJpDRb0Sy/
	dulQVThHRg8lHV2SrCbnzaWbla9xxkPeCtDdKDIJQWBPNhWuOWT8J1Z/UBiKOVTyUVBncRQFJfPmQ
	wO9KqnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6MO-00000005AoM-0MPp;
	Tue, 08 Jul 2025 11:19:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5lD-000000055eD-323Q;
	Tue, 08 Jul 2025 10:41:17 +0000
Received: from [192.168.0.172] (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77105524E;
	Tue,  8 Jul 2025 12:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751971247;
	bh=N1RgivZg2OuBkITWbDCoQ3+nocE4wejuSYIZUHxvQ1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U6PsdwUO2N9eWrwe2aX/2JWGkhwSQ6nVZejdI42BfI/Cca6fR6U7L/CnuYOpDYu1A
	 0E1pY0BmlISBsy5vCMrdH7OJprlEZjNxm2nwqLjA6CS2WeW0E6cEEuyKtB0iOA8MrM
	 lx0Aq8LvVuEIivdPNSdgQJQIae2Np6BpLUTn26Zc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 08 Jul 2025 12:40:54 +0200
Subject: [PATCH 7/8] media: amlogic-c3: Use v4l2-params for validation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-extensible-parameters-validation-v1-7-9fc27c9c728c@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=17633;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=N1RgivZg2OuBkITWbDCoQ3+nocE4wejuSYIZUHxvQ1c=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBobPXACHC8/wG8qYjXEa/Ww6QH/bnp7Zuu0vU6v
 4wgW0JeH2CJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaGz1wAAKCRByNAaPFqFW
 PJW8EACJ/cmyIcoiGcT/DMeJ9bHXgq4Cnodx12oNlg9uwKFEBZnLS7vH99DxUeQiKWaDQV4A3tN
 xUR5i0MA8mSgYU4z9Q/E4Ruxdpf4kCV6fYWDMhXW9ylMjqHDn9ANHHb10EyOnsxqAJ/C0FbzKRC
 GKUzINU+5j5NIgbU0Dk+pKm+uRqNi3ntnrN9mSawFVZDxSJEj6ZCfgPentT7cxcAVVp+PQrLzas
 R8PWLlQuZ502tk698JubwUNxKOuwixKqxpcippwu5X/MQrShh1PDVlYf6A1sNuS8lswSFp72jQN
 zbNNuNfuMkUTSM2s+FMEywQdSLPRiuJEHmtmNNuuhZfe5yMkScgK0cqGT3OXOMhbYLnRwQfe3Sf
 7eX/TlJIel8I8XPynpkJB+m5K07w7EXyeMeWL1lu933vYiMy9lcuiYHiv/liSpHaTGF1UF/1tuE
 f1dDClM9MdMcXasWbW7DUjFe8P/8be8AVcuycr3JFdfMaZP+bBAC8ynpjTzNWez72D5MdElUxwB
 LWu+Ga07GBKYTUUj65Wj72eCw8JiAMyeNdHCqlaKRLwFPGmrWX4Qg22czDkQ+pVqWFBjOBESBRp
 hjagVuDLCQOc3FsMmJXvTgy0yK71bqQdrUtHgkipOOfQ4uLtmOvIDd9+7eG3JANda2TZqqsdAuC
 WZnoAwl+uHEC2nA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_034116_083776_6DEB413B 
X-CRM114-Status: GOOD (  18.50  )
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

Convert c3-ispa-params.c to use the new types fro block handlers
defined in v4l2-params.h and use the new helpers from v4l2-params.c
to remove boilerplate code from the driver.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 272 ++++++++-------------
 1 file changed, 103 insertions(+), 169 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index c80667dd766210d2b2e1ee60c8254a5814b9d81b..9555a657fd93e89c846df029af9de2745d2a5d7c 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -9,64 +9,25 @@
 
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
+#include <media/v4l2-params.h>
 #include <media/videobuf2-vmalloc.h>
 
 #include "c3-isp-common.h"
 #include "c3-isp-regs.h"
 
-/*
- * union c3_isp_params_block - Generalisation of a parameter block
- *
- * This union allows the driver to treat a block as a generic struct to this
- * union and safely access the header and block-specific struct without having
- * to resort to casting. The header member is accessed first, and the type field
- * checked which allows the driver to determine which of the other members
- * should be used.
- *
- * @header:		The shared header struct embedded as the first member
- *			of all the possible other members. This member would be
- *			accessed first and the type field checked to determine
- *			which of the other members should be accessed.
- * @awb_gains:		For header.type == C3_ISP_PARAMS_BLOCK_AWB_GAINS
- * @awb_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AWB_CONFIG
- * @ae_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AE_CONFIG
- * @af_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AF_CONFIG
- * @pst_gamma:		For header.type == C3_ISP_PARAMS_BLOCK_PST_GAMMA
- * @ccm:		For header.type == C3_ISP_PARAMS_BLOCK_CCM
- * @csc:		For header.type == C3_ISP_PARAMS_BLOCK_CSC
- * @blc:		For header.type == C3_ISP_PARAMS_BLOCK_BLC
- */
-union c3_isp_params_block {
-	struct c3_isp_params_block_header header;
-	struct c3_isp_params_awb_gains awb_gains;
-	struct c3_isp_params_awb_config awb_cfg;
-	struct c3_isp_params_ae_config ae_cfg;
-	struct c3_isp_params_af_config af_cfg;
-	struct c3_isp_params_pst_gamma pst_gamma;
-	struct c3_isp_params_ccm ccm;
-	struct c3_isp_params_csc csc;
-	struct c3_isp_params_blc blc;
-};
-
-typedef void (*c3_isp_block_handler)(struct c3_isp_device *isp,
-				     const union c3_isp_params_block *block);
-
-struct c3_isp_params_handler {
-	size_t size;
-	c3_isp_block_handler handler;
-};
-
 #define to_c3_isp_params_buffer(vbuf) \
 	container_of(vbuf, struct c3_isp_params_buffer, vb)
 
 /* Hardware configuration */
 
-static void c3_isp_params_cfg_awb_gains(struct c3_isp_device *isp,
-					const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_awb_gains(void *dev,
+					const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_awb_gains *awb_gains = &block->awb_gains;
+	const struct c3_isp_params_awb_gains *awb_gains =
+		(const struct c3_isp_params_awb_gains *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
 				   ISP_TOP_BEO_CTRL_WB_EN_MASK,
 				   ISP_TOP_BEO_CTRL_WB_DIS);
@@ -89,7 +50,7 @@ static void c3_isp_params_cfg_awb_gains(struct c3_isp_device *isp,
 			   ISP_LSWB_WB_GAIN2_IR_GAIN_MASK,
 			   ISP_LSWB_WB_GAIN2_IR_GAIN(awb_gains->gb_gain));
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
 				   ISP_TOP_BEO_CTRL_WB_EN_MASK,
 				   ISP_TOP_BEO_CTRL_WB_EN);
@@ -151,12 +112,14 @@ static void c3_isp_params_awb_cood(struct c3_isp_device *isp,
 			     ISP_AWB_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
 }
 
-static void c3_isp_params_cfg_awb_config(struct c3_isp_device *isp,
-					 const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_awb_config(void *dev,
+					 const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_awb_config *awb_cfg = &block->awb_cfg;
+	const struct c3_isp_params_awb_config *awb_cfg =
+		(const struct c3_isp_params_awb_config *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_DIS);
@@ -205,7 +168,7 @@ static void c3_isp_params_cfg_awb_config(struct c3_isp_device *isp,
 	c3_isp_params_awb_wt(isp, awb_cfg);
 	c3_isp_params_awb_cood(isp, awb_cfg);
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN);
@@ -268,12 +231,14 @@ static void c3_isp_params_ae_cood(struct c3_isp_device *isp,
 			     ISP_AE_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
 }
 
-static void c3_isp_params_cfg_ae_config(struct c3_isp_device *isp,
-					const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_ae_config(void *dev,
+					const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_ae_config *ae_cfg = &block->ae_cfg;
+	const struct c3_isp_params_ae_config *ae_cfg =
+		(const struct c3_isp_params_ae_config *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AE_STAT_DIS);
@@ -303,7 +268,7 @@ static void c3_isp_params_cfg_ae_config(struct c3_isp_device *isp,
 	c3_isp_params_ae_wt(isp, ae_cfg);
 	c3_isp_params_ae_cood(isp, ae_cfg);
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN);
@@ -326,12 +291,14 @@ static void c3_isp_params_af_cood(struct c3_isp_device *isp,
 			     ISP_AF_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
 }
 
-static void c3_isp_params_cfg_af_config(struct c3_isp_device *isp,
-					const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_af_config(void *dev,
+					const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_af_config *af_cfg = &block->af_cfg;
+	const struct c3_isp_params_af_config *af_cfg =
+		(const struct c3_isp_params_af_config *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AF_STAT_DIS);
@@ -351,20 +318,22 @@ static void c3_isp_params_cfg_af_config(struct c3_isp_device *isp,
 
 	c3_isp_params_af_cood(isp, af_cfg);
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN);
 }
 
-static void c3_isp_params_cfg_pst_gamma(struct c3_isp_device *isp,
-					const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_pst_gamma(void *dev,
+					const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_pst_gamma *gm = &block->pst_gamma;
+	const struct c3_isp_params_pst_gamma *gm =
+		(const struct c3_isp_params_pst_gamma *)block;
+	struct c3_isp_device *isp = dev;
 	unsigned int base;
 	unsigned int i;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_PST_GAMMA_EN_MASK,
 				   ISP_TOP_BED_CTRL_PST_GAMMA_DIS);
@@ -393,19 +362,21 @@ static void c3_isp_params_cfg_pst_gamma(struct c3_isp_device *isp,
 		}
 	}
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_PST_GAMMA_EN_MASK,
 				   ISP_TOP_BED_CTRL_PST_GAMMA_EN);
 }
 
 /* Configure 3 x 3 ccm matrix */
-static void c3_isp_params_cfg_ccm(struct c3_isp_device *isp,
-				  const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_ccm(void *dev,
+				  const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_ccm *ccm = &block->ccm;
+	const struct c3_isp_params_ccm *ccm =
+		(const struct c3_isp_params_ccm *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_CCM_EN_MASK,
 				   ISP_TOP_BED_CTRL_CCM_DIS);
@@ -442,19 +413,21 @@ static void c3_isp_params_cfg_ccm(struct c3_isp_device *isp,
 			   ISP_CCM_MTX_22_23_RS_MTX_22_MASK,
 			   ISP_CCM_MTX_22_23_RS_MTX_22(ccm->matrix[2][2]));
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_CCM_EN_MASK,
 				   ISP_TOP_BED_CTRL_CCM_EN);
 }
 
 /* Configure color space conversion matrix parameters */
-static void c3_isp_params_cfg_csc(struct c3_isp_device *isp,
-				  const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_csc(void *dev,
+				  const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_csc *csc = &block->csc;
+	const struct c3_isp_params_csc *csc =
+		(const struct c3_isp_params_csc *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_CM0_EN_MASK,
 				   ISP_TOP_BED_CTRL_CM0_DIS);
@@ -491,19 +464,21 @@ static void c3_isp_params_cfg_csc(struct c3_isp_device *isp,
 			   ISP_CM0_COEF22_OUP_OFST0_MTX_22_MASK,
 			   ISP_CM0_COEF22_OUP_OFST0_MTX_22(csc->matrix[2][2]));
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_CM0_EN_MASK,
 				   ISP_TOP_BED_CTRL_CM0_EN);
 }
 
 /* Set blc offset of each color channel */
-static void c3_isp_params_cfg_blc(struct c3_isp_device *isp,
-				  const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_blc(void *dev,
+				  const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_blc *blc = &block->blc;
+	const struct c3_isp_params_blc *blc =
+		(const struct c3_isp_params_blc *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
 				   ISP_TOP_BEO_CTRL_BLC_EN_MASK,
 				   ISP_TOP_BEO_CTRL_BLC_DIS);
@@ -517,13 +492,13 @@ static void c3_isp_params_cfg_blc(struct c3_isp_device *isp,
 		     ISP_LSWB_BLC_OFST1_GB_OFST(blc->gb_ofst) |
 		     ISP_LSWB_BLC_OFST1_B_OFST(blc->b_ofst));
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
 				   ISP_TOP_BEO_CTRL_BLC_EN_MASK,
 				   ISP_TOP_BEO_CTRL_BLC_EN);
 }
 
-static const struct c3_isp_params_handler c3_isp_params_handlers[] = {
+static const struct v4l2_params_handler c3_isp_params_handlers[] = {
 	[C3_ISP_PARAMS_BLOCK_AWB_GAINS] = {
 		.size = sizeof(struct c3_isp_params_awb_gains),
 		.handler = c3_isp_params_cfg_awb_gains,
@@ -568,16 +543,16 @@ static void c3_isp_params_cfg_blocks(struct c3_isp_params *params)
 
 	/* Walk the list of parameter blocks and process them */
 	while (block_offset < config->data_size) {
-		const struct c3_isp_params_handler *block_handler;
-		const union c3_isp_params_block *block;
+		const struct v4l2_params_handler *block_handler;
+		const struct v4l2_params_block *block;
 
-		block = (const union c3_isp_params_block *)
+		block = (const struct v4l2_params_block *)
 			 &config->data[block_offset];
 
-		block_handler = &c3_isp_params_handlers[block->header.type];
+		block_handler = &c3_isp_params_handlers[block->type];
 		block_handler->handler(params->isp, block);
 
-		block_offset += block->header.size;
+		block_offset += block->size;
 	}
 }
 
@@ -766,31 +741,49 @@ static void c3_isp_params_vb2_buf_queue(struct vb2_buffer *vb)
 	list_add_tail(&buf->list, &params->pending);
 }
 
+static int
+c3_isp_params_validate_buffer(struct device *dev,
+			      const struct v4l2_params_buffer *buffer)
+{
+	/* Only v0 is supported at the moment */
+	if (buffer->version != C3_ISP_PARAMS_BUFFER_V0) {
+		dev_dbg(dev, "Invalid params buffer version: %u\n",
+			buffer->version);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+c3_isp_params_validate_block(struct device *dev,
+			     const struct v4l2_params_block *block)
+{
+	if ((block->flags & (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
+			     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) ==
+	    (C3_ISP_PARAMS_BLOCK_FL_ENABLE | C3_ISP_PARAMS_BLOCK_FL_DISABLE)) {
+		dev_dbg(dev, "Invalid parameters block flags\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(vbuf);
 	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
-	struct c3_isp_params_cfg *cfg = buf->cfg;
 	struct c3_isp_params_cfg *usr_cfg = vb2_plane_vaddr(vb, 0);
 	size_t payload_size = vb2_get_plane_payload(vb, 0);
-	size_t header_size = offsetof(struct c3_isp_params_cfg, data);
-	size_t block_offset = 0;
-	size_t cfg_size;
-
-	/* Payload size can't be greater than the destination buffer size */
-	if (payload_size > params->vfmt.fmt.meta.buffersize) {
-		dev_dbg(params->isp->dev,
-			"Payload size is too large: %zu\n", payload_size);
-		return -EINVAL;
-	}
+	struct c3_isp_params_cfg *cfg = buf->cfg;
+	int ret;
 
-	/* Payload size can't be smaller than the header size */
-	if (payload_size < header_size) {
-		dev_dbg(params->isp->dev,
-			"Payload size is too small: %zu\n", payload_size);
-		return -EINVAL;
-	}
+	ret = v4l2_params_buffer_validate(params->isp->dev, vb,
+					  params->vfmt.fmt.meta.buffersize,
+					  c3_isp_params_validate_buffer);
+	if (ret)
+		return ret;
 
 	/*
 	 * Use the internal scratch buffer to avoid userspace modifying
@@ -798,70 +791,11 @@ static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
 	 */
 	memcpy(cfg, usr_cfg, payload_size);
 
-	/* Only v0 is supported at the moment */
-	if (cfg->version != C3_ISP_PARAMS_BUFFER_V0) {
-		dev_dbg(params->isp->dev,
-			"Invalid params buffer version: %u\n", cfg->version);
-		return -EINVAL;
-	}
-
-	/* Validate the size reported in the parameter buffer header */
-	cfg_size = header_size + cfg->data_size;
-	if (cfg_size != payload_size) {
-		dev_dbg(params->isp->dev,
-			"Data size %zu and payload size %zu are different\n",
-			cfg_size, payload_size);
-		return -EINVAL;
-	}
-
-	/* Walk the list of parameter blocks and validate them */
-	cfg_size = cfg->data_size;
-	while (cfg_size >= sizeof(struct c3_isp_params_block_header)) {
-		const struct c3_isp_params_block_header *block;
-		const struct c3_isp_params_handler *handler;
-
-		block = (struct c3_isp_params_block_header *)
-			&cfg->data[block_offset];
-
-		if (block->type >= ARRAY_SIZE(c3_isp_params_handlers)) {
-			dev_dbg(params->isp->dev,
-				"Invalid params block type\n");
-			return -EINVAL;
-		}
-
-		if (block->size > cfg_size) {
-			dev_dbg(params->isp->dev,
-				"Block size is greater than cfg size\n");
-			return -EINVAL;
-		}
-
-		if ((block->flags & (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
-				     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) ==
-		    (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
-		     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) {
-			dev_dbg(params->isp->dev,
-				"Invalid parameters block flags\n");
-			return -EINVAL;
-		}
-
-		handler = &c3_isp_params_handlers[block->type];
-		if (block->size != handler->size) {
-			dev_dbg(params->isp->dev,
-				"Invalid params block size\n");
-			return -EINVAL;
-		}
-
-		block_offset += block->size;
-		cfg_size -= block->size;
-	}
-
-	if (cfg_size) {
-		dev_dbg(params->isp->dev,
-			"Unexpected data after the params buffer end\n");
-		return -EINVAL;
-	}
-
-	return 0;
+	return v4l2_params_blocks_validate(params->isp->dev,
+					   (struct v4l2_params_buffer *)cfg,
+					   c3_isp_params_handlers,
+					   ARRAY_SIZE(c3_isp_params_handlers),
+					   c3_isp_params_validate_block);
 }
 
 static int c3_isp_params_vb2_buf_init(struct vb2_buffer *vb)

-- 
2.49.0


