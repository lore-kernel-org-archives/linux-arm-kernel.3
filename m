Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ABCCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbAAN8lX9u7ye0RuKSQreAcwMv69aFgIjOskci50R+0=; b=NL9zB99/eCyEEdg/7I5hY3ibMU
	WNlJwrEoCrV90p1R0S5WEmdti7diB60B4D+vQ3eiQ5XX6tK52B1U6iUQLwwdC5p47rh+BGKBSRLWK
	yNuJA/Q7S40hPRtFEnrxme2QGaDMSbwLaxzropw6dTFA6uvTcjWvfB6wRDgv1aW72fZ9ISJXf6iPs
	k9qU5dQN0DFkPfk5RwaN6zF6bXaXq9Z/7xny23s7VnCDNH/Fe0doURDPnraI72MloSFmBtA0kNAoy
	jb+DOwS3qd6pJJD228dfcv/oLMilmvR+8z7L+cZBJDxanvJZ8pYhemXdwUx1n53grUrc0+DkBGGza
	K94UvFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utidM-00000005Sqd-1pJj;
	Wed, 03 Sep 2025 08:14:24 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti39-00000005A0d-3i7z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:37:02 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250903073656epoutp01821d65bc83e99cb02e6dab9f7ef89ed2~htZ0ruYlI2175921759epoutp01l
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 07:36:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250903073656epoutp01821d65bc83e99cb02e6dab9f7ef89ed2~htZ0ruYlI2175921759epoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756885016;
	bh=QbAAN8lX9u7ye0RuKSQreAcwMv69aFgIjOskci50R+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mMIes7F9rdAjB76H3SySa28SbU84vno/XKn5g+DiO1CeQE3QfqQu6KMHWbp+iytH7
	 o6zkvvHeEWr2hEi6bYjH32p8aAZzobyVtNEPH+++p3ZmmUWMWaJA9wPBQUI+5Hf8KV
	 zXq/36xE1NBtMOc5Mo07VhUCx7P9udcy9IRUjF7c=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250903073654epcas2p3edea5f547b3a2f2bda7364d5b527d50b~htZzVfbhn1134111341epcas2p3B;
	Wed,  3 Sep 2025 07:36:54 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cGvZG29Rjz3hhT8; Wed,  3 Sep
	2025 07:36:54 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250903073653epcas2p4bd8e50a6bfc1f5935ff8a01addf3d835~htZyMgjtT0220702207epcas2p4I;
	Wed,  3 Sep 2025 07:36:53 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250903073653epsmtip20b983213ee13ab91c02b90ee8dbe90c7~htZyIDTUh3057830578epsmtip2z;
	Wed,  3 Sep 2025 07:36:53 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: exynosautov920: Add tmu hardware binding
Date: Wed,  3 Sep 2025 16:36:34 +0900
Message-ID: <20250903073634.1898865-4-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903073634.1898865-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250903073653epcas2p4bd8e50a6bfc1f5935ff8a01addf3d835
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903073653epcas2p4bd8e50a6bfc1f5935ff8a01addf3d835
References: <20250903073634.1898865-1-shin.son@samsung.com>
	<CGME20250903073653epcas2p4bd8e50a6bfc1f5935ff8a01addf3d835@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_003700_344918_B380FE73 
X-CRM114-Status: GOOD (  21.35  )
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

- samsung,hw-sensor-indices: defines valid sensors for the bitmap

This TMU binding defines six thermal zones with a critical trip point
at 125 degrees:

tmu_top : cpucl0-0, cpucl1
tmu_sub0: cpucl0-1, cpucl2
tmu_sub1: g3d, npu

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-tmu.dtsi   | 97 +++++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 31 ++++++
 2 files changed, 128 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi
new file mode 100644
index 000000000000..eb1864e69bef
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi
@@ -0,0 +1,97 @@
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
+		cpucl0-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 0>;
+
+			trips {
+				cpucl0_0_critical: cpucl0-0-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpucl0-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub0 0>;
+
+			trips {
+				cpucl0_1_critical: cpucl0-1-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpucl1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 1>;
+
+			trips {
+				cpucl1_critical: cpucl1-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpucl2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub0 1>;
+
+			trips {
+				cpucl2_critical: cpucl2-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		g3d-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub1 0>;
+
+			trips {
+				g3d_critical: g3d-critical {
+					temperature = <125000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		npu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub1 1>;
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
index 0fdf2062930a..642f766d4106 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -330,6 +330,36 @@ watchdog_cl1: watchdog@10070000 {
 			samsung,cluster-index = <1>;
 		};
 
+		tmu_top: tmu@100a0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100A0000 0x1000>;
+			interrupts = <GIC_SPI 951 IRQ_TYPE_LEVEL_HIGH>;
+			#thermal-sensor-cells = <1>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			samsung,hw-sensor-indices = <1 2 3 4 5 6 7 8 9 10 11 12>;
+		};
+
+		tmu_sub0: tmu@100b0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100B0000 0x1000>;
+			interrupts = <GIC_SPI 950 IRQ_TYPE_LEVEL_HIGH>;
+			#thermal-sensor-cells = <1>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			samsung,hw-sensor-indices = <3 4 5 6 7 8 9 10>;
+		};
+
+		tmu_sub1: tmu@100c0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100C0000 0x1000>;
+			interrupts = <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>;
+			#thermal-sensor-cells = <1>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			samsung,hw-sensor-indices = <1 2 3 4 6 7>;
+		};
+
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
@@ -1507,3 +1537,4 @@ timer {
 };
 
 #include "exynosautov920-pinctrl.dtsi"
+#include "exynosautov920-tmu.dtsi"
-- 
2.50.1


