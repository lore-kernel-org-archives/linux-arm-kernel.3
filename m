Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9789CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVtNwphhOTSG6CxvsLA7xGm2MoCyaN8pt4v4QB3Cjp4=; b=tA0vGQAMgoiZ2E7X3XM7wHgMfi
	aNtZEWykj9NHC/wgZQkbXIqgcMJbFY4dVURYEvf/fdscEbet7tC2OVxb9F8tS29C0WM0MbqjINanK
	/t7/mRPctyp8l9j7c7umya1WQdhL2BHxWINuriKLZRsZPt7wjVPnwKHTm0QW+c3xfm+qUXUw92+Ri
	sgpZ8IOVpJW1Yptxygdn3c+WTy0eADRJt3vF0WlHpQ6/OlrHnYbc48/Y56OsgS0FanJYn7bzg75P6
	bJYl2/1N8qIr78VNJPQ8cAZm4vZRWUgzwtWr0+3GNx12UWiGp8a/TRXJwEWwT0ajCdXE1/ZlUV1G9
	liXkJnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQG-0000000ER0V-3Ws6;
	Mon, 20 Oct 2025 17:11:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ8-0000000EQsa-1uQl
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 17:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QVtNwphhOTSG6CxvsLA7xGm2MoCyaN8pt4v4QB3Cjp4=; b=jWE6IbfWF1RMdkDTyBTNi0X1vj
	txRBfDDSJ3wLT7QsPWe7cQuyGEgCHjU4d3jnvfJjVoaNHtRCBYzqlMzfUYHlkGhQP3w2nMTZBherA
	2BJGia+tS/WEuwppPiPi6KRL3c2IxW/8JPilZ+7xmijXeEdc2NYrUPLqyzKAJs+OV8PjQ1KqCGp1E
	nnZjQV21mbUeORLp2kCPBGNOKiNUsWi/ss8EWCrjgVm993lLKYoYlwJZRRoKJJcJ2BfWv45/Bm2mC
	KxKzz7WqJ1RdDnD43RKjmKSskZFUgfQmxRBatR3VBFX8f1iFxrT7CxOXjoMRCDaFFn0BOp8c4CRL8
	M5G/gi/w==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsYP-0000000026d-0F2r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01C5E48DED;
	Mon, 20 Oct 2025 17:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3C4C2BC86;
	Mon, 20 Oct 2025 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980282;
	bh=DgO/6s23HKe1T0jTyCsYw+u/wOfS3lW2Y2hvszSMnJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QSEnPIohF37wfJmmGhUvzPGg+MuBGgtVAEMgt9nAUiAoBxrLCPMejbRItaDmliCiA
	 Q/7GkHNyA4K4CWwbFBBQYLDtY7jDfhUMI91zGcQTeDEMj0XA3B2L7+ul+lAcAVmw0i
	 jHgL8FolkHsEemQu+GNtvQGRtpgd0Vciwh4CAKFjoSwowjYpRbII7fxZgOTEry6WGd
	 ZX/qXI7nC/DUoU+oJjsHuCE1IRXAXZwQ+BlQF6W06Heny0x2fIqDuRojAOdlAXFNce
	 pJjf6FSzv6sRTA0uwKLeWbvPgh7AbqGYkEgQMDzncjxuo+meIf9DrNxFN5FOR9FZkb
	 6/Zc/BO4VKzbA==
Received: by wens.tw (Postfix, from userid 1000)
	id 7039A5FF03; Tue, 21 Oct 2025 01:11:18 +0800 (CST)
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
Subject: [PATCH 09/11] arm64: dts: allwinner: a523: Add device nodes for I2S controllers
Date: Tue, 21 Oct 2025 01:10:55 +0800
Message-ID: <20251020171059.2786070-10-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020171059.2786070-1-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_171613_484497_97BEA7F2 
X-CRM114-Status: GOOD (  10.68  )
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


