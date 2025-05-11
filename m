Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19924C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uldQ8LCAFzpaR6aFX6Xe3GWTuh75kNW28WcqMGZrNJo=; b=sXZdhcJ8UYHlaVzOsHszMaUcaL
	/QtFoWef9TztT7SL+cevya0ACg9m7Xi8CPifUnEI+iq7OCP4+ikY0fUbUv3WJB5uM0i/+x07vDdhA
	E6mHwDLj86X7NKmFIkL957+AEwMlgkWsv4ZKCFnBGFP6W2fYDtBPlMu2ApLXWO51bR/VTkky+cfXx
	xqEbVKQsZX9K7oKwrl+nZNgfJZacovD8xgUYNneozRiwV8Ys7MATkclCFAocb3jNJx8ViRfcnJjy4
	wTskBR8vIyGdgVA5cYHdUoXBZQJ4dziwGsHepGjJ9DmYpmaNfgI1oPoqGQnK289iKhorUKy5Nrp2B
	pCvYe4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE4LR-000000077Us-3pIe;
	Sun, 11 May 2025 10:55:45 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE48I-000000075zf-1FL7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 10:42:11 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 23D1825400E8;
	Sun, 11 May 2025 06:42:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 11 May 2025 06:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1746960128; x=
	1747046528; bh=uldQ8LCAFzpaR6aFX6Xe3GWTuh75kNW28WcqMGZrNJo=; b=q
	XFPulg7EpozxW1n9MMdm3fR+2/kXYLFqMsd6qMcQJ0mZ4PkLBYuj3EMMMkE335fD
	OJhqzGr9s1AqmkH7JTRjCKJ+6TNxsUB0wGG9nL6pO9f57lpfZdW3JCckhK/JvX+u
	QlsthuhuFbRtUaXmmr2wGIk5k1OR7lAYqQV/TtKeiWoRD5XaJFxdn4yeKOe2Le5G
	BkHXQbq/MeXhAYisUvdC17pxFZxc0RRBC8b6Rjs3oTN4fBYYl06MHnE1c9Jj3S0K
	pjbl0XdfCJ6IklWhAh4c/DoEiLskYPwQ4x/SkInSeckSPXkUCWFHXT3o9ajLo3WL
	6G+/Xf++mtQdI3fv3Zvuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1746960128; x=1747046528; bh=u
	ldQ8LCAFzpaR6aFX6Xe3GWTuh75kNW28WcqMGZrNJo=; b=qSzX/SrrI/vbrq+91
	PtDfVcaLANfMgTp8ewPL5lrirG7cmV2sZqGn4qZzf45G6vo7SV5vrVw9oMEhj77p
	O7pU+siZLDcurcoScHqHleEdbNnP4eW0xKGwpa0w7G1tu36zIn4gjME/7Y+pqluX
	l87cfITzamY54QVSLaXIImRW/TtnCRa1r/bwqK5h/VqdGllgv9Oorgy2wz5TutN+
	Tt0hsAFRQ0ZJJBvUAKNgpRk8qxhaI0HatBnMoFp6/4Fr4sD7beOPMe/O2PxeS8Fq
	1dkquWjzHV9E1oqUAJJKTs89Ppaqyhi6nFvsSbI5fBrt8nHlfPUuJ5yUflsrxPkq
	OVo5w==
X-ME-Sender: <xms:AH8gaFd3qaHm6uohgZfKFI0k8JGNhQiB8ZO4JkR8BDvCPm0rARMYZQ>
    <xme:AH8gaDMWitQVSpWNpPAsoumus6VlHMuFl97Dz0DyIggFuGMgStKtry9YQB3qThpwx
    PVL2fYMp03QOV8gYQ>
X-ME-Received: <xmr:AH8gaOidITdAVbnYz037PV-Urj1VyrD5zj0gV2sUAFIj-ST2LATKavrvvTbsKvRjBFbYKjCkYo70sTgDqKIUk-c3EtA_jEYo9tmdvaIIMYwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:AH8gaO8X8rPw7pVrFA68n2ST15CDC0Q17IJ3Po08JLdIJoeHIEg3Zg>
    <xmx:AH8gaBuvLK4-zFicIyQ1UBIWoFEtM-VbLnwXpvUxGIGqMvSSPvmu2Q>
    <xmx:AH8gaNFsI6bQt5lW1bWwfFbKgK-mVKSbE4-QtrmZhUaMxplPKtYCbg>
    <xmx:AH8gaIOsIpIYtTRzkXE8r7YxRQ5dWA2BfPdKI5DuTCYTAQOFS90JOg>
    <xmx:AH8gaFURImcHszZYutqLEziJouVOYWl7k-AG4_9hZbzD04U2pG-4WHJ_>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 06:42:02 -0400 (EDT)
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
Subject: [PATCH v10 06/11] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Sun, 11 May 2025 22:31:15 +1200
Message-ID: <20250511104042.24249-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>
References: <20250511104042.24249-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_034210_391882_83F0F01F 
X-CRM114-Status: UNSURE (   7.96  )
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
2.49.0


