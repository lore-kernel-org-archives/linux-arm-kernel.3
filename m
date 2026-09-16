Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BA2C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JnE2mYQ6aIccqmVyqw7jqDQIjCMOYMPfE0PgAcBbb8=; b=wgJFYeHq3kwIfw0YITdf0Ft91v
	roz9Bjv3ZKEetKqRUAf85HYM/441JGFepvMfNPtQzSpwb/YPdTGrZdz+TL42spP47MVmCEC+4KGSZ
	SgFYc/KBJ6qMXMnjLXHkVipz2Y6NzyHx8CuMqnttP/LZlypShNc2pQIHEN8c+EPIVNJGWQzb+QeYo
	mIQ2qRSaQ4xFCjHHP8SYHh9wxNdGNL5Pbj7Uay/TD0XHZmUUos9GrdcaCi54Hq8ugyclQd+/uXRKF
	NKn5XSHzGzdXodN/aqR+b3rBFT+MvDF03lSTufVMHVtP/d3NsZt3pXhceLPAbgr8ufX1oetBMVhSi
	ibtRvjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rLs-00000009Xk3-1rJr;
	Wed, 16 Sep 2026 15:15:12 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rLj-00000009XdI-3fO8;
	Wed, 16 Sep 2026 15:15:05 +0000
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EA247205A08;
	Wed, 16 Sep 2026 17:14:58 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGm-001Fsx-1G;
	Wed, 16 Sep 2026 17:09:56 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:55 +0200
Subject: [PATCH v2 14/17] media: rockchip: rga: move video device to the
 master
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-14-23aa2cb74e61@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260916_081504_213370_203F9331 
X-CRM114-Status: GOOD (  23.35  )
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

As v4l2_device_register sets the drvdata (if it hasn't been set) to it's
v4l2_device struct pointer, v4l2_device_unregister also zeroes it if the
drvdata matches this pointer. This creates a problem, as the driver
allocates it's main rockchip_rga struct during probe and sets it as it's
drvdata. As the v4l2_device struct is the first element of the
rockchip_rga struct, it has the same pointer than the rockchip_rga
struct. Therefore v4l2_device_unregister incorrectly assumes that it has
set the drvdata and clears it. This causes problems, as unbinding a
core will unbind the master component, but not remove it. Therefore when
adding the core again, the master component will be bound again and
tries to access an NULL pointer.

As the rga core binding expects the rockchip_rga struct to be fully
initialized, bind the cores as the last step of the rga master bind.
This also avoids a potential isr to hit just between the core bind and
the actual initialization of the m2m device.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2
- unbind components in the error handling of rga bind
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=11)
- Bind cores at the end, as they expect a fully initialized rga struct
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=11)
- Fix v4l2_device_unregister clearing the drvdata set on probe
---
 drivers/media/platform/rockchip/rga/rga.c | 109 ++++++++++++++++--------------
 1 file changed, 58 insertions(+), 51 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index fa34b93b1b7a5..39fcb5623095b 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -746,39 +746,15 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
 	struct rockchip_rga *rga = data;
 	struct rga_core *core = dev_get_drvdata(dev);
-	struct video_device *vfd;
 	int ret = 0;
 
 	core->rga = rga;
 
 	rga->cores[0] = core;
 
-	ret = v4l2_device_register(dev, &rga->v4l2_dev);
-	if (ret)
-		return ret;
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
-	rga->m2m_dev = v4l2_m2m_init(&rga_m2m_ops);
-	if (IS_ERR(rga->m2m_dev)) {
-		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
-		ret = PTR_ERR(rga->m2m_dev);
-		goto rel_vdev;
-	}
-
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
-		goto rel_m2m;
+		return ret;
 
 	rga->version = rga->hw->get_version(core);
 
@@ -787,38 +763,13 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 
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
-
-rel_m2m:
-	v4l2_m2m_release(rga->m2m_dev);
-rel_vdev:
-	video_device_release(vfd);
-unreg_v4l2_dev:
-	v4l2_device_unregister(&rga->v4l2_dev);
-
-	return ret;
 }
 
 static void rga_core_unbind(struct device *dev, struct device *master,
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
 
 	core->rga = NULL;
 }
@@ -944,20 +895,76 @@ static struct platform_driver rga_core_pdrv = {
 static int rga_bind(struct device *dev)
 {
 	struct rockchip_rga *rga = dev_get_drvdata(dev);
+	struct video_device *vfd;
 	int ret;
 
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
 	ret = component_bind_all(dev, rga);
 	if (ret) {
 		dev_err(dev, "component bind failed\n");
-		return ret;
+		goto rel_m2m;
 	}
 
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
+	dev_set_drvdata(dev, rga);
+	return ret;
 }
 
 static void rga_unbind(struct device *dev)
 {
+	struct rockchip_rga *rga = dev_get_drvdata(dev);
+
+	v4l2_info(&rga->v4l2_dev, "Removing\n");
+
 	component_unbind_all(dev, NULL);
+
+	v4l2_m2m_release(rga->m2m_dev);
+	video_unregister_device(rga->vfd);
+	v4l2_device_unregister(&rga->v4l2_dev);
+	/*
+	 * As &rga->v4l2_dev == rga, v4l2_device_unregister (incorrectly)
+	 * clears the drvdata. Therefore just set it again
+	 * (ensuring it's correct regardless of the struct member position)
+	 */
+	dev_set_drvdata(dev, rga);
 }
 
 struct component_master_ops rga_master_ops = {

-- 
2.55.0


