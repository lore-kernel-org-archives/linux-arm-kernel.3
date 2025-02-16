Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C0DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 18:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCv7Nw4cxeILjr/gqRsALtNFefeEHiqf5aAWTZSsDw0=; b=rEqy7yY3b7UZgByZg94pXvpgTI
	kzCwunQSkkzH8Y209wYopcS9/V98JlrBs/1W+jmOQFolqcJ4VpF06zlVglD/5QAlCldQnAnuu4llQ
	UWRKBGWP22o3M4AJsVvTG0KcXaTeqtkKPLT2aLg9rOoF9fz4syVQaz/3jHTSc6uQR+87CsPm01Mg9
	PGTD++9p0l9lyeSlguvzibS4WZggrLTRrWm7DtAXdnue+vtyfsLArA+fG2Bzc/Hw6k8T+zJJrThPz
	5eXsUh837krdga0rfxcv1GrlLZcyRtxhbJZ+y/D3SBGOQK/G++NsT06CerFR9fMbMqT6JK1nevC/u
	V6pPblsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjXN-00000002M2g-1Q6A;
	Sun, 16 Feb 2025 18:38:41 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjUa-00000002Lc3-3rI4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:35:50 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9B1F125400E3;
	Sun, 16 Feb 2025 13:35:47 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 13:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739730947; x=
	1739817347; bh=oCv7Nw4cxeILjr/gqRsALtNFefeEHiqf5aAWTZSsDw0=; b=T
	f7buCnFnjoGSOy/U/E/Oxmki30lq1dfbvlmwFGNCEA0a4X+zeVLn+ghISrz/n6fK
	vQLcWa09SlZvgk1zMpAL1O551WgKne3pxVzpfBjGMX413gHt7T6RrjoniF2Zox+g
	UEfq4+A3IPevPsXOtV6Pmkaz+5mpeo4ztEX5JEiaNM37E2ZL0ZQIDm3y9R+hM80H
	QPTBoIEW0SRQVi/j1r3EB8OhIMPRQziIJYQwXGVn4qyRmEXyxtt9HI3RnodpleSP
	TSk4VIZO++kz7yDIxAAhoUK3xdRI4Au7WWshSaDmMwk99duPU/XPMByjzE4hyEJv
	yizd7i3rsVS+GVPjOTBFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739730947; x=1739817347; bh=o
	Cv7Nw4cxeILjr/gqRsALtNFefeEHiqf5aAWTZSsDw0=; b=Xx9gnwJu/X29PMxGL
	FSmNvF2zn+SHsZ2fMChRnaEnQkoyWISi/paQsGicT5coV9/w3faXM/WLr3alIfMO
	NrPZiPdFSwWLYJGuArevk/tZbshvoRUForYLYNWm2zT+7hNtcGzYbVSQFHn6/2g8
	EwxjzPATT9/hAEEfSUPhbU/Ig88ss5fWcN+hKg0aUNHwSFltmaB83J9Ngvp7RNlW
	f1dzUfJRhilzCf9erybbVNzatlpAYRvSRc2PpVEImtKJ1BN4Sv0eKP6J+TLO+UVZ
	nD0ZEVS1bA81ayhr3iX/52uPUQvs5izBHd3hpxN89IBgQuA8MFeilQ4GOtz4v5b4
	H5cOg==
X-ME-Sender: <xms:AjCyZ1HTYHKEwnJ4fA4vTPGFU6s1wAi4alq0au_0vw57bAVNYcUhvw>
    <xme:AjCyZ6XbtgXixxkAIyCJvZQ4smmM_SuINvyrxcgTrrw94VdRHU17-MeymdaVTq5Wi
    Yg6v4ZErEdU7D_sTg>
X-ME-Received: <xmr:AjCyZ3IbrkGyFALMqlKV_LVr8SV_twOZrn3ZB19isuFy7aAjpy-pHNF_4TmrijdevSR0vDu8QmtAVoDDo1g0gC5l6iL1-6j8c3cqUWYATM8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:AjCyZ7GHxdF5u6w9yt8pSzhtPD67NxBvZIwdlsHRXphImjOg4cIiuQ>
    <xmx:AjCyZ7WQc5qLd_Ie7Y8I8UsxXLKoxZPt4lFzWwtgsBO4bhRPk55cTQ>
    <xmx:AjCyZ2PX-XS4DrcIEkiseLPVFRcz6iMMMOOvaqzGj-_YXj8dgnqZXg>
    <xmx:AjCyZ604xSFlNLnq4mwBfjegrie7RVP8SKHGXYgmn_kItdWWHq5vmQ>
    <xmx:AzCyZ5meUVfPBNNyhFw9AMJq8N6IMdPmpkGgXrnYRo8dSMcj5qIUb0PE>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:35:40 -0500 (EST)
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
Subject: [PATCH v7 01/27] drm: sun4i: de2/de3: Change CSC argument
Date: Mon, 17 Feb 2025 07:32:00 +1300
Message-ID: <20250216183524.12095-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183524.12095-1-ryan@testtoast.com>
References: <20250216183524.12095-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_103549_008318_C748E56E 
X-CRM114-Status: GOOD (  15.16  )
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

Currently, CSC module takes care only for converting YUV to RGB.
However, DE3 is more suited to work in YUV color space. Change CSC mode
argument to format type to be more neutral. New argument only tells
layer format type and doesn't imply output type.

This commit doesn't make any functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

--
Changelog v5..v6:
- Rename format enum from format_type to sun8i_format_type
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 22 +++++++++++-----------
 drivers/gpu/drm/sun4i/sun8i_csc.h      | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++++--------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 58480d8e4f704..a96de701c3304 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -108,7 +108,7 @@ static const u32 yuv2rgb_de3[2][3][12] = {
 };
 
 static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
-				       enum sun8i_csc_mode mode,
+				       enum sun8i_format_type fmt_type,
 				       enum drm_color_encoding encoding,
 				       enum drm_color_range range)
 {
@@ -118,12 +118,12 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 
 	table = yuv2rgb[range][encoding];
 
-	switch (mode) {
-	case SUN8I_CSC_MODE_YUV2RGB:
+	switch (fmt_type) {
+	case FORMAT_TYPE_YUV:
 		base_reg = SUN8I_CSC_COEFF(base, 0);
 		regmap_bulk_write(map, base_reg, table, 12);
 		break;
-	case SUN8I_CSC_MODE_YVU2RGB:
+	case FORMAT_TYPE_YVU:
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				base_reg = SUN8I_CSC_COEFF(base, i + 1);
@@ -141,7 +141,7 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 }
 
 static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
-					    enum sun8i_csc_mode mode,
+					    enum sun8i_format_type fmt_type,
 					    enum drm_color_encoding encoding,
 					    enum drm_color_range range)
 {
@@ -151,12 +151,12 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
 
 	table = yuv2rgb_de3[range][encoding];
 
-	switch (mode) {
-	case SUN8I_CSC_MODE_YUV2RGB:
+	switch (fmt_type) {
+	case FORMAT_TYPE_YUV:
 		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 		regmap_bulk_write(map, addr, table, 12);
 		break;
-	case SUN8I_CSC_MODE_YVU2RGB:
+	case FORMAT_TYPE_YVU:
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE,
@@ -206,7 +206,7 @@ static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, bool enable)
 }
 
 void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
+				     enum sun8i_format_type fmt_type,
 				     enum drm_color_encoding encoding,
 				     enum drm_color_range range)
 {
@@ -214,14 +214,14 @@ void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
 
 	if (mixer->cfg->is_de3) {
 		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
-						mode, encoding, range);
+						fmt_type, encoding, range);
 		return;
 	}
 
 	base = ccsc_base[mixer->cfg->ccsc][layer];
 
 	sun8i_csc_set_coefficients(mixer->engine.regs, base,
-				   mode, encoding, range);
+				   fmt_type, encoding, range);
 }
 
 void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 828b86fd0cabb..e35e0ac951022 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -22,14 +22,14 @@ struct sun8i_mixer;
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-enum sun8i_csc_mode {
-	SUN8I_CSC_MODE_OFF,
-	SUN8I_CSC_MODE_YUV2RGB,
-	SUN8I_CSC_MODE_YVU2RGB,
+enum sun8i_format_type {
+	FORMAT_TYPE_RGB,
+	FORMAT_TYPE_YUV,
+	FORMAT_TYPE_YVU,
 };
 
 void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
+				     enum sun8i_format_type fmt_type,
 				     enum drm_color_encoding encoding,
 				     enum drm_color_range range);
 void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 9c09d9c08496d..8a80934e928fe 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -193,19 +193,19 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	return 0;
 }
 
-static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
+static u32 sun8i_vi_layer_get_format_type(const struct drm_format_info *format)
 {
 	if (!format->is_yuv)
-		return SUN8I_CSC_MODE_OFF;
+		return FORMAT_TYPE_RGB;
 
 	switch (format->format) {
 	case DRM_FORMAT_YVU411:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
 	case DRM_FORMAT_YVU444:
-		return SUN8I_CSC_MODE_YVU2RGB;
+		return FORMAT_TYPE_YVU;
 	default:
-		return SUN8I_CSC_MODE_YUV2RGB;
+		return FORMAT_TYPE_YUV;
 	}
 }
 
@@ -213,7 +213,7 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	u32 val, ch_base, csc_mode, hw_fmt;
+	u32 val, ch_base, fmt_type, hw_fmt;
 	const struct drm_format_info *fmt;
 	int ret;
 
@@ -231,9 +231,9 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
 
-	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
-	if (csc_mode != SUN8I_CSC_MODE_OFF) {
-		sun8i_csc_set_ccsc_coefficients(mixer, channel, csc_mode,
+	fmt_type = sun8i_vi_layer_get_format_type(fmt);
+	if (fmt_type != FORMAT_TYPE_RGB) {
+		sun8i_csc_set_ccsc_coefficients(mixer, channel, fmt_type,
 						state->color_encoding,
 						state->color_range);
 		sun8i_csc_enable_ccsc(mixer, channel, true);
-- 
2.48.1


