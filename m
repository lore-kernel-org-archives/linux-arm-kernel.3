Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60472C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 23:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppZkh3AVCrQx9O4YNbO0XMQav0agPe5LBnt6LSWUrys=; b=iIgKubM5legiX8tER8BIuPLdaA
	Uqx3qvY0C6NPd8mG+7JX7d0PY0/V7rFcFgJ2xTrv6xvh96gxdVZvqY9bjurG9pstZi1sGaavYGHDF
	Tv08vQADiR3svUKoQgQtQDlSqW5IpV75iE9pO/bgq4P2c04kNqWQNIpgPK+FXNktm2U5JOJFNMfB2
	PSdKpaJX6uQwC8uJr6ptjts2eU/QGghNSq4H+9KXtg3WxmZVfCpE98cM8iW9pl+LfEJxQPH+59Une
	EER2GwK/riRRENzGshtlNq5hqltnHV/ujZnePDwYYWoHxA6II7lRAcQSuSgDeikNzazsLKhiNyn97
	dgI51o5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Y9H-0000000DY0B-0Ozp;
	Tue, 01 Sep 2026 23:44:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Y9D-0000000DXxh-0RJF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 23:44:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d715f4a587so5782205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 16:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788306250; x=1788911050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppZkh3AVCrQx9O4YNbO0XMQav0agPe5LBnt6LSWUrys=;
        b=jRIn0H4m5s3k/pCZCO5NRNvTFN0SYEwBXndS/ITv3zOEaF2t9h91VdNxC7jv5ms2+M
         u5hHaUWOD9lD1uNJoJ1kZElUQUsmUEsH70NdKpQ5MzXt8Uz6q0izc2kH7dknGrhXNeKH
         xRqxUDozMgI46Ro8OEiXeFEHD10RMU2uC7TP4rfnsLCr30gbcspHB8bIjy256Mcsji/2
         XWRggEZ3SnLdBAH8TFjEsIIw8Zh6cBDeliri0pT5j5/UBiCI30S4oWVRBhFBPWZ6K0l+
         a3ALMOCD6XHVQzwt6V38YwL5IYoAdvbEV2dzymTXYbebY6jeG8DwRUnrJx2tCEm8g8JH
         /bTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788306250; x=1788911050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppZkh3AVCrQx9O4YNbO0XMQav0agPe5LBnt6LSWUrys=;
        b=eTqMIj175aQYagQ9b+BN6fn3Cw+QHHAEdreIqAWF+9k2Iu8Zs7bDHYUDeTLaxidoyX
         XEUuTBQSq8hR2M7W/Cg5i1MqQKfXvU6Js+V6SiiYNt2AQZLBI20WOvOUL0vMLaA0cNiZ
         c9vFg9hZ6I8PLJWzUBk6qcn8dNYq1706VdskYKmlQgoUKRg63hDaBuD7Q5Z/Hypu2Ly7
         nJ7etGsrA7CoCRfdZP6oU1VRORv3Qvmo9mxryu2wvhJ+IfjomvJdB/1NAt4dBMarzsBx
         CjBuV2rCd2dGvyxS+OoRn+93ng5u5GhZRs/FAunk8Wo0Ff6aTs/z3eDGcS7uLnaRFwp2
         rOcg==
X-Forwarded-Encrypted: i=1; AKwUvBz8AehRN4w9QgDHWmJbTGHxINJgz451XQTFbq1+pMn1UhkL2PaTo8u/NlB/VXr0VV2NoEyOLDejRXBHg1mYWL2W@lists.infradead.org
X-Gm-Message-State: AFuF++ltQVcYqFNt/tuK7TQ4BFSY/FUQhOomYWFI6A22pOjh5NRWw8++
	0fiXSVma+3qXbEDpCd220D0uLUbo/HsdEyblfkba8v62yToX+8SrHAh8
X-Gm-Gg: AYBFou2IHHKvF3AxGLc1q8A6kQSnY7rCTmejN6iApXlFgEoTCW2K868vrX+JpymfY0i
	z5UgLUik45AlEANE6WY8FkN1kJ0X+3IDo7SLV8E6VM4g2q+Dq/flOn4MRLoeRS2S7thom+3Z8b7
	VyLCDpjUi7EsU9mNMeHoLn9xRGJbwPh/7Y9KD/MMAX9PH/3XZYPjlD77b/NBWHaf7C2gGRw8RkY
	wHBJWS1TFXhmSLt8/ZEQ04yCZewVXvKbRsY6HXVfAkOQ1KHxlvY4T43HgQg7HrhIAImEUQa0igY
	ZmpyHu7G/7T/dzLwzz5Zx9lBQmLC6mvSP+6FdWbskWXOoJ6+vhSEpoYRMJLOZjCAram85vqWYzB
	oiQno3+PW29amMKvsyvYV00Eg99J7w7waiz61HAYgbI/36/b+J6Yt1x8wiMnk6ZaUAOnQYkG/bx
	C90RPFUJcRZ03OMIFQGH1FL0IcfefXxAXb70/5t5NAwwFbQCvRHbb1a4OnNOLlmne3AQFRFhWkm
	YgPe+Zglesb5sc/DMMrL/KeJA==
X-Received: by 2002:a17:90b:5743:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-39aedfdb0b1mr956150a91.7.1788306250071;
        Tue, 01 Sep 2026 16:44:10 -0700 (PDT)
Received: from anarsoul-xps15.lan (d50-92-231-36.bchsia.telus.net. [50.92.231.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990baaeec3sm8299903a91.0.2026.09.01.16.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:44:09 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 2/2] drm/rockchip: vop: don't round the pixel clock when the encoder owns the PLL
Date: Tue,  1 Sep 2026 16:42:31 -0700
Message-ID: <20260901234351.190506-2-anarsoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901234351.190506-1-anarsoul@gmail.com>
References: <20260901234351.190506-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_164411_172934_2B64306D 
X-CRM114-Status: GOOD (  28.58  )
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

On RK3399 the HDMI reference clock is VPLL, a dedicated PLL that is a
parent of the VOP dclk. dw_hdmi_rockchip_mode_valid() accepts a mode
only if VPLL can produce its pixel clock, and encoder mode_set() then
programs VPLL to that rate. However vop_crtc_mode_fixup() ran first,
in the check phase, and rounded adjusted_mode->clock through
clk_round_rate() on the dclk. At that point VPLL still sits at its
previous rate, so the dclk composite picks whichever of VPLL/CPLL/GPLL
gets closest at its *current* rate and stores that inexact value.

For 1366x768 (85.5 MHz) this yields GPLL/7 = 84.857 MHz. mode_set()
then requests 84.857 MHz from VPLL, which the PLL rate table snaps
down to 74.25 MHz, and the VOP ends up on GPLL/7. The panel receives a
timing 0.75% slow, which some monitors misdetect (e.g. as 1195x768)
and display distorted. Only modes whose clock happens to be an exact
GPLL or CPLL fraction (74.25, 148.5, 297 MHz, ...) were unaffected.

Let the encoder tell the CRTC, via a new rockchip_crtc_state flag set
in its atomic_check, that it will program a dedicated dclk parent to
exactly the requested pixel clock. Move the rounding from mode_fixup
to atomic_check, which runs after the encoder's atomic_check as
recommended by the DRM documentation, and skip it when the flag is
set. With VPLL then set to the exact rate before the VOP enables,
clk_set_rate() on the dclk finds an exact match on VPLL.

The flag is only meaningful within the check that sets it and is
cleared when the state is duplicated, so it cannot leak into a later
modeset on the same CRTC with a different encoder. Behaviour for
encoders without a dedicated PLL is unchanged.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  8 ++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h |  9 ++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 25 +++++++++++++++------
 3 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index b6e154c35e7c..ece44c6ec95c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -300,8 +300,8 @@ dw_hdmi_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 				      struct drm_crtc_state *crtc_state,
 				      struct drm_connector_state *conn_state)
 {
-	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
 	struct rockchip_hdmi *hdmi = to_rockchip_hdmi(encoder);
+	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
 	union phy_configure_opts opts = {};
 	u32 bus_format;
 
@@ -327,6 +327,12 @@ dw_hdmi_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 
 	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
 	s->bus_format = bus_format;
+	/*
+	 * The reference clock (e.g. VPLL on RK3399) is a parent of the VOP
+	 * dclk, and mode_set() programs it to the pixel clock, which
+	 * mode_valid() already guaranteed it can produce.
+	 */
+	s->dclk_exact = !!hdmi->ref_clk;
 
 	if (!hdmi->phy || !conn_state->hdmi.tmds_char_rate)
 		return 0;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index 4705dc6b8bd7..8cb828ae9af6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -57,6 +57,15 @@ struct rockchip_crtc_state {
 	u32 bus_format;
 	u32 bus_flags;
 	int color_space;
+	/*
+	 * Set by an encoder's atomic_check when it owns a dedicated PLL that
+	 * feeds the CRTC's dclk and will program it to exactly
+	 * adjusted_mode->clock at mode_set time. The CRTC must then not
+	 * round the pixel clock against the current clock tree, which does
+	 * not reflect that PLL's future rate. Only valid within one check,
+	 * it is cleared when the state is duplicated.
+	 */
+	bool dclk_exact;
 };
 #define to_rockchip_crtc_state(s) \
 		container_of(s, struct rockchip_crtc_state, base)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 0090d8ff0c79..73a92ccbcb94 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1207,11 +1207,9 @@ static enum drm_mode_status vop_crtc_mode_valid(struct drm_crtc *crtc,
 	return MODE_OK;
 }
 
-static bool vop_crtc_mode_fixup(struct drm_crtc *crtc,
-				const struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
+static void vop_crtc_adjust_clock(struct vop *vop,
+				  struct drm_display_mode *adjusted_mode)
 {
-	struct vop *vop = to_vop(crtc);
 	unsigned long rate;
 
 	/*
@@ -1245,8 +1243,6 @@ static bool vop_crtc_mode_fixup(struct drm_crtc *crtc,
 		rate = clk_round_rate(vop->dclk,
 				      adjusted_mode->clock * 1000 + 999);
 	adjusted_mode->clock = DIV_ROUND_UP(rate, 1000);
-
-	return true;
 }
 
 static bool vop_dsp_lut_is_enabled(struct vop *vop)
@@ -1558,6 +1554,19 @@ static int vop_crtc_atomic_check(struct drm_crtc *crtc,
 	s = to_rockchip_crtc_state(crtc_state);
 	s->enable_afbc = afbc_planes > 0;
 
+	/*
+	 * Round the pixel clock to what the dclk can really produce, unless
+	 * the encoder will program a dedicated dclk parent PLL to exactly
+	 * this rate at mode_set time. In that case the clock tree seen here
+	 * (with that PLL still at its old rate) would pick a worse, inexact
+	 * source and bake that rate into adjusted_mode, defeating the PLL.
+	 *
+	 * Same condition the atomic helpers use for the mode_fixup callback.
+	 */
+	if ((crtc_state->mode_changed || crtc_state->connectors_changed) &&
+	    !s->dclk_exact)
+		vop_crtc_adjust_clock(vop, &crtc_state->adjusted_mode);
+
 	return 0;
 }
 
@@ -1623,7 +1632,6 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
 
 static const struct drm_crtc_helper_funcs vop_crtc_helper_funcs = {
 	.mode_valid = vop_crtc_mode_valid,
-	.mode_fixup = vop_crtc_mode_fixup,
 	.atomic_check = vop_crtc_atomic_check,
 	.atomic_begin = vop_crtc_atomic_begin,
 	.atomic_flush = vop_crtc_atomic_flush,
@@ -1643,6 +1651,9 @@ static struct drm_crtc_state *vop_crtc_duplicate_state(struct drm_crtc *crtc)
 	if (!rockchip_state)
 		return NULL;
 
+	/* Only valid within the check phase that sets it. */
+	rockchip_state->dclk_exact = false;
+
 	__drm_atomic_helper_crtc_duplicate_state(crtc, &rockchip_state->base);
 	return &rockchip_state->base;
 }
-- 
2.55.0


