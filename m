Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD42D149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpgFdk3JtzocDW3WFzPDdBLFBiWF0X+yqUm+UTtblgc=; b=XLAnX4iSVmNXyzNKapaytCelcv
	ryVtDdJLj92+famrIklqFz2tP/9AJAyTxnBXlQpyFtlTFCd4TAz6l2E9qBMwx1VX9Bl4fGlNHf4/e
	Kw1eVKt7bKvTNSvOn7XpztYDikHEITrxaKwujvrHq8IKImQ0hfr3fbI6tefXBKw4ZzyB3wVNaqG9J
	wHmLppSZPsr5P629lBccT/UVlTYLY3df/KRGYY7oLrDcO023/xMkS7YWyAyohqC9dbT62uJgU0/NE
	oVL73d+FPd7d/XeKZrTtThsDmuP/Cktj49/b9XfdOg0C67vjYpcyHyojT3aoY7Y2rF8czauvEa6Dg
	VReWnOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OXW-00000004hBi-1lEA;
	Fri, 25 Oct 2024 17:55:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvO-00000004Y4m-0Pq0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FpgFdk3JtzocDW3WFzPDdBLFBiWF0X+yqUm+UTtblgc=; b=ejvW7ZdMdiX6mD7fhcGhzs/EX+
	L1Ufw4cIxoI5Yhj0l9Z5uTw6G8kkFChBW7o+xt9d+nfdlpVOpP0rTt2tiCBgrRQeC8Ck12CL9M1qZ
	PRSdi683h1KjAAcaw3BBUBSvC3Pe4guzTdU00wVEPk2F46hRatahiieSeipSZqk5efOMLHrQXYhYY
	yhSTRqB5D6MfxFsNp+B9bCbgVsbWB/KtflCfZIsXaZHmR0V0z/HbsxQnoBVCiadQ12iHQXlvE2QTY
	qCEcIRYJODJ5Yi/LF3mtzX6uPKKi2D4o4jK/eZw8jX54gLNyV2TS7D+GpdizunEdJUg3TfTtjRIkW
	RafVVVgQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvH-00000008zqO-3BIu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d8901cb98so2244156f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876586; x=1730481386; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpgFdk3JtzocDW3WFzPDdBLFBiWF0X+yqUm+UTtblgc=;
        b=eGcyosXkfHVKSsVctraXDkPCK0TwTTy8argsKKsr5QlFW5+akfn4gK4BX/+96T+n//
         UtuKtT8l7oDu7+4wK2OGzDpwTqa7V39YXlzIYDgJnNgXO2Tx2EaWgEUntyPhZxTcq66S
         2PoafHcth2w7hh5mzlTxQDWTmzxt7XvNrSJi05QoLYqyJXMM/0eVgSIcpa4RtUv5MH14
         gLmu4As7MyiNnkHXZau200lKAJCXjerO8ShAVcqsqq1MZk/yPm29dMRE+dKUpYFhpWHs
         +Tox4JaUP1A6HpfG/I9BX2nhoQ+4iDfTkXb3FIz8SrjswqyTGxYcrS4yMCg3s7PD4Hhp
         rk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876586; x=1730481386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpgFdk3JtzocDW3WFzPDdBLFBiWF0X+yqUm+UTtblgc=;
        b=MzK8EIeik3DU9uym7/RZ1MjM9L2Gx7Ptz0lfl0HWAz0hYcYDoGd7JAE3BeCSiaH9Yr
         FjLwQ72NJn6ExPxSHtW5cuY1ZrFXyNmR0/fSm0A+7knkCPQYEPV2/fha3XPMEsGtC71f
         v/Zsyx8f3RVdBtjfbxIzuyOU2bjVJ+B+SySzu80449kPeZ4LjcAiwFPojUL3kXpRmpDn
         4gyXSZ47R12bkPSqXIlQRoa7QF3ycm3N6Cypmq9n6RTUmxPutc9xWnRTMQUzoQaKVfl+
         JMxeRZRg1wDyjfk6Jetz4A3VZUWIymUNAP1ZrGhGHH0Ei71uJSVK9k+fHy5lk6t3hNIA
         QKTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJbfDgQOJiymy7rFte50F13wRoxNe0ZT2LglBdwE7hH4AH7j4zCblM9Lmm3ZK9XzqvRXfRZKm8j4HHc68Qpmdu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq+dYfet+TQAvVLXENU0jZtRaZhSn0BDzs0CKo5RniDqyZW2fH
	84MNQQdcRP1PAKGWaVoR3XhQXT63rk9Dnn8t79t9YTXlRvimNrKS238mmVOVefU=
X-Google-Smtp-Source: AGHT+IEjGuncFTNT/SZ4zceoos60e4tV8diFXOXGxrnPO4HgWUpl+fjYGjtIIh1LWTqEDG68tqrqAQ==
X-Received: by 2002:a5d:40c6:0:b0:37d:2d6f:3284 with SMTP id ffacd0b85a97d-38060eb2031mr225091f8f.9.1729876586551;
        Fri, 25 Oct 2024 10:16:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:26 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:57 +0100
Subject: [PATCH v2 26/36] drm/vc4: Add additional warn_on for incorrect
 revisions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-26-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_181628_552653_D29ADD7D 
X-CRM114-Status: GOOD (  19.42  )
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

Some code path in vc4 are conditional to a generation and cannot be
executed on others. Let's put a WARN_ON if that ever happens.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c   | 30 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_kms.c   |  6 ++++++
 drivers/gpu/drm/vc4/vc4_plane.c | 17 +++++++++++++++++
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 11acc56ab92d..2493ac17d78f 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -419,12 +419,15 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
 static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 			     struct vc4_crtc *vc4_crtc)
 {
-	struct drm_device *drm = &hvs->vc4->base;
+	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
 	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	int idx;
 	u32 i;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -474,6 +477,8 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 	u8 field = 0;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	if (!drm_dev_enter(drm, &idx))
 		return 0;
 
@@ -530,6 +535,8 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 	u32 reg;
 	int ret;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	switch (vc4->gen) {
 	case VC4_GEN_4:
 		return output;
@@ -621,6 +628,8 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	u32 dispctrl;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return -ENODEV;
 
@@ -682,6 +691,8 @@ static int vc6_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	u32 disp_ctrl1;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen < VC4_GEN_6_C);
+
 	if (!drm_dev_enter(drm, &idx))
 		return -ENODEV;
 
@@ -707,9 +718,12 @@ static int vc6_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 
 static void __vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 {
-	struct drm_device *drm = &hvs->vc4->base;
+	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -740,6 +754,8 @@ static void __vc6_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 	struct drm_device *drm = &vc4->base;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen < VC4_GEN_6_C);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -927,6 +943,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	bool found = false;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	if (!drm_dev_enter(dev, &idx)) {
 		vc4_crtc_send_vblank(crtc);
 		return;
@@ -1011,6 +1029,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	if (crtc->state->color_mgmt_changed) {
 		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(channel));
 
+		WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 		if (crtc->state->gamma_lut) {
 			vc4_hvs_update_gamma_lut(hvs, vc4_crtc);
 			dispbkgndx |= SCALER_DISPBKGND_GAMMA;
@@ -1040,6 +1060,8 @@ void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel)
 	u32 dispctrl;
 	int idx;
 
+	WARN_ON(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -1060,6 +1082,8 @@ void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel)
 	u32 dispctrl;
 	int idx;
 
+	WARN_ON(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -1094,6 +1118,8 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 	u32 status;
 	u32 dspeislur;
 
+	WARN_ON(vc4->gen > VC4_GEN_5);
+
 	/*
 	 * NOTE: We don't need to protect the register access using
 	 * drm_dev_enter() there because the interrupt handler lifetime
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index ce65e152876e..f5b167417428 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -138,6 +138,8 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
 	struct vc4_ctm_state *ctm_state = to_vc4_ctm_state(vc4->ctm_manager.state);
 	struct drm_color_ctm *ctm = ctm_state->ctm;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (ctm_state->fifo) {
 		HVS_WRITE(SCALER_OLEDCOEF2,
 			  VC4_SET_FIELD(vc4_ctm_s31_32_to_s0_9(ctm->matrix[0]),
@@ -213,6 +215,8 @@ static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	struct drm_crtc *crtc;
 	unsigned int i;
 
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_4);
+
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
@@ -256,6 +260,8 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	unsigned int i;
 	u32 reg;
 
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_5);
+
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 205aea3ed419..c084967d3527 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -566,8 +566,11 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 
 static void vc4_write_tpz(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(vc4_state->base.plane->dev);
 	u32 scale, recip;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	scale = src / dst;
 
 	/* The specs note that while the reciprocal would be defined
@@ -593,10 +596,13 @@ static void vc4_write_tpz(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst,
 			  u32 xy, int channel)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(vc4_state->base.plane->dev);
 	u32 scale = src / dst;
 	s32 offset, offset2;
 	s32 phase;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	/*
 	 * Start the phase at 1/2 pixel from the 1st pixel at src_x.
 	 * 1/4 pixel for YUV.
@@ -825,8 +831,11 @@ static size_t vc6_upm_size(const struct drm_plane_state *state,
 static void vc4_write_scaling_parameters(struct drm_plane_state *state,
 					 int channel)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	/* Ch0 H-PPF Word 0: Scaling Parameters */
 	if (vc4_state->x_scaling[channel] == VC4_SCALING_PPF) {
 		vc4_write_ppf(vc4_state, vc4_state->src_w[channel],
@@ -1113,6 +1122,11 @@ static const u32 colorspace_coeffs[2][DRM_COLOR_ENCODING_MAX][3] = {
 
 static u32 vc4_hvs4_get_alpha_blend_mode(struct drm_plane_state *state)
 {
+	struct drm_device *dev = state->state->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_4);
+
 	if (!state->fb->format->has_alpha)
 		return VC4_SET_FIELD(SCALER_POS2_ALPHA_MODE_FIXED,
 				     SCALER_POS2_ALPHA_MODE);
@@ -1137,6 +1151,9 @@ static u32 vc4_hvs5_get_alpha_blend_mode(struct drm_plane_state *state)
 	struct drm_device *dev = state->state->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_5 && vc4->gen != VC4_GEN_6_C &&
+		     vc4->gen != VC4_GEN_6_D);
+
 	switch (vc4->gen) {
 	default:
 	case VC4_GEN_5:

-- 
2.34.1


