Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE866C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KEUvLMaOF4POftDLbh7R+xk1UpszEm4+C2tEKJCjZM=; b=JsnHLvTXfIbLfE6vL+TLQiGXbE
	ztVkz+Zk9+hUM5AkcjApyukQCVEc17B/pQLEb33wM/SO/qa6yY06RCejdBct8h2DaYSCHNUQpsuXa
	E5T9uxEuTGBjaqFJ2eb7FpljyUBe9koEYwtrpBA4xBxiJPPj+Cn4DGBkHBWvrTLxGGdgchY/vz0Aa
	oGhLfuJ9sBYmHtZzh6a4XrjneIegMiDsVJnmICi00CIoi/C1nSCxdbNCHODz60hQc5Nsbc65MeAf+
	EJcbf4Ta7A9STrZNdkTImzAWUCi0n+R/3touy3U0/6t3BeO1B/QTbzgynnUdkZ5fsovd4zF/FdWdH
	LWjq174w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZWS-0000000265Q-37HN;
	Mon, 10 Mar 2025 09:34:08 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZNN-000000024je-20a2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:24:46 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D94DD1140122;
	Mon, 10 Mar 2025 05:24:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 10 Mar 2025 05:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1741598684; x=
	1741685084; bh=8KEUvLMaOF4POftDLbh7R+xk1UpszEm4+C2tEKJCjZM=; b=M
	+hRD7/n6wdfjuh7xGKS3jCiZ808HsEkTI8zX+ZcZpyen74u7rwgngM53Q9LFuMIg
	4RSA8KGD5jXkHTBrHYFFzv3j7fPUaz2YGM+N8if9Tbq1u7TBzFoxvRvqijPjTRKO
	aLO8+u7l/l84Jz7oakj8VcV7rk+CWojDsMzNSQUGjYWeNDxnBU21JLzXt+Sf5SFF
	WonlCweXao70jLOjondQyqelRT7aQSFHJN1/qkUEhSoqhQeoD9kjrSP4FwJbyncv
	tlq9RgkJoiI7hEzS2cfvLnGeX7DNngcSr+wFhYMFkC4lW2nFLb7zpnQJUT/Ru1ph
	9PIA900tEJoMLZKxpoc3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741598684; x=1741685084; bh=8
	KEUvLMaOF4POftDLbh7R+xk1UpszEm4+C2tEKJCjZM=; b=hbJqzDrTvgJRWfu1x
	wUDTvfVXSTJzq0AN4edM04NOiqTUyghcdWuFj3rfpc4H2T5ZRszyn522pJTr6FYA
	GBgpkjwHU6u1Bn6QpaYbnmWS1kxkSVbroFXJWrEXjZ7RUE9Y9ZGyhwcw3mGf3AFi
	ZtLN8WUkBtz8VW3KxRGJmIJKy9zKyKyngC3qM/oXYcTMORe4EAXSr9bXQXhKjowX
	R+zXsg0ot5elJJ7bNWSRrHsHYnBveLSq5uxisGf1D2JawIgCbrcanGP+PQqmq77c
	e46HEWrYsdHWDx08U7a18S3ZnrgYkMzu/eRfyrRmGvtxOmVKgavgZYmsCY6Y7OC/
	Ii/2Q==
X-ME-Sender: <xms:3K_OZ8KTeujkBlMFm_DIxzkivuavLek-5SPVas1MFU18I0ZGjV4KYg>
    <xme:3K_OZ8JRv9clWu1Q2B3avb5KEwgF1wfF5g-wGBOCPgp4zgvkLonZNH3bUzi4x1ahE
    QCzhA2BUHq_cER3rg>
X-ME-Received: <xmr:3K_OZ8tzIlL30uJ82lT5tkJKYIV0jw6JnkdmaoB-PkKe_8-SIPjFvJakVAcov-7KGByEmtc4_qnu3q6JGM6KH_Oabfys-rRkyax12bzkde7Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:3K_OZ5Ybu_rt4sbpS0a0lyowIjf3AWRWJBnTNMhxgFWOsiUqpit3uQ>
    <xmx:3K_OZzZH_5rPpQ2Bp-bwd7EbBqps6Ii03wkd_rfdoghRHW5Y8N3vmw>
    <xmx:3K_OZ1ByWlMv7KA_uqCUkEjZbLD7ev4DLi2JI1Kd3sJMfFXjJPvXQQ>
    <xmx:3K_OZ5YdlPTZFR2JdHoLscyRJmRyodaj4xd14i9rrzbT4YWzDG63Ig>
    <xmx:3K_OZ4QkrgoE4ct1J5jHUag7VQs7pPSu5F-KNEzwW_TVCxJVO_Po1aSe>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:24:37 -0400 (EDT)
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
Subject: [PATCH v8 05/11] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Mon, 10 Mar 2025 22:09:51 +1300
Message-ID: <20250310092345.31708-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310092345.31708-1-ryan@testtoast.com>
References: <20250310092345.31708-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_022445_582068_1B3D8BA4 
X-CRM114-Status: UNSURE (   9.72  )
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

Add a display engine bus binding for the DE33 and increase reg maxItems
to 3 to accommodate additional register blocks.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v1..v2:
- Correct DE2 bus enum to reflect fallback devices accurately.

Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- Increase reg maxItems to 3.
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf6..317a27cf590b 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,11 +24,14 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   allwinner,sram:
     description:
-- 
2.48.1


