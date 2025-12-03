Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204B8D12D7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1IA/+Qu41WxU9AWiOEOk7GTm3YRmFtC7HajfLWCgts=; b=zetRecs1NcPSdCLZ3IO1Pfy1pG
	YmOPQ25Ceqc/xpsWaL6c6OVrIQn6ZjjJ9wUiQu/rYLAxQWjs3N0lNABq/9OSG7PjAMi56MRGq9UTi
	tPW+3rBIdHts4nvj/MbTZLy6FiA2nA47nYo+X+IZxBiWuz7vBXIzKQNQXzdsrFqeXQrzjbKYBjH1V
	JeYZ1fNbVh80ThDplTjc9JY+7Omk42wCP0aaIKRf/6jLIZjVkturSU/Jg/cdmvAYhIvNLqETtJGfY
	5W0B81O1LTYZKBQ0zASOflcU3RTPx6ciC+7K2AlkRrQOc4wUBn6uu9C4WSeih9cxlZ+WZPFWx2Sy/
	7NYi38gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAx-00000006jQV-3xoP;
	Wed, 03 Dec 2025 15:53:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAm-00000006j96-3MIU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Dec 2025 15:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=l1IA/+Qu41WxU9AWiOEOk7GTm3YRmFtC7HajfLWCgts=; b=WA45vs/cnwT/fN9RQ62KEVkkSn
	a0ZQAb0jQqyEolSe6CmFV9jIxS4IY9U7P7s0fyHoHODswo+34N7TDDHkSo1DnNwZ10Jsw3BIv26yf
	IuHr4fgVYOsy9cgbJXGxZUL0+JGgX1KCj9kY0Kv8l3uzJSurYqQqXFIoLqoSofmM5cOvkUYJkCPvD
	JjmYD8Tn59vLXkKRPavHEudxQAOKDbXPSmfxfrSh914RuCufNCf+ETmxhSnTQiJbSLtHEzRwVo+4w
	l4x4t1KKFzw2COIhuIlO37gTBqu5OErThA1ZFjLRH7fUZhyblt2BRKibF9PRFOJg2h8XXsw1KLwON
	NMJfIXhw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQoJA-00000002TB7-32RA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 14:58:23 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQpAe-0007dW-OX; Wed, 03 Dec 2025 16:53:36 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 03 Dec 2025 16:52:41 +0100
Subject: [PATCH v2 19/22] media: rockchip: rga: add feature flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251203-spu-rga3-v2-19-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
In-Reply-To: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_145821_089565_AE22F39E 
X-CRM114-Status: GOOD (  15.52  )
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

In preparation to the RGA3 addition add feature flags, which can limit
the exposed feature set of the video device, like rotating or selection
support. This is necessary as the RGA3 doesn't initially implement the
full feature set currently exposed by the driver.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c |  4 ++++
 drivers/media/platform/rockchip/rga/rga.c    | 23 +++++++++++++++--------
 drivers/media/platform/rockchip/rga/rga.h    |  7 +++++++
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index a868a34a1452e..0d1cf911af0d5 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -658,6 +658,10 @@ const struct rga_hw rga2_hw = {
 	.max_height = MAX_HEIGHT,
 	.max_scaling_factor = MAX_SCALING_FACTOR,
 	.stride_alignment = 4,
+	.features = RGA_FEATURE_FLIP
+		  | RGA_FEATURE_ROTATE
+		  | RGA_FEATURE_BG_COLOR
+		  | RGA_FEATURE_SELECTION,
 
 	.setup_cmdbuf = rga_hw_setup_cmdbuf,
 	.start = rga_hw_start,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index c991cc64b4b7f..3958e71b8987d 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -162,17 +162,21 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 4);
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (rga->hw->features & RGA_FEATURE_FLIP) {
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_HFLIP, 0, 1, 1, 0);
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_VFLIP, 0, 1, 1, 0);
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	}
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_ROTATE, 0, 270, 90, 0);
+	if (rga->hw->features & RGA_FEATURE_ROTATE)
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_ROTATE, 0, 270, 90, 0);
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_BG_COLOR, 0, 0xffffffff, 1, 0);
+	if (rga->hw->features & RGA_FEATURE_BG_COLOR)
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_BG_COLOR, 0, 0xffffffff, 1, 0);
 
 	if (ctx->ctrl_handler.error) {
 		int err = ctx->ctrl_handler.error;
@@ -489,6 +493,9 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	struct rga_frame *f;
 	int ret = 0;
 
+	if (!(rga->hw->features & RGA_FEATURE_SELECTION))
+		return -EINVAL;
+
 	f = rga_get_frame(ctx, s->type);
 	if (IS_ERR(f))
 		return PTR_ERR(f);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 980f70f842317..b9c75b5fda4dc 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -6,6 +6,7 @@
 #ifndef __RGA_H__
 #define __RGA_H__
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/platform_device.h>
 #include <media/videobuf2-v4l2.h>
@@ -132,6 +133,11 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 	rga_write(rga, reg, temp);
 };
 
+#define RGA_FEATURE_FLIP	BIT(0)
+#define RGA_FEATURE_ROTATE	BIT(1)
+#define RGA_FEATURE_BG_COLOR	BIT(2)
+#define RGA_FEATURE_SELECTION	BIT(3)
+
 struct rga_hw {
 	const char *card_type;
 	bool has_internal_iommu;
@@ -140,6 +146,7 @@ struct rga_hw {
 	u32 max_width, max_height;
 	u8 max_scaling_factor;
 	u8 stride_alignment;
+	u8 features;
 
 	void (*setup_cmdbuf)(struct rga_ctx *ctx);
 	void (*start)(struct rockchip_rga *rga,

-- 
2.52.0


