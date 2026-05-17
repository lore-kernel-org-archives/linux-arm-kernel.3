Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B226CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 11:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aybAOu/Wnku8jJKJm8nyG/Glu+5oR3YJ4061r8jTr0g=; b=gRJhcqdevEu99gJFy75aLETyKO
	s6cJG2l3NXO6vmrxCNIrjQu+5TSriyaxe6BUa0H7g9hO5Ou3uNDWPL/0bEZ9EhnVybRGQDGW9hTiw
	p1l3YyxXCKS8Uy955CgfLVHSvpXDdLVNdtlHVtDOzKEHoZG5pT8tVAkSZaDQp9Q+zoneBiRta7GZ9
	G/hceotbmroW6dN00qZY3vxXDTSdSX2klYYOiLRHMKEUxukr2KlpPyv0xpjQk0rTJcdy2pq8eA12T
	/9DwnWJLpBT7kuphweypo2K2p8ZnbfAVSuX/k3uuE5ZB77kVzYjmWhR1pUdhOLzBcoyRYF/mrQFqs
	JxLvJTBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZtB-0000000Cctc-404m;
	Sun, 17 May 2026 11:42:33 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZt9-0000000Ccsy-0lpN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 11:42:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2bd266f6fc0so6124705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 04:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779018150; x=1779622950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aybAOu/Wnku8jJKJm8nyG/Glu+5oR3YJ4061r8jTr0g=;
        b=JWwEVGGT890D8sthl5B+VTmOTovvqsI9vJKNIM25B68ZgbJXR8jh/vdi2wVewzzt6t
         H8ri+jxZKnKgh27f/lYxgiacGC3iK2JTCYGkl36D3eVgUUPkELbZczMcpgIugSkZ1VFt
         O/3hQB45d0lC+d5YXe+dvjGRaSYvnG/McaKn34g0mKQdd0Or/h89/iMS3piTS2le/4zQ
         GdUXyJ59fZEK1931r2OyrG8AaTVo8CuEZVkm8Sy+Fxxy+HGktcb43QIeHN1leMDLFbpQ
         9j9h0prP1wf4r/4yAsBlhQuM39yBetMJRzlGckVIoNf2keQuZPAYJNRizFk1pOsknsnI
         vogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779018150; x=1779622950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aybAOu/Wnku8jJKJm8nyG/Glu+5oR3YJ4061r8jTr0g=;
        b=S+77EESdQoriHET2gxwuxBzAzLs2Ie/RkcxQsFg65n1bJ4ZXhOxzd3+D0Xh2EYlwmB
         KfNXMBpLNfv1a//mdn7yDDm6L9sNFOl6zS0tvHonb4ijQHsyrJt5mU68+CYGlysi0ya8
         COjz0NYrHNq83XpW9plhvThtuq9z5d7x0gk7Zr1yofxDVEb31UoIASxrpoCvYx4+VJl/
         NnUYAolofUs4UvqrCVvgof8z96Ba9Sol3Ze9A/t5x6HVzeAWHal6HjPKYh1sJ9pzLPHI
         FVAHK5l4LRQvfyotgH8jBHnV4CdOObQLC4YorMjsnBhGX/SIrEV6YzqLFHzm9972txb5
         kE8g==
X-Forwarded-Encrypted: i=1; AFNElJ/mZNs1uFLcIED/QtmVvOfB9sxCPW/FsXbCY9VYhN5dNpqe4RpZMlf7MZ+L6NdxBNrDGXHJb2R41yfBK/64RqYi@lists.infradead.org
X-Gm-Message-State: AOJu0YxV1LAIIETTVXvhpuUZGvpmOBo4HvX5x8ZAwWcYbP0ChubsrCo7
	CQWRZxwe+MIRDsH9QnaT+A2me19i5xnDmH1ltVD9BCYVjkwL7kThwQ+x
X-Gm-Gg: Acq92OGDqMLcFOjn+43t67kZ/Gr1Ye6aSR8tnmKR79PDdGjjyEo3Z5illVcuA3YQFZv
	GJhaA81MgRkRZQLAwpuwLBknu63b04wWzD2boeks2/QNwiE9Y8cOzxhbAC17zXAsfbe7VeNlon+
	mWtgeJ3zJTtksAR1MMdP6EDFeCusMnza8gj6m6bRoQRa8v6q8mDWn3uq9GD6n3vXDBwBy0WN9Dl
	LIFEInsXEe2oBrb4rcqkbkkD2MgEwX4TP8tiMz9ghg1GHxHdrKJZy4/bBS0+qQCxz1IJAIrC3xF
	u34/3afMiLJ9sDH+HejVbwfxRFETA8upbUJpyJ3mlFsMnAtrEYDOK9SaVI4eXxW4aEDPjTwpVG+
	TwO9+aC0wVyO+/oix9F5tgJBR/WCFzcfW+tyYM5fvMsjh7cBg979mO76+Bt+fm+ancxgAfND+0z
	F+r13vE12PjvJB
X-Received: by 2002:a17:903:1b45:b0:2bc:ffe1:c380 with SMTP id d9443c01a7336-2bd7e86c179mr114076265ad.8.1779018150104;
        Sun, 17 May 2026 04:42:30 -0700 (PDT)
Received: from lgs.. ([101.36.106.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f30bsm135198645ad.16.2026.05.17.04.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:42:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: stm32: dma2d: avoid double free on video register failure
Date: Sun, 17 May 2026 19:42:16 +0800
Message-ID: <20260517114216.950713-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_044231_230066_7F6026FC 
X-CRM114-Status: GOOD (  11.90  )
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

dma2d_probe() allocates a video_device with video_device_alloc() and
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

  dma2d_probe()
    -> rel_vdev
       -> video_device_release(vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vfd through vdev->release().
dma2d_probe() then releases vfd exactly once from rel_vdev. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 002e8f0d5927 ("media: stm32-dma2d: STM32 DMA2D driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index a3ad19256859..0e36ddfa8c7b 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -651,6 +651,7 @@ static int dma2d_probe(struct platform_device *pdev)
 	}
 
 	*vfd = dma2d_videodev;
+	vfd->release = video_device_release_empty;
 	vfd->lock = &dev->mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
 	vfd->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
@@ -669,6 +670,8 @@ static int dma2d_probe(struct platform_device *pdev)
 		goto free_m2m;
 	}
 
+	vfd->release = video_device_release;
+
 	video_set_drvdata(vfd, dev);
 	dev->vfd = vfd;
 	v4l2_info(&dev->v4l2_dev, "device registered as /dev/video%d\n",
-- 
2.43.0


