Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD44EC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 11:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVjXcxxMsdmEbJ+VsOzVro/u94OYEqvrEHHHDKDTkw8=; b=XVJBOtAhtoeZ+hjE/IeV3K/e8D
	6X/YPSnkF8YEoYsOQvgoGm77DMMqI9ydhWjsMBbfj2699Z+rW1IXDVAzhZnIZGbxtPVcu+Rt5KLzm
	Z7LB28N9nR22wzEXxD6XnGAfkB1QUFU6OoqwapOFhpaTLOT7toaZlofOitlp/i+Gw2gAgLarDB0Z5
	XnVnRVZOAQrSynpV/QxJkNGd+nJjmHm0+NmrgFxYHcMHBZySmu0YublXmZX/PRMx45xC6iMczKoDm
	NT30/hEAJBpXe8xhuRRZuXpL03A3cthLrHLHSXZimxoLK2CkEEV1X4KdlbwMquqfRy6V7ruPzSq40
	7TfoXxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsnJ-00000003Chr-0Dim;
	Fri, 16 May 2025 11:00:01 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsfc-00000003Bcr-3QQi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 10:52:05 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B54EB25400CA;
	Fri, 16 May 2025 06:52:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Fri, 16 May 2025 06:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1747392723; x=
	1747479123; bh=XVjXcxxMsdmEbJ+VsOzVro/u94OYEqvrEHHHDKDTkw8=; b=G
	CBPCmo7VklvWGJCQBgTxwB/e6qtKSXXHu514YgWNvmj7XCTF5ZL5MFRcdlvgP8y9
	6D4z1tl4NtS9l/OTOJrwd+g0pTH+GG+ZBAA9nJD7wfSKka1x0ghNdKoaX71bykN2
	mgkMNI5afW3K9W2ZmWziocuFJoN+3O5vYh6F3z8dH/WBFv2jjhjCWaUd6ZlxP0FX
	mO3Wg8xCl5nrQowaUUYJ3He6Z6Rx4dl97Eqhsurrn1aJiKrRbjY2+gomysKXFmke
	eON9luXErmOUJtTRKJaqrKWG5vx1jD7rk2fLrwSKbqcP3Svk1CAWBE8/hhtA37oR
	Q4NObS/OdZX9W60EQm2Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1747392723; x=1747479123; bh=X
	VjXcxxMsdmEbJ+VsOzVro/u94OYEqvrEHHHDKDTkw8=; b=rS+fInvp2K+hBp/Ya
	TsBjO3hwUtWiluTgVmCupFgdqM5fmJ4vPvquiV2rfBMnoGq51gXruYjZVgBMvvor
	+jD0i1CA0OR+N8IB5uUHJSp2xdBZHZqmnRKa492MgzPtTjV9Rl93nwszpZeYD8Ao
	az69qUiXGjyym3C94keYL/q6V3a87BqvmaIiM1UzPpCCg2YXIcduvp58A3Z7ZdqH
	8Ykh0ASU8BoP4pntFS6eZJmSQzioe3vohdoC0feT+JGk/DgsMupMZGOsWkaXmOz2
	c5hZiyEZPHXbp2EIyB2wr6ukiAR8uwBjXaVKvMrmO6FER5+zIh2SermubPGky1jT
	Ai1Nw==
X-ME-Sender: <xms:0xgnaPo0Dt7hokraqSkbxz5cQnlDzFmmN19Gzxa0saZvNgY6imxngQ>
    <xme:0xgnaJpGEzo5UAokSQRzlT6wgBWX2LVK7-wfPuWUIvbUQfaCXIQA4CturC414I8T5
    2nTXU_GVCKa8uw6tA>
X-ME-Received: <xmr:0xgnaMPD-6SuBc72ndI8BWIGXP0GfmEwqWEOjQnwPbqTEkAman-_zZak3MaEH6l6YJZqV4ryvgAB5pNPxnOQ_xvngz7qUO82HeAGt4g0SCos>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:0xgnaC74ukcGm0zpnDnbfsB7XSRkg9i-cVbDZWR9zIqqiWLAg6XK4w>
    <xmx:0xgnaO7DQHA6Z-b1v86OL0Hw2VXOAyREv4AqRSwtOcGK34kcusZlWg>
    <xmx:0xgnaKjc6X-EEHWzTQVj4BFE3hZ-_jHBSOCCr-5GVdmYrKGigdwm6w>
    <xmx:0xgnaA51TyB55tZ8Q27kyJzFJeMM83z_7_ph5tmDZMemkBXdTFPT7A>
    <xmx:0xgnaCTTfbNlCg18X-Is3OIa4zKkTJdkmv6kkeTzhYSzLlzREF5L4Bst>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 May 2025 06:51:57 -0400 (EDT)
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
Subject: [PATCH v11 3/8] drm: sun4i: de2/de3: add generic blender register reference function
Date: Fri, 16 May 2025 22:44:20 +1200
Message-ID: <20250516105101.11650-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516105101.11650-1-ryan@testtoast.com>
References: <20250516105101.11650-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_035204_904152_48199A7C 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group.

Prepare for this by adding a function to look the blender reference up,
with a subsequent patch to add a conditional based on the DE type.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d34e7fb3143a..b75008d05fc9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -222,6 +222,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == SUN8I_MIXER_DE3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
+static inline struct regmap *
+sun8i_blender_regmap(struct sun8i_mixer *mixer)
+{
+	return mixer->engine.regs;
+}
+
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-- 
2.49.0


