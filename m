Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5274CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dDCRF3dbNnQV39blNgTNc7VbdL72A86bgF17fXGjsc=; b=za9svVlm8fZGg7mW6gz7oLGxkY
	Wvsd6g7/QNJZB9/GaZRwV6t6+GrzLiwrQ3jJs8WZVhag9MotSodjepcvjbB9kat84ZFir5FBU0SGt
	cEICaTd5eDesQVB8hgnBwvLgrXJRRTdNs5vIPdbq6/G4Mdb/3cJQ3N9L8J2bRL67cr5UHXTayYkbT
	W9/3pB0HL9T+6KIrv0uvrSWpbidESI8QQs/WDUAavyuZe+ogGxqD2PxoxZmFxKKykHdBHP5NN8+wk
	k+hjFfiW1vjK2m9ExtaMzfFd2dth087bbktLDS3Kc5xAS/s82Rin8pXqVO/xFmlANOJeCMK7hcev8
	0PWYPyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjagn-00000001VWW-3I8j;
	Sun, 16 Feb 2025 09:11:49 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaSO-00000001TiS-437F
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 08:56:58 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 966B3114011A;
	Sun, 16 Feb 2025 03:56:55 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 03:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696215; x=
	1739782615; bh=1dDCRF3dbNnQV39blNgTNc7VbdL72A86bgF17fXGjsc=; b=s
	BJ8A5ON0nrmPIh1DSzbhDhbQZQTj+wp14BokSeFAjfklAWXndZngHhwDZeodokaS
	+Rz0m88NwIav9xeVOzO5BsRPHT7GvKy+7Vejz9CLvX8zUbn1HjuEb1q39Q8JBjdx
	bXamopE1/cTBL6NWC/vLIevk8wYhhUcDQLYR83h63IPULjSXzvpFJZRv86C5n3g5
	fIqAzzJPLjLcTw9NMW7KsbRrYjuAF5pRoDT55qw5i7fwt5T6OrSs0mSKFeYpMZAN
	Txoa/mciuHkPKbwtL/kO7vlg/e8c2dfLziolb2Ft+OzaDtM85zoUBMyFvexTKGCq
	OH5W5d4nuclUBnBnJHiHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696215; x=1739782615; bh=1
	dDCRF3dbNnQV39blNgTNc7VbdL72A86bgF17fXGjsc=; b=MM6GKFWVYrgq6siQr
	t5+tRhu0z/kl6YGgTdqDagApRnS6ptnYXfMOSHx8/Uq/mqHADjf/tiIBLsTCIk4b
	unm28apeN6TD03+oH9c5Da067GTj3h/3tg13oT4a4b1sOquwdUv8XAth2HfHcgEm
	SHdyRhCGAAUsIcaXtfrnzpZlWU32AJOrTqWdPSQMB6IfI2N5lZddjALsq5pQHwdc
	BPc4zocFbe3CqURmK5wWH6f2azhSBA0m4HujKH5ttJ7ckTz6VVti36R1MVfXozzY
	G64ZwD4U3iQsG7Rie677q1wLpD9nBkLKUVzJ9f8Hm+OA41p9FrNRTp63O19WwU6F
	Ai6DA==
X-ME-Sender: <xms:V6ixZ23fgVBnadPGrZTgj10-100kTjTi5r1YYrzf4rF7AEmr--OVgQ>
    <xme:V6ixZ5ErerywCHY7_VqMxVpl6_0me44KXrgltBcjbtjn9oWb6SRCUynZsFUBgT-np
    bKLZZA1xEV1bj-hVw>
X-ME-Received: <xmr:V6ixZ-4qNeLE7FP0PnE0gilDYJYCYzFidKeLLRgYTm1o5RrG_6dOHWMJg0uGxJt37MF3CeV7vVedZDKhxG_SVXGbv01JSPV8xX4LYdpNwi6O>
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
X-ME-Proxy: <xmx:V6ixZ32HgFHeceYyMGyosEffMGQStAo9mCG7NrZH0zxSRjHTeFCwuw>
    <xmx:V6ixZ5HC87bdk1PMELgsImOUJBw0YCuEjkkMDbliZwzwwwo7gzb3xw>
    <xmx:V6ixZw-6KoMXfrDayVUtf7zDrDaotKmX_IeZXYJyzA8nJpoaHRJdfA>
    <xmx:V6ixZ-lDzDY0hyuFbbv1n1xhirIPZUKD5YHpdE-9NrQUcDWkN5OceQ>
    <xmx:V6ixZxUcYvYYIc8yKgcztbM44Ykrs1nFp_or9JKDr1vOJ2rzPEjZGWSb>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:56:48 -0500 (EST)
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
Subject: [PATCH v6 10/27] drm: sun4i: de3: pass mixer reference to ccsc setup function
Date: Sun, 16 Feb 2025 21:50:41 +1300
Message-ID: <20250216085432.6373-12-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_005657_123456_BB3CD9DA 
X-CRM114-Status: GOOD (  11.30  )
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

Configuration of the DE3 colorspace and dynamic range correction module
requires knowledge of the current video format and encoding.

Pass the display mixer by reference to the csc setup function, rather
than the register map alone, to allow access to this information.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Changelog v5..v6:
- Pass mixer instead of engine now that mixer holds color information.
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 558f7a4c1354e..7f3dc6a7b550d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -148,17 +148,19 @@ static void sun8i_csc_setup(struct regmap *map, u32 base,
 	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
-static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
+static void sun8i_de3_ccsc_setup(struct sun8i_mixer *mixer, int layer,
 				 enum sun8i_format_type fmt_type,
 				 enum drm_color_encoding encoding,
 				 enum drm_color_range range)
 {
 	u32 addr, val, mask;
+	struct regmap *map;
 	const u32 *table;
 	int i;
 
 	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
+	map = mixer->engine.regs;
 
 	switch (fmt_type) {
 	case FORMAT_TYPE_RGB:
@@ -204,7 +206,7 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 	u32 base;
 
 	if (mixer->cfg->is_de3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+		sun8i_de3_ccsc_setup(mixer, layer,
 				     fmt_type, encoding, range);
 		return;
 	}
-- 
2.48.1


