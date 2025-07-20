Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F503C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BGi5ucU1o2+iAEAe5eZtkdao45tn34zo5WJJl1KkNs=; b=V/b84iHVJgFKbxic+yv+sqewGD
	637u7VqSv61NNws2rw/1GJTUuZnhkGq2ZJKf1YnvE9bYwW+fiXGYLTNhSCDDAaL/ccoKJpzSLs2qt
	fdoNnlhyknE8gC0O+BVxZDwWoYR0EDoTRqXrRVfZFZ/QYyLDerr38J429CTktCDypHbotMghMhlPP
	+FS7G7xnPCgSgdUisS6ZrQXWQHa2O97xNNyklWJII+u89JBmOtMe0MZhS+zLYMi6BjA+Odw0lXZw7
	siWXosBI1SMIRVJyLbtYx7TypNjwbal973evga4qrLDJUryO0VWDwwcoy+1xJPF3fV1Id7gzHibaN
	xID22mIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPqB-0000000F3qb-2T5A;
	Sun, 20 Jul 2025 08:56:15 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPlL-0000000F3Vw-3Ueb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 08:51:16 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id E7E3C1D00121;
	Sun, 20 Jul 2025 04:51:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 20 Jul 2025 04:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1753001474; x=
	1753087874; bh=/BGi5ucU1o2+iAEAe5eZtkdao45tn34zo5WJJl1KkNs=; b=K
	wIyqXfoPvyrZVS1a68agipuehvKjP9dJT+pqqP+FM3bwve61xU2PqqiSIaLQpp11
	2zpkM1oOFAMhpCGIbiecOZ0sh758BG5BZrfv1oSQafYdmqwSlK1f6YHYrDcISAVF
	ZWe2nrQncnCSRO2fO7qqHQl4OHxrWvBeH9xDXsz4jgWCBQJZEHeitShGngNvOfO0
	zUOplTIpgAXfH/HPnmnnuPeZAeL5juHIeYegBU8hNqMYFaV1OaClHHUrYi+k1KR0
	Gj8BqjuNsEjZG9zaickeL6O2d+NlNKLyPGvmObsBad1IMKEhyqLE3fNSo0GPfP23
	/9C2lQc8xbFSzXMxUClKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1753001474; x=1753087874; bh=/
	BGi5ucU1o2+iAEAe5eZtkdao45tn34zo5WJJl1KkNs=; b=G0rpmCGtIxqM+R1Uj
	mSugcY9gDpNbp1nd8qK7ia0a5leAZcWZ8kl5j0i7Lqxd3TMj6XkVH9D9yEoGz97O
	XaW6IXwtj+Hes4cGQfqBhk3CuOfwNmdgvRJD0BG4wRK6vruBJe9jvs0dnm1p2sZH
	tVCYuzZNPckRGLu47e0olPYl0LZMS+DsqxwegtmMgxp2Mazif0sMYQ/LUAt3t6LF
	DoBR7EKlCi/Q/GvG+Skl9hn+LxbObjosroLNi4vEvS6kubWglfQuQWFV9khHfums
	FeYxymgF67qU0D6EvlPer2CKLZjqXEJfvYx7u++Th6/iaolGfljZ6L8F7RKjkKgX
	iZpSA==
X-ME-Sender: <xms:Aa58aLXs4agY2z3zt3Q5FF9PkqcJTnjPkg3xWiSnkNJRhnw9mLGbIw>
    <xme:Aa58aLI2SmZzGR-GfxokaNu1qSNHgoAWFaS2Uf2qyNVh3R8UaS8bBPIJPV9e2BmKT
    0BOufjJIA9IlAu49Q>
X-ME-Received: <xmr:Aa58aHBAgB0eeFfRSzqaiXxRYLPVURu8-oGqhx1SmygZE_K0IL24YtPaBapEUalbLVmD5R2hOxpnUTEX2xYovo-ZbsJBmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
    lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
    hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
    hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduhedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
    theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
    gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
    thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
    drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
    kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:Aa58aDFvcwRooZ_KA72kuTnwN8fjxTuEAcesu37azzUfEn2ZDw8Diw>
    <xmx:Aa58aMLlia4t9420gwrxf4NPUxp4gCfzkFLDGFpqRwsM_oA_dXIGRg>
    <xmx:Aa58aKpdgR9UhZfNYRrCR8KAgS0vIzP9mWyP4NrHSDKn7xAPYDhmuA>
    <xmx:Aa58aDi579743aJQG1eh7CYG8O0GWptCAl7A_NH2X8-E5pXeZ5TWKw>
    <xmx:Aq58aNX1vUrrOtcFSsXXNv1uSdoECT2LNLDUOz-K3yDkHnFxJEa6Lc1Q>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:09 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 01/12] dt-bindings: allwinner: Add TCON_TOP_LCD clock defines
Date: Sun, 20 Jul 2025 20:48:39 +1200
Message-ID: <20250720085047.5340-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_015115_920785_30F4A96C 
X-CRM114-Status: UNSURE (   8.09  )
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

The Allwinner H700 exposes RGB and LVDS pins as well as a HDMI
connector. This requires additional clocks for the TCON_TOP as per the
T507 datasheet (which shares the same die).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 include/dt-bindings/clock/sun8i-tcon-top.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/sun8i-tcon-top.h b/include/dt-bindings/clock/sun8i-tcon-top.h
index 25164d767835..2a12d047d2e1 100644
--- a/include/dt-bindings/clock/sun8i-tcon-top.h
+++ b/include/dt-bindings/clock/sun8i-tcon-top.h
@@ -7,5 +7,7 @@
 #define CLK_TCON_TOP_TV0	0
 #define CLK_TCON_TOP_TV1	1
 #define CLK_TCON_TOP_DSI	2
+#define CLK_TCON_TOP_LCD0	3
+#define CLK_TCON_TOP_LCD1	4
 
 #endif /* _DT_BINDINGS_CLOCK_SUN8I_TCON_TOP_H_ */
-- 
2.50.1


