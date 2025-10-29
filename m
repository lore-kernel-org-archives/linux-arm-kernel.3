Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30D1CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZ/LqqP2zuFtiYOmfl8D8rqpBq9TlxP59RYY9lMjHjk=; b=ginJvHtssk91NeRthhkTrZJh7J
	JmydkgTXOniE4BT0kJwRYR9OWFIAeU5EMBl5YLiuARd3wMNWSc0Ds9AdnL2wmtjTtuQW1F8s9pvFc
	lEuDjQWFC5rUH7tIhY0+MM3aNDdT9NEVUXpSfNND9/Z7eHrha3yCNBkGTZNKpn/Fel9pmR21XJg9D
	XihyZfYWKKdUZrVgsRb46hzAsoCcaL2smdlLEoBm3QAfgVFRslb14gTrz5wAlJq/aa9prIJ9io/5t
	1jGGNL98dywiDJynrkjDxYmOvNGTjoIuPFDIwY/aVfOxbyE5H0O2tyf7uugFn5FL9578aWxhi46UD
	hCSvk/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3SX-00000000lpJ-1geV;
	Wed, 29 Oct 2025 10:31:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3SV-00000000lnJ-0O33;
	Wed, 29 Oct 2025 10:31:16 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3459111DD;
	Wed, 29 Oct 2025 11:29:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761733764;
	bh=a4yP0MpBGk+El+aYAb65pi4/zSp4ieqM8UHAS5pGx/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e2jaEYsqCmfImlfckwZF//3JhAjzXOcf7XnG80viGnxa1a+w8mz8wkiA71sm3WZjk
	 5WqkqNw06RhpTzUwKFDdeSu5ZNugJbtVyiLqS7ju/FPhw3wHnlWpvSig1v0Hl6652C
	 lRWY82+nXINx+HxP7MjkZYrblR7b5kk9ofU24x9o=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 29 Oct 2025 16:00:06 +0530
Subject: [PATCH v3 2/7] staging: vchiq_arm: Remove bcm2835_camera from
 vchiq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vchiq-destage-v3-2-da8d6c83c2c5@ideasonboard.com>
References: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
In-Reply-To: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Phil Elwell <phil@raspberrypi.com>, Umang Jain <uajain@igalia.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=a4yP0MpBGk+El+aYAb65pi4/zSp4ieqM8UHAS5pGx/Y=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAeza/AM0+o01rLcRDO9DnIqEMZstG1wxAhCwu
 5lrv+g0Q9uJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQHs2gAKCRBD3pH5JJpx
 RXiOD/44pTx0vVOCdnyFHltHZMfkgkb2jW7xCg7dE+vo1yE5RwUKfM4Q62mEPEUuBqeIOTMtetZ
 raT+3KaY9AUSYmg6lS5u6rUkzFXGUPtwVdNbipZEeb67lNsbCjJXKAHrg81+UI2yirm0x/3blL2
 gUsjbbD9nYclz+T1r/wePQJWPnc7t2vnIaE1cz9luxUHxZ+mINq0QqR4dzFwNqK8s7PjizkSOpR
 3K9UKzAL0F6kEWaqYvbwAQball6BjXaUpJw4ezBXIgQnv+rV8qHD1gjP6lNcd401OVKfo7G67FX
 USEcULGnoQ6BrXt3suNRBY/y1zyrhEq/Ty5x2rgEb1NaQyrdOk+//duvQ+7H7tNUcmQodYskNxj
 QMHVmSZ/PabfXiLxlkbG9mzAlfGx3fI5gB/z73eHmPD73t2lDF2nO4jBEd4tcshW4mwBOOGlAHk
 uMph2iQCTPYQ98DYqbOWi2fPA8VpL1IPaDST2BQ7cPWxZdrXVhBgBeeNgTPkZhD3FyHqVyk2iOa
 5kR06N27KJy7SXrAcK6Jrdmv+P/vujiGihiXA2IqrW/HhrtqGTwzoaQ8SlWdUzrFKTG3e6wHbpY
 EhyZJVZOrvF/YchrYPITP1ZLVZUKT8IdWZRDH4+EMs5l8RpDami9AuvGybR0ynQJpkHhnEgZ1eF
 rsX4wtaErRPjy0A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_033115_281534_440C267C 
X-CRM114-Status: GOOD (  10.88  )
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

As bcm2835_camera driver is dropped, also drop the loading/unloading
support for it in vchiq.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 721b15b7e13b9f25cee7619575bbfa1a4734cce8..c84304dfcdc96742f0f0ef655642a7de69552c3c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -62,7 +62,6 @@
  * the interface.
  */
 static struct vchiq_device *bcm2835_audio;
-static struct vchiq_device *bcm2835_camera;
 
 static const struct vchiq_platform_info bcm2835_info = {
 	.cache_line_size = 32,
@@ -1416,7 +1415,6 @@ static int vchiq_probe(struct platform_device *pdev)
 	vchiq_debugfs_init(&mgmt->state);
 
 	bcm2835_audio = vchiq_device_register(&pdev->dev, "bcm2835-audio");
-	bcm2835_camera = vchiq_device_register(&pdev->dev, "bcm2835-camera");
 
 	return 0;
 }
@@ -1426,7 +1424,6 @@ static void vchiq_remove(struct platform_device *pdev)
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
 	vchiq_device_unregister(bcm2835_audio);
-	vchiq_device_unregister(bcm2835_camera);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
 	vchiq_platform_uninit(mgmt);

-- 
2.51.0


