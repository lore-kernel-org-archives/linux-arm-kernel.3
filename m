Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF608CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 07:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFWWNPB0U+yN5g9VWpUZhtMoCfwQ9SvKveW352qxGWc=; b=rUUrYuWIs8MXW2Fc3m26WVFrrR
	z36U6djindkOlqD7pTb/7pR+4W/4+tnIoE8tjr6r+0OL6UJRBiLPWyDTbUALsChqXzfZcj3bjm1Q0
	7tjIwnrTqY+2MwJpF38o3941Q4ZcM3GO0YQGFUEmjc5kPNk8PfY5n0eD+VjW+2stkeUfuXBfMHIYQ
	4lyLLnX3DdFj6/yjgaEyTUk4+dK0uVZ4FLtQ0Jdmb6rNzJ1CIfkitsWpjAeg3SEO/KmSeHNn+osLu
	XHMJ2mbaS6Zsy3I42+IXii/mcJcPY79BJ86f0LRuTQ+T95z0GNoQwVeGv8YvxK0s7IKU6LpNIWJD0
	uPHi4TVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMl1-00000003bwC-3nqB;
	Thu, 30 Oct 2025 07:07:39 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMkn-00000003brc-2gS2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 07:07:28 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251030070719epoutp01e54e9d6e487025cafb0220f0ed7faa57~zMxO_AJnl2255222552epoutp01D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 07:07:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251030070719epoutp01e54e9d6e487025cafb0220f0ed7faa57~zMxO_AJnl2255222552epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761808039;
	bh=nFWWNPB0U+yN5g9VWpUZhtMoCfwQ9SvKveW352qxGWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pK0D2X4B/nenPVOPgQ5QGu9gCmekbyCnvTLWCuKPrREYRRlaPNeOOuKNkAye3lc8R
	 Z1yRHatbtlkap0CUTkArIGU+syGrQCB3GinOQTvqVgakroe9O5+pGd+sbMRk5rJwe9
	 8eQtEEPBYhb+edjfguLYn6NCCknLTiibQ4IxVwRU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251030070718epcas2p430fa46a8b7a2db2771d8ea580052c941~zMxOVG4IM1433014330epcas2p4t;
	Thu, 30 Oct 2025 07:07:18 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.206]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cxwCp0cLwz2SSKZ; Thu, 30 Oct
	2025 07:07:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20251030070717epcas2p3009a167a6d881be5d3b88f960dfd177d~zMxNAGkN02559825598epcas2p3_;
	Thu, 30 Oct 2025 07:07:17 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251030070716epsmtip27abf5e8dff06fa243767ab8cd5be86dd~zMxM5lO2B1278412784epsmtip2c;
	Thu, 30 Oct 2025 07:07:16 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Henrik Grimler
	<henrik@grimler.se>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 RESEND 3/3] arm64: dts: exynosautov920: Add multiple
 sensors
Date: Thu, 30 Oct 2025 16:07:12 +0900
Message-ID: <20251030070712.248065-4-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030070712.248065-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251030070717epcas2p3009a167a6d881be5d3b88f960dfd177d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251030070717epcas2p3009a167a6d881be5d3b88f960dfd177d
References: <20251030070712.248065-1-shin.son@samsung.com>
	<CGME20251030070717epcas2p3009a167a6d881be5d3b88f960dfd177d@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_000726_096139_84A44FEA 
X-CRM114-Status: GOOD (  20.19  )
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

The exynosautov920-tmu node uses the misc clock as its source.

This TMU binding defines multiple thermal zones with a critical trip point
at 125 degrees:

tmu_top : cpus0-0, cpus0-1, cpus0-2, cpus0-3,
          cpus1-0, cpus1-1, cpus1-2, cpus1-3,
	  cpus1-4, cpus1-5, cpus1-6, cpus1-7

tmu_sub0: cpus0-4, cpus0-5, cpus0-6, cpus0-7,
          cpus2-0, cpus2-1, cpus2-2, cpus2-3

tmu_sub1: gpu0, gpu1, gpu2, gpu3, npu0, npu1

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-tmu.dtsi   | 377 ++++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  31 ++
 2 files changed, 408 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi
new file mode 100644
index 000000000000..641d142e0eeb
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi
@@ -0,0 +1,377 @@
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
+		cpus0-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 9>;
+
+			trips {
+				cpus0_0_critical: cpus0-0-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus0-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 10>;
+
+			trips {
+				cpus0_1_critical: cpus0-1-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus0-2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 11>;
+
+			trips {
+				cpus0_2_critical: cpus0-2-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus0-3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 12>;
+
+			trips {
+				cpus0_3_critical: cpus0-3-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus0-4-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub0 7>;
+
+			trips {
+				cpus0_4_critical: cpus0-4-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus0-5-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub0 8>;
+
+			trips {
+				cpus0_5_critical: cpus0-5-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus0-6-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub0 9>;
+
+			trips {
+				cpus0_6_critical: cpus0-6-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus0-7-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub0 10>;
+
+			trips {
+				cpus0_7_critical: cpus0-7-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus1-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 1>;
+
+			trips {
+				cpus1_0_critical: cpus1-0-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus1-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 2>;
+
+			trips {
+				cpus1_1_critical: cpus1-1-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus1-2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 3>;
+
+			trips {
+				cpus1_2_critical: cpus1-2-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus1-3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 4>;
+
+			trips {
+				cpus1_3_critical: cpus1-3-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus1-4-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 5>;
+
+			trips {
+				cpus1_4_critical: cpus1-4-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus1-5-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 6>;
+
+			trips {
+				cpus1_5_critical: cpus1-5-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus1-6-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 7>;
+
+			trips {
+				cpus1_6_critical: cpus1-6-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus1-7-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 8>;
+
+			trips {
+				cpus1_7_critical: cpus1-7-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus2-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub0 3>;
+
+			trips {
+				cpus2_0_critical: cpus2-0-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus2-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub0 4>;
+
+			trips {
+				cpus2_1_critical: cpus2-1-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus2-2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub0 5>;
+
+			trips {
+				cpus2_2_critical: cpus2-2-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpus2-3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub0 6>;
+
+			trips {
+				cpus2_3_critical: cpus2-3-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		gpu0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub1 1>;
+
+			trips {
+				gpu0_critical: gpu0-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		gpu1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub1 2>;
+
+			trips {
+				gpu1_critical: gpu1-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		gpu2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub1 3>;
+
+			trips {
+				gpu2_critical: gpu2-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		gpu3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub1 4>;
+
+			trips {
+				gpu3_critical: gpu3-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		npu0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub1 6>;
+
+			trips {
+				npu0_critical: npu0-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		npu1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_sub1 7>;
+
+			trips {
+				npu1_critical: npu1-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..884fe2466691 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -330,6 +330,36 @@ watchdog_cl1: watchdog@10070000 {
 			samsung,cluster-index = <1>;
 		};
 
+		tmu_top: tmu@100a0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100a0000 0x1000>;
+			interrupts = <GIC_SPI 951 IRQ_TYPE_LEVEL_HIGH>;
+			#thermal-sensor-cells = <1>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			samsung,sensors = <12>;
+		};
+
+		tmu_sub0: tmu@100b0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100b0000 0x1000>;
+			interrupts = <GIC_SPI 950 IRQ_TYPE_LEVEL_HIGH>;
+			#thermal-sensor-cells = <1>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			samsung,sensors = <10>;
+		};
+
+		tmu_sub1: tmu@100c0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100c0000 0x1000>;
+			interrupts = <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>;
+			#thermal-sensor-cells = <1>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			samsung,sensors = <7>;
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


