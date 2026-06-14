Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AC0CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QY5Ip+P8KRx1IM1Wpd7OwQvhD0XfR0winv2zlXLefIQ=; b=2DosCyFhTja1WtxmdxRvWM/on8
	jjbWsvsKpbs8RFTEQRaHMpHo+Mj6lCaTtu/JvucklUaWGK7YA8l+HnAHESjn1QlwA3mb/nqGUlQir
	xSlhjLSJlj+ejb+H8sgOB8SPF+wh+Ym/+i62y1asZT05eznjcHW5JASpcOZK36lh4pLJaiTddQkEn
	pwfJuc3xn06JBKICw1HUUFU4BjfNuDTjbxTG7qvhbUFulxHcThbAX0hncJ3yjUHUWC/zk0aWECEW/
	XVYkd4vrmlBMcDrSzsbwIz0B39N7lPuWJEzsdGW1oK6hB30tCTXo9Ab6VvAHk6Q7cdxL1x9TW8I6D
	HrRx+pUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYo93-0000000DCA8-35po;
	Sun, 14 Jun 2026 16:57:13 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYo91-0000000DC9I-2xdm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:57:12 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so16998455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456231; x=1782061031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QY5Ip+P8KRx1IM1Wpd7OwQvhD0XfR0winv2zlXLefIQ=;
        b=ls9uciqmI3GR5GcuU7MHP/EMsKQBRZHG6M/vIv/NDSZNabcenQJ08voeJy8FYOJrRG
         tFa5ySujznwl6LO3i5uJ0GngzLdHwop3M4Twi0hYJxN8ObW4Oi6nXbfFz1zlehVITr63
         UUSrhl2eCRXwIydF3SZVU55N4MGLIPXgiQvTHM6ONCF9fcZBr3qUsBLGwP/0VT4zjEGQ
         CENzjYnhWJ5NcPE7SMWwDfbJYECXXnLv3+ZK/yzevtXPSzZM5be3p4UgFd3WSy0cKT+C
         NBKYl5nn5V/wHM9jLvbLZLKt+3eOVykt+DHnbPZ5xoJdE/OAXRAtxoT/FdDk1ocMcyUd
         4R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456231; x=1782061031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QY5Ip+P8KRx1IM1Wpd7OwQvhD0XfR0winv2zlXLefIQ=;
        b=EUMsr6OP+QZWFIiZ4UieGzA6m+HVERUbWd7jupIUWBQLlV2yw9IZO+dr0N49QgZ78G
         Eq1X9MjWF8tOVDEh4+3BA/oUXbJ0/ClHPdNBKh1KOo2+fap6VMi5LCUt/6X0TrqtHI5m
         eNsLGEBpwx06maa5q7rMAfxuErPKFgGo97qJQbLr1kYEckbtUmo9JXHYFu7OQ+g1Y1yU
         bUqcRJLU1WGQ4uvoiD6Uq1ZP3g1y73tagTHkbPR2ZzOZ2kM0A03Bcgjmy7a2sg4cv8XV
         zPZTL/tJ2R+nNv0oH0YUvQa+WRmbzBWRWBk32/MF1OcRs8FVPYB2m7qApP9PFdFfkvfx
         xo2w==
X-Forwarded-Encrypted: i=1; AFNElJ8ygVaoQqvUdcH08qztrrMDL2ERerDZ9XMsneeJG6NjpcVqgDxLW4JQpYlIq9b9uIAW/kdEsY1t1pJNasf6ZF9G@lists.infradead.org
X-Gm-Message-State: AOJu0YxpSPw46qJ6B//9z+Dsc/g0N9b6MQxVyD2ltB+2QtFhawU9/z6G
	VcMAgi+kA0pfr3tgFU9/oxTC0JpdbWJad0u461Ef5QBCyjLFya5W+iZu
X-Gm-Gg: Acq92OE8ohNxcCjKg6LgiZh9Mi8FS/dbTde86R4TDLDz/BaAfvifqXdKOw6FPL+atZP
	dPDExDMwCKegT2m5xyCrfkWp/TavnQmIHYdY+UA5PQwZIgIiZeF5CoJ3FIZ7pHsvdkvpbej+YRn
	oI9VW7wnXR9DXs8xzuJxCSLpO3LSZG0IzeY/d9b+na/mvseof8FyolzfXjwV93df+5U/AzWa/x8
	Rekpe0C+L5EDROO2SA2tM/rDE5jkfl0x8lK6AgyMhJM3lTpAmSjMDfg7svgxOJhf6fBSjmAHqKX
	HBr1hCwB6DfJxn20irgW7UqE5zE5/zKFiyv5T7qI5CSFVe+N1JdbgxarcniBCg0c3ZCzQfbj0n1
	QBHtzYDCjGyW5svwKJ5Z0Ax9esC8xkjkeG8pgXRw7G5cM4udYZ8tmEDjY1vhCSsfVFkcWQD8UyY
	FNaOfiJjOQAdrqQIPBGPVXZozfmYYiSt9IO+dOg1ZUB7ComqcDHnIVmX0vDkZkdSA=
X-Received: by 2002:a17:902:d48f:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c6641e28f9mr86805045ad.21.1781456231128;
        Sun, 14 Jun 2026 09:57:11 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:10 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/22] media: platform: sun4i_csi: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:44 +0530
Message-ID: <20260614165630.3896-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_095711_745604_B3287D22 
X-CRM114-Status: GOOD (  12.32  )
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

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770b7..f50d97ca795f 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -242,11 +242,11 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	vdev->entity.ops = &sun4i_csi_video_entity_ops;
 	ret = media_entity_pads_init(&vdev->entity, 1, &csi->vdev_pad);
 	if (ret < 0)
-		return ret;
+		goto err_clean_subdev_entity;
 
 	ret = sun4i_csi_dma_register(csi, irq);
 	if (ret)
-		goto err_clean_pad;
+		goto err_clean_vdev_entity;
 
 	ret = sun4i_csi_notifier_init(csi);
 	if (ret)
@@ -266,6 +266,10 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 
+err_clean_vdev_entity:
+	media_entity_cleanup(&vdev->entity);
+err_clean_subdev_entity:
+	media_entity_cleanup(&subdev->entity);
 err_clean_pad:
 	media_device_cleanup(&csi->mdev);
 
@@ -282,6 +286,8 @@ static void sun4i_csi_remove(struct platform_device *pdev)
 	vb2_video_unregister_device(&csi->vdev);
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
+	media_entity_cleanup(&csi->subdev.entity);
+	media_entity_cleanup(&csi->vdev.entity);
 	media_device_cleanup(&csi->mdev);
 }
 
-- 
2.50.1 (Apple Git-155)


