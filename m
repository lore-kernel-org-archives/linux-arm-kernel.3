Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF52C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 10:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEUpIG2TzgpcOyqfojuCbarLrMaxkRzVmGHH2WlKz20=; b=RK746a2SfosqXJGYl0iAa6DriE
	6UEmlgknjvPucktHN8qNR2mxHnmHW1qftmS0FMNR4+8TF8SUc9lYvbOtkWPZb5QLdIjouNBb008xh
	IRHfMccZ26EDtaKAbz7KHLDY665uaZDPv0cHKy/iuzmEKEfLUb35lOhFM7OmtXLrcvXskC5B76TcA
	XeItGqw8tvAehNhDrr+3b9U+E5wcakpybT1yYzYttZh4R4CsQyoBNAEXHXemWcVpCufyUmIwb4rL1
	j0LpDM5GOgUIcaEOq/PVW+Y6n85FTODOn5V/K5dnfy1gX/TY06NzxLFbKh2Mb+xRZX6TMfanmWIoP
	ApPoVaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDaO-0000000Cn4g-2cWB;
	Wed, 28 May 2025 10:00:36 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKD2M-0000000Cihk-0udF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 09:25:27 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 6D9011140181;
	Wed, 28 May 2025 05:25:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 28 May 2025 05:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1748424324; x=
	1748510724; bh=zEUpIG2TzgpcOyqfojuCbarLrMaxkRzVmGHH2WlKz20=; b=K
	A7wtjNbGt2fpB2AqGZN357lVU5m8U8D68RNrocol23/uhXCukDxSl/JR6gDPyfh4
	kE7O4tgCkG08VByHTIf6wUJCM7r65zXLJTLYXDxOyXP2nSwMZw427B4ZuDhPExoa
	T+4JjirXWELt1OG6+tBjTRvmwnV9BLNFpBKR8PfT8wa6mLwQ+29aVLaZQ+IoZKHi
	gZa3KmVLz3BCsoo+9tyDve8n8ASlTd/Ll5HxlCh53KjY4IZ6B9DH3oD1Vehr6FSa
	FmT9uKCw0JL/ajkwWhtY7KPQjBCExdQwjC6v+kAJ3iqAVHtzYu2W0bXHtWEr70vq
	zBalVNC964dE0NNMcTyhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1748424324; x=1748510724; bh=z
	EUpIG2TzgpcOyqfojuCbarLrMaxkRzVmGHH2WlKz20=; b=Th8PIpkpA/nKgI3CT
	puM+o51wSOPkr7kfWJFtsPx1ZPuqasFzEbU7bn/dg7lnn740NlD18BK61fqfKuSF
	DAv42p94MZZ2RXLdXxyY867VjMQSS5mmz5rMizRPo6VoWO+YWYyAzhdApmy0nW3q
	pEoop+56MuInMb5z4rltzvc9ck9x50LiNOjMl93EEVbclMOMKliY7FyJM+HyclXV
	AOdZTb89Hkb6Q9WxeDuh9RkkkWY0RmoZgHV8ejOY2zBybcJhhsesqxrYld+eXdoy
	SM0X+vrYSL9hz+W3Z95W0m/5wyU30gai73+lrOMIqDB70vcNmbBX7ABJYB9bOYpv
	DiIKg==
X-ME-Sender: <xms:hNY2aO4f-piaEKYPZTtXRit0McU95jdtdFVYY-4d45NzeDjx5JcijQ>
    <xme:hNY2aH6Ijfb7n4niAeq78yAM2aiegYpS4KH7z7stMANJWGZnKW0kUe4AxzNukrpC3
    5sA2O08Bc74ihV5YA>
X-ME-Received: <xmr:hNY2aNepbDJy1hWDwB4tXiL-2Q2O5fv4md5Pu2t7RuiaX6W3S5zea81GgfUECAgJCnhOzrzrGi6nbqoLNPYYh6qKmBAdzaQyuVvG_y6hluGc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdekleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
    jghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhi
    grnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvghrnhepffehieffgedt
    gfffjeetveegfeekleeileekveeuteffteetudffveegieeiheetnecuvehluhhsthgvrh
    fuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgr
    shhtrdgtohhmpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhs
    segtshhivgdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtse
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhes
    shhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdr
    shhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhoh
    hllhgrnhgurdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:hNY2aLLm8mHxIaDPUw1xZXvWOagIrT5VgB18xrBRJYSz-0dfyxSiPA>
    <xmx:hNY2aCLqCzRAiR8KWGSSmofdtDPRUEEbvohz7JAdCa9ckf6xlYb6_w>
    <xmx:hNY2aMzYq7HJvnjF8UpUP4BmeBKCqN2AvEQsNj4I9oiAolmtGg7Cww>
    <xmx:hNY2aGIooEEonFlMLZVASSWkKW3_lRQfQuJ29QMqVEMpaNYtT79b-w>
    <xmx:hNY2aEzI1Zrn_rspazwDSD-WLH8_ydUq1-xz82GovN6HlDoCxHMnHC0R>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 05:25:17 -0400 (EDT)
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
Subject: [PATCH v12 3/8] drm: sun4i: de2/de3: add generic blender register reference function
Date: Wed, 28 May 2025 21:22:08 +1200
Message-ID: <20250528092431.28825-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528092431.28825-1-ryan@testtoast.com>
References: <20250528092431.28825-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_022526_307274_D57E5EAE 
X-CRM114-Status: UNSURE (   9.86  )
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
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
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


