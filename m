Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7CACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 09:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsfY8GRrXZdSk9lyMdgzW2ibIF3DXFt06J5TGlB1HVc=; b=l0qzDdc5qz6R0p
	z2uO3ofqLtKLCM0Kdi2S6djY+KI31tJ5442Z3aG7SN9eGHuCFpMScBDw/Ca5YuxDdiJSlTTN2vvKG
	VQeQtTVEGmzMpcNEeLwXWvYkbAz6BQLAMmSJpw0iWGHC4Z6BQ0tr6KmetccU8mAXm0BglploEKMZz
	ZfBa4ApGFROMxwhsIl9EnFsXUOFLzxAk0BuI6MczjAGpfF1zCTZy1XG/Dx5i60OVxwUPqm+VTDdC0
	BFgqFkG5lmY8kdqbtTV8Kckqq06Y/jjlcG7Df3tYF3KkTY1KHOZJWxLC7mkLBmZB1q7CxAiqkstie
	reW91ulJPxxneV1CMWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFj-00000008b1E-1ssi;
	Sat, 30 May 2026 09:45:11 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFe-00000008ayS-3e1h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 09:45:10 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2bd9c3b550aso100550175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 02:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134306; x=1780739106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsfY8GRrXZdSk9lyMdgzW2ibIF3DXFt06J5TGlB1HVc=;
        b=aj7jHy5hTdWJZl5j+N34BMId2oKqOFppCk/c1Jx5L4QZ+JpbPvLp/vAVg01+TbQ75F
         rwSd37cFMOTuLqHsaz/F+aYqna5gTrFzUzOSZv8MD6D6QVO9/VbEP5XlrV5vuv6sKXr/
         ukjhgLC5Sdgg36TtmIaaWgi9mCNLr71kxfFv8mIOfmMhl7/BJRzfPIWAEa/qmwRKZfP8
         Kies2R3807FJk2rzfmfg5OfI5Oug9YP8Fj19RuwsR3BcvKAHQvOZ6z/l5XhgUZoKDseJ
         kfCbmfyYdSASeh0aT2BnFyykCVLfBfEI/BS1qo6b0TPZ8e8WCErArdQbHKFHuJQRenn2
         VP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134306; x=1780739106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UsfY8GRrXZdSk9lyMdgzW2ibIF3DXFt06J5TGlB1HVc=;
        b=hqET9ptdJtblTtaRr2s2RHW7LB7FDmB61hbIMA8ps577GIZNIZYlIr1lrTC1+H6Pyk
         d5TtiIwHss4SbZBWBXtWnCy817MVh/P8UMvVRLVVUR/mJ3HQT/2Ja9ybTnsdXFocSOVc
         AsqYtTv4u2jnx5MoxyZT11NNVymTwVcMBnJuLbN48jCx1P2UIxMFsLAzwWhqZVs7AoVs
         mNzGkU3DSNGtmBn71bzkUcazLAm5fX1yv2WEWGy5WViHMnNwpDupoSvfghbAUhs2hLNb
         a+S57RWeYLm1n+JcJuhVW7ubKaXK0NqJZCJU8OIPIf1+FFH1UDTZI69ia4KxUbtNGqiI
         xtow==
X-Forwarded-Encrypted: i=1; AFNElJ+fZ/AUJ6nMQ7kELlYgBzhQ6aRQosMnvSnTDCvO4OyRDwZ6Jxk8C3+gaNgENpGZN+a3gMCNJFaB87wKiXxVdDNS@lists.infradead.org
X-Gm-Message-State: AOJu0YyVzmFYEykBu4r4JHnZXh+we0p2FmPGc9C7tvKyctnyaSuU8dfv
	qAVBRFBNFILxUnpTvVxxuCbgEaBUiKCerdiBVq/OTXSdDVSvMjK22TGf
X-Gm-Gg: Acq92OGRjUD8zYqYT8b4Xb66Xgj0rMAA77p0Ju/yrduF3+7zsqq+s7PrbMXlKm87Jcx
	2vzp3fl/97/LfbaKvZAmefFwL1uUUbRCp1uIKF6wcgRAiZHtVJ0YpxCZ4e8EN3VuEw1C09/uUgh
	LdbKlLTAuIbBXn7EcJxaG0yMwC31bkZt2xSNZlio/uU5LkzH+RQTBXqCRHMd2/kgHLSvFGf4Dve
	1Nx0AZYcC7ZSfpxt96gFmRnBmx0KOygIX9oXu99gmiUenk1E1gpVKu04Y9/6s6oCE2z77f2O5Bc
	4OZqJ1msPgLmiuc4dby4F/QPQn49+F7C32vGWWSOBKvK7cMj/QY25Mrsw+UaunhS6u081AZ9jSE
	az+il17szo2g/IAqrAegfwniQg98YJzbstI75CBd4G6Ftbla0RWs7oBOU384yw1ivX1fFv50Fvx
	HTSCufGbSC+OQb43Bd+cPDcHM94H0pSW4Rr5p48Skohg==
X-Received: by 2002:a17:903:32cc:b0:2bf:23ad:8598 with SMTP id d9443c01a7336-2bf3679336dmr37430715ad.5.1780134306001;
        Sat, 30 May 2026 02:45:06 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:45:05 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 6/8] media: meson: vdec: Configure DMA mask and segment size in probe
Date: Sat, 30 May 2026 15:12:52 +0530
Message-ID: <20260530094326.11892-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024508_147603_2971B9AD 
X-CRM114-Status: GOOD (  14.93  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The vdec probe routine did not set explicit DMA constraints,
leaving the driver dependent on platform defaults. This could
cause allocation failures or fragmented buffer handling on
systems with stricter DMA limits.

Fix this by:
- Setting a 64 bit coherent DMA mask with
  dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)).
- Configuring the maximum contiguous segment size to UINT_MAX
  via vb2_dma_contig_set_max_seg_size().

This aligns the driver with common DMA setup practices and guarantees
large buffer allocations work reliably across platforms.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4884ee04b352..f99335effe17 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1064,6 +1064,15 @@ static int vdec_probe(struct platform_device *pdev)
 	if (IS_ERR(core->canvas))
 		return PTR_ERR(core->canvas);
 
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set DMA mask\n");
+
+	ret = vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to set DMA max segment size\n");
+
 	of_id = of_match_node(vdec_dt_match, dev->of_node);
 	core->platform = of_id->data;
 
-- 
2.50.1


