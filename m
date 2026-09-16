Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5C9C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3sefut7na8W9ISmWkPATT8KcDt3jrAfUcBfX9sSxF0=; b=SOrxVpo2Bd1907XjTSFQF5N1Jk
	aWwjA0g9VKgJTFb/e8CVHqEeqTThoi2PMMP2/vw8HmHMyaJWO33ppbKHu4afLtoeYNZXAq0pR3Dso
	DYV6BdyUpc+PTlB4jaB0Z9N8/YI5BW2zkjlfvIYZCeGYbRgFeEUkVp7xAiHzlHUhpHvzUtYKFRLWI
	RthMEhJDKOm70zBmk/HKxMDY47nnq4pbzU7cFnOr7ZVdHjjGUdu7KbAX8azWm1sQaCtWf8wv/nTF7
	d7NWp2lPUfuI05M1Z2GRqLkAZRt+o2FN++FZeBXyVA3Cx1UiIpXA53tp/ebnmuynJy7miSVmuzSJb
	qTkU0qdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rLj-00000009Xda-2Rm5;
	Wed, 16 Sep 2026 15:15:03 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rLg-00000009Xc3-221U;
	Wed, 16 Sep 2026 15:15:02 +0000
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7998C205A01;
	Wed, 16 Sep 2026 17:14:58 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGl-001Fsx-25;
	Wed, 16 Sep 2026 17:09:55 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:54 +0200
Subject: [PATCH v2 13/17] media: rockchip: rga: move core initialization
 from bind to probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-13-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_081500_682117_5E2BE8AD 
X-CRM114-Status: GOOD (  19.69  )
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

Move the core initialization from the core binding function to the core
probing function. This better matches the actual sequence, where the
core probe initializes most things and the bind function just binds the
core to the actual rga struct from the master device.

As the probe has no rockchip_rga struct, it has to get the
rga_hw struct from the of match data to determine if the given core has
an iommu.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2
- indirectly fixed component_add error path not using goto err_put_clk
  by using devres version for pm (pointed out by Sashiko and Nicolas)
- reordered commit for a better diff
- Avoid NULL pointer deref when interrupt fires on an unbound core
---
 drivers/media/platform/rockchip/rga/rga.c | 97 ++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 37ccac5b406a4..fa34b93b1b7a5 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -72,6 +72,10 @@ static irqreturn_t rga_isr(int irq, void *prv)
 	struct rga_core *core = prv;
 	struct rockchip_rga *rga = core->rga;
 
+	/* ignore interrupt on an unbound core */
+	if (!rga)
+		return IRQ_HANDLED;
+
 	if (rga->hw->handle_irq(core)) {
 		struct vb2_v4l2_buffer *src, *dst;
 		struct rga_ctx *ctx = core->curr;
@@ -740,55 +744,16 @@ static int rga_parse_dt(struct rga_core *core)
 
 static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
 	struct rockchip_rga *rga = data;
-	struct rga_core *core;
+	struct rga_core *core = dev_get_drvdata(dev);
 	struct video_device *vfd;
 	int ret = 0;
-	int irq;
-
-	if (!pdev->dev.of_node)
-		return -ENODEV;
-
-	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
-	if (!core)
-		return -ENOMEM;
 
 	core->rga = rga;
-	core->dev = &pdev->dev;
 
 	rga->cores[0] = core;
 
-	ret = rga_parse_dt(core);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
-
-	ret = devm_pm_runtime_enable(core->dev);
-	if (ret)
-		return ret;
-
-	pm_runtime_set_autosuspend_delay(core->dev, 50);
-	pm_runtime_use_autosuspend(core->dev);
-
-	core->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(core->regs))
-		return PTR_ERR(core->regs);
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_irq(core->dev, irq, rga_isr,
-			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
-			       dev_name(core->dev), core);
-	if (ret < 0)
-		return dev_err_probe(core->dev, ret, "failed to request irq\n");
-
-	ret = dma_set_mask_and_coherent(core->dev, DMA_BIT_MASK(32));
-	if (ret)
-		dev_err_probe(core->dev, ret, "32-bit DMA not supported");
-
-	ret = v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
+	ret = v4l2_device_register(dev, &rga->v4l2_dev);
 	if (ret)
 		return ret;
 	vfd = video_device_alloc();
@@ -804,7 +769,6 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	video_set_drvdata(vfd, rga);
 	rga->vfd = vfd;
 
-	platform_set_drvdata(pdev, core);
 	rga->m2m_dev = v4l2_m2m_init(&rga_m2m_ops);
 	if (IS_ERR(rga->m2m_dev)) {
 		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
@@ -855,6 +819,8 @@ static void rga_core_unbind(struct device *dev, struct device *master,
 	v4l2_m2m_release(rga->m2m_dev);
 	video_unregister_device(rga->vfd);
 	v4l2_device_unregister(&rga->v4l2_dev);
+
+	core->rga = NULL;
 }
 
 static const struct component_ops rga_core_ops = {
@@ -864,7 +830,54 @@ static const struct component_ops rga_core_ops = {
 
 static int rga_core_probe(struct platform_device *pdev)
 {
+	struct rga_core *core;
+	const struct rga_hw *hw;
 	int ret = 0;
+	int irq;
+
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	hw = of_device_get_match_data(&pdev->dev);
+	if (!hw)
+		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n");
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	core->dev = &pdev->dev;
+
+	ret = rga_parse_dt(core);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
+
+	ret = devm_pm_runtime_enable(core->dev);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(core->dev, 50);
+	pm_runtime_use_autosuspend(core->dev);
+
+	core->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->regs))
+		return PTR_ERR(core->regs);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(core->dev, irq, rga_isr,
+			       hw->has_internal_iommu ? 0 : IRQF_SHARED,
+			       dev_name(core->dev), core);
+	if (ret < 0)
+		return dev_err_probe(core->dev, ret, "failed to request irq\n");
+
+	ret = dma_set_mask_and_coherent(core->dev, DMA_BIT_MASK(32));
+	if (ret)
+		dev_err_probe(core->dev, ret, "32-bit DMA not supported");
+
+	platform_set_drvdata(pdev, core);
 
 	ret = component_add(&pdev->dev, &rga_core_ops);
 	if (ret < 0)

-- 
2.55.0


