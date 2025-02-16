Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E5BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8S0LM67ZallGhiis5MmmYmAmKnXDOKUkcZarC5rYtYI=; b=r9OSC0PQQucC28Zxl5xVcJ2cO9
	3o71lbEzy2zoBosjHht2p9SbG/mmxH768fyMkX6g6mMOYWNtQKT5yuuycADR7hJhxg4TU9go7lc1p
	cSMpeOYIR+d46vkPElfUX4MjTKhuE5Mj2ho2OQoH82bZG8lhAYwzWI2sRw231FnYQT4EvH6bf7QEE
	TZr97uYTG+twILdp8LDhhtTLNqFoUt7XPlx6W6iUHi0Krs+es2iqHhnndaF5sBa+5ZAWsdVtBgowp
	I2305RBYhTfThKED8QRSuhxZFwxfhLnaFynXKbMoqX9YfWS24oqLSUN4gezWb6tQmg2sNzFUKA9yb
	YpApbsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjawN-00000001XGM-1cnd;
	Sun, 16 Feb 2025 09:27:55 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaTm-00000001Tyx-2s8p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 08:58:23 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 4D2511140138;
	Sun, 16 Feb 2025 03:58:21 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sun, 16 Feb 2025 03:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696301; x=
	1739782701; bh=8S0LM67ZallGhiis5MmmYmAmKnXDOKUkcZarC5rYtYI=; b=p
	pAJ+TwEbooChpbktJxalBPRlKtBwZqxM42ncKll28dXvx9dOCPN91keqYTrXGGRy
	sNwQnVwSlWeSGnHF9EXy9Vul3mZNY1KfWLpQKPGo0nW/8zPBvU7wTEzLy7i4KjnU
	yvrTf6vdO61kJejRKkxNT9s+gNxdbyKGuosuO4RKme5FrC+os/PgLDR+yF0U06HN
	f48IVUXeong5Jzkj80T4XMJVk7RpxwqUhcTLnSS3v6xXy+LqSMybAeM0hzGKTXJz
	K/evpzCX4RvpQHzvfULo7hUU92FagLnru1DwZBLfYoMRxBddb05xTJF9KzJ/JXNo
	ifYjV8Y61M8XYOcwyHDgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696301; x=1739782701; bh=8
	S0LM67ZallGhiis5MmmYmAmKnXDOKUkcZarC5rYtYI=; b=mhFc/Qh1pYV586Qqi
	B6MhPm5MwiZs5GcSNfLZaqbVAq924ZrPweSAwxYazF9LUIXFzMN0DRvKDuKoZIVp
	hlQbnN8oAX+Gqx7Xgdxm43HZH3CYh9GskSSHc9q3umSUWJcckIekin+YXrGTb2lB
	C1eD6hQloksoTFWkiF3YiGSnve5Ol53GJssdrl04XVeCWrLLvtJuDU2kKpHPoRIw
	HW7/0tpD7p5gUtMLkQsohd/sceXv4iR/UFjsL55zOo6dw42Jf1ztjhge8llPGImI
	P8PdiBflBj3X+8zY2y6RzquhWvaw/9wjwTmMKzZkF4XdR6A79ijS4inTj3pwNLMP
	FkGvQ==
X-ME-Sender: <xms:rKixZ5Ex5OYP4IGl9_ynsuYcNaZsc8mV4J1Tjxus4-Sha80kmF-iyA>
    <xme:rKixZ-V8Uwsazr_jYHpV0tf4DEpsCNflukqhKyoqHCnqDoAwaKZnVY2mGuulScyBk
    HPfpbhJ0OWfC9yYrA>
X-ME-Received: <xmr:rKixZ7JDPoU81pWSyCAXMkWiRTZxuIiWIfUjH_2kdaqreola1VdyQHIyVgymlGyr2HrepFrBZwLWOyRbsl26ouUVbckQh8mKf06BLp-pajTk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rKixZ_EqULXZ-p63WoXRhjBbNLN4-29iZxwYtKfsWLDN9WX87cb2lg>
    <xmx:raixZ_WSJgq0GEpwb47WOfVDO1jiVfDULfYykvx7UzQzO0XoSYnVgQ>
    <xmx:raixZ6NMN2uG7vQ6hMR8lWicBc5FjIiiiPLnLAU8a91gYAJiufy_4Q>
    <xmx:raixZ-2kR8i5xWnIvp31PrANdeBHTGof6u3wcwzEnhgtGdmhdzDPig>
    <xmx:raixZ1_9PLqVAioWh6f8MI50Om9h0lYpG-2Rkzh4ipggMCFCLDBQGJLJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:58:14 -0500 (EST)
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
Subject: [PATCH v6 21/27] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Sun, 16 Feb 2025 21:50:52 +1300
Message-ID: <20250216085432.6373-23-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_005822_807484_5171CD64 
X-CRM114-Status: UNSURE (   8.38  )
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
index 70369bd633e40..7fcd55d468d49 100644
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


