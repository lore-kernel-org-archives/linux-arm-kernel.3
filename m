Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A72EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 18:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNN4RBGoTZlMx5uVmdpRTe10uEZ7WZE2J9+a1pOThlU=; b=dmbuxfQlDvZqi26lgivx0Es2ax
	J4LOE9jHO8Bx9ZYEtBby8Lx3DviLgCOkND94I1/d/r/N4WnJUYwfFi/kYp0uZMpMtnINo23V0O4D9
	aCEJRbmyFxN14rAMw1nu8hL9X03W1vfokk3ci1KixZYvb1euOCFwz/oU7DUY7O93ioSXtEMrnH8UG
	QyiE96iKguwC4hNqGiIlCWEVNSJ5qlE9bvFqMB2Zb53o9/HpirHN/1kqWi349fGefbrIF8C/E7/tk
	ztt0Zn0m503O7cLxD9FVx8sqnA4fYChmD1C654poezXQvafc/6sbmFryJzn+606NuiiMYYieMUMnK
	y6amEmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjn3-00000002OfT-39HN;
	Sun, 16 Feb 2025 18:54:53 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjXt-00000002MAG-2Xdi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:39:14 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 67DFE114009B;
	Sun, 16 Feb 2025 13:39:12 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 16 Feb 2025 13:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731152; x=
	1739817552; bh=pNN4RBGoTZlMx5uVmdpRTe10uEZ7WZE2J9+a1pOThlU=; b=S
	uba2//HkPip1ot1UjCBOmAo8E1BP2DQOSGu3486t0V1Nx/PxkImpac0yLtfYcT9o
	h38j0hXPHAXWn9NGNYbFYEFkhMTQEIucwyLStrslP3L+NCBjxBzv8waQG4uL0fw7
	g1lPiH/3CDP8qRU0uzAoeIf6Oj/Jcyuk0LZXzCYcd7Nrg6S544Cxy2ExGesFzWA5
	l5eHwfnpEPu1izG0NvXooozwb7BhYViJWE6KSDxj19b14CuiyxcGB7Yms6kmf9OH
	F1sIRNuq9j90aRyPgxQdgJhlbWSjnCLk481FKaPsJ/smDJ2veJMlCbTLGx52MtUy
	+Z4ouP+uP6UD2xQI07YSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731152; x=1739817552; bh=p
	NN4RBGoTZlMx5uVmdpRTe10uEZ7WZE2J9+a1pOThlU=; b=IhL7evoNBQsIBAYS6
	qvciG05Wm5GHieZMZNFmrIb8qqXw19relm0cuq9YlusvSLoqmo+D73BtNfkiDy7/
	093yL/2Z0MA+pI1d9t69ZiEx3XWsP/sVNRceST6/p7LIGoHFNj7VeRiLBD3qgYWU
	LEPBsljPrbhXYINwAzmVUtAzY3zzGYjrWhGQe762adcbGjya9tSwzuOV3W5R+eNe
	TyuCBLTOhr3+x065/OhduSgv3uueLQqdbpKs2fdOXXbxgDGv+LLzIIRVHN9LC08Y
	riivUIrADx0uqrrrbcaHnk83+0kHR+vMzkfoQZ0G9CE0MOr25myOgBvF4pAJfdto
	OsGsg==
X-ME-Sender: <xms:zzCyZ6TAOErJ_3YeipOvOr0lIdkzO8_n1WExMT5Ql8E7jncx8IE7gg>
    <xme:zzCyZ_x5Y64mueZXL8Vss3TJUm8heTnZbRBkkqK9vlerrRNeuVaTMIOT-27uQB36b
    1isdoqPOqmoaH6yCw>
X-ME-Received: <xmr:zzCyZ32wo5PwPq19a8cmxFRhPcoEGWZkIwVeYPhXiIeRgNq8TB9FfBWAbB0oknGdhG-uwnQSb8Ay4DNVrr4QqpFHh7k2gw9SKOcrh2ET7jEO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zzCyZ2DfYUuYrK4dM1r4Z-U5LplHC-v9mlClKfTBudKbItK0F3rizw>
    <xmx:zzCyZzggIHDjqHBfK2CWBf-uP3ouDyYoOYuQFgggrGSb3axWERsl1w>
    <xmx:zzCyZyqkJl8zYFppI1MCIyzXOuR0D17J_jHDAcQyDh3G7OyrUgVnsw>
    <xmx:zzCyZ2gzR3DtT-qddS1han0sKB5EJETGMbQuMmltGmf_SwUTFwn4og>
    <xmx:0DCyZySV5XwCvekgJ24ymZUcrozY1bHKLY5beF3oNRfqHo75FhTk6ZV0>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:39:05 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v7 12/27] drm: sun4i: de3: add YUV support to the TCON
Date: Mon, 17 Feb 2025 07:36:12 +1300
Message-ID: <20250216183710.8443-13-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_103913_715602_63CFF3A9 
X-CRM114-Status: GOOD (  13.23  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Account for U/V channel subsampling by reducing the dot clock and
resolution with a divider in the DE3 timing controller if a YUV format
is selected.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v5..v6:
- Update to obtain color format from mixer if required.
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291da..4cd3a07daf6e4 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -37,6 +37,7 @@
 #include "sun4i_tcon.h"
 #include "sun6i_mipi_dsi.h"
 #include "sun4i_tcon_dclk.h"
+#include "sun8i_mixer.h"
 #include "sun8i_tcon_top.h"
 #include "sunxi_engine.h"
 
@@ -598,14 +599,27 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 				 const struct drm_display_mode *mode)
 {
-	unsigned int bp, hsync, vsync, vtotal;
+	unsigned int bp, hsync, vsync, vtotal, div;
+	struct sun4i_crtc *scrtc = tcon->crtc;
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(scrtc->engine);
+
 	u8 clk_delay;
 	u32 val;
 
 	WARN_ON(!tcon->quirks->has_channel_1);
 
+	switch (mixer->color_model.format) {
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		div = 2;
+		break;
+	default:
+		div = 1;
+		break;
+	}
+
 	/* Configure the dot clock */
-	clk_set_rate(tcon->sclk1, mode->crtc_clock * 1000);
+	clk_set_rate(tcon->sclk1, mode->crtc_clock * 1000 / div);
 
 	/* Adjust clock delay */
 	clk_delay = sun4i_tcon_get_clk_delay(mode, 1);
@@ -624,17 +638,17 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 
 	/* Set the input resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC0_REG,
-		     SUN4I_TCON1_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC0_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set the upscaling resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC1_REG,
-		     SUN4I_TCON1_BASIC1_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC1_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC1_Y(mode->crtc_vdisplay));
 
 	/* Set the output resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC2_REG,
-		     SUN4I_TCON1_BASIC2_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC2_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC2_Y(mode->crtc_vdisplay));
 
 	/* Set horizontal display timings */
@@ -642,8 +656,8 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 	DRM_DEBUG_DRIVER("Setting horizontal total %d, backporch %d\n",
 			 mode->htotal, bp);
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC3_REG,
-		     SUN4I_TCON1_BASIC3_H_TOTAL(mode->crtc_htotal) |
-		     SUN4I_TCON1_BASIC3_H_BACKPORCH(bp));
+		     SUN4I_TCON1_BASIC3_H_TOTAL(mode->crtc_htotal / div) |
+		     SUN4I_TCON1_BASIC3_H_BACKPORCH(bp / div));
 
 	bp = mode->crtc_vtotal - mode->crtc_vsync_start;
 	DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
-- 
2.48.1


