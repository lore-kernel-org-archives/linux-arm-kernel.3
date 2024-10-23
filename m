Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFD5CFA45D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dnZzxFDSzNZ2XOSUDTFMzhrUG7dVfBzR4nm1WX8rOk=; b=gx8iGRdugqiGwuNE7MQayLfvFD
	s3T2q4+u7KvCxSbfVoV4bBglwr0olTmGz4PYjACpOmYRHDuKcwB4x95BPqgF/si+mYQcfwxhWOyIA
	68U/Bl3eDPQAeWWBmY41KUyObG972FiqeXIPbxcpihpNI+eZniBlIiCjsqCflP29bq+odqeeO9dBS
	fWZCDLRWC1ta874rjfxglRq2NSqe66YLWUlyibBfowQVIkzng1sOdCtav+sC8x9lqteIWhLvH0HhE
	DNHbFLRPW5gj4+U2kx5Dy2pGEYYTthV1dwWjzdU/sVu82cwfWQIps7ymhrrrTr/eXFPptGB3z9Ssq
	/R9vxCfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fns-0000000FTd7-07gy;
	Wed, 23 Oct 2024 18:09:52 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYy-0000000FDNS-3Bym
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:29 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so61815405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702222; x=1730307022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dnZzxFDSzNZ2XOSUDTFMzhrUG7dVfBzR4nm1WX8rOk=;
        b=tpIWjPKGU1mxsPwvxrMeZbshdgTMy8MpTO3eymT1SA6oOGwJPBSUhkVe4FDlz2IaCg
         eaSJurmih2TAd89oJs2198NHaxkTJpQergex2M0iyRoD3Kwdcs1RdL/gFeYqyGvOK1+V
         cjkXTZ3qtyZ9hyOA4NIkxQcWHij8epCPXh2zav3AgqQEXl/UmLajLrvwGVMH0Mqjp3nT
         /9v5hY85mos+0FHBtSqCPESvoJdwmigX7hUKvIQhGLH6JJzF28ogJy9bj81bYnjAQyak
         hn1KcLam70es1AIKrR/UEwtSHb0MnAWLFiV6gEn9r/z67ueQ19Zx3421jqwFrkYrDWnx
         uOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702222; x=1730307022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dnZzxFDSzNZ2XOSUDTFMzhrUG7dVfBzR4nm1WX8rOk=;
        b=JoecJkBI9Iw1yf7olFlzHxr0u8q7kesdQRL5EuyYjG153LIDuhNSag8jRjyd3CSk7g
         ek8QYdX6KqULFtbvCLMRZySNWEfmv/gK9gIQ8YNRgpd7TganjKF1bC6O3jLZ+7N6uqZv
         O1nG1u45Wqh++EvP+FaAHFnJsoP597iJnbfxpdri1XZO418Yw6SkbQPNlpiKhKiGwgw2
         nAdlZQdf8NiR5zCltpjMG6DR1QZedqdpp2BJbufzrmttMZiQrEHvdcng2Y06dcFD9P4F
         Oyib3qY/FwpWpOG/D9zkuYu9a5Gv6CdxkA387TgL95hGGVcwqoTXfxMC86g9ehngBomn
         EhFw==
X-Forwarded-Encrypted: i=1; AJvYcCUUtyY8A4BUe/4tg3D02bxNaEImGL1uaI6HCSB0xXyGWnxe9oSN5HEM2RsK8HNTa8urgDci65HXwhoT/p7ehxyV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3n5NBySuhvKtZLngpaEHTASFXMEKrjRGJ2gkWFeyBnrEpOs9g
	FRM8Y8d4nRz2LUyVP9WWVnWMv3UyHfnUY+DfKuqWqzpM8hkayvvvlbKu6aXlvck=
X-Google-Smtp-Source: AGHT+IFI36WmNXTRV4DxPlE9LTtOwItl4jqcDI9buc5n49Q8WtFQEB6vJFj2nzepFaAVYzIFdCfs7w==
X-Received: by 2002:a05:600c:3b9b:b0:42c:bd27:4c12 with SMTP id 5b1f17b1804b1-4318413e4d1mr30434035e9.10.1729702222575;
        Wed, 23 Oct 2024 09:50:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:12 +0100
Subject: [PATCH 15/37] drm/vc4: txp: Rename TXP data structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-15-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_095024_980432_D56DB018 
X-CRM114-Status: GOOD (  17.66  )
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

From: Maxime Ripard <mripard@kernel.org>

The TXP data structure has a name too generic for the multiple variants
we'll have to support. Let's rename it to mention the SoC it applies to.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.c | 4 ++--
 drivers/gpu/drm/vc4/vc4_drv.h        | 2 +-
 drivers/gpu/drm/vc4/vc4_txp.c        | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index c7b91c87f1bc..372482fcd6c7 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -51,7 +51,7 @@ struct vc4_mock_desc {
 
 static const struct vc4_mock_desc vc4_mock =
 	VC4_MOCK_DESC(
-		VC4_MOCK_CRTC_DESC(&vc4_txp_data.base,
+		VC4_MOCK_CRTC_DESC(&bcm2835_txp_data.base,
 				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
@@ -77,7 +77,7 @@ static const struct vc4_mock_desc vc4_mock =
 
 static const struct vc4_mock_desc vc5_mock =
 	VC4_MOCK_DESC(
-		VC4_MOCK_CRTC_DESC(&vc4_txp_data.base,
+		VC4_MOCK_CRTC_DESC(&bcm2835_txp_data.base,
 				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 1ed1fb5aa7e8..e08c90245f94 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -540,7 +540,7 @@ struct vc4_txp_data {
 	struct vc4_crtc_data	base;
 };
 
-extern const struct vc4_txp_data vc4_txp_data;
+extern const struct vc4_txp_data bcm2835_txp_data;
 
 struct vc4_pv_data {
 	struct vc4_crtc_data	base;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index dcb1b3fd37de..6fe378b454ca 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -485,7 +485,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-const struct vc4_txp_data vc4_txp_data = {
+const struct vc4_txp_data bcm2835_txp_data = {
 	.base = {
 		.name = "txp",
 		.debugfs_name = "txp_regs",
@@ -588,7 +588,7 @@ static void vc4_txp_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id vc4_txp_dt_match[] = {
-	{ .compatible = "brcm,bcm2835-txp", .data = &vc4_txp_data },
+	{ .compatible = "brcm,bcm2835-txp", .data = &bcm2835_txp_data },
 	{ /* sentinel */ },
 };
 

-- 
2.34.1


