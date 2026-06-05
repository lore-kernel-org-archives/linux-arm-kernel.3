Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9D6CD8C84
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLT0GNvljPA5f0NrBYk5mhy11UbhmDL30jAW3YCVuJc=; b=RvccmJLz4Fh3UVEjQCPIV+qQw1
	Klv53o/4oTbCO97vtVYSclFclk7H3ovDWpSiD6ULg/sTPeBzwPfUDvVhhfIR1HfYRo8BXyEQjbH4B
	GOT2g+q6u2/JNbAnsZKEUbRi/xoz0IYN2ZkELhxlXa5m+jyFYLaWAFmV4pn1l99qstiyu8+ga3YMX
	kRYhnqqVsxHoMBAAtzgpXWlwD5DMfQ6rg2lPS0uM8manDMi8gYjcAf8+qaGcY4a+MKelj4ZYWcGbt
	KIR7LPtdANO4+/NITi++g0hPRmd1vcuazzLN5TTsFS3X3g2ef79D+wz2RZm59mgDPuj8PtTQi3nqs
	8uJ4CVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciW-00000001EqI-3Zb7;
	Fri, 05 Jun 2026 22:08:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciQ-00000001EWD-04KY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:35 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci9-0000LW-EE; Sat, 06 Jun 2026 00:08:17 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:56 +0200
Subject: [PATCH 10/17] media: rockchip: rga: move rockchip_rga allocation
 to master probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-10-3ec2b15675f7@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260605_150834_076248_833F18C8 
X-CRM114-Status: GOOD (  16.22  )
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

Move the rockchip_rga struct allocation to the master component probe
function in preparation of enabling all cores. This also adjusts the
allocation to use the actual number of cores found in the of tree
instead of being fixed to one core.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 32 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 178f45b8da940..11912bf5b6906 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -741,7 +741,7 @@ static int rga_parse_dt(struct rga_core *core)
 static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct rockchip_rga *rga;
+	struct rockchip_rga *rga = data;
 	struct rga_core *core;
 	struct video_device *vfd;
 	int ret = 0;
@@ -750,17 +750,6 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	rga = devm_kzalloc(&pdev->dev, sizeof(*rga) + 1 * sizeof(*rga->cores), GFP_KERNEL);
-	if (!rga)
-		return -ENOMEM;
-
-	rga->hw = of_device_get_match_data(&pdev->dev);
-	if (!rga->hw)
-		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n");
-
-	spin_lock_init(&rga->ctrl_lock);
-	mutex_init(&rga->mutex);
-
 	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
 	core->rga = rga;
 	core->dev = &pdev->dev;
@@ -947,9 +936,10 @@ static struct platform_driver rga_core_pdrv = {
 
 static int rga_bind(struct device *dev)
 {
+	struct rockchip_rga *rga = dev_get_drvdata(dev);
 	int ret;
 
-	ret = component_bind_all(dev, NULL);
+	ret = component_bind_all(dev, rga);
 	if (ret) {
 		dev_err(dev, "component bind failed\n");
 		return ret;
@@ -974,6 +964,8 @@ static int rga_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct component_match *match = NULL;
 	struct device_node *core_node;
+	struct rockchip_rga *rga;
+	u8 num_cores = 0;
 
 	if (!match_desc)
 		return dev_err_probe(dev, -ENODEV, "missing platform data\n");
@@ -985,6 +977,7 @@ static int rga_probe(struct platform_device *pdev)
 		of_node_get(core_node);
 		component_match_add_release(dev, &match, component_release_of,
 					    component_compare_of, core_node);
+		num_cores++;
 
 		/*
 		 * As multi core is not implemented yet,
@@ -1000,6 +993,19 @@ static int rga_probe(struct platform_device *pdev)
 			dev, -ENODEV,
 			"no matching available component devices found\n");
 
+	rga = devm_kzalloc(dev, sizeof(*rga) + num_cores * sizeof(*rga->cores), GFP_KERNEL);
+	if (!rga)
+		return -ENOMEM;
+
+	rga->hw = match_desc->data;
+	if (!rga->hw)
+		return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
+
+	spin_lock_init(&rga->ctrl_lock);
+	mutex_init(&rga->mutex);
+
+	dev_set_drvdata(dev, rga);
+
 	return component_master_add_with_match(dev, &rga_master_ops, match);
 }
 

-- 
2.54.0


