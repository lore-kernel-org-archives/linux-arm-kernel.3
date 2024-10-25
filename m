Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11FBD149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZSl/F4a59d6cGzaQ8UBGb7tAkWNLG3z9Ozwy3jDhoY=; b=zbECqgDaY4IeymoXOVpayrnz94
	/gwTta4rQWqiwFRyjiZq/ruoHjWy0YwzvfjoQEzp2wpElqbZCGNS4/kwdysQi6ZDtcYx/8n6QKF+v
	aY9Gxitaj8Uwn1qro0RcMODgAh9zVtRJw43T8gSGcADpKsnXNxZdhMi7/fP231vPxDjeLeDMvDnNn
	cZuliq2Gzx00EPBmxRhR8bV78YQYTfd+0CpONDeA77pcXtn8i7dzCBmzrh/by1aS3QlOi9Iz4ECKi
	7ZB+tN82W59/LMDcVVM4cuLWf1i9Upl/G0qFQUe6/OWy3yuxPq/XFWuu2dz+kOkzDNzZyoL4YGJ4z
	2gx6vnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OEY-00000004dBj-3RPp;
	Fri, 25 Oct 2024 17:36:22 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv7-00000004Xsk-1ac5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso29406675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876575; x=1730481375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZSl/F4a59d6cGzaQ8UBGb7tAkWNLG3z9Ozwy3jDhoY=;
        b=TUWMx24yT8uG/6G264EKUJwSysyXYawSNv9WpUXSgd4yrvnzv1dLA4c7hDR1VDSopX
         GMEpYqVw7PIXPqkDglTYBrou8nM+MXABI5P+eLLdNeUR3dB4uLmYzVTZZORFxsxtFwsa
         f+UYwkWC69VOd3v2RKBZfFE4S/uBg+TgtBw9IhQ85P4kO5sKxp1/cu7N+fCWvlxqhSkW
         sB129+tWrIMzGvxWEahOyKTtKPDp9X+5iHg8tkx2G01kl5tEzyudy6AB7YMpm8iDpjiP
         ZtFD78aDYsu5XV3uyZ6ilOZ65wZxiAIJFKBLfNS+oyLV9uKJELgYT+1ZlMF6RrUxbT9z
         hZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876575; x=1730481375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZSl/F4a59d6cGzaQ8UBGb7tAkWNLG3z9Ozwy3jDhoY=;
        b=iR3Tz/d4TNGYy6UCIn1zcEEUF+9Nm04ReUW/loPIjCCP1z9hNS9EZZoAMqGsCmMEaz
         TMXSuAmbEi/8HJdTdbMCSs/3p+gNFRRJ9Zaro0OUxAtua+gz1dVrcQGMZK7SqTUWrtxY
         1YRqDypFaBR/hA6+9hXwMEKqiFrpQTvOJIdddIcYHrCaJfX9711tT6U4m0jHqQOwh5nz
         YEvZT0j9KpjMIEntNS67HF1cn9nyiQTGGHlVZUM8jp+KWSuh1OnLPDYscRAF7CQIghD2
         NNjgIUFpa/1JcjXPqTwyEG1bViEp0AUG+v838HNsD8FzwZ+rcD86UUqg+WcmrHav05QI
         qabA==
X-Forwarded-Encrypted: i=1; AJvYcCV3LlwjZ0E5E2y9VCEJppTvdFi06fWkRBfa0unpoUuDqwc0IWfhb8k7WhuqQpPQZVo4g+ih/93HSVV9l7kPgWFM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+OFZc+lioRF/BD8i8MhbNY4x9QTLHVE17K/XzQTLJEb12sF8n
	lOtbTpT6AOVWI4Jwe5NkTPOWlGZKt1Cgf6MvfWTLudKl6CHZroibon/i6TjLIqg=
X-Google-Smtp-Source: AGHT+IGYCJwSrz9ld715UfDoH5XKNaydjNgYU5P9irKdws9FIn39XqxjXFv+TI0I/O8NtYhIy9aKqg==
X-Received: by 2002:adf:f850:0:b0:37e:d2b8:883a with SMTP id ffacd0b85a97d-380611409c4mr151148f8f.12.1729876574029;
        Fri, 25 Oct 2024 10:16:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:13 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:44 +0100
Subject: [PATCH v2 13/36] drm/vc4: txp: Introduce structure to deal with
 revision differences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-13-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101617_510739_17CD6AA5 
X-CRM114-Status: GOOD (  18.56  )
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

The BCM2712 will have several TXP with small differences. Let's add a
structure tied to the compatible to deal with those differences.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.c |  4 ++--
 drivers/gpu/drm/vc4/vc4_drv.h        |  6 +++++-
 drivers/gpu/drm/vc4/vc4_txp.c        | 23 ++++++++++++++++-------
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index 6527fb1db71e..c7b91c87f1bc 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -51,7 +51,7 @@ struct vc4_mock_desc {
 
 static const struct vc4_mock_desc vc4_mock =
 	VC4_MOCK_DESC(
-		VC4_MOCK_CRTC_DESC(&vc4_txp_crtc_data,
+		VC4_MOCK_CRTC_DESC(&vc4_txp_data.base,
 				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
@@ -77,7 +77,7 @@ static const struct vc4_mock_desc vc4_mock =
 
 static const struct vc4_mock_desc vc5_mock =
 	VC4_MOCK_DESC(
-		VC4_MOCK_CRTC_DESC(&vc4_txp_crtc_data,
+		VC4_MOCK_CRTC_DESC(&vc4_txp_data.base,
 				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index a68cea921c11..1ed1fb5aa7e8 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -536,7 +536,11 @@ struct vc4_crtc_data {
 	int hvs_output;
 };
 
-extern const struct vc4_crtc_data vc4_txp_crtc_data;
+struct vc4_txp_data {
+	struct vc4_crtc_data	base;
+};
+
+extern const struct vc4_txp_data vc4_txp_data;
 
 struct vc4_pv_data {
 	struct vc4_crtc_data	base;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index ffe1f7d1b911..dcb1b3fd37de 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -159,6 +159,7 @@
 
 struct vc4_txp {
 	struct vc4_crtc	base;
+	const struct vc4_txp_data *data;
 
 	struct platform_device *pdev;
 
@@ -484,17 +485,20 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-const struct vc4_crtc_data vc4_txp_crtc_data = {
-	.name = "txp",
-	.debugfs_name = "txp_regs",
-	.hvs_available_channels = BIT(2),
-	.hvs_output = 2,
+const struct vc4_txp_data vc4_txp_data = {
+	.base = {
+		.name = "txp",
+		.debugfs_name = "txp_regs",
+		.hvs_available_channels = BIT(2),
+		.hvs_output = 2,
+	},
 };
 
 static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
+	const struct vc4_txp_data *txp_data;
 	struct vc4_encoder *vc4_encoder;
 	struct drm_encoder *encoder;
 	struct vc4_crtc *vc4_crtc;
@@ -509,6 +513,11 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (!txp)
 		return -ENOMEM;
 
+	txp_data = of_device_get_match_data(dev);
+	if (!txp_data)
+		return -ENODEV;
+
+	txp->data = txp_data;
 	txp->pdev = pdev;
 	txp->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(txp->regs))
@@ -519,7 +528,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	vc4_crtc->regset.regs = txp_regs;
 	vc4_crtc->regset.nregs = ARRAY_SIZE(txp_regs);
 
-	ret = vc4_crtc_init(drm, pdev, vc4_crtc, &vc4_txp_crtc_data,
+	ret = vc4_crtc_init(drm, pdev, vc4_crtc, &txp_data->base,
 			    &vc4_txp_crtc_funcs, &vc4_txp_crtc_helper_funcs, true);
 	if (ret)
 		return ret;
@@ -579,7 +588,7 @@ static void vc4_txp_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id vc4_txp_dt_match[] = {
-	{ .compatible = "brcm,bcm2835-txp" },
+	{ .compatible = "brcm,bcm2835-txp", .data = &vc4_txp_data },
 	{ /* sentinel */ },
 };
 

-- 
2.34.1


