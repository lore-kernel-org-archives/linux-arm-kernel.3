Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EDBC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+V+vbAEVHhEAfH6026ji2RX4g4aIXZTtRsi78QwhDQ=; b=nX/h58xKyM36ykUoODF+QaI8Xl
	kyjZwogMuhIxDf70yQXurEFI8Av9S8eYEkg2Ibr8rkd8weOXImDf1aHfaY6v+PhNO591wnjQQjq5A
	XBVAibl+/snMv9ukV5v1L0PA4YSwoJ9ECiPA5+LjFy0G9CpgAnFUNFXFS+jpD2pJ+AKwqqNLLhqmU
	0lPLm4fWs0ME6mSMVbo85KM9FL72beJUzn0sqp2NbhGWrl5rnh00AwgaT7Ik7aJlFFUUcbFwCKCFg
	w7Q/t+Rbwl61+E38fsyhhilMyJPy0VIbCdGDm8wvr/I2iq+zW+dbGLf22gMuWZWWWCgmQ5xr1AMzC
	FMF4hnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbHc-00000001aZa-2tbj;
	Sun, 16 Feb 2025 09:49:52 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaxP-00000001XTH-0Brr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 09:29:00 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E93782540123;
	Sun, 16 Feb 2025 04:28:57 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 04:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739698137; x=
	1739784537; bh=O+V+vbAEVHhEAfH6026ji2RX4g4aIXZTtRsi78QwhDQ=; b=k
	zs44wB0Sf2J/Hbn2UhSVxbAqQ9K7zQzq6sAexb8Xd2SrNJDW96MKkaf35xBwQWK6
	nElqHRtP/ilA1W4gw5ryqiibLjTvSVVUKYbxMA6f0oUK21ooE4kB8IHL19uW9UcH
	oA3+p06mvmzfY7mYwxV12IPn4erXu2EdXmwwUxa5br7ME72TnLGS4C+4isc3ybpO
	1a7GWkUE8CjA3GNKxRz4D7FRvoDh2bK8LnWAdwbm2UE+vJii5QJAiz5tuEq2C/o4
	AFznEl+J6LTGJ4oDIlL1PndYczOcBrQiPGCUI1HgwQLrM/h1bs4fQMls4Ijoy2Ca
	DhDVtsj6CoQyJwb9wLKzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739698137; x=1739784537; bh=O
	+V+vbAEVHhEAfH6026ji2RX4g4aIXZTtRsi78QwhDQ=; b=faUAdpGubV0q57fh+
	PsVe/UoNi4fHMXl4ekGWDXWCeciQZrQO0Fp5nUpgQ2lvI26PMpyFlM3iRyxsXT3F
	vigCjjyu0UaKJ7NUUhim1VY8d+c76X2jhyW9NRMORDaDoVDKjOJOOZQyB68Jt9bg
	em4xzRHmdC69b3WFEx7mFc/n7gAyOihtma4VPA2S7N2CIix7JKP66/H4rRg3BzZ1
	xs40OcN47/3iDtPWpj0GrmPkyn0M51nETugso29zGdXw63Pq2NABHqt11Aby6+JT
	VtIwDFPhnWQVuEqe6bBLC8In7gtBYRjGmpYBN5rCa+huaOxHvqWjGjzcppBmvkJw
	xWZYA==
X-ME-Sender: <xms:2a-xZ9yJsPOkc6vgID0NN_0h5fhC7ZrVwDnpenvPKIt3gf6MPRoNiQ>
    <xme:2a-xZ9R2zIQwVOELo7ciVz72YacFP59WlNyPQhyG-4Hb0zESUdvVdcNCMHF3zcJSV
    OsGFs20X_aItthNQQ>
X-ME-Received: <xmr:2a-xZ3VooZhb_A5zcG7ny2i-hQ_DUlVTbZVq5wP_fVU7GSX4SCG0hWUz7eQPkFIKFvUYklvEJwDLrOv607Up-adl9lTBu9C-qkJIxHdAHPWy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehheduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    gvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtges
    ghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hgpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkh
    hikhhutghhrghnleeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:2a-xZ_gDUgf5nfj-jkVRJIJ__oMnb--Ow2UCZ_R-6I2oaE0o73J61g>
    <xmx:2a-xZ_BEYMIekOV0zcalH5-VZB2drWR7iJc1Y0XF57NbduZJe_xzgg>
    <xmx:2a-xZ4KWE2_SWjxGtVJIYAj7m9XvkjRiv1-RleEGGHEp8B81HV1y3g>
    <xmx:2a-xZ-ByBdMsIOMEE-PY6CmYpFUBBeXUcwPhf5Sw4HXZs8K6YpZD6w>
    <xmx:2a-xZ3bMX355NhdCNs-wSP2hvHQmk6goZGThhmTzNzvRQrf0ZIvWWal5>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:28:53 -0500 (EST)
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
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 3/8] dt-bindings: allwinner: Add TCON_TOP and TCON_LCD clock/reset defines
Date: Sun, 16 Feb 2025 22:27:10 +1300
Message-ID: <20250216092827.15444-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216092827.15444-1-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_012859_166233_4F2E2CEE 
X-CRM114-Status: UNSURE (   8.55  )
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
connector. This requires additional clocks for the TCON_TOP and clock
and resets for the TCON_LCD LCD controllers to be defined as per the
T507 datasheet (which shares the same die).

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 include/dt-bindings/clock/sun8i-tcon-top.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/sun8i-tcon-top.h b/include/dt-bindings/clock/sun8i-tcon-top.h
index 25164d7678353..2a12d047d2e13 100644
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
2.48.1


