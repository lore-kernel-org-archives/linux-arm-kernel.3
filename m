Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E14C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 18:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoEvA/CFJ1os4TjOsG26WNhs1piY3FD4LMZ7JtNG/qw=; b=JUunGsOtV/A6vIsU4HRyORFLFo
	EtEwR/wQY4Wuwgso+SYBcjtwEGM5xAF4LQODHlwUL2mq37ChKRuj7Ks1/8fXq21Xcfi/PKyPgnClJ
	Ka30Tw7nZFXh6YiQeO+U/xhUUaZXKnfs5twYMPKjpu1rVcdPRiH04G4FlbclMTt8u/xINUD72bnza
	qr4RRIHE7xeMctLqYTdLrX0+nKggq4knlBDwGEgBV5eBel+k5z9oarYdmD45Wa4PpsGlPc9CK44xf
	NUJpJARd2CuGkBnY3VcYLweUrhiLta/CGHZPh9mwfuN45RJXie2qlpleage/U7uB7G5F1qz1/hR9w
	/phCaEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjhL-00000002Nbe-0Gkd;
	Sun, 16 Feb 2025 18:48:59 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjXM-00000002M24-18ZV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:38:41 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 119D011400B1;
	Sun, 16 Feb 2025 13:38:39 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 16 Feb 2025 13:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731118; x=
	1739817518; bh=aoEvA/CFJ1os4TjOsG26WNhs1piY3FD4LMZ7JtNG/qw=; b=c
	tIbIvJ/zPqHhahcxlgZ+1Xm0eku1/8wSA9wTJp5bVNewTvwArG6jAtUUKXs7ZVlE
	eRk2ExZSKub5tuFL4jD1bn/oS+vLTFc8Mh6VevhxeZ7MX/w/7GePLsC7OkSA8Gec
	oQ/O3yxK+5KfP4wBoMZ2JzdJi3tgHmDNWmZ0n+QenSjtHsPFXglBAABBJ6kwa9p2
	+5cOxtU16VZpcTabvSjKOQ/fCdGR2A57ShMdNPrK2tP7u4FD9JJ/hJbDXHYdyWYe
	A9yDCfphFZdzpAIMH4U601Wy8dcB3ST5C2ZhwHPjEwnG4i9qs9cnr66Esk+grV9u
	UJw7Priv8ZINY3SH7vRuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731118; x=1739817518; bh=a
	oEvA/CFJ1os4TjOsG26WNhs1piY3FD4LMZ7JtNG/qw=; b=HSkPc8Db1pUxJa1CT
	leh8/xiww72z7WoxLDXGVoCgK/EjaBfukerO/OejCIlrm/v3nwjAqZ2eBeKQ90UG
	veCJayYZKbIQLH/OayQRBBOP+iR+w7ZDItj8x+9oRL6F0nJPCUKnK9LOhExeqBGx
	5BfeCX2L77/K8Pf/Xn44z34VIzbILmxQzDHj11f8EpvwbqsVR06BfDa3JqlehrZy
	xu1Rxf8EMzE3zeAgi/zwyjbmCvbrLBXUKVP2pbhHm+hYpUG5y+U0rc8erRWRHzfK
	gvLREVRbuBRGU8FKLu8uonYRZHldMn55UXXLTK6+XcUB70xSRnjCgukGEshcy1JC
	AyLQA==
X-ME-Sender: <xms:rjCyZ_aOwSINr6hdY8INhNMRKyXUEKzIWcAke9ZdMtf3E9diIpDwlw>
    <xme:rjCyZ-b-mBnjQQ9jkjeqsa2saWThsKbuzrN4y6i7l_EK71lqk4L-mb8u024pK_geG
    8yiLbF14-r0kqqTow>
X-ME-Received: <xmr:rjCyZx-Ej8KNCVE7Jx9ifjz6ZcGwJrtMGC7LBVPBgy5QUv3Bp6wWavIvU-kYRtQfyBS0_a-voTjx4GgRjX-PWsxB_qG7rJW3NKLUsIuRxgr9>
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
X-ME-Proxy: <xmx:rjCyZ1qHRrtXXgAdx6AAsI7wb1Od5XR8bP6l4jkwmbVex6Td6VdfNw>
    <xmx:rjCyZ6pB3inw7Mojypbijub7hPoTrL7ub3AdWFlEDhlbr4VtPoBk4g>
    <xmx:rjCyZ7RNP_gOxiMRiOkLanZfS910-NtwvRYKQlPxLLrUgJAj4n7OnA>
    <xmx:rjCyZypfUb8XgeP8pLOwK4nIGXBMO3MMbtqJsQbQyvDASBRjAEeeVQ>
    <xmx:rjCyZ8bhPU-1OU7sMseWkB5Sm-rUuk-_3fIe1veTIcKHrsRpzaZHtpxa>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:38:32 -0500 (EST)
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
Subject: [PATCH v7 08/27] drm: sun4i: de3: add YUV support to the DE3 mixer
Date: Mon, 17 Feb 2025 07:36:08 +1300
Message-ID: <20250216183710.8443-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_103840_359297_8310B556 
X-CRM114-Status: GOOD (  17.74  )
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

The mixer in the DE3 display engine supports YUV 8 and 10 bit
formats in addition to 8-bit RGB. Add the required register
configuration and format enumeration callback functions to the mixer,
and store the in-use output format (defaulting to RGB) and color
encoding in the mixer configuration.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v4..v5:
- Remove trailing whitespace

Changelog v5..v6:
- Move color format and encoding flags to mixer and add struct.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 54 +++++++++++++++++++++++++++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 11 ++++++
 2 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index a170f68708b1f..bc934186bfd6f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -23,7 +23,10 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include <uapi/linux/media-bus-format.h>
+
 #include "sun4i_drv.h"
+#include "sun50i_fmt.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_vi_layer.h"
@@ -390,12 +393,52 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
 			 interlaced ? "on" : "off");
+
+	if (mixer->color_model.format == MEDIA_BUS_FMT_RGB888_1X24)
+		val = SUN8I_MIXER_BLEND_COLOR_BLACK;
+	else
+		val = 0xff108080;
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
+
+	if (mixer->cfg->has_formatter)
+		sun50i_fmt_setup(mixer, mode->hdisplay,
+				 mode->vdisplay, mixer->color_model.format);
+}
+
+static u32 *sun8i_mixer_get_supported_fmts(struct sunxi_engine *engine, u32 *num)
+{
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	u32 *formats, count;
+
+	count = 0;
+
+	formats = kcalloc(5, sizeof(*formats), GFP_KERNEL);
+	if (!formats)
+		return NULL;
+
+	if (mixer->cfg->has_formatter) {
+		formats[count++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+		formats[count++] = MEDIA_BUS_FMT_YUV8_1X24;
+		formats[count++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		formats[count++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+	}
+
+	formats[count++] = MEDIA_BUS_FMT_RGB888_1X24;
+
+	*num = count;
+
+	return formats;
 }
 
 static const struct sunxi_engine_ops sun8i_engine_ops = {
-	.commit		= sun8i_mixer_commit,
-	.layers_init	= sun8i_layers_init,
-	.mode_set	= sun8i_mixer_mode_set,
+	.commit			= sun8i_mixer_commit,
+	.layers_init		= sun8i_layers_init,
+	.mode_set		= sun8i_mixer_mode_set,
+	.get_supported_fmts	= sun8i_mixer_get_supported_fmts,
 };
 
 static const struct regmap_config sun8i_mixer_regmap_config = {
@@ -484,6 +527,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer->cfg)
 		return -EINVAL;
 
+	/* default output format, supported by all mixers */
+	mixer->color_model.format = MEDIA_BUS_FMT_RGB888_1X24;
+	/* default color encoding, ignored with RGB I/O */
+	mixer->color_model.encoding = DRM_COLOR_YCBCR_BT601;
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 8417b8fef2e1f..5f465a974fbdf 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_plane.h>
 
 #include "sunxi_engine.h"
@@ -177,6 +178,11 @@ struct sun8i_mixer_cfg {
 	unsigned int	scanline_yuv;
 };
 
+struct sun8i_color_model {
+	u32			format;
+	enum drm_color_encoding	encoding;
+};
+
 struct sun8i_mixer {
 	struct sunxi_engine		engine;
 
@@ -186,6 +192,11 @@ struct sun8i_mixer {
 
 	struct clk			*bus_clk;
 	struct clk			*mod_clk;
+
+	struct regmap			*top_regs;
+	struct regmap			*disp_regs;
+
+	struct sun8i_color_model	color_model;
 };
 
 enum {
-- 
2.48.1


