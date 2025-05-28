Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97244C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 10:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UCrRXtmL7lE3HJb0Lm+XOZ+GCUgtdugtbi23ypEhug=; b=W7W5uB+rWEQDtMsxp8vrJP8yXC
	0IHl1m/RnnpNRdUCayVk/AJnMfvmKRiYl70kq4JBEw/ryQ0fCPac8a48Z2NLGJ0eE5Vl9IpBATgtE
	s9NllhuW9+N8inx11UOLm1aQKhSGf4R2ez1IjL9/ti0ZI6xpdypaW3pEt04+H6LHCmy/QAjFhz6wF
	gleRKJIAo/lJ3mnEt4fWf94sTf3cjBvIDWW6zDaIDSocJXcJXR1TwgeKsD+8p9FKW7llOwT/YUsNr
	E7GfYrnC9oF9DRKKssn+Qh43SU4DEnR9yiqBhGAzKswyFkgKIQGtDUF5d8DM0LC6gBhWaeac9jPY7
	QfIOMN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDir-0000000CoBG-3YUj;
	Wed, 28 May 2025 10:09:21 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKD2q-0000000CitZ-3yQN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 09:25:58 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CE93825400BF;
	Wed, 28 May 2025 05:25:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 28 May 2025 05:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1748424355; x=
	1748510755; bh=0UCrRXtmL7lE3HJb0Lm+XOZ+GCUgtdugtbi23ypEhug=; b=d
	71XxzxwIIpyHegU3u9dJ7lXWTb7uw/gVF2zdq1dkkhpK2/CtD6LcRXa9zi2F35qM
	LMZ2TbSzuGR3m2dQ9FZosHcMPInPrdK/2+jidVKySIa6z2j6m6NdKYlXXNOqdSAQ
	AFWrvzZni1Fb/4QZpsvXoczjGfBGHiByT0tTT7MjHXD14TWHVLipKN6QjkjpWtfQ
	X8q0I1AnETZhAxYEL1uTIrrPnFGkjNo4l7icdcv8CQcKBjAFRsmUZtvJEN+9Ib+f
	a7/yZDnLzx5oJN1VrxyA1G3IhL36TAvtAeWBXDKc3mtxkiP3KT+EcUfOO3fXnPsI
	G7VqHXsxPclsacpSVxpSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1748424355; x=1748510755; bh=0
	UCrRXtmL7lE3HJb0Lm+XOZ+GCUgtdugtbi23ypEhug=; b=XUwvqc/9RDDzIAEQ2
	GiKrYV4ixIUfQaPQwZJ1VSVC+MmoWR7I6RRTS2x7V2VfbRNYZZeejedxv3hLYtyo
	6vBURydZGWJ1i3fUyoTWGorWWDn1bZfvrv/EuKnAqqkqEeCB39Y67vqGQ68fcud1
	ViOEYZf+KBMUebErJGlslVTc29O8N/UEzKbyNnaK/60gzB0nWdZnWqoFj21iRNGi
	P64dpwOiFPC7pM7d3S9Vyar6PJrdDQ/M4gFsiD+uHo0NAzaRi4waAfIhEjpHjlbv
	sHQZNM4UOyCbFuirlRp6tmo9gQrLZcsWdox9R1Kb+iANKWMKDhZnpkaK4ytHtZvb
	i1puA==
X-ME-Sender: <xms:o9Y2aMbapwFLL0-gAq_nLZ9q9sfSQfVZnuPVWYvgVIM4GinxbgKPhw>
    <xme:o9Y2aHYmhC1e2KyEhh0WfwnXh45moH1PuKoSYVHnwOJI7-vKkaqdShKLayEr4jTI0
    JcGcSs2bgPkz40mdA>
X-ME-Received: <xmr:o9Y2aG-8-tsSY0fVzoyvjVJBkATt3sj1ZaiG4sCHf95ETliCGiw6C6Z3URAx_awcC0J4PmTtAELxmHl_SyestFnf8Xd0O9E1_A4AuISXITRF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdekleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
    jghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhi
    grnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvghrnhepffehieffgedt
    gfffjeetveegfeekleeileekveeuteffteetudffveegieeiheetnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgr
    shhtrdgtohhmpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhs
    segtshhivgdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtse
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhes
    shhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdr
    shhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhoh
    hllhgrnhgurdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:o9Y2aGphRSzA1Vs7_i1kZF38mF5XLVgWMD7akggxThsvDL1eCr2YUQ>
    <xmx:o9Y2aHp6CyX3PRNLNS-jslS24MSgZSBjEh9dRfdXcO8Xe4pu8Iym_A>
    <xmx:o9Y2aEReS0t-uT6XJzMEn4ch5F0dosU3rBhbq-_O9qg90cB4MeCgBA>
    <xmx:o9Y2aHrMFReqqIWQW7ih-Ibmi5g6nVgdiToQbNg1NN7UXADEE4z5nQ>
    <xmx:o9Y2aCTY8VLnnaEs20Wyx7VXeI_N-wi_LX5zLjPrLCiJqUko-zVouZXH>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 05:25:49 -0400 (EDT)
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
Subject: [PATCH v12 7/8] drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
Date: Wed, 28 May 2025 21:22:12 +1200
Message-ID: <20250528092431.28825-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528092431.28825-1-ryan@testtoast.com>
References: <20250528092431.28825-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_022557_054213_BFEDA838 
X-CRM114-Status: GOOD (  14.47  )
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

The vi_scaler appears to be used in preference to the ui_scaler module
for hardware video scaling in the DE33.

Enable support for this scaler.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v10..v11:
- Convert de_type enum to uppercase
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 20 ++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  4 +++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7a21d32ff1e4..f97be0040aab 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -94,12 +94,24 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		hscale = state->src_w / state->crtc_w;
 		vscale = state->src_h / state->crtc_h;
 
-		sun8i_ui_scaler_setup(mixer, channel, src_w, src_h, dst_w,
-				      dst_h, hscale, vscale, hphase, vphase);
-		sun8i_ui_scaler_enable(mixer, channel, true);
+		if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+			sun8i_vi_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase,
+					      state->fb->format);
+			sun8i_vi_scaler_enable(mixer, channel, true);
+		} else {
+			sun8i_ui_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase);
+			sun8i_ui_scaler_enable(mixer, channel, true);
+		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_ui_scaler_enable(mixer, channel, false);
+		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+			sun8i_vi_scaler_enable(mixer, channel, false);
+		else
+			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
 
 	/* Set base coordinates */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index bd03607c8b7f..82df6244af88 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -835,7 +835,9 @@ static const u32 bicubic4coefftab32[480] = {
 
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		return sun8i_channel_base(mixer, channel) + 0x3000;
+	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
 	else
-- 
2.49.0


