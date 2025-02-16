Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE5AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 18:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJb12UNrcw1b4CXj7oJwE7645Xi4wHyCdBE0N2smQ2w=; b=a5Rg6UwMCEuYz8iiswHhQlJ9ce
	dLzSkhqMSa8UL9f1kh1OQfe8Q40TpsApsimqE/kquCJeQA5gt7qkIwaNuWRHPqkB8A0fnZYM+lako
	NNDzxR4fxKugs6IxosDNJkLAUvDc8T/L71DOOzJC9l8SIQoeq6K3fMmYsrMPWE6XxUJ1TtSn8e7xo
	Kf5yCG58Wv77jzIbKPWNb3fnqceyC9V2uGKoshoYPe6qlHAQ4PeK0ASvcZjOw4sBqPRF6IyB5E7i6
	wz7HWvSF1CB3Ol1onYarXOxR1fSVI2sbmQwoIelrGNvOEsvPGRBITMB0cQIh3yPRxCpodvrL2jsZG
	X+wM7UhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjbe-00000002Mq9-1hOq;
	Sun, 16 Feb 2025 18:43:06 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjWa-00000002Lru-37qp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:37:53 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 7B45211400B1;
	Sun, 16 Feb 2025 13:37:51 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 13:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731071; x=
	1739817471; bh=LJb12UNrcw1b4CXj7oJwE7645Xi4wHyCdBE0N2smQ2w=; b=F
	S6rbJyvmg3Mar38c8UzOgy2/RP9Oc25mB3bZx+jBBR+OjoayovdG7kfo3rlQcsu4
	Yk22xkXha7/bBJFrQmDv3pCrYZf8+bKPUUodb+I2JvLNsHiEL/8Y2CBVYOUMqWDK
	fQkLo9+GVSaxi6jPLwOrbw00ewXRx7Juv01WQVw0x7+o/aa7JkEFlcDs6ObQ1qB7
	nLFnBkfwpiwgEkhDqfGqaxPbRw0XHr+oxyYOVlXA/I80r5Sl32LeR7dnS9Bun+4S
	Z3c7V2uWNZZzhkiq1brDhxC1CXrHgVK3+DeVWN52UvV0jkdualWf9XJUCfCP/UX6
	kP3TblMOxqJX/fPFVjG/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731071; x=1739817471; bh=L
	Jb12UNrcw1b4CXj7oJwE7645Xi4wHyCdBE0N2smQ2w=; b=02wnCxUhwzjbdfSvp
	7vNh0e6PJ9KE4RJTNUeSNggEsSPdljL9bh1ggXKQUaNupyXlJOTdf0FnSCxqy6HX
	xuy6AY9zaRHeVfdB22RiUunIaya1s0nO/RvnyvDK0QidyH8NnvIS59mVk6DG4F1s
	X8eDNgI586G7Ixuk4Ph4OqdaxHr95kmw5TLm+5hQGtB7yr8eLJ15s1lnIFH3M8cU
	YAtSgmX/b8Wx/Nz42inWYQVqOqPqLdSX7R2K5gX/kxZDf+/svqFKLyXaEi4LUQw5
	EceaHPb1Gd/7m0BhGTMgRx16FZzAip/dRUvQi9HeggXIuS4Y2ZZdbI0hH93L7kdg
	CgAQA==
X-ME-Sender: <xms:fzCyZzKOCvGwHBcKkheJFGL9E1SKH-loCMhFiSwgsPq7EGalhrSRyA>
    <xme:fzCyZ3KTTddNzmkUhhetcX7zRNI9e3JMKjrzwDDC75Fz4qnk9mvj0gMwSEw2TXboZ
    kUrkLChXauDIN1DgA>
X-ME-Received: <xmr:fzCyZ7uL-B6nhvsXMZohCyyFKwWXKtx8ktb5s4F1Qpw2uTu8C6F0s38RBIn20k10SPW4qsThQp0FpCXlzeAiIVucCCo0Th2AjEq4BoFkz1pa>
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
X-ME-Proxy: <xmx:fzCyZ8bspLzcTTI8EgAW2CPRn8vwC4rNL3DdlYob1rozfjRNGYo6RA>
    <xmx:fzCyZ6Z4vrW_3Viec7dP6K7TCKZonoy0GX1nwxpmaKeqNTP04crSjw>
    <xmx:fzCyZwAfbTDyrTUPy2C3GlBiZmhhMzTHD_IXqBZfvUfeIQAjy9QQSw>
    <xmx:fzCyZ4bE7a7ZWOCtvQKv_0JF5vpzlyh5zNTWy91O4fIU1y3fNvlOhQ>
    <xmx:fzCyZ2LnLjg8EUjI6KCvn016dDn8jfQuH9O2YlKyDOiyrVOtKquxmUjP>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:37:44 -0500 (EST)
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
Subject: [PATCH v7 04/27] drm: sun4i: de2: Initialize layer fields earlier
Date: Mon, 17 Feb 2025 07:36:04 +1300
Message-ID: <20250216183710.8443-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_103752_834118_F80B76CF 
X-CRM114-Status: GOOD (  10.33  )
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

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 9 +++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index aa987bca1dbb9..cb9b694fef101 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -295,6 +295,11 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_UI;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -325,10 +330,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index f3a5329351caa..3c657b069d1f4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -478,6 +478,11 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_VI;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->is_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -536,10 +541,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_VI;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.48.1


