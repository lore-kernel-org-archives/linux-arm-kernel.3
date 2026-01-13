Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA49D29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD+bA6Ph0rfl79ZxQjAFJc8d1mnG+dUURipGwOQzbIQ=; b=nPRD2TShuKjH9qFdAwh+irlyy/
	uw40BHJtmHeu9zrB5QboP7beQsInNXEvYCIvVVBZgl14rfEkrEtGlH0oGt1kFjmJ6VaPlZ5kGdSgs
	iPzkL5HfBFZ9sq5q4K4fxU4Mvd5JhPhxcVamj8TuqDTTyxApg5PFBGzNtgQBioJK0fqelqtmIWXeH
	cTAFGiPggOhoEr7Gi38K10cfaLxRCmXMDaL5NSzau4LDCGA0LgWuefnAyrDo2DSIANXDdAPabpRdk
	GVHNU8due2cjuZDKC37x1kwwYLEOg4fQse880WW3WEGfZ2kKu6ILoC4ELzLyE6mR7jfquaI7u8fB/
	zYXErKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaWP-00000006pNt-43NU;
	Tue, 13 Jan 2026 09:17:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaWM-00000006pMk-0V0Q;
	Tue, 13 Jan 2026 09:17:04 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16A3117D8;
	Tue, 13 Jan 2026 10:07:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295279;
	bh=xmJwrHf4q2IDWFmUdj1fcF9TnssMBp/VNjUuGh/3isk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b9kj9ujho0ykhVDkP0S0pdmncSlBA4a2C6TTQgRC5EoRSYRlTJg0Vr/icyiFQaPaC
	 LsqqreBQ7D+30UZOEeUIcNPzBupT5aMKoMcaiwUofFK4LmpgT779X30w5tjDKN+d2W
	 cc0oPjikesgHeQPMHpi8wg8UtLobl28X1AtQz5FY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:30 +0530
Subject: [PATCH 10/10] platform/raspberrypi: vchiq: Load bcm2835_isp driver
 from vchiq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-10-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1901;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=eCv09Mqfnqp7/pBKKBSALZWW1w+B4jVcEjaPNOpfR1M=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtM8Io5KQ86hzFpdf9di4bsIKka9CQE06FDc
 XmlsCsnybKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLTAAKCRBD3pH5JJpx
 RbHwEACgTujZNs9ZxjKfYVFhttjbCstHBwY0w6WsbCj6y2OX4AxugO0OWX9aZeI/w8njRxQLaid
 G5TPoAROIIO2q/facKFkI1aOn9novutvCx+FDPiGLyOG3H6sJNuprnWwdND9Z+MUB1z9PgiCiXQ
 TqsQywdDyXww2QntwGTX9QpsCGjzxzWipwzh4AcExh7R77ksc8HrSzmMvYsqC4WqFouW/n608Fe
 r2U5n9iXQRitY1iSZXU3hHSMAl/Uh9+6fuHAt0/PmOsJdctd9vWjD1IngMDousGI6mbe+/GpXlV
 OBw1k0cTEXk4maVhYjPE/S6t7mKmHrZkkuBWVh1ea0RSMM4mOFtgi+V8vALgvnVFOsqjqCG/3iP
 nfd9+tarYqxBbqAIDnff/FlxbyPAbBogaY8iNEbCJTTXxjCdGgTgdW3CrIngTWZhbagWTMXzF91
 +uavRE664sf8YaKzxS1rurr61NnaKQRiIgRvVWSq8UM0RzKnEw0hoGZOzvndt9pE6mlSfW8QguO
 zn1V7pH0+2I4OQ6gRPFagHsaEqGk1iM1iwZrlf4GQcR+B/IS7EnCTTh/MDpsCgLcN+n8V5GHqXZ
 GPFuiKOoB4k92WmWzxcD8UR01SxiLHPCQw4HCrxoLRNrSYU2RMOTCUNVkv4b1WVvpz035h4B60c
 vrSIacoZHT7i8Vg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_011702_301800_DBF67E46 
X-CRM114-Status: GOOD (  11.02  )
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

From: Naushir Patuck <naush@raspberrypi.com>

Broadcom BCM2835 ISP driver is managed through the VCHIQ interface, so
register it to the VCHIQ driver, similar to the audio and shared memory
drivers.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 ++
 include/linux/raspberrypi/vchiq_arm.h                    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index 00c31f18bb69fa8f21a2a048393ea76615eb926b..fe841c13677bd9cb63a825a7f99d45470d457c18 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1416,6 +1416,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 	mgmt->vcsm_cma_dev = vchiq_device_register(&pdev->dev, "vcsm-cma");
+	mgmt->isp_dev = vchiq_device_register(&pdev->dev, "bcm2835-isp");
 
 	return 0;
 }
@@ -1424,6 +1425,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
+	vchiq_device_unregister(mgmt->isp_dev);
 	vchiq_device_unregister(mgmt->vcsm_cma_dev);
 	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index d59837eaaa8c0e699575897c01d17359a58b0e62..ea1bd419e471cf3c8e66445ca6b6c706458657bd 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -63,6 +63,7 @@ struct vchiq_drv_mgmt {
 	 */
 	struct vchiq_device *audio_dev;
 	struct vchiq_device *vcsm_cma_dev;
+	struct vchiq_device *isp_dev;
 };
 
 struct user_service {

-- 
2.52.0


