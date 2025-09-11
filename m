Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F2BCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3+h4B7sGwN4OgDS23HcaIUG0g8P5eE3VkNr4/SlC6s=; b=adLkjT9tLsDmn5uARiJ2+4m0jt
	rNgtRZmOlyTah1e+M+qEDwarNI0QBvrVD09clIt60kN1k04vNiFQxV4tlrzwqI6Tqy/AAoeyagwEc
	aFNwms6dk3ihAokmcfIrpRRsXXTFWcU92Pm30Nw7tMSrxOnGNPBhjiwJ5pSD8OY5vWHWMreJkUFv8
	LNfZ9g1zpy2ka7VykwOFVUofK6z5XO3WxL17UmW8k8wcfcVTV+xwvr2crZkLdqDAOwLGzdrMdHMp3
	AiYvR8vrKM6T2mi3JgIzEyAavrOdCvwqjWZ3JmxVGs+dBhIgFAKRjvcmpKOppRjZgOg1ScqUUejxl
	KHZVcf/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlOC-00000004XoV-2BCV;
	Thu, 11 Sep 2025 17:47:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlO8-00000004XkR-1Tby
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 17:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BDD044FE0;
	Thu, 11 Sep 2025 17:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86C2C4CEFB;
	Thu, 11 Sep 2025 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757612835;
	bh=W8J/+Z9oRBNbp4TXxTxT486U9Z9A7OK+Xcu6z7nwH6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JJd45RozqFkAXe9m5Hfhk0n4JHTQvVyC/c+SxDDlCKZ6RCZCiEjddSRtjO0TmsKvZ
	 u172mTIPv0AfawQuFAXI77k94Eol/+WUutllAE5dcQZuddsPhizkBIynE/991UjTyt
	 lQ/BOQOR0cxz8qOLvmZ19G6WWca1+Gfgb2xjRDMp44ZDT7ML4su25Jj3HPpnc/3u5b
	 IdUQ4sS7Ywc591SNk+0Q9jjbghEXKsu5o1DxfowV3N6IsgmEIcDqGBS3LJpkeB45wp
	 Aztno5dew+S53sRlGe9A8OLj8ZNC8j37jwySePMSv80khSINbvTy5G/qtXzEAl1NKP
	 9yM+WdKM5vWIg==
Received: by wens.tw (Postfix, from userid 1000)
	id 09AEA5FF0D; Fri, 12 Sep 2025 01:47:12 +0800 (CST)
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
Subject: [PATCH v2 6/7] arm64: dts: allwinner: a523: Add MCU PRCM CCU node
Date: Fri, 12 Sep 2025 01:47:09 +0800
Message-Id: <20250911174710.3149589-7-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911174710.3149589-1-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_104716_426669_9307DC6B 
X-CRM114-Status: GOOD (  12.30  )
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

Add a device node for the third supported clock controller found in the
A523 / T527 SoCs. This controller has clocks and resets for the RISC-V
MCU, and others peripherals possibly meant to operate in low power mode
driven by the MCU, such as audio interfaces, an audio DSP, and the NPU.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v1:
- Enlarged MCU PRCM register range to 0x200
- Moved "r-ahb" clock to the end of the list and added "r-apb0" clock
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 79bd9ce08c7c..f93376372aba 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -4,8 +4,10 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/clock/sun55i-a523-ccu.h>
+#include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
 #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-ccu.h>
+#include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
 #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
 #include <dt-bindings/power/allwinner,sun55i-a523-pck-600.h>
@@ -825,6 +827,31 @@ rtc: rtc@7090000 {
 			clock-names = "bus", "hosc", "ahb";
 			#clock-cells = <1>;
 		};
+
+		mcu_ccu: clock-controller@7102000 {
+			compatible = "allwinner,sun55i-a523-mcu-ccu";
+			reg = <0x7102000 0x200>;
+			clocks = <&osc24M>,
+				 <&rtc CLK_OSC32K>,
+				 <&rtc CLK_IOSC>,
+				 <&ccu CLK_PLL_AUDIO0_4X>,
+				 <&ccu CLK_PLL_PERIPH0_300M>,
+				 <&ccu CLK_DSP>,
+				 <&ccu CLK_MBUS>,
+				 <&r_ccu CLK_R_AHB>,
+				 <&r_ccu CLK_R_APB0>;
+			clock-names = "hosc",
+				      "losc",
+				      "iosc",
+				      "pll-audio0-4x",
+				      "pll-periph0-300m",
+				      "dsp",
+				      "mbus",
+				      "r-ahb",
+				      "r-apb0";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
 	};
 
 	thermal-zones {
-- 
2.39.5


