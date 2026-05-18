Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BE3CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OgGqZu/lBvzHJtzf9xCysSkNq9jit1BxS4Kzrlj9Hvc=; b=tx5Zkod8ZOf72XY2uUTzJyrPze
	VyRt//ODt8RLhivBJU+avd7TAig2N18/JiJI+bRk8eQ5G6qnn2eyRXlWSsniA1THs8wfeZ252ZvK8
	ga+anlYPSgrvE0/oY4PgvJOuU70WNlMcPm5Ri/h+VFR1PEzJbmbbmGbC3qObYYk6c0IPlSpuA/kB1
	xHNT9fcA63ZH4nMncucvZoVl1sIgFqon2lb8Pz5r1kEaAIrl038uabRnYOdEW/X2AFltrflMHsEWf
	HfQ4RZsLraACjU6xxcKgvaPm9lnXVyd+KNiDmXGv5MuKGWtLB2ps6T8kW+j83R7FUNu7+HzHZU5Vk
	Sxb9+hMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxyy-0000000FoOR-3Pxz;
	Mon, 18 May 2026 13:26:08 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxyv-0000000FoNq-3ZwW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:26:06 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bdeed4f717so4319305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779110765; x=1779715565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OgGqZu/lBvzHJtzf9xCysSkNq9jit1BxS4Kzrlj9Hvc=;
        b=ag3/Eam53/alE0rDENCWCdK189Y+LOgsgIxRQDF0oLw/sfRmsz8kF5OIkDm7WoJkLt
         FkQ3qqkfkIbvdOxR7SKoB2wZdvG/kP8AYVs3ruI19Gm11NbdqzoOONgRuQEuUazkQZ1M
         xZMAL6qQmf/TP0vIQ0tQGfylJZdfn3HpqGqtmRZ2POZ/C10CwZnQHFzebzwiS0wrOAfY
         4WLFNxVs0/JVdt1R3WkVwvsDf61j7Jz309Spg83E+GEeA3Yu0Q1dR6OxnMoXxZDcMyTX
         1RUPpWqguNJ14MKGwUFHYD7NmrsU94SoqoC+jPAUn4E8ijkKv0j1DalpIRK6eh2Pc/Cr
         6w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779110765; x=1779715565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgGqZu/lBvzHJtzf9xCysSkNq9jit1BxS4Kzrlj9Hvc=;
        b=EUEQjd9+6jXdZRYVZm3R30qoqLRFtc+ifxwOwU9DRMQZOnCw10Qcy7tAxHSeiHWRvJ
         bXoJ4wE7Mv0XQ3Z8E454LR01DuY3f1yjporlqrSQkaIaCGwNaom0vzWLY5eX6bpKuiQf
         3qZwrPI9l7FtzSKfD44V/1EbQzSOukP+VrYQOMLcBLHk4Ie6TeT6PGyrJ4UnM+XLPdj2
         SRFCn7WylP75fwcgnJrHVbDeaVCyMPpgyN8J9F8tGuutOSNz08UPbZkguBH1qNCxwS7z
         Z/FMvz1sQC+QKfdeZVy9Q4IHNH533rrYw8BHLlqtT/DVHkUXQfTrXhFP9Xw8SNusdNos
         DjAg==
X-Forwarded-Encrypted: i=1; AFNElJ9ea4Q0aP9wdiPqZ20GSTV4ft+yTJ7wDth5mn7tvXFSkGDFMq7xs+ny6F44aCvhpCJaljSesGmniJqiKwdKtd3b@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ5MImmjrAYAmlDI7K+PVS7vZO+QnYE9YS6swtLgrJjYk5kCcv
	h5zbk0lhfpPlS85llmBKGMnuD9GQthGzMQhOHTW84+abMadCug/+IHvY
X-Gm-Gg: Acq92OHoUfSwUndXI+t//VWdSLDJ36uN1Si4V0jw1AdkGVEcCanVr/Z0AQ/miXDvKrr
	COwvv5b0KItPEf8xmmg6N/fkhrx6MIDYT667EUDzisr+IDvmhgPTqAma5rbSEFFMTN8cPLA6y2E
	pFa3UbhypRO/9G06kymtDzNle7o/pBba6LM3/vtOr/YjRm+uMdudcdrR/0WzPnhElDEM3qoqa0w
	Hx9tDxtbwjeusmc6s1PXliP7N+P+mYO9EFO7U9N0sYyfpMbVYnTysiXXQ2TMdqniRGoE+dFot3q
	tIzPNh/q2V6xB196XyZIw4qVVxYdDPlNFjZSk3+1B3z2Yzp5yVSRWulBc5FMmY+GCTAN2i6qVxH
	CaiiX6nzC20wOiiYdlCDqUwLT9Qr/dilmgp9dAwjRtIL6k0SSYQo8XE/q2qEYRlNRizKxjzke/2
	ab5HMINQ==
X-Received: by 2002:a17:903:3ba4:b0:2b2:4029:d781 with SMTP id d9443c01a7336-2bd7e8c6819mr166862835ad.20.1779110764953;
        Mon, 18 May 2026 06:26:04 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2cesm153402635ad.14.2026.05.18.06.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:26:04 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yannick Fertre <yannick.fertre@st.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: stm32: dcmi: avoid double free on video register failure
Date: Mon, 18 May 2026 21:23:44 +0800
Message-ID: <20260518132344.1008402-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_062605_893908_83492B14 
X-CRM114-Status: GOOD (  13.00  )
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

dcmi_probe() allocates a video_device with video_device_alloc() and
releases it from the err_device_release error path if
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

  dcmi_probe()
    -> err_device_release
       -> video_device_release(dcmi->vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free dcmi->vdev through vdev->release().
dcmi_probe() then releases dcmi->vdev exactly once from
err_device_release. Restore video_device_release() after successful
registration so the registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 37404f91ef8b ("[media] stm32-dcmi: STM32 DCMI camera interface driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 13762861b769..a6918fc618fb 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1990,7 +1990,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	dcmi->vdev->v4l2_dev = &dcmi->v4l2_dev;
 	dcmi->vdev->queue = &dcmi->queue;
 	strscpy(dcmi->vdev->name, KBUILD_MODNAME, sizeof(dcmi->vdev->name));
-	dcmi->vdev->release = video_device_release;
+	dcmi->vdev->release = video_device_release_empty;
 	dcmi->vdev->ioctl_ops = &dcmi_ioctl_ops;
 	dcmi->vdev->lock = &dcmi->lock;
 	dcmi->vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
@@ -2012,6 +2012,7 @@ static int dcmi_probe(struct platform_device *pdev)
 		dev_err(dcmi->dev, "Failed to register video device\n");
 		goto err_media_entity_cleanup;
 	}
+	dcmi->vdev->release = video_device_release;
 
 	dev_dbg(dcmi->dev, "Device registered as %s\n",
 		video_device_node_name(dcmi->vdev));
-- 
2.43.0


