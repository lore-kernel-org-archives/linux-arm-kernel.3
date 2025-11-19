Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2D6CF2591
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxOhlbK8ICcydhIlDZVWYfe0fihW305v0TiO0t+kvAc=; b=ujAey+lMiRx0TntvBdrB7gBuAJ
	t26Vr2P18KY512lOdBqofpyrucDTOx4+NGvHRzLUsFP8lI2ErQPT/jvjr/2g+is2Fpwn5OQteqohM
	pLIU0XsrWMbtaSDI1I2NRYuRvtUiwrgfguUeOmC6K6S1lWuG9hEOfqHqt39PjPUsKtvrlUKgbrXCl
	6VmVyU1UU+C4Z0V0OOK+LLaFHdA28T2kXMi7oBSykpNzMUQ7I8BEyWY5RfiaJvbo2/Z/XzK3gVOt6
	yGZkuIBM6DUgPj5RBgcKS9ZSfR7AWpN28vJHSBmhSC898lUP8fZ+27LlCfz76l0NfoyWw6GOH/Aw3
	WvGVHtmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLi1k-00000003GIp-386j;
	Wed, 19 Nov 2025 13:15:16 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLi1i-00000003GGJ-06ey
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:15:15 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251119131508epoutp049793482fcce1bdeef9d3d2ca5a1ce134~5asGghnSL1932519325epoutp04U
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 13:15:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251119131508epoutp049793482fcce1bdeef9d3d2ca5a1ce134~5asGghnSL1932519325epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763558108;
	bh=ZxOhlbK8ICcydhIlDZVWYfe0fihW305v0TiO0t+kvAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r3Hw4bGq9rVeDGpHMr542TFeirVFdxVG4lxEmlrZnGGo9XlCJEpVzKm6DVCzBzfR3
	 u690njtj8TsrSs2h8pjK6jctrHkW7kqIn7xx1xRKi95ykLCqzMzkKMb+Ojy95I0csV
	 a+w9DjjNG1uHo0mPcCzHI/iApix/aIs0qat6lDzU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251119131507epcas5p3c6b5559066088f2a7140c81731e54c20~5asFG0li-1587715877epcas5p3I;
	Wed, 19 Nov 2025 13:15:07 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4dBMQy3G0yz3hhT4; Wed, 19 Nov
	2025 13:15:06 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131505epcas5p1c998a8c6bd202a1b29b9187b58da641b~5asDdDK5a0455404554epcas5p1z;
	Wed, 19 Nov 2025 13:15:05 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131454epsmtip1154975f2597c285eb9b1ea0740a54ce5~5ar5RjSq92736627366epsmtip1_;
	Wed, 19 Nov 2025 13:14:54 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com,
	kitak81.kim@samsung.com
Subject: [PATCH v2 3/3] arm64: dts: axis: Add ARTPEC-9 Alfred board support
Date: Wed, 19 Nov 2025 18:43:02 +0530
Message-Id: <20251119131302.79088-4-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251119131302.79088-1-ravi.patel@samsung.com>
X-CMS-MailID: 20251119131505epcas5p1c998a8c6bd202a1b29b9187b58da641b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119131505epcas5p1c998a8c6bd202a1b29b9187b58da641b
References: <20251119131302.79088-1-ravi.patel@samsung.com>
	<CGME20251119131505epcas5p1c998a8c6bd202a1b29b9187b58da641b@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_051514_377857_9C202CB8 
X-CRM114-Status: GOOD (  17.16  )
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

Add initial devcie tree for the ARTPEC-9 Alfred board.
The ARTPEC-9 Alfred is a board developed by Axis,
based on the Axis ARTPEC-9 SoC.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 arch/arm64/boot/dts/exynos/axis/Makefile      |  3 +-
 .../boot/dts/exynos/axis/artpec9-alfred.dts   | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts

diff --git a/arch/arm64/boot/dts/exynos/axis/Makefile b/arch/arm64/boot/dts/exynos/axis/Makefile
index ccf00de64016..da6a426516fc 100644
--- a/arch/arm64/boot/dts/exynos/axis/Makefile
+++ b/arch/arm64/boot/dts/exynos/axis/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 dtb-$(CONFIG_ARCH_ARTPEC) += \
-	artpec8-grizzly.dtb
+	artpec8-grizzly.dtb \
+	artpec9-alfred.dtb
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts b/arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
new file mode 100644
index 000000000000..5a779f1acf3b
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-9 Alfred board device tree source
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+/dts-v1/;
+#include "artpec9.dtsi"
+#include "artpec9-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "ARTPEC-9 alfred board";
+	compatible = "axis,artpec9-alfred", "axis,artpec9";
+
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		stdout-path = &serial_0;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&osc_clk {
+	clock-frequency = <50000000>;
+};
-- 
2.17.1


