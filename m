Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DC1CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDVON9wIVR+FiPPkSKO8aED/wgyi2DzZG57ql009mjY=; b=ZPp+SpMyFayDEq8ytbpFEzRfaH
	9VuYvCeRZi2fJ49jTDUjgvQe9CpFjoSXaZ7W7M/3yB6oWJfmTYUCfK6CqFvL17DZXnII9X/2PoIsx
	X5175njxnpv4TYLdsVxh7yXA0UAUtjqSxaqhjvHp8q0WkT3mXAg7JgH+cbSqby9fAi0FMFwNnSULX
	A1Fqhw0o/bQSSnPlwVaEb4tdSy/0VQj8hV7x46wZEwh994m92/XxuNYF/Nc1B5am6g4k8t+AWqWB9
	ohae2IQ96vn6OgbPCpQVc7vFoL2V0/UE8SsXsJRqn01ILVmLg2TVP1mqEErGdGNAIfSXbWNg1nX0f
	Oy1qxhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6szk-00000006Zon-2Z35;
	Thu, 09 Oct 2025 15:55:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6szg-00000006ZhY-2O0f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025352; x=1791561352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ltVVgO1BWQZUuL2DmnrPGrBpxTZGaoS3wMKXOulHR2E=;
  b=uNaZG7IjhaojjIv/qknmyRVME9ITtA9vf+zc2xzTCXiqtI+C093za8+/
   hkREPRDV3Vpcwmv5XkckqXuzw9CZcbUDMgiT7Msv/2bFSerXGGprJBgYf
   Jp6bRaWZ+cLeSkGugUG1EIyjpRCuHCjIIiewRpRcZj5lyqaCQFq2zNu0v
   D4+lm02bWn/8WGxkUd/NCD62Kh/vFRgTM5+xaT1Ac5LqL5SkdlXHe1aue
   5x4mREz4mZ0cncekpKpL0+9DkuGb1dpa8CjM4TplsErhilDCxT61piVh6
   DTvmQM00Xse79qJrK1OxAL7WNXRzZPAY8MmumA6SmFN5e0+ch3IlxWtJd
   Q==;
X-CSE-ConnectionGUID: BY5Dt4iOTF6lw0TCi1Tv9Q==
X-CSE-MsgGUID: +BDZYYIYSz+sqPWAo7qYbg==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="48057951"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:55:47 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:55:40 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
	<3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH 18/18] media: microchip-isc: expose color correction registers as v4l2 controls
Date: Thu, 9 Oct 2025 21:22:51 +0530
Message-ID: <20251009155251.102472-19-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085552_706748_B31C2CD7 
X-CRM114-Status: GOOD (  15.98  )
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

Enable the Color correction registers as v4l2 controls. Applications such
as libcamera can read and write the elements of color correction matrix
through the standard v4l2 control API.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 175 +++++++++++++++++-
 .../media/platform/microchip/microchip-isc.h  |  12 ++
 include/linux/atmel-isc-media.h               |  13 ++
 3 files changed, 199 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 6c937a20fce0..e679dc02dc9f 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -32,7 +32,7 @@
 #include "microchip-isc-regs.h"
 #include "microchip-isc.h"
 
-#define ISC_IS_FORMAT_RAW(mbus_code) \
+#define ISC_IS_FORMAT_RAW(mbus_code)		\
 	(((mbus_code) & 0xf000) == 0x3000)
 
 #define ISC_IS_FORMAT_GREY(mbus_code) \
@@ -1677,6 +1677,165 @@ static int isc_g_volatile_awb_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int isc_cc_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct isc_device *isc = container_of(ctrl->handler,
+					     struct isc_device, ctrls.handler);
+	struct regmap *regmap = isc->regmap;
+
+	dev_dbg(isc->dev, "id = 0x%x; val = 0x%x", ctrl->id, ctrl->val);
+
+	switch (ctrl->id) {
+	case ISC_CID_CC_RR:
+		regmap_update_bits(regmap, ISC_CC_RR_RG, GENMASK(11, 0), ctrl->val);
+		break;
+	case ISC_CID_CC_RG:
+		regmap_update_bits(regmap, ISC_CC_RR_RG, GENMASK(27, 16),
+				   (ctrl->val & GENMASK(11, 0)) << 16);
+		break;
+	case ISC_CID_CC_RB:
+		regmap_update_bits(regmap, ISC_CC_RB_OR, GENMASK(11, 0), ctrl->val);
+		break;
+	case ISC_CID_CC_OR:
+		regmap_update_bits(regmap, ISC_CC_RB_OR, GENMASK(27, 16),
+				   (ctrl->val & GENMASK(11, 0)) << 16);
+		break;
+	case ISC_CID_CC_GR:
+		regmap_update_bits(regmap, ISC_CC_GR_GG, GENMASK(11, 0), ctrl->val);
+		break;
+	case ISC_CID_CC_GG:
+		regmap_update_bits(regmap, ISC_CC_GR_GG, GENMASK(27, 16),
+				   (ctrl->val & GENMASK(11, 0)) << 16);
+		break;
+	case ISC_CID_CC_GB:
+		regmap_update_bits(regmap, ISC_CC_GB_OG, GENMASK(11, 0), ctrl->val);
+		break;
+	case ISC_CID_CC_OG:
+		regmap_update_bits(regmap, ISC_CC_GB_OG, GENMASK(27, 16),
+				   (ctrl->val & GENMASK(11, 0)) << 16);
+		break;
+	case ISC_CID_CC_BR:
+		regmap_update_bits(regmap, ISC_CC_BR_BG, GENMASK(11, 0), ctrl->val);
+		break;
+	case ISC_CID_CC_BG:
+		regmap_update_bits(regmap, ISC_CC_BR_BG, GENMASK(27, 16),
+				   (ctrl->val & GENMASK(11, 0)) << 16);
+		break;
+	case ISC_CID_CC_BB:
+		regmap_update_bits(regmap, ISC_CC_BB_OB, GENMASK(11, 0), ctrl->val);
+		break;
+	case ISC_CID_CC_OB:
+		regmap_update_bits(regmap, ISC_CC_BB_OB, GENMASK(27, 16),
+				   (ctrl->val & GENMASK(11, 0)) << 16);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int isc_cc_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct isc_device *isc = container_of(ctrl->handler,
+					     struct isc_device, ctrls.handler);
+	struct regmap *regmap = isc->regmap;
+	unsigned int reg;
+
+	switch (ctrl->id) {
+	case ISC_CID_CC_RR:
+		regmap_read(regmap, ISC_CC_RR_RG, &reg);
+		ctrl->val = sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_RG:
+		regmap_read(regmap, ISC_CC_RR_RG, &reg);
+		ctrl->val = sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	case ISC_CID_CC_RB:
+		regmap_read(regmap, ISC_CC_RB_OR, &reg);
+		ctrl->val = sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_OR:
+		regmap_read(regmap, ISC_CC_RB_OR, &reg);
+		ctrl->val = sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	case ISC_CID_CC_GR:
+		regmap_read(regmap, ISC_CC_GR_GG, &reg);
+		ctrl->val = sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_GG:
+		regmap_read(regmap, ISC_CC_GR_GG, &reg);
+		ctrl->val = sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	case ISC_CID_CC_GB:
+		regmap_read(regmap, ISC_CC_GB_OG, &reg);
+		ctrl->val = sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_OG:
+		regmap_read(regmap, ISC_CC_GB_OG, &reg);
+		ctrl->val = sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	case ISC_CID_CC_BR:
+		regmap_read(regmap, ISC_CC_BR_BG, &reg);
+		ctrl->val = sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_BG:
+		regmap_read(regmap, ISC_CC_BR_BG, &reg);
+		ctrl->val = sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	case ISC_CID_CC_BB:
+		regmap_read(regmap, ISC_CC_BB_OB, &reg);
+		ctrl->val = sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_OB:
+		regmap_read(regmap, ISC_CC_BB_OB, &reg);
+		ctrl->val = sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(isc->dev, "id = 0x%x; val = 0x%x", ctrl->id, ctrl->val);
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops isc_cc_ops = {
+	.s_ctrl = isc_cc_s_ctrl,
+	.g_volatile_ctrl = isc_cc_g_volatile_ctrl,
+};
+
+#define ISC_CTRL_CC(_name, _id, _name_str) \
+	static const struct v4l2_ctrl_config _name = { \
+		.ops = &isc_cc_ops, \
+		.id = _id, \
+		.name = _name_str, \
+		.type = V4L2_CTRL_TYPE_INTEGER, \
+		.flags = V4L2_CTRL_FLAG_SLIDER, \
+		.min = -2048, \
+		.max = 2047, \
+		.step = 1, \
+		.def = 0, \
+	}
+
+ISC_CTRL_CC(isc_cc_rr_ctrl, ISC_CID_CC_RR, "CC RR");
+ISC_CTRL_CC(isc_cc_rg_ctrl, ISC_CID_CC_RG, "CC RG");
+
+ISC_CTRL_CC(isc_cc_rb_ctrl, ISC_CID_CC_RB, "CC RB");
+ISC_CTRL_CC(isc_cc_or_ctrl, ISC_CID_CC_OR, "CC OR");
+
+ISC_CTRL_CC(isc_cc_gr_ctrl, ISC_CID_CC_GR, "CC GR");
+ISC_CTRL_CC(isc_cc_gg_ctrl, ISC_CID_CC_GG, "CC GG");
+
+ISC_CTRL_CC(isc_cc_gb_ctrl, ISC_CID_CC_GB, "CC GB");
+ISC_CTRL_CC(isc_cc_og_ctrl, ISC_CID_CC_OG, "CC OG");
+
+ISC_CTRL_CC(isc_cc_br_ctrl, ISC_CID_CC_BR, "CC BR");
+ISC_CTRL_CC(isc_cc_bg_ctrl, ISC_CID_CC_BG, "CC BG");
+
+ISC_CTRL_CC(isc_cc_bb_ctrl, ISC_CID_CC_BB, "CC BB");
+ISC_CTRL_CC(isc_cc_ob_ctrl, ISC_CID_CC_OB, "CC OB");
+
 static const struct v4l2_ctrl_ops isc_awb_ops = {
 	.s_ctrl = isc_s_awb_ctrl,
 	.g_volatile_ctrl = isc_g_volatile_awb_ctrl,
@@ -1767,6 +1926,20 @@ static int isc_ctrl_init(struct isc_device *isc)
 	isc->gr_off_ctrl = v4l2_ctrl_new_custom(hdl, &isc_gr_off_ctrl, NULL);
 	isc->gb_off_ctrl = v4l2_ctrl_new_custom(hdl, &isc_gb_off_ctrl, NULL);
 
+	/* Color correction control */
+	isc->cc_rr = v4l2_ctrl_new_custom(hdl, &isc_cc_rr_ctrl, NULL);
+	isc->cc_rg = v4l2_ctrl_new_custom(hdl, &isc_cc_rg_ctrl, NULL);
+	isc->cc_rb = v4l2_ctrl_new_custom(hdl, &isc_cc_rb_ctrl, NULL);
+	isc->cc_or = v4l2_ctrl_new_custom(hdl, &isc_cc_or_ctrl, NULL);
+	isc->cc_gr = v4l2_ctrl_new_custom(hdl, &isc_cc_gr_ctrl, NULL);
+	isc->cc_gg = v4l2_ctrl_new_custom(hdl, &isc_cc_gg_ctrl, NULL);
+	isc->cc_gb = v4l2_ctrl_new_custom(hdl, &isc_cc_gb_ctrl, NULL);
+	isc->cc_og = v4l2_ctrl_new_custom(hdl, &isc_cc_og_ctrl, NULL);
+	isc->cc_br = v4l2_ctrl_new_custom(hdl, &isc_cc_br_ctrl, NULL);
+	isc->cc_bg = v4l2_ctrl_new_custom(hdl, &isc_cc_bg_ctrl, NULL);
+	isc->cc_bb = v4l2_ctrl_new_custom(hdl, &isc_cc_bb_ctrl, NULL);
+	isc->cc_ob = v4l2_ctrl_new_custom(hdl, &isc_cc_ob_ctrl, NULL);
+
 	/*
 	 * The cluster is in auto mode with autowhitebalance enabled
 	 * and manual mode otherwise.
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index fcb20669ef69..aaa6c4b653d4 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -357,6 +357,18 @@ struct isc_device {
 		struct v4l2_ctrl	*b_off_ctrl;
 		struct v4l2_ctrl	*gr_off_ctrl;
 		struct v4l2_ctrl	*gb_off_ctrl;
+		struct v4l2_ctrl        *cc_rr;
+		struct v4l2_ctrl        *cc_rg;
+		struct v4l2_ctrl        *cc_rb;
+		struct v4l2_ctrl        *cc_or;
+		struct v4l2_ctrl        *cc_gr;
+		struct v4l2_ctrl        *cc_gg;
+		struct v4l2_ctrl        *cc_gb;
+		struct v4l2_ctrl        *cc_og;
+		struct v4l2_ctrl        *cc_br;
+		struct v4l2_ctrl        *cc_bg;
+		struct v4l2_ctrl        *cc_bb;
+		struct v4l2_ctrl        *cc_ob;
 	};
 
 	/* Statistics device */
diff --git a/include/linux/atmel-isc-media.h b/include/linux/atmel-isc-media.h
index 79a320fb724e..028d34c8de81 100644
--- a/include/linux/atmel-isc-media.h
+++ b/include/linux/atmel-isc-media.h
@@ -53,6 +53,19 @@ enum atmel_isc_ctrl_id {
 	ISC_CID_GR_OFFSET,
 	/* Green Blue component offset control */
 	ISC_CID_GB_OFFSET,
+	/* Color correction registers */
+	ISC_CID_CC_RR,
+	ISC_CID_CC_RG,
+	ISC_CID_CC_RB,
+	ISC_CID_CC_OR,
+	ISC_CID_CC_GR,
+	ISC_CID_CC_GG,
+	ISC_CID_CC_GB,
+	ISC_CID_CC_OG,
+	ISC_CID_CC_BR,
+	ISC_CID_CC_BG,
+	ISC_CID_CC_BB,
+	ISC_CID_CC_OB,
 };
 
 #endif
-- 
2.34.1


