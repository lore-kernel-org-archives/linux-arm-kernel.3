Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F088DC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 23:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AffjwLL2Q730popPdM+cA5Jw1dmPFrUx6J2FHMVA81w=; b=GS63N6VRZ2i2wuGY3inwam2FRX
	Im5oI02Z6QaYGs7I6DYNTin3YaU2bfVcmf7rNeDEy1uraqStGE28U7OcQigi0v2ePGNoDKlnGRaAo
	0z+zF+zCdZNw1wxhLJuJ6BNNg1CaNwRNzSQ0GvelnJ1wKx3xslwQMxPq0NzNWNQF1hPzIjtz+VBZz
	eKzl+dZUB7tWJ20Z/wLTaudjqMQiTYg+kljpdv8NAKZv1Nr72TnAhJqJuM1Srn3FvOOdPm20FFZhG
	/Tw4Ps0uYKkH/p1F/MU8/IPAdTqXYWEq0PmikkHn8bXK7QQs8hcpVzPctJ+CkWYoWk5VktZQ4DmA5
	/qNLPpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulFFz-00000006AwM-3OTV;
	Sun, 10 Aug 2025 23:15:15 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulE3S-000000064pO-1duz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 21:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1754863093; bh=AffjwLL2Q730popPdM+cA5Jw1dmPFrUx6J2FHMVA81w=;
 b=y98qagGznAStSc2lB/lblDhsvl/xgb84nMZ7kH4MBN1/qtns6g3EgIbJuwIamXvk+GBaN6BZD
 K5OZzE41JMIElX+vxKHIfg9iwF9L9efmBcV6vwH5obyhtbTenozFlSGhmUvx2CToOlHkIWhXaUH
 nm4DJ+LfEmrI6R1B0UFZ9IPDE4reUdlvo4sIXGop6MD+EmtSHuLJjnhRFVD310fQcs986oVEULS
 GHMMD4y1GXStsjUFPngeK15Kvk2sKq6qnPP09zyvUYMya+1uMFS3NxFBUVz2sBgCIe03lRXcTjn
 geyWPvMW0BK1tKKV6hOFKOceZv+aCeID4XoN3gmu2BWw==
X-Forward-Email-ID: 68990e5e797ab89627792409
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.4
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
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 2/7] media: rkvdec: Add variants support
Date: Sun, 10 Aug 2025 21:24:32 +0000
Message-ID: <20250810212454.3237486-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810212454.3237486-1-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_145814_467381_DE2BC2D7 
X-CRM114-Status: GOOD (  17.91  )
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
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 21 ++++++++++++++++++-
 .../media/platform/rockchip/rkvdec/rkvdec.h   | 10 +++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index cfb326600a2d..e7b9dfc2d1ab 100644
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
 
@@ -1187,8 +1191,17 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+static const struct rkvdec_variant rk3399_rkvdec_variant = {
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
@@ -1199,16 +1212,22 @@ static const char * const rkvdec_clk_names[] = {
 
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
+	rkvdec->capabilities = variant->capabilities;
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index c062c5c5bbb2..8e1f8548eae4 100644
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
@@ -63,6 +67,10 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 			    base.vb.vb2_buf);
 }
 
+struct rkvdec_variant {
+	unsigned int capabilities;
+};
+
 struct rkvdec_coded_fmt_ops {
 	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
 			  struct v4l2_format *f);
@@ -98,6 +106,7 @@ struct rkvdec_coded_fmt_desc {
 	unsigned int num_decoded_fmts;
 	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
 	u32 subsystem_flags;
+	unsigned int capability;
 };
 
 struct rkvdec_dev {
@@ -111,6 +120,7 @@ struct rkvdec_dev {
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
 	struct iommu_domain *empty_domain;
+	unsigned int capabilities;
 };
 
 struct rkvdec_ctx {
-- 
2.50.1


