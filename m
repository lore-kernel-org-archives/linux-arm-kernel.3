Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4918CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rAloUi+mRjxqQ41OzwWcNwZlapgA44SFMZ3iPQ72NV8=; b=GlKZXxtFWFN2f5iXFL2gGnW0Lh
	jMIDTVbysppJOxsfBVBbkAlkMNAzntg4sfPN/RGlSDyovl96M22KUZX1oNRdVcvsgFuFjOk8VWjmQ
	u7SzFvRlXOn2O8VFzH34LJlXONbNwPFQ5lqZ5iBzROiDIRyc6ZV4akBX3PcnOxMnxYRygtU5cDDyZ
	nzEoWseUcBjh1vXPepVMLfdMv8YGnPw7Z486Ml3/O6/oaSMm/nnL8jA4tk8bMNAHxnLnzVXkdJVZi
	hpBhcSUlwPAswIRpu7x7n5GcVabrzzVrznOeEcPWPo9sYLjFIvHKSYp6bKECMA7Y2rjhWOio2q8lL
	XSy1T35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxj7-0000000FlIf-47hB;
	Mon, 18 May 2026 13:09:45 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxj5-0000000FlHe-3jNR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:09:45 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c795f441ff7so1835899a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779109783; x=1779714583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAloUi+mRjxqQ41OzwWcNwZlapgA44SFMZ3iPQ72NV8=;
        b=WunHJDc2cZ35J9I4XsyjIbpMNelWtltWYqE8ThwJudxGdKPitn7Wvdwcp93NUyItZU
         AhAIRKyuGXti1x54FuWfsGyZ3/Xx6VFFrJamaSqxjv3/JvNkK8+SRJUNT38NA2lUV8rI
         uUn7t8m0QQDUhpAX0ZQC7A6dnUSCfelxiAk5WxTtigcWlx1CPGJ02+nKnsIc6zfCMyNJ
         fJusVWDXIlo7IS6fyRpDGnijlYW2XBoE20cC0JO4/syj8CiA/9syXs+I3CC/swJe08QO
         sLf5HZin5q6acIqjwl3h1G04MJ38WRQi+qHL02YkSxifrhdb2Yo+BGhqXeoNsJ+EHNtP
         ccHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109783; x=1779714583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAloUi+mRjxqQ41OzwWcNwZlapgA44SFMZ3iPQ72NV8=;
        b=J254KZXj14Xfw1lLlGjLozUA1LrPfTX5JQHSXIdnWhaWAUK0Nd6GoZt4zoRNe4Iz5e
         4ESdn9H9T9f9+aYn13U8QNCix0SlxZ1o59WlfJh6sRu53jTA6wzbiGqIWeMVt4O0MYQC
         PtknmpackQpd8jhcxRZfVCoC7MM5/yoyr29sMemImN0GYk7S+jN2kfjTq8fHr9YmfAt5
         zz46oWLDPfDo6w2DeysPLsgziYiCK6XVqgbhfT2WIqIRqh3eVo19/QB+VuwTXXzJPdbJ
         WyMK3QVSnrA94eTR7wtbleyNE4Z4t/3I9xYZLqDHUjwAS+4TNdZBsbMirBK3aXkXn8It
         8wmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HCMMk9wSkfU3VBUOO70tKFVhLl4PyqdHUKymgxIaalgiUud4lwVOCfUDm2KicsFGouZbwfM2pGH5FtNN8dmHC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2CkWGsUa+fbmGLzrMrPg68XgyIQCYZSBMHSJqpwSU2+x/nNaI
	w1S001n+XUE/vFWkhXrXgL7xfsiQD9IUTnT/ZZcRNe3qpt5FM2jfnN2C
X-Gm-Gg: Acq92OGd0fwa9bEYkayzdOG+QB2zYuXzEh7iR+O0csAJAHbhmkiIr9fy4hILZExYO5i
	Ns68eL/BYqP31mbDtEE8TysbwtLtO27hTnefwtig5UOaCDXKwhdmjtIY5HyTwR828ztFV65tJAC
	yb46E5GoSndnjSvSlJM3u+jB8qf5smHJqVWDkO9Bv0BX2L7IhITd5ezoEW+RFQ+J7/fpjsAmO56
	4uJ91UiEHOzQa48tee6UcZBI4z8IsFoLVSRuIPt5tuqMFrG890MEBWhQnBkjON//LASA6nlXpbZ
	EJJiUsQMyTK3FH/Hqic9kQOXNHrSCg84O74ZkQ+ByNTOoUZVNC06hTZrKdBD+sBypPJ2SBeSr7a
	iMwvLq39i7rqR/eaeHDFmmKoTgflvdt9NVuM0rJGvNszm41um9qEL1qMUvN47AOEMokZY1PtfYT
	RPUR3itUapDiQ1ruPu7h2n
X-Received: by 2002:a05:6300:218a:b0:39f:2dd0:65bf with SMTP id adf61e73a8af0-3b22ebe1bb6mr17937148637.28.1779109783131;
        Mon, 18 May 2026 06:09:43 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1966471dsm14863375b3a.6.2026.05.18.06.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:09:42 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Joonyoung Shim <jy0922.shim@samsung.com>,
	Kamil Debski <k.debski@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: s5p-mfc: avoid double free on video register failure
Date: Mon, 18 May 2026 21:09:29 +0800
Message-ID: <20260518130929.1003652-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_060943_931788_A9714787 
X-CRM114-Status: GOOD (  11.93  )
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

s5p_mfc_probe() allocates video_device instances for both the decoder
and encoder and releases them from the probe error paths if
video_register_device() fails.

This can double free a video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  s5p_mfc_probe()
    -> err_dec_reg or err_enc_reg
       -> video_device_release(vdev)

Use video_device_release_empty() while registering the decoder and encoder
video devices so that registration failure paths do not free them through
vdev->release(). s5p_mfc_probe() then releases each video_device exactly
once from its error path. Restore video_device_release() after successful
registration so the registered devices keep their normal lifetime
handling.

This issue was found by a static analysis tool I am developing.

Fixes: d0ce898c39bf ("[media] s5p-mfc: Replaced commas with semicolons")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 32eb402d439c..75abb0a8b7a9 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -1376,7 +1376,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 	}
 	vfd->fops	= &s5p_mfc_fops;
 	vfd->ioctl_ops	= get_dec_v4l2_ioctl_ops();
-	vfd->release	= video_device_release;
+	vfd->release	= video_device_release_empty;
 	vfd->lock	= &dev->mfc_mutex;
 	vfd->v4l2_dev	= &dev->v4l2_dev;
 	vfd->vfl_dir	= VFL_DIR_M2M;
@@ -1395,7 +1395,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 	}
 	vfd->fops	= &s5p_mfc_fops;
 	vfd->ioctl_ops	= get_enc_v4l2_ioctl_ops();
-	vfd->release	= video_device_release;
+	vfd->release	= video_device_release_empty;
 	vfd->lock	= &dev->mfc_mutex;
 	vfd->v4l2_dev	= &dev->v4l2_dev;
 	vfd->vfl_dir	= VFL_DIR_M2M;
@@ -1416,6 +1416,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto err_dec_reg;
 	}
+
+	dev->vfd_dec->release = video_device_release;
 	v4l2_info(&dev->v4l2_dev,
 		  "decoder registered as /dev/video%d\n", dev->vfd_dec->num);
 
@@ -1424,6 +1426,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto err_enc_reg;
 	}
+
+	dev->vfd_enc->release = video_device_release;
 	v4l2_info(&dev->v4l2_dev,
 		  "encoder registered as /dev/video%d\n", dev->vfd_enc->num);
 
-- 
2.43.0


