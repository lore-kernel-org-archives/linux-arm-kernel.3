Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD006CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 07:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7Nfdh9lJmyo73Y+RAkYTNq+7+iO9zy7FykzaU5yHn8=; b=3+GKOXwtX3R/QkVQpSjqSNis00
	LkZQCmlmlEXUTQS7eaqnq+ODbTsdSqbaIqCvfQaARmk9YnmpqA0HDUlvDu9fzEdVGS2cW41eLtAt3
	59pNa7c7c8st2SJ/FPH6vikfK+LR2CoCWH24UsjJozY6EIIAnnHtCMWEksNUlpD1iTHPGSnSx2Mnm
	lVlwVFjJhQwlGT1FD4FoPAMcr4L/cS7tkJenL1D+S+QHNHvPFlToEEkskEkLbkKqJ0bRYc1o/ovm9
	WG4j2GPTHBHsUKUoETEGro1uq+IB744MzgnaSJ9+/qojawRs25zCU//SvVgB4yrHy9vR5zd5N4nZf
	zoSg4GEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTajf-00000009Kda-3hkf;
	Sun, 31 May 2026 07:37:27 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTajd-00000009KcF-3aUU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 07:37:26 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c85822059d8so950294a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780213045; x=1780817845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7Nfdh9lJmyo73Y+RAkYTNq+7+iO9zy7FykzaU5yHn8=;
        b=hcHqKhSW1cdlHt1VC7S6KgEbP/ia3OTornEcFgzCcT2XPfiIfi98lRIKBIheShY1Yr
         8LTv9R0b8CKrPlDYdmA9SEeaa2zECvJhOrJbs1Ay35VRVeG8+TjzuL4ZHU0Z7U97bTDC
         0COdaHB+ans6HeKFAMYmBaIZeFh9DP8sRLm9mYAgAQY/6iwFTHhAIOLVE/v9BYUhrF4i
         6XgQxTHnRo3vd5gALublv+7hIu3RAITDZoSNudbu4mC6QcPnhuYBL9Yg8M47wT6iSTMU
         OTZhMjQvACLqRT2/MBmN0/mYbzwrbJnODyeLvcB5BFfQ0hS2k4lSBFgOMpWhyv5ZAW2U
         DreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780213045; x=1780817845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7Nfdh9lJmyo73Y+RAkYTNq+7+iO9zy7FykzaU5yHn8=;
        b=JC4fWZvqQPoHU7I87Gr9CgyEU743TGgXhibuNWLdQmMuJuqYb48wqTbMgdga5dFNrt
         sv2uQ77BzsLFa7keLOWPcvq9a+c/2hAMiLljPWPh/c0G2yhZNdJJNYv1Z2AVlv190IQx
         5o8SIcaQk477GRpYPrLBSlvCIJpxgmRR6PBmPWXKTBVCIDghqOcp8soLC2LMX1xf+RYo
         4KtTo8f0pz+W/oK8o/noVS+RtcBcdtFSrnC6NmGnoB56yksxG0ksuSgXT6WVkPwmn7XW
         CW5/rk38CuHRb7RNk8VZyd4h2WQM6fLGyiydd/yOXvlpzQMgsT9eJbHcPeXb8iiYMBoJ
         nMfg==
X-Forwarded-Encrypted: i=1; AFNElJ8+N2X1b/rZpXXYfRWGHnUutnvWUVnEKSRyHtAtp7mszEYjwXQPqJ4gzjP+waPeKtGqT0BYO34uCqO9nxbN4oEV@lists.infradead.org
X-Gm-Message-State: AOJu0YwvoiOnyX8JZQ9GmtqeCYtrEIZ7FZTPlHWo8eIIkNqVcIjv2DV1
	IfHsMxLH8+ip1G7/FEevJ0f6hCDee76//88Nj4gnIYQe5A7J1a+kQemJ
X-Gm-Gg: Acq92OErL+ZrMhZizvUpyPOOGwQnC0cRavQhpfY81ZGo/TcxzqEwIkJptydZfuq4aED
	T60B2ZM+xBq+qkwRs8NhY/CV/vEOlR3uHVarEPVbH8Hd/poe6tOvhKMmiQRxLYSQ80n6H5FKeTc
	YY95cg2PckcuwwgBcs/vDXsn0b4eCgEGxF+NxOghjcP88orv9VoyYCJ1gdQf//Hbna4VIOatZw9
	6zLS1GcMDTu3NdzgYNWEJiACn/e49W+P497G24nkNo7b1dWaqCoL+AYCi5o4DH6W2NbHVrAsyZQ
	SnsATLC6LaIVPWlbpGK4sVdmLYWUnFUGiXj8Pw/cvjM3jJJkMGm2ccIb8s9w7cSe5XTKNYMkzF1
	Qx8SqX9GU3SksqRPm9wP5bkzySs3EEktQzVLkvW/mnjIn3nG5o8fVkpMP02mV7u0C2hnY/8jE55
	ONH1MBVWdow9vENrwqEUk/p/ADnPW2aeikQdkviRr6Eg==
X-Received: by 2002:a05:6a20:d04e:b0:39f:3ca8:a33b with SMTP id adf61e73a8af0-3b427fe4d91mr6837181637.17.1780213044907;
        Sun, 31 May 2026 00:37:24 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422e712309sm3760709b3a.59.2026.05.31.00.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:37:23 -0700 (PDT)
From: Naman Arora <namanarora029@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	stefan@agner.ch,
	alison.wang@nxp.com,
	jyri.sarha@iki.fi,
	tomi.valkeinen@ideasonboard.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naman Arora <namanarora029@gmail.com>
Subject: [PATCH 3/6] drm/virtio: Open-code drm_simple_encoder_init()
Date: Sun, 31 May 2026 13:05:29 +0530
Message-Id: <20260531073532.8609-4-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531073532.8609-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_003725_913158_DC858BFB 
X-CRM114-Status: GOOD (  12.18  )
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

The helper drm_simple_encoder_init() is a thin wrapper around
drm_encoder_init() with a simple destroy-only encoder funcs struct.
Remove the dependency on drm_simple_kms_helper by open-coding the
encoder initialization directly in the driver.

Signed-off-by: Naman Arora <namanarora029@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index f1dae9569..5b99cce17 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -32,7 +32,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
 
@@ -271,6 +270,10 @@ static const struct drm_connector_funcs virtio_gpu_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static const struct drm_encoder_funcs virtio_gpu_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 {
 	struct drm_device *dev = vgdev->ddev;
@@ -306,7 +309,8 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	if (vgdev->has_edid)
 		drm_connector_attach_edid_property(connector);
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	drm_encoder_init(dev, encoder, &virtio_gpu_drm_encoder_funcs,
+			 DRM_MODE_ENCODER_VIRTUAL, NULL);
 	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
 	encoder->possible_crtcs = 1 << index;
 
-- 
2.20.1


