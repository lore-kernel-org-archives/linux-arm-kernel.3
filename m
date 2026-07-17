Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28854C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mvvu+6EBn5MK+diu+QM2VUwTZctdNfo4pTUBMjFCF4=; b=kUsuJdUtZ5YYVIuY/WIeyb0Iry
	HN8x8jkzFNUEJGNOtbC1+0dpMrAo//GlbLIOtynxlbRNc7kkOpELtGacAAXWHICYghZFEL6SxZgJn
	8CFH5DQ5uZtXayIWhLifChrORNMNp8Sw64/4MGQKVv1XvRJPLF0L25Cd7VbtSmAZ3mYhzJhyAqxRh
	0Q77Z0Hz/3/9Ra+2+4x36UsoF3Y1OY9GnSihk3CW82Nr/D7xOd56kSD5FkVFhSN9ekdn+1Iy877J4
	GxhiTxlLc3bKxtZwMvLsMm1YFWYmgZMvDr4QL3hGQz0XtoEWOcq4D6CpI2WHuerzz7cZFVnHFMDn2
	WEN0ltFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgKF-000000026Gn-0FWr;
	Fri, 17 Jul 2026 11:01:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgJz-0000000263x-2vUn;
	Fri, 17 Jul 2026 11:01:37 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82C35192C;
	Fri, 17 Jul 2026 13:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286038;
	bh=kb4l2DEd94lduGCrSlqitRAeM8XIspCXJWknqCki/60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iOmCcD5B1DkjwPY7FHrxsuATnx4AGfvg52Qy8f1N02/0n/z/2tbUGNlsdhn/i3rZl
	 1FMnpJwiyO2KPRm0ulO+49qd7bjlPJzt0f+/GfbdJSS6ZrsyePOqjAwNG3YgNHRCJ9
	 a4XZ4ubirgGVam29iJ4A7njU2o6w6Vy5qPRJHEJw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:30:17 +0530
Subject: [PATCH v3 6/6] platform/raspberrypi: vchiq: Register vc-sm-cma as
 a platform driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vc-sm-cma-v3-6-6c4e77804e5d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=8Q92fhIMTneVekfo8R0Zg6zqThHD2FXSRlScas2p9Dw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgtjZC7wE9H1LCRxydwSuICaF20SK+wjTTj1X
 4SlVqXpID6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloLYwAKCRBD3pH5JJpx
 RT4vEADDbDVElarYBSoDxyudsg2X2caK7sj6VQBXonWR5pXqcp/b17i9VmNuJ+m6tv+V4aeBuEF
 4p/rCLU1gUWQF8ewmy7wGgPXh8o90rkvuT0CdzhIcmLKdj9qRLvBCs7xx5uo4yFmIp4S7YXDf5a
 07U0GfXMffetIjUV8nkTcFNGcavK9+vd72hix3hB9A+FIxAbRffTMOiWEoSBC8owTBTaPoNNWkX
 mEXI6ZWROjMXfUD9y0xekRyukHeTonM+7LHQb/KoQv48c1D+i4G9mfO0zfdnOfktJIypHAZTMP8
 VthBu0xNJxRO3T4FZs8V9O4UPO47/kpAhlrPR3TPNm9JqGSHAMPMEEvw0xfZAV+PLr8LsuvrtJt
 X2Hda/TsbR188goApF1qQc1vJpzVbX0OAdO/crQ2x33AhQniecJy3gagi2lcsrGGLq/xrRULYwH
 xZk/beL1HQNHnDSkrEGX+QJYivJvyh/AnJGSUQNr37nFAZBA8tgMBGVkgq+r8yQ2o0zV3i9Mw4r
 XFAIE5XI0zyyLjlCMnTTM7ksXK7s+6MtgPDL2DwF+tjtc4E6qOk1OEL0envNR5Av5rrz/goTnNd
 +Hr4uNSQUaF3Lb/9jKMRh6BGj18a2+JNCD1YqBQhBiFkdpsvb5G4LZA3peNxhVA2iigwauYFp37
 nttfCDm+AJVvNRA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_040135_901154_C5EC34C9 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Register the vc-sm-cma driver as a platform driver under vchiq.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 ++
 include/linux/raspberrypi/vchiq_arm.h                    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index d5a25033a261..ec951ab19d67 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1414,6 +1414,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	vchiq_debugfs_init(&mgmt->state);
 
 	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
+	mgmt->vcsm_cma_dev = vchiq_device_register(&pdev->dev, "vcsm-cma");
 
 	return 0;
 }
@@ -1422,6 +1423,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
+	vchiq_device_unregister(mgmt->vcsm_cma_dev);
 	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index 541b4efd64d9..d59837eaaa8c 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -62,6 +62,7 @@ struct vchiq_drv_mgmt {
 	 * the interface.
 	 */
 	struct vchiq_device *audio_dev;
+	struct vchiq_device *vcsm_cma_dev;
 };
 
 struct user_service {

-- 
2.54.0


