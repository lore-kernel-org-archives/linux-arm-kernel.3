Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A441C2A079
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuIvcq7drU9eatPBMs/qyzSrFQMsSzSQssjw4BpuGcI=; b=3YO4EEHrQQUkBAHId54B0l8jci
	4gx7qPgWRq5BIwhwqq3HVKV6nlJidaPXZTS10PXV5i8OAtntDDUP3q+s2+VZSRvNMCTtgJ6Kh9mXy
	i9AAariHDzmPD0Vl2nG+8b1xL4rGk8DSUyuWmgzVhbOXR9V8XtzR2wyK4ZF0YMBCWySER2vMEmCEE
	hoYStDCQoQWC3SXzm9zx4MU5avJr2oMSLgPpzQIqLu+JsU17N3zdAzt9tHS2hoGbEd6MqCEbbj0WZ
	YZ/QZSTsQRh+1CAASRfB6sXVBE5qh1jnWU15xVeqhf5662lXnxoY42MvfFzj3PcgWRo95mA2QLmI0
	WWWqgSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgQA-0000000B1JH-1Kap;
	Mon, 05 Jan 2026 08:58:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgQ2-0000000B1GW-3pN3;
	Mon, 05 Jan 2026 08:58:37 +0000
Received: from mail.ideasonboard.com (unknown [223.190.87.50])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0967622A;
	Mon,  5 Jan 2026 09:58:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767603489;
	bh=yaP3HyKstBhKWf2536vAbnaHRYAmQhF5Pn7rz8yvAm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aP4I+0RyVbaPlmv0gI1lCr7ICSFm+QBe2dzmy3/0qoViabq2wYHQ1L85X4nGgkztV
	 ECY9220BPnXc9jMBl9jHvqPITmNPGWCogkmGVRcq9u/9u40wUnPRdVviCFs/yp6krv
	 oyO7Szurqwq1sAL4Bpxiiqq704pdoLHUh2M3EmpE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 05 Jan 2026 14:26:48 +0530
Subject: [PATCH v2 2/6] platform/raspberrypi: vchiq: Store audio device in
 driver management struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-b4-vc-sm-cma-v2-2-4daea749ced9@ideasonboard.com>
References: <20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com>
In-Reply-To: <20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=yaP3HyKstBhKWf2536vAbnaHRYAmQhF5Pn7rz8yvAm4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpW3z6Mn9Yr/vXGIvYrWYdNbtQ0+Bt8XuJQuqPg
 iFAbXHGs72JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaVt8+gAKCRBD3pH5JJpx
 RT5JD/wPBWLOrysUl0tM7jiCnNlmX4YpLyhefMmi2ioK3A9RhwN8JNcUZyPRtMCyw6ZthaOVuq2
 xNf55FAjxpa4AIejODCDBRKfN9Nos8c/lSXBB0xctkBmh/l19I+5vYc6rtknnSMoK6RSQQOo8M0
 Fg9aZdCmw03c8WFERF17HGDaJrlOOuIS2fLPuCRsaThOJ2wv6sz1g6qnfmFOswP4ZKe4rt5jS43
 faTYSCgfFTshB74d8liXNKWIgf7FaqMp6jucNhYK95GVkgSRjfe/c/RABIG9BdXtEy9YTjI6fbz
 cQXa9C1aqZuDIPe6Tros9xU+ML6VuujgvGDM2XyUXTeq319vLN83AkOZcBJdcV26an7QFhMWuDc
 S/9D5MWqjjIoLaBPa+an8G/XfL++2guyggYa8FByqUBK7Fvd+AsdGNkP7qtiKw8nxn/zXWL1uYl
 5WEYO2c/V05v97PBaOhipAK5RxIR8CS1WAg8Vj9PAeQ/N4YctPV1oQ/La5HCFxcwa67PetMBI+q
 IertMtjgqLtgkRvdkTbTwVvcdgybLT5Ef+HiKQ+3Ihye6v0Q+pLFrpZdUVlQE/A9i8SajBaoMQV
 LzTG/1pOlzsqYxu+qTrxe9lyq0qGkbcPuiGzlzYnFWVRn2f/K0Klq3ZkyrSCGvnHGq1AT04AFq2
 gif3b/P6sUoLrkg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_005831_096284_FF99DC78 
X-CRM114-Status: GOOD (  16.45  )
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

The VCHIQ firmware devices are not discoverable, so they must be tracked
manually by the driver. Previously, the bcm2835 audio device was stored
in a static global pointer.

Move the audio device pointer into struct vchiq_drv_mgmt instead, so it
is properly associated with the driver instance and lifecycle. This
avoids global state and makes device registration and removal follow the
platform device more cleanly.

No functional change intended.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 11 ++---------
 include/linux/raspberrypi/vchiq_arm.h                    |  8 ++++++++
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index 6a7b96d3dae6275a483ef15dc619c5510454765e..2cc7574a6132d9a26278439eb5f89c7bad94d764 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -57,13 +57,6 @@
 #define KEEPALIVE_VER 1
 #define KEEPALIVE_VER_MIN KEEPALIVE_VER
 
-/*
- * The devices implemented in the VCHIQ firmware are not discoverable,
- * so we need to maintain a list of them in order to register them with
- * the interface.
- */
-static struct vchiq_device *bcm2835_audio;
-
 static const struct vchiq_platform_info bcm2835_info = {
 	.cache_line_size = 32,
 };
@@ -1421,7 +1414,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	vchiq_debugfs_init(&mgmt->state);
 
-	bcm2835_audio = vchiq_device_register(&pdev->dev, "bcm2835-audio");
+	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 
 	return 0;
 }
@@ -1430,7 +1423,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
-	vchiq_device_unregister(bcm2835_audio);
+	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
 	vchiq_platform_uninit(mgmt);
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index e32b02f990244b46ab97c463dab6a973fdd97033..541b4efd64d9a8229c7e4b5bc21137a9899af9c6 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/semaphore.h>
 #include <linux/atomic.h>
+#include "vchiq_bus.h"
 #include "vchiq_core.h"
 #include "vchiq_debugfs.h"
 
@@ -54,6 +55,13 @@ struct vchiq_drv_mgmt {
 	void __iomem *regs;
 
 	struct vchiq_state state;
+
+	/*
+	 * The devices implemented in the VCHIQ firmware are not discoverable,
+	 * so we need to maintain a list of them in order to register them with
+	 * the interface.
+	 */
+	struct vchiq_device *audio_dev;
 };
 
 struct user_service {

-- 
2.52.0


