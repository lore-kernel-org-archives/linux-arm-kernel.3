Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D2BF46124
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zVJSIaRwHowt/CDnUtsIOfmPnnJpt16EewselldkDoU=; b=hEOGLPgMJCslbAlqPtvSGp+K3j
	4v+akjyUW/7U8LbgGssxgR1+9RptoBwBr3FYpMbLxVyV/rD7Y7sV4hm5nX2SUoTqN5aDcA2uh8LKS
	lnbegXbPziCgU9yomkVw5UtLb2NszRilgv1OQXvbIvTkFOBZt7qUUB7ptN3rViLoy+GtwPy7ZjXSx
	SCEAqNejXFriVDE1QYj4wp7p4IXbWNfMohuMXlmzMlcQsanRtOBUhXZhXcKdEJfoV++Aho0zwbIBS
	48JmAErj76WqKpQO40hbPg788POhZdohds7KDKtcCbzwXDANQeOQqIgjjZQIdZICcZNOjwL4Gad5d
	Xj/uFXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fre-0000000GtKd-1a3Z;
	Mon, 23 Mar 2026 14:02:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4frc-0000000GtJq-1MCP;
	Mon, 23 Mar 2026 14:02:41 +0000
Received: from pb-laptop.local (185.221.143.129.nat.pool.zt.hu [185.221.143.129])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50A441BA;
	Mon, 23 Mar 2026 15:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774274480;
	bh=BfH8lqrkHRMS5sCrm9+Zee84RMtu29VSz0DOXgmKV7Y=;
	h=From:To:Cc:Subject:Date:From;
	b=L4YA7V1gVEQVhycydPgRpalE6ys4+W4eQ1l++63mcN2uhUe0kxiNXwqTMI63KQ/8M
	 swcq/Jx+0BLR+TGwpkhueF2LZWrD3xn/XQeYZZ6Qmi1dx/7bn+Cl9zR+t+UpgtRdaZ
	 NxpT1CJ2UpFpmFEuvtWrOWtnM1uUSf7CuaMGqkn0=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Subject: [PATCH v1] media: rkisp1: Add support for CAC
Date: Mon, 23 Mar 2026 15:02:16 +0100
Message-ID: <20260323140216.1486161-1-barnabas.pocze@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_070240_507031_46F2EF11 
X-CRM114-Status: GOOD (  22.06  )
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

The CAC block implements chromatic aberration correction. Expose it to
userspace using the extensible parameters format. This was tested on the
i.MX8MP platform, but based on available documentation it is also present
in the RK3399 variant (V10). Thus presumably also in later versions,
so no feature flag is introduced.

Signed-off-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  |  69 ++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  21 +++-
 include/uapi/linux/rkisp1-config.h            | 106 +++++++++++++++++-
 3 files changed, 193 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 6442436a5e428..b889af9dcee45 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -64,6 +64,7 @@ union rkisp1_ext_params_config {
 	struct rkisp1_ext_params_compand_bls_config compand_bls;
 	struct rkisp1_ext_params_compand_curve_config compand_curve;
 	struct rkisp1_ext_params_wdr_config wdr;
+	struct rkisp1_ext_params_cac_config cac;
 };
 
 enum rkisp1_params_formats {
@@ -1413,6 +1414,48 @@ static void rkisp1_wdr_config(struct rkisp1_params *params,
 				     RKISP1_CIF_ISP_WDR_TONE_CURVE_YM_MASK);
 }
 
+static void
+rkisp1_cac_config(struct rkisp1_params *params,
+		  const struct rkisp1_cif_isp_cac_config *arg)
+{
+	u32 regval;
+
+	/*
+	 * The enable bit is in the same register (RKISP1_CIF_ISP_CAC_CTRL),
+	 * so only set the clipping mode, and do not modify the other bits.
+	 */
+	regval = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_CAC_CTRL);
+	regval &= ~(RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE |
+		    RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE);
+	regval |= FIELD_PREP(RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE, arg->h_clip_mode) |
+		  FIELD_PREP(RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE, arg->v_clip_mode);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_CTRL, regval);
+
+	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_COUNT_START_H_MASK, arg->h_count_start) |
+		 FIELD_PREP(RKISP1_CIF_ISP_CAC_COUNT_START_V_MASK, arg->v_count_start);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_COUNT_START, regval);
+
+	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_A_RED_MASK, arg->red[0]) |
+		 FIELD_PREP(RKISP1_CIF_ISP_CAC_A_BLUE_MASK, arg->blue[0]);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_A, regval);
+
+	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_B_RED_MASK, arg->red[1]) |
+		 FIELD_PREP(RKISP1_CIF_ISP_CAC_B_BLUE_MASK, arg->blue[1]);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_B, regval);
+
+	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_C_RED_MASK, arg->red[2]) |
+		 FIELD_PREP(RKISP1_CIF_ISP_CAC_C_BLUE_MASK, arg->blue[2]);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_C, regval);
+
+	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_X_NORM_NF_MASK, arg->x_nf) |
+		 FIELD_PREP(RKISP1_CIF_ISP_CAC_X_NORM_NS_MASK, arg->x_ns);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_X_NORM, regval);
+
+	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_Y_NORM_NF_MASK, arg->y_nf) |
+		 FIELD_PREP(RKISP1_CIF_ISP_CAC_Y_NORM_NS_MASK, arg->y_ns);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_Y_NORM, regval);
+}
+
 static void
 rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 			    const struct rkisp1_params_cfg *new_params)
@@ -2089,6 +2132,25 @@ static void rkisp1_ext_params_wdr(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
 }
 
+static void rkisp1_ext_params_cac(struct rkisp1_params *params,
+				  const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_cac_config *cac = &block->cac;
+
+	if (cac->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
+					RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
+		return;
+	}
+
+	rkisp1_cac_config(params, &cac->config);
+
+	if ((cac->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
+	    !(params->enabled_blocks & BIT(cac->header.type)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
+				      RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
+}
+
 typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
 			     const union rkisp1_ext_params_config *config);
 
@@ -2185,6 +2247,10 @@ static const struct rkisp1_ext_params_handler {
 		.handler	= rkisp1_ext_params_wdr,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC] = {
+		.handler	= rkisp1_ext_params_cac,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
 };
 
 #define RKISP1_PARAMS_BLOCK_INFO(block, data) \
@@ -2215,6 +2281,7 @@ rkisp1_ext_params_block_types_info[] = {
 	RKISP1_PARAMS_BLOCK_INFO(COMPAND_EXPAND, compand_curve),
 	RKISP1_PARAMS_BLOCK_INFO(COMPAND_COMPRESS, compand_curve),
 	RKISP1_PARAMS_BLOCK_INFO(WDR, wdr),
+	RKISP1_PARAMS_BLOCK_INFO(CAC, cac),
 };
 
 static_assert(ARRAY_SIZE(rkisp1_ext_params_handlers) ==
@@ -2474,6 +2541,8 @@ void rkisp1_params_disable(struct rkisp1_params *params)
 	rkisp1_ie_enable(params, false);
 	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
 				RKISP1_CIF_ISP_DPF_MODE_EN);
+	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
+				RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
 }
 
 static const struct rkisp1_params_ops rkisp1_v10_params_ops = {
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index fbeb186cde0d5..8e25537459bbd 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -724,6 +724,23 @@
 #define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MASK		GENMASK(20, 16)
 #define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MAX		16U
 
+/* CAC */
+#define RKISP1_CIF_ISP_CAC_CTRL_ENABLE		BIT(0)
+#define RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE	GENMASK(2, 1)
+#define RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE	GENMASK(3, 3)
+#define RKISP1_CIF_ISP_CAC_COUNT_START_H_MASK	GENMASK(12, 0)
+#define RKISP1_CIF_ISP_CAC_COUNT_START_V_MASK	GENMASK(28, 16)
+#define RKISP1_CIF_ISP_CAC_A_RED_MASK		GENMASK(8, 0)
+#define RKISP1_CIF_ISP_CAC_A_BLUE_MASK		GENMASK(24, 16)
+#define RKISP1_CIF_ISP_CAC_B_RED_MASK		GENMASK(8, 0)
+#define RKISP1_CIF_ISP_CAC_B_BLUE_MASK		GENMASK(24, 16)
+#define RKISP1_CIF_ISP_CAC_C_RED_MASK		GENMASK(8, 0)
+#define RKISP1_CIF_ISP_CAC_C_BLUE_MASK		GENMASK(24, 16)
+#define RKISP1_CIF_ISP_CAC_X_NORM_NF_MASK	GENMASK(4, 0)
+#define RKISP1_CIF_ISP_CAC_X_NORM_NS_MASK	GENMASK(19, 16)
+#define RKISP1_CIF_ISP_CAC_Y_NORM_NF_MASK	GENMASK(4, 0)
+#define RKISP1_CIF_ISP_CAC_Y_NORM_NS_MASK	GENMASK(19, 16)
+
 /* =================================================================== */
 /*                            CIF Registers                            */
 /* =================================================================== */
@@ -1196,8 +1213,8 @@
 #define RKISP1_CIF_ISP_CAC_A			(RKISP1_CIF_ISP_CAC_BASE + 0x00000008)
 #define RKISP1_CIF_ISP_CAC_B			(RKISP1_CIF_ISP_CAC_BASE + 0x0000000c)
 #define RKISP1_CIF_ISP_CAC_C			(RKISP1_CIF_ISP_CAC_BASE + 0x00000010)
-#define RKISP1_CIF_ISP_X_NORM			(RKISP1_CIF_ISP_CAC_BASE + 0x00000014)
-#define RKISP1_CIF_ISP_Y_NORM			(RKISP1_CIF_ISP_CAC_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_CAC_X_NORM		(RKISP1_CIF_ISP_CAC_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_CAC_Y_NORM		(RKISP1_CIF_ISP_CAC_BASE + 0x00000018)
 
 #define RKISP1_CIF_ISP_EXP_BASE			0x00002600
 #define RKISP1_CIF_ISP_EXP_CTRL			(RKISP1_CIF_ISP_EXP_BASE + 0x00000000)
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index b2d2a71f7baff..d8acccaddd0e9 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -967,6 +967,92 @@ struct rkisp1_cif_isp_wdr_config {
 	__u8 use_iref;
 };
 
+/*
+ * enum rkisp1_cif_isp_cac_h_clip_mode - horizontal clipping mode
+ *
+ * @RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4PX: +/- 4 pixels
+ * @RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4_5PX: +/- 4/5 pixels depending on bayer position
+ */
+enum rkisp1_cif_isp_cac_h_clip_mode {
+	RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4PX = 0,
+	RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4_5PX = 1,
+};
+
+/**
+ * enum rkisp1_cif_isp_cac_v_clip_mode - vertical clipping mode
+ *
+ * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_2PX: +/- 2 pixels
+ * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3PX: +/- 3 pixels
+ * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3_4PX: +/- 3/4 pixels depending on bayer position
+ */
+enum rkisp1_cif_isp_cac_v_clip_mode {
+	RKISP1_CIF_ISP_CAC_V_CLIP_MODE_2PX = 0,
+	RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3PX = 1,
+	RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3_4PX = 2,
+};
+
+/**
+ * struct rkisp1_cif_isp_cac_config - chromatic aberration correction configuration
+ *
+ * The correction is carried out by shifting the red and blue pixels relative
+ * to the green ones, depending on the distance from the optical center:
+ *
+ * @h_count_start: horizontal coordinate of the optical center (13-bit unsigned integer; [1,8191])
+ * @v_count_start: vertical coordinate of the optical center (13-bit unsigned integer; [1,8191])
+ *
+ * For each pixel, the x/y distances from the optical center are calculated and
+ * then transformed into the [0,255] range based on the following formula:
+ *
+ *   (((d << 4) >> s) * f) >> 5
+ *
+ * where `d` is the distance, `s` and `f` are the normalization parameters:
+ *
+ * @x_nf: horizontal normalization scale parameter (5-bit unsigned integer; [0,31])
+ * @x_ns: horizontal normalization shift parameter (4-bit unsigned integer; [0,15])
+ *
+ * @y_nf: vertical normalization scale parameter (5-bit unsigned integer; [0,31])
+ * @y_ns: vertical normalization shift parameter (4-bit unsigned integer; [0,15])
+ *
+ * These parameters should be chosen based on the image resolution, the position
+ * of the optical center, and the shape of pixels: so that no normalized distance
+ * is larger than 255. If the pixels have square shape, the two sets of parameters
+ * should be equal.
+ *
+ * The actual amount of correction is calculated with a third degree polynomial:
+ *
+ *   c[0] * r + c[1] * r^2 + c[2] * r^3
+ *
+ * where `c` is the set of coefficients for the given color, and `r` is distance:
+ *
+ * @red: red coefficients (5.4 two's complement; [-16,15.9375])
+ * @blue: blue coefficients (5.4 two's complement; [-16,15.9375])
+ *
+ * Finally, the amount is clipped as requested:
+ *
+ * @h_clip_mode: maximum horizontal shift (from enum rkisp1_cif_isp_cac_h_clip_mode)
+ * @v_clip_mode: maximum vertical shift (from enum rkisp1_cif_isp_cac_v_clip_mode)
+ *
+ * A positive result will shift away from the optical center, while a negative
+ * one will shift towards the optical center. In the latter case, the pixel
+ * values at the edges are duplicated.
+ */
+struct rkisp1_cif_isp_cac_config {
+	__u8 h_clip_mode;
+	__u8 v_clip_mode;
+
+	__u16 h_count_start;
+	__u16 v_count_start;
+
+	__u16 red[3];
+	__u16 blue[3];
+
+	__u8 x_nf;
+	__u8 x_ns;
+
+	__u8 y_nf;
+	__u8 y_ns;
+};
+
 /*---------- PART2: Measurement Statistics ------------*/
 
 /**
@@ -1161,6 +1247,7 @@ enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC,
 };
 
 /* For backward compatibility */
@@ -1507,6 +1594,22 @@ struct rkisp1_ext_params_wdr_config {
 	struct rkisp1_cif_isp_wdr_config config;
 } __attribute__((aligned(8)));
 
+/**
+ * struct rkisp1_ext_params_cac_config - RkISP1 extensible params CAC config
+ *
+ * RkISP1 extensible parameters CAC block.
+ * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC`.
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @config: CAC configuration, see
+ *	    :c:type:`rkisp1_cif_isp_cac_config`
+ */
+struct rkisp1_ext_params_cac_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_cac_config config;
+} __attribute__((aligned(8)));
+
 /*
  * The rkisp1_ext_params_compand_curve_config structure is counted twice as it
  * is used for both the COMPAND_EXPAND and COMPAND_COMPRESS block types.
@@ -1532,7 +1635,8 @@ struct rkisp1_ext_params_wdr_config {
 	sizeof(struct rkisp1_ext_params_compand_bls_config)		+\
 	sizeof(struct rkisp1_ext_params_compand_curve_config)		+\
 	sizeof(struct rkisp1_ext_params_compand_curve_config)		+\
-	sizeof(struct rkisp1_ext_params_wdr_config))
+	sizeof(struct rkisp1_ext_params_wdr_config)			+\
+	sizeof(struct rkisp1_ext_params_cac_config))
 
 /**
  * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version
-- 
2.53.0


