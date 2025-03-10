Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA0EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ph3w5BGlFyH2zwSiNWVZ5MH48BfIXv3Sx1cCe/xo8EY=; b=hJhndnk1o+8WmxTgIAtrBi03cZ
	7vppxE6ywWkUs8K1pRdGb0QSbC2BMhadBL7hTULkn+hFjXTIi3BwKAnnLNyOVsGy/WAs237sXuliy
	P2DLaE4/zEF+CnY1rQpp4Sskxn4rPeF6yN5EQ4553iz7AMA6dw7jvPvLU7BiE9yJb/Mvt6PryJVWO
	XC0eeFcVeLOe4QIqgRUkF/bMUaLfbT2S8EMIznm8fmKf5hu0GiJfUvNbR+rqzU9nxBmVWaaNwj/1N
	/VVI52aJqtTooF38xvOsMWFen2F2BUxO47tVzQl2ctccIchR37JRzMZY6qL9F/II9zbkp5YSMymB0
	o60iUpMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZY4-000000026PP-1i0b;
	Mon, 10 Mar 2025 09:35:48 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZNV-000000024li-0jxM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:24:54 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8FFC31140154;
	Mon, 10 Mar 2025 05:24:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 10 Mar 2025 05:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1741598692; x=
	1741685092; bh=ph3w5BGlFyH2zwSiNWVZ5MH48BfIXv3Sx1cCe/xo8EY=; b=A
	Od+e0xAIVpFp3fjCaPhbjFpeTc4vyInlHe22S5W+5JRrThCP6oOzgaj9ZhR/02v0
	OioZw6koQ86di1jZq2o5xU3+Jneru1WYRshHbkMkeu9d6zPuMSWWVkwC0ygFOLuW
	2I3/c5Fu0JcwNnz6zZd2mCpHunhip0ync2/cyz3UMm5BNw04AQr093/pLSmxfia2
	sg2VWcTs/npkwBxh/d/+FWSu5VMxYNukL5WhW1wcG539IB9jMjfSKOZxFCMcufHU
	KVaShs+O0s2DZ2GZAf/K6MhamhybEHOZWnCfjFIJX6+NH29TlRSYk1KBV8QyCcnp
	jqXv41qumV6mAHL+5IqAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741598692; x=1741685092; bh=p
	h3w5BGlFyH2zwSiNWVZ5MH48BfIXv3Sx1cCe/xo8EY=; b=JJGyEvFSfJ/t/rxP1
	mcZChDEgfzmJxRA8RzE9zvpuawjgEYk9b7FnHjoQafuYM+lXTZGI/FkwF+Gs/S6+
	9bbRXn0bpUWW6byvgROQs3O07epR3UKjfBQiBhfB4E3o+I3AOeoDDIx2cwCZmVWo
	kSSy9qEikJg0weFvPCwyKUdK/xVjiQzAqxHWeRXzVJhtt83NP+pR/tzJP4aWNvK/
	wnPALwWXf4joOuSyutEz3oxJDHnWGfo+8yp1Fsb1DbQ5T1M/qRP2HCjYHm2QBB1G
	dSwjTXnU2Oo2SfAPylVCG7aAl6p4Gp+vR/knVy3pAAt9EEOydlLPg5UrVQJTkCQ8
	88OwQ==
X-ME-Sender: <xms:5K_OZynwi1coSuF-TGl6PG9RLvx6Z6OCj3I4nMGz0yUHM0_IUZUvGg>
    <xme:5K_OZ50zHDw3o5jh1mpHRBwABfMRZncVUjlLk9gv2W4mGlsI1SBmLqb0oKyX9u-ig
    xIx-nnDGyPYzCe0jw>
X-ME-Received: <xmr:5K_OZwpgfaCGg9mkkdZjPYZ405QEC8ElKXK4TDVz6ygwm6Ew0LyGS0YzuQX5VHyOqDAT2dWRbEGJVu766YJfdSSJ3f04YRGyjqFPxJ6IJPXS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5K_OZ2lMxnMmLX-pna7m9U8PALrKbfpq53a85HUicGlaNkYvNKiiWA>
    <xmx:5K_OZw2jJC_e19pOp-EwDRgA2a5hZBGItRgUTH6sKxr-jlpyER9nmQ>
    <xmx:5K_OZ9u2-ROvqGe1F57va2K9x5B5W1FalreULpTAmvxfX7tkVa6YBg>
    <xmx:5K_OZ8UuHcrswd1V49554yz4jysHwLG87-ZluNYtnabM2hBLkTjcRg>
    <xmx:5K_OZ9c6eZpVEZySgyLzGv_6X21W0Ga5GLIoBMOX80-1WPRJnAhN_CqR>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:24:45 -0400 (EDT)
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
	Ryan Walklin <ryan@testtoast.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 06/11] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Mon, 10 Mar 2025 22:09:52 +1300
Message-ID: <20250310092345.31708-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310092345.31708-1-ryan@testtoast.com>
References: <20250310092345.31708-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_022453_286577_2069F1B0 
X-CRM114-Status: UNSURE (   8.91  )
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a clock binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems
---
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 70369bd633e4..7fcd55d468d4 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-de2-clk
       - const: allwinner,sun50i-h5-de2-clk
       - const: allwinner,sun50i-h6-de3-clk
+      - const: allwinner,sun50i-h616-de33-clk
       - items:
           - const: allwinner,sun8i-r40-de2-clk
           - const: allwinner,sun8i-h3-de2-clk
-- 
2.48.1


