Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D15CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 05:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b69/f1IaWhKRvn/Sm6atJ8FHYkT6bLRfEDI5V7g2TEc=; b=pn4oQmpphECV4TQauxBarTNJGZ
	YdzmuVM6AON953yaef46CHbt4vwHz81+DHNycwv02mRoMtf4G/AExR7p6nSYe20NgNTdmUs7wXuIB
	k+Cesrdl77Z4rchz5gPSdOTuh++CydoaJlsSYIndkhjf+fAezQ4h2dkrfjhHXO5zZqscsklw3ZOMX
	pFQEPe/dwVuxfUJy7Is/DAzTar7xjsdUIorNpdgrcZeUjkcxYA7rEHKOLe0xPWIBQEh+q6twBIyf1
	n/Cd+ut2DuOyw9ZaB92kC4bVo7IDPh1IftDEAmhO01EV5IjGNnxGtdkdDlGbiJS2kvCX0vXFZ0tzD
	bK5Nslww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqoE-0000000ELjw-3NMS;
	Mon, 18 May 2026 05:46:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqoD-0000000ELjc-1bky
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 05:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=b69/f1IaWhKRvn/Sm6atJ8FHYkT6bLRfEDI5V7g2TEc=; b=XHbHeJeBn8pms2S+TbMb6Gd6dY
	GrAcJq50h/5HDx4HV2kavwsOW7FQ6Lo3nrqhy0jJle7lzyaAKmS9LV0G/gzfsDPvF7/RMhfNFFLIA
	Y6B59L8/pvykKmJ97KVyVkx2k3L7ufU3e/m0kw/CUyvWWiAEcAumL8nfSuIvp2y4MsMdqCUYHlG2w
	sX4Es2ZS1ygoIhnKc/V3dGFDq4wPuzxp0OLoyBIWutt+g1bXkz35X36C43rV0dvnbR4mYeCMSiZL6
	/vypC58E2odm8aTejhCXWSh3N8Dtkw9YNtkwXt9T/BjTWCA/m+fl11YWP/W52KhJeEUrB4hAVk8AM
	eZcvdLnw==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqoA-00000009xRd-183H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 05:46:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-83945063f70so1352981b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 22:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779083188; x=1779687988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b69/f1IaWhKRvn/Sm6atJ8FHYkT6bLRfEDI5V7g2TEc=;
        b=AM9ueDH26bDQyCIxUWaH+5efEomHnH3PetkSkc/x0ATB5BPpjIkbfnX6002oASRnaO
         3h0e6VUK90CI8xpYlBaz+6JGB0QQFVTlvKv6fkMGXD/3S4dnqbel1Onh5K7nnFZ31lGe
         FYFyzWnrJNWNjBQSZFhMZOSOr5Ulyvm+m0PcxvmpHB0cbTJWKfMbvJOYpzdsuYHTIwiq
         6DGJ9++Iae5V7T2FujtotEbB81a2WvLLHV3stUTxRpzlrmM269iQ1o+GroqkPZ8RhWHW
         LB2APQptfNnHbGS15Tgzn7/pmxIJzj12rxEaTdZFdgZw7vJPNm2kpuqea4Pf6nbqFAgh
         8C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779083188; x=1779687988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b69/f1IaWhKRvn/Sm6atJ8FHYkT6bLRfEDI5V7g2TEc=;
        b=Hg9RNJZSBIjn4jLO157VL4qDVg2hp1LTu/8nZ7YgpGP6TnB7qskdacmyyT+a+jIDyY
         o0oyZ+feU4GFQEI7vk6HLz5Y7aXQtQNXktTF/QYt8UhATKTNoMpeDW5TB3drStSvE1a9
         cxwuhnKigD2fz/m5wZISSq+4/xO7ozbzlC7FQ6zcTuXwv34QqrhM9QRSJLKUHAlbjwj9
         LNx7QSmD7jOdSKnNstWU2D/mIIDanAFBd111Pw2ng+pMkw2l3HCYGeXppcsJW2zXduMH
         dQlsRvp90TxsgRDuElzADQ5gXPtSO+fKGeOeRDJk7QVchqoWRvSg5J4fUAYZ51Oa8BiA
         amjw==
X-Forwarded-Encrypted: i=1; AFNElJ/RadVjw6hpkzdTj6C91WS+7CcObYtPJwdXfUJ0G7Shy7H960Clcv2TTwcEFFlv+tZSe8ze0C5WHfGjGKKRzzF5@lists.infradead.org
X-Gm-Message-State: AOJu0YyNqpzP1ShMuD9cJoizI9o6WqJdks/ryNxxHXV/syNhZCcbpfOk
	G5XFl3gxBRR/hqWyIrz58SF7Yx6cEfAU7aJ4igcr6Ojwlj2AHa/Ozcpu
X-Gm-Gg: Acq92OG8y8hQZs/JFdihO0GDfamqmVRL+f1ySqOr7zYlV5Kl8m5C/yKy8NChGZ3IkMU
	XtdhWntX9CSkyHusDjaiddUoH70ycu6hQxOQjsWDLf6sz7wQflU5Gkd2GlC9YM0c1I6vOcki/nq
	DVZ8Wy67N75fZ98ftrxR+Pnfkdlng0sLAjvzph+iftLSX701eVfpyghqFA7owR+vVJXqCKHC2Sp
	4vYLt2t5fv2ynXFi7WuOxKeilCab0gv4aLBBX7//U2RM7w9GMG+jd7Pdr9W9iYuE6m37df/3d6B
	bkjpJV+8p4NgbCa/YVqgXfFkv4cS2iPuYIcHlFBQnwrQ6hAh+Zn3PLnIbiX7mDjVsxZnf7mjzs6
	JAEdElQbIn2Hf1k2dk68/G+uIvX1fcenQO9NN+rDL8xUIHOUgx4MJawHqJCTP92Lx3jyZ4odjhO
	JZscbNzWHB2eWIeBhY
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr14563893b3a.16.1779083187983;
        Sun, 17 May 2026 22:46:27 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c020sm13344918b3a.30.2026.05.17.22.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:46:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: meson: vdec: avoid double free on video register failure
Date: Mon, 18 May 2026 13:43:18 +0800
Message-ID: <20260518054318.979147-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_064630_711425_5353D472 
X-CRM114-Status: GOOD (  13.33  )
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

vdec_probe() allocates a video_device with video_device_alloc() and
releases it from the err_vdev_release error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  vdec_probe()
    -> err_vdev_release
       -> video_device_release(vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vdev through vdev->release().
vdec_probe() then releases vdev exactly once from err_vdev_release.
Restore video_device_release() after successful registration so the
registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..2994e46cbc25 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1074,7 +1074,7 @@ static int vdec_probe(struct platform_device *pdev)
 	mutex_init(&core->lock);
 
 	strscpy(vdev->name, "meson-video-decoder", sizeof(vdev->name));
-	vdev->release = video_device_release;
+	vdev->release = video_device_release_empty;
 	vdev->fops = &vdec_fops;
 	vdev->ioctl_ops = &vdec_ioctl_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
@@ -1089,6 +1089,7 @@ static int vdec_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed registering video device\n");
 		goto err_vdev_release;
 	}
+	vdev->release = video_device_release;
 
 	return 0;
 
-- 
2.43.0


