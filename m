Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141C0CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIPN93vEVZUhWKya9FooFrwQkLLx299e1vk/G/qCOLY=; b=cZncoH+OY3CB8QYmv79qwu0kBr
	CGpH0qAqXjy3jBn73q+26knpDbhhb4Qz1NmsDEnT2WHtq6CSdzJCGa4sKtdJqdCt285GqbdB3vVo4
	QgjM6SCEHnIirStS322t5uv4/gst1KCNn/bpzUKQW5Zx3oGD6K4wC4mvYvf2NUQ8wdmSXng8JoNxe
	KmkLV9V1XKwkXodU2aWnJ9qE51NICoMAiMKOUX3GyCMg2PYf8GFO5A7+kyxeXQ4Kl/YVgFBVAYiDd
	EkHlxAr2EUafLLgzWMXUbt9NDkHCWjX7eM3LECW9ZtR68rXaE2Oy+V6ObFQ7x4qNUoJzXBl5WEE5j
	Ew5RqRaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQF-0000000EQyu-3rUS;
	Mon, 20 Oct 2025 17:11:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ6-0000000EQqC-0cSN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 052C048E2F;
	Mon, 20 Oct 2025 17:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2964C16AAE;
	Mon, 20 Oct 2025 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980282;
	bh=7WylpHCfl5v2xSL09jxwrG9Ik/L6u+sN2kDjKM+sdbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PJrLsn+galda3bYPgMdWQJEffSywb41/LmjAd3z8v3a1YlYtdfLc559jdDWnv+Wig
	 V9XGVO7dvkaKETtdhrtDbwL1y9p4bGq0oaIm1VZnnsL3gxWWMGyB4BYIpznNMbhv9/
	 iE3GnEpXGzgF5rKyQepzeFz28YxLcHMSmpunD2BzmOPrZr9ODGzvMSautCJ+vgyBvn
	 5dFRNlAsNBy9vXs69lt1bt7xpy3CRUCo5IOxKaFLISOyUIW2HQwXFGsqjT3Zr4l5l7
	 hPMWkX+bX1Vqa+cvLZ/wNKrCZeWN06GAe3D4bkHjNCajAywnufCgqFk8G/JKeMnkvB
	 Bf6MvlnlxwuVw==
Received: by wens.tw (Postfix, from userid 1000)
	id 811E45FF56; Tue, 21 Oct 2025 01:11:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] [EXAMPLE] arm64: dts: allwinner: a527-cubie-a5e: Enable I2S and SPDIF output
Date: Tue, 21 Oct 2025 01:10:57 +0800
Message-ID: <20251020171059.2786070-12-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020171059.2786070-1-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_101142_228611_0FB1D1F1 
X-CRM114-Status: GOOD (  11.79  )
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

This is an example change.

The Radxa Cubie A5E exposes I2S2 and SPDIF on the 40-pin header. Enable
both.

In this example, I2S2 is connected to adafruit speaker bonnet, which
sports a pair of MAX98357A for speaker amplication. SPDIF is connected
to a SPDIF interface card for PCs, which has both coaxial and optical
outputs. The output was connected via optical cable to a dumb SPDIF to
analog audio converter.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index bfdf1728cd14..828d101d28e8 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -64,6 +64,46 @@ reg_usb_vbus: vbus {
 		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>;	/* PL8 */
 		enable-active-high;
 	};
+
+	codec: audio-codec {
+		compatible = "maxim,max98360a";
+		#sound-dai-cells = <0>;
+	};
+
+	sound-i2s {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "I2S";
+		simple-audio-card,format = "left_j";
+		simple-audio-card,bitclock-master = <&dailink_cpu>;
+		simple-audio-card,frame-master = <&dailink_cpu>;
+		simple-audio-card,mclk-fs = <128>;
+
+		dailink_cpu: simple-audio-card,cpu {
+			sound-dai = <&i2s2>;
+		};
+
+		dailink0_master: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+
+	sound-spdif {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "spdif-out";
+
+		simple-audio-card,cpu {
+			sound-dai = <&spdif>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_out>;
+		};
+	};
+
+	spdif_out: spdif-out {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+	};
 };
 
 &ehci0 {
@@ -101,6 +141,12 @@ &gpu {
 	status = "okay";
 };
 
+&i2s2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s2_pi_pins>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii0_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -344,6 +390,12 @@ &r_pio {
 	vcc-pm-supply = <&reg_aldo3>;
 };
 
+&spdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spdif_out_pi_pin>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.47.3


