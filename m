Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B586FC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAmJYyEumzEou620QY11fdpDk+WMryARn7BRuJePqUo=; b=LyFqeHsl8IMoS5+6JlK4mMw4HA
	/PNj3d8Mqqi3H4xxafulNbpWmBhbOSMkCOouqvRaSHNKXqd05L5iyObDJphpIGcLMTF3/FgkswYWF
	xxzfupFE/XVfFI6QXHfocT0jC3Un7Wwk3g4V4FFy6niWZII7cQL+3DqZnjNPIc3ncT9Uk9t1iQQ3q
	Gccj8lrg3orX5HzQKvLN40wTkphUo2g76DcgfF1lwgrJVrc5jUZAhOaF7Hmc/rV00/Db+6ju93vsg
	n+F19N6tjilirafwmYFK61EKAiUCodP5xaNSHWnqYQs1f6Yguw9PXPNGCQZ6HD7zKl7toojghQhmd
	t+bVpbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZTH-000000025cb-1PT3;
	Mon, 10 Mar 2025 09:30:51 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZN8-000000024f7-0Gz9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:24:31 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7265C114011F;
	Mon, 10 Mar 2025 05:24:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 10 Mar 2025 05:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1741598669; x=
	1741685069; bh=TAmJYyEumzEou620QY11fdpDk+WMryARn7BRuJePqUo=; b=Z
	8yrxwY/Oz7joEWm4RohGpeoObdIptXmdxxqQH/kIIKjHbLbsCBE+zsWQy8SN6axF
	epwihAZtoHfhSrH+trsGbM/B2KYqXYS5RykHjAXQSB9fTmp7tA0DdDgHGSTkuwrv
	3CFnYY2+KynxcfL1RB3hxmRkjeYTYMobLztrKGiHDefyEyb4AEfNTu/uDTmF1r4K
	aRD+Qsyu24du2OhOF0SbsuasShxQhUHSIHbW7ykKkKlXsswDmInFE/pY7QR55Pa+
	S/gmxFuy4KhXMGvxMFE8Fnvzn+rhPaVmXx8yFo3z+9VAX7srg6BfuXot2JTAs7dM
	YvowPLhQYxKKFb9s6QSvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741598669; x=1741685069; bh=T
	AmJYyEumzEou620QY11fdpDk+WMryARn7BRuJePqUo=; b=VBSEQ7Ua8Ok6PRaIU
	2tSYUx6XPMf7oGvvIb6lZ4YsBeRqTl+nhYgHdyP2fiBOMSNkHFPgC0Yb1NScWrQd
	9BOpgFj8q2PZjaB1abvXafknYXanc3YIly7mKNtgZppnoILO4r5sxX1tbdU8ffP3
	T59Rz3ecDjBBZw/1Q92yQo2Q5Q5bNx0wWo6vg5zvZaKp9AmfYEqsJ/kcTfX75cD2
	XFFIu9h1hrxdV4GMKfjtPA6IaMBTOe5xX3cSflhKImagyBK2SYzH6stwKpM0Xzv9
	aEGatj4Z6QSBr78OBplOoyrEAVgKmSQjp50fMkFY0iOkjh+geZ5MXMLa1gGZ+ESw
	naNFw==
X-ME-Sender: <xms:zK_OZ6MKrk7N5tpWgqNwY_ulmvP6c6becnLuDDb9v-4wbo28P9YVww>
    <xme:zK_OZ48V402KYBASaHG9Vv27GZU07Pz4GOL2h7eNFR1zGCuCxoJD54sdZi5PrUTGI
    Kp4qGwBCnqBq55-EQ>
X-ME-Received: <xmr:zK_OZxQAQwgyY60oMLANYPhct5J_g7gaYceFWo1nYaWUXCgG0OT0jDT4VYqJMo9mFZk2Vm_MusLBq98J0jkmjzlR72zDXwj4a32E6Li_mB4i>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:zK_OZ6ts7GUwpQMAhjMfNNdHkh_J3OerBtxO44RJCXr1M3RjSfwqEg>
    <xmx:zK_OZyerM4Ovj9MQh3wiDADZkl5hSHyUnac5IGFtRuvu67m9qUVrIw>
    <xmx:zK_OZ-2Fn2MS2s4GRoiDM9b-YOEPP51H29hEdpgw0ITE37X4zJbvZA>
    <xmx:zK_OZ2-FWCzaCJBEE-8NIrkEqhYiwH2VnIOU9n9JVGKV2QTs3FB7ug>
    <xmx:za_OZzt8L4iRAXjkMCfucEnEtOxktSXpCy5nR-QTiLKwqF6YwQyFnyDV>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:24:22 -0400 (EDT)
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
Subject: [PATCH v8 03/11] drm: sun4i: de2/de3: add generic blender register reference function
Date: Mon, 10 Mar 2025 22:09:49 +1300
Message-ID: <20250310092345.31708-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310092345.31708-1-ryan@testtoast.com>
References: <20250310092345.31708-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_022430_171145_BB11C419 
X-CRM114-Status: UNSURE (   9.76  )
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
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 7fe5ce20082a..43c413052a22 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -217,6 +217,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
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
2.48.1


