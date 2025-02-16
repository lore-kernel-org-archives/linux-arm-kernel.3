Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A7EC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 18:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HVDSqb0E38/RlDHOZVHlNbvC0eTf8DhCXGhraZbrLrE=; b=XM665Vr9NIcMpiEYT+fsleDT+o
	7nxPt8f7qgEBxYghLBHWSB23II9jJfAenJw42tfA/EYumXnTaEanUZacxVJ173kMW4PAUI8aa/cKw
	JSup4AuU8PzY59dXx8Dt/AQTnjvtBCpxFToq8U4q7CLiGS+ntf/Ik8VfSTn7zhgGVD6pK9PMvP93g
	zXffhDleWEKnz1QS9T93X5+4U5Kw/qDZP51L//6yLoHIua/4uDsFy3/31LFnnj8UWnnPZcdpxIfzh
	+b0BRhPdrz8S8OC4jSOaPqBux6cdEvPltE/1KRCrHOVC7tQ7dj/rEWeqc/PmiSA9peGn66oMn9mfd
	ZvjRUZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjYo-00000002MP8-06LF;
	Sun, 16 Feb 2025 18:40:10 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjWJ-00000002LoS-1vUR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:37:36 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 44B9C2540111;
	Sun, 16 Feb 2025 13:37:34 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 13:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1739731054; x=1739817454; bh=HVDSqb0E38
	/RlDHOZVHlNbvC0eTf8DhCXGhraZbrLrE=; b=oCyZz038/tm3Zd+AVAdqHDRRlc
	4vnvcpnTUgi51g4Bv4msf6wL41h5V9OnSgrdzog/GY4VZ3KooMmLVwDROnrLvSlX
	6k//Dprgd3lb4/B76EZvY/6pWuyEzzE6beX++9u+CbAUrqyviq34ogCtJndAl0Jj
	wv6PBmOXpGAvUujDa0G5kHv6jxArehAhLeWawFJean7J+QxMxSxdI9BIvZqBlegV
	8NIw6amIhFLP/MUiBa9ouJSwVUGU2XTKC9uGA/TC/cf2B+KC1APA4HCv/YpMc7s/
	EEa4MuVNVIxv85ZFtUoDtWenjj+hUxAjsjhYsbHeew6iCQ4CaOn5RYBS5oxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739731054; x=1739817454; bh=HVDSqb0E38/RlDHOZVHlNbvC0eTf8DhCXGh
	raZbrLrE=; b=F/IfmLEbb3rCnhx0CmFU6GGY7uo79mX+JS2ZPaKw5AHTXa/7IRX
	9H9eTSi4Ap3f1FsbViWcsVQqkk3kx2ljUa0soGq+o/FB98U0/Xfh8XOpKFNL0FyU
	ttpXqY/AKDBjSNloB47VtqYKh12LWl6ADMbyMQzQdkfhcHpkpm4Q5VnsS9vx8NSI
	zQ3D8/Dw7M9AZXFmyw9XUu+GI6bnHeZA96Wn8DxDyQPp7UJqqYYMJUvGDx7dwYrw
	hPrH36Xl7D2AZ1SsJAR5h6ZfJbGZIlpwj0xrqnWGfctlopEPYqi753e7al51APvH
	H+3i8ygq3IG2r2CHCady1uU9eTby7Bmaw3A==
X-ME-Sender: <xms:bTCyZ5yIpO8hYVNwwpGXwa3rHdoFrsTEiKOyZZUdwduyOrg5y_dz-g>
    <xme:bTCyZ5RukFvDUbE9tsv49PrjEo5g091oOzMOGVjtkTiydBwdCrNUzBO7cTttai0p1
    B5PsZkIzRoFh4_qJw>
X-ME-Received: <xmr:bTCyZzVlqP8Ab1sWnZDc2nBxDuU7k1oU50y2zICdGaR0wd_tENOnxqg2x_W1FrrHHC0CLl_iyBmibf4JMP8z0djGunUVEYHs40QER431SPKb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtg
    homheqnecuggftrfgrthhtvghrnhepuddvueduueegtdeuffetveevgeehhedvhfefuddu
    veekgffgfedtheegtefhhfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphht
    thhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrugeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgtphht
    thhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtoh
    hmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthho
    pegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlsehffh
    iflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdr
    tghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpth
    htoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:bTCyZ7ghYK2zMx7OD9ntv63Vi7aOgQmvVvkLYRsCyRxpju2rmP90EQ>
    <xmx:bTCyZ7BvHRLslNojNPm9G2Sfl5ckc0tk1bTCao6oGrYmbGyOpjPWBQ>
    <xmx:bTCyZ0JKB0BNVfx84bbh4uvyU_puj4AGPFWT5wJ6u13h8IWD9ZS6Lw>
    <xmx:bTCyZ6B7R_MObxY9CZ0-n7oPJZfcZ_mqMAdit9EGmlKkefJKo5vmCA>
    <xmx:bjCyZ9wFu8fPF-HrBYjcmD7vpt2XiGNPUTE9mtRYXa4e_5uah_-Qjxjc>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:37:27 -0500 (EST)
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
Subject: [PATCH v7 02/27] drm: sun4i: de2/de3: Merge CSC functions into one
Date: Mon, 17 Feb 2025 07:36:02 +1300
Message-ID: <20250216183710.8443-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_103735_553841_BB3EE439 
X-CRM114-Status: GOOD (  12.89  )
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

At the moment the colour space conversion is handled by two functions:
one to setup the conversion parameters, and another one to enable the
conversion. Merging both into one gives more flexibility for upcoming
extensions to support whole YUV pipelines, in the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 89 ++++++++++----------------
 drivers/gpu/drm/sun4i/sun8i_csc.h      |  9 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 11 +---
 3 files changed, 40 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index a96de701c3304..5606912f92de5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -107,23 +107,28 @@ static const u32 yuv2rgb_de3[2][3][12] = {
 	},
 };
 
-static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
-				       enum sun8i_format_type fmt_type,
-				       enum drm_color_encoding encoding,
-				       enum drm_color_range range)
+static void sun8i_csc_setup(struct regmap *map, u32 base,
+			    enum sun8i_format_type fmt_type,
+			    enum drm_color_encoding encoding,
+			    enum drm_color_range range)
 {
+	u32 base_reg, val;
 	const u32 *table;
-	u32 base_reg;
 	int i;
 
 	table = yuv2rgb[range][encoding];
 
 	switch (fmt_type) {
+	case FORMAT_TYPE_RGB:
+		val = 0;
+		break;
 	case FORMAT_TYPE_YUV:
+		val = SUN8I_CSC_CTRL_EN;
 		base_reg = SUN8I_CSC_COEFF(base, 0);
 		regmap_bulk_write(map, base_reg, table, 12);
 		break;
 	case FORMAT_TYPE_YVU:
+		val = SUN8I_CSC_CTRL_EN;
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				base_reg = SUN8I_CSC_COEFF(base, i + 1);
@@ -135,28 +140,37 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 		}
 		break;
 	default:
+		val = 0;
 		DRM_WARN("Wrong CSC mode specified.\n");
 		return;
 	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
-static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
-					    enum sun8i_format_type fmt_type,
-					    enum drm_color_encoding encoding,
-					    enum drm_color_range range)
+static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
+				 enum sun8i_format_type fmt_type,
+				 enum drm_color_encoding encoding,
+				 enum drm_color_range range)
 {
+	u32 addr, val, mask;
 	const u32 *table;
-	u32 addr;
 	int i;
 
+	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
 
 	switch (fmt_type) {
+	case FORMAT_TYPE_RGB:
+		val = 0;
+		break;
 	case FORMAT_TYPE_YUV:
+		val = mask;
 		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 		regmap_bulk_write(map, addr, table, 12);
 		break;
 	case FORMAT_TYPE_YVU:
+		val = mask;
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE,
@@ -173,67 +187,30 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
 		}
 		break;
 	default:
+		val = 0;
 		DRM_WARN("Wrong CSC mode specified.\n");
 		return;
 	}
-}
-
-static void sun8i_csc_enable(struct regmap *map, u32 base, bool enable)
-{
-	u32 val;
-
-	if (enable)
-		val = SUN8I_CSC_CTRL_EN;
-	else
-		val = 0;
-
-	regmap_update_bits(map, SUN8I_CSC_CTRL(base), SUN8I_CSC_CTRL_EN, val);
-}
-
-static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, bool enable)
-{
-	u32 val, mask;
-
-	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
-
-	if (enable)
-		val = mask;
-	else
-		val = 0;
 
 	regmap_update_bits(map, SUN50I_MIXER_BLEND_CSC_CTL(DE3_BLD_BASE),
 			   mask, val);
 }
 
-void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_format_type fmt_type,
-				     enum drm_color_encoding encoding,
-				     enum drm_color_range range)
-{
-	u32 base;
-
-	if (mixer->cfg->is_de3) {
-		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
-						fmt_type, encoding, range);
-		return;
-	}
-
-	base = ccsc_base[mixer->cfg->ccsc][layer];
-
-	sun8i_csc_set_coefficients(mixer->engine.regs, base,
-				   fmt_type, encoding, range);
-}
-
-void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
+void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
+			enum sun8i_format_type fmt_type,
+			enum drm_color_encoding encoding,
+			enum drm_color_range range)
 {
 	u32 base;
 
 	if (mixer->cfg->is_de3) {
-		sun8i_de3_ccsc_enable(mixer->engine.regs, layer, enable);
+		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+				     fmt_type, encoding, range);
 		return;
 	}
 
 	base = ccsc_base[mixer->cfg->ccsc][layer];
 
-	sun8i_csc_enable(mixer->engine.regs, base, enable);
+	sun8i_csc_setup(mixer->engine.regs, base,
+			fmt_type, encoding, range);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index e35e0ac951022..9b63c92782f56 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -28,10 +28,9 @@ enum sun8i_format_type {
 	FORMAT_TYPE_YVU,
 };
 
-void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_format_type fmt_type,
-				     enum drm_color_encoding encoding,
-				     enum drm_color_range range);
-void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
+void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
+			enum sun8i_format_type fmt_type,
+			enum drm_color_encoding encoding,
+			enum drm_color_range range);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 8a80934e928fe..f3a5329351caa 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -232,14 +232,9 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
 
 	fmt_type = sun8i_vi_layer_get_format_type(fmt);
-	if (fmt_type != FORMAT_TYPE_RGB) {
-		sun8i_csc_set_ccsc_coefficients(mixer, channel, fmt_type,
-						state->color_encoding,
-						state->color_range);
-		sun8i_csc_enable_ccsc(mixer, channel, true);
-	} else {
-		sun8i_csc_enable_ccsc(mixer, channel, false);
-	}
+	sun8i_csc_set_ccsc(mixer, channel, fmt_type,
+			   state->color_encoding,
+			   state->color_range);
 
 	if (!fmt->is_yuv)
 		val = SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;
-- 
2.48.1


