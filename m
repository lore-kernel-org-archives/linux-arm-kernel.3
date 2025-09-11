Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1542FCAC594
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kAU7iB6SwW6JrZPy9n03Wskti5PCmMFHL41LxdaEHU=; b=PTa0jISh5zVQQoWYBISTY9pDUH
	PdQA1pup6P0WZ/ah6TSrfuP7GazUhJ7CSjDsQBaXMGZYasrepyuG+pfzVrTiusZAjinwoDEJaLfER
	7J4+xpSYkXqltLld4OTuigEICUHLe9bB74rjltdr+QDj41vuRCOu3W1oy+2JdRXW1xm7EepJEozDC
	b5L4RdnrmF2uwUUYcX5gekt2dDbWRb+nlmQlLmFrqk3MnZEACUCyU7mk6f65+niYu+W34QbqwfI5s
	EydicvMAzNY/jvYyHNdOg8l2cQ/PGQuSyIAMJqOFqt0BeL4an/747k502OVEQb/NGS4Icqa+9KUaN
	egsWzTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlOD-00000004XpS-0W7N;
	Thu, 11 Sep 2025 17:47:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlO8-00000004XlE-2tA1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 17:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66DE645045;
	Thu, 11 Sep 2025 17:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE50C113CF;
	Thu, 11 Sep 2025 17:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757612836;
	bh=WzFwdnb/weY1BfCYsn8nBeYLnmC5YscOBh1kWZFapkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aAixnrkK6ogY1UdA6Cjp6ThQtGasFtjjg7sxdNkWSd9Bzoi7Ywv8jyy+YKxjk4PZB
	 NCra51SZcYII02kG/CZqAumdBg5f8gzKlrLFZ+g8aHT3ev2763V+Mn3tIenDlABlBd
	 j+st1A3dxxpzf+Pm+B8VqvzhqTEzS2LfbIKZzcxFnbY3qlWWj8tEhOtjFrC8SG9+PY
	 QjlWs6lqRm/8I8cx5OkqZRttMYErGjuZiI3HEIuE+BdJ1oit+wx12NgkEK1TKFAm/C
	 H0QCpV/ocb0h6IfOOqjHJUX4B4/a2KF9u/C6HMJOOaBYaPUESczovx+Pjm0v4qVJcU
	 Hjqm/FjFSpftQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 112515FEEE; Fri, 12 Sep 2025 01:47:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: allwinner: a523: Add NPU device node
Date: Fri, 12 Sep 2025 01:47:10 +0800
Message-Id: <20250911174710.3149589-8-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911174710.3149589-1-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_104716_749438_BCE7379B 
X-CRM114-Status: GOOD (  11.99  )
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

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index f93376372aba..9676caf9bd4e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -852,6 +852,18 @@ mcu_ccu: clock-controller@7102000 {
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


