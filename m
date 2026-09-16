Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB55AC982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/AO1ZvpWiptl2nCkpbwyRl7G9Tmwytq4WGcCMuk2Bc=; b=RPo0X7NFL+is8OwKGMhzHgQB1i
	LvZN/zT14P1/XHePyoO64WGq4Ne84nQL6Q5fN/CbgsJKG+2BlQqmogCJ1FuZh78Uyl0YJ3e9bdVr9
	L2Z4LFjUupgDmgxRd+kJGJNkRZvzMMALm7mVCpgrrjeKPQ0WCHmpEZYuFuJ6Y7YljZ8e3YgbKUCBF
	n6mhq1ITwZ3THqq+aBHSAnUws8DxxryDszqsulzwLEDiWaJLb/gcqEjCjYmRCGgn+IsaA+nlz9py4
	uF7nl5kWaa0kgDzFOmgMS92clLNfOkVG9Sv1L5NrHnOmAx3ySRqavGEMGE/mkOsdOqYXLyIejvrOV
	qq0dQuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qgh-00000009QGp-0zwT;
	Wed, 16 Sep 2026 14:32:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qgd-00000009QET-3zK5;
	Wed, 16 Sep 2026 14:32:38 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C09AB558;
	Wed, 16 Sep 2026 16:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789568685;
	bh=GRo5Rpd7fq4Kf9n2BeLURQagh4yqnYCAIchRa+iiDVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NcW/LVk+IkOH8U3LzFD+7oVPSJpjmxQlOrFWcNMoLDKRuuvCT9so2+67J2wufRgX0
	 5M0PkxtpIhZQi+17n+yXawd8VpkpYjESfaLzobqgvfKLiMVwUQDSGc74whrA7OxMEO
	 +Uk+oWdO0XyXmorhznI+qGLzKagyNkBvi4zFeePU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 19:55:32 +0530
Subject: [PATCH v4 2/6] platform/raspberrypi: vchiq: Store audio device in
 driver management struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vc-sm-cma-v4-2-476d1142b5df@ideasonboard.com>
References: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
In-Reply-To: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2827;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=GRo5Rpd7fq4Kf9n2BeLURQagh4yqnYCAIchRa+iiDVo=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqb9VTmiOj9+jvb7zupDS6s7vFSA6hV3rnGJr
 CAFUuC9NpeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqm/QAKCRBD3pH5JJpx
 RUKuEACSesiJDODv/1eqiZ8PRp9YjGNnK8mqJpQYK44TkJURz9snMH52plxW5g0pDrgrtBTwVEi
 A7q9CP+gVb+kmhBSwPEVfPk+xflPsh8WBMUILXRKpGnTKS5OmdXSFfpKautHH0KTf7N+Q+h3C4V
 CgvNoqP1HxUr0RVFpD2o4s5LMMIzgGZNzuDvPOqqmDdsSzl6+aSTFwhpoXwev/UtrgTzixcl3gJ
 k+DQV804SCKenokmmgr7NKDT9NKa+QitxZhwpu7+qT4807FjXSJUwdBxpZ5HpJwTdaEdMMO/6Pb
 kEMw353FCtmWO87nGwpw8Oa7YwthoK3rXewi8TmbDFKk1FnMFwfB24O82MFWiLmfNBnK7zFMYKH
 HXzxxB900wfhsxrgYWo2TA+z342QVI19le5/7v4pBWhyZ0bqjMwK4YmNd40sIa368ULZ2rMaPql
 rsl/KNNHCwrEDU0YfyG87Hxr8qyYCvoghJmihjTc+EKxb+T65kQiPriFS15ZWcgh1erhLqA1q4C
 P20wlv4/lJjdP5an+2Di12ckUQzy1hZMo82pMRd/Ba7txXTB4j2OSUukNv4Y0NcnI5HDRrlJhOj
 BaWTKIAQZHz/ZrX07WN6R1RRD9U6mf8wV4Szu2my8vJTHdvmV4VvWfsBPxJ6tybx2eTFLDWxb1D
 hihzHaBXC8vJiDw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_073237_047672_6868D397 
X-CRM114-Status: GOOD (  16.33  )
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
2.55.0


