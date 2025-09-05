Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE7BCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lm5hPdL8AkGTQal0R2BRZdcHNqMN4Z7U/7PKQLRiGMg=; b=bqj7JLcOpAapgX01f5Tup1WDSS
	Z0msknApOUIWkqVKnOI6JbAjI8xtdovyn0kqcBZScY2wekLwNXF+JwCNKiBjyFUBR6vNQ+37pua2N
	rKlZD9WKrZMIE1rqFT8WQ/idfzYt1JFlWl+xPfdaEF/vGaSscjZHoCUeHM+UTWfoeBRBC1k3X1HZl
	cx569/BeSP4JgWrthN7hf/Nm5qcdCJcc6MR+WQgyCNHSJp0xpD9lHv0hwfxIgudI5pDOrOIWYOAUo
	zTzXxM+c03upa1coDAuZT15w4h2EBA3O2QEirb+J4aMt3EkVEZTtcrSbd+niwYEvnq+RXaABdBqzm
	6zBDp6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVI-00000005R0j-2Gzd;
	Sat, 06 Sep 2025 00:10:04 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZAY-000000033sM-1ES8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1757089210; bh=Lm5hPdL8AkGTQal0R2BRZdcHNqMN4Z7U/7PKQLRiGMg=;
 b=ygyXP5BFXZ9IYhYl/Y5B40eEqHfva/x1CsX3k4jCa+A+BC9YVl97fJkah3rCWiAfHh9ugbTWR
 CgNfw+3azKmhYoM4zDB/efAGnCMM2kxVY/fckfx4hotEiQ0tRABHoCFoRXlnNmSeG3CZ25SRkO7
 iLjfUncC8eQU3tGerzVI+/UhlWbQ/m0N/E5dq93/IOw+0Bs+ed7mydvuz2THajfAEh6DSWNkatM
 i/77GmqsUI9LT6j2Z70fWnM2SOpjjaeTJ/7CLOrao5D8j8E8n8fNEmzYE+Gn81m9iyWdETZBjl8
 emyK0kbZLTs5XmgWpCmR1kGK5aRzSMbsNQXE1FRzSCNw==
X-Forward-Email-ID: 68bb0db490d039a4fd84d5ca
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.13
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 2/7] media: rkvdec: Add variants support
Date: Fri,  5 Sep 2025 16:19:20 +0000
Message-ID: <20250905161942.3759717-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905161942.3759717-1-jonas@kwiboo.se>
References: <20250905161942.3759717-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_092010_369022_350CFD6C 
X-CRM114-Status: GOOD (  18.28  )
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

From: Alex Bee <knaerzche@gmail.com>

Different versions of the Rockchip VDEC IP exists and one way they can
differ is what decoding formats are supported.

Add a variant implementation in order to support flagging different
capabilities.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- Use a reference to rkvdec_variant
- Add num_regs field
- Collect r-b tag

Changes in v2:
- No change
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 22 ++++++++++++++++++-
 .../media/platform/rockchip/rkvdec/rkvdec.h   | 11 ++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index c15fc238d6af..daf6d9ab2d1d 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -14,6 +14,7 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -327,6 +328,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.ops = &rkvdec_hevc_fmt_ops,
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
 		.decoded_fmts = rkvdec_hevc_decoded_fmts,
+		.capability = RKVDEC_CAPABILITY_HEVC,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
@@ -343,6 +345,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
 		.decoded_fmts = rkvdec_h264_decoded_fmts,
 		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
+		.capability = RKVDEC_CAPABILITY_H264,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
@@ -358,6 +361,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.ops = &rkvdec_vp9_fmt_ops,
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
 		.decoded_fmts = rkvdec_vp9_decoded_fmts,
+		.capability = RKVDEC_CAPABILITY_VP9,
 	}
 };
 
@@ -1186,8 +1190,18 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+static const struct rkvdec_variant rk3399_rkvdec_variant = {
+	.num_regs = 78,
+	.capabilities = RKVDEC_CAPABILITY_HEVC |
+			RKVDEC_CAPABILITY_H264 |
+			RKVDEC_CAPABILITY_VP9,
+};
+
 static const struct of_device_id of_rkvdec_match[] = {
-	{ .compatible = "rockchip,rk3399-vdec" },
+	{
+		.compatible = "rockchip,rk3399-vdec",
+		.data = &rk3399_rkvdec_variant,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_rkvdec_match);
@@ -1198,16 +1212,22 @@ static const char * const rkvdec_clk_names[] = {
 
 static int rkvdec_probe(struct platform_device *pdev)
 {
+	const struct rkvdec_variant *variant;
 	struct rkvdec_dev *rkvdec;
 	unsigned int i;
 	int ret, irq;
 
+	variant = of_device_get_match_data(&pdev->dev);
+	if (!variant)
+		return -EINVAL;
+
 	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
 	if (!rkvdec)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, rkvdec);
 	rkvdec->dev = &pdev->dev;
+	rkvdec->variant = variant;
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 209dd79ce9bd..c47457c954e5 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -22,6 +22,10 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
+#define RKVDEC_CAPABILITY_HEVC		BIT(0)
+#define RKVDEC_CAPABILITY_H264		BIT(1)
+#define RKVDEC_CAPABILITY_VP9		BIT(2)
+
 struct rkvdec_ctx;
 
 struct rkvdec_ctrl_desc {
@@ -63,6 +67,11 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 			    base.vb.vb2_buf);
 }
 
+struct rkvdec_variant {
+	unsigned int num_regs;
+	unsigned int capabilities;
+};
+
 struct rkvdec_coded_fmt_ops {
 	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
 			  struct v4l2_format *f);
@@ -98,6 +107,7 @@ struct rkvdec_coded_fmt_desc {
 	unsigned int num_decoded_fmts;
 	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
 	u32 subsystem_flags;
+	unsigned int capability;
 };
 
 struct rkvdec_dev {
@@ -111,6 +121,7 @@ struct rkvdec_dev {
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
 	struct iommu_domain *empty_domain;
+	const struct rkvdec_variant *variant;
 };
 
 struct rkvdec_ctx {
-- 
2.51.0


