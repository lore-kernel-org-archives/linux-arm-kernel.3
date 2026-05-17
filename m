Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EB9CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 11:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Viu192jC4/rs0pGZtKEKHYWVgQLZru9+DaFpVD17To8=; b=n3rqBmWtnVB776leiurCCCrbDl
	P0aEwFPEGLWNhcpJFcZuvA0XxHJUwN5R1ig48VAycAcNT1UDhvWaH7B1ImxzQ6NzK6Jh5CB4CSdqN
	mz08RVEIY4aHXOm+1yzjWFANdWC9S+XTxuQxU+ALaoG8MCzm+rCjYnGNyvdTzkYZH5zWqulmiABI/
	vWlLC0iUFcapVoysN30WvJezKkO/vSsXkS7Q6lhjCn8CNBRrl9kySqGtptTVuT+jmpg9MZte+5yQm
	xvAxcc02BMAy7M+WfTQM/xhd0CV+Nv5L/GynvNO7CcFj50jg+mt6m5TMVNtTyeF4gIEGyMLC/XDmX
	ESOxqc1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZxR-0000000Cddg-3dvZ;
	Sun, 17 May 2026 11:46:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZxP-0000000Cdd9-1wnv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 11:46:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so13432085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 04:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779018414; x=1779623214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Viu192jC4/rs0pGZtKEKHYWVgQLZru9+DaFpVD17To8=;
        b=EUVk9pUcJB2DrRsjXYNsXPWx93Fqh4FK/gZ3fh3aP++bbXm8k//h+PkC+DfYxI4aqI
         Xp6ZcHfpiegSsekgoTGCpv4abH3NnJrkT09Tu9bgZvHqmUWcFeqJ10yYwz+Oz8dpGwnr
         C4i/eYkiq+GmRSzMQydzUlWX/9i/u7R/r5NHPcWVMKPX398d6V+fOdJnhIphyoUqsbuc
         1LHOqdELjXp1NJfRnTvejdQ0Pk0fpDc5yUpjxGWuFEqUDSVmNRuvcgrERNSex1kFljoR
         X7ZfpBeAAYDFKvqSubN8cwpsPlIfYH/i83SuWyGxfalrykyPkZ1BAj8Su4ogWZ0rAegz
         +7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779018414; x=1779623214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Viu192jC4/rs0pGZtKEKHYWVgQLZru9+DaFpVD17To8=;
        b=E6yQWSuTm8haxwZIpcqRGpXFSq2z8IZtRXr6eu16wEBYjhm7mv8OP/5eI4hCb1mFxN
         9knoAxRj2Eyx2kTi0+4aGm5WNFayVe6TWi1N3nFouWIMIRjKo2wf/+vWl90xex+bicWA
         Ix2J49SI0qWMyd/JGpOjBpt9Yrvyr91vc6HSi/vFYXTzy384OpFMAWJoYZQtDVZrTBGH
         Rm0zGGSSMfyb+YeTtfsqVbIKtCD26GDzX9fYK0QD7wlE9ndvLFTJ8n2C7sDxZrAM84iW
         w3WaBNFZxaMwoYcNc1nSaIGKR+cKGZyOB4cHEq5MX9YDkuAIKn8dnv+qSBgFPcy8AUCT
         iCDw==
X-Forwarded-Encrypted: i=1; AFNElJ/vUs+tjQmmLvvTaiE1gQLDyjaXdLln+fMNmaAY9XlRmEMxiEHMFa61Ghhd19A7Gyk6JL97OZ6yrjrNVENoes6R@lists.infradead.org
X-Gm-Message-State: AOJu0YzMsu7hUzbjYw4RwMNB0RZ8tiCFQH+eMllAfisHTBmVnKla97KD
	4elg1Luir4D7pRScxNlczbI5baQH79wqHK0h5+tAZLv6TMBDmfmhiVd/
X-Gm-Gg: Acq92OG/tN9e0ZRg5QWiPg58wbDtvPCPwX372Oop/HmTkBrhYHSLvxhXqrPyBOWWLZw
	OqDPlcIfOAXD2AAl2xsEJx3zl2Np2rmePau8VuaFfz6EUu5xMa9nhYE4r3P0i0cOhj7Ozqutmug
	j0b952jkvEJAL5cdHAo5OItj66yqzWc0QyMkrfZq8Rh7hgjWyZ59Mn8ZPmQLoksSJNY4y6Pqg9f
	GzzADox/ETEpjJzOVE5Syo4br9QUgHVqbyTtDX8+B4pOkEkLKoEMzlMW1eo44HEAdY1517PnZ8Z
	Tegsy5KrQFmRJIWqHqlPLDRoDpDm4s7dEssGmxIQrQZehkbsyxhjTZxXN4lIWC/DSLIdmXjpwMZ
	QwOVV5BmhQV55eql9ECO9l+qpXe+r2rXwYxH/FN2LfoBQsprlODAbTSr7y3EwiNUeTSjoTNgsjn
	nul/c5OVIS/xO6
X-Received: by 2002:a17:902:da82:b0:2bd:2de3:5198 with SMTP id d9443c01a7336-2bd7e7fa235mr119231005ad.3.1779018414549;
        Sun, 17 May 2026 04:46:54 -0700 (PDT)
Received: from lgs.. ([118.193.39.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe6492sm110180065ad.45.2026.05.17.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:46:54 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kamil Debski <k.debski@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: s5p-g2d: avoid double free on video register failure
Date: Sun, 17 May 2026 19:46:42 +0800
Message-ID: <20260517114642.951949-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_044655_502290_509F42B7 
X-CRM114-Status: GOOD (  11.84  )
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

g2d_probe() allocates a video_device with video_device_alloc() and
releases it from the rel_vdev error path if video_register_device()
fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  g2d_probe()
    -> rel_vdev
       -> video_device_release(vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vfd through vdev->release().
g2d_probe() then releases vfd exactly once from rel_vdev. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 918847341af0 ("[media] v4l: add G2D driver for s5p device family")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/samsung/s5p-g2d/g2d.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index a18b13db19d5..f38c28abd6d9 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -684,6 +684,7 @@ static int g2d_probe(struct platform_device *pdev)
 		goto unreg_v4l2_dev;
 	}
 	*vfd = g2d_videodev;
+	vfd->release = video_device_release_empty;
 	set_bit(V4L2_FL_QUIRK_INVERTED_CROP, &vfd->flags);
 	vfd->lock = &dev->mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
@@ -711,6 +712,8 @@ static int g2d_probe(struct platform_device *pdev)
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto free_m2m;
 	}
+
+	vfd->release = video_device_release;
 	video_set_drvdata(vfd, dev);
 	dev->vfd = vfd;
 	v4l2_info(&dev->v4l2_dev, "device registered as /dev/video%d\n",
-- 
2.43.0


