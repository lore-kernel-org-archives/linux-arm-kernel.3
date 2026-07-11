Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6989FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NrQxFr7A8kE1ao+WVW0sT4zAPOI0r5GcxHRRjiYX0g=; b=audq1imz5ETGI3jAY8PeYHT5Ry
	PUaOTnfdKd7YgD1LCjRhp6cHxD/3VGVMQk8rj3WPpZRVtxDqV+5qvNhnuk6dGcvZaLjXzRnU+SyGG
	ukwgAVWmMJIXPdmNwB4cytfNXJ324VTXhH2C9kFwFMmNNl2Why+WGj9ToT7c3tR0JFf3eyJRu3/2s
	XaQgFNdRkSC+2y0xrJshIpKbwEzvEaT+19cR/B48iqBnRiA+z5790dmtzMPU0XLdA2ppmIHjWDKNR
	A+lYkCVeHm7mj/+t2GM5mQPmYrwzAMMc6JFsLVfSpZf2KA5s1wwF6kDagro6tDUaEOy6723aNlPJ7
	9QtGoYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiYFl-00000006as5-2Xnd;
	Sat, 11 Jul 2026 14:00:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiYFY-00000006al9-2b4m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 14:00:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01EC26137E;
	Sat, 11 Jul 2026 14:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584E91F00ACF;
	Sat, 11 Jul 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778411;
	bh=1NrQxFr7A8kE1ao+WVW0sT4zAPOI0r5GcxHRRjiYX0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YFuVTviT14c26brRNe4Lk8WKoTkT5M4/jh6w+sN6W/YGmJ9780eBhkb7H1IS4FGIu
	 eKaR6Eyx4ND9AB5JekaEaBvfNnV9rSs/W0ALgnYCT1tLjdBKJpb2W2OCH6yEL6qaNA
	 TDix53agHl0FBtX0Y1Rhy2W8iUk3WWJw37Yvb2dGAJS3FEsOh3eItr+a9b176m9TxZ
	 5qXj57tZad+/OUQ2RWeMWcSE/64bbWsZRC0G9xGWzwUbC65qsys3PTQBdrQXIyUfTp
	 +xXIBAeerQszAfNMDZYQ4Ape8n2VkjqyBbMTLwNK7sQHpVWCDtN/ALnVa78tRF8eaR
	 s5X7xsc9gqRAQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 8F3FF60209; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: allwinner: sun50i-h616: Add video engine
Date: Sat, 11 Jul 2026 21:59:58 +0800
Message-ID: <20260711135959.3616919-8-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711135959.3616919-1-wens@kernel.org>
References: <20260711135959.3616919-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The H616 SoC has a video engine, and two SRAM regions needed by it.

Add the video engine to the dtsi file.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
[wens@kernel.org: Add VE SRAM region and commit message]
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
Changes since v1:
- Corrected second IOMMU port
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..c6b3a3f8359a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -175,6 +175,18 @@ crypto: crypto@1904000 {
 			resets = <&ccu RST_BUS_CE>;
 		};
 
+		video-codec@1c0e000 {
+			compatible = "allwinner,sun50i-h616-video-engine";
+			reg = <0x01c0e000 0x2000>;
+			clocks = <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
+				 <&ccu CLK_MBUS_VE>;
+			clock-names = "ahb", "mod", "ram";
+			resets = <&ccu RST_BUS_VE>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&iommu 3>, <&iommu 2>;
+			allwinner,sram = <&ve_sram 1>, <&sram_c 1>;
+		};
+
 		syscon: syscon@3000000 {
 			compatible = "allwinner,sun50i-h616-system-control";
 			reg = <0x03000000 0x1000>;
-- 
2.47.3


