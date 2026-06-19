Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F134CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 05:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ej7iBkg+VHHSqEkEi6uSBjsGG2eRVSnnX8nMNo9Deg8=; b=TfXl2SVTUC4eE7HaVjY9fA39fH
	ASIWfzqYD8ZxLmWRE+Vs/p52kAIUtwd6fZQkLVHMKFKZ3KIC4EoAZuUDE/xpbpYugVwrgs3Dw1dq9
	2s0gSVrKQAx/fodnL4ES2n1QhLY22mZ+8D8s+tia8gmyO2IpfQGD5R6X8rfuD/5pEuxoSwNqJ92Cw
	wZSQ7oaYYIUTw+5H2GA3QwTzgn+BYFTJzPjFVkfUV1BfHGdy3mamsd05/3IHvpPDI8V/IqdP2bliX
	vnTlueffOaHxWq3je4P9Sw6Qi4luc4HN9Vwa+02UnVIuhDOVtUP48X3NDVhVlj9+cpMEHbSuZnNnT
	C453Lekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRl7-000000020Jg-3N8G;
	Fri, 19 Jun 2026 05:27:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRl3-000000020FS-1aZi;
	Fri, 19 Jun 2026 05:27:14 +0000
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:327:f131:c148:b7f8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12BCD16CB;
	Fri, 19 Jun 2026 07:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781846796;
	bh=QnDVv3PMSR+bMRnOEYkvFZrCcz9vpEPE/77orFsXWGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p4ebt1P0dF/qmFlJgTmGp1UaORVFW4gB+w4mfbpOCX3U3Bc7qfQuPkVzZBR2Pn45E
	 ZRC7zd/KwiDYFUYjoi/X1BkBk8VF8IylBQSH9S0uhMrShIhzJQAF1JCtfwecU/Wilj
	 4k5NO1OC56o/I6DoIEHkDMvFSn26fZ+ZArudey5s=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	nicolas.dufresne@collabora.com,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com
Subject: [RFC PATCH 3/6] media: rkcif: Use shared media graph
Date: Fri, 19 Jun 2026 14:26:30 +0900
Message-ID: <20260619052637.1110672-4-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_222713_630232_3208C6A8 
X-CRM114-Status: GOOD (  15.62  )
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

Make rkcif use shared media graph. This allows it to be in the same
media graph as rkisp2 on the rk3588, opening to door to allowing the
entire capture pipeline to run in inline mode.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkcif/rkcif-common.h    |  2 +-
 .../media/platform/rockchip/rkcif/rkcif-dev.c | 32 +++++++++----------
 .../platform/rockchip/rkcif/rkcif-interface.c | 10 ++++++
 3 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 4d9211ba9bda..f2989d152ba2 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -242,7 +242,7 @@ struct rkcif_device {
 
 	struct rkcif_interface interfaces[RKCIF_IF_MAX];
 
-	struct media_device media_dev;
+	struct media_device *media_dev;
 	struct v4l2_device v4l2_dev;
 	struct v4l2_async_notifier notifier;
 };
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index be3a174b9aab..4c86e3e2f3cd 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <media/mc-shared-graph.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
 
@@ -165,6 +166,7 @@ static int rkcif_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rkcif_device *rkcif;
+	struct media_device *mdev;
 	int ret, irq;
 
 	rkcif = devm_kzalloc(dev, sizeof(*rkcif), GFP_KERNEL);
@@ -212,22 +214,22 @@ static int rkcif_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	rkcif->media_dev.dev = dev;
-	strscpy(rkcif->media_dev.model, RKCIF_DRIVER_NAME,
-		sizeof(rkcif->media_dev.model));
-	media_device_init(&rkcif->media_dev);
+	mdev = media_device_shared_join(rkcif->dev);
+	if (IS_ERR(mdev)) {
+		dev_err(dev, "failed to register media device: %d\n", ret);
+		goto err_pm_runtime_disable;
+	}
+
+	rkcif->media_dev = mdev;
+	rkcif->media_dev->dev = dev;
+	strscpy(rkcif->media_dev->model, RKCIF_DRIVER_NAME,
+		sizeof(rkcif->media_dev->model));
 
-	rkcif->v4l2_dev.mdev = &rkcif->media_dev;
+	rkcif->v4l2_dev.mdev = rkcif->media_dev;
 	ret = v4l2_device_register(dev, &rkcif->v4l2_dev);
 	if (ret)
 		goto err_media_dev_cleanup;
 
-	ret = media_device_register(&rkcif->media_dev);
-	if (ret < 0) {
-		dev_err(dev, "failed to register media device: %d\n", ret);
-		goto err_v4l2_dev_unregister;
-	}
-
 	v4l2_async_nf_init(&rkcif->notifier, &rkcif->v4l2_dev);
 	rkcif->notifier.ops = &rkcif_notifier_ops;
 
@@ -247,11 +249,10 @@ static int rkcif_probe(struct platform_device *pdev)
 	rkcif_unregister(rkcif);
 err_notifier_cleanup:
 	v4l2_async_nf_cleanup(&rkcif->notifier);
-	media_device_unregister(&rkcif->media_dev);
-err_v4l2_dev_unregister:
 	v4l2_device_unregister(&rkcif->v4l2_dev);
 err_media_dev_cleanup:
-	media_device_cleanup(&rkcif->media_dev);
+	media_device_shared_leave(rkcif->media_dev, rkcif->dev);
+err_pm_runtime_disable:
 	pm_runtime_disable(&pdev->dev);
 	return ret;
 }
@@ -263,9 +264,8 @@ static void rkcif_remove(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&rkcif->notifier);
 	rkcif_unregister(rkcif);
 	v4l2_async_nf_cleanup(&rkcif->notifier);
-	media_device_unregister(&rkcif->media_dev);
 	v4l2_device_unregister(&rkcif->v4l2_dev);
-	media_device_cleanup(&rkcif->media_dev);
+	media_device_shared_leave(rkcif->media_dev, rkcif->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
index 414a9980cf2e..cd791186f224 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2025 Collabora, Ltd.
  */
 
+#include <media/mc-shared-graph.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
@@ -399,6 +400,15 @@ int rkcif_interface_register(struct rkcif_device *rkcif,
 	if (ret)
 		goto err_subdev_unregister;
 
+	ret = media_device_shared_join_link_source(interface->rkcif->media_dev,
+						   interface->rkcif->dev,
+						   &interface->sd.entity,
+						   RKCIF_IF_PAD_SRC,
+						   0);
+	if (ret)
+		goto err_subdev_unregister;
+
+
 	return 0;
 
 err_subdev_unregister:
-- 
2.47.2


