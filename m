Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CFEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVbx/e/0O8lGVMfw6nGdAuWIs0CL+nJx0lLTRkCftPw=; b=DCXdookKsMirMRip8m4AJ/qfj5
	Yy1I9u7E23hcrcRh+Ytltvw5G990Ew17OkYAQbGWIlLzCars3fNNul0X1iiLrLCu36RVwrgCCfV5m
	nUErtaPP8jS0a1l6F1Hh4RhdPTQvKtJ7KWBXCkan6vKYzyIVK9de9sKMAGqpglgKRnO44cLWqSSry
	Bb7OsVuXxEOOe/ZouSFCHy4k10hzZcPySf/uHcb1eKPOcs2waBn4RT9J13T0wGb5KPpdKdRylkeaa
	ZaV790BRMvizBQtDsq+fml9Zx9gc+w6fY2NnNXrKz0cbA4UkZ/mqld2O+wUJA2AD/xfJawVXDupb7
	UBZMkhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaqh-00000001WVi-2ZPJ;
	Sun, 16 Feb 2025 09:22:03 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaTH-00000001TtR-0C7x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 08:57:52 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A37B525400DB;
	Sun, 16 Feb 2025 03:57:49 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 16 Feb 2025 03:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696269; x=
	1739782669; bh=hVbx/e/0O8lGVMfw6nGdAuWIs0CL+nJx0lLTRkCftPw=; b=U
	8qY5pFD4WOPJYBWIxAs5lHDtuuJNBxP0uAA1VDwyb5+OfezqaTQ2f/wwvN8/AJhW
	XTInR+kG1tTVQQ6gVzNuCaF8Mw4SSE7OHyobIOMWD53654AO1Elx/FsCS1ZXnezF
	izKL1jjhb6lwwksi8XfchtOO2ShVlSdw178kxhUseLK//L/TYAEuJs0DtkdLFgbb
	jUEHRrQP8eCPTpR1e0GedGumA5rch+1gNMuECtlo+5psf4JA31vKT+0cgGYo2rH+
	IKSMh4P//917PJ8Vj+ub7g7rRTeMq85CKVmoM004Kv6ai2APvRB7w25T8YzpuYUE
	pMKWWGG43q/tb8xHKoyUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696269; x=1739782669; bh=h
	Vbx/e/0O8lGVMfw6nGdAuWIs0CL+nJx0lLTRkCftPw=; b=kP5lt/TgaN5MF6+rt
	tv9ioyhqfeNp9MID4xAAeSYaR9a8ZqMSjBslSdk5ur3SVyMPKHlx7alcfhlKIEt4
	MSwMlF77ifz4tAwL+oZhS2NilDAGdG5v6j3wNPkVYAM6nufHz6w7tVeXcjiZLosS
	bqx+zMkTynT3G7jHg+lvgdzzhXrU0GFg6lmrYFDvw0RbLYMaqoRrtrhyOfyetol6
	ijI2WRzEXVMC2B1HTUbnbib0pocVXOkME6ZJwB6k8cc7hxV+6KjLgvyOiee/kzIM
	kIZW3g4NkakcP8dOCrNYqTeLhxSctPS8bk2EqCK2VfF+0DgyZD3AxlSGX4rhrDcl
	GWAnw==
X-ME-Sender: <xms:jaixZ1IEKv9WevpFpC_oShQ4WItojSJn8NWJ-cYQIJk52InqlXg9XA>
    <xme:jaixZxKfU8R6nhl1oQyrOQ_AarVLiP0zYdrJwJblUoA7AbJeA1Ob_HlXGtVZOjtmJ
    kTYyz_Yh6aKuwq3ow>
X-ME-Received: <xmr:jaixZ9s-ffDDyEl9Z7cZzd4x_vcQPYw5wUJQoVUfvqIOv6GUNuAERlJRyiPehNioNyWCSilwN3ySZ3brBRUqLmTygeVg9eb-fO82wlNmNyr->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:jaixZ2bxkwziwoYYPCeKMNXFeHuZl19tkvJLLGN8DC-uOuKcI5rzgg>
    <xmx:jaixZ8YwK4B6jQJJI9UcGi4QGqLq8PxANI7unN1D9n52bZykldb11g>
    <xmx:jaixZ6BEpIv9ebaQxKZJUl-kSQmf7FOozYQAIx7vhdzrT49dEa505Q>
    <xmx:jaixZ6aJtoDldwk6XcM7sbYNOHY38QUrxdES5KkxaVziSkRyuLmQUw>
    <xmx:jaixZ4Kqqz7BAL8xleGy8fzcvpzI6Sa8VC4lOc5JS82b_BGA82S1AZ94>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:57:42 -0500 (EST)
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
Subject: [PATCH v6 17/27] drm: sun4i: de2/de3: add generic blender register reference function
Date: Sun, 16 Feb 2025 21:50:48 +1300
Message-ID: <20250216085432.6373-19-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_005751_170849_E1F64EA8 
X-CRM114-Status: UNSURE (   9.23  )
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
index baf2d024898a9..db962ccd66964 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -235,6 +235,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
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


