Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE53CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFRgbjrpvjvhPCfkvuAf92zmg86eeLkYYeEzUvfidBc=; b=RJYQqy6SeK/Yxi4xUKzSiF+g+J
	SZJYS7YUQu0MWHhoqLR5sdGTv9yUkMda/zOfdJpInvNMqUDbmLcl55ltms9XtkSY/rf3NlAUdUQ/L
	fK5n0RRjFID3fHx1UP3e6RpAD9+cu4GtNT59RnQbSH3KDPNi1F+fdaGCptCDvcfaTBVdJxuB7YQVc
	m/LeBuaZMudWPkaTpu68AkxIG5ID1Gy7T7ICVRU4OIuVmdjsbE59la0jecWlZzf8rSxOFrEc5gtGR
	KWA3ZIFu5rWoRAx0oAKJZiT5MzuwhGbhsVsLHqzDtNROpo+6HCyl/zqCfXVtn8Pd3Arpzd9GIzOyW
	P552v8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sz2-00000006ZL8-438H;
	Thu, 09 Oct 2025 15:55:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sz0-00000006ZHj-1mna
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025310; x=1791561310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2OQ78RzTvUpT3PPmqGoxYSCqgJDwbNTUAvYItTqop8U=;
  b=nu2ekZ4piza08i4CmCLzDake32tD672RTnNUAP6U4HUldhheUWVA+YXb
   cG9/eC+AyrJK9pAHBYkyD3dH1MOprX+TXI+jRzAC8rMKWt6nf1CiitfjI
   RS1Cs5FJoRY/ialARcGIaY4gnQLT2jkp1HUFmGcNNlHdy09b2B1u11UoV
   jmdRGDd3AO+mHL8RStOboUr/IzslUlbwAgEr4m43R+4ecJ0pahRsE8Pck
   mxDSGI4o9lf7tz5eHABZaU7ARDA8wJDsiIgF03tUnDlNhMB7whRjTwFpt
   Ykw8nU0mA0KG7JEJyfL2bW5uGPUAinGJdLz65pvmMQ8oBbI00+BFIPVMc
   g==;
X-CSE-ConnectionGUID: BprCE2jSRKSS2v2IfjkHsw==
X-CSE-MsgGUID: jQG7AlzZQJ+bbtCotqDlLQ==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="278928750"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:10 -0700
Received: from chn-vm-ex3.mchp-main.com (10.10.87.32) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:54:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 9 Oct 2025 08:54:48 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:54:39 -0700
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
Subject: [PATCH 11/18] media: microchip-isc: expose hue and saturation as v4l2 controls
Date: Thu, 9 Oct 2025 21:22:44 +0530
Message-ID: <20251009155251.102472-12-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085510_490058_E6A92114 
X-CRM114-Status: GOOD (  13.90  )
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

Expose hue and saturation as adjustable controls allowing users to modify
it. Write the user specified values to the hardware registers. Additionally
write the brightness and contrast values to the registers that were
missing.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c     | 17 +++++++++++++++++
 .../platform/microchip/microchip-isc-regs.h     |  3 +++
 .../media/platform/microchip/microchip-isc.h    |  2 ++
 3 files changed, 22 insertions(+)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index e6d7f59893ac..ce22b4789ebd 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1520,6 +1520,7 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct isc_device *isc = container_of(ctrl->handler,
 					     struct isc_device, ctrls.handler);
 	struct isc_ctrls *ctrls = &isc->ctrls;
+	struct regmap *regmap = isc->regmap;
 
 	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
 		return 0;
@@ -1527,9 +1528,19 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_BRIGHTNESS:
 		ctrls->brightness = ctrl->val & ISC_CBC_BRIGHT_MASK;
+		regmap_write(regmap, ISC_CBC_BRIGHT + isc->offsets.cbc, ctrls->brightness);
 		break;
 	case V4L2_CID_CONTRAST:
 		ctrls->contrast = ctrl->val & ISC_CBC_CONTRAST_MASK;
+		regmap_write(regmap, ISC_CBC_CONTRAST + isc->offsets.cbc, ctrls->contrast);
+		break;
+	case V4L2_CID_HUE:
+		ctrls->hue = ctrl->val & ISC_CBCHS_HUE_MASK;
+		regmap_write(regmap, ISC_CBCHS_HUE, ctrls->hue);
+		break;
+	case V4L2_CID_SATURATION:
+		ctrls->saturation = ctrl->val & ISC_CBCHS_SAT_MASK;
+		regmap_write(regmap, ISC_CBCHS_SAT, ctrls->saturation);
 		break;
 	case V4L2_CID_GAMMA:
 		ctrls->gamma_index = ctrl->val;
@@ -1538,6 +1549,10 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 		return -EINVAL;
 	}
 
+	mutex_lock(&isc->awb_mutex);
+	isc_update_profile(isc);
+	mutex_unlock(&isc->awb_mutex);
+
 	return 0;
 }
 
@@ -1714,6 +1729,8 @@ static int isc_ctrl_init(struct isc_device *isc)
 	ctrls->brightness = 0;
 
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HUE, -180, 180, 1, 0);
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION, 0, 100, 1, 16);
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1, 1);
 	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
 					  V4L2_CID_AUTO_WHITE_BALANCE,
diff --git a/drivers/media/platform/microchip/microchip-isc-regs.h b/drivers/media/platform/microchip/microchip-isc-regs.h
index e77e1d9a1db8..2593bd533cac 100644
--- a/drivers/media/platform/microchip/microchip-isc-regs.h
+++ b/drivers/media/platform/microchip/microchip-isc-regs.h
@@ -270,8 +270,11 @@
 
 /* Hue Register */
 #define ISC_CBCHS_HUE	0x4e0
+#define ISC_CBCHS_HUE_MASK	GENMASK(8, 0)
+
 /* Saturation Register */
 #define ISC_CBCHS_SAT	0x4e4
+#define ISC_CBCHS_SAT_MASK	GENMASK(11, 0)
 
 /* Offset for SUB422 register specific to sama5d2 product */
 #define ISC_SAMA5D2_SUB422_OFFSET	0
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index 5245e2790268..7afba3c04dfb 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -139,6 +139,8 @@ struct isc_ctrls {
 
 	u32 brightness;
 	u32 contrast;
+	u32 hue;
+	u32 saturation;
 	u8 gamma_index;
 #define ISC_WB_NONE	0
 #define ISC_WB_AUTO	1
-- 
2.34.1


