Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E46C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jPRji7f+itML8q0+tbGPOwVQxf6bxrH9U7BpgdfIMA=; b=YhweXe4Z8Gzs/qkz5AsdorWc4o
	QkPLm5KezGW0sIW6fBSsQDP20wXno84UcVgC1l9nGCyBj7Yg0qj1uSYI1kVEqjewzDZ3ZiTLJSLsV
	v58HQnk+TEEffPwlFWp3il/NTrkfm/8THLorYt940LaE9U0be7u5QNuHAbfE9RQYT84nBZhQFtqzB
	uKbBdfhPfEUAejT/vUG9QwoJEptXypz3NH2yxKbJUae0jgogtUoCVThzYs7RnogBupIT5P+2i/Lrb
	CxOCP4L3FPqWM39MVNkEp9sk/Pr5SIXUp60n2sQgghmdJHW69gyJ6B3vHrI1KaZhe0UHPxaRQ3y6g
	YKhExPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDl0-0000000CoOz-2M4B;
	Wed, 28 May 2025 10:11:34 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKD2y-0000000Civu-1RvN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 09:26:05 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3F0B525400C6;
	Wed, 28 May 2025 05:26:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 28 May 2025 05:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1748424363; x=
	1748510763; bh=7jPRji7f+itML8q0+tbGPOwVQxf6bxrH9U7BpgdfIMA=; b=e
	tNgrfp+JHJG3t+SPmfAjZ4KFX7Y19kHx6nNuU88yVt/5gAaHmDSgOAkhlfSmZFCx
	QLWsu3IZTnrXbDluVSyeXHgrcNhFHvcLvYFvR9n37qASRKEMz7oQcrbIhwdP702s
	5wSiG+kp6ELWnEUJFnjzkgY6eoe4OSCviVjIhJiQ/yC8xQPndZhtL4jm+gBg2T+D
	Rdhq3g18c7XJYNimmsToGz1BnUyq10JqUXTVmPb7viG/tLJrZvFyXTe6egKVRED3
	/STD7VzkgseRaGM0mpCiutXVBaoqOY6bdeegXYGgk31aeqZrRWnZwigiJUg4lRnu
	ujclq6ojE+KN7oE4LuH7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1748424363; x=1748510763; bh=7
	jPRji7f+itML8q0+tbGPOwVQxf6bxrH9U7BpgdfIMA=; b=dr30cG0kdUGcW0pI8
	O3/NSUT07+FaDf0BCAmavU44hsW9s8FBjoGqzLapFz/ZOuG5IljXOH2B/PCg1TSK
	tQHymyyJe/9pJsVf7F3cyTYSnlVhIo+hAWcxp773Yz8jMhuCYZLzHrP2M0SpdU2J
	6z1B6oQpuzO7vUPrrWy8HitX0Kc+4wyfoVhLuxg3O5GlH1iH4RWB63gGJUnpVJxx
	flcMeO2/w5G9w9mjas8L+YLhKGqWRT72QYLk1ogJxjA94BH6vBCSzk/WxwgVUW1f
	jIIANIkbBzPUzLPIdWdoup1jtNr65Y1p3DWsFxfQ7r5KAzDys1WSK7UR5QpoQFMm
	/X6Kw==
X-ME-Sender: <xms:qtY2aC1DR_P-JHY1HPv9nuPBlVIU881GjqrsYuuibyE55hocYyFXaA>
    <xme:qtY2aFEkJNcxHGfz2ZScTpPfmqt8LfD5cX4MBZ1_rW2tEXyE2QWiRNInJbN5uGtLI
    G70zRtPkXlQyR28rQ>
X-ME-Received: <xmr:qtY2aK6UEMPQgznoT4nx6ZKnTfVoVd94svXA6yIyKfDFaQ7cJe9bD49ih73l0IOQ5u4xzbIoIiq0vls6K2PRi2YaZzfiIQytQsbqljTwrTRO>
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
X-ME-Proxy: <xmx:qtY2aD0O7yx8Zv6gpJ-fE7OIqtxtxjKfDLk6-c2uNv66AS0VLyhEZA>
    <xmx:qtY2aFGiEyvS_Ji5DJ_kDL-vUgO7GJccfu6PvjY1u7gnMRuAGpAxgQ>
    <xmx:qtY2aM9-w1xeLWulXziv2TH2tzY5xT90ty7wRvC8Y6T4w_liPueOtw>
    <xmx:qtY2aKmJnP44684U79feYngEux_WEvgQ0g68prXdjKnhJH3JZFrnaQ>
    <xmx:q9Y2aDf7y_QVWDmCaRuYYQoZGK-sAEQr8b30cdgK5tX8qGuujySqxtNA>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 05:25:56 -0400 (EDT)
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
Subject: [PATCH v12 8/8] drm: sun4i: de33: mixer: add mixer configuration for the H616
Date: Wed, 28 May 2025 21:22:13 +1200
Message-ID: <20250528092431.28825-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528092431.28825-1-ryan@testtoast.com>
References: <20250528092431.28825-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_022604_448083_A30F3B19 
X-CRM114-Status: GOOD (  11.50  )
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

The H616 (and related SoC packages sharing the same die) carry the new
DE33 display engine.

Add the mixer configuration and a compatible string for the H616 to the
mixer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v7..v8:
- Separate DE33 support and H616 enablement in the mixer.

Changelog v10..v11:
- Convert de_type enum to uppercase
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 13e712382010..31a8409b98f4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -799,6 +799,17 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= SUN8I_MIXER_DE33,
+	.mod_rate	= 600000000,
+	.scaler_mask	= 0xf,
+	.scanline_yuv	= 4096,
+	.ui_num		= 3,
+	.vi_num		= 1,
+	.map		= {0, 6, 7, 8},
+};
+
 static const struct of_device_id sun8i_mixer_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-de2-mixer-0",
@@ -844,6 +855,10 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-de3-mixer-0",
 		.data = &sun50i_h6_mixer0_cfg,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-mixer-0",
+		.data = &sun50i_h616_mixer0_cfg,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
-- 
2.49.0


