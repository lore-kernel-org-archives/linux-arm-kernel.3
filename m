Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972B5C4451F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPP7SEii6KDR196qwl0uuUhksrdhOjxlohQO/hjKEFY=; b=0lNXpq0CmZoaiKKXm7gGaa5kSX
	EiC6ufmYEDWdhny6Dl+waNqTwN9JkQFXaJIO3QSg3ryaHS80QuyqydkE7Uvlnhv5J45GnDmu2MAhu
	4DGOzHZHPytLrvpYIm/2ZZpJh0XwwBhZ0SvNwJjN+lpTmHj3UbmHKIxeSxCD/I9fQaNUNCAB5/3oI
	9T9+3CoPQB9IqBnAF9LwdyA3vvjRWj/U7JmxKTAcHZ4vpHR8EGELTJ4bUSj208P6WlLLsIXCut+3S
	kqIecJJ5lMysdiat5f5Ugzp+JNchu3dUaMlb9zcCUzg0xLEIqyjrDLaxb8AEG9Qn66bFmPXwVGIo+
	KSfzdB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgJi-000000025tK-0CNz;
	Fri, 17 Jul 2026 11:01:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgJb-000000025nr-2uo7;
	Fri, 17 Jul 2026 11:01:15 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 082D8130E;
	Fri, 17 Jul 2026 13:00:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286013;
	bh=qY/pVCWRGbq9bQaNQTdwMXlcpUHQOsPfWp8vzbymHAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SXTT4Gwk6eATVFNTrxljg10zXpSpcF/yPJcN5N3Z0HWcJBlW4gfCdM/m8pvEEvulp
	 WNDJHJ4l7oSXlkl7xOVDa335WYfV0LL/zafjZ68cmTuLFl4QcUbhECUhoMEDe2E9cr
	 fYJ7tCTMko8587983zMu1lXXoSz77aH2Wpszk33Q=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:30:13 +0530
Subject: [PATCH v3 2/6] platform/raspberrypi: vchiq: Store audio device in
 driver management struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vc-sm-cma-v3-2-6c4e77804e5d@ideasonboard.com>
References: <20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com>
In-Reply-To: <20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2827;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=qY/pVCWRGbq9bQaNQTdwMXlcpUHQOsPfWp8vzbymHAQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgtfw6PzAhE9nzcDPnZ9UlrYCAZMEIxNzYMXb
 6bfH2ngtt+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloLXwAKCRBD3pH5JJpx
 RRZnEACH34vCGg7bFyou/HQkhqnnYzBtVWXw1zmIhzU836kCghxOPwQ7vFUmexnvIEUXbZNCeQl
 fwu6hYMSg0jIR8AcQ+/KTjCMcjFgoCdRp48BKBGion7ap1bizlZknOso/34L7SOPcMpcY6CTIzz
 HmifJCbFqU/9xM0vmpfOLcpapZJqirdWMETUX65zCt3EuoGUo92gnxL7BmIC/FtuEr4gLJyUCTB
 SLW59Xg1njbz5UDhSDm4UGXQQ6SH3kHP3tRHCwkOQAgq0fVoG0X2Y2ifxz2UwjDB+0SwmbEkX9i
 WulrxvrduTzJ7lVfcwdNbGUD2n5h34LuQzBUESnEfUod+rn3yY5Ns7s+VBVfWn7rjZBo2g/8g9/
 uEcqsehQ8CYpHehMNmllNytsGGlRT0lbYpQ8ho2khQ7J+tAI74nzEVCShdDPCW1u7Iu77txD64c
 pDr+tWfQoflgZ435a8+wkB225d/yQwrnP5rFw/Y6JwZE30TvTvGvjOaZ1/UdQr+umUbfONFtU88
 iaIevgetVZk6uDRPdz8+ZKMpuNAfiDx5SPhFkFfh6XtKioC3AAgZJcbRxKHrbK5IQvSU4jABTP6
 6rfzQY7EzbT2rVzYtczedso6voO2oIB5vAXGp6q5dNJLvrUUaR54fXgsbZ9hYjUW5c2xyv/nHkD
 /I/tvOj+pllIQxg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_040111_980995_D5A2F761 
X-CRM114-Status: GOOD (  14.95  )
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
index e78641703252..d5a25033a261 100644
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
@@ -1420,7 +1413,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	vchiq_debugfs_init(&mgmt->state);
 
-	bcm2835_audio = vchiq_device_register(&pdev->dev, "bcm2835-audio");
+	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 
 	return 0;
 }
@@ -1429,7 +1422,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
-	vchiq_device_unregister(bcm2835_audio);
+	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
 	vchiq_platform_uninit(mgmt);
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index e32b02f99024..541b4efd64d9 100644
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
2.54.0


