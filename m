Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB78DD149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dnZzxFDSzNZ2XOSUDTFMzhrUG7dVfBzR4nm1WX8rOk=; b=MZPukQpAZNO9QSsh80udp9dNC0
	XSEbEE28H5FWip5UTU3/MbJWltqyZvqTpQqommDTwG3iqVviKsx55YIM7HivnMJaSr8oXv2zwQ4z7
	QpdMwEUxgLWeYVZbIyaGnb3tsDVNB1T12tAWsyApowBgvzs2aHVOfgm0Wo4LwlPVBeIjGCSNd1PWd
	BPxNS+48OpKcdlHK1Z8K61XjPYIZvMuduBAALfKA4RjpnU3KTwrLa7vywJjZYDFwJ5Cvx+GqB74u7
	ywmsRrVOi6Kx0uo3VshORH2YI9gZvc1sAsqS8ZzH/yG9WQXSkI9cv3qYEkPX+bmT+xAmkvfYUXcHr
	St1RC3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OlN-00000004kZi-2NOg;
	Fri, 25 Oct 2024 18:10:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv6-00000004Xsf-46SM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43161c0068bso22042825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876575; x=1730481375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dnZzxFDSzNZ2XOSUDTFMzhrUG7dVfBzR4nm1WX8rOk=;
        b=b2JSILDlaUTSUzCssYTSa3roMoGswtPCrHS8+f0uQ6xBjyOtqWxEWS/JafUvA3HHc8
         bC975ROiyEfY4yphrXnGLn2tsFDeyrOaFFymUJC17TosyUbz/D+sMTaB2QmguRZ0vaqy
         OhVhXWaYiGq7S3tIldGq4XtYKKtfhsPnE15llFRKaK+c9DqTReQB0ZBdaoZND0CM6YXH
         SHmigxWpo2EhiX7msPyLjLrL4DVNNVPFxNTxbojHap27bC/5cViFJK608gx1skzam/cc
         foKnLaggg+RB95gqVP7RwkTfGoWDWyW/zX+O3Vqqlgkkx5dTYIervVF96chKlE96Zuqg
         KJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876575; x=1730481375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dnZzxFDSzNZ2XOSUDTFMzhrUG7dVfBzR4nm1WX8rOk=;
        b=ZxwLpRyW3gv7ByxJ4GeoZluPvGmKdq8y43VyPehuo1FLbdc1ZEl5NL2abRgaVPIHfQ
         gqwMz/XzdMTRqVOdrEuOewPWfyAYl+8gnnJ612o8QTP9dv25S6bIsT4jMI/K0yeY7vqj
         nEVEm1HaLLRZNoMoeQFq2DRTgHANj68biJIQlisLay3XKX+WEKw+85R1/fLz9JZ+DveX
         I9/96VACyqpup84vhdcxgkYPjrdZyR7LN+fkq/Tmhb2ot9OPR+uMIh4MS6XxyHB1+b+o
         aBYdXVbxUfB5A2+gMXsgEIr5i5zpVbW4oQsu/vfPSCOkFkU6LcH/CMG6c9uaXr9M2sIa
         E2gA==
X-Forwarded-Encrypted: i=1; AJvYcCWXRvBSdorcwLW/NgrjtkMFYS7SSxf7RbZwvEr+VFTxn49g8ipJJ9o7L42tRaihHWtHDbG+3dW3Jc01LZjd/A2Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+OUuC0IbJ5DL/aFuv2Xn9EFpBRi1/GTacxREzbAKAdRgXq1v9
	epikwcQiEXc5t9dEgXmr9ELvshJTTwnaxYzSvA5Kl+b192+YrpnP48xf+2b+4H8=
X-Google-Smtp-Source: AGHT+IFDbWZLs/VvibvWZkwt87XWxzo90576NNCfQK9i5q2/H1vvN4cuvfjgITpZV+qwWj/4uAridw==
X-Received: by 2002:a5d:43c7:0:b0:37d:32ba:ee76 with SMTP id ffacd0b85a97d-3806120db6amr90981f8f.57.1729876574913;
        Fri, 25 Oct 2024 10:16:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:14 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:45 +0100
Subject: [PATCH v2 14/36] drm/vc4: txp: Rename TXP data structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-14-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101617_075005_AD303979 
X-CRM114-Status: GOOD (  17.90  )
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


