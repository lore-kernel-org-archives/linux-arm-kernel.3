Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302F7CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+Fu8jtIFdDL9X11DiMmje0ZFmxUN0eNDjxxgKPmz48=; b=faC2C6pF/TBJX8zr229cUEHwB7
	jUE9DdETh4U8Kk5/+hXtzFKewlQD/9xj3CMnaxJf4JOUtF97xoWQ9ZAiyT/X5YbCFfavMBDsqyJ9O
	vCrMMNCutEc2X7gtJNElmTgX4VcDJMjGqBRZv0c84WZjpPJMOEsUeTEGVbF2UunkRty0TVlWRxwsX
	Ty9IS0HS3PSq9IFJFTyhAJ2Z4n4L+ixR9Qqpf70VKzW4p1sIZandtk0XsTCmsc/b2FV9pojvT+2TU
	tZsANEMDHSerMF/PjAl60ebku0DhotqNd9U7MhNYTD35gzJYqP4UG/rlXE8iPEKqk/OC5VZkhTQfN
	LzCCXuRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmh-0000000Dx5M-0Hrr;
	Mon, 27 Oct 2025 12:57:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmb-0000000Dx01-45Ip
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 12:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=P+Fu8jtIFdDL9X11DiMmje0ZFmxUN0eNDjxxgKPmz48=; b=qZX7Fjuml2kVyCjaVfI5rc7myr
	azVAUTorbZoWr8U1QaaxVH7qaT7ljfakqNi78ZuKA53/u1lyL+KyZWYL1fJalRyXEjOJbmZFpWWWp
	iF1PMVUkmeKlAP06dXXYEhHhSA0HGbeVZjgekLRyDVzro5XEb0mj7HY3Qa5oEmVJx+GNAZbPaPaiU
	s+6D7vRUJArvtddx6LfSn7vuuUgoEtMmlslJl8iJXbSzR8rCM6Q9jbYAM3pfv+bsUlgf74KF4lAvU
	1A/jKfswzMXT9ARmDLXr6XOoSLmaUguE91BIJ2BhcvT50F87DVZyz/hoL80fq5wbqPeigMvZX/Vo2
	oqYZzmfw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLuo-00000002736-3DQi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:01:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AF7645A0F;
	Mon, 27 Oct 2025 12:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF72CC116B1;
	Mon, 27 Oct 2025 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569821;
	bh=gr1lBgtAFiXlQWjgkAnVsdgPcHRamw/CNfsD0rtnh5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FEiCOsgUv6Y+W2ZHZvg2uRCOCghvJLo7bsCubi8TrN7K/i8O7GiaxTwHnKXF2ZFwL
	 9KsRERyjTwn2iB2n9F73IVNzvVLSmuKM41PM/ej/mrYyzwnx0FmVNQCqhJ4HoZQr4L
	 pgp1Sm27R7H4cqk6/AZx1lL7JdlwiRSVOwYsXejHua/f3JIuUN5UXHcX81LKy10ReH
	 Wx2qdMP7d0ybfH25AkiV57SVcuzt/YHuzMdnc1mHDvpBkecvc2ld0gf4ykSVsCO4sK
	 ZASilZoS8x7z9Ta6RhTQp4WxEsi5dCt8rFuOWbaUxBgWsxb6dwp/J0Y3idVUndU+WG
	 Up3tiKzh00n+A==
Received: by wens.tw (Postfix, from userid 1000)
	id A234B5FF76; Mon, 27 Oct 2025 20:56:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 07/10] arm64: dts: allwinner: a523: Add device nodes for I2S controllers
Date: Mon, 27 Oct 2025 20:56:48 +0800
Message-ID: <20251027125655.793277-8-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_120135_314739_73C8F7A5 
X-CRM114-Status: UNSURE (   9.75  )
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

The A523 family of SoCs have four I2S controllers capable of both
playback and capture. The user manual also implies that I2S2 also
outputs to the eDP interface controller.

Add device nodes for all of them.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 33f991dbd00b..eea9ce83783c 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -818,6 +818,62 @@ mcu_ccu: clock-controller@7102000 {
 			#reset-cells = <1>;
 		};
 
+		i2s0: i2s@7112000 {
+			compatible = "allwinner,sun55i-a523-i2s",
+				     "allwinner,sun50i-r329-i2s";
+			reg = <0x07112000 0x1000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mcu_ccu CLK_BUS_MCU_I2S0>, <&mcu_ccu CLK_MCU_I2S0>;
+			clock-names = "apb", "mod";
+			resets = <&mcu_ccu RST_BUS_MCU_I2S0>;
+			dmas = <&mcu_dma 3>, <&mcu_dma 3>;
+			dma-names = "rx", "tx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		i2s1: i2s@7113000 {
+			compatible = "allwinner,sun55i-a523-i2s",
+				     "allwinner,sun50i-r329-i2s";
+			reg = <0x07113000 0x1000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mcu_ccu CLK_BUS_MCU_I2S1>, <&mcu_ccu CLK_MCU_I2S1>;
+			clock-names = "apb", "mod";
+			resets = <&mcu_ccu RST_BUS_MCU_I2S1>;
+			dmas = <&mcu_dma 4>, <&mcu_dma 4>;
+			dma-names = "rx", "tx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		i2s2: i2s@7114000 {
+			compatible = "allwinner,sun55i-a523-i2s",
+				     "allwinner,sun50i-r329-i2s";
+			reg = <0x07114000 0x1000>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mcu_ccu CLK_BUS_MCU_I2S2>, <&mcu_ccu CLK_MCU_I2S2>;
+			clock-names = "apb", "mod";
+			resets = <&mcu_ccu RST_BUS_MCU_I2S2>;
+			dmas = <&mcu_dma 5>, <&mcu_dma 5>;
+			dma-names = "rx", "tx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		i2s3: i2s@7115000 {
+			compatible = "allwinner,sun55i-a523-i2s",
+				     "allwinner,sun50i-r329-i2s";
+			reg = <0x07115000 0x1000>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mcu_ccu CLK_BUS_MCU_I2S3>, <&mcu_ccu CLK_MCU_I2S3>;
+			clock-names = "apb", "mod";
+			resets = <&mcu_ccu RST_BUS_MCU_I2S3>;
+			dmas = <&mcu_dma 6>, <&mcu_dma 6>;
+			dma-names = "rx", "tx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		spdif: spdif@7116000 {
 			compatible = "allwinner,sun55i-a523-spdif";
 			reg = <0x07116000 0x400>;
-- 
2.47.3


