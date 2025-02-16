Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1720FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjD1ZDjTlOdhXrU8c38PMPCZ6hMJn574nV8c+MDBJsM=; b=yTp7f/83R7NqnjD5aoTNmKHb1K
	RjHP2JZq9/qclJr8KXmGn8WMjQOnDVHRR3n3PE/jzzTAU5eDWZ3UqfQRNwsI9NsQp8Nddm3PnizWK
	TYC6DF/K2gpdDOKmQ6B9JgbQMInkGhEiv/rbIA5SA/TRYJiAMk41pspb33R23Mq0EU7vOeMrcVQao
	qQ+CF4ZDMrAmdsEvXDEHEEZ2WsxVSog6v/IB+ZwPyi1A61FOzcsqUf3PBmFVoJY9s/1n/75cmQems
	1Ie99Gb4TEib22GUvdvXH86Lm/T7GpBc/4/V8fuPsQIrAQv3Np3lkINqC7OlwwUmVImDDxviPcxZ8
	S8DkPMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjb22-00000001Y8o-0ybL;
	Sun, 16 Feb 2025 09:33:46 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaUH-00000001U5K-29tl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 08:58:54 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 222A22540108;
	Sun, 16 Feb 2025 03:58:52 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-13.internal (MEProxy); Sun, 16 Feb 2025 03:58:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696331; x=
	1739782731; bh=QjD1ZDjTlOdhXrU8c38PMPCZ6hMJn574nV8c+MDBJsM=; b=W
	A2cOWnq/FSylN/jAqs8lCTOedi0M7u29TfIGjD7IShQhIdiljjX2pgayT98m0hjv
	aYMThCcawcxM+ch6FXMTvMpBC0SLLHx92/i2xRSnMZnxmQw7Vt+BAkZhy/iirsni
	5+cVEP6X5IAcSUFW3wwkn0Z/6OQr8+bkfuzXw3PHpFmlZRik/1TBRAkyN3rv608F
	/KUCys1oDfTk14xLRAcBxruWSYW+gWCj5uNPts19RET1f9n9xyEwp9msTFHzrHi1
	9BJLL21Dcpkeqpl2eexmwFRTBtWn1wC+q5G2e4nP8QvJd08hwZO9foNnGWFyqs8X
	qBJneMWEJkFQ9qnUR1HKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696331; x=1739782731; bh=Q
	jD1ZDjTlOdhXrU8c38PMPCZ6hMJn574nV8c+MDBJsM=; b=HZBfKgI9wwHN79YeE
	6R+FNKQxFsGhd7FDEqodAB7qsRI0MB4M5dAzrDLbgG13XmbHY4PXYbZaeD0+15z/
	A5RPd0ZvQ1hfnhn4j0K8FydNyQ1GkpQKt6K/dlQhEjnV4fWcNEioAJeoAIUrJwKZ
	tn0rcSD6hkh4rZx7fjGH6RzMnDS9ftr1HNnd67iBo18x54DZPU9YT1mkpd3zsI+e
	F8tN8YJKvRtHJKsycwf3fw8v7U8g7q8I6roEDloPgKrXTW9UcaEANAyDed3tZLh8
	Fcw/gGnyO7JXQgaHj8CHonZy+/y5HSOpD2mK5OeQ+NnKxhsJlSzM8vZd54UQ38o1
	m3/9A==
X-ME-Sender: <xms:y6ixZzAMMNmpepSj9wUJK_B_2EeUeVO0KNWvHIn5swyGPSWCyHjZUg>
    <xme:y6ixZ5hsnsjZDyYSJuobsAyVFmQCYmcPJuOn1Yi34Q-v0IDv5PjVnxd6u3i2yrBoj
    FzD3DbjWdo0Z45rcg>
X-ME-Received: <xmr:y6ixZ-kkhaSvkmID_yEX4RqK7omn5JjLrsLV0pUVXXsGDhpGT8TcrfCf-_tE5K8kxLpVS3H1Liv3iBooCD_6CZ0bn6kJwpHJb8qJRG94J8Hf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:y6ixZ1x5iQVFee_qp-YlZC-S9E3tlUtA3wzaBjKZE-Z35Evy2wjhJQ>
    <xmx:y6ixZ4QYpcMNsyNHyPUsf8cSxKIMOI7roTS9ZoANPfNbPidSekg88A>
    <xmx:y6ixZ4ak6DPeplMSGLCwng58e5H-9Te5AWc38yn6RtdJo0xe8o5sKA>
    <xmx:y6ixZ5QCBHCnbNCYdJP6U8yfPTFqRvY3_Aikynde13QcWIafUwJW3A>
    <xmx:y6ixZ5CvlZu3ebbUriIvP2iVfZQx2x6QSmLLNGGgmecX7KuIB2J9S_1j>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:58:45 -0500 (EST)
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
Subject: [PATCH v6 25/27] drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
Date: Sun, 16 Feb 2025 21:50:56 +1300
Message-ID: <20250216085432.6373-27-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_005853_728655_3F427168 
X-CRM114-Status: GOOD (  13.47  )
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
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 19 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  7 ++++++-
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7f1231cf0f012..180be9d67d9c3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -95,12 +95,23 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		hscale = state->src_w / state->crtc_w;
 		vscale = state->src_h / state->crtc_h;
 
-		sun8i_ui_scaler_setup(mixer, channel, src_w, src_h, dst_w,
-				      dst_h, hscale, vscale, hphase, vphase);
-		sun8i_ui_scaler_enable(mixer, channel, true);
+		if (mixer->cfg->de_type == sun8i_mixer_de33) {
+			sun8i_vi_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase,
+					      state->fb->format);
+		} else {
+			sun8i_ui_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase);
+			sun8i_ui_scaler_enable(mixer, channel, true);
+		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_ui_scaler_enable(mixer, channel, false);
+		if (mixer->cfg->de_type == sun8i_mixer_de33)
+			sun8i_vi_scaler_disable(mixer, channel);
+		else
+			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
 
 	/* Set base coordinates */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index e7242301b312c..9c7f6e7d71d50 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -835,7 +835,9 @@ static const u32 bicubic4coefftab32[480] = {
 
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->de_type == sun8i_mixer_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return sun8i_channel_base(mixer, channel) + 0x3000;
+	else if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
 	else
@@ -845,6 +847,9 @@ static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 
 static bool sun8i_vi_scaler_is_vi_plane(struct sun8i_mixer *mixer, int channel)
 {
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return mixer->cfg->map[channel] < mixer->cfg->vi_num;
+
 	return true;
 }
 
-- 
2.48.1


