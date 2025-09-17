Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99F8CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxOhlbK8ICcydhIlDZVWYfe0fihW305v0TiO0t+kvAc=; b=aC2EsJ3xXEETA7v/AUw+28M2/q
	5MVzihJhKBlKuignO4kUUAGt45jVxd4GZ9pl0CxRMrfJeVvysVIfR4/1Uu2K+rRQoIQvqn3+Xlgt/
	Tf0R6yQ+cWcr0TmVy5I+Du+r6xL4Iaf6khclPo90LG986XdIcgWcnS42QCOCBpjrLJy9Vjc3f22Fb
	tyrD+qrQ3U5bmo0/KCpWT6R3HWqRc2VNnoJE0UajZZiNVoSAG/gsPU8OA87RNrExoUaK7U9WD3oAU
	/nWdkW41Qu60ig6QqxmTpwZpffXpuPpUrdbZYpNxlQOYYzH8ix0EGzAqVP7p31dnIA9wPnMJPiZcA
	Al38CJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynsX-0000000AhUl-2lqU;
	Wed, 17 Sep 2025 08:51:05 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynsU-0000000AhQz-2nZd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:51:04 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250917085058epoutp0443a02bde3e2cccf3f824a5b36f2e3bab~mBcdhs1U40315703157epoutp04I
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:50:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250917085058epoutp0443a02bde3e2cccf3f824a5b36f2e3bab~mBcdhs1U40315703157epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758099058;
	bh=ZxOhlbK8ICcydhIlDZVWYfe0fihW305v0TiO0t+kvAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WJkxqMh6Krjz/03T2upycOWw3ekoAVceI9zgBbIXmljVexRj1KdViGkU4m1jZDag5
	 uPEkSJR8Du5wHKPZIx7cn3KvlhMFNuzeSztgkNIafgFKL6Qi55+xswUVcNn11WhYfH
	 pzZzSs2qaU3usgl8UdiwLvcQmF68E77A6BhwTyIU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250917085057epcas5p308d4f45d547411642dfef2587e150140~mBcc7T9-F0100501005epcas5p3i;
	Wed, 17 Sep 2025 08:50:57 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cRXYD5ZHkz2SSKh; Wed, 17 Sep
	2025 08:50:56 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250917085055epcas5p18e688864c8e9fd788f8073510ae0d0b3~mBca209kD0062500625epcas5p14;
	Wed, 17 Sep 2025 08:50:55 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250917085050epsmtip2c958afcf2fe3877c052fcc208b38fa0c~mBcWiN0GB2771327713epsmtip2v;
	Wed, 17 Sep 2025 08:50:50 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com,
	sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: [PATCH 7/7] arm64: dts: axis: Add ARTPEC-9 Alfred board support
Date: Wed, 17 Sep 2025 14:20:04 +0530
Message-ID: <20250917085005.89819-8-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250917085005.89819-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917085055epcas5p18e688864c8e9fd788f8073510ae0d0b3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917085055epcas5p18e688864c8e9fd788f8073510ae0d0b3
References: <20250917085005.89819-1-ravi.patel@samsung.com>
	<CGME20250917085055epcas5p18e688864c8e9fd788f8073510ae0d0b3@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_015103_020607_E200C4B6 
X-CRM114-Status: GOOD (  16.39  )
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


