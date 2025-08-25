Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A1CCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rYafmcxZpihj0V9KbWDaQSBDKY7QVxXAz73yYLOt/o=; b=ffkhVdZe2iqqdA/eE42q9lUA0G
	hLLNso745s8wDVEMUbayuSNov2iZSm1JOKKD54mJmfZ0ve9aTYdLUObChM045E0xuN6AWVmIMpMRK
	0BQXudfpmrdrJSFt9CuCaEQv1TdhlprNn4+anw7U/DInMb37gPrYTbAZ04J1lOn4qQCojNdF8ZmYB
	tyb/N+Tc1CcKlK7NI2BzUD0/EaRnCOadsYkp11ljZwL50o1DtNPm6Mw88+1BAMCkWVEdCDUr8XgV0
	2DvDWPWspuNYLGBn9eO0u2we6oNLty+OZ2+byAgjeIN8/wP4p1tHeAFJHUFNUHF5+KYs2jssMomif
	eXR627PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRE8-000000076nN-0CNQ;
	Mon, 25 Aug 2025 07:02:48 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR1S-000000074Hb-28FY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 06:49:47 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825064935epoutp0498444bc2ebd0e2843b6370b01d788cdc~e7861Rewi2677126771epoutp04X
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 06:49:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825064935epoutp0498444bc2ebd0e2843b6370b01d788cdc~e7861Rewi2677126771epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756104575;
	bh=4rYafmcxZpihj0V9KbWDaQSBDKY7QVxXAz73yYLOt/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rd44spCkNmgIEgk1nsAcOoQHdxwLJXZ577xFPTRvJuPMwYB0m4vdvo92IRVu3dOZm
	 IpCbAPYRUjktwWrq6gSXnI5DZO77PfUMnC465Ue8lJS+1Jrv1dJeEVpnQG0GwE4k1g
	 D7IC46ff/nTRCYCnDQW2sch3TYbdt5503/8SXTlk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250825064935epcas2p151228bc8741eba946fd87ce0eef9e97a~e786SsPxD0726907269epcas2p1E;
	Mon, 25 Aug 2025 06:49:35 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.97]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c9Lxp4HQGz2SSKZ; Mon, 25 Aug
	2025 06:49:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250825064933epcas2p40a7c491366097f90add675bc36822ef9~e785EdrSo2497024970epcas2p4r;
	Mon, 25 Aug 2025 06:49:33 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825064933epsmtip1b479a02478b7997e16d4df8e6bf8e5de~e784-8SKK1035610356epsmtip1q;
	Mon, 25 Aug 2025 06:49:33 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: exynosautov920: Add tmu hardware binding
Date: Mon, 25 Aug 2025 15:49:29 +0900
Message-ID: <20250825064929.188101-4-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825064929.188101-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250825064933epcas2p40a7c491366097f90add675bc36822ef9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825064933epcas2p40a7c491366097f90add675bc36822ef9
References: <20250825064929.188101-1-shin.son@samsung.com>
	<CGME20250825064933epcas2p40a7c491366097f90add675bc36822ef9@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_234944_017574_E8D320A5 
X-CRM114-Status: GOOD (  18.81  )
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

Create a new exynosautov920-tmu.dtsi describing new TMU hardware
and include it from exynosautov920.dtsi.

The exynosautov920-tmu node uses the misc clock as its source
and exposes two new DT properties:

- tmu-name: identifies the TMU variant for sensor skipping
- sensor-index-ranges: defines valid sensor index ranges for the bitmap

This TMU binding defines six thermal zones with a critical trip point
at 125 degrees:

tmu_top : cpucl0-left, cpucl1
tmu_sub0: cpucl0-right, cpucl2
tmu_sub1: g3d, npu

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-tmu.dtsi   | 92 +++++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 34 +++++++
 2 files changed, 126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi
new file mode 100644
index 000000000000..fa88e9bcdfec
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's ExynosAuto920 TMU configurations device tree source
+ *
+ * Copyright (c) 2020 Samsung Electronics Co., Ltd.
+ *
+ * Samsung's ExynosAuto920 SoC TMU(Thermal Managemenut Unit) are listed as
+ * device tree nodes in this file.
+ */
+
+/ {
+	thermal-zones {
+		cpucl0left-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_top 0>;
+
+			trips {
+				cpucl0_0_critical: cpucl0-0-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+		cpucl0right-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_sub0 0>;
+
+			trips {
+				cpucl0_1_critical: cpucl0-1-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+		cpucl1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_top 1>;
+
+			trips {
+				cpucl1_critical: cpucl1-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+		cpucl2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_sub0 1>;
+
+			trips {
+				cpucl2_critical: cpucl2-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+		g3d-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_sub1 0>;
+
+			trips {
+				g3d_critical: g3d-critical {
+					temperature = <125000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+		npu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_sub1 1>;
+
+			trips {
+				npu_critical: npu-critical {
+					temperature = <125000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..a4ff941f8e43 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -330,6 +330,39 @@ watchdog_cl1: watchdog@10070000 {
 			samsung,cluster-index = <1>;
 		};
 
+		tmuctrl_top: tmutop-thermal@100a0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100A0000 0x1000>;
+			interrupts = <GIC_SPI 951 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			#thermal-sensor-cells = <1>;
+			tmu-name = "TMU_TOP";
+			sensor-index-ranges = <1 12>;
+		};
+
+		tmuctrl_sub0: tmusub0-thermal@100b0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100B0000 0x1000>;
+			interrupts = <GIC_SPI 950 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			#thermal-sensor-cells = <1>;
+			tmu-name = "TMU_SUB0";
+			sensor-index-ranges = <3 10>;
+		};
+
+		tmuctrl_sub1: tmusub1-thermal@100c0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100C0000 0x1000>;
+			interrupts = <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			#thermal-sensor-cells = <1>;
+			tmu-name = "TMU_SUB1";
+			sensor-index-ranges = <1 7>;
+		};
+
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
@@ -1507,3 +1540,4 @@ timer {
 };
 
 #include "exynosautov920-pinctrl.dtsi"
+#include "exynosautov920-tmu.dtsi"
-- 
2.50.1


