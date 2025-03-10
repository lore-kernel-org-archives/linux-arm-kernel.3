Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DC2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoiPw4x9/yEnLQUi5WhZAfDONB5Hr8eHgbP2VwzzCG4=; b=dn+aEjncZFt1BemE4kUr6yzXLV
	82IqPHpNuk8lRSSF+ctncpCdx6YlDzxvCHwTnuhEHTAMsXXRLk+yoG4wN55sh4NSRPDaeYLigOwjc
	9YEQDEAufS53lZH70VTd86bQgnHcnUhsw0/Jvu0u8/PaTRcKlmmJV1DLyoIcHeOVLVcnQRH4iQB/+
	8WynI7+QkjbIp7OIG6Dcq1alIGdisLRffJDN6VLnenWRSI9Z3DwbYWvmpPkR28BYRsgpljg/q7q8j
	8tHCERFppKAh/FmM6L2hFjBsdMNdD8mJIcPsq6PM/eDOU5Wp/1g6l9I1caOHM0Sm0fVNAtHZu/oqU
	NSVplEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZZf-000000026dv-0Ls6;
	Mon, 10 Mar 2025 09:37:27 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZNc-000000024oM-3Vpz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:25:02 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 38F0B1140122;
	Mon, 10 Mar 2025 05:25:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 10 Mar 2025 05:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1741598700; x=
	1741685100; bh=LoiPw4x9/yEnLQUi5WhZAfDONB5Hr8eHgbP2VwzzCG4=; b=H
	gwUrg5mVEKVpF0Pwkd5kpMoPVrvrRgGwrNUQchQ3QTZHGkDY6W+lpQNf45sjwcGu
	zYHP+Rkk2fClxEiUAjGPH8dxt6QwlmmBl4y3F5h056BjX53psroPOLyHl7e0avvr
	LI/C58/yEn9699Ta6wojI/akGlGMOiif24tAKad/16owhBQfvVSc/kNmGECoZniB
	HCeGamgY21EyJcDXyh2yIZHJdzXv+ElaRtevtuyEYLxCDQ5wkmgiQB6QK6QY4L0+
	XtXAv9eri9QTqkT7cGqL/vgldcd3nt/p+hU/I0W4BqAIZRYzOavBDXdt1dB1ICnx
	RpQsk+ypA6EdT4hmUhS4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741598700; x=1741685100; bh=L
	oiPw4x9/yEnLQUi5WhZAfDONB5Hr8eHgbP2VwzzCG4=; b=O1f6YZNdC1+D9GxZD
	X3HDSDcJGyIwQIJAs5NLgUqAK1AlfruRdNrsGanOyHIOILq4E9uBdtIni3/qix/6
	ShjYSMqgyZ5tqDQK6N01n36Dt2jLLVLajS0aEKKjTNpiTJRCegtZgBxC+kegY/Xp
	SKu9LgFSqoavS/7Wp4UkC8ufcMPBc0cGVvezlumFkJDLkN3nc/EFmUvYJWqeoeb3
	AkkXCmrfm/FeMiiFJebqok+/8tIcFC6otW3pnwfCHY0NMfqnvfbe9URmXKi6KjC9
	p9CaPtygoKe3DOmMcj8zPvTi0jlfuEsPgbTe4fMujGiLPUGRN0/2y/6tXeOaOzTC
	U1cmg==
X-ME-Sender: <xms:7K_OZ1oOl6x-eVCuaJEAZ1XNZbVqpBYZW5eA_flZLULzJRTQaP5fHA>
    <xme:7K_OZ3oUJMLiWrKutgy_XgGdGlASO39oWi7TDyKl0AeZjXUdqmTTBuJ6toGY7Jjxz
    ECKYEt-A7wQtwIM0Q>
X-ME-Received: <xmr:7K_OZyOsmrfCc-idFwKLcFgxqFk9bOBxqNR49PdktqjUCap8UIfaEMkB-hHzgJT4pHfiB1wDWEKM94nA9dQcejTtaj9tF8_6gPhmnrXEo4ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedvnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7K_OZw4pqnJLPsuJgkIIQpXF4Boy4LX7PVK6gn562-t2VTajlbYeCQ>
    <xmx:7K_OZ07TgewCYTXmXRhr7KpYR45rX40L06eMCHOineeiB5vf76i3ZA>
    <xmx:7K_OZ4io7UdlVE-ODuA76Rh-TmqcgOZ4pC_rq_dKv8KTZ8rmLZjlsQ>
    <xmx:7K_OZ26DmOXhC89a0NVzPaHh-ALwdtJDbahA43rVcqF-AbJZ2k8Fiw>
    <xmx:7K_OZ_xNSU_kXaFODEwTuXGfdWWSVrJGFAqfVoCz6NvmKEg9MBnwKwEm>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:24:52 -0400 (EDT)
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
Subject: [PATCH v8 07/11] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Mon, 10 Mar 2025 22:09:53 +1300
Message-ID: <20250310092345.31708-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310092345.31708-1-ryan@testtoast.com>
References: <20250310092345.31708-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_022500_950882_FBA053CA 
X-CRM114-Status: GOOD (  11.32  )
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

The mixer configuration registers are significantly different to the DE3
and DE2 revisions, being split into separate top and display blocks,
therefore a fallback for the mixer compatible is not provided.

Add a display engine mixer binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- increase reg maxItems to 3 and add conditional for h616-de33
---
 .../allwinner,sun8i-a83t-de2-mixer.yaml       | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad..274f5e632733 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,9 +24,11 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   clocks:
     items:
@@ -61,6 +63,23 @@ properties:
     required:
       - port@1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-h616-de33-mixer-0
+
+    then:
+      properties:
+        reg:
+          maxItems: 3
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.48.1


