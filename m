Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946C3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 18:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3pfBs7YzSNuzdyOnOJTsOCqr/BPrhVKuBEh6b67oZY=; b=BoOX1zqw+26owwFTFMG1PC0ZXT
	WFyOvRIGV7c7oQ2BU3VmE2aLiZ/QW6RbQXB9hjNXgw0xO8GTo3ItbfGj0NkIn0uclBTx4SnoCW/kI
	RFaAgxeFv4sc7Mf9JYBQ1O1y6f+ropQEJ+ihQnKH0YkCzK8U8QmUwSqSZ07rCx0oFl6uNH1BdNp96
	ZHuVFVszvGjdooCOgIWG9qx/Seqo9XzjDx5ySZc8h6H9RRKYcqu/cFb13Ow/aISxHN72s2IBhYDw2
	i7g0ULMNQDJpPr4YJF+MboBgIIZvTDWZok3L4w5tGE08IOynpLOPjrBi5JSvlmljtAZUbQi4aOESd
	8F0DagSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjfu-00000002NKa-1ObD;
	Sun, 16 Feb 2025 18:47:30 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjXD-00000002LzV-0su6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:38:32 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 05F4725400C3;
	Sun, 16 Feb 2025 13:38:29 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 13:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731109; x=
	1739817509; bh=z3pfBs7YzSNuzdyOnOJTsOCqr/BPrhVKuBEh6b67oZY=; b=I
	ZH4CvbkibLwqgw7A5KLd3ZquJ04+SnVZgYztHX59QwAJK5F3Sjx3yoVn6cG1cQ62
	9UbXUsJTHUJc2K8U0s8JbW2mJKOrSk8uVEz+SRFtArYKJ2x4Tw6e5+K3pNOOpou+
	EUOeZLEycPtbZDzqnPdHSWJRD+p/ovN6gQLkD5Wa2tONN9mzENOdcmfS/QyI0JcS
	TtL8CrfxUNSNYfh+mCxuoRsEwnS9sEnSpPtnS+OXkU0Iz/uJmn1ncemVMxln+5Az
	eHy1QOjMhNhcmOxYUlnbl6lqBqoI6TCos7wmG+fGHH78wpuoyzjkey3wAB4c1aVk
	jTTSMe/wYk+NWkxRIilKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731109; x=1739817509; bh=z
	3pfBs7YzSNuzdyOnOJTsOCqr/BPrhVKuBEh6b67oZY=; b=pyo8PddjzwwHFbn2/
	jdFx/a7bfmpTo11nuEqnjDcxnTouexN8Ie+KxuRcsTuY/ZKGhmGeJN0+t5sHdrwk
	a1njifVVaZ5wu4ztZcWxHp3BuW9h4dDKQogpV9wH8+b/2ROGxp9qIthCVJ+Y9mlu
	aV16V5K6BKLn8wSzV26OSxUAUOqgJa1/T9wYsa658Jij+3zWhYC6IUjGQIdUttLF
	K/Jpz9oZeO+u/i5ITDJD40wZ48nb56gy0RfhO6dmxkmVps8Nwhd1lOvLUeLAf/IY
	J/UyVAc1+Tw7D44GFoWeGXvVKyZV3dQCDrlBLCx0QlOmwDzoe8Ag25fkIPe5Aixf
	mzVZA==
X-ME-Sender: <xms:pTCyZ1ybYtHmVQZCKaZkSlsPHUUy-U_ggDVsiJd7ttnfFdPAlW8p6Q>
    <xme:pTCyZ1TqVgfmo80AZIKPVBxb1YPjAqHlIzyHpqvuULGMi7IQsUJIQZwWgu3VGQ6s6
    jaX1WzWk_AqWP_lhQ>
X-ME-Received: <xmr:pTCyZ_WVWQtZrVfpiU7W6DNJv7HXD9eP9HCKdaNcjWfMgCQElv114Lh9ZI5ruh3cSZUndVx7FW8j1rY3ZxO-voTQDz-G41s0X02ESLpG6lqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:pTCyZ3hjnkphMLf3Wo15SqnPww0qqhjuJFjKCAWakrmGxTdLEIsZwA>
    <xmx:pTCyZ3DusRHChQKKbrKMdhUMWS50wOVhU1Df-7seLwcvAx8e-oVsMw>
    <xmx:pTCyZwLCIdW-wap7mJ8CmYIyJ5yg1W2FmowGA5rII2oB80qTWKsOQA>
    <xmx:pTCyZ2D4IhxgITE54EwkMMV_fdHHR5-nYfLG_B99pU93xaJhLZTrgw>
    <xmx:pTCyZ5yWkyXLFuPrRlzuR0LY0SnuA23kAAsvNctp7Oj3VRzPbtUmnuIJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:38:23 -0500 (EST)
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
Subject: [PATCH v7 07/27] drm: sun4i: de3: add formatter flag to mixer config
Date: Mon, 17 Feb 2025 07:36:07 +1300
Message-ID: <20250216183710.8443-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_103831_301214_A4D97B25 
X-CRM114-Status: GOOD (  12.48  )
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

Only the DE3 (and newer) display engines have a formatter module. This
could be inferred from the is_de3 flag alone, however this will not
scale with addition of future DE versions in subsequent patches.

Add a separate flag to signal this in the mixer configuration.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b41d33baa309..a170f68708b1f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -717,6 +717,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.is_de3		= true,
+	.has_formatter	= 1,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d7898c9c9cc0c..8417b8fef2e1f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -163,6 +163,7 @@ enum {
  * @mod_rate: module clock rate that needs to be set in order to have
  *	a functional block.
  * @is_de3: true, if this is next gen display engine 3.0, false otherwise.
+ * @has_formatter: true, if mixer has formatter core, for 10-bit and YUV handling
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  */
 struct sun8i_mixer_cfg {
@@ -172,6 +173,7 @@ struct sun8i_mixer_cfg {
 	int		ccsc;
 	unsigned long	mod_rate;
 	unsigned int	is_de3 : 1;
+	unsigned int    has_formatter : 1;
 	unsigned int	scanline_yuv;
 };
 
-- 
2.48.1


