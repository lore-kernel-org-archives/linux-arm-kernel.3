Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE0EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtGWG9y1AsSlSEynEhNVYtoJVgdMgxP49x1/jztGSxA=; b=ZyI2HXWULwSBRo15Rh5skyYPwa
	J5hpVTo2hUoNsZz41icbtJIyntcRr6hQCye4NvK1uwPTvofSAhfBHOWmIA/8P1TnatjR3ulDm+iUu
	A88jsLXftH/Mtxv1wviE7rQ0TN52H4FJAJokU2yefqcF4KfSLqsTEWYV1/21VVd90SK4Dhrh1ebLH
	BFNpErnqk/ZaaI9b6pNNmBJOILywr7IRYsjVke7a1w5D4xXNOpduH4vVsza+4pgGlrkdml+spxSOT
	vqeFMtU/+X4/K2bNW8h8mOfXw8AAW4hjAbdMJJLhb1bQkeYk8x+rPgMy+70NEiboq+gsQQujZBPrI
	+jMXt25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjk2n-00000002RBl-0UMf;
	Sun, 16 Feb 2025 19:11:09 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjZI-00000002MYc-01rU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:40:41 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id D12FA114009B;
	Sun, 16 Feb 2025 13:40:38 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 16 Feb 2025 13:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731238; x=
	1739817638; bh=OtGWG9y1AsSlSEynEhNVYtoJVgdMgxP49x1/jztGSxA=; b=A
	jSyOChMGQvPXAQ2alZcCQyT1oCEu0GAgmiRu8s+KygY2zTb1Ra/XSwJ31RE9Yfxp
	AQzlwMl5mqyyX91V48WVRAHp+4wjxEABqwHRxyNZ92wAM0yi9ZCJJbgSldVnTXxs
	lV9hO8cWPWo5ixUDZVBGK3juMHUVIABIj5UdRi+5hBZcjsG56Od+gw3vrdt8WIpf
	wzbUR71Jfm8UN83hBa1pG4EW6sIMHjA13lm9Hcc9KIs7ukpFztwnBrqmjpZXt9kr
	3eFQs6YQqN9bkuXVr0c2+0Q+A57RcRn6aTboiumQiGIym3TivkQ+1qkLwu9/m0WA
	HGQ/6FHn7NsuoMEbpQyOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731238; x=1739817638; bh=O
	tGWG9y1AsSlSEynEhNVYtoJVgdMgxP49x1/jztGSxA=; b=DDTU31Qb6NsNyBpJq
	EhpcVhhO0y9JnJgiroiwzK07nTgbNk42Gasdj/sPFPsTzp28L0CgRyI2mZ+zto4k
	E91W2DFt6kgbNx7oVNYj5Iv74ctNHogpXWlrekLx+T4L9V76CcD3x3nK9lx+MQ93
	yadXRTV8A6pXPbIoC2zelet5sINr4KsDtc9IYXG6TOIMX0lbPHCvXOtrfzpSS4Y5
	3UjhL/ITDFKm5v20aXuRmkupw9ImKG2QiLwLTFPyoRfQ36Tn1EeAbWGsSXLqnonc
	vKNHS0UYjsMNIEyHQE3Js9oZB3vDRT8+0vwv9kalPU1ox/6ir0E7sJt57IPRRKst
	jU9uA==
X-ME-Sender: <xms:JjGyZ4g6D0vn64WnXMKg2P6R-kQqhasY5gwHXSdbV8DcVEUofIM2eQ>
    <xme:JjGyZxA4aNG7icXjCcE-WgXywgU9qXXWXRG3yeVvSAEDxg9LqZ39HOBlWqupT0GaQ
    k-SN3z5ARLcLUdg9A>
X-ME-Received: <xmr:JjGyZwGX3lHQdNL9egMxMFbZ2BunyD1ubJE1YLBKX07K26wfLcSYOJiFUTcWbcIt3k2W902QrLpH2Z1fdStHo08teGSuItBypHSRl0eLoToG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:JjGyZ5SdQC_SJJ9gQTdDYeUIYtLVPj_pH0iQSp2AILe7pVhKhACofQ>
    <xmx:JjGyZ1zUyQRZBQZ8lJaew6Zl3NYGPUIIzIr71XQTNvEwWpSyUvikLQ>
    <xmx:JjGyZ36vcGy2Zf0i3tPim6Cgk7lTXtpcdJwJc7zl9bSmdviU80op6w>
    <xmx:JjGyZyx-a-iaA7ElE929_Dby8RJL6zGa3eOekYHkkzlbhDwiKuO-Kw>
    <xmx:JjGyZ6gNyoJdZHp9kKlNjqFzqFxUV_mVWN6zFD_DPF7K0x15AwXN7Tac>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:40:31 -0500 (EST)
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
Subject: [PATCH v7 23/27] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
Date: Mon, 17 Feb 2025 07:36:23 +1300
Message-ID: <20250216183710.8443-24-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_104040_095920_A0253541 
X-CRM114-Status: GOOD (  15.34  )
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

The DE33 is a newer version of the Allwinner Display Engine IP block,
found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
supported by the mainline driver.

The DE33 in the H616 has mixer0 and writeback units. The clocks
and resets required are identical to the H3 and H5 respectively, so use
those existing structs for the H616 description.

There are two additional 32-bit registers (at offsets 0x24 and 0x28)
which require clearing and setting respectively to bring up the
hardware. The function of these registers is currently unknown, and the
values are taken from the out-of-tree driver.

Add the required clock description struct and compatible string to the
DE2 driver.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v2..v3:
- Lowercase hex value

Changelog v2..v3:
- Correct #include for writel()

Changelog v4..v5:
- Whitespace fix
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index f2aa71206bc20..a6cd0f988859d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -239,6 +240,16 @@ static const struct sunxi_ccu_desc sun50i_h5_de2_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
 };
 
+static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
+	.ccu_clks	= sun8i_de2_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
+
+	.hw_clks	= &sun8i_h3_de2_hw_clks,
+
+	.resets		= sun50i_h5_de2_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -291,6 +302,16 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 		goto err_disable_mod_clk;
 	}
 
+	/*
+	 * The DE33 requires these additional (unknown) registers set
+	 * during initialisation.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun50i-h616-de33-clk")) {
+		writel(0, reg + 0x24);
+		writel(0x0000a980, reg + 0x28);
+	}
+
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
 	if (ret)
 		goto err_assert_reset;
@@ -335,6 +356,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
 		.compatible = "allwinner,sun50i-h6-de3-clk",
 		.data = &sun50i_h5_de2_clk_desc,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-clk",
+		.data = &sun50i_h616_de33_clk_desc,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_de2_clk_ids);
-- 
2.48.1


