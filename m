Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEFFD149D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRFd61DSpngeCNNfWF0bSZlBVGY7r+lkqUcR/WDRUy8=; b=Pr00wuDSiMPrt2My1A0D7ldK8/
	MCau2eqtDzkXriZV9BviAE1d83tI/gEZwD4njr2fo+OxOySiDu+F4+r+mBR0G0tr9xyzHaCMRE5Pn
	w2G867K+zVMnTjDxJYt5HPyY8QQTvXA0q/a/UdNTty5PyosOOe89o3r6jbOmmACYbwMqZ19eMTqaa
	IjrZ4/A6G/uq+ptxD7cbTYiZvfbbb9lSN3QqH9zz4yWVVjLPCjBRRVLumuZ01tZPHaCXfPXLCoYsX
	loFp7Dc+ONMN1lP+781yEtiiWdyZ+/jtfhN0zyC5CDunju2Qm7nfxOcp5OwvVMxTYMDhvUzqh6EG0
	VkNqnrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OSC-00000004g6f-1p80;
	Fri, 25 Oct 2024 17:50:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvJ-00000004Y1r-2fHh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yRFd61DSpngeCNNfWF0bSZlBVGY7r+lkqUcR/WDRUy8=; b=eqzfvPnGUyl9T6hZ4Th3bJjyjJ
	n+VfrOKETIQdGF++wDZ5CUJfM8zXwVZ1ZrMrW0r48i0UkkaKxwxcT4IUdpt+CnhIfZhB7njZqXhx7
	WaWP8baw1LKqNT9p65nLv2HY0aQvahPawBi0WY1LcjqMmlhoun/w8F7e5lF8CRglH17zgARrf8a3O
	y47SjaFX8/FFnnh/2y6kjdu0nZRG8415B/p0R81HRUL5I+TNsvkqEEK6a/VeptJAIJvYh8F092tx7
	n+4Ekmq7Lg/zfZLHleoD9fHLwXNrmkCvsRJJP4ISLkY6M5qz3MzCCPIHqaZI2thjfb/klDFr9MQD9
	e7DmoJLA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvF-00000008zoy-48dw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so1498848f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876584; x=1730481384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRFd61DSpngeCNNfWF0bSZlBVGY7r+lkqUcR/WDRUy8=;
        b=SeAdzYsdunkYMPlgAxj59r1xbo7qjXhvddOGiy113yP3jlREum7ujjcYUXx9G9M+98
         2/a7b22L6g1nA1hDGUS045vcLNWpNRlojeqXEcR6DygdwRZ0bmI8jPLUkG2FElCq6ona
         /7MEhZicAyeyD18uLpC4GBqJHtw6kGA44UjWsayOVsG4tDGBb25nvmFRo7JU+s9BTJiP
         +1O+GpLBCXzT2nHv3qsdTNImHr6i2qBqGVjj6i6/m1JslX0upUTG+W2uvuXIWYZZZOvs
         q8XBzfwnqbMwizXFuedQ/3aDEKvsPYMsP66KeO/JW+I1hhkYCImNNXOcYDNozluyBMXJ
         DivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876584; x=1730481384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRFd61DSpngeCNNfWF0bSZlBVGY7r+lkqUcR/WDRUy8=;
        b=IdRDpL0cVoWxFCI42sp6JF2dh6BOiFwPKhFyO3SUnMeuMo+2EpXPWec9d35SriSbTT
         59TaIAGaCBz+l5J+Ok7BBpVrWCMt1SIT8SETRpQro+J+Cf0BZgz4ZAnA+2T5G+jxJ7FO
         MfDzfq/H68Q3uio0cfE6fp1gMHIUrPds7Jtrbkn9diRwbK+Wz7EH9TLYdKdNpAiKNsE8
         FC4oSBvf0unGKMaAFEvxARuILgkqxY9kbiaKIEC9TLqD6C4lzNFNBX8FhAV5yktKnfOk
         nwmBJ3t7TLDOqvUiR8JHU6Y+yW/VKc5f5vC3BwZDMBBQKza+zWbgsnAxaskLTG7RhCrG
         OSoA==
X-Forwarded-Encrypted: i=1; AJvYcCUF8qiKCMh2zKfupg8dYUstOLxWy7vx/tVhVWA10h7fUzfEP6To3Ofgy6hmXdoxJTXMLxNAD8HkQMocLvgafofZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwnA2bPK0woqNTDHgsoE1pyayfAHjjFUU6u8qP/kEC1gBolkdyF
	G2xGijVm1vHAJ9RvzYuSLUxNMTfunUlArew+1+tsZ5iyeutiyG8mqC3NL8hR+mE=
X-Google-Smtp-Source: AGHT+IE5ggZ/+MnjT/M2pSrBXb7CHgqVlwXWTb2QVua+jciV8EenwyStxQYCUAAVVRcTsB77bKhFsQ==
X-Received: by 2002:a5d:6946:0:b0:37c:d2f0:7331 with SMTP id ffacd0b85a97d-38060fff529mr184356f8f.0.1729876584546;
        Fri, 25 Oct 2024 10:16:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:24 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:55 +0100
Subject: [PATCH v2 24/36] drm/vc4: plane: Add support for 2712 D-step.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-24-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_181626_439908_371FBBEA 
X-CRM114-Status: GOOD (  18.15  )
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

There are a few minor changes in the display list generation
for the D-step of the chip, so add them.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 72 ++++++++++++++++++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_regs.h  |  9 ++++--
 2 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 5749287f6e3c..205aea3ed419 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1134,25 +1134,53 @@ static u32 vc4_hvs4_get_alpha_blend_mode(struct drm_plane_state *state)
 
 static u32 vc4_hvs5_get_alpha_blend_mode(struct drm_plane_state *state)
 {
-	if (!state->fb->format->has_alpha)
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
-				     SCALER5_CTL2_ALPHA_MODE);
+	struct drm_device *dev = state->state->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	switch (state->pixel_blend_mode) {
-	case DRM_MODE_BLEND_PIXEL_NONE:
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
-				     SCALER5_CTL2_ALPHA_MODE);
+	switch (vc4->gen) {
 	default:
-	case DRM_MODE_BLEND_PREMULTI:
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
-				     SCALER5_CTL2_ALPHA_MODE) |
-			SCALER5_CTL2_ALPHA_PREMULT;
-	case DRM_MODE_BLEND_COVERAGE:
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
-				     SCALER5_CTL2_ALPHA_MODE);
+	case VC4_GEN_5:
+	case VC4_GEN_6_C:
+		if (!state->fb->format->has_alpha)
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
+					     SCALER5_CTL2_ALPHA_MODE);
+
+		switch (state->pixel_blend_mode) {
+		case DRM_MODE_BLEND_PIXEL_NONE:
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
+					     SCALER5_CTL2_ALPHA_MODE);
+		default:
+		case DRM_MODE_BLEND_PREMULTI:
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
+					     SCALER5_CTL2_ALPHA_MODE) |
+				SCALER5_CTL2_ALPHA_PREMULT;
+		case DRM_MODE_BLEND_COVERAGE:
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
+					     SCALER5_CTL2_ALPHA_MODE);
+		}
+	case VC4_GEN_6_D:
+		/* 2712-D configures fixed alpha mode in CTL0 */
+		return state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ?
+			SCALER5_CTL2_ALPHA_PREMULT : 0;
 	}
 }
 
+static u32 vc4_hvs6_get_alpha_mask_mode(struct drm_plane_state *state)
+{
+	struct drm_device *dev = state->state->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_6_C && vc4->gen != VC4_GEN_6_D);
+
+	if (vc4->gen == VC4_GEN_6_D &&
+	    (!state->fb->format->has_alpha ||
+	     state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE))
+		return VC4_SET_FIELD(SCALER6D_CTL0_ALPHA_MASK_FIXED,
+				     SCALER6_CTL0_ALPHA_MASK);
+
+	return VC4_SET_FIELD(SCALER6_CTL0_ALPHA_MASK_NONE, SCALER6_CTL0_ALPHA_MASK);
+}
+
 /* Writes out a full display list for an active plane to the plane's
  * private dlist state.
  */
@@ -1645,14 +1673,13 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 static u32 vc6_plane_get_csc_mode(struct vc4_plane_state *vc4_state)
 {
 	struct drm_plane_state *state = &vc4_state->base;
+	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
 	u32 ret = 0;
 
 	if (vc4_state->is_yuv) {
 		enum drm_color_encoding color_encoding = state->color_encoding;
 		enum drm_color_range color_range = state->color_range;
 
-		ret |= SCALER6_CTL2_CSC_ENABLE;
-
 		/* CSC pre-loaded with:
 		 * 0 = BT601 limited range
 		 * 1 = BT709 limited range
@@ -1666,8 +1693,15 @@ static u32 vc6_plane_get_csc_mode(struct vc4_plane_state *vc4_state)
 		if (color_range > DRM_COLOR_YCBCR_FULL_RANGE)
 			color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
 
-		ret |= VC4_SET_FIELD(color_encoding + (color_range * 3),
-				     SCALER6_CTL2_BRCM_CFC_CONTROL);
+		if (vc4->gen == VC4_GEN_6_C) {
+			ret |= SCALER6C_CTL2_CSC_ENABLE;
+			ret |= VC4_SET_FIELD(color_encoding + (color_range * 3),
+					     SCALER6C_CTL2_BRCM_CFC_CONTROL);
+		} else {
+			ret |= SCALER6D_CTL2_CSC_ENABLE;
+			ret |= VC4_SET_FIELD(color_encoding + (color_range * 3),
+					     SCALER6D_CTL2_BRCM_CFC_CONTROL);
+		}
 	}
 
 	return ret;
@@ -1880,7 +1914,7 @@ static int vc6_plane_mode_set(struct drm_plane *plane,
 	vc4_dlist_write(vc4_state,
 			SCALER6_CTL0_VALID |
 			VC4_SET_FIELD(tiling, SCALER6_CTL0_ADDR_MODE) |
-			VC4_SET_FIELD(0, SCALER6_CTL0_ALPHA_MASK) |
+			vc4_hvs6_get_alpha_mask_mode(state) |
 			(vc4_state->is_unity ? SCALER6_CTL0_UNITY : 0) |
 			VC4_SET_FIELD(format->pixel_order_hvs5, SCALER6_CTL0_ORDERRGBA) |
 			VC4_SET_FIELD(scl1, SCALER6_CTL0_SCL1_MODE) |
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 0efe340f99d4..0046bdb7ca32 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -1194,6 +1194,9 @@ enum hvs_pixel_format {
 #define SCALER5_CTL2_ALPHA_MASK			VC4_MASK(15, 4)
 #define SCALER5_CTL2_ALPHA_SHIFT		4
 
+#define SCALER6D_CTL2_CSC_ENABLE		BIT(19)
+#define SCALER6D_CTL2_BRCM_CFC_CONTROL_MASK	VC4_MASK(22, 20)
+
 #define SCALER_POS1_SCL_HEIGHT_MASK		VC4_MASK(27, 16)
 #define SCALER_POS1_SCL_HEIGHT_SHIFT		16
 
@@ -1347,6 +1350,8 @@ enum hvs_pixel_format {
 #define SCALER6_CTL0_ADDR_MODE_UIF		4
 
 #define SCALER6_CTL0_ALPHA_MASK_MASK		VC4_MASK(19, 18)
+#define SCALER6_CTL0_ALPHA_MASK_NONE		0
+#define SCALER6D_CTL0_ALPHA_MASK_FIXED		3
 #define SCALER6_CTL0_UNITY			BIT(15)
 #define SCALER6_CTL0_ORDERRGBA_MASK		VC4_MASK(14, 13)
 #define SCALER6_CTL0_SCL1_MODE_MASK		VC4_MASK(10, 8)
@@ -1361,8 +1366,8 @@ enum hvs_pixel_format {
 #define SCALER6_CTL2_ALPHA_PREMULT		BIT(29)
 #define SCALER6_CTL2_ALPHA_MIX			BIT(28)
 #define SCALER6_CTL2_BFG			BIT(26)
-#define SCALER6_CTL2_CSC_ENABLE			BIT(25)
-#define SCALER6_CTL2_BRCM_CFC_CONTROL_MASK	VC4_MASK(18, 16)
+#define SCALER6C_CTL2_CSC_ENABLE		BIT(25)
+#define SCALER6C_CTL2_BRCM_CFC_CONTROL_MASK	VC4_MASK(18, 16)
 #define SCALER6_CTL2_ALPHA_MASK			VC4_MASK(15, 4)
 
 #define SCALER6_POS1_SCL_LINES_MASK		VC4_MASK(28, 16)

-- 
2.34.1


