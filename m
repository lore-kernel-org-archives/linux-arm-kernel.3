Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035EAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNN4RBGoTZlMx5uVmdpRTe10uEZ7WZE2J9+a1pOThlU=; b=3BM3T2rUGtT68ibIKR+WdLLR7i
	UOwR/rpGqtytX1VkTJl830DsrUxMYQkHSEVZ/Xh39ZuZ43AaJRr5W0jMHbzh0lftmjiBVAoErFvfV
	8ir40CA+vzXOOO+/yMRpwv/GBZxmkBRzDirR6hKUfbaNFVGTrJkoyWOspk/hGUFRb+xwI3Diqv7p7
	WkvIMs7fdKFXc+sjb3cfF0jXl6i04e52vnoSG6v1chtaQFO1g8Ag/JRZ7e4hh100xdhEYqOTOAIaJ
	+nOPlCpBlDThWS4ziwLeBzIxH5GIzQqwKUqiZpkCyUC7TBlScyNzu7UYN7efYxD4/HbCpXglzd1bc
	Fj2mUQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjajd-00000001Vke-0hXd;
	Sun, 16 Feb 2025 09:14:45 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaSe-00000001Tkf-1Sy6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 08:57:13 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id F2DFD1140115;
	Sun, 16 Feb 2025 03:57:10 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 16 Feb 2025 03:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696230; x=
	1739782630; bh=pNN4RBGoTZlMx5uVmdpRTe10uEZ7WZE2J9+a1pOThlU=; b=D
	mox648ljHJDAW9ch+aahuxNujXkNk5hFGEDG20Elnn5o5dFLoEKfYDe6suXRWoz3
	Zn4ZclfUoJwtWM2kekRtX2MN7+TVHsBPXRjeaueokrpsJrJ1gKgD5n6tgLptseDB
	YewTBXHQz5sVOSy5+HF0Np4ntQxDgB3gJhSaX9c6c3I2OoKhMGmfh8HfwrTDNvWe
	mGbiL3FQieeCZQ/W0h7MhqZaKCxEHYyDlLjxotZv/flO9u9jIyw1VbwrN9zGjp1+
	8yLXTjI5KwJAWViPg1PwUwwLMdj7SdWlkkk/XFBz9pg8dh3jXDA7cWHnzFoB1QtV
	dofZmXrWBtPuzs/51rTIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696230; x=1739782630; bh=p
	NN4RBGoTZlMx5uVmdpRTe10uEZ7WZE2J9+a1pOThlU=; b=wT6T8VwbGoZOaHsmL
	1IsQfv763ZAsvlX1YfNZ4R1AwVFwoCNe/8RnNrN6rKe7fCG/dCuxAP6PvKXAGM6c
	Y3LMXI0DJO+1L61GiezmB/6slQ0GPfYgj9PdeORFGAfdIUG0ymcBpsUrPvE2NoQt
	pPRHLS3zc4qjQIgLUUhBqwnHo3nKZpvwYO3DEQRBN7N3XFYL5a/cg2zYGg+4u13C
	CEHR/SPvmikBwkbOiUT3NwBJi9O210YQleKKW4jRRzRQfs/jW5P4DlT+EytYj1jS
	B8Di/lqBGtZBLcxffRtdYF5rm/T0zpKf0nvTE1rs+um2hDmtUV9qrB7I4qQWTdhB
	2/ukg==
X-ME-Sender: <xms:ZqixZxVs2b-0fqK9Mfi6b5eQQRqdS816JyVvQz1UnU-jI3C4pbDZmw>
    <xme:ZqixZxn__ycx_Y_wPX_W1ghJLMY2CbLK-s8WjzwOFwWRkRcJR-epF4eT9YSJruHQ8
    XrVvDANsivtyvAPtQ>
X-ME-Received: <xmr:ZqixZ9ZrnNevqaWjayGtljJe7zrYUNPrv7RF49-3cpkBjZqBkXsVLbGR0IY_KchuusMTRQQRK4SrR00xkLiVzNU4KzSKRaWcmGz56NdJeHkX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:ZqixZ0Wap5gvd0kklJrH8YbWKKBwlypw8aq87hGIU35ZK2JCmU_1qA>
    <xmx:ZqixZ7lx1t3WkXDmAZhjXJ_udfD-fYGUMynhvMK2e1LO742VHG8uXg>
    <xmx:ZqixZxc-7eOkdYivHuMYmhDu7IaDBXrd8c0uxIXzjNn_Aj-Dmsmhcg>
    <xmx:ZqixZ1GrndMDCSePKp9cZGt9gSYTLApbGOFSjo492sF7CxR0fb1b-A>
    <xmx:ZqixZ_3wQ9cKsCXNIdYn4wjefIeGrOPuiH2Td9MRxuL46QCcTp8sebMs>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:57:04 -0500 (EST)
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
Subject: [PATCH v6 12/27] drm: sun4i: de3: add YUV support to the TCON
Date: Sun, 16 Feb 2025 21:50:43 +1300
Message-ID: <20250216085432.6373-14-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_005712_474276_675535A0 
X-CRM114-Status: GOOD (  13.30  )
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


