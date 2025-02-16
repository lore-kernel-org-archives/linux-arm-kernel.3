Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FEDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 18:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cv3R3GZ5j7ybxKWdldciH+Bemda5Bt/xlY41lt6XoL4=; b=sU+wwug4kT9BR+qD5SG3NQWmDo
	krFKfTDRXpE8FqR76U/U5I7+6+qpyna9iyN5BBmz8x9sELqV5J0zhw30flwd5PB5BXt0Bm4LiGFPd
	vJNK5xFWpmEF2xJZ3RQDsYaH8z9jhM9/1GvYEPeRUTmTa4upjMTRscSIiaxEpcw5c1Hjd4eBVHJbQ
	LGu+UqbkxYQEml0N5RDJd3Pw/jpGUUB62EoFeXR/z6a0q/HUikIZCqUPJEKxC1minvontk0FzxAG3
	I7wHMgAwYjwW83jRo5APHAbiUs84e7ci9dtq7MdsKdxRwPbF80tt3SKWRoCOHajCOnQzuKcHDShmj
	Z6/aSosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjeU-00000002N8e-2r07;
	Sun, 16 Feb 2025 18:46:02 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjWs-00000002Lw8-10Ve
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:38:11 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 10D4F25400EC;
	Sun, 16 Feb 2025 13:38:09 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 13:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731088; x=
	1739817488; bh=cv3R3GZ5j7ybxKWdldciH+Bemda5Bt/xlY41lt6XoL4=; b=b
	TXqBcCJINbGidMsK6oHft3CvlyHLJdeey8Q1WUNNRhfoD81RYvsAH35BgSSEa23H
	zMDgXLsmUGx85G9oFcC/BO8gsfd83aBIAdSxID+S06+NYMilj0NCMgmRgbV9svDl
	Q8l8TKc2Qu1w1lRwk3dIDA1w7hiEg3Uak7C+eE5/sRjDkRU3eWwGL9SV03Lo+dwj
	8z4NBWpreR3zCUyMsiYE6mvJZDaXD3ZySYaSSDvGaRG0N4oAKgEpf1Go43APLZb3
	y2xTrOw6RPzoUJedAAklJLCc13E0hBJN8EH7pS/eFWUHusumqBNCNMDmjQ7u1dOx
	PX1t+tOYNGVxRtyr+G8DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731088; x=1739817488; bh=c
	v3R3GZ5j7ybxKWdldciH+Bemda5Bt/xlY41lt6XoL4=; b=Mn2m0Z/KmuXjIoULf
	mZmNCZW5ckIUXMsMucCyBa0z3uuhSSCoD4U9AFrCS3X40GRTw5iljVNGnhBn2wdv
	zLdjlJC57RU1Ev/5irIFX/gHg20tqa/UbSAMhAaMTO1oIe+1qFVP7v2aw/7AyiQz
	Jk+ZsFFq3fzdwhQ/Cgv/7QOwd+nhtec0UB37gPN0Wk3oGFN6rC31xrCvXbQ7vpD8
	JDTAmLLxUy5+yIXQmC6p7t+mgQqrqnkHtumfbYIXRAaQMCVm1qczE1fvkb8fqLnr
	Yz3HjVfLdD6cLgj21KE6WbLci65mYtwJwhM4vTODyaUmT64RrAIlnGHKc0VXabtG
	fJpug==
X-ME-Sender: <xms:kDCyZ44fGA7AhWsoj_3XR3PuUIZI8oZZ9LYUgCB2x6zzoawo1vinRA>
    <xme:kDCyZ54ffS-nI3EQOXmA76EEVp3rI3eIqPGM6Fuh49vG5-8vO_GSNZtGFTPNXB5Vm
    pXwlUaGwoR64xmQWw>
X-ME-Received: <xmr:kDCyZ3fCtsNAuvIzBZoLvXsa4t480BqDTYzVblyeBVZSvaPuapj6LeS25vB3uutt76NjicBaG288xsBEty4f3OkLCYV9dKRjwK6kVIujtlrf>
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
X-ME-Proxy: <xmx:kDCyZ9IiH0QBfZN6-_Tscft_lzPAB0jJzJFcMtU9xWX02_bkWTAp5A>
    <xmx:kDCyZ8JDZmyOkIDdtVArAUhSOblAz2xSJJOMwJ-qUiUAH8ZgjY4saw>
    <xmx:kDCyZ-zBKTwniVHk_zPn4XWnQXAAe4NIrrzpBR9t13PTwQ0xna-H7g>
    <xmx:kDCyZwIrLwL0MpvLO-agE9rEAY74gYcbs2aVtsVf-0aK-m8Ny4hkwA>
    <xmx:kDCyZx4sWxz21sw0whzOYYWlcwyt7pdq9wAGHEylUTUYv1DoRtj5pTth>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:38:02 -0500 (EST)
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
Subject: [PATCH v7 06/27] drm: sun4i: de3: add format enumeration function to engine
Date: Mon, 17 Feb 2025 07:36:06 +1300
Message-ID: <20250216183710.8443-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_103810_328169_2E6835B7 
X-CRM114-Status: GOOD (  12.25  )
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

The DE3 display engine supports YUV formats in addition to RGB.

Add an optional format enumeration function to the engine.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sunxi_engine.h | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index ec0c4932f15cf..c48cbc1aceb80 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -123,6 +123,17 @@ struct sunxi_engine_ops {
 	 */
 	void (*mode_set)(struct sunxi_engine *engine,
 			 const struct drm_display_mode *mode);
+
+	/**
+	 * @get_supported_fmts
+	 *
+	 * This callback is used to enumerate all supported output
+	 * formats by the engine. They are used for bridge format
+	 * negotiation.
+	 *
+	 * This function is optional.
+	 */
+	u32 *(*get_supported_fmts)(struct sunxi_engine *engine, u32 *num);
 };
 
 /**
@@ -215,4 +226,22 @@ sunxi_engine_mode_set(struct sunxi_engine *engine,
 	if (engine->ops && engine->ops->mode_set)
 		engine->ops->mode_set(engine, mode);
 }
+
+/**
+ * sunxi_engine_get_supported_formats - Provide array of supported formats
+ * @engine:	pointer to the engine
+ * @num:	pointer to variable, which will hold number of formats
+ *
+ * This list can be used for format negotiation by bridge.
+ */
+static inline u32 *
+sunxi_engine_get_supported_formats(struct sunxi_engine *engine, u32 *num)
+{
+	if (engine->ops && engine->ops->get_supported_fmts)
+		return engine->ops->get_supported_fmts(engine, num);
+
+	*num = 0;
+
+	return NULL;
+}
 #endif /* _SUNXI_ENGINE_H_ */
-- 
2.48.1


