Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BBDCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YwCtNa2bNCMGQ/e87qwfib5kmy7GWvXNJtX206pcf+A=; b=25VQa1QiS34mgF5ubXZp6sCigk
	IaGUsssY+Nt+Q2v6YDf4VQyxDR97ToXrNx2ANqiCpon0HyYEkT69embe99B2uvBsEHuASmYCngWZY
	YD8auc8/M14er8YgHxmBBOA0FU3eIAP3NidlX14BrCMllsDuTNGW84WarDWn0f6DJWSvFgbJh4rBK
	muej0EDIyj0jFmaCIOP4qTZHA9BkcJI/GmKyetofHjdmB57TRxzbU6QUqH4F0wNKDfICIPB5UxXF3
	IOhoyFq2brN7cZBYWYm0h/qUvkdHsydwmiXPzJq3Y+2pa4Hfrx9v95FNnE91TVHDoT5zurziGPls+
	qui7kfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZoA-0000000CcO3-08XL;
	Sun, 17 May 2026 11:37:22 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZo7-0000000CcN3-3l2G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 11:37:21 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3697c35eab7so453000a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779017839; x=1779622639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwCtNa2bNCMGQ/e87qwfib5kmy7GWvXNJtX206pcf+A=;
        b=Au8rJfnYjR4RuT8FIOFN5OBL2voHbuoBlbLyhy27ffS9C3I6w2QFLD7+CssjEdhK+P
         9XYSjEKWW7Maj5VF0P5kj++2KHuhkzclkW4ucaDfo+uW83AxHF+jpnEsyBBjdcdmLisL
         v+h64hZCmTEzYP4HVO8QIuFEZ9OIBYE8OTOaEJ5cvZ0xGjVYAxpEy/v878M+LiLmNvVJ
         0dbNpWwjWP2xMMigecnM+9fhmqlrxFF59s0KOUILyEblVnLyQnCw+L88dz36LPZoLWqr
         9p5d7MMJmkkOD6yj6BPobvvD0xOZVfzZCJsjk6yRT566e87/cYvfTHLxPKGduwcPB6cY
         fBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779017839; x=1779622639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwCtNa2bNCMGQ/e87qwfib5kmy7GWvXNJtX206pcf+A=;
        b=mGvG89nEiyBpEvt0rq58odP/BVJ3mGsouuPr+MbZ3naXU8eBrw2fFn98MkxBwupjBl
         k+DT14d8klBAneDtgz8iQxipJ9i1YNLIZJnbt1jHhhIPVC1vHWQr2qkAL5kJNZX2joXg
         kxDdVFKR1r/Fx214MWQQF/kE8TA8b5hHbTbud2F3PWTgcy5uuWi0/x8+erxZVCys17G8
         iKwtz71z55v9Xzwt3OPQtyD1q1MKdqpzWCZa5Yj61WvVxXKCbUa7Glb5K9YO3nvdaqhg
         NVEF6wWGS9Fs+JNMpRk9BoNJFDbax/3s0Syts1+1R5kltWks9xBJMvHOOmBnwLcrfYHR
         qnTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GbXYS4LXJvbAI5Wyxr/tkgsJJdqNe1iJzVulWyKtnudwoxfzP/dQqPvwQOCStdSE921NASlXuEHtAjMmV2nnF@lists.infradead.org
X-Gm-Message-State: AOJu0YwoFddb8ptabD/nbm25cP1/lk6Qh+l84yXlZ7wDF5hKa1djznxK
	dsZnlIqnx5B5SVTXxlvew7who6qTARlGsjN+ME1hg/84Li26TdvR80k594tSnGBSim4=
X-Gm-Gg: Acq92OFJG79K5/A5fDhjL7upnRtoLUmRtpD3N4xgTGKxlaFtHcfLu/pU+crAGSOSAIQ
	ovWA9ZdIYF8waURSoBm/ifZnmoix/KS+V7PQfnh1+yXORS4/aLctvQDWlKNF9aBic8LrxmAHj5R
	rX9TWnZh7oVt1vyV5C/U1x1iJFJij38aCXMyCx/NoR9golp9Sdc2KUEVXVUM+KX1InN+OWAzIaL
	pjC8cXxDx68AE8T1/ZqHJfs1E1pyT5QakdlNlVpOJS+vpylQjwb6b1usRUK9qHSNRL/ZEEU7ovT
	OH6XtZJn4xXuO/T/i/DDT03ZUaDBGzy8futuPaCLgfOd6Gp0IT9t7zHvGAcHLj6U5oZLStT9JST
	Ugr4U6AkBvhoVqQmf4KxNhlHLQXbJUSTWMlT8KqJdfdu/IMz4upKo+CD2Fzwabc/FTIjSRzlMKa
	s2tyVMbA==
X-Received: by 2002:a17:90a:d648:b0:368:95e1:8d45 with SMTP id 98e67ed59e1d1-36951cb7706mr10428613a91.26.1779017838713;
        Sun, 17 May 2026 04:37:18 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36957261d59sm3162871a91.4.2026.05.17.04.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:37:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: rockchip: rga: avoid double free on video register failure
Date: Sun, 17 May 2026 19:34:49 +0800
Message-ID: <20260517113449.949222-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_043719_968709_3DB69A75 
X-CRM114-Status: GOOD (  11.83  )
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

rga_probe() allocates a video_device with video_device_alloc() and
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

  rga_probe()
    -> rel_vdev
       -> video_device_release(vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vfd through vdev->release().
rga_probe() then releases vfd exactly once from rel_vdev. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/rockchip/rga/rga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index fea63b94c5f3..90ae01de3216 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -851,6 +851,7 @@ static int rga_probe(struct platform_device *pdev)
 		goto unreg_v4l2_dev;
 	}
 	*vfd = rga_videodev;
+	vfd->release = video_device_release_empty;
 	vfd->lock = &rga->mutex;
 	vfd->v4l2_dev = &rga->v4l2_dev;
 
@@ -895,6 +896,8 @@ static int rga_probe(struct platform_device *pdev)
 		goto free_dma;
 	}
 
+	vfd->release = video_device_release;
+
 	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
 		  vfd->name, video_device_node_name(vfd));
 
-- 
2.43.0


