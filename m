Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507C0CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/IrfhLvzq8OFRdclHXEtAh9TYJ/Z5qr3AsT/nk30p7k=; b=qdZyCzlzfelHUrlYS9k9dVbL8a
	dHvikxtyffkEbhwHLhtpmzZcNVdBvI1GsLNZBVzNO5uzBAacs4fOZc4f1UVnEg0+BqpQmCiq7Fp8U
	WjKmG49caVK+KATDHDf1Cc+aaXCyC9UP0B+e7TgbzfO9bh7NSFBmD2JrQYCYAITxflRPwM2ZP8MRu
	S7mFLezWDOhN3Hp/PfMY0dVibNaliFpoRX46ycbNfe8EzA4V+guCxl+5DyyP2/WQ0HTkV87w8SWid
	84I3wJxJZ2kz32UoSfi+54kdl2tTh1pTqnwl4trUVivOQTstLTWlyQEp5Vd1w4n6FiAVpQtwelv1T
	AADSjygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxcs-0000000FkGZ-0t52;
	Mon, 18 May 2026 13:03:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxcp-0000000FkG5-15Pa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:03:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b458ca2296so15943315ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 06:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779109394; x=1779714194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/IrfhLvzq8OFRdclHXEtAh9TYJ/Z5qr3AsT/nk30p7k=;
        b=VeOChddczRJVA23bobhzSuEypqRWc9/VMA8Np7DU41/lyPeffHiQANozTAbou3juFW
         gpH22KPqS0i67LfKmku68IlgMd+GU1Vo9zEopkbHc1c3+c2Rgf9zZuFsV2rdCIL6ZSwI
         W8BRKqFyzVLWTfNc9VvQRDbFn8LmQH7C4+IX/Nax7lRabljOsQiYbyMGZR5XPAOZpsVf
         fi/lSzakt7CSY4slFztkc6XM0Gt53hw74BPTb56povOR47aoplV8kKCS8H9ODZJe3Sl2
         YwnnFOcd+kTZTZlZ05JP4ZCMcMpIDn3ybZ+O0VtMXru/8gdcUQpaizwZdZXfjYSzXQ3y
         kmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109394; x=1779714194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IrfhLvzq8OFRdclHXEtAh9TYJ/Z5qr3AsT/nk30p7k=;
        b=Gxx4/VxOGUS+PGPv+Fd2MYq1MQIT2wAwgAYNXiNpVMGAcYf236p1TbP639ZMLRSJqo
         i5qDJUmIs+bdZsenV2NeSOqUr2MCYD4JOmOTgEjhqlPTl4UejdvuMPXvRytAhHHQrF9p
         +4TJVap6C4/VpqOt55p8XD61J7JiXykJcdQwU917d9GAA3d3OymE+HSIZ6ftxQfRxzcb
         eW6BpM05xkvCL6UUifm5I0DvAHNhPeB8mNEgE9BH4gec/lh5EQf453ETvMkum+Jp/8p8
         5i01uSu8QxxWmHm96CRY2Zo8eixuB1EoKRW4k3VGGCPoa0h5JgJLjxfN6fXnQs4fW0aV
         7CJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wF6bWJNbCzmnx2/Mkj5hHuthzCkeD2bBvimUS/2mHrSpEqhInKgRh4KRKbLPjZkc9f7VLVV95Tb3B0LzMwxX8@lists.infradead.org
X-Gm-Message-State: AOJu0YyWHRl0mFwFSt0GM/XjzrUbDN1WklZNDrDV4dW6UZlKkKdPdLtQ
	H4EQOnQMDeVtDanC8n4PQKRTiF56Ob628Ry8M97+j5guN5vKe2CupP2Q
X-Gm-Gg: Acq92OFomCLwBP4XgYjs9xoYIs+CXq2j5mWnygxMPD6Q4cHA6MT/w612xoN67F6DGZ5
	0V2Z4DPbhIfKn+vgcjr8qxvuv3QWkaXzhyzfbyec/GIj/ja5Sslw1W9eNkvYKz/LCmgGHqXxcBq
	+C9jxwhqYO4t00EW/VL+lZNMk1HpxLAroJc8AAXm1vcRYSFbUQHJSckSbKLexl7CUgX8O1koNrX
	iI1TGUCjhjwu0L042UNjbNcRvpk1d8M7xnzKtAoxWmnLOyaBz1vy75KTvzNdFX94Fdly7QDipMC
	zKIkuAuqB5fMY1HHeuIQKO/oJ3K4utMxQuuwZjMf35cg5Az7FJGAcjD9XeRbAsly7MrQ0W/0DHA
	xsjrX02UazBTh+9/5xAZhT1j2Q/jXKpaIj15YSaQjol/I7fMCJIg/hRgMIqFppKMQZJSH2X95px
	1xXahtOLXD5wkb
X-Received: by 2002:a17:903:28c:b0:2b4:5b82:a8e3 with SMTP id d9443c01a7336-2bd7e8fdd1emr162494125ad.24.1779109394031;
        Mon, 18 May 2026 06:03:14 -0700 (PDT)
Received: from lgs.. ([101.36.106.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm159283565ad.82.2026.05.18.06.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:03:13 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: imx-jpeg: avoid double free on video register failure
Date: Mon, 18 May 2026 21:02:59 +0800
Message-ID: <20260518130259.1001956-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_060315_300044_25E33DBF 
X-CRM114-Status: GOOD (  14.37  )
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

mxc_jpeg_probe() allocates a video_device with video_device_alloc() and
releases it from the err_vdev_register error path if
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

  mxc_jpeg_probe()
    -> err_vdev_register
       -> video_device_release(jpeg->dec_vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free jpeg->dec_vdev through
vdev->release(). mxc_jpeg_probe() then releases jpeg->dec_vdev exactly
once from err_vdev_register. Restore video_device_release() after
successful registration so the registered device keeps its normal lifetime
handling.

This issue was found by a static analysis tool I am developing.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b442dcba02e7..fe8a373576ef 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2943,7 +2943,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	jpeg->dec_vdev->fops = &mxc_jpeg_fops;
 	jpeg->dec_vdev->ioctl_ops = &mxc_jpeg_ioctl_ops;
 	jpeg->dec_vdev->minor = -1;
-	jpeg->dec_vdev->release = video_device_release;
+	jpeg->dec_vdev->release = video_device_release_empty;
 	jpeg->dec_vdev->lock = &jpeg->lock; /* lock for ioctl serialization */
 	jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
 	jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
@@ -2962,6 +2962,8 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to register video device\n");
 		goto err_vdev_register;
 	}
+	jpeg->dec_vdev->release = video_device_release;
+
 	if (mode == MXC_JPEG_ENCODE)
 		v4l2_info(&jpeg->v4l2_dev,
 			  "encoder device registered as /dev/video%d (%d,%d)\n",
-- 
2.43.0


