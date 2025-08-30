Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F87CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ETs++rvv0d+QxtNXXhavKJaMNY0ry6D46+IzU1hVw8=; b=loOPCZ3RzuKN2yyoBe6mW7TeHa
	urrO+zRv53yoHVKQ3bYqpYxlvJi+QEKrINcPDvh241j6iCjBVnL0tTxDJdLLOgF+Q9lWeHLwusryb
	SYMVYHTAzbw2Fwz62fNX3OQ2WD/06WKjN3nvRZmOhBWdOt5Xe433lt9NSSLAsAhGj0i9rvoB3UQYl
	GgERHk0gQan/ZDgz8P+0Ibg9GxU23jqf3hjjL0o3zdL4lkL2GCGENOnTDvQv2oYqdrPLBVgOX4jny
	IK1IMe3RBhFbtsGcrU67MXzUx6ucfuswMtic/q5GpvWvvIPZCawBBxV+90Bkb9A3f1rRYzEzbPnhJ
	jc2VTGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPdN-00000008Ftl-08MW;
	Sat, 30 Aug 2025 17:45:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP4s-00000008CVq-2JRX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 303D7448DA;
	Sat, 30 Aug 2025 17:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84C8C4CEF8;
	Sat, 30 Aug 2025 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756573762;
	bh=X9UravRZTkYO/S1t31DyRCOSep0v8TZbjoIrBK1EKNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iwFLUfxlJFRuEDCHufRML+UIZZxkrkNLuW9Jorcc8xsw9v1WoDX0KJAJ8NHXNMfk+
	 yh/ifCmuennI9zj0KjV/5voVETLt/qc+ZxPVJ5xAZ2vSPBfijwsMjXdF8p9agJMWpD
	 k2nwhPQEotMppPXpGxzPrFxKQmaEoTvdbZq6DFEFbQIwvI7PIpEshjdgXOsI7CHavy
	 YUhA2F4y1pxYWGxRhGNu8u5b5aSp/NhW8ib3aRF/FZDXZHJrel6uweKlQtTXbsJJmf
	 avfDBFenDBvxkH7gnmYNXvNWFt5CmAb3+SLuz8cv2PTAe/B/3noF205eW3jxwRoJuz
	 KlphCMUjLomaA==
Received: by wens.tw (Postfix, from userid 1000)
	id 78ADF5FF44; Sun, 31 Aug 2025 01:09:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] arm64: dts: allwinner: a523: Add NPU device node
Date: Sun, 31 Aug 2025 01:09:01 +0800
Message-Id: <20250830170901.1996227-9-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830170901.1996227-1-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100922_625352_CB623EF9 
X-CRM114-Status: GOOD (  12.11  )
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

From: Chen-Yu Tsai <wens@csie.org>

The Allwinner T527 SoC has an NPU built in. Based on identifiers found
in the BSP, it is a Vivante IP block. After enabling it, the etnaviv
driver reports it as a GC9000 revision 9003.

The standard bindings are used as everything matches directly. There is
no option for DVFS at the moment. That might require some more work,
perhaps on the efuse side to map speed bins.

It is unclear whether the NPU block is fused out at the hardware level
or the BSP limits use of the NPU through software, as the author only
has boards with the T527.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index b6e82d53af54..1ab5b87ec78e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -850,6 +850,18 @@ mcu_ccu: clock-controller@7102000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
+
+		npu: npu@7122000 {
+			compatible = "vivante,gc";
+			reg = <0x07122000 0x1000>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mcu_ccu CLK_BUS_MCU_NPU_ACLK>,
+				 <&ccu CLK_NPU>,
+				 <&mcu_ccu CLK_BUS_MCU_NPU_HCLK>;
+			clock-names = "bus", "core", "reg";
+			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
+			power-domains = <&ppu PD_NPU>;
+		};
 	};
 
 	thermal-zones {
-- 
2.39.5


