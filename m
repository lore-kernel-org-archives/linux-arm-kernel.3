Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24427C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keG78B1fxGaV4Wn4xytqDU1dgO+GJXfNsDZnC18aq5o=; b=V/bybAgX48eiv+A2cKDfmgR1Kv
	Qo9O5kMZ4fJGRiAdI53E+86TT/bv4ru+OQnNS6g1mDkV5uUNQAZfSnoj+J6axXL9/GMaQuBoEgKIU
	FZFuUsAHYjZgOZQhv7s4z+H1f/4+1dvT8Gl9fV0ZDxDo+aYYvvHNs7Ki7nP9pgScjgpO5UWVH0szB
	el1AKe7Xy2oQhv/Aw/hVduFU/Q8M5tuneKpDwLV6UqnrT+Q47ycHA+1vtpyACf7LuLlyk0evAC9nX
	ZPVsTROMk+R6MsHyLfcySkzULQqQ9AguicbeMHHuU9bAhJWMXXqlppA8PtvSC42tBqqVduYZTfT8z
	5Ty5Dp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbJ3-00000001al0-1XDz;
	Sun, 16 Feb 2025 09:51:21 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaxU-00000001XTz-0gxG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 09:29:05 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0DC6C2540115;
	Sun, 16 Feb 2025 04:29:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 16 Feb 2025 04:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739698142; x=
	1739784542; bh=keG78B1fxGaV4Wn4xytqDU1dgO+GJXfNsDZnC18aq5o=; b=i
	xrSmfzSBrf7LiJeBzVjUSayPOR3n5ypqRlole0r+5Cdu/amAr4g5jUDBIgpgxB3r
	wdmY24LIu8QFM0gpurXqFw88VF9WJejP4WQ86+lbvX1Zdx2NAuPo2Z+GR1iWjOdd
	pRvZxhCrCjZnkWEfpDLJf1CbhmEpOJpBEiw/6fXN7h89K9poBUOLckoyi8iN7M74
	Y9nhUGFLVu8QptrjQ6z2m2LFp6mtGqi8RyZtoI0QlhbXw7zW7x8FBoWs9bVL+7N/
	sf6Cv0DQAufeZb03jBE2BzFay3IVEhT+Ra4Z9FJCQzCOLwtE4jbfJF4TnJhyzVEb
	gRvSah1JI2cqFJFjntzwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739698142; x=1739784542; bh=k
	eG78B1fxGaV4Wn4xytqDU1dgO+GJXfNsDZnC18aq5o=; b=lc8nSedpcjtKco+R2
	TOL2uSb34qheXVdNs1bJDKf0VePciPyEfn6zbkDh1mug16sQWpmvZB5htRnAi+Wa
	ZW7YMyxhv2Ko/uTn474MnS/qm0R5PuFxURNDYgJHGZNFJiKlQSj4E8awAht+5ShG
	DlzuvhmJqViHvy5JBalEqsS549ln0sngy6bYFWXvaAA10AwIcrrqjOSzM2gH1mfn
	h8uHcdmUebdLK6sUI1DssbyHNtpOeCwx9UfK5l7im7v2bVky+TUOvDqz2fuUkGpA
	0n6PmN45+ssh1LwPDql6W/5Sl4u4QYzYIgx7vvgiQdc2or7LU62hHVVt1vw7CHQM
	T72tw==
X-ME-Sender: <xms:3q-xZxHc5EfVGEXLEiefi1gIsmLOqt5G1CU9Bmb1qMcjbpO8O9a7lA>
    <xme:3q-xZ2UVyx8pkHtpFcHQ2QoozGYn29soPPDELyvjvjoHDthEA3qYVlpXP8KL1DwfO
    sXv13DPg6N9h6mk3w>
X-ME-Received: <xmr:3q-xZzIyLUXgtLr4h2A2tRVYhv1WExj6Z2ndniWb14YnmA92gs5bv8Pv5KzymOP9FRxQ1pdwfBZ3LmxaRl8wnIgq1iip9VVYtsgjQ2bni43m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    gvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtges
    ghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hgpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkh
    hikhhutghhrghnleeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:3q-xZ3G3UvbfnbCvxYThinVR0GiYvH4xdwXO34m86Sy1pNh945FO2A>
    <xmx:3q-xZ3Vld4hw6YG9lua3W4CgnZWla2HoxpXzIF2_y-Hfkl6qo05wZA>
    <xmx:3q-xZyPtv95TgBy6kX4ZCg2UA6eApN3xXUOipNIsp_VHGjdX99_L6g>
    <xmx:3q-xZ237pq_NKN-_8oHg9HJubbqiXy00_-JhLDBdkwn96NBuS95wcQ>
    <xmx:3q-xZ4vvAsxYCWNae0KgxJ2izna7m_CgoHlWLi5634jusg9ILlSSuP2V>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:28:58 -0500 (EST)
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
Subject: [PATCH 4/8] drm/sun4i: tcon: Add support for R40 LCD
Date: Sun, 16 Feb 2025 22:27:11 +1300
Message-ID: <20250216092827.15444-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216092827.15444-1-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_012904_316284_38BCAF55 
X-CRM114-Status: GOOD (  10.93  )
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

The Allwinner H616 and related SOCs have an LCD timing controller
(TCON) which is compatible with the R40 SOC's controller and existing
sun4i driver. The H616 does not expose this controller but the H700 and
T507 (based on the same die) do. The controller supports LVDS and RGB
output.

Add quirks and compatible string to cover these SOCs.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 4cd3a07daf6e4..d364e814fde26 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1528,6 +1528,14 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
 	.has_channel_1		= true,
 };
 
+static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
+	.supports_lvds		= true,
+	.has_channel_0		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+	.dclk_min_div		= 1,
+	.setup_lvds_phy		= sun6i_tcon_setup_lvds_phy,
+};
+
 static const struct sun4i_tcon_quirks sun8i_r40_tv_quirks = {
 	.has_channel_1		= true,
 	.polarity_in_ch0	= true,
@@ -1569,6 +1577,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-lcd", .data = &sun8i_a83t_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-tv", .data = &sun8i_a83t_tv_quirks },
+	{ .compatible = "allwinner,sun8i-r40-tcon-lcd", .data = &sun8i_r40_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-r40-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
-- 
2.48.1


