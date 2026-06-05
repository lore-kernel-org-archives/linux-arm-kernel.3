Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A57CCD8C8B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/7rcyIQtutcBYj9IbnNqGtWoyfc9FchNxqTEqgDVTA=; b=BJa+kAXTP+S6T15WeVMYeQcAmc
	fnlq9lMs8/5MKgmR81gdL/MXT+0FFPjAN+crmsRhy3XBVOo8NIoBgBNWXoOXKuOXnqhQs8eYDcuei
	qLieULcunoqxMTefZ1AbOWlQ5j6z7EnsnjavYvJMP/wZ8TMQMJRLvzPAyZBW6KD5GgXA4UyPkZyJ9
	gWepXGGgXrOpDLVDqRTZmF1xK4NZFk1+ncQvO3JyW2gtMqSmkbMEttyh08zu1jQfA57e3Gw60TeUl
	+GI2e+8J2U++qcvSomVX/4lcbxkaTOQjt/qkK0/JI9OSt+69XhBgqi7leB0VxjddwbOk3VTsZDlNk
	n8H3HZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciH-00000001EEZ-1mXO;
	Fri, 05 Jun 2026 22:08:25 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciC-00000001E8V-0Wxa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:21 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVciA-0000LW-Cf; Sat, 06 Jun 2026 00:08:18 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:57 +0200
Subject: [PATCH 11/17] media: rockchip: rga: move video device to the
 master
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-11-3ec2b15675f7@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260605_150820_172144_54656434 
X-CRM114-Status: GOOD (  18.29  )
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

Move the video device allocation and registration to the master
component bind function in preparation for binding multiple cores
to the master. Moving it to the master bind function allows to
only register the v4l2 device when all cores have been successfully
bound to the master device. This also causes the video device to be
bound against the master platform device instead of a specific core.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 96 ++++++++++++++++---------------
 1 file changed, 50 insertions(+), 46 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 11912bf5b6906..952377ae467f5 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -743,7 +743,6 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct rockchip_rga *rga = data;
 	struct rga_core *core;
-	struct video_device *vfd;
 	int ret = 0;
 	int irq;
 
@@ -789,33 +788,11 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 		goto err_put_clk;
 	}
 
-	ret = v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
-	if (ret)
-		goto err_put_clk;
-	vfd = video_device_alloc();
-	if (!vfd) {
-		v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
-		ret = -ENOMEM;
-		goto unreg_v4l2_dev;
-	}
-	*vfd = rga_videodev;
-	vfd->lock = &rga->mutex;
-	vfd->v4l2_dev = &rga->v4l2_dev;
-
-	video_set_drvdata(vfd, rga);
-	rga->vfd = vfd;
-
 	platform_set_drvdata(pdev, core);
-	rga->m2m_dev = v4l2_m2m_init(&rga_m2m_ops);
-	if (IS_ERR(rga->m2m_dev)) {
-		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
-		ret = PTR_ERR(rga->m2m_dev);
-		goto rel_vdev;
-	}
 
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
-		goto rel_m2m;
+		goto err_put_clk;
 
 	rga->version = rga->hw->get_version(core);
 
@@ -824,23 +801,8 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_put(core->dev);
 
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
-	if (ret) {
-		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
-		goto rel_m2m;
-	}
-
-	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
-		  vfd->name, video_device_node_name(vfd));
-
 	return 0;
 
-rel_m2m:
-	v4l2_m2m_release(rga->m2m_dev);
-rel_vdev:
-	video_device_release(vfd);
-unreg_v4l2_dev:
-	v4l2_device_unregister(&rga->v4l2_dev);
 err_put_clk:
 	pm_runtime_disable(core->dev);
 
@@ -851,13 +813,6 @@ static void rga_core_unbind(struct device *dev, struct device *master,
 			    void *data)
 {
 	struct rga_core *core = dev_get_drvdata(dev);
-	struct rockchip_rga *rga = core->rga;
-
-	v4l2_info(&rga->v4l2_dev, "Removing\n");
-
-	v4l2_m2m_release(rga->m2m_dev);
-	video_unregister_device(rga->vfd);
-	v4l2_device_unregister(&rga->v4l2_dev);
 
 	pm_runtime_disable(core->dev);
 }
@@ -937,6 +892,7 @@ static struct platform_driver rga_core_pdrv = {
 static int rga_bind(struct device *dev)
 {
 	struct rockchip_rga *rga = dev_get_drvdata(dev);
+	struct video_device *vfd;
 	int ret;
 
 	ret = component_bind_all(dev, rga);
@@ -945,11 +901,59 @@ static int rga_bind(struct device *dev)
 		return ret;
 	}
 
+	ret = v4l2_device_register(dev, &rga->v4l2_dev);
+	if (ret)
+		return ret;
+	vfd = video_device_alloc();
+	if (!vfd) {
+		v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
+		ret = -ENOMEM;
+		goto unreg_v4l2_dev;
+	}
+	*vfd = rga_videodev;
+	vfd->lock = &rga->mutex;
+	vfd->v4l2_dev = &rga->v4l2_dev;
+
+	video_set_drvdata(vfd, rga);
+	rga->vfd = vfd;
+
+	rga->m2m_dev = v4l2_m2m_init(&rga_m2m_ops);
+	if (IS_ERR(rga->m2m_dev)) {
+		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
+		ret = PTR_ERR(rga->m2m_dev);
+		goto rel_vdev;
+	}
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
+		goto rel_m2m;
+	}
+
+	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
+		  vfd->name, video_device_node_name(vfd));
+
 	return 0;
+
+rel_m2m:
+	v4l2_m2m_release(rga->m2m_dev);
+rel_vdev:
+	video_device_release(vfd);
+unreg_v4l2_dev:
+	v4l2_device_unregister(&rga->v4l2_dev);
+	return ret;
 }
 
 static void rga_unbind(struct device *dev)
 {
+	struct rockchip_rga *rga = dev_get_drvdata(dev);
+
+	v4l2_info(&rga->v4l2_dev, "Removing\n");
+
+	v4l2_m2m_release(rga->m2m_dev);
+	video_unregister_device(rga->vfd);
+	v4l2_device_unregister(&rga->v4l2_dev);
+
 	component_unbind_all(dev, NULL);
 }
 

-- 
2.54.0


