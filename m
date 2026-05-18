Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CF1CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lcjglP+1RAddnRhcnzDODhk3aYczqj8l0Dmk1F3SgoM=; b=2IW2MCq8rnLJzwf8l9ahPCiZDw
	FHiZk0XcQ5SCcHLC893G1Ao9W0qywAAEdtRr8y76i6VndpCN88Sa4eEz5vPI1HbjYQmWhm+0tK8XM
	tZIB5whNGXTpPpQ4mCvKZb9dVZNYEEfqMwe5gZqCKY9CWk0hRO8IDuF3PuTwoaiS0YD7oYpiLM00h
	QgORMC5g9bsowT6urc39UPjI9iKAbc4F+or8hAMDsLvsvZcLzQ7f3RjxR8nCm7lvTm5SEYXhqCK9Q
	C5x6jYdr0JpphXcrbfzMCU5ZZCwRILyq5qDAnMVDDen+qahs4pxMieK/gzVxw0S7czbWf/sfhl+8h
	+RAiSk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwWS-0000000FVTG-2W6Y;
	Mon, 18 May 2026 11:52:36 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwWP-0000000FVSK-2xgR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:52:34 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3684a6f3b0bso1300439a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 04:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779105152; x=1779709952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lcjglP+1RAddnRhcnzDODhk3aYczqj8l0Dmk1F3SgoM=;
        b=J9Pmy3bCRF0byFM3EPoSXDwy3eHvPL2SBegi1nr8ruU8sgPyUGEhxy0aKjoCoC2Um9
         QG+3Os5U7iQf38K/oh6ScsQmfjot5+PLg15fU7wTKtU6hp8ojoQVwpjinkcmyupIBR6g
         BhDZ0pIr5akfnqzzJZ1w7K2oFkOmKcmuAKtUQEGwY7zLZ6NrMM5PVdlvRtQKq33vDlQG
         ex8CC5kPtsPrOOMxmgQfch+Ud3QeYIWw+l/tQ9n0lnvg/aCs6a0fEO2mHF2DJ5Hy/08b
         njpucZuy8E015WgyXdO7LV5bzF+xIQTZzrq4qzWKHc2MhDHxGVu86lESL+JEaZF1WnrC
         /kGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779105152; x=1779709952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcjglP+1RAddnRhcnzDODhk3aYczqj8l0Dmk1F3SgoM=;
        b=OVVj5hMC5EIPQnYYrKfMLcdTJ6uO1o4Kkd/7WKQRqbp3A9U67vB5wTgYGJyZQdRUrG
         /LRU4Z5Bo8yGOXu/F6e1ne06pfUgcBeRhtH/B89q6ob4AJe1Fx2zR3gbM/KJ/6oNMH3w
         WVP7Lv673K3coyMy70hrfVRTGzD821j9x8hQCapmm/P9bSvig3snz+FEO2S9PdWjN3Ff
         hHiKn/1YzCr0uMiy+iTn3x3pVkFLYq70pz83TXHyDVfxq9BwzM6/DRWuGxfrVedVRq5q
         V8ACaHk3owoIlDd+itRgr7auLM826pa1g372xjwI7a/n77uBWHSebEdfUiJSg2Vjgc8E
         dvUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+Rp6O5KzeMEreVDTsDNy5S+N1Z4lwiOAFD+JV+DaPP26JW38E/7ZQtzEIpayjXOZ9lasEAndQBUyYJvg/mnfS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywewd2lBiwTsWmQTMh7flqUCBB+1X83QaJAtv5OhvzMlW+u2XHp
	ru6YYs7WZjTSoq36kK+uzty5y0J1g45a+COpu3ATWcMFogCsdgqJiZzA
X-Gm-Gg: Acq92OE7M8nl3LOED0fyGRP0dpzEk0fhbrdTWPTAbVQm+wwCC7G5WkJtdF6fEjrRKV8
	8+ZgUgLr+qqQVZRYBXA2PkrWI2Kn9NXE9bltRNnR4wAFitaK1GecCKOV3Qcd7SASvXDnJHP+Js4
	YuqLVElw7Egg3rhe/ABVE7v9HD487wZrdpx5qH9i6V7Qr0wLyhYeIut7MkL17ahDPK+2PRZyMly
	AXV9INCJ75zOD5zKFceE107gfDBNcQh/iDJeZRtgNyyqvfWuPnlr4N78/pCeF/qN3phQ6OoV1VA
	WiNamlmQWCPtwdmQdXxX39pfmnH8ya8JbrZMEt5c+bzUkxHmV0JimAe/w0wwHqEi3koLconyl4T
	h1MNcvZ9aqnR8lnIlRIXNmUJR0wLqPGi3Vx8moB4o1L3JYuDK3X/Yz3mmEWeFgLoWjb3ASlsVW+
	m0lal+3vteKPqcsrc576Eo
X-Received: by 2002:a17:90b:5708:b0:365:8fd4:925c with SMTP id 98e67ed59e1d1-3695149986amr10611417a91.8.1779105152199;
        Mon, 18 May 2026 04:52:32 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695157c3cfsm11047195a91.5.2026.05.18.04.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:52:31 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: s5p-jpeg: avoid double free on video register failure
Date: Mon, 18 May 2026 19:52:19 +0800
Message-ID: <20260518115219.990820-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_045233_748583_1E58BA1B 
X-CRM114-Status: GOOD (  11.91  )
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

s5p_jpeg_probe() allocates encoder and decoder video_devices with
video_device_alloc() and releases them if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  s5p_jpeg_probe()
    -> video_device_release(jpeg->vfd_encoder)

The same issue exists for jpeg->vfd_decoder.

Use video_device_release_empty() while registering the devices so that
registration failure paths do not free them through vdev->release().
s5p_jpeg_probe() then releases the failed video_device exactly once.
Restore video_device_release() after successful registration so the
registered devices keep their normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 7a1d4e7c064c ("[media] s5p-jpeg: Eliminate double kfree()")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index fdc9d7e0be66..046ad555c5fc 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -2915,7 +2915,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 	jpeg->vfd_encoder->fops		= &s5p_jpeg_fops;
 	jpeg->vfd_encoder->ioctl_ops	= &s5p_jpeg_ioctl_ops;
 	jpeg->vfd_encoder->minor	= -1;
-	jpeg->vfd_encoder->release	= video_device_release;
+	jpeg->vfd_encoder->release	= video_device_release_empty;
 	jpeg->vfd_encoder->lock		= &jpeg->lock;
 	jpeg->vfd_encoder->v4l2_dev	= &jpeg->v4l2_dev;
 	jpeg->vfd_encoder->vfl_dir	= VFL_DIR_M2M;
@@ -2927,6 +2927,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 		video_device_release(jpeg->vfd_encoder);
 		goto m2m_init_rollback;
 	}
+	jpeg->vfd_encoder->release = video_device_release;
 
 	video_set_drvdata(jpeg->vfd_encoder, jpeg);
 	v4l2_info(&jpeg->v4l2_dev,
@@ -2945,7 +2946,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 	jpeg->vfd_decoder->fops		= &s5p_jpeg_fops;
 	jpeg->vfd_decoder->ioctl_ops	= &s5p_jpeg_ioctl_ops;
 	jpeg->vfd_decoder->minor	= -1;
-	jpeg->vfd_decoder->release	= video_device_release;
+	jpeg->vfd_decoder->release	= video_device_release_empty;
 	jpeg->vfd_decoder->lock		= &jpeg->lock;
 	jpeg->vfd_decoder->v4l2_dev	= &jpeg->v4l2_dev;
 	jpeg->vfd_decoder->vfl_dir	= VFL_DIR_M2M;
@@ -2957,6 +2958,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 		video_device_release(jpeg->vfd_decoder);
 		goto enc_vdev_register_rollback;
 	}
+	jpeg->vfd_decoder->release = video_device_release;
 
 	video_set_drvdata(jpeg->vfd_decoder, jpeg);
 	v4l2_info(&jpeg->v4l2_dev,
-- 
2.43.0


