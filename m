Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B4CD2E021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqOYTjr4HjHtIjCwLKqxDQ8NxDpN6O4ML9VmLPSdjZ4=; b=uhGeCcJx1b5+befBQ/xmWp+8fC
	QQuAbv5FhDp/bmS2lRlt3oCkw4so8YnbxsCvsUxhs+yOhiDmqFzjcA68EovyFfo/VXNhCV5gCvR6w
	l672X+K+udXWYI4CEwJ86OarWekSnYcVYCrNv8T+ZWpc8iYuHbpT7awlAHYpYVExZQYc/vtPUq1i5
	DbDfNA/jiwQtLI9ObCBvV+TNyHPb1Y0ZY7IzbN4QvIA2uZJ3g+bfVgPj49W76aMa8H1lQuZnglWHh
	eIck+kiS2p8glX1zJnkRNceT2L6IZE2s3X59XUsopniVqcW9akjRBeYDpP1CHIUJ7sVNY+RVCPyM2
	LXa/WWfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WRo-0000000DVVn-0EH2;
	Wed, 23 Oct 2024 08:10:28 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WHh-0000000DTmu-0aua
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:00:02 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 86398138049A;
	Wed, 23 Oct 2024 04:00:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 23 Oct 2024 04:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729670400; x=
	1729756800; bh=UqOYTjr4HjHtIjCwLKqxDQ8NxDpN6O4ML9VmLPSdjZ4=; b=h
	o4ni9E7abGvPTFVEvkWNzhua1EK9tXZiluxNrJ30F/H+jUvWqvx1DYGb9+hyrcOX
	yTIhYc0KJSxd6bsJYrKYvB12bPcBa0pWVt2RStnsPOgC2gaMBAnOO81gtGu4LPFp
	aC9ISuUDPyVJ9Q9T1RFkbS5uSG4Yc5U8zLTvOea7uHgqaUAGDTRqkTMw/PWbdepg
	XA6EwJ1O1E18RN/pla3t3teo3TQRrRov4Z3R5j6WQZHpyEW2QrN9nwEQxMOcLIDd
	1lpO0DcQaxyQYdB0p0xV6SUk7onXQ1NMaoyOhJpoH765l3qpg6LMf4LJz+DcsjCk
	2GXwKGhGMWI11qY07dbtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729670400; x=
	1729756800; bh=UqOYTjr4HjHtIjCwLKqxDQ8NxDpN6O4ML9VmLPSdjZ4=; b=F
	gkGYGPwtoePoNQyWEH8UH3ZMD73zDePRsw1RBbIjScomxrB+yU3vB7Q2Mp8eUw8z
	FeHL1ImvzUclBscmOy7VNqHnWwnxgeCKvuEeLNTImelYzFovbPKYl+JRINXujls8
	f3ivAVL/hcU1o9Nww9uji8hvhPwkwhUfkmIaKhEwEKw23z3iXgUH0yAssVkGblKm
	4IwL37HdYculcDc0KREEA5NF1JGBzaG9Xea/SLj+ukaMsljD5mlxKDiS/ocfiFSF
	ZOoo/apOq1AMVAIHQpMGX5onLni5fkcun6MwHpNn5a8an5CorPPXQm/MXyvKawyh
	VfJFYdHCJQjf5Cmajp17g==
X-ME-Sender: <xms:AK0YZwXyz1xOb_uDX8iidVYxdCoXoku4-8ujfATVDe-YfZ4nyjKupw>
    <xme:AK0YZ0mmjBKbBGu4o0feDR7fjzF5Rdh34fFnUxJ1swDktKrUwRP6tkD584dd9thiE
    CBUOXWKpECxym_D2w>
X-ME-Received: <xmr:AK0YZ0a79NM-8XD4rkmwN1sHJxANBWrX5UIOqN-bveJxtD9jFr8TqXWCsEuYVzB-gKoUjzJREc-hCJ6QiPsKBsssRYx6U-vb1cQrHqDOqGNvF5yR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehmrggtrhho
    rghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhhih
    hlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:AK0YZ_UM4LzqW7_9kA71RfbBgucX31GsdvTFxaWP1r1W-krby2UoYg>
    <xmx:AK0YZ6lmKVvgwSBQ7VmxusQOxxYrgRueccWCX7TdnGgyG4SwA1x5yw>
    <xmx:AK0YZ0coj7WyjVvUXmJ-TczL-Bd7ypBmZOAadofqRbUtVIc5943KoA>
    <xmx:AK0YZ8GBNRIslX7m3q1ooYo9VoE8oq1yJQuLIq2RCHuPV9pUCihHTg>
    <xmx:AK0YZ00H3XHVQhUEEppmsp9JUq_0SzgEn2Amj3rPfDLkirvAp2ZdEIes>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 03:59:55 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 6/7] arm64: dts: allwinner: h616: Add audio codec node
Date: Wed, 23 Oct 2024 20:57:02 +1300
Message-ID: <20241023075917.186835-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_010001_342525_85D62D70 
X-CRM114-Status: GOOD (  13.00  )
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

Now that the sun4i codec driver supports the H616, add a node in the
device tree for it (correcting the spdif block location at the same
time).

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

---
Changelog v1..v2:
- Remove 4x clock from the codec block, this is not used in the driver and does not require a reference.
- Move the codec (and spdif) blocks below the lradc block so that they are in address-order.

Changelog v2..v3:
- Remove leading zero from codec address to match other node addressses.
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 44 ++++++++++++-------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 0131f9b3132b8..87cde36445cbf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -762,21 +762,6 @@ mdio0: mdio {
 			};
 		};
 
-		spdif: spdif@5093000 {
-			compatible = "allwinner,sun50i-h616-spdif";
-			reg = <0x05093000 0x400>;
-			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_SPDIF>, <&ccu CLK_SPDIF>;
-			clock-names = "apb", "spdif";
-			resets = <&ccu RST_BUS_SPDIF>;
-			dmas = <&dma 2>;
-			dma-names = "tx";
-			pinctrl-names = "default";
-			pinctrl-0 = <&spdif_tx_pin>;
-			#sound-dai-cells = <0>;
-			status = "disabled";
-		};
-
 		gpadc: adc@5070000 {
 			compatible = "allwinner,sun50i-h616-gpadc",
 				     "allwinner,sun20i-d1-gpadc";
@@ -811,6 +796,35 @@ lradc: lradc@5070800 {
 			status = "disabled";
 		};
 
+		spdif: spdif@5093000 {
+			compatible = "allwinner,sun50i-h616-spdif";
+			reg = <0x05093000 0x400>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_SPDIF>, <&ccu CLK_SPDIF>;
+			clock-names = "apb", "spdif";
+			resets = <&ccu RST_BUS_SPDIF>;
+			dmas = <&dma 2>;
+			dma-names = "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spdif_tx_pin>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		codec: codec@5096000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun50i-h616-codec";
+			reg = <0x05096000 0x31c>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_AUDIO_CODEC>,
+				 <&ccu CLK_AUDIO_CODEC_1X>;
+			clock-names = "apb", "codec";
+			resets = <&ccu RST_BUS_AUDIO_CODEC>;
+			dmas = <&dma 6>;
+			dma-names = "tx";
+			status = "disabled";
+		};
+
 		usbotg: usb@5100000 {
 			compatible = "allwinner,sun50i-h616-musb",
 				     "allwinner,sun8i-h3-musb";
-- 
2.47.0


