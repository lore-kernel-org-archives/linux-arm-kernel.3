Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C7CCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsNJV5XBOk2XFH4BrVvHECkoQB0m4MGPZolqolvJYUI=; b=LFAaSyIvM9T5eZLmtnDmvgNeF7
	U190BNX7NeWJAC6FRsuJKFxqimm1HYtDBA07jwF4xHZ/QoioYjvx91x7RvF23nUvekn5/gEFE/7xo
	6Ugd0/kjRD9HYxF2tTuA0dFqOEy8q/ffu4X0ScKW/Ktmi9G9uv5RS3HF0HxPjWSwv2hNOsaderWSk
	HYcTUpFAJ7rnbDFtV8xHJ7XaIb3B+6WhEBAdnrbr/HGJ3uMfzfDag6QD32t1WNIjt/Q1nbvLXGm2e
	5gDjmQw5CKwOg00fSLYq/oS9l0IoL3zNin6w6A6TLMVbjM5hNGi9jL+nSqf2WRI1G7R31LYTKx6kR
	2i2GvFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2Th-00000006TqA-2ARA;
	Fri, 29 Aug 2025 17:01:29 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzbO-00000005wIh-0H3X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 13:57:16 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250829135710epoutp031137f2021894c38460e2fd7ccad1f46e~gQXYWA30Q2671626716epoutp03w
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 13:57:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250829135710epoutp031137f2021894c38460e2fd7ccad1f46e~gQXYWA30Q2671626716epoutp03w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756475830;
	bh=zsNJV5XBOk2XFH4BrVvHECkoQB0m4MGPZolqolvJYUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QHymAVN5MXFJx36XUG0nkx5WaCqHP3o9HFl7EiZIbfgAVN9es+/q00yxYPY2HpzjA
	 ECK1Hl51NW2+S6I80Wx7AisXwVB3jOd68XSIlyISflyjfFwmH5+Eln6N6NFEFc0UT+
	 wruBwzN9SiNf8lxj87cWtNzNqV3JzrJualkreoaM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250829135709epcas5p23ba392fdce0bc20be5002ea41052af04~gQXX6jm0w1958719587epcas5p2e;
	Fri, 29 Aug 2025 13:57:09 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cD0FJ70Gjz6B9m5; Fri, 29 Aug
	2025 13:57:08 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250829135708epcas5p1b62d44f8a712b1c865fd82d26e89896f~gQXWnylAw0508305083epcas5p1J;
	Fri, 29 Aug 2025 13:57:08 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250829135706epsmtip25ca5f73ca9f7b0fde2d6f80c634f7b01~gQXVB7a6l1416014160epsmtip23;
	Fri, 29 Aug 2025 13:57:06 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, gost.dev@samsung.com, Varada Pavani
	<v.pavani@samsung.com>
Subject: [PATCH 2/2] arm64: dts: fsd: Fix Clock handle for WDT
Date: Fri, 29 Aug 2025 19:26:43 +0530
Message-ID: <20250829135643.105406-3-v.pavani@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250829135643.105406-1-v.pavani@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250829135708epcas5p1b62d44f8a712b1c865fd82d26e89896f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250829135708epcas5p1b62d44f8a712b1c865fd82d26e89896f
References: <20250829135643.105406-1-v.pavani@samsung.com>
	<CGME20250829135708epcas5p1b62d44f8a712b1c865fd82d26e89896f@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_065714_431009_EB46541A 
X-CRM114-Status: GOOD (  10.87  )
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

FSD SoC WDT has few changes when compared to exynos7 interms of Clocks,
PMU register bits for each cluster. So use "tesla,fsd-wdt"
compatibility for using correct driver data.
FSD supports 2 Clocks for WDT (PCLK and CLK).
- use fin_pll source Clock for all timer related calculations.
- use bus Clock (IMEM_WDT0_IPCLKPORT_PCLK) to gate/ungate the register
interface. Update both as per WDT UM.

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 690b4ed9c29b..ff031a630f10 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -624,30 +624,36 @@ pmu_system_controller: system-controller@11400000 {
 		};
 
 		watchdog_0: watchdog@100a0000 {
-			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
+			compatible = "tesla,fsd-wdt";
 			reg = <0x0 0x100a0000 0x0 0x100>;
 			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
-			clocks = <&fin_pll>;
-			clock-names = "watchdog";
+			clocks = <&clock_imem IMEM_WDT0_IPCLKPORT_PCLK>,
+				<&fin_pll>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,cluster-index = <0>;
 		};
 
 		watchdog_1: watchdog@100b0000 {
-			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
+			compatible = "tesla,fsd-wdt";
 			reg = <0x0 0x100b0000 0x0 0x100>;
 			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
-			clocks = <&fin_pll>;
-			clock-names = "watchdog";
+			clocks = <&clock_imem IMEM_WDT1_IPCLKPORT_PCLK>,
+				<&fin_pll>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,cluster-index = <1>;
 		};
 
 		watchdog_2: watchdog@100c0000 {
-			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
+			compatible = "tesla,fsd-wdt";
 			reg = <0x0 0x100c0000 0x0 0x100>;
 			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
-			clocks = <&fin_pll>;
-			clock-names = "watchdog";
+			clocks = <&clock_imem IMEM_WDT2_IPCLKPORT_PCLK>,
+				<&fin_pll>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,cluster-index = <2>;
 		};
 
 		pwm_0: pwm@14100000 {
-- 
2.49.0


