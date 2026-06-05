Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAE7CD6E7E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWwOgHZdig1DsKeqldI5bKVD0X60HDqn5iucdkMvsx8=; b=3x184vK1jFZHENMzeURLr+MUHx
	RHgUAEfFZQ2x5EDegRhqrjvKAR/M2nEvkFU4mYHVspI5m/SrDDld1aJHQp2vdL4a9Ypx2sAzUzj/g
	BBL7EYlDcX36oisKCB6BDtDD2QLy/UvlN7wPngQI6FshrEhP/mf52nENkWA01XSKTU8fk/qaiK3wl
	PK3PI304LO6V7WpaDxVQFRL/tf81PNrJdqI3rxtqP1oDDEeM0dMoc9t5ktpnHHwPbgt1XTaYHsOiG
	yheeM1VhVNB8B/wyOc8NDMbZ9tb8iN2n8Z6viZMDWF+YOuegatD+pYEDe8MUhghKHECZpFYLmKoCd
	YKypNvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciH-00000001EEs-2Chr;
	Fri, 05 Jun 2026 22:08:25 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciD-00000001E9C-0QRq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:22 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVciB-0000LW-DK; Sat, 06 Jun 2026 00:08:19 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:58 +0200
Subject: [PATCH 12/17] media: rockchip: rga: move core initialization from
 bind to probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-12-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_150821_142529_C62D54C9 
X-CRM114-Status: GOOD (  16.15  )
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

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 83 ++++++++++++++++---------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 952377ae467f5..0413b8518dfc8 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -740,21 +740,49 @@ static int rga_parse_dt(struct rga_core *core)
 
 static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
 	struct rockchip_rga *rga = data;
+	struct rga_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	core->rga = rga;
+
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret < 0)
+		return ret;
+
+	rga->version = rga->hw->get_version(core);
+
+	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
+		  rga->version.major, rga->version.minor);
+
+	pm_runtime_put(core->dev);
+
+	rga->cores[0] = core;
+
+	return 0;
+}
+
+static const struct component_ops rga_core_ops = {
+	.bind = rga_core_bind,
+};
+
+static int rga_core_probe(struct platform_device *pdev)
+{
 	struct rga_core *core;
+	const struct rga_hw *hw;
 	int ret = 0;
 	int irq;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
+	hw = of_device_get_match_data(&pdev->dev);
+	if (!hw)
+		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n");
+
 	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
-	core->rga = rga;
 	core->dev = &pdev->dev;
 
-	rga->cores[0] = core;
-
 	ret = rga_parse_dt(core);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
@@ -775,7 +803,7 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	ret = devm_request_irq(core->dev, irq, rga_isr,
-			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
+			       hw->has_internal_iommu ? 0 : IRQF_SHARED,
 			       dev_name(core->dev), core);
 	if (ret < 0) {
 		dev_err(core->dev, "failed to request irq\n");
@@ -790,42 +818,6 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 
 	platform_set_drvdata(pdev, core);
 
-	ret = pm_runtime_resume_and_get(core->dev);
-	if (ret < 0)
-		goto err_put_clk;
-
-	rga->version = rga->hw->get_version(core);
-
-	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
-		  rga->version.major, rga->version.minor);
-
-	pm_runtime_put(core->dev);
-
-	return 0;
-
-err_put_clk:
-	pm_runtime_disable(core->dev);
-
-	return ret;
-}
-
-static void rga_core_unbind(struct device *dev, struct device *master,
-			    void *data)
-{
-	struct rga_core *core = dev_get_drvdata(dev);
-
-	pm_runtime_disable(core->dev);
-}
-
-static const struct component_ops rga_core_ops = {
-	.bind = rga_core_bind,
-	.unbind = rga_core_unbind,
-};
-
-static int rga_core_probe(struct platform_device *pdev)
-{
-	int ret = 0;
-
 	ret = component_add(&pdev->dev, &rga_core_ops);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to register component: %d", ret);
@@ -833,11 +825,20 @@ static int rga_core_probe(struct platform_device *pdev)
 	}
 
 	return 0;
+
+err_put_clk:
+	pm_runtime_disable(core->dev);
+
+	return ret;
 }
 
 static void rga_core_remove(struct platform_device *pdev)
 {
+	struct rga_core *core = platform_get_drvdata(pdev);
+
 	component_del(&pdev->dev, &rga_core_ops);
+
+	pm_runtime_disable(core->dev);
 }
 
 static int __maybe_unused rga_runtime_suspend(struct device *dev)

-- 
2.54.0


